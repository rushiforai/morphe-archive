package app.morphe.extension.chmate;

import android.content.Context;
import android.view.Gravity;
import android.view.View;
import android.widget.FrameLayout;

/** Attached popup anchors, independent corner choices and bounded hit areas. */
final class ViewerCornerControls extends FrameLayout {
    static final String BACK="viewerBackCorner", MORE="viewerMoreCorner";
    private final View back, more;
    private int bottomInset;
    ViewerCornerControls(Context context, View back, View more) {
        super(context); this.back=back; this.more=more;
        addView(back); addView(more); position();
    }
    private int dp(int value){return Math.round(value*getResources().getDisplayMetrics().density);}
    void bottomInset(int pixels){if(bottomInset!=pixels){bottomInset=pixels;position();}}
    private void position(){
        int a=corner(BACK,1), b=corner(MORE,0);
        place(back,a,0);place(more,b,a==b?dp(64):0);
    }
    private int corner(String key,int fallback){int value=VideoViewerSettings.prefs(getContext()).getInt(key,fallback);return value>=0&&value<4?value:fallback;}
    private void place(View view,int corner,int offset){
        boolean right=corner==0||corner==2, bottom=corner>=2;
        LayoutParams p=new LayoutParams(dp(64),dp(48),(right?Gravity.RIGHT:Gravity.LEFT)|(bottom?Gravity.BOTTOM:Gravity.TOP));
        p.leftMargin=dp(8)+(right?0:offset);p.rightMargin=dp(8)+(right?offset:0);
        p.topMargin=dp(4);p.bottomMargin=dp(4)+bottomInset;view.setLayoutParams(p);
    }
    boolean contains(float x,float y){return hit(back,x,y)||hit(more,x,y);}
    private boolean hit(View view,float x,float y){
        if(!isShown()||!view.isShown())return false;
        int[] p=new int[2];view.getLocationOnScreen(p);
        return x>=p[0]&&x<p[0]+view.getWidth()&&y>=p[1]&&y<p[1]+view.getHeight();
    }
}
