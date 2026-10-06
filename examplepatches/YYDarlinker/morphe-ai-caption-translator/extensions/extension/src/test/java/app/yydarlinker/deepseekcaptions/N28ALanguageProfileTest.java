package app.yydarlinker.deepseekcaptions;
import static org.junit.Assert.*;
import java.util.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;
@RunWith(Parameterized.class)
public class N28ALanguageProfileTest {
  @Parameterized.Parameters(name="{0}->{1}") public static Object[][] cases() {return new Object[][] {
    {"zh-Hans","zh-Hans",9,16},{"zh-Hant","zh-Hant",9,16},{"ja", "ja",4,13},{"ko","ko",12,16},
    {"en","en",20,42},{"es","es",17,42},{"fr","fr",17,42},{"de","de",17,42},{"pt","pt",17,42},
    {"ru","ru",17,42},{"vi","vi",17,42},{"id","id",17,42},{"ar","ar",20,42},{"hi","hi",22,42},
    {"it-IT","generic",17,42},{"zh","generic",17,42},{"zh-CN","zh-Hans",9,16},{"zh-SG","zh-Hans",9,16},
    {"zh-TW","zh-Hant",9,16},{"zh-HK","zh-Hant",9,16},{"zh-MO","zh-Hant",9,16},
    {"zh-hANT-CN","zh-Hant",9,16},{"zh-Latn-CN","generic",17,42},
    {" IN_id ","id",17,42},{"pt-PT","pt",17,42},{"pt-BR","pt",17,42},{"en-GB","en",20,42},
    {null,"generic",17,42},{"","generic",17,42},{"und","generic",17,42},{"unknown","generic",17,42},{"en--US","generic",17,42}
  };}
  private final String code,id;private final int cps,cpl;
  public N28ALanguageProfileTest(String code,String id,int cps,int cpl){this.code=code;this.id=id;this.cps=cps;this.cpl=cpl;}
  @Test public void immutableReferenceProfile() {
    CaptionLanguageProfile p=CaptionLanguageProfile.fromCode(code);
    assertEquals(id,p.id);assertEquals(cps,p.referenceCps);assertEquals(cpl,p.referenceCpl);
    assertEquals(7000,p.softPageDurationMs);assertEquals("n28a-reference-v1",p.policyVersion);
    assertEquals(14,CaptionLanguageProfile.profiles().size());
    assertEquals(id.equals("generic") ? "und" : id,p.locale.toLanguageTag());
    assertEquals(id.equals("ar") ? CaptionLanguageProfile.Direction.RTL : id.equals("generic") ? CaptionLanguageProfile.Direction.FIRST_STRONG : CaptionLanguageProfile.Direction.LTR,p.direction);
    assertEquals(id.startsWith("zh-") ? "legacy_codepoints" : "visible_grapheme",p.readingCounterId());
    assertEquals(id.startsWith("zh-") ? "legacy_chinese" : id.equals("ja") ? "japanese_width" : id.equals("ko") ? "korean_width" : "grapheme",p.lineCounterId());
    try {CaptionLanguageProfile.profiles().clear();fail("mutable profiles");}catch(UnsupportedOperationException expected){}
  }
}
