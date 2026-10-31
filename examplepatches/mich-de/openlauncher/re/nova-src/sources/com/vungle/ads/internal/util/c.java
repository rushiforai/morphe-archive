package com.vungle.ads.internal.util;

import android.content.Intent;
import java.lang.ref.WeakReference;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public final WeakReference f47673a;

    /* renamed from: b, reason: collision with root package name */
    public final Intent f47674b;

    /* renamed from: c, reason: collision with root package name */
    public final Intent f47675c;

    /* renamed from: d, reason: collision with root package name */
    public final com.vungle.ads.internal.ui.m f47676d;

    public c(WeakReference context, Intent intent, Intent intent2, com.vungle.ads.internal.ui.m mVar) {
        Intrinsics.g(context, "context");
        this.f47673a = context;
        this.f47674b = intent;
        this.f47675c = intent2;
        this.f47676d = mVar;
    }

    public final com.vungle.ads.internal.ui.m a() {
        return this.f47676d;
    }

    public final WeakReference b() {
        return this.f47673a;
    }

    public final Intent c() {
        return this.f47674b;
    }

    public final Intent d() {
        return this.f47675c;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof c)) {
            return false;
        }
        c cVar = (c) obj;
        return Intrinsics.b(this.f47673a, cVar.f47673a) && Intrinsics.b(this.f47674b, cVar.f47674b) && Intrinsics.b(this.f47675c, cVar.f47675c) && Intrinsics.b(this.f47676d, cVar.f47676d);
    }

    public final int hashCode() {
        int iHashCode = this.f47673a.hashCode() * 31;
        Intent intent = this.f47674b;
        int iHashCode2 = (iHashCode + (intent == null ? 0 : intent.hashCode())) * 31;
        Intent intent2 = this.f47675c;
        int iHashCode3 = (iHashCode2 + (intent2 == null ? 0 : intent2.hashCode())) * 31;
        com.vungle.ads.internal.ui.m mVar = this.f47676d;
        return iHashCode3 + (mVar != null ? mVar.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("TargetActivityInfo(context=");
        sbA.append(this.f47673a);
        sbA.append(", deepLinkOverrideIntent=");
        sbA.append(this.f47674b);
        sbA.append(", defaultIntent=");
        sbA.append(this.f47675c);
        sbA.append(", adOpenCallback=");
        sbA.append(this.f47676d);
        sbA.append(')');
        return sbA.toString();
    }
}
