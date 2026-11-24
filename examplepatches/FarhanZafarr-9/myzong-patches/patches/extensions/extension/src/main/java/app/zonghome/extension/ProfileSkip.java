package app.zonghome.extension;

import android.os.Bundle;
import android.view.View;
import android.view.ViewTreeObserver;
import java.lang.ref.WeakReference;

/** Optional post-OTP route. The normal fragment callback initializes account state first. */
public final class ProfileSkip {
    private ProfileSkip() {}
    public static void nativeHome(Object fragment) { } // Replaced by a verified native bridge.
    public static void attach(Object fragment,View root) {
        if(fragment==null || root==null)return;
        try {
            Bundle args=(Bundle)fragment.getClass().getMethod("getArguments").invoke(fragment);
            if(args==null || !ProfileSkipPolicy.shouldSkip(args.getBoolean("isFromPin",false),args.getBoolean("isFromNav",false)))return;
        } catch(ReflectiveOperationException | SecurityException ignored) { return; }
        Pending pending=new Pending(fragment,root);
        root.addOnAttachStateChangeListener(pending);
        if(root.isAttachedToWindow())pending.onViewAttachedToWindow(root);
    }
    private static final class Pending implements ViewTreeObserver.OnPreDrawListener,View.OnAttachStateChangeListener {
        final WeakReference<Object> fragment;
        final WeakReference<View> root;
        ViewTreeObserver tree;
        Pending(Object fragment,View root){this.fragment=new WeakReference<>(fragment);this.root=new WeakReference<>(root);}
        @Override public void onViewAttachedToWindow(View view) {
            tree=view.getViewTreeObserver();tree.addOnPreDrawListener(this);
        }
        @Override public void onViewDetachedFromWindow(View view){remove(view);}
        private void remove(View view){
            if(tree!=null && tree.isAlive())tree.removeOnPreDrawListener(this);
            tree=null;view.removeOnAttachStateChangeListener(this);
        }
        @Override public boolean onPreDraw() {
            View view=root.get();Object screen=fragment.get();
            if(view==null)return true;
            if(!view.isShown())return true;
            remove(view);
            if(screen==null)return true;
            float alpha=view.getAlpha();view.setAlpha(0f);
            try {nativeHome(screen);}catch(RuntimeException failedNavigation){view.setAlpha(alpha);}
            return true;
        }
    }
}
