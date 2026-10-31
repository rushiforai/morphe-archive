package com.amplitude;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Regex;

/* renamed from: com.amplitude.w, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public final class C0529w {

    /* renamed from: g, reason: collision with root package name */
    public static final SimpleDateFormat f20793g = new SimpleDateFormat("yyyy-MM-dd", Locale.US);

    /* renamed from: a, reason: collision with root package name */
    public boolean f20794a;

    /* renamed from: b, reason: collision with root package name */
    public final int f20795b;

    /* renamed from: c, reason: collision with root package name */
    public final C0543y3 f20796c;

    /* renamed from: d, reason: collision with root package name */
    public final K3 f20797d;

    /* renamed from: e, reason: collision with root package name */
    public int f20798e;

    /* renamed from: f, reason: collision with root package name */
    public final String f20799f;

    public C0529w(int i5, C0543y3 storage, K3 logger) throws NumberFormatException {
        Intrinsics.g(storage, "storage");
        Intrinsics.g(logger, "logger");
        this.f20794a = true;
        this.f20795b = i5;
        this.f20796c = storage;
        this.f20797d = logger;
        this.f20799f = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        String str = f20793g.format(new Date());
        String string = storage.f20824b.getString("upload-history", null);
        if (string != null) {
            List listI = new Regex("\\|").i(2, string);
            int iIntValue = 0;
            if (!listI.isEmpty()) {
                this.f20799f = (String) listI.get(0);
            }
            if (!Intrinsics.b(this.f20799f, str) || listI.size() <= 1) {
                return;
            }
            try {
                Integer numValueOf = Integer.valueOf((String) listI.get(1));
                Intrinsics.d(numValueOf);
                iIntValue = numValueOf.intValue();
            } catch (NumberFormatException unused) {
            }
            this.f20798e = iIntValue;
        }
    }

    public final void a(int i5) {
        if (this.f20794a && i5 != 0) {
            String str = f20793g.format(new Date());
            if (Intrinsics.b(this.f20799f, str)) {
                this.f20798e += i5;
            } else {
                this.f20798e = i5;
            }
            this.f20796c.a("upload-history", str + "|" + this.f20798e);
        }
    }

    public final boolean a() {
        if (!this.f20794a || this.f20795b == Integer.MAX_VALUE) {
            return false;
        }
        if (!Intrinsics.b(this.f20799f, f20793g.format(new Date())) || this.f20798e < this.f20795b) {
            return false;
        }
        this.f20797d.a(new C0524v(this));
        return true;
    }
}
