package a;
import java.util.*;
public class yr1 {
 public zz4 theme;
 public final Deque<Integer> groups=new ArrayDeque<>();
 public final Map<String,Object> remembered=new HashMap<>();
 public int begins,ends;
 public void g0(int key){groups.addLast(key);begins++;}
 public Object S(){return remembered.getOrDefault(groups.toString(),am0.a);}
 public void q0(Object value){remembered.put(groups.toString(),value);}
 public void q(boolean inserted){if(inserted)throw new AssertionError("wrong group type");groups.removeLast();ends++;}
}
