package com.moloco.sdk.internal.android_context;

import android.annotation.SuppressLint;
import android.content.Context;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@SuppressLint({"StaticFieldLeak"})
/* loaded from: classes.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final a f36216a = new a();

    /* renamed from: b, reason: collision with root package name */
    public static volatile Context f36217b;

    @NotNull
    public final Context a() {
        Context context = f36217b;
        if (context != null) {
            return context;
        }
        Intrinsics.m("value");
        throw null;
    }

    public final void a(@NotNull Context context) {
        Intrinsics.g(context, "context");
        f36217b = context.getApplicationContext();
    }
}
