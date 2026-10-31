package com.google.android.gms.internal.measurement;

/* loaded from: classes3.dex */
public abstract class qh implements rh {

    /* renamed from: a, reason: collision with root package name */
    public static final oh f33021a = new oh();

    public abstract String a();

    public abstract String b();

    public abstract int c();

    public abstract String d();

    public String e() {
        return null;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("LogSite{ class=");
        sb2.append(a());
        sb2.append(", method=");
        sb2.append(b());
        sb2.append(", line=");
        sb2.append(c());
        if (d() != null) {
            sb2.append(", file=");
            sb2.append(d());
        }
        if (e() != null) {
            sb2.append(", filePath=");
            sb2.append(e());
        }
        sb2.append(" }");
        return sb2.toString();
    }
}
