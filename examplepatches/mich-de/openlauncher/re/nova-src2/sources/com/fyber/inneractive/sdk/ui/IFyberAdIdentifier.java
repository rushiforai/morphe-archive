package com.fyber.inneractive.sdk.ui;

import android.view.ViewGroup;
import com.fyber.inneractive.sdk.config.global.r;

/* loaded from: classes3.dex */
public abstract class IFyberAdIdentifier {

    /* renamed from: a, reason: collision with root package name */
    public ClickListener f31139a;

    /* renamed from: b, reason: collision with root package name */
    public final int f31140b;

    /* renamed from: c, reason: collision with root package name */
    public final int f31141c;

    /* renamed from: d, reason: collision with root package name */
    public final int f31142d;

    /* renamed from: e, reason: collision with root package name */
    public final int f31143e;

    /* renamed from: f, reason: collision with root package name */
    public final int f31144f;

    /* renamed from: g, reason: collision with root package name */
    public final String f31145g;

    /* renamed from: h, reason: collision with root package name */
    public final String f31146h;

    /* renamed from: i, reason: collision with root package name */
    public final String f31147i;

    /* renamed from: j, reason: collision with root package name */
    public final boolean f31148j;

    /* renamed from: k, reason: collision with root package name */
    public Corner f31149k = Corner.BOTTOM_LEFT;

    /* renamed from: l, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.config.global.features.a f31150l;

    public interface ClickListener {
        void a();
    }

    public enum Corner {
        TOP_LEFT,
        TOP_RIGHT,
        BOTTOM_LEFT,
        BOTTOM_RIGHT
    }

    public IFyberAdIdentifier(r rVar) {
        this.f31140b = 0;
        this.f31141c = 0;
        this.f31142d = 0;
        this.f31143e = 0;
        this.f31144f = 0;
        this.f31145g = null;
        this.f31146h = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.f31147i = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.f31148j = false;
        this.f31150l = com.fyber.inneractive.sdk.config.global.features.b.f27816e;
        if (rVar != null) {
            com.fyber.inneractive.sdk.config.global.features.b bVar = (com.fyber.inneractive.sdk.config.global.features.b) rVar.a(com.fyber.inneractive.sdk.config.global.features.b.class);
            Integer numA = bVar.a("ad_identifier_text_size_w");
            this.f31140b = numA != null ? numA.intValue() : 110;
            Integer numA2 = bVar.a("ad_identifier_text_size_h");
            this.f31141c = numA2 != null ? numA2.intValue() : 18;
            Integer numA3 = bVar.a("ad_identifier_image_size_w");
            this.f31142d = numA3 != null ? numA3.intValue() : 18;
            Integer numA4 = bVar.a("ad_identifier_image_size_h");
            this.f31143e = numA4 != null ? numA4.intValue() : 18;
            Integer numA5 = bVar.a("ad_identifier_text_size");
            this.f31144f = numA5 != null ? numA5.intValue() : 8;
            this.f31145g = bVar.a("ad_identifier_tint_color", "#75DCDCDC");
            this.f31150l = bVar.c();
            this.f31146h = bVar.a("ad_identifier_text", "Tap for more information");
            this.f31147i = bVar.a("ad_identifier_icon_url", null);
            this.f31148j = true;
        }
    }

    public abstract void a(ViewGroup viewGroup);
}
