/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.common;

import android.graphics.Rect;
import android.view.View;
import android.view.ViewGroup;
import java.util.IdentityHashMap;
import java.util.Map;

/** Extend the verified native foreground sheet to the navigation edge, preserving safe content insets. */
final class LyricsViewport implements AutoCloseable {
    final View root;
    private final View decor;
    private final View extent;
    private final Map<ViewGroup, boolean[]> clipping = new IdentityHashMap<>();
    private int baseMargin, lastMargin, baseHeight, lastHeight;
    private boolean owned;
    private android.graphics.drawable.Drawable inherited,backgroundBefore;
    private View backgroundOwner;private int backgroundSignature;
    private final android.os.Handler handler=new android.os.Handler(android.os.Looper.getMainLooper());
    private long geometry=Long.MIN_VALUE,stableAt;private int navigation;
    private final Runnable settle=()->update(navigation);

    LyricsViewport(View root, View decor) { this.root = root; this.decor = decor;View sheet=app.bdcrusher.ytmusic.shaders.ShaderRuntime.nativeSheet(root);this.extent=sheet==null?root:sheet; }
    boolean contains(View view){for(View child=root;child!=null;child=child.getParent() instanceof View parent?parent:null)if(child==view)return true;return false;}

    void update(int navigationBottom) {
        navigation=navigationBottom;Rect visible = new Rect();
        if (navigationBottom <= 0 || !root.isShown() || !root.getGlobalVisibleRect(visible)) {
            close();
            return;
        }
        refreshBackground();
        // A full-height sheet may already end at the window edge while a shorter
        // ancestor still clips it at the old navigation boundary. Geometry alone
        // cannot detect that case; release only this foreground ancestor chain.
        for (android.view.ViewParent parent = extent.getParent(); parent instanceof ViewGroup group; parent = group.getParent()) {
            clipping.putIfAbsent(group, new boolean[]{group.getClipChildren(), group.getClipToPadding()});
            if (group.getClipChildren()) group.setClipChildren(false);
            if (group.getClipToPadding()) group.setClipToPadding(false);
            if (group == decor) break;
        }
        ViewGroup.LayoutParams params = extent.getLayoutParams();
        if (params == null) return;
        int[] position = new int[2];
        extent.getLocationInWindow(position);
        int gap = decor.getHeight() - (position[1] + extent.getHeight());
        if (gap < 0 || gap > navigationBottom + 1 || gap == 0) return;
        long current=((long)position[1]<<32)|(extent.getHeight()&0xffffffffL),now=android.os.SystemClock.elapsedRealtime();
        if(current!=geometry){geometry=current;stableAt=now;handler.removeCallbacks(settle);handler.postDelayed(settle,90);return;}
        if(now-stableAt<80)return;
        if (!owned) {
            baseHeight = lastHeight = params.height;
            baseMargin = lastMargin = params instanceof ViewGroup.MarginLayoutParams margin ? margin.bottomMargin : 0;
            owned = true;
        }
        // Native drag/snap/layout changes remain authoritative; retain their latest base.
        if (params.height != lastHeight) baseHeight = params.height;
        if (params instanceof ViewGroup.MarginLayoutParams margin && margin.bottomMargin != lastMargin) baseMargin = margin.bottomMargin;
        boolean changed = false;
        if (params.height >= 0) {
            int next = Math.min(baseHeight + navigationBottom, params.height + gap);
            if (next != params.height) { params.height = next; changed = true; }
        } else if (params.height == ViewGroup.LayoutParams.MATCH_PARENT && params instanceof ViewGroup.MarginLayoutParams margin) {
            int next=Math.max(baseMargin-navigationBottom,margin.bottomMargin-gap);
            if(next!=margin.bottomMargin){margin.bottomMargin=next;changed=true;}
        }
        if (!changed) return;
        lastHeight = params.height;
        if (params instanceof ViewGroup.MarginLayoutParams margin) lastMargin = margin.bottomMargin;
        extent.setLayoutParams(params);
        FeatureDiagnostics.event("Panel-layout","entry="+FeatureDiagnostics.entry()+" extendedBottom="+gap+" navigation="+navigationBottom);
    }

    private static boolean transparent(android.graphics.drawable.Drawable value){return value.getAlpha()==0||value.getOpacity()==android.graphics.PixelFormat.TRANSPARENT;}
    /** Paint the actual extended foreground body with its native sheet background, not a nav strip. */
    void refreshBackground(){
        if(app.bdcrusher.ytmusic.shaders.ShaderRuntime.ownsBackground(root))return;
        if(inherited!=null&&root.getBackground()!=inherited){inherited=null;backgroundOwner=null;}
        if(root.getBackground()!=null&&root.getBackground()!=inherited&&!transparent(root.getBackground()))return;
        View owner=null;android.graphics.drawable.Drawable source=null;
        for(android.view.ViewParent p=root.getParent();p instanceof View view&&view!=decor;p=view.getParent()){
            if(view.getBackground()!=null&&!transparent(view.getBackground())){owner=view;source=view.getBackground();break;}
        }
        if(source==null||source.getConstantState()==null)return;
        int signature=System.identityHashCode(source.getConstantState());
        if(source instanceof android.graphics.drawable.ColorDrawable color)signature=31*signature+color.getColor();
        if(source instanceof android.graphics.drawable.GradientDrawable gradient){
            if(gradient.getColor()!=null)signature=31*signature+gradient.getColor().getDefaultColor();
            signature=31*signature+java.util.Arrays.hashCode(gradient.getColors());
        }
        android.content.res.ColorStateList tint=owner.getBackgroundTintList();if(tint!=null)signature=31*signature+tint.getColorForState(owner.getDrawableState(),tint.getDefaultColor());
        if(inherited!=null&&owner==backgroundOwner&&signature==backgroundSignature)return;
        if(inherited==null)backgroundBefore=root.getBackground();
        inherited=source.getConstantState().newDrawable(root.getResources()).mutate();backgroundOwner=owner;backgroundSignature=signature;
        if(tint!=null)inherited.setTintList(tint);root.setBackground(inherited);
    }
    @Override public void close() {
        handler.removeCallbacks(settle);geometry=Long.MIN_VALUE;
        if(inherited!=null&&root.getBackground()==inherited)root.setBackground(backgroundBefore);inherited=null;backgroundOwner=null;
        if (owned) {
            ViewGroup.LayoutParams params = extent.getLayoutParams();
            if (params != null) {
                boolean changed = false;
                if (params.height == lastHeight && params.height != baseHeight) { params.height = baseHeight; changed = true; }
                if (params instanceof ViewGroup.MarginLayoutParams margin && margin.bottomMargin == lastMargin && margin.bottomMargin != baseMargin) { margin.bottomMargin = baseMargin; changed = true; }
                if (changed) extent.setLayoutParams(params);
            }
            owned = false;
        }
        for (var entry : clipping.entrySet()) {
            entry.getKey().setClipChildren(entry.getValue()[0]);
            entry.getKey().setClipToPadding(entry.getValue()[1]);
        }
        clipping.clear();
    }
}
