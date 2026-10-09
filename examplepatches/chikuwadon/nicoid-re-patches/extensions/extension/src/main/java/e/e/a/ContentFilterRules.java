package e.e.a;
import java.text.Normalizer;import java.util.*;import java.util.regex.Pattern;
public final class ContentFilterRules {
 private ContentFilterRules(){}
 private static final LinkedHashMap<String,String> cache=new LinkedHashMap<>(256,.75f,true);
 private static synchronized String normalized(String v){String x=cache.get(v);if(x!=null)return x;x=Normalizer.normalize(v,Normalizer.Form.NFKC).toLowerCase(Locale.ROOT);cache.put(v,x);if(cache.size()>256)cache.remove(cache.keySet().iterator().next());return x;}
 public static String[] keywords(String v){ArrayList<String> a=new ArrayList<>();if(v!=null)for(String s:v.split("[,，、\\r\\n]+")){s=normalized(s).trim();if(!s.isEmpty()&&!a.contains(s))a.add(s);}return a.toArray(new String[0]);}
 public static boolean blocked(String text,String[] words){if(text==null)return false;for(String w:words)if(normalized(text).contains(w))return true;return false;}
 public static final class Rule {final String value,mode;final boolean enabled;final Pattern pattern;public Rule(String value,String mode,boolean enabled){this.mode=mode;this.enabled=enabled;this.value=mode.equals("regex")?value:normalized(value);pattern=mode.equals("regex")?Pattern.compile(value):null;}public boolean matches(String text){if(!enabled||text==null)return false;if(pattern!=null)return pattern.matcher(text).find();String s=normalized(text);return mode.equals("exact")?s.equals(value):s.contains(value);}}
}
