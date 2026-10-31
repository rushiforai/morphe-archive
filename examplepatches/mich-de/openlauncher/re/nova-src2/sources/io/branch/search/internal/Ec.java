package io.branch.search.internal;

import io.branch.search.internal.services.storage.JobInfoRaw;
import kotlin.Pair;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class Ec extends Lambda implements Function1<Pair<? extends String, ? extends JobInfoRaw>, CharSequence> {

    /* renamed from: a, reason: collision with root package name */
    public static final Ec f62420a = new Ec();

    public Ec() {
        super(1);
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        Pair it = (Pair) obj;
        Intrinsics.g(it, "it");
        return (CharSequence) it.f71683a;
    }
}
