package dev.rikunode.futatabi.bridge;

import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.text.Html;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.concurrent.Semaphore;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Independent Animanch adapter. Parse only known public HTML structures.
 * All published pages are generated from escaped text and no source forms/JS.
 */
final class AnimanchAdapter {
    private static final String HOST = "https://bbs.animanch.com";
    // Official main.js uploadCheck maxSize (captured 2026-11-23): 5 MiB.
    static final int MAX_IMAGE_BYTES = 5_242_880;
    private static final Charset SJIS = Charset.forName("Shift_JIS");
    private static final Pattern CARD = Pattern.compile(
            "<a\\s+[^>]*href=['\"](?:https://bbs\\.animanch\\.com)?/board/(\\d+)/['\"][^>]*class=['\"]card['\"][^>]*>(.*?)</a>",
            Pattern.CASE_INSENSITIVE | Pattern.DOTALL);
    private static final Pattern COUNT = Pattern.compile("threadCount['\"][^>]*>([0-9]+)", Pattern.CASE_INSENSITIVE);
    private static final Pattern BODY = Pattern.compile("class=['\"]card-body['\"][^>]*>(.*?)(?:<p\\s+class=['\"]threadCount)", Pattern.CASE_INSENSITIVE | Pattern.DOTALL);
    private static final Pattern RES = Pattern.compile("<li\\s+id=['\"]res([0-9]+)['\"][^>]*>(.*?)</li>", Pattern.CASE_INSENSITIVE | Pattern.DOTALL);
    private static final Pattern RES_BODY = Pattern.compile("<div\\s+class=['\"]resbody[^'\"]*['\"][^>]*>(.*?)</div>\\s*$", Pattern.CASE_INSENSITIVE | Pattern.DOTALL);
    private static final Pattern POSTED = Pattern.compile("<span\\s+class=['\"]resposted['\"][^>]*>(.*?)</span>", Pattern.CASE_INSENSITIVE | Pattern.DOTALL);
    private static final Pattern IMAGE = Pattern.compile("<img[^>]+src=['\"]([^'\"]+)['\"]", Pattern.CASE_INSENSITIVE);
    private static final Pattern BACKLINKS = Pattern.compile(
            "<div\\s+class=['\"]reply['\"][^>]*>.*?</div>", Pattern.CASE_INSENSITIVE | Pattern.DOTALL);
    private static final Pattern ANCHOR = Pattern.compile(
            "<a\\s+class=['\"]reslink['\"]\\s+href=['\"]#res([0-9]+)['\"][^>]*>&gt;&gt;[0-9]+</a>",
            Pattern.CASE_INSENSITIVE);
    private final SharedPreferences prefs;
    private final Context context;
    private final Map<String, Cache> cache = new HashMap<>();
    private long lastRequest;
    private final File thumbnailCache;
    private final Object[] imageLocks = new Object[32];
    private final Semaphore imageDownloads = new Semaphore(4);
    private final Map<String, Cache> thumbnailMemory = new LinkedHashMap<>(32, .75f, true);
    private long thumbnailBytes;
    private static final long IMAGE_TTL = 24L * 60 * 60 * 1000;
    private static final long DISK_IMAGE_LIMIT = 48L * 1024 * 1024;
    private static final int MEMORY_IMAGE_LIMIT = 10 * 1024 * 1024;

    private static class Cache {
        final byte[] bytes; final long expiry;
        Cache(byte[] data, long until) { bytes = data; expiry = until; }
    }

    AnimanchAdapter(Context context) {
        this.context=context;
        prefs = context.getSharedPreferences("futatabi_animanch_private", Context.MODE_PRIVATE);
        thumbnailCache = new File(context.getCacheDir(), "futatabi_animanch_images");
        for (int i = 0; i < imageLocks.length; i++) imageLocks[i] = new Object();
    }

    BridgeServer.BridgeResponse route(String rawPath) {
        try {
            String path = rawPath.split("\\?", 2)[0];
            if (path.equals("/animanch/") || (path.equals("/animanch/futaba.php") &&
                    BridgeServer.hasCatalogMode(rawPath)))
                return BridgeServer.BridgeResponse.html(BridgePalette.decorate(context,catalog()));
            if (path.matches("/animanch/res/[0-9]{13}\\.htm")) {
                String id = path.substring("/animanch/res/".length(), path.length() - 4);
                String board = prefs.getString("board." + id, null);
                if (board == null) return BridgeServer.BridgeResponse.text(404, "Unknown thread");
                return BridgeServer.BridgeResponse.html(BridgePalette.decorate(context,thread(id, board)));
            }
            if (path.matches("/animanch/(thumb|cat|src)/[0-9]{13}s?\\.jpg")) {
                String name = path.substring(path.lastIndexOf('/') + 1);
                String id = name.substring(0, 13);
                String source = prefs.getString("image." + id, null);
                if (source == null) return BridgeServer.BridgeResponse.text(404, "Unknown image");
                return BridgeServer.BridgeResponse.image(image(source, path.contains("/thumb/") || path.contains("/cat/")));
            }
            return BridgeServer.BridgeResponse.text(404, "Unknown route");
        } catch (Exception ex) {
            return BridgeServer.BridgeResponse.text(503, "Animanch unavailable");
        }
    }

    JSONObject threadsJson() throws Exception {
        String html = new String(fetch(HOST + "/", 90000L, 1_500_000), StandardCharsets.UTF_8);
        JSONArray items = new JSONArray();
        Matcher matches = CARD.matcher(html);
        while (matches.find() && items.length() < 50) {
            String board = matches.group(1), card = matches.group(2);
            String virtualId = remember("board.", board);
            Matcher title = BODY.matcher(card);
            String body = title.find() ? plain(title.group(1)) : "スレ";
            Matcher count = COUNT.matcher(card);
            JSONObject item = new JSONObject();
            item.put("id", virtualId);
            item.put("title", body);
            item.put("replies", count.find() ? Integer.parseInt(count.group(1)) : 0);
            items.put(item);
        }
        if (items.length() == 0) throw new IllegalStateException("No catalog entries parsed");
        JSONObject result = new JSONObject();
        result.put("threads", items);
        return result;
    }

    private byte[] catalog() throws Exception {
        JSONArray items = threadsJson().getJSONArray("threads");
        StringBuilder html = page("あにまん");
        html.append("<table id='cattable'><tr>");
        for (int i = 0; i < items.length(); i++) {
            JSONObject item = items.getJSONObject(i);
            String id = item.getString("id");
            String boardId = prefs.getString("board." + id, "");
            String imageId = remember("image.", HOST + "/thumb_s/" + boardId + "/");
            html.append("<td><a href='res/").append(id).append(".htm'>")
                .append("<img src='/animanch/thumb/").append(imageId).append("s.jpg'></a>")
                .append("<small>").append(escape(item.getString("title"))).append("</small>")
                .append("<font size=2>").append(item.optInt("replies")).append("</font></td>");
            if (i % 5 == 4 && i != items.length() - 1) html.append("</tr><tr>");
        }
        html.append("</tr></table></body></html>");
        return html.toString().getBytes(SJIS);
    }

    JSONObject replyTargets(String id) throws Exception {
        String board = prefs.getString("board." + id, null);
        if (board == null) throw new IllegalArgumentException("Unknown thread");
        String raw = new String(fetch(HOST + "/board/" + board + "/", 30000L, 1_700_000), StandardCharsets.UTF_8);
        Matcher matches = RES.matcher(raw);
        JSONArray targets = new JSONArray();
        String title = "";
        while (matches.find() && targets.length() < 220) {
            Matcher body = RES_BODY.matcher(matches.group(2));
            if (!body.find()) continue;
            String excerpt = PostPresentation.excerpt(plain(BACKLINKS.matcher(body.group(1)).replaceAll("")));
            String number = matches.group(1);
            if (targets.length() == 0) title = excerpt;
            targets.put(new JSONObject().put("number", number)
                    .put("seq", Integer.parseInt(number)).put("excerpt", excerpt));
        }
        return new JSONObject().put("title", title).put("targets", targets);
    }

    private byte[] thread(String id, String board) throws Exception {
        String raw = new String(fetch(HOST + "/board/" + board + "/", 30000L, 1_700_000), StandardCharsets.UTF_8);
        StringBuilder html = page("あにまんスレ");
        html.append("<div class='thre' data-res='").append(id).append("'>");
        Matcher matches = RES.matcher(raw);
        int index = 0;
        while (matches.find() && index < 220) {
            String markup = matches.group(2);
            Matcher body = RES_BODY.matcher(markup);
            if (!body.find()) throw new IllegalStateException("Missing Animanch post body");
            String text = plain(replyMarkup(id, body.group(1)));
            Matcher posted = POSTED.matcher(markup);
            if (!posted.find()) throw new IllegalStateException("Missing Animanch post date");
            String date = plain(posted.group(1));
            String n = matches.group(1);
            String postId = virtualPostId(id, n);
            if (index > 0) html.append("<table border=0><tr><td class=rts></td><td class=rtd>")
                    .append("<span id='delcheck").append(postId).append("' class='rsc'>")
                    .append(index).append("</span>");
            html.append("<span class='csb'>無念</span>Name <span class='cnm'>としあき</span>")
                .append("<span class='cnw'>").append(escape(date)).append("</span>")
                .append("<span class='cno'>No.").append(postId).append("</span>");
            Matcher image = IMAGE.matcher(markup);
            if (image.find()) {
                String source = normalizeImage(image.group(1));
                if (source != null) {
                    String photoId = remember("image.", source);
                    html.append("<a href='/animanch/src/").append(photoId).append(".jpg'>")
                            .append(photoId).append(".jpg</a><br>")
                            .append("<a href='/animanch/src/").append(photoId).append(".jpg'>")
                            .append("<img src='/animanch/thumb/").append(photoId).append("s.jpg' width=50 height=50></a>");
                }
            }
            html.append("<blockquote>").append(FutabaQuoteMarkup.render(escape(text).replace("\n", "<br>")))
                    .append("</blockquote>");
            if (index > 0) html.append("</td></tr></table>");
            index++;
        }
        if (index == 0) throw new IllegalStateException("Thread HTML did not contain posts");
        html.append("</div></body></html>");
        return html.toString().getBytes(SJIS);
    }

    String stockThreadId(String id) {
        return id != null && id.matches("[0-9]{13}") ? prefs.getString("board."+id,null) : null;
    }

    String confirmedNumber(String id, JSONObject accepted) throws Exception {
        String thread=stockThreadId(id), number=accepted.getString("number");
        if(thread==null || !thread.equals(accepted.getString("thread")) ||
                !accepted.optBoolean("attachmentUploaded") || !number.matches("[1-9][0-9]{0,5}")) return null;
        return virtualPostId(id,number);
    }

    String confirmedNewThread(JSONObject accepted) throws Exception {
        String thread=accepted.getString("thread");
        if(!thread.matches("[1-9][0-9]{0,15}")||!"1".equals(accepted.optString("number"))
                ||!accepted.optBoolean("attachmentUploaded")||!accepted.optBoolean("publicConfirmed"))return null;
        return remember("board.",thread);
    }

    private static boolean newThreadJump(String jump,String thread) {
        try {
            URL u=new URL(new URL(HOST+"/"),jump);
            return "https".equals(u.getProtocol())&&"bbs.animanch.com".equals(u.getHost())
                    &&u.getUserInfo()==null&&(u.getPort()==-1||u.getPort()==443)
                    &&("/board/"+thread+"/").equals(u.getPath())
                    &&(u.getQuery()==null||"res=1".equals(u.getQuery()))
                    &&(u.getRef()==null||"res1".equals(u.getRef()));
        } catch(Exception ex){return false;}
    }

    private static String comparable(String s){return s.replaceAll("[\\s\\u00a0]+"," ").trim();}
    private static boolean explicitError(NetworkResponse r) {
        String raw=new String(r.bytes,StandardCharsets.UTF_8).trim();
        if(Pattern.compile("(?is)<(?:html|!doctype)\\b|class\\s*=\\s*['\"][^'\"]*\\b(?:bg-danger|alert-danger)\\b").matcher(raw).find()
                ||raw.matches("(?is)^\\s*(?:error\\s*:|エラー|不正な操作|投稿できません|アップロードに失敗).*"))return true;
        try {
            JSONObject j=new JSONObject(raw);
            return (j.has("error")&&!j.isNull("error")&&!Boolean.FALSE.equals(j.opt("error"))&&!j.optString("error").isEmpty())
                    ||"error".equalsIgnoreCase(j.optString("status"))||"false".equals(j.optString("success"));
        }catch(Exception ex){return false;}
    }

    private static BridgeServer.BridgeResponse newThreadFailure(String message) throws Exception {
        return BridgeServer.BridgeResponse.json(409,new JSONObject().put("newThreadError",true).put("error",message).toString());
    }

    // Use the public page's canonical identity, title, OP content, timestamp and attachment
    // structure; a generic <img> or an unrelated old thread is not a confirmation.
    static boolean matchesNewOp(String html,String thread,String title,String text,long started) {
        String base=HOST+"/board/"+thread+"/";
        if(!Pattern.compile("(?i)<meta\\s+property=['\"]og:url['\"]\\s+content=['\"]"+Pattern.quote(base)+"['\"]").matcher(html).find())return false;
        Matcher heading=Pattern.compile("(?is)<h1\\s+id=['\"]threadTitle['\"][^>]*>(.*?)<div\\s+class=['\"]shareBtns['\"]").matcher(html);
        if(!heading.find()||!comparable(plain(heading.group(1))).equals(comparable(title)))return false;
        Matcher posts=RES.matcher(html);
        if(!posts.find()||!"1".equals(posts.group(1)))return false;
        String op=posts.group(2);
        Matcher date=POSTED.matcher(op);
        if(!date.find())return false;
        Matcher stamp=Pattern.compile("(\\d{2}/\\d{2}/\\d{2})\\([^)]*\\)\\s+(\\d{2}:\\d{2}:\\d{2})").matcher(plain(date.group(1)));
        if(!stamp.matches())return false;
        try {
            long time=java.time.LocalDateTime.parse(stamp.group(1)+" "+stamp.group(2),
                    java.time.format.DateTimeFormatter.ofPattern("uu/MM/dd HH:mm:ss",Locale.ROOT))
                    .atZone(java.time.ZoneId.of("Asia/Tokyo")).toInstant().toEpochMilli();
            if(time<started-120_000||time>System.currentTimeMillis()+120_000)return false;
        }catch(Exception ex){return false;}
        Matcher body=RES_BODY.matcher(op);
        if(!body.find())return false;
        String content=body.group(1);
        Matcher attachment=Pattern.compile("(?is)<a\\s+href=['\"](?:https://bbs\\.animanch\\.com)?/img/"+thread+"/1/?['\"][^>]*>\\s*<img\\s+[^>]*src=['\"](?:https://bbs\\.animanch\\.com)?/thumb_m/"+thread+"/1/?['\"][^>]*>\\s*</a>").matcher(content);
        if(!attachment.find())return false;
        String bodyHtml=content.substring(0,attachment.start());
        return comparable(plain(bodyHtml)).equals(comparable(text));
    }

    static boolean matchesCatalog(String html,String thread,String title) {
        Matcher cards=CARD.matcher(html);
        while(cards.find()){
            if(!thread.equals(cards.group(1)))continue;
            Matcher heading=BODY.matcher(cards.group(2));
            if(heading.find()&&comparable(plain(heading.group(1))).equals(comparable(title)))return true;
        }
        return false;
    }

    private String confirmPublicThread(String thread,String title,String text,String category,long started) throws Exception {
        NetworkResponse page=transmit("GET",HOST+"/board/"+thread+"/",null,null,null,true);
        if(page.status!=200)return "スレの公開確認 HTTP "+page.status;
        if(!matchesNewOp(new String(page.bytes,StandardCharsets.UTF_8),thread,title,text,started))
            return "スレの公開確認：題名・本文・作成日時・画像の一致を確認できません";
        NetworkResponse catalog=transmit("GET",HOST+"/category"+category+"/",null,null,null,true);
        if(catalog.status!=200)return "カテゴリの公開確認 HTTP "+catalog.status;
        if(!matchesCatalog(new String(catalog.bytes,StandardCharsets.UTF_8),thread,title))
            return "カテゴリの公開確認：該当スレが一覧にありません（承認待ち等の可能性）";
        synchronized(cache){cache.remove(HOST+"/");}
        return null;
    }

    private static String virtualPostId(String thread, String number) {
        return thread.substring(0, 7) + String.format(Locale.ROOT, "%06d", Integer.parseInt(number) % 1_000_000);
    }

    static String replyMarkup(String thread, String body) {
        // Backlinks are rendered by the source as a separate reply list.
        String clean = BACKLINKS.matcher(body).replaceAll("");
        Matcher links = ANCHOR.matcher(clean);
        StringBuffer out = new StringBuffer();
        while (links.find())
            links.appendReplacement(out, Matcher.quoteReplacement("&gt;No." + virtualPostId(thread, links.group(1))));
        links.appendTail(out);
        return out.toString();
    }

    static String sourceReplyText(String thread, String text) {
        Pattern quote = Pattern.compile("(?m)^>No\\." + thread.substring(0, 7) + "([0-9]{6})(?=\\s|$)");
        Matcher m = quote.matcher(text);
        StringBuffer out = new StringBuffer();
        while (m.find()) {
            int number = Integer.parseInt(m.group(1));
            m.appendReplacement(out, Matcher.quoteReplacement(number == 0 ? m.group() : ">>" + number));
        }
        m.appendTail(out);
        return out.toString();
    }

    /** Three-step sequence, never called except through a token-authenticated user action. */
    BridgeServer.BridgeResponse post(JSONObject fields) {
        try {
            String threadId = fields.optString("threadId", "");
            boolean creating=threadId.isEmpty();
            long started=System.currentTimeMillis();
            String title = fields.optString("title", "");
            String name = fields.optString("name", "");
            String text = fields.optString("body", "");
            String category = fields.optString("category", "");
            JSONArray attachments = fields.optJSONArray("attachments");
            byte[] attachmentBytes = null;
            String attachmentMime = null;
            if (text.isEmpty() || text.length() > 1000)
                return BridgeServer.BridgeResponse.text(400, "Body must be 1-1000 characters");
            if (attachments != null && attachments.length() > 1)
                return BridgeServer.BridgeResponse.text(400, "This version supports one image per post");
            // Validate the official 5 MiB limit and MIME before comment.php can create
            // a text-only thread. The site uploads the image in a separate later request.
            if (attachments != null && attachments.length() == 1) {
                JSONObject file = attachments.getJSONObject(0);
                attachmentBytes = android.util.Base64.decode(
                        file.getString("base64"), android.util.Base64.DEFAULT);
                attachmentMime = file.optString("mime", "");
                if (attachmentBytes.length == 0 || attachmentBytes.length > MAX_IMAGE_BYTES)
                    return BridgeServer.BridgeResponse.text(400, "Animanch images must be 5 MiB or smaller; nothing was posted");
                if (!attachmentMime.matches("image/(png|jpeg|gif|webp)"))
                    return BridgeServer.BridgeResponse.text(400, "Unsupported Animanch image format; nothing was posted");
            }
            if (threadId.isEmpty() && (title.isEmpty() || category.isEmpty() || attachmentBytes == null))
                return BridgeServer.BridgeResponse.text(400, "New thread requires title, category and image");
            if(creating&&(!category.matches("[0-9]{1,2}")||StockReplyRequest.animanchCategoryName(Integer.parseInt(category))==null))
                return newThreadFailure("カテゴリが不正です。未送信です。");
            String actualThread = threadId.isEmpty() ? "" : prefs.getString("board." + threadId, null);
            if (!threadId.isEmpty() && actualThread == null)
                return BridgeServer.BridgeResponse.text(404, "Unknown reply thread");
            Map<String,String> values = new HashMap<>();
            if (!title.isEmpty()) values.put("title", title);
            if (!category.isEmpty()) values.put("category", category);
            values.put("name", name);
            values.put("text", threadId.isEmpty() ? text : sourceReplyText(threadId, text));
            if (actualThread != null) values.put("thread", actualThread);
            String referer = HOST + (threadId.isEmpty() ? "/" : "/board/" + actualThread + "/");
            // Establish the same official session as the site's form before preCheck.
            NetworkResponse formPage = transmit("GET", referer, null, null);
            if (formPage.status != 200)
                return creating?newThreadFailure("公式フォーム取得 HTTP "+formPage.status+"。未送信です。"):
                        BridgeServer.BridgeResponse.text(formPage.status, "Animanch form HTTP " + formPage.status);
            String encoded = form(values);
            NetworkResponse pre = transmit("POST", HOST + "/inc/comment.php?preCheck",
                    encoded.getBytes(StandardCharsets.UTF_8), "application/x-www-form-urlencoded; charset=UTF-8", referer);
            if (creating&&(pre.status!=200||explicitError(pre)))
                return newThreadFailure("投稿前チェックで拒否またはエラー応答（HTTP "+pre.status+"）。本文未送信です。");
            if (pre.status != 200)
                return BridgeServer.BridgeResponse.text(pre.status, boundedError(pre));
            NetworkResponse response = transmit("POST", HOST + "/inc/comment.php",
                    encoded.getBytes(StandardCharsets.UTF_8), "application/x-www-form-urlencoded; charset=UTF-8", referer);
            if(creating&&(response.status!=200||explicitError(response)))
                return newThreadFailure("本文投稿の応答がエラー（HTTP "+response.status+"）。結果未確定。再投稿せず確認してください。");
            if (response.status != 200)
                return BridgeServer.BridgeResponse.text(response.status, boundedError(response));
            JSONObject accepted;
            try{accepted=new JSONObject(new String(response.bytes, StandardCharsets.UTF_8));}
            catch(Exception ex){if(creating)return newThreadFailure("本文投稿 HTTP 200：応答JSONが不正です。結果未確定。再投稿せず確認してください。");throw ex;}
            String number = accepted.optString("number", "");
            String thread = accepted.optString("thread", "");
            String jump = accepted.optString("jump", "");
            if(creating&&(!"1".equals(number)||!thread.matches("[1-9][0-9]{0,15}")||!newThreadJump(jump,thread)))
                return newThreadFailure("本文投稿 HTTP 200：スレ番号・遷移先が不一致。結果未確定。再投稿せず確認してください。");
            if (number.isEmpty() || thread.isEmpty() || jump.isEmpty())
                return BridgeServer.BridgeResponse.text(503, "Post response lacks required fields");
            if (attachmentBytes != null) {
                String boundary = "futatabi" + System.nanoTime();
                byte[] multipart = multipart(boundary, AimogeWriteClient.attachmentName(attachmentMime),
                        attachmentMime, attachmentBytes, number, thread);
                NetworkResponse upload;
                try {
                    upload = transmit("POST", HOST + "/upload/", multipart,
                            "multipart/form-data; boundary=" + boundary, referer);
                } catch (Exception ex) {
                    JSONObject partial = new JSONObject();
                    partial.put("postAccepted", true);
                    partial.put("attachmentUploaded", false);
                    partial.put("number", number);
                    partial.put("thread", thread);
                    partial.put("uploadHttpStatus", 0);
                    partial.put("error", "Upload transport failed: " + ex.getClass().getSimpleName());
                    return BridgeServer.BridgeResponse.json(409, partial.toString());
                }
                // Official jQuery .done() accepts successful 2xx responses, not only HTTP 200.
                if(creating&&upload.status>=200&&upload.status<300&&explicitError(upload))
                    return newThreadFailure("本文受理応答あり。画像送信 HTTP "+upload.status+" の本文がエラーです。再投稿せず確認してください。");
                if (upload.status < 200 || upload.status >= 300) {
                    JSONObject partial = new JSONObject();
                    partial.put("postAccepted", true);
                    partial.put("attachmentUploaded", false);
                    partial.put("number", number);
                    partial.put("thread", thread);
                    partial.put("uploadHttpStatus", upload.status);
                    partial.put("error", boundedError(upload));
                    return BridgeServer.BridgeResponse.json(409, partial.toString());
                }
            }
            if(creating){
                String failure;
                try{failure=confirmPublicThread(thread,title,text,category,started);}
                catch(Exception ex){failure="公開確認の通信・解析に失敗（"+ex.getClass().getSimpleName()+"）";}
                if(failure!=null)return newThreadFailure("本文・画像の受理応答あり。"+failure+"。結果未確定。再投稿せず確認してください。");
            }
            synchronized (cache) { cache.remove(referer); }
            JSONObject completed = new JSONObject();
            if(creating)completed.put("publicConfirmed",true);
            completed.put("number", number); completed.put("thread", thread);
            completed.put("jump", jump); completed.put("attachmentUploaded", true);
            return BridgeServer.BridgeResponse.json(201, completed.toString());
        } catch (IllegalArgumentException ex) {
            return BridgeServer.BridgeResponse.text(400, ex.getMessage());
        } catch (Exception ex) {
            return BridgeServer.BridgeResponse.text(503, "Animanch request failed: " + ex.getClass().getSimpleName());
        }
    }

    private static class NetworkResponse {
        final int status; final byte[] bytes;
        NetworkResponse(int status, byte[] body) { this.status=status; bytes=body; }
    }

    private NetworkResponse transmit(String method, String url, byte[] body, String type) throws Exception {
        return transmit(method, url, body, type, null);
    }

    private NetworkResponse transmit(String method, String url, byte[] body, String type, String referer) throws Exception {
        return transmit(method,url,body,type,referer,false);
    }

    private NetworkResponse transmit(String method,String url,byte[] body,String type,String referer,boolean publicRead) throws Exception {
        URL target = new URL(url);
        if (!"https".equals(target.getProtocol()) || !"bbs.animanch.com".equals(target.getHost()))
            throw new IllegalArgumentException("Untrusted endpoint");
        boolean imageRequest = "GET".equals(method) &&
                (target.getPath().contains("/thumb") || target.getPath().matches(".*\\.(png|jpg|jpeg|webp|gif)$"));
        if (!imageRequest) throttle();
        if (imageRequest) imageDownloads.acquire();
        HttpURLConnection connection;
        try { connection = (HttpURLConnection) target.openConnection(); }
        catch (Exception ex) {
            if (imageRequest) imageDownloads.release();
            throw ex;
        }
        connection.setInstanceFollowRedirects(false);
        connection.setConnectTimeout(6500);
        connection.setReadTimeout(14000);
        connection.setRequestMethod(method);
        connection.setRequestProperty("User-Agent", "futatabi/0.3.0");
        if(publicRead){
            connection.setUseCaches(false);
            connection.setRequestProperty("Cache-Control","no-cache");
            connection.setRequestProperty("Cookie","");
        }else{
            String cookie = prefs.getString("session_cookie", "");
            if (!cookie.isEmpty()) connection.setRequestProperty("Cookie", cookie);
        }
        if (body != null) {
            if (referer != null) {
                connection.setRequestProperty("Origin", HOST);
                connection.setRequestProperty("Referer", referer);
                connection.setRequestProperty("X-Requested-With", "XMLHttpRequest");
            }
            connection.setDoOutput(true);
            connection.setRequestProperty("Content-Type", type);
            if (type.startsWith("multipart/form-data"))
                connection.setRequestProperty("Accept", "text/html, */*; q=0.01");
            connection.setFixedLengthStreamingMode(body.length);
        }
        try {
            if (body != null) try (OutputStream out = connection.getOutputStream()) { out.write(body); }
            int status = connection.getResponseCode();
            java.util.List<String> setCookies = null;
            for (Map.Entry<String, java.util.List<String>> entry : connection.getHeaderFields().entrySet())
                if ("Set-Cookie".equalsIgnoreCase(entry.getKey())) setCookies = entry.getValue();
            if (!publicRead && setCookies != null) for (String cookieLine : setCookies) {
                if (cookieLine.startsWith("PHPSESSID=")) {
                    String pair = cookieLine.split(";", 2)[0];
                    if (pair.length() < 240 && pair.matches("PHPSESSID=[A-Za-z0-9_-]+"))
                        prefs.edit().putString("session_cookie", pair).commit();
                }
            }
            if (status >= 300 && status < 400) return new NetworkResponse(status,new byte[0]); // never follow a redirect
            try (InputStream in = status < 400 ? connection.getInputStream() : connection.getErrorStream()) {
                return new NetworkResponse(status, in == null ? new byte[0] :
                        AimogeWriteClient.bounded(in, 1_700_000));
            }
        } finally {
            // Closing GET response streams permits HttpURLConnection's keep-alive pool to reuse sockets.
            if (!"GET".equals(method)) connection.disconnect();
            if (imageRequest) imageDownloads.release();
        }
    }

    private static String boundedError(NetworkResponse response) {
        String s = new String(response.bytes, StandardCharsets.UTF_8);
        return PostPresentation.error(s);
    }

    private synchronized void throttle() throws Exception {
        long wait = 1250 - (System.currentTimeMillis() - lastRequest);
        if (wait > 0) Thread.sleep(wait);
        lastRequest = System.currentTimeMillis();
    }

    private byte[] fetch(String url, long ttl, int max) throws Exception {
        synchronized (cache) {
            Cache prior = cache.get(url);
            if (prior != null && System.currentTimeMillis() < prior.expiry) return prior.bytes;
        }
        NetworkResponse result = transmit("GET", url, null, null);
        if (result.status != 200 || result.bytes.length > max)
            throw new IllegalStateException("HTML HTTP " + result.status);
        synchronized (cache) {
            if (cache.size() > 30) cache.clear();
            cache.put(url, new Cache(result.bytes, System.currentTimeMillis() + ttl));
        }
        return result.bytes;
    }

    private byte[] image(String source, boolean thumb) throws Exception {
        String key = source + (thumb ? ":thumb" : ":full");
        String fileKey = sha256(key);
        synchronized (thumbnailMemory) {
            Cache cached = thumbnailMemory.get(fileKey);
            if (cached != null && cached.expiry > System.currentTimeMillis()) return cached.bytes;
        }
        Object lock = imageLocks[(fileKey.hashCode() & Integer.MAX_VALUE) % imageLocks.length];
        synchronized (lock) {
            synchronized (thumbnailMemory) {
                Cache cached = thumbnailMemory.get(fileKey);
                if (cached != null && cached.expiry > System.currentTimeMillis()) return cached.bytes;
            }
            File disk = new File(thumbnailCache, fileKey + ".jpg");
            if (disk.isFile() && disk.length() > 0 && disk.length() < 1_200_000 &&
                    System.currentTimeMillis() - disk.lastModified() < IMAGE_TTL) {
                try (FileInputStream in = new FileInputStream(disk)) {
                    byte[] bytes = AimogeWriteClient.bounded(in, 1_200_000);
                    rememberImage(fileKey, bytes);
                    return bytes;
                }
            }
            byte[] fresh = encodeImage(source, thumb ? 240 : 960);
            rememberImage(fileKey, fresh);
            if (!thumbnailCache.isDirectory()) thumbnailCache.mkdirs();
            if (thumbnailCache.isDirectory()) {
                File temp = new File(thumbnailCache, fileKey + ".tmp");
                try (FileOutputStream out = new FileOutputStream(temp)) { out.write(fresh); }
                if (disk.exists()) disk.delete();
                if (!temp.renameTo(disk)) temp.delete();
                cleanDiskCache();
            }
            return fresh;
        }
    }

    private static String sha256(String key) throws Exception {
        byte[] b = MessageDigest.getInstance("SHA-256").digest(key.getBytes(StandardCharsets.UTF_8));
        StringBuilder out = new StringBuilder(64);
        for (byte v : b) out.append(String.format(Locale.ROOT, "%02x", v & 255));
        return out.toString();
    }

    private void rememberImage(String id, byte[] bytes) {
        if (bytes.length > MEMORY_IMAGE_LIMIT) return;
        synchronized (thumbnailMemory) {
            Cache old = thumbnailMemory.put(id, new Cache(bytes, System.currentTimeMillis() + IMAGE_TTL));
            if (old != null) thumbnailBytes -= old.bytes.length;
            thumbnailBytes += bytes.length;
            java.util.Iterator<Map.Entry<String, Cache>> it = thumbnailMemory.entrySet().iterator();
            while (thumbnailBytes > MEMORY_IMAGE_LIMIT && it.hasNext()) {
                thumbnailBytes -= it.next().getValue().bytes.length;
                it.remove();
            }
        }
    }

    private void cleanDiskCache() {
        File[] files = thumbnailCache.listFiles((dir, name) -> name.endsWith(".jpg"));
        if (files == null) return;
        long sum = 0;
        for (File file : files) sum += file.length();
        if (sum <= DISK_IMAGE_LIMIT) return;
        java.util.Arrays.sort(files, java.util.Comparator.comparingLong(File::lastModified));
        for (File file : files) {
            if (sum <= DISK_IMAGE_LIMIT) break;
            long bytes = file.length();
            if (file.delete()) sum -= bytes;
        }
    }

    private byte[] encodeImage(String source, int maxDimension) throws Exception {
        byte[] body = fetch(source, 600_000L, 5_000_000);
        Bitmap bitmap = BitmapFactory.decodeByteArray(body, 0, body.length);
        if (bitmap == null) throw new IllegalArgumentException("Not an image");
        try {
            int w = bitmap.getWidth(), h = bitmap.getHeight();
            if (w > maxDimension || h > maxDimension) {
                float ratio = Math.min((float) maxDimension / w, (float) maxDimension / h);
                Bitmap adjusted = Bitmap.createScaledBitmap(bitmap,
                        Math.max(1, Math.round(w * ratio)), Math.max(1, Math.round(h * ratio)), true);
                if (adjusted != bitmap) { bitmap.recycle(); bitmap = adjusted; }
            }
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            if (!bitmap.compress(Bitmap.CompressFormat.JPEG, 83, out))
                throw new IllegalStateException("JPEG encoding failed");
            return out.toByteArray();
        } finally { bitmap.recycle(); }
    }

    private synchronized String remember(String prefix, String source) throws Exception {
        String key = prefix + source;
        byte[] digest = MessageDigest.getInstance("SHA-256").digest(key.getBytes(StandardCharsets.UTF_8));
        long v = 0;
        for (int i = 0; i < 8; i++) v = (v << 8) | (digest[i] & 255L);
        long n = 1_000_000_000_000L + ((v & Long.MAX_VALUE) % 9_000_000_000_000L);
        for (int i = 0; i < 100; i++, n++) {
            String id = Long.toString(n);
            String existing = prefs.getString(prefix + id, null);
            if (existing == null || existing.equals(source)) {
                if (existing == null) prefs.edit().putString(prefix + id, source).commit();
                return id;
            }
        }
        throw new IllegalStateException("Virtual ID collision");
    }

    private static String normalizeImage(String raw) {
        String absolute = raw.startsWith("//") ? "https:" + raw :
                (raw.startsWith("/") ? HOST + raw : raw);
        try {
            URL url = new URL(absolute);
            return "https".equals(url.getProtocol()) && "bbs.animanch.com".equals(url.getHost())
                    ? absolute : null;
        } catch (Exception ex) { return null; }
    }

    private static String form(Map<String,String> values) throws Exception {
        StringBuilder out = new StringBuilder();
        for (Map.Entry<String,String> e : values.entrySet()) {
            if (out.length() > 0) out.append("&");
            out.append(URLEncoder.encode(e.getKey(), "UTF-8")).append("=")
                    .append(URLEncoder.encode(e.getValue(), "UTF-8"));
        }
        return out.toString();
    }

    private static byte[] multipart(String boundary, String name, String mime,
                                    byte[] file, String number, String thread) throws Exception {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        // Match the official #upform DOM/FormData order: file1, upname, thread.
        String safeName = name.replace("\\", "_").replace("\"", "_").replace("\r", "_").replace("\n", "_");
        String header = "--" + boundary + "\r\nContent-Disposition: form-data; name=\"file1\"; filename=\"" +
                safeName + "\"\r\nContent-Type: " + mime + "\r\n\r\n";
        out.write(header.getBytes(StandardCharsets.UTF_8));
        out.write(file);
        out.write("\r\n".getBytes(StandardCharsets.US_ASCII));
        part(out, boundary, "upname", number);
        part(out, boundary, "thread", thread);
        out.write(("--" + boundary + "--\r\n").getBytes(StandardCharsets.US_ASCII));
        return out.toByteArray();
    }

    private static void part(ByteArrayOutputStream out, String boundary, String name, String value) throws Exception {
        String raw = "--" + boundary + "\r\nContent-Disposition: form-data; name=\"" + name +
                "\"\r\n\r\n" + value + "\r\n";
        out.write(raw.getBytes(StandardCharsets.UTF_8));
    }

    private static String plain(String html) {
        try {
            return Html.fromHtml(html.replaceAll("(?i)<br\\s*/?>", "\n"),
                    Html.FROM_HTML_MODE_LEGACY).toString().trim();
        } catch (Exception ex) { return html.replaceAll("<[^>]*>", "").trim(); }
    }

    private static StringBuilder page(String title) {
        return new StringBuilder("<!DOCTYPE html><html><head><meta charset=Shift_JIS>")
                .append("<title>").append(escape(title)).append("</title></head><body>");
    }

    private static String escape(String text) {
        java.nio.charset.CharsetEncoder encoder = SJIS.newEncoder();
        StringBuilder out = new StringBuilder();
        for (int i = 0; i < text.length();) {
            int cp = text.codePointAt(i);
            i += Character.charCount(cp);
            if (cp == '&') out.append("&amp;");
            else if (cp == '<') out.append("&lt;");
            else if (cp == '>') out.append("&gt;");
            else if (cp == '\"') out.append("&quot;");
            else if (cp == '\'') out.append("&#39;");
            else if (cp == '\n') out.append("<br>");
            else if (!encoder.canEncode(new String(Character.toChars(cp))))
                out.append("&#").append(cp).append(";");
            else out.appendCodePoint(cp);
        }
        return out.toString();
    }
}
