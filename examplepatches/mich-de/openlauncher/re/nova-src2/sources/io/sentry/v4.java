package io.sentry;

import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import java.util.HashMap;
import ninja.sesame.lib.bridge.v1.ActionCategory;

/* loaded from: classes4.dex */
public final class v4 implements i1 {

    /* renamed from: a, reason: collision with root package name */
    public final io.sentry.protocol.u f67863a;

    /* renamed from: b, reason: collision with root package name */
    public final String f67864b;

    /* renamed from: c, reason: collision with root package name */
    public final String f67865c;

    /* renamed from: d, reason: collision with root package name */
    public final String f67866d;

    /* renamed from: e, reason: collision with root package name */
    public HashMap f67867e;

    public v4(io.sentry.protocol.u uVar, String str, String str2, String str3) {
        this.f67863a = uVar;
        this.f67864b = str;
        this.f67865c = str2;
        this.f67866d = str3;
    }

    @Override // io.sentry.i1
    public final void serialize(y1 y1Var, ILogger iLogger) {
        e3 e3Var = (e3) y1Var;
        e3Var.f();
        e3Var.o("event_id");
        this.f67863a.serialize(e3Var, iLogger);
        String str = this.f67864b;
        if (str != null) {
            e3Var.o(PendingUpgradeStore.KEY_NAME);
            e3Var.A(str);
        }
        String str2 = this.f67865c;
        if (str2 != null) {
            e3Var.o(ActionCategory.EMAIL);
            e3Var.A(str2);
        }
        String str3 = this.f67866d;
        if (str3 != null) {
            e3Var.o("comments");
            e3Var.A(str3);
        }
        HashMap map = this.f67867e;
        if (map != null) {
            for (String str4 : map.keySet()) {
                Object obj = this.f67867e.get(str4);
                e3Var.o(str4);
                e3Var.x(iLogger, obj);
            }
        }
        e3Var.i();
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("UserFeedback{eventId=");
        sb2.append(this.f67863a);
        sb2.append(", name='");
        sb2.append(this.f67864b);
        sb2.append("', email='");
        sb2.append(this.f67865c);
        sb2.append("', comments='");
        return b.c0.q(sb2, this.f67866d, "'}");
    }
}
