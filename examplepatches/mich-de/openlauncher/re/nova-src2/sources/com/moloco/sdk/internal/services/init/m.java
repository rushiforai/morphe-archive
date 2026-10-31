package com.moloco.sdk.internal.services.init;

import com.moloco.sdk.Init;
import com.moloco.sdk.internal.services.init.j;
import com.moloco.sdk.internal.x;
import kotlin.jvm.internal.Intrinsics;
import o50.v;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class m {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final String f38107a = "InitService";

    public static final boolean a(@NotNull x.a<Init.SDKInitResponse, j> aVar) {
        Intrinsics.g(aVar, "<this>");
        if (aVar.a() instanceof j.b) {
            return a(((j.b) aVar.a()).a());
        }
        return true;
    }

    public static final boolean a(int i5) {
        v vVar = v.f79594c;
        return i5 == v.n.f79606a || i5 == v.f79604m.f79606a || i5 < 400 || i5 >= 500;
    }
}
