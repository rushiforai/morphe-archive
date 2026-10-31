package com.amplitude;

import java.util.List;
import java.util.Map;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class V1 extends AbstractC0473l2 {

    /* renamed from: i, reason: collision with root package name */
    public static final U1 f20404i = new U1();

    /* renamed from: j, reason: collision with root package name */
    private static int f20405j = 0;

    /* renamed from: k, reason: collision with root package name */
    private static final int f20406k = 1;

    /* renamed from: l, reason: collision with root package name */
    private static int f20407l = 2;

    /* renamed from: c, reason: collision with root package name */
    @gn.c("tagName")
    private String f20408c;

    /* renamed from: d, reason: collision with root package name */
    @gn.c("attributes")
    private Map<String, ? extends Object> f20409d;

    /* renamed from: e, reason: collision with root package name */
    @gn.c("childNodes")
    private final List<AbstractC0473l2> f20410e;

    /* renamed from: f, reason: collision with root package name */
    @gn.c("isSVG")
    private Boolean f20411f;

    /* renamed from: g, reason: collision with root package name */
    @gn.c("needBlock")
    private Boolean f20412g;

    /* renamed from: h, reason: collision with root package name */
    @gn.c("isCustom")
    private Boolean f20413h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public V1(int i5, String tagName, Map attributes, List childNodes, int i11) {
        super(i5, EnumC0485n2.f20683e.a());
        attributes = (i11 & 4) != 0 ? b70.h.f17594a : attributes;
        Intrinsics.g(tagName, "tagName");
        Intrinsics.g(attributes, "attributes");
        Intrinsics.g(childNodes, "childNodes");
        this.f20408c = tagName;
        this.f20409d = attributes;
        this.f20410e = childNodes;
        this.f20411f = null;
        this.f20412g = null;
        this.f20413h = null;
    }
}
