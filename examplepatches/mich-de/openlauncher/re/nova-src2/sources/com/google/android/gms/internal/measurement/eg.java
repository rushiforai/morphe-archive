package com.google.android.gms.internal.measurement;

import android.text.TextUtils;
import java.util.UUID;

/* loaded from: classes3.dex */
public final class eg {

    /* renamed from: a, reason: collision with root package name */
    public final xk.r2 f32510a;

    /* renamed from: b, reason: collision with root package name */
    public final xk.r2 f32511b;

    /* renamed from: c, reason: collision with root package name */
    public final UUID f32512c;

    public eg(xk.r2 r2Var, xk.r2 r2Var2, UUID uuid) {
        this.f32510a = r2Var;
        this.f32511b = r2Var2;
        this.f32512c = uuid;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof eg)) {
            return false;
        }
        eg egVar = (eg) obj;
        return this.f32510a.equals(egVar.f32510a) && this.f32511b.equals(egVar.f32511b) && this.f32512c.equals(egVar.f32512c);
    }

    public final int hashCode() {
        return ((((((this.f32510a.hashCode() ^ 1000003) * 1000003) ^ this.f32511b.hashCode()) * 1000003) ^ this.f32512c.hashCode()) * 1000003) ^ ((int) (-4294967296L));
    }

    public final String toString() {
        return TextUtils.join(" -> ", this.f32510a);
    }
}
