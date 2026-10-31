package io.branch.search.internal;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Build;
import android.os.UserManager;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.b6, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3077b6 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final t70.j0 f64015a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final t70.r f64016b;

    /* renamed from: io.branch.search.internal.b6$a */
    public static final class a extends BroadcastReceiver {
        public a() {
        }

        @Override // android.content.BroadcastReceiver
        public final void onReceive(@NotNull Context context, @Nullable Intent intent) {
            Intrinsics.g(context, "context");
            context.unregisterReceiver(this);
            ((t70.s) C3077b6.this.f64016b).X(Boolean.TRUE);
        }
    }

    public C3077b6(@NotNull Context context, @NotNull t70.j0 scope) {
        Intrinsics.g(context, "context");
        Intrinsics.g(scope, "scope");
        this.f64015a = scope;
        UserManager userManager = (UserManager) context.getSystemService(UserManager.class);
        t70.s sVarB = t70.m0.b();
        this.f64016b = sVarB;
        a aVar = new a();
        if (Build.VERSION.SDK_INT >= 33) {
            context.registerReceiver(aVar, new IntentFilter("android.intent.action.USER_UNLOCKED"), 4);
        } else {
            context.registerReceiver(aVar, new IntentFilter("android.intent.action.USER_UNLOCKED"));
        }
        if (userManager.isUserUnlocked()) {
            context.unregisterReceiver(aVar);
            sVarB.X(Boolean.TRUE);
        }
    }
}
