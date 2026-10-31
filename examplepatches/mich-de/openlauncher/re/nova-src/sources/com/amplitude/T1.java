package com.amplitude;

import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class T1 extends AbstractC0473l2 {

    /* renamed from: c, reason: collision with root package name */
    @gn.c("childNodes")
    private final List<AbstractC0473l2> f20387c;

    /* renamed from: d, reason: collision with root package name */
    @gn.c("compatMode")
    private String f20388d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public T1(int i5, List childNodes) {
        super(i5, EnumC0485n2.f20681c.a());
        Intrinsics.g(childNodes, "childNodes");
        this.f20387c = childNodes;
        this.f20388d = "BackCompat";
    }
}
