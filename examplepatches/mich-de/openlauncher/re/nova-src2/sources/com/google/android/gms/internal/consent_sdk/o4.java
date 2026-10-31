package com.google.android.gms.internal.consent_sdk;

import android.util.Log;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes3.dex */
public final class o4 implements l6, uk.c {

    /* renamed from: b, reason: collision with root package name */
    public static final o4 f32177b = new o4(0);

    /* renamed from: c, reason: collision with root package name */
    public static final o4 f32178c = new o4(1);

    /* renamed from: d, reason: collision with root package name */
    public static final o4 f32179d = new o4(2);

    /* renamed from: e, reason: collision with root package name */
    public static final o4 f32180e = new o4(3);

    /* renamed from: f, reason: collision with root package name */
    public static final o4 f32181f = new o4(4);

    /* renamed from: g, reason: collision with root package name */
    public static final o4 f32182g = new o4(5);

    /* renamed from: h, reason: collision with root package name */
    public static final o4 f32183h = new o4(6);

    /* renamed from: i, reason: collision with root package name */
    public static final o4 f32184i = new o4(7);

    /* renamed from: j, reason: collision with root package name */
    public static final o4 f32185j = new o4(8);

    /* renamed from: k, reason: collision with root package name */
    public static final o4 f32186k = new o4(9);

    /* renamed from: l, reason: collision with root package name */
    public static final o4 f32187l = new o4(10);

    /* renamed from: m, reason: collision with root package name */
    public static final o4 f32188m = new o4(11);
    public static final o4 n = new o4(12);
    public static final o4 o = new o4(13);

    /* renamed from: p, reason: collision with root package name */
    public static final o4 f32189p = new o4(14);

    /* renamed from: q, reason: collision with root package name */
    public static final o4 f32190q = new o4(15);

    /* renamed from: r, reason: collision with root package name */
    public static final o4 f32191r = new o4(16);

    /* renamed from: s, reason: collision with root package name */
    public static final o4 f32192s = new o4(17);

    /* renamed from: t, reason: collision with root package name */
    public static final o4 f32193t = new o4(18);

    /* renamed from: u, reason: collision with root package name */
    public static final o4 f32194u = new o4(19);

    /* renamed from: v, reason: collision with root package name */
    public static final o4 f32195v = new o4(20);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f32196a;

    public /* synthetic */ o4(int i5) {
        this.f32196a = i5;
    }

    @Override // uk.c
    public void a(ex.a aVar) {
        Log.e("UserMessagingPlatform", "Failed to load and cache a form, error=".concat(String.valueOf(aVar.f53057b)));
    }

    public String toString() {
        switch (this.f32196a) {
            case 23:
                char[] cArr = new char[6];
                cArr[0] = AbstractJsonLexerKt.STRING_ESC;
                cArr[1] = AbstractJsonLexerKt.UNICODE_ESC;
                cArr[2] = 0;
                cArr[3] = 0;
                cArr[4] = 0;
                cArr[5] = 0;
                int i5 = 44;
                for (int i11 = 0; i11 < 4; i11++) {
                    cArr[5 - i11] = "0123456789ABCDEF".charAt(i5 & 15);
                    i5 >>= 4;
                }
                return b.c0.l("CharMatcher.is('", String.copyValueOf(cArr), "')");
            default:
                return super.toString();
        }
    }

    @Override // com.google.android.gms.internal.consent_sdk.l6
    public s6 zzb(Class cls) {
        switch (this.f32196a) {
            case 20:
                if (!x5.class.isAssignableFrom(cls)) {
                    throw new IllegalArgumentException("Unsupported message type: ".concat(cls.getName()));
                }
                try {
                    return (s6) x5.h(cls.asSubclass(x5.class)).f(3);
                } catch (Exception e3) {
                    throw new RuntimeException("Unable to get message info for ".concat(cls.getName()), e3);
                }
            default:
                throw new IllegalStateException("This should never be called.");
        }
    }

    @Override // com.google.android.gms.internal.consent_sdk.l6
    public boolean zzc(Class cls) {
        switch (this.f32196a) {
            case 20:
                return x5.class.isAssignableFrom(cls);
            default:
                return false;
        }
    }
}
