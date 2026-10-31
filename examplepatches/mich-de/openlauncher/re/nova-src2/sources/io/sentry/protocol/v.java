package io.sentry.protocol;

import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import io.sentry.ILogger;
import io.sentry.e3;
import io.sentry.i1;
import io.sentry.y1;
import java.util.HashMap;
import java.util.Objects;

/* loaded from: classes4.dex */
public final class v implements i1 {

    /* renamed from: a, reason: collision with root package name */
    public final String f67622a;

    /* renamed from: b, reason: collision with root package name */
    public final String f67623b;

    /* renamed from: c, reason: collision with root package name */
    public HashMap f67624c;

    public v(String str, String str2) {
        this.f67622a = str;
        this.f67623b = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && v.class == obj.getClass()) {
            v vVar = (v) obj;
            if (Objects.equals(this.f67622a, vVar.f67622a) && Objects.equals(this.f67623b, vVar.f67623b)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return Objects.hash(this.f67622a, this.f67623b);
    }

    @Override // io.sentry.i1
    public final void serialize(y1 y1Var, ILogger iLogger) {
        e3 e3Var = (e3) y1Var;
        e3Var.f();
        e3Var.o(PendingUpgradeStore.KEY_NAME);
        e3Var.A(this.f67622a);
        e3Var.o("version");
        e3Var.A(this.f67623b);
        HashMap map = this.f67624c;
        if (map != null) {
            for (String str : map.keySet()) {
                Object obj = this.f67624c.get(str);
                e3Var.o(str);
                e3Var.x(iLogger, obj);
            }
        }
        e3Var.i();
    }
}
