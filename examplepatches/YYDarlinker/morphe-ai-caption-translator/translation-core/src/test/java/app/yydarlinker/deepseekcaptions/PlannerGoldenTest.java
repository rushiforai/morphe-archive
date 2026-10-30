package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;

import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.zip.GZIPInputStream;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

/**
 * Source reading, request blocks and request hints must stay byte-identical when only their
 * execution cost changes. Source/time digests retain upstream values; request hints reflect
 * the intentional removal of the topic-specific pair catalog (2026-10-29).
 */
@RunWith(RobolectricTestRunner.class) @Config(sdk=28,manifest=Config.NONE)
public class PlannerGoldenTest {
  static final String[][] CONTEXTS={{"en","zh-Hans"},{"en","ja"},{"ja","zh-Hans"},{"es","en"}};

  static byte[] resource(String name) throws Exception {
    try(InputStream raw=PlannerGoldenTest.class.getResourceAsStream(name)) {
      if(!name.endsWith(".gz"))return raw.readAllBytes();
      try(InputStream in=new GZIPInputStream(raw)){return in.readAllBytes();}
    }
  }

  static RebuildSource read(String name,String type) throws Exception {
    byte[] body=resource(name);
    return RebuildSource.read(body,CaptionDocument.parse(body,type));
  }

  static String sha(String value) throws Exception {
    byte[] d=MessageDigest.getInstance("SHA-256").digest(value.getBytes(StandardCharsets.UTF_8));
    StringBuilder out=new StringBuilder();
    for(int i=0;i<8;i++)out.append(String.format(java.util.Locale.ROOT,"%02x",d[i]&255));
    return out.toString();
  }

  /** Words, then blocks and the complete request payload for each language context. */
  static String describe(RebuildSource s) throws Exception {
    StringBuilder words=new StringBuilder();
    for(RebuildSource.Word w:s.words)
      words.append(w.text).append('|').append(w.start).append('|').append(w.end).append('|')
          .append(w.cue).append('|').append(w.precision).append('\n');
    StringBuilder out=new StringBuilder("words="+s.words.size()+":"+sha(words.toString()));
    for(String[] pair:CONTEXTS) {
      CaptionLanguageContext context=CaptionLanguageContext.explicit(pair[0],pair[1]);
      StringBuilder blocks=new StringBuilder(),payloads=new StringBuilder();
      java.util.List<RebuildPlanner.Block> planned=RebuildPlanner.plan(s,context);
      for(RebuildPlanner.Block b:planned) {
        blocks.append(b.from).append('-').append(b.to).append(b.continuedBefore?'<':'.').append(b.continuedAfter?'>':'.').append(';');
        payloads.append(RebuildProtocol.payload(s,b,pair[1],"",context)).append('\n');
      }
      out.append(';').append(pair[0]).append('>').append(pair[1]).append('=').append(planned.size())
          .append(':').append(sha(blocks.toString())).append(':').append(sha(payloads.toString()));
    }
    return out.toString();
  }

  /** Every per-word planner decision, so a faster evaluation order cannot change one value. */
  static String features(RebuildSource s) throws Exception {
    StringBuilder out=new StringBuilder();
    for(String[] pair:CONTEXTS) {
      CaptionLanguageContext context=CaptionLanguageContext.explicit(pair[0],pair[1]);
      StringBuilder row=new StringBuilder();
      for(int i=0;i<s.words.size();i++) {
        row.append(RebuildPlanner.boundary(s,i)?'B':'-')
            .append(RebuildPlanner.dependentEnding(s,i,context)?'D':'-')
            .append(RebuildPlanner.strongDependentEnding(s,i,context)?'S':'-')
            .append(RebuildPlanner.protectedCut(s,i,context)?'P':'-')
            .append(RebuildPlanner.safeCut(s,i,context)?'C':'-')
            .append(RebuildSource.nonSpeech(s.words.get(i).text)?'N':'-');
        if(i+1<s.words.size())row.append(RebuildPlanner.resourceScore(s,i,context));
        if(i>0)row.append(RebuildPlanner.hardBreakBefore(s,i)?'H':'-');
        row.append(';');
      }
      out.append(pair[0]).append('>').append(pair[1]).append('=').append(sha(row.toString())).append(';');
    }
    return out.toString();
  }

  static String timed(String label,RebuildSource s) throws Exception {
    long begin=System.nanoTime();
    String value=describe(s);
    System.out.println("GOLDEN_"+label+"="+value+" ("+(System.nanoTime()-begin)/1000000+" ms)");
    return value;
  }

  @Test public void srtSourceIsUnchanged() throws Exception {
    assertEquals(SRT,timed("SRT",read("/r2/mH5TlcMo_m4.en.srt","application/x-subrip")));
  }
  @Test public void capturedEstimatedTimingIsUnchanged() throws Exception {
    assertEquals(CAPTURED,timed("CAPTURED",RebuildR28CapturedTest.source()));
  }
  @Test public void json3WordTimingIsUnchanged() throws Exception {
    assertEquals(JSON3,timed("JSON3",read("/golden/mH5TlcMo_m4.en.json3.gz","application/json")));
  }
  @Test public void webVttIsUnchanged() throws Exception {
    assertEquals(VTT,timed("VTT",read("/golden/mH5TlcMo_m4.en.vtt.gz","text/vtt")));
  }

  static final String[] VOCABULARY=(
      "if because although though while which that so as than then and or but to of with without for from in on at by"
      +" about including into between like rather whether unless until before after where when what who how more less not"
      +" no its their his her this a an the every each any some another firstly secondly thirdly finally come comes coming"
      +" came however yet whereas instead critically i we it they he she i'm let's it's is was were are be been being has have"
      +" had can could will would never modernization picture out past range ballistic missile missiles cruise surface-to-air"
      +" aircraft carrier carriers fifth 5th generation fighter fighters korean peninsula purchasing power parity universally"
      +" phased replaced adopted reduced increased announced decided said argued explained aims plans very particularly reality"
      +" creation question point goal reason problem result argument china russia tanks budget spending 1996 2017 2025 24th"
      +" -5 +7 3.5 10,000 Mr Mrs Dr Prof vs etc 中国 军队 预算").split(" ");
  static final String[] SUFFIX={"","","","",",",".","?","!","。","？","！",".\"",".)","!’","”","'",";","…"};

  /** Deterministic punctuated text covering every lexical branch, gaps and speaker changes. */
  static RebuildSource synthetic() {
    java.util.Random random=new java.util.Random(20261011L);
    java.util.List<RebuildSource.Word> words=new java.util.ArrayList<>();
    long at=0;int cue=0;
    for(int i=0;i<6000;i++) {
      String text=VOCABULARY[random.nextInt(VOCABULARY.length)];
      if(random.nextInt(9)==0)text=Character.toUpperCase(text.charAt(0))+text.substring(1);
      text+=SUFFIX[random.nextInt(SUFFIX.length)];
      int special=random.nextInt(200);
      if(special==0)text=">>"+text;
      else if(special==1)text="♪";
      else if(special==2)text="[music]";
      else if(special==3)text="(applause)";
      else if(special==4)text="[音乐]";
      long length=120+random.nextInt(500);
      if(random.nextInt(40)==0)at+=650+random.nextInt(900);
      else if(random.nextInt(25)==0)at+=random.nextInt(649);
      if(random.nextInt(7)==0)cue++;
      words.add(new RebuildSource.Word(text,at,at+length,cue,
          i%3==0?RebuildSource.Precision.NATIVE:RebuildSource.Precision.ESTIMATED));
      at+=length;
    }
    return new RebuildSource(words);
  }

  @Test public void syntheticPunctuatedSourceIsUnchanged() throws Exception {
    RebuildSource s=synthetic();
    String actual=features(s)+describe(s);
    System.out.println("GOLDEN_SYNTHETIC="+actual);
    assertEquals(SYNTHETIC,actual);
  }

  /** The upstream key definition, kept verbatim as the oracle for the ASCII fast path. */
  static String upstreamKey(String s) {
    return java.util.regex.Pattern.compile("^[^\\p{L}\\p{N}+\\-]+|[^\\p{L}\\p{N}%]+$")
        .matcher(java.text.Normalizer.normalize(s,java.text.Normalizer.Form.NFKC)
            .toLowerCase(java.util.Locale.ROOT).replace('’','\'').replace('−','-')).replaceAll("");
  }

  @Test public void wordKeysMatchTheUpstreamDefinition() throws Exception {
    java.util.List<String> values=new java.util.ArrayList<>(java.util.Arrays.asList(
        "","a","A","Hello","HELLO,","+5","-","5%","%5","a-b","'quoted'","x\n","\ta","Ünïcödé","ﬁne","½","Mr.",
        "...","  a  ","it’s","−3","T-62","10,000","24th","U.S.","e.g.","--x","x--","(applause)","♪","中国"));
    for(RebuildSource s:new RebuildSource[]{synthetic(),RebuildR28CapturedTest.source(),
        read("/golden/mH5TlcMo_m4.en.json3.gz","application/json")})
      for(RebuildSource.Word w:s.words)values.add(w.text);
    for(String value:values)assertEquals(value,upstreamKey(value),RebuildSource.key(value));
  }

  @Test public void perWordDecisionsAreUnchanged() throws Exception {
    String[] actual={
        features(read("/r2/mH5TlcMo_m4.en.srt","application/x-subrip")),
        features(RebuildR28CapturedTest.source()),
        features(read("/golden/mH5TlcMo_m4.en.json3.gz","application/json")),
        features(read("/golden/mH5TlcMo_m4.en.vtt.gz","text/vtt"))};
    for(String value:actual)System.out.println("GOLDEN_FEATURES="+value);
    assertArrayEquals(FEATURES,actual);
  }

  static final String SYNTHETIC=
      "en>zh-Hans=264b0dfbe8cec798;en>ja=2e2c1ce9e16904a9;ja>zh-Hans=9cb92808b0326243;es>en=9cb92808b0326243;words=6000:b75a294e1333eaa8;en>zh-Hans=265:93e4e31b886667c7:740b3b3ff539190d;en>ja=265:93e4e31b886667c7:66a7f69c9d92ad9c;ja>zh-Hans=265:17cc4d352098cca8:3482536821903eaa;es>en=265:17cc4d352098cca8:24ab7b5ccf161c00";
  static final String[] FEATURES={
      "en>zh-Hans=6dd6bd2ef9d75dff;en>ja=2bd040e9e27b1145;ja>zh-Hans=84ef4b28e3d6e460;es>en=84ef4b28e3d6e460;",
      "en>zh-Hans=0fc2146b546eee97;en>ja=88cd60855c884c32;ja>zh-Hans=1b7bee45d64497ea;es>en=1b7bee45d64497ea;",
      "en>zh-Hans=6dd6bd2ef9d75dff;en>ja=2bd040e9e27b1145;ja>zh-Hans=84ef4b28e3d6e460;es>en=84ef4b28e3d6e460;",
      "en>zh-Hans=6dd6bd2ef9d75dff;en>ja=2bd040e9e27b1145;ja>zh-Hans=84ef4b28e3d6e460;es>en=84ef4b28e3d6e460;"};
  static final String SRT=
      "words=9684:d8d4491d6bc9ac95;en>zh-Hans=124:49197b61ae09e73d:620d594b97e1d9a1;en>ja=124:49197b61ae09e73d:c950d3531944c5f2;ja>zh-Hans=109:19487d24541c47a0:0aff238e5fdc85ac;es>en=109:19487d24541c47a0:f239668c38da0f18";
  static final String CAPTURED=
      "words=9684:9520ef16ad23f6d7;en>zh-Hans=124:d8934f09eaf57173:d2691949e1ce89fc;en>ja=124:d8934f09eaf57173:695f91b65bb67211;ja>zh-Hans=109:d1c477feec501e92:dd60ff57f0cbdbbc;es>en=109:d1c477feec501e92:e9ce0a032116361f";
  static final String JSON3=
      "words=9684:1706877ada648be2;en>zh-Hans=125:e2faf2da8b46c115:dcf4efdc2bd579ff;en>ja=125:e2faf2da8b46c115:ae2806f95ecc8de0;ja>zh-Hans=109:19487d24541c47a0:349b1eae259af131;es>en=109:19487d24541c47a0:d347ca4104e707f7";
  static final String VTT=
      "words=9684:a09bb8734e7e39ba;en>zh-Hans=125:061212f2914c3a47:fb536bf0c9078537;en>ja=125:061212f2914c3a47:5941c45bb9bcdf0f;ja>zh-Hans=109:6d10729186eea8cf:adbdd15f3f246ad2;es>en=109:6d10729186eea8cf:9d30db0d8a11d942";
}
