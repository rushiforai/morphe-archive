package e.e.a;
import android.view.View;
import android.view.ViewGroup;
/** Wake the comment worker before waiting for its draw monitor. */
public final class CommentTransfer245 {
 public static void stop(View view)throws Exception{
  if(view==null)return;
  if(view.getClass().getName().equals("e.e.a.u")){
   java.lang.reflect.Field stopped=view.getClass().getField("u");
   stopped.setBoolean(view,true);
   Object worker=view.getClass().getField("t").get(view);
   if(worker instanceof Thread)((Thread)worker).interrupt();
   synchronized(view){
    stopped.setBoolean(view,true);
    Object current=view.getClass().getField("t").get(view);
    if(current instanceof Thread&&current!=worker)((Thread)current).interrupt();
   }
  }
  if(view instanceof ViewGroup){ViewGroup group=(ViewGroup)view;for(int n=0;n<group.getChildCount();n++)stop(group.getChildAt(n));}
 }
}
