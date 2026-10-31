package io.branch.search.internal;

import android.app.usage.UsageEvents;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* renamed from: io.branch.search.internal.kf, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3238kf extends Lambda implements Function1<UsageEvents, C3221jf> {

    /* renamed from: a, reason: collision with root package name */
    public static final C3238kf f64934a = new C3238kf();

    public C3238kf() {
        super(1);
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        UsageEvents it = (UsageEvents) obj;
        Intrinsics.g(it, "it");
        return new C3221jf(it);
    }
}
