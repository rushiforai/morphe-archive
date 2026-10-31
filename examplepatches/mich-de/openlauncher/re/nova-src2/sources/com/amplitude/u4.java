package com.amplitude;

import android.graphics.Bitmap;
import android.os.HandlerThread;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;
import com.amplitude.android.sessionreplay.config.MaskLevel;
import com.amplitude.android.sessionreplay.config.PrivacyConfig;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.Set;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class u4 {

    /* renamed from: a, reason: collision with root package name */
    public PrivacyConfig f20779a;

    /* renamed from: b, reason: collision with root package name */
    public final K3 f20780b;

    /* renamed from: c, reason: collision with root package name */
    public final z.x f20781c;

    /* renamed from: d, reason: collision with root package name */
    public final Lazy f20782d;

    /* renamed from: e, reason: collision with root package name */
    public final I1 f20783e;

    /* renamed from: f, reason: collision with root package name */
    public final HandlerThread f20784f;

    /* renamed from: g, reason: collision with root package name */
    public final Lazy f20785g;

    public u4(PrivacyConfig privacyConfig, K3 logger) {
        Intrinsics.g(privacyConfig, "privacyConfig");
        Intrinsics.g(logger, "logger");
        this.f20779a = privacyConfig;
        this.f20780b = logger;
        this.f20781c = new z.x(1000);
        this.f20782d = LazyKt.a(s4.f20749a);
        this.f20783e = new I1();
        HandlerThread handlerThread = new HandlerThread("PixelCopyThread");
        handlerThread.start();
        this.f20784f = handlerThread;
        this.f20785g = LazyKt.a(t4.f20767a);
    }

    public final Bitmap a(int i5, int i11) {
        Object next;
        D d5 = (D) this.f20782d.getValue();
        synchronized (d5) {
            try {
                String strA = D.a(i5, i11);
                LinkedHashMap linkedHashMap = d5.f20205b;
                Object linkedHashSet = linkedHashMap.get(strA);
                if (linkedHashSet == null) {
                    linkedHashSet = new LinkedHashSet();
                    linkedHashMap.put(strA, linkedHashSet);
                }
                Set set = (Set) linkedHashSet;
                Iterator it = set.iterator();
                if (it.hasNext()) {
                    next = it.next();
                } else {
                    next = null;
                }
                Bitmap bitmap = (Bitmap) next;
                if (bitmap != null) {
                    set.remove(bitmap);
                }
                if (bitmap != null) {
                    return bitmap;
                }
                return Bitmap.createBitmap(i5, i11, Bitmap.Config.ARGB_8888);
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:24:0x0059  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x005b  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x00ba  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final C0482n a(View view, int i5, String str) {
        Intrinsics.g(view, "view");
        Object objC = this.f20781c.c(Integer.valueOf(i5));
        C0482n c0482n = objC instanceof C0482n ? (C0482n) objC : null;
        boolean zA = this.f20783e.a(view);
        boolean zA2 = false;
        if (c0482n != null) {
            EnumC0458j enumC0458j = c0482n.f20670b;
            int i11 = enumC0458j == null ? -1 : AbstractC0464k.f20646a[enumC0458j.ordinal()];
            if (i11 != 1) {
                if (i11 != 2) {
                    zA = (i11 == 3 || i11 == 4) && System.currentTimeMillis() - c0482n.f20669a > 1000;
                }
            } else if (!zA || System.currentTimeMillis() - c0482n.f20669a <= c0482n.f20673e) {
            }
            if (!zA) {
                return c0482n;
            }
        }
        K3 k32 = this.f20780b;
        PrivacyConfig privacyConfig = this.f20779a;
        Intrinsics.g(privacyConfig, "<this>");
        if (!Intrinsics.b(str, "amp-unmask")) {
            if (!Intrinsics.b(str, "amp-mask")) {
                MaskLevel maskLevel = privacyConfig.getMaskLevel();
                int i12 = maskLevel == null ? -1 : w4.f20809a[maskLevel.ordinal()];
                if (i12 != -1) {
                    if (i12 == 1) {
                        zA2 = x4.a(view);
                    } else if (i12 != 2) {
                        if (i12 == 3) {
                            if ((x4.a(view) || (view instanceof EditText)) || (view instanceof TextView)) {
                                zA2 = true;
                            }
                        } else {
                            throw new NoWhenBranchMatchedException();
                        }
                    } else if (x4.a(view) || (view instanceof EditText)) {
                    }
                }
            }
        }
        C0482n c0482n2 = new C0482n(view, k32, zA2, this);
        this.f20781c.d(Integer.valueOf(i5), c0482n2);
        return c0482n2;
    }

    public final void a() {
        this.f20784f.quitSafely();
    }
}
