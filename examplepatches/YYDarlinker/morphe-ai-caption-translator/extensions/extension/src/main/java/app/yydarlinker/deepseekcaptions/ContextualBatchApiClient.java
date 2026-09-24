package app.yydarlinker.deepseekcaptions;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.SocketTimeoutException;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.TimeUnit;

/** Fixed-target contextual translator used by the experimental unit core. */
final class ContextualBatchApiClient {
    private static final int MAX_RESPONSE_BYTES = 2 * 1024 * 1024;
    private static final int MAX_OUTPUT_TOKENS = 3_072;
    private static final int CONNECT_TIMEOUT_MS = 3_200;
    private static final int READ_TIMEOUT_MS = 14_000;
    private static final long PRIORITY_TIMEOUT_MS = 10_000L;
    private static final long BACKGROUND_TIMEOUT_MS = 16_000L;

    static final String LANE_REALTIME = "unit_realtime";
    static final String LANE_BACKGROUND = "unit_background";

    private static final class Negotiation {
        final String identity,category;
        Negotiation(String identity,String category){this.identity=identity;this.category=category;}
    }
    private static volatile Negotiation negotiation;
    private static volatile String blockedIdentity="";
    private static volatile String blockedMessage="";
    private static String identity(DeepSeekConfig.Snapshot c) { return c.baseUrl+"\n"+c.model+"\n"+c.apiKey; }
    static synchronized void resetRejection() { blockedIdentity="";blockedMessage="";negotiation=null; }
    private ContextualBatchApiClient() {}

    static Result translate(
            List<TranslationUnitTimeline.Unit> targets,
            List<SourceAtomTimeline.Atom> atoms,
            List<String> contextBefore,
            List<String> contextAfter,
            DeepSeekConfig.Snapshot config,
            TargetLanguage targetLanguage,
            DeepSeekApiClient.RequestControl control,
            boolean priority
    ) throws Exception {
        return translate(targets,atoms,contextBefore,contextAfter,config,targetLanguage,control,priority,java.util.Collections.emptyMap());
    }
    static Result translate(List<TranslationUnitTimeline.Unit> targets,List<SourceAtomTimeline.Atom> atoms,
            List<String> contextBefore,List<String> contextAfter,DeepSeekConfig.Snapshot config,TargetLanguage targetLanguage,
            DeepSeekApiClient.RequestControl control,boolean priority,Map<String,String> repair) throws Exception {
        if (targets == null || targets.isEmpty()) return Result.EMPTY;
        if(identity(config).equals(blockedIdentity)) throw new PermanentException("configuration_blocked",blockedMessage,"");
        validateTargetIds(targets);
        if (!config.ready()) {
            throw new PermanentException("configuration", "AI 字幕翻译尚未启用或没有 API Key", "");
        }
        if (!priority) BackgroundPauseGovernor.awaitBackgroundPermit(control);

        long deadline = System.nanoTime() + TimeUnit.MILLISECONDS.toNanos(
                priority ? PRIORITY_TIMEOUT_MS : BACKGROUND_TIMEOUT_MS
        );
        ensureActive(deadline, control);
        TargetLanguage target = targetLanguage == null
                ? TargetLanguage.SIMPLIFIED_CHINESE
                : targetLanguage;

        JSONArray targetValues = new JSONArray();
        int sourceChars = 0;
        for (TranslationUnitTimeline.Unit unit : targets) {
            String text = ContextualCaptionTextPolicy.sourceForTranslation(
                    unit == null ? "" : unit.sourceText
            );
            sourceChars += text.length();
            JSONObject item=new JSONObject().put("id",unit.id).put("span_ms",unit.endMs-unit.startMs)
                    .put("source_text",text).put("boundary",unit.reason);
            JSONArray times=new JSONArray();
            for(int n=unit.fromAtom;n<=unit.toAtom;n++) times.put(new JSONArray().put(atoms.get(n).text).put(Math.round((atoms.get(n).endMs-unit.startMs)/100.0)));
            item.put("timed_words",times);
            int precise=0;for(int n=unit.fromAtom;n<=unit.toAtom;n++)if(atoms.get(n).precise)precise++;
            item.put("timing_precision",precise==unit.toAtom-unit.fromAtom+1?"native_word":precise==0?"cue_estimated":"mixed");
            JSONArray pauses=new JSONArray();
            for(int n=unit.fromAtom+1;n<=unit.toAtom;n++){long gap=atoms.get(n).startMs-atoms.get(n-1).endMs;if(gap>=250 && pauses.length()<8)pauses.put(new JSONArray().put(n-unit.fromAtom).put(gap));}
            if(pauses.length()>0)item.put("pauses_before_ms",pauses);
            JSONArray protectedTerms=ModelNameProtection.terms(atoms,unit);
            if(protectedTerms.length()>0)item.put("preserve_terms",protectedTerms);
            if(repair.containsKey(unit.id)) {
                item.put("previous_validation_error",repair.get(unit.id));
                item.put("repair_instruction","Return the same source coverage as named source/translation segments; split only at coherent source clauses, never flatten to one paragraph.");
            }
            targetValues.put(item);
        }
        JSONObject payload = new JSONObject()
                .put("target_language", target.code)
                .put("targets", targetValues);
        if (contextBefore != null && !contextBefore.isEmpty()) {
            payload.put("context_before", boundedContext(contextBefore,true));
        }
        if (contextAfter != null && !contextAfter.isEmpty()) {
            payload.put("context_after", boundedContext(contextAfter,false));
        }

        String systemPrompt = AnchoredCaptionPlan.PROMPT
                + " Target language: " + target.promptLabel() + ". User translation preferences: " + config.prompt;

        int outputTokens = Math.max(768, Math.min(
                MAX_OUTPUT_TOKENS,
                sourceChars * 2 + targets.size() * 96 + 320
        ));
        JSONObject request = ProviderRequestPolicy.request(config,systemPrompt,payload,outputTokens);
        Negotiation cached=negotiation;
        if(cached!=null&&identity(config).equals(cached.identity))ProviderRequestPolicy.removeOptional(request,cached.category);

        int contextCount = (contextBefore == null ? 0 : contextBefore.size()) +
                (contextAfter == null ? 0 : contextAfter.size());
        int contextChars=payload.optString("context_before","").length()+payload.optString("context_after","").length();
        TokenCostAudit.Request audit = TokenCostAudit.beginUnitBatch(
                config,
                priority,
                targets.size(),
                contextCount,
                sourceChars,
                contextChars,
                priority ? LANE_REALTIME : LANE_BACKGROUND
        );

        boolean negotiated=false;
        String negotiatedCategory="";
        while(true) {
            ensureActive(deadline,control);
            try {
                String content=post(config,request,deadline,control,audit);
                if(control!=null)control.onQualityEvidence(payload,content,
                        "protocol="+CaptionWireProtocol.VERSION+";prompt_sha256="+CaptionQualityTrace.digest(systemPrompt)+";format="+(request.optJSONObject("response_format")==null?"prompt_json":request.optJSONObject("response_format").optString("type"))+
                        ";thinking="+request.opt("enable_thinking")+";presence_penalty="+request.opt("presence_penalty")+
                        ";temperature="+(request.has("temperature")?request.opt("temperature"):"provider_default")+
                        ";negotiated="+negotiated+";category="+negotiatedCategory);
                Result result=parseAnchored(content,targets,atoms,repair);
                if(negotiated)negotiation=new Negotiation(identity(config),negotiatedCategory);
                TokenCostAudit.recordUnitBatchOutcome(audit,result.validCount());
                int qualityRejected=0;for(String reason:result.rejectionReasons.values())if(CaptionQualityPolicy.failure(reason))qualityRejected++;
                TokenCostAudit.recordUnitQualityOutcome(audit,result.validCount(),result.missingIds.size(),qualityRejected);
                return result;
            } catch(ProviderRequestException rejected) {
                negotiatedCategory=ProviderRequestPolicy.reason(rejected.providerDetail);
                if(!negotiated && ProviderRequestPolicy.removeOptional(request,negotiatedCategory)) {
                    negotiated=true; continue; // exactly one minimal-schema retry, no window isolation.
                }
                blockedMessage="API 拒绝字幕请求（"+ProviderRequestPolicy.reason(rejected.providerDetail)+
                    "）。已停止自动重试，请检查 API 地址/模型并运行测试 API。";
                blockedIdentity=identity(config);
                throw new PermanentException(rejected.category(),blockedMessage, "");
            } catch(BatchFormatException invalid) {
                TokenCostAudit.recordUnitQualityOutcome(audit,0,targets.size(),0);
                throw invalid;
            }
        }
    }

    static String test(DeepSeekConfig.Snapshot config) throws Exception {
        resetRejection();
        java.util.List<SourceAtomTimeline.Atom> atoms=java.util.Arrays.asList(
            new SourceAtomTimeline.Atom(0,1000,"Hello",0,true),new SourceAtomTimeline.Atom(1000,2000,"world.",0,true));
        TranslationUnitTimeline.Unit unit=new TranslationUnitTimeline.Unit(0,"test",0,1,0,0,0,2000,
            "Hello world.",TranslationUnitTimeline.Confidence.HIGH,"test");
        DeepSeekConfig.Snapshot enabled=new DeepSeekConfig.Snapshot(true,config.baseUrl,config.model,config.prompt,
            config.captionTextSize,config.backgroundOpacity,config.apiKey);
        Result result=translate(java.util.Collections.singletonList(unit),atoms,java.util.Collections.emptyList(),
            java.util.Collections.emptyList(),enabled,TargetLanguage.SIMPLIFIED_CHINESE,null,true);
        if(result.validCount()!=1) throw new BatchFormatException("API 未返回有效时间锚字幕；请更换模型");
        return result.translationsById.get("test");
    }

    static Result parseAnchored(String content, List<TranslationUnitTimeline.Unit> targets,
                                List<SourceAtomTimeline.Atom> atoms) throws Exception {
        return parseAnchored(content,targets,atoms,java.util.Collections.emptyMap());
    }
    static Result parseAnchored(String content,List<TranslationUnitTimeline.Unit> targets,
                               List<SourceAtomTimeline.Atom> atoms,Map<String,String> repair) throws Exception {
        validateTargetIds(targets);
        JSONObject root;
        try {
            org.json.JSONTokener input=new org.json.JSONTokener(stripJsonFence(content));
            Object value=input.nextValue();
            if(!(value instanceof JSONObject) || input.nextClean()!=0) throw new IllegalArgumentException("invalid envelope");
            root=(JSONObject)value;
        }
        catch (Exception e) { throw new BatchFormatException("protocol_json", "invalid anchored JSON", e); }
        JSONArray rows = root.optJSONArray("translations");
        if (rows == null) throw new BatchFormatException("protocol_translations", "missing translations");
        Map<String,String> reasons=new HashMap<>();
        Map<String, AnchoredCaptionPlan> plans = new HashMap<>();
        Map<String, String> texts = new HashMap<>();
        Set<String> seen = new HashSet<>();
        List<String> invalid = new ArrayList<>(), unknown = new ArrayList<>(), missing = new ArrayList<>();
        for (int i=0;i<rows.length();i++) {
            JSONObject row=rows.optJSONObject(i);
            if(row==null || !(row.opt("id") instanceof String)) continue; // Unassignable row must not poison valid siblings.
            String id=row.getString("id");
            TranslationUnitTimeline.Unit unit=targetById(targets,id);
            if(unit==null) { unknown.add(id); continue; }
            if(!seen.add(id)) { plans.remove(id); texts.remove(id); invalid.add(id); reasons.put(id,"duplicate_response_id"); continue; }
            try {
                JSONArray segments=row.optJSONArray("segments");

                AnchoredCaptionPlan plan=AnchoredCaptionPlan.parseSourcePhrases(segments,atoms,unit,row.optJSONArray("attach_next"));
                plans.put(id,plan); texts.put(id,plan.canonical);
            } catch(Exception rejected) { invalid.add(id); reasons.put(id,(rejected.getMessage()==null ? "invalid_structure" : rejected.getMessage())+";last="+(unit.toAtom-unit.fromAtom)+";shape="+safeShape(row.optJSONArray("segments"))); }
        }
        for(TranslationUnitTimeline.Unit unit:targets) if(!plans.containsKey(unit.id)) missing.add(unit.id);
        Result result=new Result(texts,missing,invalid,unknown);
        result.plansById.putAll(plans);
        result.rejectionReasons.putAll(reasons);
        return result;
    }

    static String safeShape(JSONArray rows) {
        if(rows==null)return "missing";StringBuilder out=new StringBuilder();
        for(int i=0;i<Math.min(12,rows.length());i++) {
            if(i>0)out.append(',');Object row=rows.opt(i);
            if(row instanceof JSONObject) {JSONObject o=(JSONObject)row;
                out.append(o.opt("source") instanceof String && o.opt("translation") instanceof String?"source_translation":"object_fields");}
            else if(row instanceof JSONArray) {JSONArray a=(JSONArray)row;out.append("array").append(a.length()).append(a.opt(0) instanceof String?"_phrase":"_nonphrase");}
            else out.append("nonsegment");
        }
        return out.toString();
    }

    static String safeEnds(JSONArray rows) {
        if(rows==null)return "missing";
        StringBuilder result=new StringBuilder();
        for(int i=0;i<Math.min(rows.length(),12);i++) {
            if(i>0)result.append(',');
            try {
                JSONArray row=rows.optJSONArray(i);JSONObject item=rows.optJSONObject(i);
                Object n=row!=null ? row.get(row.length()==3 ? 1 : 0) : item.get(item.has("end_id") ? "end_id" : "end");
                result.append(AnchoredCaptionPlan.exactIndex(n));
            }catch(Exception bad){result.append('?');}
        }
        return result.toString();
    }

    static String stripJsonFence(String content) {
        String text=content==null ? "" : content.trim();
        if(text.startsWith("\uFEFF")) text=text.substring(1).trim();
        // Only remove a complete, known outer fence. Never salvage truncated JSON or surrounding prose.
        if(text.startsWith("```") && text.endsWith("```")) {
            int newline=text.indexOf('\n');
            if(newline>=3) {
                String language=text.substring(3,newline).trim();
                if(language.isEmpty() || language.equalsIgnoreCase("json"))
                    text=text.substring(newline+1,text.length()-3).trim();
            }
        }
        return text;
    }
    static String boundedContext(List<String> values,boolean before) {
        String text=String.join(" ",values).trim();int preferred=160,hard=320;
        if(text.length()<=preferred)return text;
        if(before){
            int base=Math.max(0,text.length()-hard),ideal=text.length()-preferred;
            // Nearest preceding complete sentence, rather than the tail of a negation/relative clause.
            for(int i=ideal;i>=base;i--)if(SentenceBoundaryUtil.strong(text,i))return text.substring(i+1).trim();
            if(text.length()<=hard&&SemanticTaskPlanner.terminal(text))return text;
            int at=ideal;if(at>0&&Character.isLowSurrogate(text.charAt(at)))at++;
            int space=text.indexOf(' ',at);return space<0?text.substring(at):text.substring(space+1);
        }
        for(int i=preferred;i<Math.min(hard,text.length());i++)if(SentenceBoundaryUtil.strong(text,i))return text.substring(0,i+1).trim();
        int at=preferred;if(Character.isHighSurrogate(text.charAt(at-1)))at--;
        int space=text.lastIndexOf(' ',at);return text.substring(0,space<0?at:space).trim();
    }

    private static Result parse(
            String content,
            List<TranslationUnitTimeline.Unit> targets
    ) throws Exception {
        String json = content == null ? "" : content.trim();
        if (json.startsWith("```")) {
            int firstNewline = json.indexOf('\n');
            int lastFence = json.lastIndexOf("```");
            if (firstNewline >= 0 && lastFence > firstNewline) {
                json = json.substring(firstNewline + 1, lastFence).trim();
            }
        }

        final JSONArray values;
        try {
            JSONObject root = new JSONObject(json);
            Object raw = root.opt("translations");
            if (!(raw instanceof JSONArray)) {
                throw new BatchFormatException("API 返回缺少 translations 数组");
            }
            values = (JSONArray) raw;
        } catch (BatchFormatException failure) {
            throw failure;
        } catch (Throwable malformed) {
            throw new BatchFormatException("API 返回的固定单元 JSON 无法解析", malformed);
        }

        Set<String> expected = validateTargetIds(targets);

        Map<String, String> byId = new HashMap<>();
        Set<String> invalid = new HashSet<>();
        Set<String> unknown = new HashSet<>();
        Set<String> seen = new HashSet<>();
        for (int i = 0; i < values.length(); i++) {
            JSONObject value = values.optJSONObject(i);
            if (value == null) {
                throw new BatchFormatException("翻译项不是对象: " + i);
            }
            Object rawId = value.opt("id");
            if (!(rawId instanceof String) || ((String) rawId).trim().isEmpty()) {
                // Without a reliable id we cannot safely associate any item with a target.
                throw new BatchFormatException("翻译项 id 类型无效: " + i);
            }
            String id = ((String) rawId).trim();
            if (!expected.contains(id)) {
                // Unknown ids never become READY and do not prevent known ids from being used.
                unknown.add(id);
                continue;
            }
            if (!seen.add(id)) {
                byId.remove(id);
                invalid.add(id);
                continue;
            }
            Object rawText = value.opt("text");
            if (!(rawText instanceof String)) {
                invalid.add(id);
                continue;
            }
            String text = ContextualCaptionTextPolicy.translationForDisplay((String) rawText);
            TranslationUnitTimeline.Unit target = targetById(targets, id);
            if (text.isEmpty() || target == null ||
                    !ContextualCaptionTextPolicy.adequateTranslation(target.sourceText, text)) {
                invalid.add(id);
                continue;
            }
            byId.put(id, text);
        }

        List<String> missing = new ArrayList<>();
        for (TranslationUnitTimeline.Unit unit : targets) {
            String id = unit.id;
            if (!byId.containsKey(id)) missing.add(id);
        }
        return new Result(byId, missing, new ArrayList<>(invalid), new ArrayList<>(unknown));
    }

    private static JSONArray sanitizedContext(List<String> values) {
        JSONArray result = new JSONArray();
        for (String value : values) {
            String clean = ContextualCaptionTextPolicy.sourceForTranslation(value);
            if (!clean.isEmpty()) result.put(clean);
        }
        return result;
    }

    private static TranslationUnitTimeline.Unit targetById(
            List<TranslationUnitTimeline.Unit> targets,
            String id
    ) {
        if (targets == null || id == null) return null;
        for (TranslationUnitTimeline.Unit target : targets) {
            if (target != null && id.equals(target.id)) return target;
        }
        return null;
    }
    private static String post(
            DeepSeekConfig.Snapshot config,
            JSONObject request,
            long deadline,
            DeepSeekApiClient.RequestControl control,
            TokenCostAudit.Request audit
    ) throws Exception {
        HttpURLConnection connection = null;
        boolean consumed = false;
        boolean auditRecorded = false;
        int auditAttempt = 0;
        int sentBodyBytes = 0;
        NetworkDeadline timer=null;
        try {
            ensureActive(deadline, control);
            connection = (HttpURLConnection) new URL(completionUrl(config.baseUrl)).openConnection();
            if (control != null) control.onConnection(connection);
            timer=new NetworkDeadline(connection,deadline);
            connection.setInstanceFollowRedirects(false);
            connection.setRequestMethod("POST");
            connection.setConnectTimeout(boundedTimeout(deadline, CONNECT_TIMEOUT_MS));
            connection.setReadTimeout(boundedTimeout(deadline, READ_TIMEOUT_MS));
            connection.setDoOutput(true);
            connection.setUseCaches(false);
            ProviderEndpoint.authenticate(connection,config.baseUrl,config.apiKey);
            connection.setRequestProperty("Content-Type", "application/json; charset=utf-8");
            connection.setRequestProperty("Accept", "application/json");
            connection.setRequestProperty("Connection", "keep-alive");

            byte[] body = request.toString().getBytes(StandardCharsets.UTF_8);
            auditAttempt = TokenCostAudit.beginAttempt(audit, body.length);
            connection.setFixedLengthStreamingMode(body.length);
            try (OutputStream output = connection.getOutputStream()) {
                output.write(body);
            }
            sentBodyBytes = body.length;
            if (control != null) control.onRequestBodySent();

            ensureActive(deadline, control);
            connection.setReadTimeout(boundedTimeout(deadline,READ_TIMEOUT_MS));
            int status = connection.getResponseCode();
            ensureActive(deadline,control);
            InputStream stream = status >= 400 ? connection.getErrorStream() : connection.getInputStream();
            String response = stream == null ? "" : new String(
                    readFully(stream, MAX_RESPONSE_BYTES,connection,deadline,control), StandardCharsets.UTF_8
            );
            consumed = true;
            if (status == 408 || status == 409 || status == 425 || status == 429 || status >= 500) {
                TokenCostAudit.recordFailure(audit, auditAttempt, "http_" + status);
                auditRecorded = true;
                throw new RetryableException("http_" + status, "API HTTP " + status);
            }
            if (status == 400 || status == 413 || status == 422) {
                TokenCostAudit.recordFailure(audit, auditAttempt, "http_" + status);
                auditRecorded = true;
                throw new ProviderRequestException(
                        safeProviderCategory(status, response),
                        "API HTTP " + status,
                        response
                );
            }
            if (status < 200 || status >= 300) {
                TokenCostAudit.recordFailure(audit, auditAttempt, "http_" + status);
                auditRecorded = true;
                throw new PermanentException("http_" + status, "API HTTP " + status, response);
            }

            JSONObject root = new JSONObject(response);
            TokenCostAudit.recordResponse(audit, auditAttempt, root);
            auditRecorded = true;
            JSONArray choices = root.optJSONArray("choices");
            if (choices == null || choices.length() == 0) {
                throw new RetryableException("missing_choices", "API 返回中没有 choices");
            }
            JSONObject choice = choices.optJSONObject(0);
            String finish = choice == null ? "" : choice.optString("finish_reason", "");
            if(control!=null)control.onQualityEvidence(null,"","response_model="+root.optString("model", "unreported")+";finish_reason="+finish);
            if ("length".equals(finish)) {
                throw new BatchFormatException("finish_length", "API 输出达到 max_tokens，固定单元 JSON 被截断");
            }
            if ("insufficient_system_resource".equals(finish)) {
                throw new RetryableException("provider_resource", "API 资源不足");
            }
            if ("content_filter".equals(finish)) {
                throw new PermanentException("content_filter", "API 内容过滤中止了字幕翻译", "");
            }
            JSONObject message = choice == null ? null : choice.optJSONObject("message");
            String result = message == null ? "" : message.optString("content", "").trim();
            if (result.isEmpty()) throw new RetryableException("empty_content", "API 返回了空 content");
            return result;
        } catch (SocketTimeoutException timeout) {
            if (auditAttempt > 0 && !auditRecorded) {
                TokenCostAudit.recordFailure(audit, auditAttempt, "timeout");
                TokenCostAudit.recordSunkPrompt(audit, sentBodyBytes);
                auditRecorded = true;
            }
            ensureActive(deadline, control);
            throw new RetryableException("timeout", "API 网络超时", timeout);
        } catch (IOException network) {
            if (auditAttempt > 0 && !auditRecorded) {
                boolean cancelled = Thread.currentThread().isInterrupted() ||
                        (control != null && control.isCancelled());
                TokenCostAudit.recordFailure(audit, auditAttempt, cancelled ? "cancelled" : "network");
                TokenCostAudit.recordSunkPrompt(audit, sentBodyBytes);
                auditRecorded = true;
            }
            ensureActive(deadline, control);
            throw new RetryableException("network", "API 网络错误", network);
        } catch(RetryableException failure) {
            if(auditAttempt>0 && !auditRecorded){
                TokenCostAudit.recordFailure(audit,auditAttempt,failure.category());
                TokenCostAudit.recordSunkPrompt(audit,sentBodyBytes);auditRecorded=true;
            }
            throw failure;
        } finally {
            if (auditAttempt > 0 && !auditRecorded) {
                TokenCostAudit.recordFailure(audit, auditAttempt, "cancelled_or_exception");
                TokenCostAudit.recordSunkPrompt(audit, sentBodyBytes);
            }
            if(timer!=null)timer.close();
            if (connection != null && !consumed) connection.disconnect();
            if (control != null) control.onConnection(null);
        }
    }

    static byte[] readFully(InputStream stream, int maxBytes,HttpURLConnection connection,long deadline,
                            DeepSeekApiClient.RequestControl control) throws Exception {
        try (InputStream input = stream; ByteArrayOutputStream output = new ByteArrayOutputStream()) {
            byte[] buffer = new byte[8192];
            while (true) {
                ensureActive(deadline,control);
                connection.setReadTimeout(boundedTimeout(deadline,READ_TIMEOUT_MS));
                int read=input.read(buffer);ensureActive(deadline,control);if(read<0)break;
                if (output.size() + read > maxBytes) throw new IllegalStateException("网络响应过大");
                output.write(buffer, 0, read);
            }
            return output.toByteArray();
        }
    }

    private static void ensureActive(
            long deadline,
            DeepSeekApiClient.RequestControl control
    ) throws Exception {
        if (Thread.currentThread().isInterrupted()) throw new InterruptedException("字幕翻译已取消");
        if (control != null && control.isCancelled()) throw new InterruptedException("字幕翻译已重新调度");
        if (remainingMillis(deadline) <= 0L) {
            throw new RetryableException("deadline", "AI 字幕请求超时");
        }
    }

    private static int boundedTimeout(long deadline, int maximum) throws Exception {
        long left = remainingMillis(deadline);
        if (left <= 0L) throw new RetryableException("deadline", "AI 字幕请求超时");
        return (int) Math.max(1L, Math.min((long) maximum, left));
    }

    private static long remainingMillis(long deadline) {
        long nanos = deadline - System.nanoTime();
        if (nanos <= 0L) return 0L;
        return Math.max(1L, TimeUnit.NANOSECONDS.toMillis(nanos));
    }

    private static Set<String> validateTargetIds(
            List<TranslationUnitTimeline.Unit> targets
    ) throws BatchFormatException {
        Set<String> expected = new HashSet<>();
        if (targets == null) throw new BatchFormatException("target_ids", "targets 为空");
        for (TranslationUnitTimeline.Unit unit : targets) {
            if (unit == null || unit.id == null || unit.id.trim().isEmpty()) {
                throw new BatchFormatException("target_ids", "targets 含有无法识别的 unit id");
            }
            String id = unit.id.trim();
            if (!id.equals(unit.id) || !expected.add(id)) {
                throw new BatchFormatException("duplicate_target_id", "targets 含有重复或非规范 unit id");
            }
        }
        return expected;
    }

    static ContextualUnitCorePolicy.FailureKind failureKind(Throwable error) {
        Throwable current = error;
        while (current != null) {
            if (current instanceof ProviderRequestException) {
                return ContextualUnitCorePolicy.FailureKind.RETRYABLE_PROTOCOL;
            }
            if (current instanceof PermanentException) {
                return ContextualUnitCorePolicy.FailureKind.PERMANENT;
            }
            if (current instanceof BatchFormatException) {
                return ContextualUnitCorePolicy.FailureKind.RETRYABLE_PROTOCOL;
            }
            if (current instanceof RetryableException) {
                return ContextualUnitCorePolicy.FailureKind.TRANSIENT;
            }
            current = current.getCause();
        }
        return ContextualUnitCorePolicy.FailureKind.TRANSIENT;
    }

    static boolean requiresBatchIsolation(Throwable error) {
        Throwable current = error;
        while (current != null) {
            if (current instanceof ProviderRequestException) return false;
            current = current.getCause();
        }
        return false;
    }

    static String failureCategory(Throwable error) {
        Throwable current = error;
        while (current != null) {
            if (current instanceof CategorizedFailure) {
                return ((CategorizedFailure) current).category();
            }
            if (current instanceof InterruptedException) return "cancelled";
            current = current.getCause();
        }
        return error == null ? "unknown" : error.getClass().getSimpleName();
    }

    private static String completionUrl(String configured) {
        return ProviderEndpoint.chat(configured);
    }

    private static boolean isDeepSeekModel(String model) {
        String value = model == null ? "" : model.toLowerCase(Locale.ROOT);
        return value.contains("deepseek");
    }

    private static boolean isQwenModel(String model) {
        String value = model == null ? "" : model.toLowerCase(Locale.ROOT);
        return value.contains("qwen") || value.contains("tongyi");
    }

    private static boolean isDashScope(String baseUrl) {
        String value = baseUrl == null ? "" : baseUrl.toLowerCase(Locale.ROOT);
        return value.contains("dashscope.aliyuncs.com") || value.contains("maas.aliyuncs.com");
    }

    private static boolean unsupportedThinking(Throwable error) {
        String raw = providerDetail(error);
        String message = raw == null ? "" : raw.toLowerCase(Locale.ROOT);
        return (message.contains("thinking") || message.contains("enable_thinking")) && (
                message.contains("unknown") || message.contains("unsupported") ||
                        message.contains("unrecognized") || message.contains("not permitted") ||
                        message.contains("invalid parameter") || message.contains("不支持") ||
                        message.contains("未知")
        );
    }

    private static boolean unsupportedResponseFormat(Throwable error) {
        return providerRejectsParameter(error, "response_format") ||
                providerRejectsParameter(error, "json_object");
    }

    static boolean providerRejectsParameter(Throwable error, String parameter) {
        String raw = providerDetail(error);
        String message = raw == null ? "" : raw.toLowerCase(Locale.ROOT);
        String key = parameter == null ? "" : parameter.toLowerCase(Locale.ROOT).trim();
        if (key.isEmpty() || !message.contains(key)) return false;
        return message.contains("unknown") || message.contains("unsupported") ||
                message.contains("unrecognized") || message.contains("not permitted") ||
                message.contains("invalid parameter") || message.contains("invalid value") ||
                message.contains("out of range") || message.contains("too large") ||
                message.contains("maximum") || message.contains("不支持") ||
                message.contains("未知") || message.contains("无效") ||
                message.contains("超出范围");
    }

    private static String providerDetail(Throwable error) {
        if (error instanceof ProviderRequestException) {
            return ((ProviderRequestException) error).providerDetail;
        }
        if (error instanceof PermanentException) {
            return ((PermanentException) error).providerDetail;
        }
        return error == null ? "" : error.getMessage();
    }

    static String safeProviderCategory(int status, String response) {
        StringBuilder category = new StringBuilder("http_").append(status);
        try {
            JSONObject root = new JSONObject(response == null ? "" : response);
            JSONObject error = root.optJSONObject("error");
            if (error == null) error = root;
            appendSafeCategoryPart(category, error.optString("code", ""));
            if (!error.isNull("param")) appendSafeCategoryPart(category, error.optString("param", ""));
            appendSafeCategoryPart(category, ProviderRequestPolicy.reason(response));
        } catch (Throwable ignored) {
            // HTTP status remains sufficient for recovery; never persist provider response text.
        }
        return category.toString();
    }

    private static void appendSafeCategoryPart(StringBuilder category, String raw) {
        if (category == null || raw == null || raw.trim().isEmpty()) return;
        String safe = raw.toLowerCase(Locale.ROOT).replaceAll("[^a-z0-9_.-]", "_");
        while (safe.contains("__")) safe = safe.replace("__", "_");
        if (safe.length() > 48) safe = safe.substring(0, 48);
        if (!safe.isEmpty()) category.append('_').append(safe);
    }

    private static String abbreviate(String value) {
        if (value == null) return "";
        String one = value.replace('\n', ' ').replace('\r', ' ').trim();
        return one.length() <= 280 ? one : one.substring(0, 280);
    }

    static final class Result {
        static final Result EMPTY = new Result(
                new HashMap<>(),
                new ArrayList<>(),
                new ArrayList<>(),
                new ArrayList<>()
        );
        final Map<String,String> rejectionReasons=new HashMap<>();
        final Map<String, AnchoredCaptionPlan> plansById = new HashMap<>();
        final Map<String, String> translationsById;
        final List<String> missingIds;
        final List<String> invalidIds;
        final List<String> unknownIds;

        Result(
                Map<String, String> translationsById,
                List<String> missingIds,
                List<String> invalidIds,
                List<String> unknownIds
        ) {
            this.translationsById = translationsById == null
                    ? new HashMap<>() : translationsById;
            this.missingIds = missingIds == null ? new ArrayList<>() : missingIds;
            this.invalidIds = invalidIds == null ? new ArrayList<>() : invalidIds;
            this.unknownIds = unknownIds == null ? new ArrayList<>() : unknownIds;
        }

        int validCount() {
            return translationsById.size();
        }

        boolean isPartial() {
            return !translationsById.isEmpty() && !missingIds.isEmpty();
        }
    }

    private interface CategorizedFailure {
        String category();
    }

    static final class RetryableException extends Exception implements CategorizedFailure {
        private static final long serialVersionUID = 1L;
        private final String category;
        RetryableException(String message) { this("transient", message); }
        RetryableException(String category, String message) {
            super(message);
            this.category = category == null ? "transient" : category;
        }
        RetryableException(String message, Throwable cause) { this("transient", message, cause); }
        RetryableException(String category, String message, Throwable cause) {
            super(message, cause);
            this.category = category == null ? "transient" : category;
        }
        @Override public String category() { return category; }
    }

    static final class BatchFormatException extends Exception implements CategorizedFailure {
        private static final long serialVersionUID = 1L;
        private final String category;
        BatchFormatException(String message) { this("protocol_format", message); }
        BatchFormatException(String category, String message) {
            super(message);
            this.category = category == null ? "protocol_format" : category;
        }
        BatchFormatException(String message, Throwable cause) {
            this("protocol_format", message, cause);
        }
        BatchFormatException(String category, String message, Throwable cause) {
            super(message, cause);
            this.category = category == null ? "protocol_format" : category;
        }
        @Override public String category() { return category; }
    }

    static final class PermanentException extends IllegalStateException implements CategorizedFailure {
        private static final long serialVersionUID = 1L;
        private final String category;
        private final String providerDetail;
        PermanentException(String category, String message, String providerDetail) {
            super(message);
            this.category = category == null ? "permanent" : category;
            this.providerDetail = providerDetail == null ? "" : providerDetail;
        }
        @Override public String category() { return category; }
    }

    static final class ProviderRequestException extends IllegalStateException
            implements CategorizedFailure {
        private static final long serialVersionUID = 1L;
        private final String category;
        private final String providerDetail;

        ProviderRequestException(String category, String message, String providerDetail) {
            super(message);
            this.category = category == null ? "provider_request" : category;
            this.providerDetail = providerDetail == null ? "" : providerDetail;
        }

        @Override public String category() { return category; }
    }
}
