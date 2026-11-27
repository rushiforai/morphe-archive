import com.akshaykadam.pixelboard.extension.rambler.GboardRamblerScriptFix;
import com.akshaykadam.pixelboard.extension.rambler.GboardRamblerSegmentLock;
import java.io.*; import java.util.*;
// WP-A golden run on a jar built from shipped dex bytes.
// voice  = processVoice(x): the single dictation conversion (vrh.h, both consumers kcm.j and UD read its in-place result).
// typing = process(x, locale): typing-lane conversion (kept as a locked column so dictation work can't silently move typing).
// layouts: k3 en-US (English layout), k2 bn-BD qwerty multilingual, k1 bn-BD bengali_bangladesh transliteration.
public class Golden {
  static String esc(String s){ return s.replace("\t","\\t").replace("\n","\\n"); }
  public static void main(String[] a) throws Exception {
    PrintWriter w = new PrintWriter(new OutputStreamWriter(System.out, "UTF-8"), true);
    BufferedReader r = new BufferedReader(new InputStreamReader(new FileInputStream(a[0]), "UTF-8"));
    List<String[]> cases = new ArrayList<>(); String l;
    while ((l = r.readLine()) != null) { if (l.startsWith("#") || l.isEmpty()) continue; String[] c = l.split("\t", -1); if (c.length < 3) c = new String[]{c[0], c.length>1?c[1]:"", ""}; cases.add(c); }
    Object[][] locs = { {"k3", 3, new Locale("en","US")}, {"k2", 2, new Locale("bn","BD")}, {"k1", 1, new Locale("bn","BD")} };
    String[] pinName = {"AUTO","BN","EN"}; int[] pinVal = {0,1,2}; // setPin(1)=BN, setPin(2)=EN (matches Chain.java)
    // WP-E builds load their spelling table in the background and never wait for it. Load it up front here so runs are
    // deterministic; the cold path is tested separately. rc2 and WP-S jars have no such class and skip this.
    try { java.lang.reflect.Method m = Class.forName("com.akshaykadam.pixelboard.extension.rambler.GboardRamblerLoanSpell").getDeclaredMethod("loadNow"); m.setAccessible(true); m.invoke(null); } catch (ClassNotFoundException e) { }
    w.println("layout\tpin\tcase\tclass\tinput\tvoice\ttyping");
    for (Object[] L : locs) for (int p = 0; p < 3; p++) for (String[] c : cases) {
      String v, t;
      try { GboardRamblerSegmentLock.resetPin(); GboardRamblerScriptFix.jvmLayoutKind = (Integer)L[1]; if (pinVal[p]!=0) GboardRamblerSegmentLock.setPin(pinVal[p]); v = GboardRamblerScriptFix.processVoice(c[2]); } catch (Throwable e) { v = "!EXC:" + e.getClass().getSimpleName(); }
      try { GboardRamblerSegmentLock.resetPin(); GboardRamblerScriptFix.jvmLayoutKind = (Integer)L[1]; if (pinVal[p]!=0) GboardRamblerSegmentLock.setPin(pinVal[p]); t = GboardRamblerScriptFix.process(c[2], (Locale)L[2]); } catch (Throwable e) { t = "!EXC:" + e.getClass().getSimpleName(); }
      w.println(L[0]+"\t"+pinName[p]+"\t"+c[0]+"\t"+c[1]+"\t"+esc(c[2])+"\t"+esc(String.valueOf(v))+"\t"+esc(String.valueOf(t)));
    }
  }
}
