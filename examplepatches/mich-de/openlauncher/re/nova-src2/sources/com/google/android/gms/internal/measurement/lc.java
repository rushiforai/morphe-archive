package com.google.android.gms.internal.measurement;

import java.util.Objects;

/* loaded from: classes3.dex */
public final class lc implements Comparable {

    /* renamed from: a, reason: collision with root package name */
    public final long f32785a;

    /* renamed from: b, reason: collision with root package name */
    public final String f32786b;

    /* renamed from: c, reason: collision with root package name */
    public final int f32787c;

    /* renamed from: d, reason: collision with root package name */
    public final long f32788d;

    /* renamed from: e, reason: collision with root package name */
    public final Object f32789e;

    /* renamed from: f, reason: collision with root package name */
    public final RuntimeException f32790f;

    public lc(long j11, String str, int i5, long j12, Object obj) {
        vk.b0.c(((j11 > 0L ? 1 : (j11 == 0L ? 0 : -1)) == 0) == (str != null));
        this.f32785a = j11;
        this.f32786b = str;
        this.f32787c = i5;
        this.f32788d = j12;
        this.f32789e = obj;
        if (i5 != 5) {
            this.f32790f = null;
            return;
        }
        if (obj == null) {
            this.f32790f = new NullPointerException("Null stringOrBytes");
        } else if ((obj instanceof byte[]) || (obj instanceof v0)) {
            this.f32790f = null;
        } else {
            this.f32790f = new RuntimeException("Wrong stringOrBytes type: ".concat(String.valueOf(obj.getClass())));
        }
    }

    public final Object a() {
        int i5 = this.f32787c;
        if (i5 == 0) {
            return Boolean.FALSE;
        }
        if (i5 == 1) {
            return Boolean.TRUE;
        }
        long j11 = this.f32788d;
        if (i5 == 2) {
            return Long.valueOf(j11);
        }
        if (i5 == 3) {
            return Double.valueOf(Double.longBitsToDouble(j11));
        }
        Object obj = this.f32789e;
        if (i5 == 4) {
            obj.getClass();
            return obj;
        }
        if (i5 != 5) {
            throw new AssertionError("Impossible, this was validated when parsed or created");
        }
        obj.getClass();
        try {
            return obj instanceof byte[] ? (byte[]) obj : ((v0) obj).n();
        } catch (Throwable th2) {
            RuntimeException runtimeException = this.f32790f;
            if (runtimeException != null) {
                th2.addSuppressed(runtimeException);
            }
            throw th2;
        }
    }

    @Override // java.lang.Comparable
    public final int compareTo(Object obj) {
        lc lcVar = (lc) obj;
        long j11 = lcVar.f32785a;
        long j12 = this.f32785a;
        int iCompare = Long.compare(j12, j11);
        if (iCompare != 0) {
            return iCompare;
        }
        if (j12 != 0) {
            return 0;
        }
        String str = this.f32786b;
        str.getClass();
        String str2 = lcVar.f32786b;
        str2.getClass();
        return str.compareTo(str2);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof lc)) {
            return false;
        }
        lc lcVar = (lc) obj;
        return this.f32785a == lcVar.f32785a && Objects.equals(this.f32786b, lcVar.f32786b);
    }

    public final int hashCode() {
        return Objects.hash(Long.valueOf(this.f32785a), this.f32786b);
    }

    public final String toString() {
        String string = this.f32786b;
        if (string == null) {
            string = Long.toString(this.f32785a);
        }
        String strValueOf = String.valueOf(a());
        return b.c0.r(new StringBuilder(String.valueOf(string).length() + 1 + strValueOf.length()), string, ":", strValueOf);
    }
}
