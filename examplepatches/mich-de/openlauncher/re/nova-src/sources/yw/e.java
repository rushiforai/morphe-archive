package yw;

import android.os.Handler;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public final String f97673a;

    /* renamed from: b, reason: collision with root package name */
    public final Handler f97674b;

    public e(String tokenResult, Handler handler) {
        Intrinsics.g(tokenResult, "tokenResult");
        Intrinsics.g(handler, "handler");
        this.f97673a = tokenResult;
        this.f97674b = handler;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof e)) {
            return false;
        }
        e eVar = (e) obj;
        return Intrinsics.b(this.f97673a, eVar.f97673a) && Intrinsics.b(this.f97674b, eVar.f97674b);
    }

    public final int hashCode() {
        return this.f97674b.hashCode() + (this.f97673a.hashCode() * 31);
    }

    public final String toString() {
        return "HCaptchaTokenResponse(tokenResult=" + this.f97673a + ", handler=" + this.f97674b + ")";
    }
}
