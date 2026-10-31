package com.stripe.android.analytics;

import com.stripe.android.analytics.Session;
import com.stripe.android.analytics.c;
import h6.u0;
import java.util.UUID;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public abstract class c {

    /* renamed from: a, reason: collision with root package name */
    public static boolean f42457a;

    public static void a(kv.c cVar, final u0 savedStateHandle) {
        Object owner;
        Intrinsics.g(savedStateHandle, "savedStateHandle");
        Session session = (Session) savedStateHandle.a("STRIPE_ANALYTICS_LOCAL_SESSION");
        if (session == null) {
            if (f42457a) {
                owner = Session.Observer.f42455a;
            } else {
                f42457a = true;
                UUID uuidRandomUUID = UUID.randomUUID();
                UUID uuid = fr.c.f55586g;
                Intrinsics.d(uuidRandomUUID);
                fr.c.f55586g = uuidRandomUUID;
                String string = uuidRandomUUID.toString();
                Intrinsics.f(string, "toString(...)");
                owner = new Session.Owner(string);
            }
            savedStateHandle.d("STRIPE_ANALYTICS_LOCAL_SESSION", owner);
        } else if (session instanceof Session.Owner) {
            UUID uuid2 = fr.c.f55586g;
            UUID uuidFromString = UUID.fromString(((Session.Owner) session).f42456a);
            Intrinsics.f(uuidFromString, "fromString(...)");
            fr.c.f55586g = uuidFromString;
            f42457a = true;
        } else if (!(session instanceof Session.Observer)) {
            throw new NoWhenBranchMatchedException();
        }
        cVar.addCloseable(new AutoCloseable() { // from class: eq.a
            @Override // java.lang.AutoCloseable
            public final void close() {
                Session session2 = (Session) savedStateHandle.a("STRIPE_ANALYTICS_LOCAL_SESSION");
                if (session2 != null) {
                    if (session2 instanceof Session.Owner) {
                        c.f42457a = false;
                    } else if (!(session2 instanceof Session.Observer)) {
                        throw new NoWhenBranchMatchedException();
                    }
                }
            }
        });
    }
}
