package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;
import org.json.*;
import org.junit.Test;

/** Neutral protocol examples: source quotations are not translation coverage evidence. */
public class D7CoverageRegressionTest {
    static final CaptionLanguageContext LANGUAGE=CaptionLanguageContext.explicit("en","zh-Hans");
    static RebuildSource source() {
        return RebuildContractTest.source("The garden opens early today and the library closes later tonight.",500);
    }
    static String contradictory(RebuildSource s,RebuildPlanner.Block b) throws Exception {
        return RebuildContractTest.reply(b,new JSONArray().put(
            RebuildContractTest.event(b.from,b.from+4,"花园今天很早开放。").put("source",s.text(b.from,b.to))));
    }
    @Test public void wholeQuotationCannotEraseAnUndeclaredTail() throws Exception {
        RebuildSource s=source();RebuildPlanner.Block b=RebuildContractTest.block(s);
        RebuildProtocol.Plan p=RebuildProtocol.parseBestEffort(contradictory(s,b),s,b,LANGUAGE);
        assertTrue(p.partial);assertTrue(p.events.isEmpty());
        assertEquals(1,p.holes.size());assertArrayEquals(new int[]{0,b.to},p.holes.get(0));
    }
    @Test public void coverageIsConservedForANonzeroBlockOffset() throws Exception {
        RebuildSource s=source();RebuildPlanner.Block b=new RebuildPlanner.Block(2,2,s.words.size()-1,s);
        RebuildProtocol.Plan p=RebuildProtocol.parseBestEffort(contradictory(s,b),s,b,LANGUAGE);
        assertTrue(p.partial);assertTrue(p.events.isEmpty());
        assertArrayEquals(new int[]{b.from,b.to},p.holes.get(0));
    }
    @Test public void fourCharacterAllowanceStillRepairsButFiveCannotBeSilentlyAdded() throws Exception {
        for(String tail:new String[]{"four","fives"}) {
            RebuildSource s=RebuildContractTest.source("We open the garden "+tail,500);
            RebuildPlanner.Block b=RebuildContractTest.block(s);
            String raw=RebuildContractTest.reply(b,new JSONArray().put(RebuildContractTest.event(0,b.to-1,"我们开放花园。").put("source",s.text(0,b.to))));
            RebuildProtocol.Plan p=RebuildProtocol.parseBestEffort(raw,s,b,LANGUAGE);
            assertEquals(tail.equals("fives"),p.partial);
            if (tail.equals("four")) assertEquals(b.to,p.events.get(0).to);
            else { assertTrue(p.events.isEmpty()); assertArrayEquals(new int[]{0,b.to},p.holes.get(0)); }
        }
    }

    @Test public void wholeTranslationCannotBeCompressedIntoTheDeclaredPrefixEither() throws Exception {
        RebuildSource s=source();RebuildPlanner.Block b=RebuildContractTest.block(s);
        JSONObject reply=new JSONObject(contradictory(s,b));
        reply.getJSONArray("events").getJSONObject(0).put("text","花园今天很早开放，图书馆今晚晚些时候关门。");
        RebuildProtocol.Plan p=RebuildProtocol.parseBestEffort(reply.toString(),s,b,LANGUAGE);
        assertTrue("neither the IDs nor the quote prove which meaning was translated",p.events.isEmpty());
        assertArrayEquals(new int[]{b.from,b.to},p.holes.get(0));
    }

    @Test public void anAmbiguousEventDoesNotDiscardItsValidNeighbourOrLeakAsAPrefix() throws Exception {
        RebuildSource s=source();RebuildPlanner.Block b=RebuildContractTest.block(s);
        JSONArray events=new JSONArray().put(RebuildContractTest.event(0,4,"花园今天很早开放。").put("source",s.text(0,4)))
            .put(RebuildContractTest.event(5,6,"图书馆今晚晚些时候关门。").put("source",s.text(5,b.to)));
        RebuildProtocol.Plan p=RebuildProtocol.parseBestEffort(RebuildContractTest.reply(b,events),s,b,LANGUAGE);
        assertEquals(1,p.events.size());assertEquals(4,p.events.get(0).to);
        assertArrayEquals(new int[]{5,b.to},p.holes.get(0));
        try { RebuildProtocol.parsePrefix(contradictory(s,b),s,b,LANGUAGE);fail("ambiguous stream prefix displayed"); }
        catch(RebuildProtocol.Invalid expected) { assertEquals("source_quote_mismatch",expected.code); }
    }
}
