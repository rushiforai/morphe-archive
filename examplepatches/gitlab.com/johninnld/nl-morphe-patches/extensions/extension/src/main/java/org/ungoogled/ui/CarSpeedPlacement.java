package org.ungoogled.ui;

import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.RectF;
import android.view.View;
import android.view.ViewGroup;
import java.lang.ref.WeakReference;

/** Keeps the existing Maps speed card inside the current AA surface reservation. */
final class CarSpeedPlacement {
    private WeakReference<View> card = new WeakReference<>(null);
    private float nativeX, nativeY, offsetX, offsetY, appliedX, appliedY;
    private float nativeAlpha, appliedAlpha;
    private final java.util.Map<ViewGroup,boolean[]> clips=new java.util.WeakHashMap<>();

    Rect place(ViewGroup root, View next, Rect safe) { return place(root, next, safe, false); }

    /** With [conceal] the card keeps its place but is not drawn: an app speed pill replaces it. */
    Rect place(ViewGroup root, View next, Rect safe, boolean conceal) {
        View previous = card.get();
        if (previous != next) {
            restore();
            if (next == null) return null;
            card = new WeakReference<>(next);
            nativeX = appliedX = next.getTranslationX();
            nativeY = appliedY = next.getTranslationY();
            nativeAlpha = appliedAlpha = next.getAlpha();
        }
        if (next == null) return null;
        // Native animations/layout may replace our previous value. Preserve their
        // new baseline instead of accumulating translations at each pre-draw.
        if (next.getTranslationX() != appliedX) { nativeX = next.getTranslationX(); offsetX = 0; }
        if (next.getTranslationY() != appliedY) { nativeY = next.getTranslationY(); offsetY = 0; }
        if (next.getAlpha() != appliedAlpha) nativeAlpha = next.getAlpha();

        RectF bounds = bounds(root, next);
        Matrix parentToRoot = toRoot(root, next.getParent() instanceof View ? (View) next.getParent() : null);
        Matrix inverse = new Matrix();
        boolean fits = bounds != null && parentToRoot != null && parentToRoot.invert(inverse)
                && safe != null && !safe.isEmpty()
                && bounds.width() <= safe.width() && bounds.height() <= safe.height();
        if (!fits) {
            setAlpha(next, 0);
            restoreClips();
            return null;
        }
        float[] oldOffset = {offsetX, offsetY};
        parentToRoot.mapVectors(oldOffset);
        bounds.offset(-oldOffset[0], -oldOffset[1]);
        float dx = bounds.left < safe.left ? safe.left - bounds.left : Math.min(0, safe.right - bounds.right);
        float dy = bounds.top < safe.top ? safe.top - bounds.top : Math.min(0, safe.bottom - bounds.bottom);
        float[] delta = {dx, dy};
        inverse.mapVectors(delta);
        offsetX = delta[0]; offsetY = delta[1];
        appliedX = nativeX + offsetX; appliedY = nativeY + offsetY;
        if (next.getTranslationX() != appliedX) next.setTranslationX(appliedX);
        if (next.getTranslationY() != appliedY) next.setTranslationY(appliedY);
        setAlpha(next, conceal ? 0 : nativeAlpha);
        if (conceal || nativeAlpha <= 0 || !visible(next, root)) { restoreClips(); return null; }
        bounds.offset(dx, dy);
        // The dedicated card can sit in a tightly measured native wrapper.
        // Let this moved child reach its safe position without translating the
        // watermark or changing native layout constraints. Restore on return.
        java.util.Set<ViewGroup> needed=java.util.Collections.newSetFromMap(new java.util.IdentityHashMap<>());
        for(View node=next.getParent() instanceof View?(View)next.getParent():null;node!=null&&node!=root;
                node=node.getParent() instanceof View?(View)node.getParent():null){
            if(node instanceof ViewGroup){
                ViewGroup group=(ViewGroup)node;Matrix transform=toRoot(root,group);
                if(transform==null)continue;
                RectF parentBounds=new RectF(0,0,group.getWidth(),group.getHeight());transform.mapRect(parentBounds);
                RectF paddingBounds=new RectF(group.getPaddingLeft(),group.getPaddingTop(),group.getWidth()-group.getPaddingRight(),group.getHeight()-group.getPaddingBottom());transform.mapRect(paddingBounds);
                boolean[] original=clips.get(group);
                boolean children=original==null?group.getClipChildren():original[0];
                boolean padding=original==null?group.getClipToPadding():original[1];
                if(children&&!parentBounds.contains(bounds)||padding&&!paddingBounds.contains(bounds)){
                    needed.add(group);
                    if(original==null)clips.put(group,new boolean[]{children,padding});
                    if(group.getClipChildren())group.setClipChildren(false);
                    if(group.getClipToPadding())group.setClipToPadding(false);
                }
            }
        }
        for(ViewGroup group:new java.util.ArrayList<>(clips.keySet()))if(!needed.contains(group))restoreClip(group);
        Rect result = new Rect(); bounds.roundOut(result);
        return result;
    }

    void restore() {
        restoreClips();
        View view = card.get();
        if (view != null) {
            if (view.getTranslationX() == appliedX) view.setTranslationX(nativeX);
            if (view.getTranslationY() == appliedY) view.setTranslationY(nativeY);
            if (view.getAlpha() == appliedAlpha) view.setAlpha(nativeAlpha);
        }
        card.clear(); offsetX = offsetY = 0;
    }

    private void restoreClip(ViewGroup group){
        boolean[] original=clips.remove(group);
        if(!group.getClipChildren())group.setClipChildren(original[0]);
        if(!group.getClipToPadding())group.setClipToPadding(original[1]);
    }
    private void restoreClips(){
        for(ViewGroup group:new java.util.ArrayList<>(clips.keySet()))restoreClip(group);
    }

    private void setAlpha(View view, float value) {
        appliedAlpha = value;
        if (view.getAlpha() != value) view.setAlpha(value);
    }

    private static boolean visible(View view, View root) {
        for (View node = view; node != null; node = node.getParent() instanceof View ? (View) node.getParent() : null) {
            if (node.getVisibility() != View.VISIBLE) return false;
            if (node == root) return true;
        }
        return false;
    }

    /** Unclipped geometry: a card clipped by its old parent still needs relocating. */
    private static RectF bounds(ViewGroup root, View view) {
        if (view.getWidth() <= 0 || view.getHeight() <= 0) return null;
        Matrix transform = toRoot(root, view);
        if (transform == null) return null;
        RectF result = new RectF(0, 0, view.getWidth(), view.getHeight());
        transform.mapRect(result);
        return result;
    }

    private static Matrix toRoot(ViewGroup root, View view) {
        if (view == null) return null;
        Matrix rootGlobal = new Matrix(), inverse = new Matrix(), viewGlobal = new Matrix();
        root.transformMatrixToGlobal(rootGlobal);
        if (!rootGlobal.invert(inverse)) return null;
        view.transformMatrixToGlobal(viewGlobal);
        Matrix result = new Matrix(); result.setConcat(inverse, viewGlobal);
        return result;
    }
}
