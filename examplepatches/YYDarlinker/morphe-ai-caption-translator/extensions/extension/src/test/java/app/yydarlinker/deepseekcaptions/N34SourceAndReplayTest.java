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
@RunWith(RobolectricTestRunner.class)
@Config(sdk=28,shadows={RebuildLayoutTest.Geometry.class})
@GraphicsMode(GraphicsMode.Mode.NATIVE) @LooperMode(LooperMode.Mode.PAUSED)
public class N34SourceAndReplayTest {
  RebuildLayoutTest h;
  @Before public void setup(){h=new RebuildLayoutTest();h.setup();RebuildLayoutTest.bounds=new android.graphics.Rect(0,0,1264,700);CaptionOverlay.showCaption("Ready.");}
  @After public void done(){h.done();}
  RebuildSource read(String content)throws Exception {byte[] bytes=content.getBytes(StandardCharsets.UTF_8);return RebuildSource.read(bytes,CaptionDocument.parse(bytes,"text/vtt"));}
  byte[] input(String kind,String format)throws Exception{
    String fixture="/n30/"+kind.replace("_en","")+"."+format;
    try(java.io.InputStream in=getClass().getResourceAsStream(fixture)) {
      assertNotNull("tracked original input "+fixture,in);return in.readAllBytes();
    }
  }
  RebuildSource inputSource(String kind,String format)throws Exception {byte[] bytes=input(kind,format);return RebuildSource.read(bytes,CaptionDocument.parse(bytes,"text/plain"));}
  JSONArray words(RebuildSource source)throws Exception {
    JSONArray rows=new JSONArray();for(int i=0;i<source.words.size();i++){RebuildSource.Word w=source.words.get(i);
      rows.put(new JSONArray().put(i).put(w.text).put(w.start).put(w.end).put(w.cue).put(w.precision));}return rows;
  }
  void sameSource(RebuildSource a,RebuildSource b)throws Exception {assertEquals(words(a).toString(),words(b).toString());assertEquals(a.coarseCueCount,b.coarseCueCount);}
  void validateAlignment(RebuildSource before,RebuildSource after)throws Exception {
    assertEquals(before.words.size(),after.words.size());assertEquals(before.text(0,before.words.size()-1),after.text(0,after.words.size()-1));
    for(int i=0;i<before.words.size();i++) {
      RebuildSource.Word a=before.words.get(i),b=after.words.get(i);assertEquals(a.text,b.text);assertEquals(a.cue,b.cue);assertTrue(b.start<b.end);
      if(i>0){assertTrue(after.words.get(i-1).end<=b.start);assertEquals(RebuildPlanner.hardBreakBefore(before,i),RebuildPlanner.hardBreakBefore(after,i));}
      if(a.precision!=RebuildSource.Precision.ESTIMATED)assertSame(a,b);
    }
  }
  @Test public void actualManualFormatsKeepCueWordPlannerPayloadAndCacheIdentityAcrossFourteenTargets()throws Exception {
    byte[] json=input("manual_en","json3"),vtt=input("manual_en","vtt");
    CaptionDocument.Parsed jd=CaptionDocument.parse(json,"json3"),vd=CaptionDocument.parse(vtt,"text/vtt");assertEquals(169,jd.cues().size());assertEquals(169,vd.cues().size());
    for(int i=0;i<169;i++){CaptionDocument.Cue a=jd.cues().get(i),b=vd.cues().get(i);assertEquals(a.startMs,b.startMs);assertEquals(a.endMs,b.endMs);assertEquals(a.text.replaceAll("\\s+"," "),b.text.replaceAll("\\s+"," "));}
    RebuildSource a=inputSource("manual_en","json3"),b=inputSource("manual_en","vtt"),ref=inputSource("auto_en","json3");sameSource(a,b);assertEquals(1224,a.words.size());
    sameSource(a.align(ref),b.align(ref));JSONArray rows=new JSONArray();DeepSeekConfig.Snapshot cfg=DeepSeekConfig.load(h.a);
    for(String target:N34OwnedDisplayTest.TARGETS) {
      CaptionLanguageContext context=CaptionLanguageContext.explicit("en",target);
      List<RebuildPlanner.Block> left=RebuildPlanner.plan(a,context),right=RebuildPlanner.plan(b,context);assertEquals(left.size(),right.size());
      for(int i=0;i<left.size();i++){assertEquals(left.get(i).id(),right.get(i).id());assertEquals(RebuildProtocol.payload(a,left.get(i),target,"",context).toString(),RebuildProtocol.payload(b,right.get(i),target,"",context).toString());}
      assertEquals(RebuildCache.identity(a,cfg,target,context),RebuildCache.identity(b,cfg,target,context));
      rows.put(new JSONObject().put("target",target).put("cues",169).put("words",1224).put("blocks",left.size()).put("cache_identity",RebuildCache.identity(a,cfg,target,context)));
    }
    N34OwnedDisplayTest.save("manual-format-parity",rows);
  }
  @Test public void suppliedReferenceAppliesOnlySafeSegmentsAndKeepsAllSourceHardBoundaries()throws Exception {
    RebuildSource source=inputSource("manual_en","json3"),ref=inputSource("auto_en","json3");List<String> evidence=new ArrayList<>();
    RebuildSource aligned=source.align(ref,evidence::add);validateAlignment(source,aligned);long changed=aligned.words.stream().filter(w->w.precision==RebuildSource.Precision.ALIGNED).count();assertTrue(changed>0);
    DeepSeekConfig.Snapshot cfg=DeepSeekConfig.load(h.a);assertNotEquals(RebuildCache.identity(source,cfg,"en"),RebuildCache.identity(aligned,cfg,"en"));sameSource(aligned,source.align(ref));assertSame(source,source.align(null));
    N34OwnedDisplayTest.save("supplied-local-alignment",new JSONObject().put("before",words(source)).put("reference",words(ref)).put("after",words(aligned)).put("evidence",evidence).put("aligned_words",changed).put("not_runtime_reference_payload",true));
  }
  @Test public void independentSafeRunsSurviveMiddleConflictAndNativeSourceIsNeverReplaced()throws Exception {
    List<RebuildSource.Word> a=new ArrayList<>(),r=new ArrayList<>();
    for(int i=0;i<24;i++) {
      a.add(new RebuildSource.Word("unique"+i,i*200,i*200+200,i/6,RebuildSource.Precision.ESTIMATED));
      r.add(new RebuildSource.Word("unique"+i,i*200+(i>=12&&i<18?-200:20),i*200+(i>=12&&i<18?-20:180),i/6,
          (i>=6&&i<12 || i==18)?RebuildSource.Precision.ESTIMATED:RebuildSource.Precision.NATIVE));
    }
    RebuildSource source=new RebuildSource(a);List<String> reason=new ArrayList<>();RebuildSource aligned=source.align(new RebuildSource(r),reason::add);validateAlignment(source,aligned);
    assertEquals(RebuildSource.Precision.ALIGNED,aligned.words.get(0).precision);assertEquals(RebuildSource.Precision.ALIGNED,aligned.words.get(23).precision);
    assertSame(a.get(12),aligned.words.get(12));assertTrue(reason.toString().contains("adopted_segments=2"));assertTrue(reason.toString().contains("segment_time_or_boundary_conflict"));
    List<RebuildSource.Word> nativeWords=new ArrayList<>();for(RebuildSource.Word w:a)nativeWords.add(new RebuildSource.Word(w.text,w.start,w.end,w.cue,RebuildSource.Precision.NATIVE));
    RebuildSource nativeSource=new RebuildSource(nativeWords);assertSame(nativeSource,nativeSource.align(new RebuildSource(r)));
    assertSame(source,source.align(RebuildContractTest.source("other language text",1000)));
    RebuildSource repeats=RebuildContractTest.source("very very very very very very very very",1000);assertSame(repeats,repeats.align(repeats));
    N34OwnedDisplayTest.save("independent-local-segments",new JSONObject().put("before",words(source)).put("after",words(aligned)).put("evidence",reason));
  }
  @Test public void ordinaryManualRepeatsEntitiesAndLiteralComparisonsAreNotGloballyDeleted()throws Exception {
    RebuildSource repeat=read("WEBVTT\n\n00:00:01.000 --> 00:00:02.000\nvery very.\n\n00:00:02.000 --> 00:00:03.000\nvery very.\n");assertEquals(4,repeat.words.size());assertTrue(repeat.words.stream().allMatch(w->w.precision==RebuildSource.Precision.ESTIMATED));
    String content="WEBVTT\n\ncue-id\n00:00:01.000 --> 00:00:02.000 align:start\n<v Alice><c.green>Hello</c> &amp; &lt;3&gt; <ruby>漢<rt>kan</rt></ruby> &#x1f600;\n\n00:00:02.000 --> 00:00:03.000\n<v Bob>World.\n";
    RebuildSource source=read(content);String text=source.text(0,source.words.size()-1);assertFalse(text.contains("Alice"));assertFalse(text.contains("kan"));assertFalse(text.contains("<c"));assertTrue(text,text.replace(" ","").contains("<3>"));assertTrue(source.words.stream().anyMatch(w->w.text.startsWith(">>")));
    try{read("WEBVTT\n\n00:00:01.000 --> 00:00:02.000\na<00:00:00.500><c> b</c>");fail("invalid word time must fail explicitly");}catch(IllegalArgumentException expected){assertTrue(expected.getMessage().startsWith("vtt_"));}
    try{read("WEBVTT\n\n00:00:01.000 --> 00:00:02.000\n<unknown>literal");fail("unsupported tag must not silently truncate");}catch(IllegalArgumentException expected){assertEquals("vtt_tag_unsupported",expected.getMessage());}
  }
  @Test public void onlyProvenRollingCarryIsRemovedAndSpokenVeryVerySurvives()throws Exception {
    String a="00:00:01.000 --> 00:00:02.000 align:start position:0%\nvery<00:00:01.400><c> very.</c>\n\n";
    String snapshot="00:00:02.000 --> 00:00:02.010 align:start position:0%\nvery very.\n\n";
    String next="00:00:02.010 --> 00:00:03.000 align:start position:0%\nvery very.\nagain<00:00:02.300><c> here.</c>\n";
    RebuildSource source=read("WEBVTT\n\n"+a+snapshot+next);assertEquals("very very. again here.",source.text(0,source.words.size()-1));assertEquals(4,source.words.size());assertTrue(source.formatEvidence.contains("vtt_carry_lines=1"));assertTrue(source.formatEvidence.contains("vtt_display_snapshots=1"));
    RebuildSource unproven=read("WEBVTT\n\n"+a+snapshot);assertEquals(4,unproven.words.size());assertTrue(unproven.formatEvidence.contains("carry_unproven=1"));
    RebuildSource actual=inputSource("auto_en","vtt");WebVttSourceReader.Result decoded=WebVttSourceReader.read(new String(input("auto_en","vtt"),StandardCharsets.UTF_8));
    int expectedTokens=0;JSONArray coverage=new JSONArray();
    for(WebVttSourceReader.Range range:decoded.ranges) {
      expectedTokens+=RebuildSource.tokens(range.text.replace('\u00a0',' ')).size();coverage.put(new JSONObject().put("cue",range.cue).put("text",range.text).put("start",range.start).put("end",range.end).put("native_onset",range.nativeStart));
    }
    assertEquals(expectedTokens,actual.words.size());assertTrue(decoded.carryLines>0);assertTrue(decoded.snapshots>0);
    for(RebuildSource.Word w:actual.words){assertFalse(w.text,w.text.matches(".*[0-9]{2}:[0-9]{2}:[0-9]{2}.*"));assertFalse(w.text,w.text.contains("</c")||w.text.contains("<c>"));}
    N34OwnedDisplayTest.save("auto-vtt-structured-coverage",new JSONObject().put("words",words(actual)).put("payload_ranges",coverage).put("evidence",decoded.evidence()).put("no_word_count_equality_claim_to_other_payload",true));
  }
  @Test public void allOriginalResponsesKeepQuoteRejectionAndLayoutOnlyCannotBuyRepair()throws Exception {
    RebuildSource source=inputSource("manual_en","json3");JSONObject fixture=N34OwnedDisplayTest.fixtures();JSONArray rows=new JSONArray();int accepted=0,rejected=0;
    Set<String> first=new HashSet<>();Set<Integer> pure=new HashSet<>(Arrays.asList(2,4,5,11,12));int removed=0;
    for(String group:new String[]{"newQuality","oldQuality"}) {
      JSONArray records=fixture.getJSONArray(group);
      for(int i=0;i<records.length();i++) {
        JSONObject record=records.getJSONObject(i),payload=new JSONObject(record.getString("source"));String[] parts=payload.getString("block").substring(1).split("_");
        RebuildPlanner.Block block=new RebuildPlanner.Block(Integer.parseInt(parts[0]),Integer.parseInt(parts[1]),Integer.parseInt(parts[2]),source);
        String target=payload.getString("language");CaptionLanguageContext context=CaptionLanguageContext.explicit("en",target);JSONObject row=new JSONObject().put("group",group).put("request",record.getInt("request")).put("block",block.index).put("target",target);
        try {
          RebuildProtocol.Plan parsed=RebuildProtocol.parseBound(record.getString("response"),source,block,context);
          RebuildProtocol.Plan reviewed=RebuildReview.withLayoutReview(parsed,CaptionOverlay.budget(),context);
          boolean repair=RebuildReview.shouldRepair(reviewed,1,0,0,block.end);
          assertTrue(reviewed.issues.stream().filter(issue->issue.code.equals("layout_overflow")).noneMatch(issue->issue.repair));
          if(group.equals("newQuality")) {
            accepted++;if(target.equals("zh-Hans") && first.add(target+":"+block.index) && pure.contains(block.index)){assertFalse("pure layout block "+block.index,repair);removed++;}
          }
          row.put("accepted",true).put("semantic_or_fragmentary_repair",repair).put("events",parsed.events.size());
        } catch(RebuildProtocol.Invalid bad) {
          assertEquals(group,"newQuality");assertEquals(39,record.getInt("request"));assertTrue(bad.getMessage().startsWith("source_quote_mismatch"));rejected++;row.put("accepted",false).put("reason",bad.getMessage());
        }
        rows.put(row);
      }
    }
    assertEquals(49,accepted);assertEquals(1,rejected);assertEquals(5,removed);
    N34OwnedDisplayTest.save("diagnostic-response-replay",new JSONObject().put("new_accepted",accepted).put("new_rejected",rejected).put("pure_layout_first_repairs_removed",removed).put("records",rows));
  }
  @Test public void multiVoiceWithinOneCuePreservesBothTextsAndHardSpeakerBoundary()throws Exception {
    RebuildSource source=read("WEBVTT\n\n00:00:01.000 --> 00:00:03.000\n<v Alice>Hello</v><v Bob>World.</v>\n");
    assertEquals(2,source.words.size());assertEquals("Hello",source.words.get(0).text);assertEquals(">>World.",source.words.get(1).text);
    assertTrue(RebuildPlanner.hardBreakBefore(source,1));assertEquals(RebuildSource.Precision.ESTIMATED,source.words.get(1).precision);
    assertTrue(source.words.get(0).end<=source.words.get(1).start);
  }
  @Test public void changedTimingGetsIndependentColdHotCacheAndCannotReadOrRemoveOldIdentity()throws Exception {
    RebuildSource source=inputSource("manual_en","json3"),aligned=source.align(inputSource("auto_en","json3"));
    CaptionLanguageContext context=CaptionLanguageContext.explicit("en","en");DeepSeekConfig.Snapshot cfg=DeepSeekConfig.load(h.a);
    String oldKey=RebuildCache.identity(source,cfg,"en",context),newKey=RebuildCache.identity(aligned,cfg,"en",context);assertNotEquals(oldKey,newKey);
    RebuildPlanner.Block oldBlock=RebuildPlanner.plan(source,context).get(0),newBlock=RebuildPlanner.plan(aligned,context).get(0);
    JSONObject oldReply=new JSONObject().put("block",oldBlock.id()).put("events",new JSONArray().put(new JSONObject().put("from",oldBlock.from).put("to",oldBlock.to).put("source",source.text(oldBlock.from,oldBlock.to)).put("text",source.text(oldBlock.from,oldBlock.to))));
    RebuildProtocol.Plan oldPlan=RebuildProtocol.parseBound(oldReply.toString(),source,oldBlock,context);
    assertTrue(RebuildCache.write(h.a,oldKey,source,oldBlock,oldPlan,context));assertNotNull(RebuildCache.read(h.a,oldKey,source,oldBlock,context));
    java.io.File oldFile=new java.io.File(RebuildCache.directory(h.a),oldKey+"-"+oldBlock.id()+".json");byte[] oldBytes=Files.readAllBytes(oldFile.toPath());
    assertNull(RebuildCache.read(h.a,newKey,aligned,newBlock,context));assertArrayEquals(oldBytes,Files.readAllBytes(oldFile.toPath()));
    JSONObject newReply=new JSONObject().put("block",newBlock.id()).put("events",new JSONArray().put(new JSONObject().put("from",newBlock.from).put("to",newBlock.to).put("source",aligned.text(newBlock.from,newBlock.to)).put("text",aligned.text(newBlock.from,newBlock.to))));
    RebuildProtocol.Plan newPlan=RebuildProtocol.parseBound(newReply.toString(),aligned,newBlock,context);
    assertTrue(RebuildCache.write(h.a,newKey,aligned,newBlock,newPlan,context));assertEquals(newPlan.json,RebuildCache.read(h.a,newKey,aligned,newBlock,context).json);assertArrayEquals(oldBytes,Files.readAllBytes(oldFile.toPath()));
    N34OwnedDisplayTest.save("source-time-cache-cold-hot",new JSONObject().put("old_key",oldKey).put("new_key",newKey).put("old_file_unchanged",true).put("new_cold_miss",true).put("new_hot_hit",true));
  }

}
