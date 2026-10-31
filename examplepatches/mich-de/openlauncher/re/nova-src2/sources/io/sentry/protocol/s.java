package io.sentry.protocol;

import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import io.sentry.ILogger;
import io.sentry.e3;
import io.sentry.i1;
import io.sentry.y1;
import java.util.Arrays;
import java.util.HashMap;
import java.util.concurrent.CopyOnWriteArraySet;

/* loaded from: classes4.dex */
public final class s implements i1 {

    /* renamed from: a, reason: collision with root package name */
    public String f67608a;

    /* renamed from: b, reason: collision with root package name */
    public String f67609b;

    /* renamed from: c, reason: collision with root package name */
    public CopyOnWriteArraySet f67610c;

    /* renamed from: d, reason: collision with root package name */
    public CopyOnWriteArraySet f67611d;

    /* renamed from: e, reason: collision with root package name */
    public HashMap f67612e;

    public s(String str, String str2) {
        this.f67608a = str;
        this.f67609b = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && s.class == obj.getClass()) {
            s sVar = (s) obj;
            if (this.f67608a.equals(sVar.f67608a) && this.f67609b.equals(sVar.f67609b)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.f67608a, this.f67609b});
    }

    @Override // io.sentry.i1
    public final void serialize(y1 y1Var, ILogger iLogger) {
        e3 e3Var = (e3) y1Var;
        e3Var.f();
        e3Var.o(PendingUpgradeStore.KEY_NAME);
        e3Var.A(this.f67608a);
        e3Var.o("version");
        e3Var.A(this.f67609b);
        CopyOnWriteArraySet copyOnWriteArraySet = this.f67610c;
        if (copyOnWriteArraySet == null) {
            copyOnWriteArraySet = (CopyOnWriteArraySet) e3.m().f67209c;
        }
        CopyOnWriteArraySet copyOnWriteArraySet2 = this.f67611d;
        if (copyOnWriteArraySet2 == null) {
            copyOnWriteArraySet2 = (CopyOnWriteArraySet) e3.m().f67208b;
        }
        if (!copyOnWriteArraySet.isEmpty()) {
            e3Var.o("packages");
            e3Var.x(iLogger, copyOnWriteArraySet);
        }
        if (!copyOnWriteArraySet2.isEmpty()) {
            e3Var.o("integrations");
            e3Var.x(iLogger, copyOnWriteArraySet2);
        }
        HashMap map = this.f67612e;
        if (map != null) {
            for (String str : map.keySet()) {
                Object obj = this.f67612e.get(str);
                e3Var.o(str);
                e3Var.x(iLogger, obj);
            }
        }
        e3Var.i();
    }
}
