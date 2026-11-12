package e.e.a;
import android.content.Context;import android.view.*;import android.widget.*;
/** Horizontal page gestures; vertical lists, composer and player keep their own gestures. */
final class NicoliveSwipeLayout extends LinearLayout {
 interface Change{void page(int direction);}
 final Change change;final int slop;float x,y;boolean blocked,swiping;
 NicoliveSwipeLayout(Context c,Change callback){super(c);setOrientation(VERTICAL);setClickable(true);change=callback;slop=ViewConfiguration.get(c).getScaledTouchSlop();}
 boolean excludes(View v,float x,float y){if(v instanceof NicolivePlayerFrame||v instanceof HorizontalScrollView||v instanceof EditText||v instanceof CheckBox||"nicoid-live-bottom-refresh".equals(v.getTag()))return true;if(v instanceof ViewGroup){ViewGroup g=(ViewGroup)v;for(int i=0;i<g.getChildCount();i++){View child=g.getChildAt(i);if(child.getVisibility()==VISIBLE&&x>=child.getLeft()&&x<child.getRight()&&y>=child.getTop()&&y<child.getBottom()&&excludes(child,x-child.getLeft(),y-child.getTop()))return true;}}return false;}
 @Override public boolean onInterceptTouchEvent(MotionEvent e){if(e.getActionMasked()==MotionEvent.ACTION_DOWN){x=e.getX();y=e.getY();blocked=excludes(this,x,y);swiping=false;}if(e.getPointerCount()>1)blocked=true;if(e.getActionMasked()==MotionEvent.ACTION_MOVE&&!blocked){float dx=Math.abs(e.getX()-x),dy=Math.abs(e.getY()-y);if(dy>slop&&dy>dx)blocked=true;else if(dx>slop*2&&dx>dy*1.5f)swiping=true;}return swiping;}
 @Override public boolean onTouchEvent(MotionEvent e){if(!swiping)onInterceptTouchEvent(e);if(!swiping)return super.onTouchEvent(e);if(e.getActionMasked()==MotionEvent.ACTION_UP){float dx=e.getX()-x;if(Math.abs(dx)>Math.max(slop*3,NicoliveUi.dp(getContext(),48)))change.page(dx<0?1:-1);swiping=false;}else if(e.getActionMasked()==MotionEvent.ACTION_CANCEL)swiping=false;return true;}
}
