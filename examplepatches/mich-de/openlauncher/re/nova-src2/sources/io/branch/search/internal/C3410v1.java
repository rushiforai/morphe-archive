package io.branch.search.internal;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.IBinder;
import android.os.IInterface;
import io.branch.search.internal.InterfaceC3315p7;
import io.branch.search.internal.InterfaceC3376t1;
import io.branch.search.internal.multiprocess.BranchSearchService;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.v1, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3410v1 implements InterfaceC3376t1 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Context f66078a;

    /* renamed from: b, reason: collision with root package name */
    public InterfaceC3376t1.a f66079b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final a f66080c;

    /* renamed from: io.branch.search.internal.v1$a */
    public static final class a implements ServiceConnection {
        public a() {
        }

        @Override // android.content.ServiceConnection
        public final void onBindingDied(@Nullable ComponentName componentName) {
            InterfaceC3376t1.a aVar = C3410v1.this.f66079b;
            if (aVar != null) {
                aVar.b();
            } else {
                Intrinsics.m("listener");
                throw null;
            }
        }

        @Override // android.content.ServiceConnection
        public final void onNullBinding(@Nullable ComponentName componentName) {
            InterfaceC3376t1.a aVar = C3410v1.this.f66079b;
            if (aVar != null) {
                aVar.c();
            } else {
                Intrinsics.m("listener");
                throw null;
            }
        }

        @Override // android.content.ServiceConnection
        public final void onServiceConnected(@Nullable ComponentName componentName, @Nullable IBinder iBinder) {
            if (iBinder == null) {
                onNullBinding(componentName);
                return;
            }
            InterfaceC3376t1.a aVar = C3410v1.this.f66079b;
            if (aVar == null) {
                Intrinsics.m("listener");
                throw null;
            }
            int i5 = InterfaceC3315p7.a.f65476a;
            IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface("io.branch.search.service.IBranchSearchService");
            aVar.a((iInterfaceQueryLocalInterface == null || !(iInterfaceQueryLocalInterface instanceof InterfaceC3315p7)) ? new InterfaceC3315p7.a.C0345a(iBinder) : (InterfaceC3315p7) iInterfaceQueryLocalInterface);
        }

        @Override // android.content.ServiceConnection
        public final void onServiceDisconnected(@Nullable ComponentName componentName) {
            InterfaceC3376t1.a aVar = C3410v1.this.f66079b;
            if (aVar != null) {
                aVar.a();
            } else {
                Intrinsics.m("listener");
                throw null;
            }
        }
    }

    public C3410v1(@NotNull Context context) {
        Intrinsics.g(context, "context");
        this.f66078a = context;
        this.f66080c = new a();
    }

    public final void a(@NotNull C3405ud l9) {
        Intrinsics.g(l9, "l");
        this.f66079b = l9;
    }

    @Override // io.branch.search.internal.InterfaceC3376t1
    public final boolean b() {
        return this.f66078a.bindService(new Intent(this.f66078a, (Class<?>) BranchSearchService.class), this.f66080c, 65);
    }

    @Override // io.branch.search.internal.InterfaceC3376t1
    public final void a() {
        this.f66078a.unbindService(this.f66080c);
    }
}
