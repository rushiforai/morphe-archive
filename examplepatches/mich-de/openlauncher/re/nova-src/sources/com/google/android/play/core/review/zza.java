package com.google.android.play.core.review;

import a80.m;
import android.app.PendingIntent;
import b.u4;

/* loaded from: classes3.dex */
final class zza extends ReviewInfo {

    /* renamed from: a, reason: collision with root package name */
    public final PendingIntent f34561a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f34562b;

    public zza(PendingIntent pendingIntent, boolean z11) {
        if (pendingIntent == null) {
            throw new NullPointerException("Null pendingIntent");
        }
        this.f34561a = pendingIntent;
        this.f34562b = z11;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof ReviewInfo) {
            zza zzaVar = (zza) ((ReviewInfo) obj);
            if (this.f34561a.equals(zzaVar.f34561a) && this.f34562b == zzaVar.f34562b) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return ((this.f34561a.hashCode() ^ 1000003) * 1000003) ^ (true != this.f34562b ? 1237 : 1231);
    }

    public final String toString() {
        return m.k(u4.k("ReviewInfo{pendingIntent=", this.f34561a.toString(), ", isNoOp="), this.f34562b, "}");
    }
}
