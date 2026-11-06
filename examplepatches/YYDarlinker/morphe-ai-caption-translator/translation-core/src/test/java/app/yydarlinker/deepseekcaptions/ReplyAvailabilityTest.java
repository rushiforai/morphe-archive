package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;
import android.content.*;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.*;
import org.json.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.Config;

/** Availability is source-owned: retain exact neighbours, never invent coverage or display JSON. */
@RunWith(RobolectricTestRunner.class) @Config(sdk=28, manifest=Config.NONE)
public class ReplyAvailabilityTest {
    static final CaptionLanguageContext LANGUAGE=CaptionLanguageContext.explicit("en","zh-Hans");
    @Rule public org.junit.rules.TemporaryFolder owned=new org.junit.rules.TemporaryFolder(
            new File(System.getProperty("caption.workspace"),"work/temp"));
    static JSONObject quote(String source,String text) throws Exception {
        return new JSONObject().put("source",source).put("text",text);
    }
    static String reply(RebuildPlanner.Block b,JSONObject... events) throws Exception {
        JSONArray rows=new JSONArray();for(JSONObject event:events)rows.put(event);
        return RebuildContractTest.reply(b,rows);
    }
    static void rejects(String content,RebuildSource s,RebuildPlanner.Block b,String code) throws Exception {
        try {RebuildProtocol.parseBound(content,s,b,LANGUAGE);fail("invalid full reply accepted");}
        catch(RebuildProtocol.Invalid expected){assertEquals(code,expected.code);}
    }
    @Test public void omittedSpeakerPrefixKeepsOriginalRangesInFullAndStreamedReplies() throws Exception {
        for(boolean attached:new boolean[]{false,true}) {
            RebuildSource s=RebuildContractTest.source(attached?"We open early. We close late.":">> We open early. We close late.",500);
            if(attached) {
                List<RebuildSource.Word> words=new ArrayList<>(s.words);RebuildSource.Word first=words.get(0);
                words.set(0,new RebuildSource.Word(">>"+first.text,first.start,first.end,first.cue,first.precision));s=new RebuildSource(words);
            }
            RebuildPlanner.Block b=RebuildContractTest.block(s);
            String raw=reply(b,quote("We open early.","我们很早开门。"),quote("We close late.","我们很晚关门。"));
            for(RebuildProtocol.Plan p:new RebuildProtocol.Plan[]{RebuildProtocol.parseBound(raw,s,b,LANGUAGE),
                    RebuildProtocol.parsePrefix(raw,s,b,LANGUAGE)}) {
                assertFalse(p.partial);assertTrue(p.holes.isEmpty());assertEquals(0,p.events.get(0).from);
                assertEquals(s.words.get(0).start,p.events.get(0).start);
                assertEquals(s.words.get(b.to).end,p.events.get(1).end);
            }
            assertTrue("source speaker boundary is preserved",s.words.get(0).text.startsWith(">>"));
        }
    }
    @Test public void missingBeginningAndMiddleKeepOnlyTheirOwnExplicitHoles() throws Exception {
        RebuildSource s=RebuildContractTest.source("Morning doors open. Noon doors close. Evening lights shine.",500);
        RebuildPlanner.Block b=RebuildContractTest.block(s);
        String middle=reply(b,quote(s.text(0,2),"早上开门。"),quote(s.text(6,8),"晚上亮灯。"));
        String beginning=reply(b,quote(s.text(3,8),"中午关门，晚上亮灯。"));
        for(String raw:new String[]{middle,beginning}) {
            rejects(raw,s,b,"source_quote_mismatch");
            RebuildProtocol.Plan p=RebuildProtocol.parseBestEffort(raw,s,b,LANGUAGE);
            assertTrue(p.partial);assertEquals(1,p.holes.size());
            assertArrayEquals(raw.equals(middle)?new int[]{3,5}:new int[]{0,2},p.holes.get(0));
            for(RebuildProtocol.Event event:p.events){assertEquals(s.words.get(event.from).start,event.start);assertEquals(s.words.get(event.to).end,event.end);}
        }
    }
    @Test public void changedSourceRowDoesNotDiscardItsExactNeighbour() throws Exception {
        RebuildSource s=RebuildContractTest.source("Morning doors open. Evening lights shine.",500);
        RebuildPlanner.Block b=RebuildContractTest.block(s);
        String raw=reply(b,quote("Morning windows close.","早上关窗。"),quote(s.text(3,5),"晚上亮灯。"));
        RebuildProtocol.Plan p=RebuildProtocol.parseBestEffort(raw,s,b,LANGUAGE);
        assertEquals(1,p.events.size());assertEquals(3,p.events.get(0).from);assertEquals("晚上亮灯。",p.events.get(0).text);
        assertArrayEquals(new int[]{0,2},p.holes.get(0));
    }
    @Test public void gapCannotChooseBetweenRepeatedQuotesOrStartInsideAWord() throws Exception {
        RebuildSource s=RebuildContractTest.source("Missing start. Doors open. Doors open.",500);
        RebuildPlanner.Block b=RebuildContractTest.block(s);
        for(String quote:new String[]{"Doors open.","oors open."}) {
            try {RebuildProtocol.parseBestEffort(reply(b,quote(quote,"开门。")),s,b,LANGUAGE);fail("ambiguous range accepted");}
            catch(RebuildProtocol.Invalid expected){assertEquals("source_quote_mismatch",expected.code);}
        }
    }
    @Test public void adjacentRepeatedQuotesRetainTheirSeparateTimes() throws Exception {
        RebuildSource s=RebuildContractTest.source("Mr. Tan. Mr. Tan.",500);RebuildPlanner.Block b=RebuildContractTest.block(s);
        RebuildProtocol.Plan p=RebuildProtocol.parseBound(reply(b,quote(s.text(0,1),"谭先生。"),quote(s.text(2,3),"谭先生。")),s,b,LANGUAGE);
        assertEquals(0,p.events.get(0).from);assertEquals(2,p.events.get(1).from);
        assertEquals(1000,p.events.get(1).start);
    }
    @Test public void closedProtocolTailIsRemovedWithoutLosingTheTranslationAtEveryEntry() throws Exception {
        RebuildSource s=RebuildContractTest.source("Become a God among men.”",500);RebuildPlanner.Block b=RebuildContractTest.block(s);
        String clean="成为人中之神。”",dirty=clean+"}]}。}```json {";
        String raw=reply(b,quote(s.text(0,b.to),dirty));
        for(RebuildProtocol.Plan p:new RebuildProtocol.Plan[]{RebuildProtocol.parseBound(raw,s,b,LANGUAGE),
                RebuildProtocol.parsePrefix(raw,s,b,LANGUAGE),RebuildSalvage.parse(raw,s,b,LANGUAGE)}) {
            assertEquals(clean,p.events.get(0).text);assertTrue(p.holes.isEmpty());
            assertEquals(clean,new JSONObject(p.json).getJSONArray("events").getJSONObject(0).getString("text"));
            assertTrue("clean prefix is still unverified",RebuildReview.score(p.issues)>0);
        }
    }
    @Test public void unboundedOrNonemptyProtocolGarbageOnlyDropsTheAffectedEvent() throws Exception {
        RebuildSource s=RebuildContractTest.source("Morning doors open. Evening lights shine.",500);RebuildPlanner.Block b=RebuildContractTest.block(s);
        for(String dirty:new String[]{"早上开门。```json {", "早上开门。}]}。}```json { 还有正文", "早上开门。 {\"events\": []}"}) {
            String raw=reply(b,quote(s.text(0,2),dirty),quote(s.text(3,5),"晚上亮灯。"));
            rejects(raw,s,b,"protocol_leak");
            try {RebuildProtocol.parsePrefix(raw,s,b,LANGUAGE);fail("bad stream text displayed");}
            catch(RebuildProtocol.Invalid expected){assertEquals("protocol_leak",expected.code);}
            RebuildProtocol.Plan p=RebuildProtocol.parseBestEffort(raw,s,b,LANGUAGE);
            assertEquals(1,p.events.size());assertEquals("晚上亮灯。",p.events.get(0).text);
            assertArrayEquals(new int[]{0,2},p.holes.get(0));
        }
    }
    @Test public void genuineQuotedCodeAndOrdinaryPunctuationRemainVisible() throws Exception {
        String source="The code is ```json {\"events\": []} ``` and then it ends.";
        String text="代码是 ```json {\"events\": []} ```，然后结束。";
        assertEquals(text,RebuildProtocol.eventText(source,text));
        assertEquals("他说：“保留 {花括号}。”",RebuildProtocol.eventText("He said keep the braces.","他说：“保留 {花括号}。”"));
    }
    @Test public void previouslyCachedTailCannotGainCacheAuthorityAndOtherEntriesSurvive() throws Exception {
        RebuildSource s=RebuildContractTest.source("Become a God among men.”",500);RebuildPlanner.Block b=RebuildContractTest.block(s);
        File cache=owned.newFolder("cache");Context context=new ContextWrapper(RuntimeEnvironment.getApplication()) {
            @Override public File getCacheDir(){return cache;}
        };
        File directory=new File(cache,"caption-events-r2.12");assertTrue(directory.mkdirs());
        String clean="成为人中之神。”",raw=reply(b,quote(s.text(0,b.to),clean+"}]}。}```json {"));
        File old=new File(directory,"old-"+b.id()+".json");Files.write(old.toPath(),raw.getBytes(StandardCharsets.UTF_8));
        File other=new File(directory,"other-"+b.id()+".json");byte[] otherBytes=reply(b,quote(s.text(0,b.to),clean)).getBytes(StandardCharsets.UTF_8);Files.write(other.toPath(),otherBytes);
        assertNull(RebuildCache.read(context,"old",s,b,LANGUAGE));
        RebuildProtocol.Plan p=RebuildProtocol.parseBound(raw,s,b,LANGUAGE);assertEquals(clean,p.events.get(0).text);
        assertNull(RebuildCache.prepare(context,"new",s,b,p,LANGUAGE));
        assertNotNull(RebuildCache.read(context,"other",s,b,LANGUAGE));
        assertArrayEquals(otherBytes,Files.readAllBytes(other.toPath()));
    }
    @Test public void spokenCodeInstructionsCannotBeCertifiedAfterSuffixRemoval() throws Exception {
        RebuildSource s=RebuildContractTest.source("Type a closing brace, closing bracket, closing brace, then an empty JSON fence.",500);
        RebuildPlanner.Block b=RebuildContractTest.block(s);
        RebuildProtocol.Plan p=RebuildProtocol.parseBound(reply(b,quote(s.text(0,b.to),"输入 }]} ```json {}")),s,b,LANGUAGE);
        assertTrue("readable prefix is only a best effort",RebuildReview.score(p.issues)>0);
    }
    @Test public void aSourceBraceDoesNotAuthorizeUnrelatedFences() throws Exception {
        assertEquals("打印名字。",RebuildProtocol.eventText("Print {name}.","打印名字。}]}。}```json {"));
        try {RebuildProtocol.eventText("Print {name}.","打印名字。```json { unrelated");fail("unrelated code displayed");}
        catch(RebuildProtocol.Invalid expected){assertEquals("protocol_leak",expected.code);}
    }
    @Test public void mixedFormatsAreRejectedInBothOrdersAndAfterMalformedRows() throws Exception {
        RebuildSource s=RebuildContractTest.source("Morning doors open. Evening lights shine.",500);RebuildPlanner.Block b=RebuildContractTest.block(s);
        JSONObject indexed=quote(s.text(0,2),"早上开门。").put("from",0).put("to",2),quoted=quote(s.text(3,5),"晚上亮灯。");
        for(JSONArray rows:new JSONArray[]{new JSONArray().put(indexed).put(quoted),new JSONArray().put(quoted).put(indexed),
                new JSONArray().put(JSONObject.NULL).put(indexed).put(quoted)}) {
            try {RebuildProtocol.parseBestEffort(RebuildContractTest.reply(b,rows),s,b,LANGUAGE);fail("mixed reply accepted");}
            catch(RebuildProtocol.Invalid expected){assertEquals("source_quote_mismatch",expected.code);}
        }
    }
    @Test public void malformedTextCannotEraseAnEarlierGap() throws Exception {
        RebuildSource s=RebuildContractTest.source("alpha bravo charlie delta",500);RebuildPlanner.Block b=RebuildContractTest.block(s);
        JSONObject malformed=new JSONObject().put("source",s.text(2,2)).put("text",42);
        RebuildProtocol.Plan p=RebuildProtocol.parseBestEffort(reply(b,malformed,quote(s.text(3,3),"最后。")),s,b,LANGUAGE);
        assertEquals(1,p.events.size());assertEquals(3,p.events.get(0).from);assertEquals(1,p.holes.size());
        assertArrayEquals(new int[]{0,2},p.holes.get(0));
    }
    @Test public void rebindingTheSameOrALaterRowCannotEraseCleanupUncertainty() throws Exception {
        for(boolean later:new boolean[]{false,true}) {
            RebuildSource s=RebuildContractTest.source(later?"We open early and close now":"We open now",500);
            RebuildPlanner.Block b=RebuildContractTest.block(s);JSONArray events=new JSONArray();
            if(later) events.put(quote(s.text(0,2),"我们很早开门。}]}。}```json {").put("from",0).put("to",2));
            int first=later?3:0;
            events.put(quote(s.text(first,b.to),later?"现在关门。":"我们现在开门。}]}。}```json {")
                    .put("from",first).put("to",b.to-1));
            String raw=RebuildContractTest.reply(b,events);
            RebuildProtocol.Plan p=RebuildProtocol.parseBound(raw,s,b,LANGUAGE);
            assertTrue("rebinding must really run",p.reboundEvents>0);
            assertTrue("raw cleanup provenance survives every reparse",RebuildReview.score(p.issues)>0);
            File cache=owned.newFolder(later?"later":"same");Context context=new ContextWrapper(RuntimeEnvironment.getApplication()) {
                @Override public File getCacheDir(){return cache;}
            };
            File dir=new File(cache,"caption-events-r2.12");assertTrue(dir.mkdirs());
            Files.write(new File(dir,"dirty-"+b.id()+".json").toPath(),raw.getBytes(StandardCharsets.UTF_8));
            assertNull(RebuildCache.read(context,"dirty",s,b,LANGUAGE));
            assertNull(RebuildCache.prepare(context,"dirty",s,b,p,LANGUAGE));
        }
    }
}
