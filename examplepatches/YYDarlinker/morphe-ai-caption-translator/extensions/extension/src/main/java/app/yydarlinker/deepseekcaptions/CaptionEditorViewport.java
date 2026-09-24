package app.yydarlinker.deepseekcaptions;

import android.content.Context;
import android.graphics.Rect;
import android.os.Build;
import android.view.*;
import android.widget.EditText;
import android.widget.ListView;
import java.util.WeakHashMap;

/** Scoped IME handling for inline editors in Activity OR nested PreferenceScreen dialog windows. */
final class CaptionEditorViewport implements ViewTreeObserver.OnGlobalLayoutListener, ViewTreeObserver.OnPreDrawListener {
    private static final WeakHashMap<View,WindowLease> windows=new WeakHashMap<>();
    private static final class WindowLease {
        int users;
        int originalAdjustment;
        boolean changed;
    }
    private final EditText editor;
    private View root;
    private ListView list;
    private int originalBottom;
    private int appliedBottom;
    private int lastBottom=-1,lastHeight=-1;
    private int visibleBottom;
    private boolean queued;
    CaptionEditorViewport(EditText editor){this.editor=editor;}

    void attach(){
        root=editor.getRootView();
        if(root==null)return;
        // The Morphe nested screen is a Dialog, not necessarily the Context's Activity window.
        WindowLease lease=windows.get(root);
        if(lease==null){
            lease=new WindowLease();windows.put(root,lease);
            if(root.getLayoutParams() instanceof WindowManager.LayoutParams){
                WindowManager.LayoutParams attrs=(WindowManager.LayoutParams)root.getLayoutParams();
                lease.originalAdjustment=attrs.softInputMode & WindowManager.LayoutParams.SOFT_INPUT_MASK_ADJUST;
                lease.changed=lease.originalAdjustment!=WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE
                        && adjust(root,WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
            }
        }
        lease.users++;
        root.getViewTreeObserver().addOnGlobalLayoutListener(this);
        root.getViewTreeObserver().addOnPreDrawListener(this);
    }
    private static boolean adjust(View root,int adjustment){
        if(!(root.getLayoutParams() instanceof WindowManager.LayoutParams))return false;
        WindowManager.LayoutParams attrs=new WindowManager.LayoutParams();attrs.copyFrom((WindowManager.LayoutParams)root.getLayoutParams());
        attrs.softInputMode=(attrs.softInputMode & ~WindowManager.LayoutParams.SOFT_INPUT_MASK_ADJUST)|adjustment;
        try{
            ((WindowManager)root.getContext().getSystemService(Context.WINDOW_SERVICE)).updateViewLayout(root,attrs);
            return true;
        }catch(IllegalArgumentException | IllegalStateException unavailable){return false;}
    }
    void detach(){
        restorePadding();
        if(root==null)return;
        if(root.getViewTreeObserver().isAlive()){root.getViewTreeObserver().removeOnGlobalLayoutListener(this);root.getViewTreeObserver().removeOnPreDrawListener(this);}
        WindowLease lease=windows.get(root);
        if(lease!=null && --lease.users==0){
            if(lease.changed)adjust(root,lease.originalAdjustment);
            windows.remove(root);
        }
        root=null;
    }
    void focus(boolean focused){if(focused)reveal();else restorePadding();}
    // IME inset animations need not trigger layout on an edge-to-edge window.
    @Override public boolean onPreDraw(){onGlobalLayout();return true;}
    @Override public void onGlobalLayout(){
        if(root==null||!editor.hasFocus())return;
        Rect visible=new Rect();root.getWindowVisibleDisplayFrame(visible);
        int bottom=visible.bottom;
        if(bottom<=0)return;
        if(Build.VERSION.SDK_INT>=30){
            WindowInsets insets=root.getRootWindowInsets();
            if(insets!=null && insets.isVisible(WindowInsets.Type.ime())){
                WindowManager wm=(WindowManager)root.getContext().getSystemService(Context.WINDOW_SERVICE);
                int windowBottom=wm.getCurrentWindowMetrics().getBounds().bottom;
                bottom=Math.min(bottom,windowBottom-insets.getInsets(WindowInsets.Type.ime()).bottom);
            }
        }
        visibleBottom=bottom;
        // On edge-to-edge hosts which ignore adjustResize, give the ListView only the missing
        // scroll range. Never add the full IME height on top of an already resized viewport.
        if(list==null){
            for(ViewParent p=editor.getParent();p!=null;p=p.getParent())if(p instanceof ListView){
                list=(ListView)p;originalBottom=list.getPaddingBottom();appliedBottom=originalBottom;break;
            }
        }
        if(list!=null){
            int[] location=new int[2];list.getLocationOnScreen(location);
            int overlap=Math.max(0,location[1]+list.getHeight()-bottom);
            int padding=originalBottom+overlap;
            if(padding!=appliedBottom){list.setPadding(list.getPaddingLeft(),list.getPaddingTop(),list.getPaddingRight(),padding);appliedBottom=padding;}
        }
        if(bottom!=lastBottom||root.getHeight()!=lastHeight){
            lastBottom=bottom;lastHeight=root.getHeight();reveal();
        }
    }
    void reveal(){
        if(queued||!editor.hasFocus())return;
        queued=true;
        editor.post(()->{
            queued=false;if(!editor.hasFocus()||!editor.isAttachedToWindow())return;
            int caret=Math.max(0,editor.getSelectionEnd());
            editor.bringPointIntoView(caret);
            int y=0;
            if(editor.getLayout()!=null)y=editor.getLayout().getLineTop(editor.getLayout().getLineForOffset(caret));
            int top=Math.max(0,y+editor.getTotalPaddingTop()-editor.getScrollY());
            int margin=CaptionSettingsStyle.dp(editor.getContext(),12);
            // Prefer the entire field if it fits, otherwise keep the insertion line visible.
            int[] screen=new int[2];editor.getLocationOnScreen(screen);
            int targetBottom=top+editor.getLineHeight()+margin;
            if(list!=null && visibleBottom>0){
                int[] listScreen=new int[2];list.getLocationOnScreen(listScreen);
                int available=visibleBottom-listScreen[1]-list.getPaddingTop()-margin;
                if(editor.getHeight()<=available)targetBottom=editor.getHeight()+margin;
            }
            editor.requestRectangleOnScreen(new Rect(0,Math.max(0,top-margin),editor.getWidth(),targetBottom),true);
            // ListView may consider a child visible behind an IME: explicitly correct screen-space overlap.
            if(list!=null && visibleBottom>0){
                editor.getLocationOnScreen(screen);
                int overlap=screen[1]+targetBottom-visibleBottom;
                if(overlap>0)list.scrollListBy(overlap);
            }
        });
    }
    private void restorePadding(){
        if(list!=null && list.getPaddingBottom()==appliedBottom)
            list.setPadding(list.getPaddingLeft(),list.getPaddingTop(),list.getPaddingRight(),originalBottom);
        list=null;lastBottom=-1;lastHeight=-1;visibleBottom=0;
    }
}
