package e.e.a;
import java.util.*;
public class CommentUi {
 public static final Map<ArrayList<?>,Boolean> inputs=new IdentityHashMap<>();public static int calls,delivered;public static Runnable beforeQueue;public static boolean throwApply;public static Runnable queued;public static ArrayList<?> last;
 public static void apply(Object owner,ArrayList<?> list){calls++;inputs.put(list,Boolean.TRUE);
 // Real CommentUi synchronously obtains an independent list from CommentContinuity118.merge.
 last=new ArrayList<Object>(list);
 if(throwApply)throw new IllegalStateException("fixture dispatch failure");
 if(beforeQueue!=null){try{Object ticket=Dev121.ticket(owner);Runnable r=beforeQueue;beforeQueue=null;r.run();queued=Dev121.update(ticket,last);}catch(Exception e){throw new AssertionError(e);}}
}
 static void lambda$1(Object owner,ArrayList<?> list){delivered++;last=list;}
}
