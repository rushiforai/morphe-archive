package android.view;
import android.content.Context;
public class View {
 private Object tag; private final Context context; ViewGroup parent;
 public interface OnClickListener { void onClick(View view); }
 public View(Context c){context=c;}
 public void setTag(Object value){tag=value;} public Object getTag(){return tag;}
 public Context getContext(){return context;}
 public void setOnClickListener(OnClickListener listener){}
 @SuppressWarnings("unchecked") public <T extends View> T findViewWithTag(Object wanted){return wanted.equals(tag)?(T)this:null;}
}