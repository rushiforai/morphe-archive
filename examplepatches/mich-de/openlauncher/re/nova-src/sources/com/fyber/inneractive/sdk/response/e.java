package com.fyber.inneractive.sdk.response;

import android.text.TextUtils;
import com.fyber.inneractive.sdk.config.enums.CreativeType;
import com.fyber.inneractive.sdk.config.enums.UnitDisplayType;
import com.fyber.inneractive.sdk.config.global.r;
import com.fyber.inneractive.sdk.external.ImpressionData;
import com.fyber.inneractive.sdk.external.InneractiveAdRequest;
import com.fyber.inneractive.sdk.external.InneractiveErrorCode;
import com.fyber.inneractive.sdk.ignite.m;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/* loaded from: classes.dex */
public abstract class e {
    public String B;
    public String C;
    public String D;
    public String F;
    public CreativeType J;

    /* renamed from: a, reason: collision with root package name */
    public long f31042a;

    /* renamed from: b, reason: collision with root package name */
    public long f31043b;

    /* renamed from: c, reason: collision with root package name */
    public long f31044c;

    /* renamed from: d, reason: collision with root package name */
    public String f31045d;

    /* renamed from: e, reason: collision with root package name */
    public int f31046e;

    /* renamed from: f, reason: collision with root package name */
    public int f31047f;

    /* renamed from: g, reason: collision with root package name */
    public int f31048g;

    /* renamed from: h, reason: collision with root package name */
    public String f31049h;

    /* renamed from: i, reason: collision with root package name */
    public String f31050i;

    /* renamed from: j, reason: collision with root package name */
    public String f31051j;

    /* renamed from: k, reason: collision with root package name */
    public String f31052k;

    /* renamed from: l, reason: collision with root package name */
    public String f31053l;

    /* renamed from: m, reason: collision with root package name */
    public String f31054m;
    public UnitDisplayType n;
    public String o;

    /* renamed from: p, reason: collision with root package name */
    public Map f31055p;

    /* renamed from: q, reason: collision with root package name */
    public String f31056q;

    /* renamed from: r, reason: collision with root package name */
    public ImpressionData f31057r;

    /* renamed from: u, reason: collision with root package name */
    public String f31060u;

    /* renamed from: w, reason: collision with root package name */
    public Exception f31062w;

    /* renamed from: x, reason: collision with root package name */
    public String f31063x;

    /* renamed from: y, reason: collision with root package name */
    public String f31064y;

    /* renamed from: z, reason: collision with root package name */
    public String f31065z;

    /* renamed from: s, reason: collision with root package name */
    public int f31058s = 0;

    /* renamed from: t, reason: collision with root package name */
    public float f31059t = -1.0f;

    /* renamed from: v, reason: collision with root package name */
    public int f31061v = -1;
    public boolean A = false;
    public m E = m.NONE;
    public boolean G = false;
    public long H = 0;
    public boolean I = false;
    public int K = -1;
    public int L = -1;

    public abstract InneractiveErrorCode a(InneractiveAdRequest inneractiveAdRequest, r rVar);

    public final void a(String str) throws NumberFormatException {
        long j11;
        try {
            j11 = Long.parseLong(str);
        } catch (NumberFormatException unused) {
            j11 = 20;
        }
        this.f31043b = j11;
        this.f31042a = TimeUnit.MINUTES.toMillis(j11) + this.f31044c;
    }

    public abstract InneractiveErrorCode b();

    public final boolean a() {
        return (this.E == m.NONE || TextUtils.isEmpty(this.f31063x) || TextUtils.isEmpty(this.D) || TextUtils.isEmpty(this.F)) ? false : true;
    }
}
