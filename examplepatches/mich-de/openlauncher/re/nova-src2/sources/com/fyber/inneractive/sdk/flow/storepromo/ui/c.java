package com.fyber.inneractive.sdk.flow.storepromo.ui;

import android.content.Context;
import android.content.IntentFilter;
import android.content.res.Resources;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.RelativeLayout;
import com.fyber.inneractive.sdk.R;
import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.config.r;
import com.fyber.inneractive.sdk.util.o;

/* loaded from: classes3.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public View f28379a;

    /* renamed from: b, reason: collision with root package name */
    public ViewGroup f28380b;

    /* renamed from: c, reason: collision with root package name */
    public final Animation f28381c;

    /* renamed from: d, reason: collision with root package name */
    public final Animation f28382d;

    /* renamed from: e, reason: collision with root package name */
    public b f28383e;

    /* renamed from: f, reason: collision with root package name */
    public com.fyber.inneractive.sdk.flow.storepromo.b f28384f;

    /* renamed from: g, reason: collision with root package name */
    public final float f28385g;

    /* renamed from: h, reason: collision with root package name */
    public int f28386h = -1;

    /* renamed from: i, reason: collision with root package name */
    public final a f28387i = new a(this);

    public c(Context context, View view, com.fyber.inneractive.sdk.flow.storepromo.b bVar) throws Resources.NotFoundException {
        float f11;
        this.f28379a = view;
        this.f28381c = AnimationUtils.loadAnimation(context, R.anim.store_promo_appear_anim);
        this.f28382d = AnimationUtils.loadAnimation(context, R.anim.store_promo_disappear_anim);
        r rVar = IAConfigManager.Q.f27761u.f27936b;
        rVar.getClass();
        try {
            f11 = Float.parseFloat(rVar.a("dtx_store_promo_height", Float.toString(0.7f)));
        } catch (Throwable unused) {
            f11 = 0.7f;
        }
        this.f28385g = Math.max(f11, 0.7f);
        this.f28384f = bVar;
        ViewGroup viewGroup = (ViewGroup) LayoutInflater.from(context).inflate(R.layout.dt_store_promo_layout, (ViewGroup) null);
        this.f28380b = viewGroup;
        viewGroup.setOnClickListener(null);
        this.f28380b.setBackgroundColor(context.getResources().getColor(R.color.dtx_store_promo_bg_fade));
        ViewGroup.LayoutParams layoutParams = new ViewGroup.LayoutParams(-1, -1);
        RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams2.addRule(12);
        this.f28379a.setLayoutParams(layoutParams2);
        this.f28380b.setVisibility(8);
        ViewGroup viewGroup2 = this.f28380b;
        if (viewGroup2 != null) {
            viewGroup2.setLayoutParams(layoutParams);
            this.f28380b.addView(this.f28379a);
        }
        if (this.f28383e == null) {
            b bVar2 = new b(this);
            this.f28383e = bVar2;
            o.f31210a.registerReceiver(bVar2, new IntentFilter("android.intent.action.CONFIGURATION_CHANGED"));
        }
    }

    public final void a() {
        View view;
        int iB = o.b();
        if (iB == this.f28386h || (view = this.f28379a) == null || view.getLayoutParams() == null) {
            return;
        }
        this.f28386h = iB;
        RelativeLayout.LayoutParams layoutParams = (RelativeLayout.LayoutParams) this.f28379a.getLayoutParams();
        layoutParams.height = iB == 2 ? o.d() : (int) (o.c() * this.f28385g);
        this.f28379a.setLayoutParams(layoutParams);
    }
}
