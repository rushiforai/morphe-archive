package com.amplitude;

import java.security.MessageDigest;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class M0 extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public static final M0 f20323a = new M0();

    public M0() {
        super(0);
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        return MessageDigest.getInstance("SHA-256");
    }
}
