package io.branch.search.internal;

import android.content.Context;
import android.content.SharedPreferences;
import io.branch.search.internal.Y2;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.x3, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3446x3 {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public static C3446x3 f66254b;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final SharedPreferences f66255a;

    public C3446x3(@NotNull Context context) {
        Intrinsics.g(context, "context");
        Y2.a aVar = Y2.Companion;
        Y2.b bVar = Y2.b.BundleUpdateLock;
        aVar.getClass();
        this.f66255a = Y2.a.a(context, bVar);
    }

    public final synchronized void a() {
        this.f66255a.edit().clear().commit();
    }

    public final synchronized boolean b() {
        return this.f66255a.getBoolean("KEY_REMOTE_BUNDLE", false);
    }

    public final synchronized void c() {
        this.f66255a.edit().putBoolean("KEY_REMOTE_BUNDLE", true).apply();
    }

    public final synchronized void a(long j11) {
        this.f66255a.edit().putLong("bundle_update_min_delay", j11).commit();
    }

    /* renamed from: io.branch.search.internal.x3$a */
    public static final class a {
        @JvmStatic
        @NotNull
        public final synchronized C3446x3 a(@NotNull Context context) {
            C3446x3 c3446x3;
            try {
                Intrinsics.g(context, "context");
                if (C3446x3.f66254b == null) {
                    C3446x3.f66254b = new C3446x3(context);
                }
                c3446x3 = C3446x3.f66254b;
                Intrinsics.e(c3446x3, "null cannot be cast to non-null type io.branch.search.internal.rawsqlite.BundleUpdateSharedPrefLock");
            } catch (Throwable th2) {
                throw th2;
            }
            return c3446x3;
        }

        @JvmStatic
        public final synchronized void a(@NotNull Context context, @NotNull String version) {
            SharedPreferences.Editor editorPutString;
            Intrinsics.g(context, "context");
            Intrinsics.g(version, "version");
            SharedPreferences.Editor editorEdit = a(context).f66255a.edit();
            if (editorEdit != null && (editorPutString = editorEdit.putString("CURR_SDK_VERSION", version)) != null) {
                editorPutString.apply();
            }
        }
    }
}
