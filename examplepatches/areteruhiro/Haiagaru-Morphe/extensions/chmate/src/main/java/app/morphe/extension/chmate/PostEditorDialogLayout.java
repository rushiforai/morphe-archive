package app.morphe.extension.chmate;

import android.app.Activity;
import android.graphics.Rect;
import android.view.View;
import android.view.ViewGroup;

/** 242 floating editor: keep the native panel inside the viewport after IME/rotation layout. */
public final class PostEditorDialogLayout {
    public static void fit(ViewGroup root){
        if(root==null||root.getChildCount()!=1||root.getWidth()<=0||root.getHeight()<=0)return;
        Activity activity=NativeToolTabs.activity(root.getContext());
        if(activity==null||!activity.getClass().getName().equals("jp.syoboi.a2chMate.activity.ResEditActivity$Dialog"))return;
        View panel=root.getChildAt(0);
        int left=root.getPaddingLeft(),top=root.getPaddingTop();
        int width=root.getWidth()-left-root.getPaddingRight(),height=root.getHeight()-top-root.getPaddingBottom();
        // The native IME observer is a separate, non-focusable PopupWindow. During
        // attach/OS window changes its height may be zero (or larger than this
        // root). Correct the clipping padding as well as the child coordinates;
        // moving the child alone cannot make it visible through empty padding.
        if(height<=0||root.getPaddingBottom()<0){
            Rect frame=new Rect();int[] location=new int[2];
            root.getWindowVisibleDisplayFrame(frame);root.getLocationOnScreen(location);
            int bottom=Math.min(root.getHeight(),frame.bottom-location[1]);
            if(frame.isEmpty()||bottom<=top)bottom=root.getHeight();
            int padding=Math.max(0,root.getHeight()-bottom);
            if(root.getPaddingBottom()!=padding)root.setPadding(left,top,root.getPaddingRight(),padding);
            height=bottom-top;
        }
        if(width<=0||height<=0)return;
        if(panel.getLeft()>=left&&panel.getRight()<=left+width&&panel.getTop()>=top&&panel.getBottom()<=top+height
                &&panel.getMeasuredWidth()>0&&panel.getMeasuredHeight()>0
                &&panel.getWidth()>0&&panel.getHeight()>0
                &&panel.getMeasuredWidth()<=width&&panel.getMeasuredHeight()<=height)return;
        // Do not animate from/to native off-screen bounds after correcting them.
        if(root.getLayoutTransition()!=null)root.setLayoutTransition(null);
        // Re-measure the existing weighted/scrolling form; retain all controls, listeners and draft text.
        int preferredWidth=panel.getMeasuredWidth();
        if(preferredWidth<=0){
            ViewGroup.LayoutParams params=panel.getLayoutParams();
            preferredWidth=params!=null&&params.width>0?params.width:width;
        }
        panel.measure(View.MeasureSpec.makeMeasureSpec(Math.min(width,preferredWidth),View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(height,View.MeasureSpec.AT_MOST));
        int w=panel.getMeasuredWidth(),h=panel.getMeasuredHeight();
        int x=left+(width-w)/2,y=Math.max(top,Math.min(panel.getTop(),top+height-h));
        panel.layout(x,y,x+w,y+h);
    }
    private PostEditorDialogLayout(){}
}
