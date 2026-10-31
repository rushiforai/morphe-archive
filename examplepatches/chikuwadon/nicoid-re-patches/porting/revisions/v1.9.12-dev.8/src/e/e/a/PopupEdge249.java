package e.e.a;
import android.view.MotionEvent;
import android.view.View;
/** A narrow, stream-owned resize handle; the rest of the SeekBar stays native. */
public final class PopupEdge249 {
    static boolean hit(float x,float y,int width,int height,float density) {
        if(width<=0||height<=0||density<=0||Float.isNaN(x)||Float.isNaN(y))return false;
        float edge=Math.min(width/4f,16f*density);
        float corner=Math.min(height/4f,30f*density);
        return x>=width-edge&&x<width&&y>=height-corner&&y<height;
    }
    static boolean hit(View root,MotionEvent event) {
        int[] location=new int[2];root.getLocationOnScreen(location);
        return event.getPointerCount()==1&&hit(event.getRawX()-location[0],event.getRawY()-location[1],
                root.getWidth(),root.getHeight(),root.getResources().getDisplayMetrics().density);
    }
}
