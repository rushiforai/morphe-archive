package io.branch.search.internal;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import io.branch.search.internal.Y2;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.zf, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3492zf implements InterfaceC3475yf {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final SharedPreferences f66380a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final c f66381b;

    /* renamed from: io.branch.search.internal.zf$a */
    public static final class a {
    }

    /* renamed from: io.branch.search.internal.zf$b */
    public static final class b implements c {

        /* renamed from: a, reason: collision with root package name */
        @NotNull
        public final F4 f66382a;

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public final Lazy<String> f66383b;

        /* renamed from: io.branch.search.internal.zf$b$a */
        public static final class a extends Lambda implements Function0<String> {
            public a() {
                super(0);
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() throws PackageManager.NameNotFoundException {
                String packageName = b.this.f66382a.f62438a.getPackageName();
                Intrinsics.f(packageName, "context.packageName");
                PackageManager packageManager = b.this.f66382a.f62438a.getPackageManager();
                Intrinsics.f(packageManager, "context.packageManager");
                PackageInfo packageInfo = packageManager.getPackageInfo(packageName, 0);
                Intrinsics.f(packageInfo, "contextDelegate.packageM…ackageInfo(appPackage, 0)");
                return packageInfo.versionName;
            }
        }

        public b(@NotNull F4 contextDelegate) {
            Intrinsics.g(contextDelegate, "contextDelegate");
            this.f66382a = contextDelegate;
            this.f66383b = LazyKt.a(new a());
        }

        @Override // io.branch.search.internal.C3492zf.c
        @NotNull
        public final String a(@NotNull String sessionId) {
            Intrinsics.g(sessionId, "sessionId");
            try {
                Object value = this.f66383b.getValue();
                Intrinsics.f(value, "{\n                appVersion.value\n            }");
                return (String) value;
            } catch (PackageManager.NameNotFoundException e3) {
                C3296o5.a(sessionId, e3, "VersionAnalyticsManagerImpl.getAppVersion");
                return "UNRESOLVED";
            }
        }
    }

    /* renamed from: io.branch.search.internal.zf$c */
    public interface c {
        @NotNull
        String a(@NotNull String str);
    }

    public C3492zf(@NotNull SharedPreferences versionSharedPrefs, @NotNull b versionProvider) {
        Intrinsics.g(versionSharedPrefs, "versionSharedPrefs");
        Intrinsics.g(versionProvider, "versionProvider");
        this.f66380a = versionSharedPrefs;
        this.f66381b = versionProvider;
    }

    @Override // io.branch.search.internal.InterfaceC3475yf
    public final long a(@NotNull String sessionId, long j11) {
        Intrinsics.g(sessionId, "sessionId");
        String str = "key_" + this.f66381b.a(sessionId);
        if (j11 < 0) {
            throw new IllegalArgumentException("Timestamp must be >= 0!");
        }
        long j12 = this.f66380a.getLong(str, -1L);
        if (j12 != -1 && j11 > j12) {
            return j12;
        }
        this.f66380a.edit().putLong(str, j11).apply();
        return j11;
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public C3492zf(@NotNull F4 contextDelegate) {
        Intrinsics.g(contextDelegate, "contextDelegate");
        Y2.a aVar = Y2.Companion;
        Context contextB = contextDelegate.b();
        Y2.b bVar = Y2.b.VersionAnalytics;
        aVar.getClass();
        this(Y2.a.a(contextB, bVar), new b(contextDelegate));
    }

    @Override // io.branch.search.internal.InterfaceC3475yf
    public final long a(long j11) {
        this.f66381b.getClass();
        if (j11 >= 0) {
            long j12 = this.f66380a.getLong("sdk_6.6.4", -1L);
            if (j12 != -1 && j11 > j12) {
                return j12;
            }
            this.f66380a.edit().putLong("sdk_6.6.4", j11).apply();
            return j11;
        }
        throw new IllegalArgumentException("Timestamp must be >= 0!");
    }
}
