package com.google.android.gms.internal.measurement;

import android.content.Context;

/* loaded from: classes3.dex */
public final class ib {

    /* renamed from: a, reason: collision with root package name */
    public final Context f32650a;

    /* renamed from: b, reason: collision with root package name */
    public final vk.u f32651b;

    public ib(Context context, vk.u uVar) {
        this.f32650a = context;
        this.f32651b = uVar;
    }

    public final boolean equals(Object obj) {
        vk.u uVar;
        if (obj == this) {
            return true;
        }
        if (obj instanceof ib) {
            ib ibVar = (ib) obj;
            vk.u uVar2 = ibVar.f32651b;
            if (this.f32650a.equals(ibVar.f32650a) && ((uVar = this.f32651b) != null ? uVar.equals(uVar2) : uVar2 == null)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        int iHashCode = this.f32650a.hashCode() ^ 1000003;
        vk.u uVar = this.f32651b;
        return (iHashCode * 1000003) ^ (uVar == null ? 0 : uVar.hashCode());
    }

    public final String toString() {
        String string = this.f32650a.toString();
        int length = string.length();
        String strValueOf = String.valueOf(this.f32651b);
        StringBuilder sb2 = new StringBuilder(length + 45 + strValueOf.length() + 1);
        b.c0.D(sb2, "FlagsContext{context=", string, ", hermeticFileOverrides=", strValueOf);
        sb2.append("}");
        return sb2.toString();
    }
}
