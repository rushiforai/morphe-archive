package app.yydarlinker.deepseekcaptions;
import static org.junit.Assert.*;
import android.icu.text.BreakIterator;
import android.os.Build;
import java.io.*;
import java.util.*;
import java.util.concurrent.*;
import org.json.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
@RunWith(RobolectricTestRunner.class)
@Config(sdk={28,35})
public class N28AUnicodeTest {
  @Test public void fixedClustersAndCountsOnInstalledPlatformIcu() throws Exception {
    JSONObject contract;
    try(InputStream in=getClass().getResourceAsStream("/n28a/unicode-contract.json")) {
      ByteArrayOutputStream b=new ByteArrayOutputStream();byte[] buffer=new byte[2048];int n;
      while((n=in.read(buffer))!=-1)b.write(buffer,0,n);
      contract=new JSONObject(b.toString("UTF-8"));
    }
    assertEquals(contract.getString("counter_version"),CaptionUnicode.COUNTER_VERSION);
    assertEquals(contract.getString("boundary_version"),CaptionUnicode.BOUNDARY_VERSION);
    JSONArray cases=contract.getJSONArray("cases"), evidence=new JSONArray();
    for(int i=0;i<cases.length();i++) {
      JSONObject c=cases.getJSONObject(i);String text=c.getString("text"),id=c.getString("id");
      JSONArray b=c.getJSONArray("boundaries");int[] expected=new int[b.length()];for(int j=0;j<expected.length;j++)expected[j]=b.getInt(j);
      int[] actual=CaptionUnicode.characterBoundaries(text,Locale.ENGLISH);
      assertArrayEquals(id,expected,actual);
      assertEquals(id,c.getInt("reading"),CaptionUnicode.readingUnits(text,CaptionLanguageProfile.fromCode("en")));
      assertEquals(id,c.getInt("halves"),CaptionUnicode.lineHalfUnits(text,CaptionLanguageProfile.fromCode("en")));
      for(int boundary:CaptionUnicode.lineBoundaries(text,Locale.ENGLISH))assertTrue(id,Arrays.binarySearch(expected,boundary)>=0);
      BreakIterator raw=BreakIterator.getCharacterInstance(Locale.ENGLISH);raw.setText(text);JSONArray platform=new JSONArray();
      for(int n=raw.first();n!=BreakIterator.DONE;n=raw.next())platform.put(n);
      evidence.put(new JSONObject().put("id",id).put("platform_boundaries",platform).put("safe_boundaries",new JSONArray(actual)));
    }
    System.out.println("N28A_ICU "+CaptionUnicode.backend()+" cases="+cases.length());
    String dir=System.getenv("N28A_EVIDENCE_DIR");if(dir!=null)try(FileOutputStream out=new FileOutputStream(new File(dir,"icu-sdk"+Build.VERSION.SDK_INT+".json"))) {
      out.write(new JSONObject().put("backend",CaptionUnicode.backend()).put("cases",evidence).toString(2).getBytes("UTF-8"));
    }
  }
  @Test public void readingAndLineUnitsAreDifferentAndCompleteClustersAreWeighted() {
    CaptionLanguageProfile ja=CaptionLanguageProfile.fromCode("ja"),ko=CaptionLanguageProfile.fromCode("ko");
    assertEquals(9,CaptionUnicode.readingUnits("A あアｶ。 ,　",ja));assertEquals(13,CaptionUnicode.lineHalfUnits("A あアｶ。 ,　",ja));
    assertEquals(7,CaptionUnicode.readingUnits("한A e\u0301,　!",ko));assertEquals(8,CaptionUnicode.lineHalfUnits("한A e\u0301,　!",ko));
    assertEquals(6,CaptionUnicode.lineHalfUnits("123",ko));
    assertEquals(1,CaptionUnicode.lineHalfUnits("e\u0301",ja));assertEquals(2,CaptionUnicode.lineHalfUnits("é",ja));
    assertEquals(2,CaptionUnicode.lineHalfUnits("#️⃣",ja));assertEquals(2,CaptionUnicode.lineHalfUnits("#️⃣",ko));
    assertEquals(2,CaptionUnicode.lineHalfUnits("👩🏽‍💻",ja));assertEquals(2,CaptionUnicode.lineHalfUnits("각",ko));
  }
  @Test public void legacyChineseCodepointSemanticsRemainExact() {
    assertEquals(8,CaptionUnicode.readingUnits("中e\u0301\r\n\u2067👍🏽",CaptionLanguageProfile.fromCode("zh-Hans")));
    assertEquals(16,CaptionUnicode.lineHalfUnits("中e\u0301\r\n\u2067👍🏽",CaptionLanguageProfile.fromCode("zh-Hant")));
  }
  @Test public void legalLinesRespectNbspCrLfAndSafeIndicBoundaries() {
    assertArrayEquals(new int[]{0,3},CaptionUnicode.lineBoundaries("a\u00a0b",Locale.ENGLISH));
    assertArrayEquals(new int[]{0,3,4},CaptionUnicode.lineBoundaries("a\r\nb",Locale.ENGLISH));
    assertArrayEquals(new int[]{0,4,5},CaptionUnicode.lineBoundaries("क्ष x",Locale.forLanguageTag("hi")));
    assertArrayEquals(new int[]{0,2,3},CaptionUnicode.characterBoundaries("a\u200db",Locale.ENGLISH));
  }
  @Test public void perCallIteratorsDoNotShareMutableStateAcrossThreads() throws Exception {
    ExecutorService workers=Executors.newFixedThreadPool(3);
    try {
      List<Future<int[]>> out=new ArrayList<>();
      for(int i=0;i<30;i++)out.add(workers.submit(()->CaptionUnicode.characterBoundaries("e\u0301👩🏽‍💻क्ष",Locale.forLanguageTag("hi"))));
      for(Future<int[]> result:out)assertArrayEquals(new int[]{0,2,9,12},result.get(5,TimeUnit.SECONDS));
    }finally{workers.shutdownNow();}
  }
}
