package io.branch.search.internal;

import android.content.Context;
import android.content.Intent;
import android.os.UserHandle;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.r5, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3346r5 implements b50.f {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final C3346r5 f65614a = new C3346r5();

    /* renamed from: io.branch.search.internal.r5$a */
    public static final class a {
    }

    @Override // b50.f
    public final boolean getOnlyDoReporting() {
        return false;
    }

    @Override // b50.f
    public final boolean openIntent(@NotNull Context context, @NotNull Intent intent, @Nullable UserHandle userHandle) {
        Intrinsics.g(context, "context");
        Intrinsics.g(intent, "intent");
        if (userHandle != null) {
            return C3390tf.a(context, intent.getComponent(), userHandle);
        }
        context.startActivity(intent);
        return true;
    }
}
