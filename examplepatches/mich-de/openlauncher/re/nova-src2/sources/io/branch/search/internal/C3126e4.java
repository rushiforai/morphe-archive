package io.branch.search.internal;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* renamed from: io.branch.search.internal.e4, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3126e4 extends Lambda implements Function0<Long> {

    /* renamed from: a, reason: collision with root package name */
    public static final C3126e4 f64362a = new C3126e4();

    public C3126e4() {
        super(0);
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        return Long.valueOf(System.currentTimeMillis());
    }
}
