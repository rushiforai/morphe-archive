package io.branch.search.internal;

import android.content.SharedPreferences;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class S8 {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final SharedPreferences f63343a;

    public static final class a {
    }

    public S8(@NotNull SharedPreferences prefs) {
        Intrinsics.g(prefs, "prefs");
        this.f63343a = prefs;
    }
}
