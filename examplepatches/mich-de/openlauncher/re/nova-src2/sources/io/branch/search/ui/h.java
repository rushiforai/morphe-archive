package io.branch.search.ui;

import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class h extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public static final h f66503j = new h(1);

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        Image it = (Image) obj;
        Intrinsics.g(it, "it");
        return it.toString();
    }
}
