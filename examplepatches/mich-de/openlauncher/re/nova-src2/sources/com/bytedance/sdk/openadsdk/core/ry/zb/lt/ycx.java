package com.bytedance.sdk.openadsdk.core.ry.zb.lt;

import android.content.Context;
import android.graphics.Canvas;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.FrameLayout;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import androidx.recyclerview.widget.m1;
import androidx.recyclerview.widget.s2;
import com.bytedance.adsdk.ugeno.lud;
import com.bytedance.adsdk.ugeno.yoga.zb.sya;
import com.bytedance.adsdk.ugeno.zb.sya;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

/* loaded from: classes2.dex */
public class ycx extends FrameLayout {

    /* renamed from: dj, reason: collision with root package name */
    private lud f26015dj;
    private final C0077ycx sya;
    private final RecyclerView ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final List<sya> f26016zb;

    public static class zb extends s2 {
        private final ViewGroup ycx;

        public zb(View view) {
            super(view);
            this.ycx = (ViewGroup) view;
        }

        public void ycx(sya syaVar) {
            View viewEa = syaVar.ea();
            ViewParent parent = viewEa.getParent();
            if (parent instanceof ViewGroup) {
                ((ViewGroup) parent).removeView(viewEa);
            }
            this.ycx.removeAllViews();
            this.ycx.addView(viewEa, new sya.ycx(syaVar.ifb(), syaVar.yzp()));
        }
    }

    public ycx(Context context) {
        super(context);
        this.f26016zb = new CopyOnWriteArrayList();
        C0077ycx c0077ycx = new C0077ycx();
        this.sya = c0077ycx;
        RecyclerView recyclerView = new RecyclerView(context);
        this.ycx = recyclerView;
        addView(recyclerView);
        recyclerView.setAdapter(c0077ycx);
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        lud ludVar = this.f26015dj;
        if (ludVar != null) {
            ludVar.ul();
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        lud ludVar = this.f26015dj;
        if (ludVar != null) {
            ludVar.fby();
        }
    }

    @Override // android.view.View
    public void onDraw(Canvas canvas) {
        super.onDraw(canvas);
    }

    @Override // android.widget.FrameLayout, android.view.ViewGroup, android.view.View
    public void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        lud ludVar = this.f26015dj;
        if (ludVar != null) {
            ludVar.lt();
        }
        super.onLayout(z11, i5, i11, i12, i13);
        lud ludVar2 = this.f26015dj;
        if (ludVar2 != null) {
            ludVar2.ycx(i5, i11, i12, i13);
        }
    }

    @Override // android.widget.FrameLayout, android.view.View
    public void onMeasure(int i5, int i11) {
        lud ludVar = this.f26015dj;
        if (ludVar != null) {
            int[] iArrYcx = ludVar.ycx(i5, i11);
            super.onMeasure(iArrYcx[0], iArrYcx[1]);
        } else {
            super.onMeasure(i5, i11);
        }
        lud ludVar2 = this.f26015dj;
        if (ludVar2 != null) {
            ludVar2.lud();
        }
    }

    @Override // android.view.View
    public void onSizeChanged(int i5, int i11, int i12, int i13) {
        super.onSizeChanged(i5, i11, i12, i13);
        lud ludVar = this.f26015dj;
        if (ludVar != null) {
            ludVar.zb(i5, i11, i12, i13);
        }
    }

    @Override // android.view.View
    public void onWindowFocusChanged(boolean z11) {
        super.onWindowFocusChanged(z11);
        lud ludVar = this.f26015dj;
        if (ludVar != null) {
            ludVar.ycx(z11);
        }
    }

    public void setOrientation(int i5) {
        if (i5 == 1) {
            RecyclerView recyclerView = this.ycx;
            getContext();
            recyclerView.setLayoutManager(new LinearLayoutManager(1, false));
        } else {
            RecyclerView recyclerView2 = this.ycx;
            getContext();
            recyclerView2.setLayoutManager(new LinearLayoutManager(0, false));
        }
    }

    public void ycx(com.bytedance.adsdk.ugeno.zb.sya<View> syaVar) {
        if (syaVar == null) {
            return;
        }
        this.f26016zb.add(syaVar);
        C0077ycx c0077ycx = this.sya;
        if (c0077ycx != null) {
            c0077ycx.notifyDataSetChanged();
        }
    }

    /* renamed from: com.bytedance.sdk.openadsdk.core.ry.zb.lt.ycx$ycx, reason: collision with other inner class name */
    public class C0077ycx extends m1 {
        private C0077ycx() {
        }

        @Override // androidx.recyclerview.widget.m1
        public int getItemCount() {
            return ycx.this.f26016zb.size();
        }

        @Override // androidx.recyclerview.widget.m1
        public int getItemViewType(int i5) {
            return i5;
        }

        @Override // androidx.recyclerview.widget.m1
        /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
        public zb onCreateViewHolder(ViewGroup viewGroup, int i5) {
            com.bytedance.adsdk.ugeno.yoga.zb.sya syaVar = new com.bytedance.adsdk.ugeno.yoga.zb.sya(viewGroup.getContext());
            com.bytedance.adsdk.ugeno.zb.sya syaVar2 = (com.bytedance.adsdk.ugeno.zb.sya) ycx.this.f26016zb.get(i5);
            syaVar.setLayoutParams(new ViewGroup.LayoutParams(syaVar2.ifb(), syaVar2.yzp()));
            return new zb(syaVar);
        }

        @Override // androidx.recyclerview.widget.m1
        /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
        public void onBindViewHolder(zb zbVar, int i5) {
            zbVar.ycx((com.bytedance.adsdk.ugeno.zb.sya) ycx.this.f26016zb.get(i5));
        }
    }

    public void ycx(lud ludVar) {
        this.f26015dj = ludVar;
    }

    public void ycx(com.bytedance.sdk.openadsdk.core.ry.zb.lt.zb zbVar) {
        ViewGroup.LayoutParams layoutParams = this.ycx.getLayoutParams();
        layoutParams.width = zbVar.ifb();
        layoutParams.height = zbVar.yzp();
        this.ycx.setLayoutParams(layoutParams);
    }
}
