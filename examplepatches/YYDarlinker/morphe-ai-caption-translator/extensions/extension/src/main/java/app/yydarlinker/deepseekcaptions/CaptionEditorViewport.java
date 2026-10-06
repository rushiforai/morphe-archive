package app.yydarlinker.deepseekcaptions;

import android.content.Context;
import android.graphics.Rect;
import android.os.Build;
import android.view.*;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.ListView;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.WeakHashMap;

/**
 * Scoped IME handling for inline editors in Activity OR nested PreferenceScreen dialog windows.
 *
 * <p>N36 contract: one coordinator per real root/window, the focused editor is the only one that may
 * act, and the platform native IME resize / TextView caret handling is the primary path. The
 * coordinator never polls per frame: there is no {@code OnPreDrawListener} and no automatic
 * bring-into-view driven by focus, by ordinary row rebinding, or by {@code getView} recycling. A
 * scroll request exists only while the IME is actually served on the registered editor and the user
 * is actively editing it, and the bounded list padding is submitted only when a window genuinely does
 * not resize for the IME.</p>
 */
final class CaptionEditorViewport {
    /** Bounded evidence for the N36 IME/layout lane. Read-only; production never branches on it. */
    static long forcedScrollCalls, paddingCalls, modeFlipCalls, layoutObservations, boundedRevealCalls, caretBrings;

    private static final WeakHashMap<View,WindowLease> windows=new WeakHashMap<>();

    private static final class WindowLease {
        final WeakReference<View> root;
        final int originalAdjustment;
        final boolean resized;
        final boolean imeEligible;
        final ArrayList<CaptionEditorViewport> users=new ArrayList<>(4);
        View.OnAttachStateChangeListener watcher;
        WindowLease(View root){
            this.root=new WeakReference<>(root);
            int adjust=WindowManager.LayoutParams.SOFT_INPUT_ADJUST_UNSPECIFIED;
            if(root.getLayoutParams() instanceof WindowManager.LayoutParams)
                adjust=((WindowManager.LayoutParams)root.getLayoutParams()).softInputMode
                        & WindowManager.LayoutParams.SOFT_INPUT_MASK_ADJUST;
            originalAdjustment=adjust;
            resized=adjust==WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE;
            imeEligible=windowAcceptsIme(root);
        }
    }

    private final WeakReference<EditText> owner;
    private final ViewTreeObserver.OnGlobalLayoutListener layoutListener=this::onGlobalLayout;
    private View root;
    private WindowLease lease;
    private ListView list;
    /** Row recycling only detaches the row; the window lease survives until the real root detaches. */
    private boolean attached;
    /** True only while this editor is the registered coordinator target of its window. */
    private boolean coordinator;
    /** Armed by genuine user editing; disarmed once the bounded correction has been submitted. */
    private boolean userEditing;
    /** The only queued reveal task. A newer request replaces the older one. */
    private Runnable queuedReveal;
    private boolean imeVisible;
    private int originalBottom,appliedBottom;
    /** Last editor screen top: a scroll that only moves the row is not an occlusion change. */
    private int lastEditorTop=Integer.MIN_VALUE;

    CaptionEditorViewport(EditText editor){owner=new WeakReference<>(editor);}

    private EditText editor(){return owner.get();}

    void attach(){
        EditText e=editor();
        if(e==null)return;
        root=e.getRootView();
        if(root==null)return;
        lease=windows.get(root);
        if(lease==null){
            lease=new WindowLease(root);
            windows.put(root,lease);
            final View leasedRoot=root;final WindowLease leasedLease=lease;
            lease.watcher=new View.OnAttachStateChangeListener(){
                @Override public void onViewAttachedToWindow(View v) {}
                @Override public void onViewDetachedFromWindow(View v){cleanupWindow(leasedRoot,leasedLease);}
            };
            root.addOnAttachStateChangeListener(lease.watcher);
            if(!lease.resized && lease.imeEligible){
                // Only a window this extension owns the editing contract for is adjusted, and only when
                // the platform would not resize it for the IME. The original mode is restored when the
                // real root detaches; no host flag is cleared globally.
                if(adjust(root,WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE))modeFlipCalls++;
            }
        }
        if(!lease.users.contains(this))lease.users.add(this);
        attached=true;
        if(root.getViewTreeObserver().isAlive())
            root.getViewTreeObserver().addOnGlobalLayoutListener(layoutListener);
    }

    private static void cleanupWindow(View root,WindowLease lease){
        if(root==null||lease==null||windows.get(root)!=lease)return;
        if(lease.root.get()!=root)return;
        if(lease.originalAdjustment!=WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE)adjust(root,lease.originalAdjustment);
        if(lease.watcher!=null)root.removeOnAttachStateChangeListener(lease.watcher);
        for(CaptionEditorViewport user:new ArrayList<>(lease.users))user.windowDetached();
        lease.users.clear();
        windows.remove(root);
    }

    private static boolean windowAcceptsIme(View root){
        if(!(root.getLayoutParams() instanceof WindowManager.LayoutParams))return false;
        int flags=((WindowManager.LayoutParams)root.getLayoutParams()).flags;
        if((flags & WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE)!=0)return false;
        if((flags & WindowManager.LayoutParams.FLAG_ALT_FOCUSABLE_IM)!=0)return false;
        return true;
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

    /** The real window is gone: release its resources and every per-editor task it owned. */
    private void windowDetached(){
        detach();
    }

    void detach(){
        // Row recycling is not window destruction. Keep the root lease until the root really detaches,
        // so entering/leaving the preview edge never flips the window's soft-input mode.
        cancelQueuedReveal();
        restorePadding();
        View view=root;
        if(view!=null && view.getViewTreeObserver().isAlive())
            view.getViewTreeObserver().removeOnGlobalLayoutListener(layoutListener);
        WindowLease current=lease;
        if(current!=null){
            current.users.remove(this);
            if(current.users.isEmpty() && current.root.get()==null)windows.remove(view);
        }
        root=null;lease=null;list=null;
        attached=false;coordinator=false;userEditing=false;imeVisible=false;
    }

    private void cancelQueuedReveal(){
        if(queuedReveal!=null){
            EditText e=editor();
            if(e!=null)e.removeCallbacks(queuedReveal);
            View view=root;
            if(view!=null)view.removeCallbacks(queuedReveal);
            queuedReveal=null;
        }
    }

    void focus(boolean focused){
        if(!focused){restorePadding();userEditing=false;imeVisible=false;return;}
        EditText e=editor();
        if(e==null||!attached)return;
        // Focus alone is not an input action: the IME decides visibility and only a real editing
        // session arms the bounded correction below.
        registerCoordinator();
    }

    /** Called by the editor when a genuine text/IME interaction happened (tap, IME command). */
    void beginUserEdit(){
        EditText e=editor();
        if(e==null||!attached)return;
        userEditing=true;
        registerCoordinator();
    }

    private void registerCoordinator(){
        if(lease==null)return;
        coordinator=true;
        for(CaptionEditorViewport other:new ArrayList<>(lease.users))
            if(other!=this)other.yieldCoordinator();
    }

    /** Another editor of the same window owns the current interaction: drop our per-editor work. */
    private void yieldCoordinator(){
        coordinator=false;userEditing=false;imeVisible=false;
        cancelQueuedReveal();
        restorePadding();
    }

    int appliedBottomPadding(){return appliedBottom;}
    int originalBottomPadding(){return originalBottom;}
    static int windowUsers(View root){WindowLease lease=windows.get(root);return lease==null?0:lease.users.size();}
    static boolean windowAdjusted(View root){WindowLease lease=windows.get(root);return lease!=null&&lease.resized;}

    /**
     * Layout observation only, and only for the current editor. The IME is closed and the user is not
     * editing: nothing is requested, so an ordinary preview scroll can never be pulled back to a caret.
     */
    void onGlobalLayout(){
        if(!attached||!coordinator)return;
        layoutObservations++;
        EditText e=editor();
        if(e==null||!e.isAttachedToWindow()||!e.hasFocus())return;
        boolean visible=imeVisibleOn(e);
        boolean wasVisible=imeVisible;
        imeVisible=visible;
        if(!visible){
            if(wasVisible)restorePadding(); // The IME closed: one restore, then this window owes nothing.
            userEditing=false;
            return;
        }
        if(!userEditing)return;
        int[] screen=new int[2];e.getLocationOnScreen(screen);
        boolean moved=screen[1]!=lastEditorTop;
        lastEditorTop=screen[1];
        if(!moved && appliedBottom!=0)return; // Same place, same occlusion: nothing new to submit.
        submitBoundedCorrection(e);
    }

    /** The single bounded correction: at most one list range or one rectangle for one edit session. */
    private void submitBoundedCorrection(EditText e){
        if(queuedReveal!=null)return;
        queuedReveal=()->{
            queuedReveal=null;
            EditText current=editor();
            if(!attached||!coordinator||current==null||current!=e)return;
            if(!e.isAttachedToWindow()||!e.hasFocus())return;
            if(!imeVisibleOn(e)){restorePadding();return;}
            userEditing=false;
            reveal(e);
        };
        e.post(queuedReveal);
    }

    /** True only when the platform reports a real IME on this editor's window. */
    private boolean imeVisibleOn(EditText e){
        View view=root;
        if(view==null)return false;
        if(Build.VERSION.SDK_INT>=30){
            WindowInsets insets=view.getRootWindowInsets();
            if(insets!=null)return insets.isVisible(WindowInsets.Type.ime());
        }
        InputMethodManager ime=(InputMethodManager)view.getContext().getSystemService(Context.INPUT_METHOD_SERVICE);
        return ime!=null && ime.isActive(e);
    }

    /**
     * One rectangle or one list range for the caret — never both, and never a padding/requestLayout
     * per frame. Every coordinate comes from this same root/window: its visible frame, its insets and
     * the list's real screen position.
     */
    private void reveal(EditText e){
        boundedRevealCalls++;
        View view=root;
        if(view==null)return;
        Rect visible=new Rect();
        view.getWindowVisibleDisplayFrame(visible);
        if(visible.bottom<=0)return;
        if(Build.VERSION.SDK_INT>=30){
            WindowInsets insets=view.getRootWindowInsets();
            if(insets!=null && insets.isVisible(WindowInsets.Type.ime())){
                WindowManager wm=(WindowManager)view.getContext().getSystemService(Context.WINDOW_SERVICE);
                int windowBottom=wm.getCurrentWindowMetrics().getBounds().bottom;
                visible.bottom=Math.min(visible.bottom,windowBottom-insets.getInsets(WindowInsets.Type.ime()).bottom);
            }
        }
        int margin=CaptionSettingsStyle.dp(e.getContext(),12);
        int[] screen=new int[2];
        e.getLocationOnScreen(screen);
        int lineHeight=Math.max(1,e.getLineHeight());
        int caret=Math.max(0,e.getSelectionEnd());
        int y=0;
        if(e.getLayout()!=null)y=e.getLayout().getLineTop(e.getLayout().getLineForOffset(caret));
        int top=Math.max(0,y+e.getTotalPaddingTop()-e.getScrollY());
        int targetBottom=top+lineHeight+margin;
        if(e.getHeight()>0 && e.getHeight()<=visible.height()-margin*2)targetBottom=e.getHeight()+margin;
        if(screen[1]+targetBottom<=visible.bottom)return; // Already visible: no rectangle, no scroll.
        ListView owning=listOf(e);
        if(owning!=null && (lease==null || !lease.resized)){
            int[] listScreen=new int[2];owning.getLocationOnScreen(listScreen);
            int overlap=Math.max(0,listScreen[1]+owning.getHeight()-visible.bottom);
            int padding=originalBottom+overlap;
            if(padding!=appliedBottom){
                owning.setPadding(owning.getPaddingLeft(),owning.getPaddingTop(),owning.getPaddingRight(),padding);
                appliedBottom=padding;paddingCalls++;
            }
            if(overlap>0){forcedScrollCalls++;owning.scrollListBy(overlap);}
            return;
        }
        forcedScrollCalls++;
        caretBrings++;
        e.requestRectangleOnScreen(new Rect(0,Math.max(0,top-margin),Math.max(1,e.getWidth()),targetBottom),true);
    }

    private ListView listOf(EditText e){
        if(list!=null && list.isAttachedToWindow())return list;
        for(ViewParent p=e.getParent();p!=null;p=p.getParent())
            if(p instanceof ListView){
                list=(ListView)p;originalBottom=list.getPaddingBottom();appliedBottom=originalBottom;break;
            }
        return list;
    }

    private void restorePadding(){
        // One restore per hide. A later IME session re-reads the current padding, so repeated
        // open/close cycles cannot accumulate or leak another editor's inset.
        if(list!=null){
            int current=list.getPaddingBottom();
            if(current==appliedBottom && appliedBottom!=originalBottom)
                list.setPadding(list.getPaddingLeft(),list.getPaddingTop(),list.getPaddingRight(),originalBottom);
        }
        list=null;appliedBottom=0;originalBottom=0;lastEditorTop=Integer.MIN_VALUE;
    }
}
