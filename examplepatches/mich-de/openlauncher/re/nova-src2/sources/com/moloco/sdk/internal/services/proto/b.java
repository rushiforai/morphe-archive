package com.moloco.sdk.internal.services.proto;

import android.util.Base64;
import com.moloco.sdk.UserIntent;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public final class b implements a {

    /* renamed from: a, reason: collision with root package name */
    public static final int f38124a = 0;

    @Override // com.moloco.sdk.internal.services.proto.a
    @NotNull
    public String a(@NotNull UserIntent.UserAdInteractionExt input, int i5) {
        Intrinsics.g(input, "input");
        String strEncodeToString = Base64.encodeToString(input.toByteArray(), i5);
        Intrinsics.f(strEncodeToString, "encodeToString(...)");
        return strEncodeToString;
    }
}
