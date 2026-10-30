package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;
import org.json.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import okhttp3.mockwebserver.*;

/** Quotes define source ranges locally; legacy conflicting IDs never gain inferred coverage. */
@RunWith(RobolectricTestRunner.class) @Config(sdk=28, manifest=Config.NONE)
public class QuotedSourceContractTest {
    private static final CaptionLanguageContext LANGUAGE = CaptionLanguageContext.explicit("en", "zh-Hans");
    static JSONObject quote(RebuildSource s, int from, int to, String text) throws Exception {
        return new JSONObject().put("source", s.text(from,to)).put("text",text);
    }
    @Test public void orderedQuotesDeriveIdsAndTimesWithoutModelArithmetic() throws Exception {
        RebuildSource s = RebuildContractTest.source("We open early and we close late",500);
        RebuildPlanner.Block b = RebuildContractTest.block(s);
        JSONArray events = new JSONArray().put(quote(s,0,2,"我们很早开放，"))
                .put(quote(s,3,6,"也很晚关门。"));
        RebuildProtocol.Plan p = RebuildProtocol.parseBound(RebuildContractTest.reply(b,events),s,b,LANGUAGE);
        assertEquals(2,p.events.size()); assertEquals(0,p.events.get(0).from);
        assertEquals(2,p.events.get(0).to); assertEquals(3,p.events.get(1).from);
        assertEquals(6,p.events.get(1).to); assertEquals(1500,p.events.get(1).start);
        assertEquals(3500,p.events.get(1).end); assertFalse(p.partial);
        JSONObject schema=RebuildProtocol.schema().getJSONObject("json_schema").getJSONObject("schema")
                .getJSONObject("properties").getJSONObject("events").getJSONObject("items");
        assertEquals(2,schema.getJSONArray("required").length());
        assertFalse(schema.getJSONObject("properties").has("from"));
    }
    @Test public void streamedQuotePrefixAndMissingTailKeepTheirOriginalOwnership() throws Exception {
        RebuildSource s=RebuildContractTest.source("We open early and the library closes later tonight",500);
        RebuildPlanner.Block b=RebuildContractTest.block(s);
        String reply=RebuildContractTest.reply(b,new JSONArray().put(quote(s,0,2,"我们很早开放。")));
        RebuildProtocol.Plan prefix=RebuildProtocol.parsePrefix(reply,s,b,LANGUAGE);
        assertEquals(2,prefix.events.get(0).to);
        RebuildProtocol.Plan partial=RebuildProtocol.parseBestEffort(reply,s,b,LANGUAGE);
        assertTrue(partial.partial); assertArrayEquals(new int[]{3,b.to},partial.holes.get(0));
        assertEquals(1500,partial.events.get(0).end);
    }
    @Test public void alteredQuotesMixedFormatsAndLegacyOverclaimsAreStillRejected() throws Exception {
        RebuildSource s=RebuildContractTest.source("We open early and the library closes later tonight",500);
        RebuildPlanner.Block b=RebuildContractTest.block(s);
        for(JSONArray es:new JSONArray[]{
                new JSONArray().put(new JSONObject().put("source","We open tomorrow").put("text","明天开放")),
                new JSONArray().put(quote(s,0,2,"很早开放")).put(quote(s,0,2,"重复")),
                new JSONArray().put(quote(s,0,2,"很早开放")).put(quote(s,3,b.to,"图书馆很晚关门").put("from",3).put("to",b.to))}) {
            try {RebuildProtocol.parseBestEffort(RebuildContractTest.reply(b,es),s,b,LANGUAGE); fail("ambiguous source accepted");}
            catch(RebuildProtocol.Invalid expected) {assertEquals("source_quote_mismatch",expected.code);}
        }
        String legacy=RebuildContractTest.reply(b,new JSONArray().put(quote(s,0,b.to,"我们很早开放。").put("from",0).put("to",2)));
        assertTrue(RebuildProtocol.parseBestEffort(legacy,s,b,LANGUAGE).events.isEmpty());
    }
    @Test public void actualHttpEntryConsumesSourceOnlyReplyWithoutRepairRequests() throws Exception {
        try(MockWebServer server=new MockWebServer()) {
            server.start();
            RebuildSource s=RebuildContractTest.source("We open early and close late",500);
            RebuildPlanner.Block b=RebuildContractTest.block(s);
            String content=RebuildContractTest.reply(b,new JSONArray().put(quote(s,0,b.to,"我们很早开放，也很晚关门。")));
            server.enqueue(new MockResponse().setBody(new JSONObject().put("choices",new JSONArray().put(
                    new JSONObject().put("finish_reason","stop").put("message",new JSONObject().put("content",content)))).toString()));
            TranslationSettings cfg=new TranslationSettings(true,server.url("/v1").toString(),"fixture","faithful","fixture-key","stored_custom");
            RebuildProtocol.Plan p=RebuildApi.translate(s,b,cfg,"zh-Hans",null,false,"",LANGUAGE);
            assertFalse(p.partial); assertEquals(b.to,p.events.get(0).to); assertEquals(1,server.getRequestCount());
            JSONObject request=new JSONObject(server.takeRequest().getBody().readUtf8());
            String prompt=request.getJSONArray("messages").getJSONObject(0).getString("content");
            assertTrue(prompt.contains("Do not return from/to IDs"));
        } finally {RebuildApi.reset();}
    }
}
