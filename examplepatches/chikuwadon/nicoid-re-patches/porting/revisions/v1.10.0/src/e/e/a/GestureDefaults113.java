package e.e.a;
import java.util.*;
public final class GestureDefaults113 {
 public static Map<String,String> mapping(){LinkedHashMap<String,String> m=new LinkedHashMap<>();m.put("DR","close");m.put("DL","undo");m.put("URD","refresh");m.put("RU","top");m.put("RD","bottom");m.put("LU","search");m.put("UR","righttab");m.put("UL","lefttab");return Collections.unmodifiableMap(m);}
 public static float hudWidth(float measured,float available,float padding){return Math.max(0,Math.min(available,measured+padding*2));}
}
