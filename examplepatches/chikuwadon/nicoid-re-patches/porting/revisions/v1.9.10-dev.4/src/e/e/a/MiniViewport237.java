package e.e.a;
import android.content.Context;import android.view.*;import android.widget.*;
/** Keep the native popup player's LinearLayout parent contract inside the mini host. */
public final class MiniViewport237 extends LinearLayout {
 public MiniViewport237(Context c,View video){super(c);setOrientation(VERTICAL);setGravity(Gravity.CENTER);addView(video,new LinearLayout.LayoutParams(-1,-1));}
 @Override protected void onMeasure(int w,int h){for(int i=0;i<getChildCount();i++){View child=getChildAt(i);ViewGroup.LayoutParams p=child.getLayoutParams();if(!(p instanceof LinearLayout.LayoutParams)){p=new LinearLayout.LayoutParams(-1,-1);child.setLayoutParams(p);}else{p.width=-1;p.height=-1;LinearLayout.LayoutParams q=(LinearLayout.LayoutParams)p;q.weight=0;q.setMargins(0,0,0,0);}}super.onMeasure(w,h);}
}
