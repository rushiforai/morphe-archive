package app.yydarlinker.deepseekcaptions;
import static org.junit.Assert.*;
import java.util.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class) @Config(sdk={28,35})
public class N28CCounterTest {
  CaptionRenderSpec spec(String target){return CaptionLanguageContext.explicit("UNKNOWN",target).renderSpec;}
  @Test public void allFourteenProfilesUseTheFixedSoftParameters() {
    String[] ids={"zh-Hans","zh-Hant","ja","ko","en","es","fr","de","pt","ru","vi","id","ar","hi"};
    int[] cps={9,9,4,12,20,17,17,17,17,17,17,17,20,22},cpl={16,16,13,16,42,42,42,42,42,42,42,42,42,42};
    assertEquals(14,CaptionLanguageProfile.profiles().size());
    for(int i=0;i<ids.length;i++) {CaptionRenderSpec s=spec(ids[i]);assertEquals(cps[i],s.profile.referenceCps);assertEquals(cpl[i],s.profile.referenceCpl);assertEquals(7000,s.profile.softPageDurationMs);assertEquals(i==12?CaptionLanguageProfile.Direction.RTL:CaptionLanguageProfile.Direction.LTR,s.direction);}
    assertEquals(8,RebuildPageLayout.MAX_CPS);assertEquals(1200,RebuildPageLayout.MIN_PAGE_MS);
  }
  @Test public void fixedNfdAndNfcVisibleGraphemeCountsAreEqual() {
    CaptionRenderSpec vi=spec("vi-VN");assertEquals(1,vi.readingUnits("ắ"));assertEquals(1,vi.readingUnits("a\u0306\u0301"));
    assertEquals(1,spec("fr-CA").readingUnits("é"));assertEquals(1,spec("fr-CA").readingUnits("e\u0301"));
    assertEquals(4,spec("ar-EG").readingUnits("سَلَام"));assertEquals(1,spec("ko-KR").readingUnits("각"));
  }
  @Test public void indicViramaNuktaAndZwjBoundariesAreUtf16Safe() {
    for(String text:new String[]{"क्ष","क़्‍ष","क़ि"}) {assertEquals(1,spec("hi-IN").readingUnits(text));assertArrayEquals(new int[]{0,text.length()},CaptionUnicode.characterBoundaries(text,spec("hi-IN").locale));}
    assertEquals(2,spec("hi-IN").readingUnits("क्‌ष"));
  }
  @Test public void emojiSequencesRemainOneVisibleGrapheme() {
    for(String text:new String[]{"👍🏽","👩🏽‍💻","👨‍👩‍👧‍👦","🇯🇵","#️⃣","𝄞"}) {
      assertEquals(1,spec("en-US").readingUnits(text));assertArrayEquals(new int[]{0,text.length()},CaptionUnicode.characterBoundaries(text,spec("en-US").locale));
    }
  }
  @Test public void nonChineseMinimumTimeAndPolicyDoNotChangeChineseNamespace() {
    assertEquals(1200,CaptionLanguagePager.MIN_PAGE_MS);
    assertEquals("n29-presentation-v3",spec("en").presentationPolicy);
    assertEquals("legacy_n26",spec("zh-Hans").presentationPolicy);
  }
  @Test public void lineCandidatesNeverSplitNbspCrLfOrCompleteClusters() {
    assertArrayEquals(new int[]{0,3},CaptionUnicode.lineBoundaries("a\u00a0b",spec("en-GB").locale));
    assertArrayEquals(new int[]{0,3,4},CaptionUnicode.lineBoundaries("a\r\nb",spec("en-GB").locale));
    assertEquals(2,spec("en-GB").readingUnits("a\r\nb"));assertEquals(3,spec("en-GB").readingUnits("a\u00a0b"));
  }
  @Test public void fullRegionScriptAndUnknownAreNeverUiOrTextGuesses() {
    assertEquals("pt-PT",spec("pt-PT").locale.toLanguageTag());assertEquals("pt-BR",spec("pt-BR").locale.toLanguageTag());
    assertEquals(CaptionLanguageProfile.Direction.FIRST_STRONG,spec("UNKNOWN").direction);
    assertEquals(CaptionLanguageProfile.Direction.FIRST_STRONG,spec("he").direction);
    assertTrue(spec("zh").legacy);assertTrue(spec("zh-Hans-CN").legacy);assertFalse(spec("ja").legacy);
    assertNotEquals(spec("pt-PT").targetCode,spec("pt-BR").targetCode);
  }
}
