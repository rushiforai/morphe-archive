package com.iab.omid.library.vungle.attestation;

import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Build;

/* loaded from: classes3.dex */
public class j implements k {

    /* renamed from: d, reason: collision with root package name */
    private static volatile j f35174d;

    /* renamed from: a, reason: collision with root package name */
    private volatile Boolean f35175a;

    /* renamed from: b, reason: collision with root package name */
    private volatile Boolean f35176b;

    /* renamed from: c, reason: collision with root package name */
    private final Context f35177c;

    private j(Context context) {
        this.f35177c = context;
        c();
    }

    public static j a(Context context) {
        if (f35174d == null) {
            synchronized (j.class) {
                try {
                    if (f35174d == null) {
                        f35174d = new j(context);
                    }
                } finally {
                }
            }
        }
        return f35174d;
    }

    public boolean b() {
        boolean zHasSystemFeature;
        if (this.f35176b != null) {
            return this.f35176b.booleanValue();
        }
        synchronized (this) {
            try {
                if (this.f35176b == null) {
                    if (c()) {
                        try {
                            PackageManager packageManager = this.f35177c.getPackageManager();
                            if (packageManager == null) {
                                com.iab.omid.library.vungle.utils.d.b("PackageManager is null when checking attestation capability");
                                this.f35176b = Boolean.FALSE;
                            } else {
                                zHasSystemFeature = packageManager.hasSystemFeature("com.amazon.privacypass");
                                this.f35176b = Boolean.valueOf(zHasSystemFeature);
                            }
                        } catch (SecurityException e3) {
                            com.iab.omid.library.vungle.utils.d.a("Security exception when checking attestation capability", e3);
                            this.f35176b = Boolean.FALSE;
                            return false;
                        } catch (Exception e11) {
                            com.iab.omid.library.vungle.utils.d.a("Unexpected error when checking attestation capability", e11);
                            this.f35176b = Boolean.FALSE;
                            return false;
                        }
                    } else {
                        this.f35176b = Boolean.FALSE;
                    }
                    return false;
                }
                zHasSystemFeature = this.f35176b.booleanValue();
                return zHasSystemFeature;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public boolean c() {
        boolean zBooleanValue;
        if (this.f35175a != null) {
            return this.f35175a.booleanValue();
        }
        synchronized (this) {
            try {
                if (this.f35175a != null) {
                    zBooleanValue = this.f35175a.booleanValue();
                } else {
                    zBooleanValue = this.f35177c != null && Build.MANUFACTURER.equalsIgnoreCase("Amazon") && Build.MODEL.toLowerCase().startsWith("aft") && Build.VERSION.SDK_INT <= 30;
                    this.f35175a = Boolean.valueOf(zBooleanValue);
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return zBooleanValue;
    }

    @Override // com.iab.omid.library.vungle.attestation.k
    public boolean a() {
        return c();
    }
}
