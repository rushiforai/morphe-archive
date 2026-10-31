package io.branch.search.internal;

import android.content.ContentProviderClient;
import android.database.Cursor;
import android.os.Bundle;
import android.os.DeadObjectException;
import io.branch.search.internal.InterfaceC3272mf;
import kotlin.Pair;
import kotlin.Unit;
import kotlin.jdk7.AutoCloseableKt;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class D4 implements InterfaceC3272mf {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final F4 f62337a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final InterfaceC3133eb f62338b;

    public D4(@NotNull F4 context, @NotNull InterfaceC3133eb processHandler) {
        Intrinsics.g(context, "context");
        Intrinsics.g(processHandler, "processHandler");
        this.f62337a = context;
        this.f62338b = processHandler;
    }

    @Override // io.branch.search.internal.InterfaceC3272mf
    public final void a() {
        ContentProviderClient contentProviderClientAcquireUnstableContentProviderClient = this.f62337a.f62438a.getContentResolver().acquireUnstableContentProviderClient(F4.a(this.f62337a, new Pair[0]));
        if (contentProviderClientAcquireUnstableContentProviderClient == null) {
            return;
        }
        try {
            try {
                contentProviderClientAcquireUnstableContentProviderClient.delete(F4.a(this.f62337a, new Pair[0]), null, null);
            } catch (DeadObjectException unused) {
                Unit unit = Unit.f71706a;
            }
            AutoCloseableKt.a(contentProviderClientAcquireUnstableContentProviderClient, null);
        } finally {
        }
    }

    @Override // io.branch.search.internal.InterfaceC3272mf
    @NotNull
    public final Pair<String, InterfaceC3272mf.c> b() {
        InterfaceC3133eb processHandler;
        ContentProviderClient contentProviderClientAcquireUnstableContentProviderClient = this.f62337a.f62438a.getContentResolver().acquireUnstableContentProviderClient(F4.a(this.f62337a, new Pair[0]));
        String str = null;
        if (contentProviderClientAcquireUnstableContentProviderClient != null) {
            try {
                Bundle bundle = new Bundle();
                bundle.putString("PROCESS_HANDLER", this.f62338b.getClass().getCanonicalName());
                Cursor cursorQuery = contentProviderClientAcquireUnstableContentProviderClient.query(F4.a(this.f62337a, new Pair[0]), null, bundle, null);
                if (cursorQuery != null) {
                    try {
                        String string = cursorQuery.moveToFirst() ? cursorQuery.getString(0) : null;
                        cursorQuery.close();
                        str = string;
                    } finally {
                    }
                }
                contentProviderClientAcquireUnstableContentProviderClient.close();
                InterfaceC3272mf.b bVar = InterfaceC3272mf.Companion;
                processHandler = this.f62338b;
                bVar.getClass();
                Intrinsics.g(processHandler, "processHandler");
            } catch (DeadObjectException unused) {
                contentProviderClientAcquireUnstableContentProviderClient.close();
                InterfaceC3272mf.b bVar2 = InterfaceC3272mf.Companion;
                InterfaceC3133eb processHandler2 = this.f62338b;
                bVar2.getClass();
                Intrinsics.g(processHandler2, "processHandler");
                if (processHandler2.f()) {
                }
            } catch (Throwable th2) {
                contentProviderClientAcquireUnstableContentProviderClient.close();
                InterfaceC3272mf.b bVar3 = InterfaceC3272mf.Companion;
                InterfaceC3133eb processHandler3 = this.f62338b;
                bVar3.getClass();
                Intrinsics.g(processHandler3, "processHandler");
                if (processHandler3.f()) {
                    a();
                }
                throw th2;
            }
            if (processHandler.f()) {
                a();
            }
        }
        return new Pair<>(str, InterfaceC3272mf.c.PROXY);
    }

    @Override // io.branch.search.internal.InterfaceC3272mf
    @Nullable
    public final String get() {
        return (String) b().f71683a;
    }
}
