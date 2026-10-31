package a;
import java.util.*;
public class jw1 {
    public y95 theme;
    public final Deque<Integer> groups=new ArrayDeque<>();
    public final Map<String,Object> remembered=new HashMap<>();
    public int begins,ends;
    public void h0(int key) { groups.addLast(key); begins++; }
    public Object T() { return remembered.getOrDefault(groups.toString(),pp0.a); }
    public void r0(Object value) { remembered.put(groups.toString(),value); }
    public void r(boolean inserted) { if(inserted)throw new AssertionError("Wrong group kind"); groups.removeLast(); ends++; }
}
