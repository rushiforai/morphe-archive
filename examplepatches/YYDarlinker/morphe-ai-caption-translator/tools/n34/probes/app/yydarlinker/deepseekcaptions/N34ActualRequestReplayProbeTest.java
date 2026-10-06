package app.yydarlinker.deepseekcaptions;
import static org.junit.Assert.*;
import java.nio.file.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import org.json.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;
import okhttp3.mockwebserver.*;
@RunWith(RobolectricTestRunner.class)
@Config(sdk=28,shadows={RebuildLayoutTest.Geometry.class})
@GraphicsMode(GraphicsMode.Mode.NATIVE) @LooperMode(LooperMode.Mode.PAUSED)
public class N34ActualRequestReplayProbeTest {
 @Test public void loopbackOnlyEightyTwoOriginalResponsesKeepActualPromptQuotesAndBoundedRepair()throws Exception {
  RebuildLayoutTest h=new RebuildLayoutTest();h.setup();
  try(MockWebServer server=new MockWebServer()) {
   server.start(java.net.InetAddress.getByName("127.0.0.1"),0);
   DeepSeekConfig.Snapshot cfg=new DeepSeekConfig.Snapshot(true,server.url("/v1").toString(),"n34-local-model",
       DeepSeekConfig.defaultPrompt(h.a),2,85,"n34-loopback-fixture-key","program_default");RebuildApi.reset();
   RebuildLayoutTest.bounds=new android.graphics.Rect(0,0,1264,700);CaptionOverlay.showCaption("Current.");
   Path manual=Path.of("D:/下载/.deno/bin/manual_en/The Truth About the Bezelless Concept Phone [ngPkbaZliaU].en.json3");
   byte[] body=Files.readAllBytes(manual);RebuildSource source=RebuildSource.read(body,CaptionDocument.parse(body,"application/json"));
   JSONObject fixture=N34OwnedDisplayTest.fixtures();JSONArray rows=new JSONArray();int calls=0,accepted=0,rejected=0;Set<Integer> pure=new HashSet<>(Arrays.asList(2,4,5,11,12));Set<String> first=new HashSet<>();int removed=0;
   for(String group:new String[]{"newQuality","oldQuality"}) {
    JSONArray records=fixture.getJSONArray(group);
    for(int i=0;i<records.length();i++) {
     JSONObject record=records.getJSONObject(i),capturedPayload=new JSONObject(record.getString("source"));
     String[] ids=capturedPayload.getString("block").substring(1).split("_");String target=capturedPayload.getString("language");
     RebuildPlanner.Block block=new RebuildPlanner.Block(Integer.parseInt(ids[0]),Integer.parseInt(ids[1]),Integer.parseInt(ids[2]),source);CaptionLanguageContext context=CaptionLanguageContext.explicit("en",target);
     JSONObject response=new JSONObject().put("choices",new JSONArray().put(new JSONObject().put("finish_reason","stop").put("message",new JSONObject().put("content",record.getString("response")))));
     server.enqueue(new MockResponse().setHeader("Content-Type","application/json").setBody(response.toString()));
     JSONObject row=new JSONObject().put("group",group).put("request",record.getInt("request")).put("target",target).put("block",block.id());
     try {
      RebuildProtocol.Plan plan=RebuildApi.translate(source,block,cfg,target,null,true,"",context);accepted++;row.put("accepted",true);
      RebuildProtocol.Plan reviewed=RebuildReview.withLayoutReview(plan,CaptionOverlay.budget(),context);boolean repair=RebuildReview.shouldRepair(reviewed,1,0,0,block.end);row.put("semantic_or_fragmentary_repair",repair);
      if(group.equals("newQuality") && target.equals("zh-Hans") && first.add(target+":"+block.index) && pure.contains(block.index)){assertFalse("pure-layout request cannot buy repair",repair);removed++;}
     }catch(RebuildProtocol.Invalid failure){assertEquals("newQuality",group);assertEquals(39,record.getInt("request"));assertEquals("source_quote_mismatch",failure.getMessage());row.put("accepted",false).put("reason",failure.getMessage());rejected++;}
     RecordedRequest request=server.takeRequest(5,java.util.concurrent.TimeUnit.SECONDS);assertNotNull(request);JSONObject actual=new JSONObject(request.getBody().readUtf8());
     assertEquals("POST",request.getMethod());assertEquals("/v1/chat/completions",request.getPath());
     JSONArray messages=actual.getJSONArray("messages");String apiPrompt=RebuildApi.prompt(cfg,target,context);
     String expectedSystem=ProviderRequestPolicy.request(cfg,apiPrompt,RebuildProtocol.payload(source,block,target,"",context),1000)
         .getJSONArray("messages").getJSONObject(0).getString("content");
     assertEquals(expectedSystem,messages.getJSONObject(0).getString("content"));
     JSONObject sent=new JSONObject(messages.getJSONObject(1).getString("content"));
     assertEquals(capturedPayload.getString("source_text"),sent.getString("source_text"));assertEquals(capturedPayload.getJSONArray("owned_tokens").toString(),sent.getJSONArray("owned_tokens").toString());
     assertEquals(capturedPayload.getJSONArray("source_breaks_before").toString(),sent.getJSONArray("source_breaks_before").toString());
     row.put("api_prompt_hash",RebuildCache.hash(apiPrompt)).put("actual_system_message_hash",RebuildCache.hash(messages.getJSONObject(0).getString("content"))).put("actual_request_json",actual);rows.put(row);calls++;
    }
   }
   assertEquals(82,calls);assertEquals(81,accepted);assertEquals(1,rejected);assertEquals(82,server.getRequestCount());assertEquals(5,removed);
   Files.write(Path.of(System.getProperty("scheduler.output"),"loopback-original-response-replay.json"),new JSONObject().put("source",manual.toString()).put("calls",calls).put("accepted",accepted).put("rejected",rejected).put("pure_layout_repairs_removed",removed).put("remote_calls",0).put("rows",rows).toString(2).getBytes(StandardCharsets.UTF_8));
  }finally{h.done();}
 }
 @Test public void maliciousLongWeakSeamsKeepWholeTextOrExplicitHardRefusalWithoutUnboundedTimerOrTruncation()throws Exception {
  JSONArray rows=new JSONArray();
  for(String target:new String[]{"en","zh-Hans"}) {
   String text=target.equals("en")?String.join(" ",Collections.nCopies(220,"ordinary")):String.join("",Collections.nCopies(700,"字"));
   CaptionRenderSpec spec=CaptionLanguageContext.explicit("en",target).renderSpec;CaptionOverlay.LayoutBudget budget=new CaptionOverlay.LayoutBudget(420,40);
   long began=System.nanoTime();List<RebuildPageLayout.Page> pages=RebuildPageLayout.plan(text,100,9100,budget,spec);long nanos=System.nanoTime()-began;
   if(!pages.isEmpty())assertEquals(text,pages.stream().map(p->p.text).collect(java.util.stream.Collectors.joining()));
   else assertFalse(spec.fits(text,40,420,2));
   rows.put(new JSONObject().put("target",target).put("chars",text.length()).put("duration",9000).put("pages",pages.size()).put("elapsed_ms",nanos/1000000.0).put("whole_input_retained",true).put("no_arbitrary_latency_allowance",true));
  }
  Files.write(Path.of(System.getProperty("scheduler.output"),"long-weak-seams-stress.json"),rows.toString(2).getBytes(StandardCharsets.UTF_8));
 }
 @Test public void measurementMemoRetainsExactPageDecisionsAcrossScriptsAndPhysicalCapacity()throws Exception {
  JSONArray rows=new JSONArray();int cases=0;
  for(String[] sample:N29SemanticPagerTest.SAMPLES)for(int width:new int[]{200,420,800})for(long duration:new long[]{600,2399,3601,9000}) {
   CaptionRenderSpec spec=CaptionLanguageContext.explicit("en",sample[0]).renderSpec;CaptionOverlay.LayoutBudget budget=new CaptionOverlay.LayoutBudget(width,40);
   String text=sample[1]+" "+sample[1];
   List<RebuildPageLayout.Page> before=N34BeforeMeasurementMemoPagerFixture.plan(text,100,100+duration,budget,spec);
   List<RebuildPageLayout.Page> after=CaptionLanguagePager.plan(text,100,100+duration,budget,spec);
   assertEquals(N28CGeometryTest.pageRows(before).toString(),N28CGeometryTest.pageRows(after).toString());cases++;
  }
  Files.write(Path.of(System.getProperty("scheduler.output"),"measurement-memo-equivalence.json"),new JSONObject().put("cases",cases).put("exact_text_start_end_differences",0).put("memo_only",true).toString(2).getBytes(StandardCharsets.UTF_8));
 }
 @Test public void capturedMergedTailWithLessThanTwelveHundredRemainingKeepsOnlyCurrentPrimary()throws Exception {
  RebuildLayoutTest h=new RebuildLayoutTest();h.setup();try {
   byte[] bytes=Files.readAllBytes(Path.of("D:/下载/.deno/bin/manual_en/The Truth About the Bezelless Concept Phone [ngPkbaZliaU].en.json3"));
   RebuildSource source=RebuildSource.read(bytes,CaptionDocument.parse(bytes,"application/json"));
   RebuildProtocol.Event left=new RebuildProtocol.Event(261,268,79905,82399,"就像，这就是……这就是高端手机的样子……");
   RebuildProtocol.Event right=new RebuildProtocol.Event(269,271,82399,83269,"大家现在看看。");
   RebuildDisplayMerge.Merged candidate=RebuildDisplayMerge.merge(source,left,right);assertNotNull(candidate);
   RebuildLayoutTest.bounds=new android.graphics.Rect(0,0,1264,700);CaptionOverlay.showEvent(right.text,()->true,()->"","captured-merge-tail",right.start,right.end,82402,CaptionLanguageContext.explicit("en","zh-Hans").renderSpec,candidate);
   assertEquals(right.text,h.text().getText().toString());assertEquals(android.view.View.VISIBLE,h.anchor().getVisibility());
   CaptionOverlay.position(right.end);assertEquals(android.view.View.GONE,h.anchor().getVisibility());
   Files.write(Path.of(System.getProperty("scheduler.output"),"captured-merge-primary.json"),new JSONObject().put("position",82402).put("primary",right.text).put("candidate",candidate.text).put("remaining_media_ms",right.end-82402).put("decision","merge_rejected_keep_primary").put("no_union_duration_sum",true).toString(2).getBytes(StandardCharsets.UTF_8));
  }finally{h.done();}
 }

 @Test public void hardCapacityClockUpdatesDoNotRecalculateUnchangedFailureEveryEightyMilliseconds()throws Exception {
  RebuildLayoutTest h=new RebuildLayoutTest();h.setup();try {
   String text=String.join(" ",Collections.nCopies(60,"unchanged"));
   CaptionOverlay.showEvent(text,()->true,()->"","hard-clock",100,1300,100,CaptionLanguageContext.explicit("en","en").renderSpec);
   assertEquals(android.view.View.GONE,h.anchor().getVisibility());long before=CaptionRenderSpec.layoutCalls,plans=CaptionOverlay.planningCalls;
   for(int i=1;i<14;i++)CaptionOverlay.position(100+i*80);
   assertEquals(before,CaptionRenderSpec.layoutCalls);assertEquals(plans,CaptionOverlay.planningCalls);assertEquals(android.view.View.GONE,h.anchor().getVisibility());
   Files.write(Path.of(System.getProperty("scheduler.output"),"hard-capacity-clock-reuse.json"),new JSONObject().put("position_updates",13).put("additional_layouts",CaptionRenderSpec.layoutCalls-before).put("additional_plans",CaptionOverlay.planningCalls-plans).put("visible",false).toString(2).getBytes(StandardCharsets.UTF_8));
  }finally{h.done();}
 }

 @Test public void explicitNonSpeechManualCueKeepsItsSourceOwnershipAndDoesNotBecomeAFormatFailure()throws Exception {
  byte[] json=new JSONObject().put("events",new JSONArray().put(new JSONObject().put("tStartMs",1000).put("dDurationMs",1000)
      .put("segs",new JSONArray().put(new JSONObject().put("utf8","[music]"))))).toString().getBytes(StandardCharsets.UTF_8);
  byte[] vtt="WEBVTT\n\n00:00:01.000 --> 00:00:02.000\n[music]\n".getBytes(StandardCharsets.UTF_8);
  RebuildSource left=RebuildSource.read(json,CaptionDocument.parse(json,"application/json"));
  RebuildSource right=RebuildSource.read(vtt,CaptionDocument.parse(vtt,"text/vtt"));
  assertEquals(left.words.size(),right.words.size());assertEquals(left.text(0,left.words.size()-1),right.text(0,right.words.size()-1));
  assertTrue(RebuildSource.nonSpeech(right.text(0,right.words.size()-1)));
  for(int i=0;i<left.words.size();i++){assertEquals(left.words.get(i).start,right.words.get(i).start);assertEquals(left.words.get(i).end,right.words.get(i).end);assertEquals(left.words.get(i).precision,right.words.get(i).precision);}
  RebuildPlanner.Block block=RebuildContractTest.block(right);
  JSONObject reply=new JSONObject().put("block",block.id()).put("events",new JSONArray().put(new JSONObject().put("from",block.from).put("to",block.to).put("source",right.text(block.from,block.to)).put("text","")));
  RebuildProtocol.Plan plan=RebuildProtocol.parseBound(reply.toString(),right,block);assertEquals("",plan.events.get(0).text);
  Files.write(Path.of(System.getProperty("scheduler.output"),"nonspeech-format-owned-parity.json"),new JSONObject().put("source","[music]").put("words",right.words.size()).put("source_empty_error",false).put("valid_empty_translation",true).toString(2).getBytes(StandardCharsets.UTF_8));
 }

}
