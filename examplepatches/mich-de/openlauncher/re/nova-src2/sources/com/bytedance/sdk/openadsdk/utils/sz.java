package com.bytedance.sdk.openadsdk.utils;

import android.graphics.Rect;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import com.bytedance.sdk.openadsdk.ApmHelper;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes2.dex */
public class sz {

    public class ycx implements ViewTreeObserver.OnGlobalLayoutListener {
        final /* synthetic */ boolean sya;
        View ycx = null;

        /* renamed from: zb, reason: collision with root package name */
        final /* synthetic */ ViewGroup f27174zb;

        public ycx(ViewGroup viewGroup, boolean z11) {
            this.f27174zb = viewGroup;
            this.sya = z11;
        }

        @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
        public void onGlobalLayout() {
            try {
                zb zbVar = (zb) this.f27174zb.getTag(520093765);
                if (this.ycx == null) {
                    ViewGroup viewGroup = this.f27174zb;
                    sz.zb(viewGroup, zbVar, (Integer) viewGroup.getTag(520093766), this.sya);
                    return;
                }
                Rect rect = new Rect();
                this.ycx.getGlobalVisibleRect(rect);
                Rect rect2 = new Rect();
                this.f27174zb.getGlobalVisibleRect(rect2);
                if (rect.contains(rect2)) {
                    if (zbVar != null) {
                        zbVar.ycx(this.f27174zb, false);
                    }
                    this.f27174zb.setTag(520093763, Boolean.FALSE);
                } else {
                    if (zbVar != null) {
                        zbVar.ycx(this.f27174zb, true);
                    }
                    this.f27174zb.setTag(520093763, Boolean.TRUE);
                }
            } catch (Exception e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "becogjaoYMuTDoZxjQivPU/CJIYXuWfCkg==", "VOAKmQy+aMusS85SmQU=", 73);
                ApmHelper.reportCustomError("onGlobalLayout exception " + this.f27174zb.getTag(520093765), "ViewUtils", e3);
            }
        }
    }

    public interface zb {
        void ycx();

        void ycx(View view, boolean z11);

        void ycx(boolean z11);

        void zb();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void zb(View view, zb zbVar, Integer num, boolean z11) {
        if (zbVar == null) {
            return;
        }
        if (num == null) {
            num = 0;
        }
        zbVar.ycx(view, ycx(view, num.intValue(), z11));
    }

    public static void ycx(final ViewGroup viewGroup, boolean z11, int i5, final boolean z12, zb zbVar, List<ViewGroup> list) {
        viewGroup.setTag(520093765, zbVar);
        viewGroup.setTag(520093766, Integer.valueOf(i5));
        if (viewGroup.getTag(520093764) == Boolean.TRUE) {
            return;
        }
        final ycx ycxVar = new ycx(viewGroup, z12);
        if (list != null && list.size() > 0) {
            for (int i11 = 0; i11 < list.size(); i11++) {
                list.get(i11).setOnHierarchyChangeListener(new ViewGroup.OnHierarchyChangeListener() { // from class: com.bytedance.sdk.openadsdk.utils.sz.1
                    @Override // android.view.ViewGroup.OnHierarchyChangeListener
                    public void onChildViewAdded(View view, View view2) {
                        ycxVar.ycx = view2;
                    }

                    @Override // android.view.ViewGroup.OnHierarchyChangeListener
                    public void onChildViewRemoved(View view, View view2) {
                        ycxVar.ycx = null;
                    }
                });
            }
        }
        viewGroup.getViewTreeObserver().addOnGlobalLayoutListener(ycxVar);
        if (z11) {
            viewGroup.getViewTreeObserver().addOnScrollChangedListener(new ViewTreeObserver.OnScrollChangedListener() { // from class: com.bytedance.sdk.openadsdk.utils.sz.2
                @Override // android.view.ViewTreeObserver.OnScrollChangedListener
                public void onScrollChanged() {
                    try {
                        zb zbVar2 = (zb) viewGroup.getTag(520093765);
                        ViewGroup viewGroup2 = viewGroup;
                        sz.zb(viewGroup2, zbVar2, (Integer) viewGroup2.getTag(520093766), z12);
                    } catch (Exception e3) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "becogjaoYMuTDoU=", "VOAelhGzZcujQtZTixSk", 108);
                        ApmHelper.reportCustomError("onScrollChanged exception " + viewGroup.getTag(520093765), "ViewUtils", e3);
                    }
                }
            });
        }
        viewGroup.getViewTreeObserver().addOnWindowFocusChangeListener(new ViewTreeObserver.OnWindowFocusChangeListener() { // from class: com.bytedance.sdk.openadsdk.utils.sz.3
            @Override // android.view.ViewTreeObserver.OnWindowFocusChangeListener
            public void onWindowFocusChanged(boolean z13) {
                try {
                    zb zbVar2 = (zb) viewGroup.getTag(520093765);
                    if (zbVar2 != null) {
                        zbVar2.ycx(z13);
                        ViewGroup viewGroup2 = viewGroup;
                        sz.zb(viewGroup2, zbVar2, (Integer) viewGroup2.getTag(520093766), z12);
                    }
                } catch (Exception e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "becogjaoYMuTDoQ=", "VOAanA24ZtCmRdRInzKoKVXpKJE=", 142);
                    ApmHelper.reportCustomError("onWindowFocusChanged exception " + viewGroup.getTag(520093765), "ViewUtils", e3);
                }
            }
        });
        viewGroup.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() { // from class: com.bytedance.sdk.openadsdk.utils.sz.4
            @Override // android.view.View.OnAttachStateChangeListener
            public void onViewAttachedToWindow(View view) {
                zb zbVar2 = (zb) viewGroup.getTag(520093765);
                if (zbVar2 != null) {
                    zbVar2.ycx();
                }
            }

            @Override // android.view.View.OnAttachStateChangeListener
            public void onViewDetachedFromWindow(View view) {
                zb zbVar2 = (zb) viewGroup.getTag(520093765);
                if (zbVar2 != null) {
                    zbVar2.zb();
                }
            }
        });
        viewGroup.setTag(520093764, Boolean.TRUE);
    }

    private static boolean ycx(View view, int i5, boolean z11) {
        return com.bytedance.sdk.openadsdk.core.ifb.ycx(view, 20, i5, z11);
    }

    public static ArrayList<View> ycx(View view, int i5) {
        ArrayList<View> arrayList = new ArrayList<>();
        if (view != null && i5 > 0) {
            Object parent = view.getParent();
            if (parent instanceof ViewGroup) {
                ViewGroup viewGroup = (ViewGroup) parent;
                for (int iIndexOfChild = viewGroup.indexOfChild(view) + 1; iIndexOfChild < viewGroup.getChildCount(); iIndexOfChild++) {
                    arrayList.add(viewGroup.getChildAt(iIndexOfChild));
                }
            }
            if (i5 > 1 && parent != null) {
                arrayList.addAll(ycx((View) parent, i5 - 1));
            }
        }
        return arrayList;
    }

    public static View ycx(View view, Class<? extends View> cls) {
        Object parent;
        if (view == null || cls == null || (parent = view.getParent()) == null) {
            return null;
        }
        if (cls.isInstance(parent)) {
            return (View) parent;
        }
        return ycx((View) parent, cls);
    }
}
