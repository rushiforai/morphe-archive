package e.e.a;
import android.view.*;
/** Use the draw loop's monitor before releasing any comment SurfaceTexture. */
public final class CommentSafety110 {
 public static void stop(View root){if(root==null)return;try{CommentTransfer245.stop(root);}catch(Exception e){android.util.Log.w("nicoid-comments","Cannot drain comment renderer",e);}}
 public static void activity(android.app.Activity a){stop(a.getWindow().getDecorView());}
}
