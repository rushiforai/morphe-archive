package android.content.res;
import java.util.*;
public class Resources {
 public final Map<String,Integer> ids=new HashMap<>();
 public int getIdentifier(String name,String type,String pkg) {
  if (!pkg.equals("com.waze")) throw new AssertionError("Wrong package");
  return ids.getOrDefault(type+"/"+name,0);
 }
}
