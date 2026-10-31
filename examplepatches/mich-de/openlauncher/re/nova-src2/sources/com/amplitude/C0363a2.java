package com.amplitude;

import com.amplitude.core.events.Plan;
import java.util.ArrayList;
import java.util.List;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;

/* renamed from: com.amplitude.a2, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public final class C0363a2 {

    /* renamed from: a, reason: collision with root package name */
    @gn.c("adds")
    private final List<O1> f20468a;

    /* renamed from: b, reason: collision with root package name */
    @gn.c("removes")
    private final List<C0512s2> f20469b;

    /* renamed from: c, reason: collision with root package name */
    @gn.c("attributes")
    private final List<P1> f20470c;

    /* renamed from: d, reason: collision with root package name */
    @gn.c(Plan.AMP_PLAN_SOURCE)
    private final int f20471d;

    /* renamed from: e, reason: collision with root package name */
    @gn.c("texts")
    private final List<Object> f20472e;

    /* renamed from: f, reason: collision with root package name */
    @gn.c("isAttachIframe")
    private final Boolean f20473f;

    public C0363a2(List list, ArrayList arrayList, ArrayList arrayList2) {
        int iB = EnumC0424d2.f20526d.b();
        EmptyList texts = EmptyList.f71733a;
        Intrinsics.g(texts, "texts");
        this.f20468a = list;
        this.f20469b = arrayList;
        this.f20470c = arrayList2;
        this.f20471d = iB;
        this.f20472e = texts;
        this.f20473f = null;
    }
}
