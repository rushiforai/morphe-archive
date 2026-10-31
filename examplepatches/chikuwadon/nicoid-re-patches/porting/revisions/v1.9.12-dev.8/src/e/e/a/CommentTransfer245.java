package e.e.a;
import android.view.*;
/** Drain the current native comment draw before detaching its TextureView. */
public final class CommentTransfer245 {
 public static void stop(View root)throws Exception{
  if(root.getClass().getName().equals("e.e.a.u")){
   // Native run() uses this same monitor for lockCanvas/draw/unlock.
   // The added inner stop check prevents a worker already waiting on the lock
   // from acquiring another canvas after this barrier.
   synchronized(root){root.getClass().getField("u").setBoolean(root,true);Object t=root.getClass().getField("t").get(root);if(t instanceof Thread)((Thread)t).interrupt();}
  }
  if(root instanceof ViewGroup){ViewGroup group=(ViewGroup)root;for(int i=0;i<group.getChildCount();i++)stop(group.getChildAt(i));}
 }
}
