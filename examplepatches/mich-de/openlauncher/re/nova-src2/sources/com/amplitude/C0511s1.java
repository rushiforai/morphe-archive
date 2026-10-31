package com.amplitude;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* renamed from: com.amplitude.s1, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public final class C0511s1 extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public static final C0511s1 f20745a = new C0511s1();

    public C0511s1() {
        super(0);
    }

    public static String a() {
        return "===== Average snapshot duration: " + (AbstractC0521u1.f20775e / AbstractC0521u1.f20773c) + "ms =====";
    }

    @Override // kotlin.jvm.functions.Function0
    public final /* bridge */ /* synthetic */ Object invoke() {
        return a();
    }
}
