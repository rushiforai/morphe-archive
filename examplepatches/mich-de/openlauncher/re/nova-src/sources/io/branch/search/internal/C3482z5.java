package io.branch.search.internal;

import android.annotation.SuppressLint;
import android.content.Context;
import io.branch.search.internal.InterfaceC3133eb;
import java.lang.reflect.InvocationTargetException;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.z5, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3482z5 implements InterfaceC3133eb {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Context f66356a;

    public C3482z5(@NotNull Context context) {
        Intrinsics.g(context, "context");
        this.f66356a = context;
    }

    @Override // io.branch.search.internal.InterfaceC3133eb
    public final boolean a() {
        return Intrinsics.b(g(), InterfaceC3133eb.a.a());
    }

    @Override // io.branch.search.internal.InterfaceC3133eb
    public final boolean b() {
        return Intrinsics.b(g(), g() + this.f66356a.getString(2132017581));
    }

    @Override // io.branch.search.internal.InterfaceC3133eb
    public final boolean c() throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        return r70.j.A0(InterfaceC3133eb.a.a(), g() + this.f66356a.getString(2132017581), false);
    }

    @Override // io.branch.search.internal.InterfaceC3133eb
    public final boolean d() throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        String strA = InterfaceC3133eb.a.a();
        String string = this.f66356a.getString(2132017587);
        Intrinsics.f(string, "context.getString(R.stri…ranch_user_agent_process)");
        return r70.j.A0(strA, string, false);
    }

    @Override // io.branch.search.internal.InterfaceC3133eb
    @SuppressLint({"PrivateApi", "DiscouragedPrivateApi"})
    @NotNull
    public final String e() {
        return InterfaceC3133eb.a.a();
    }

    @Override // io.branch.search.internal.InterfaceC3133eb
    public final boolean f() {
        String str = g() + this.f66356a.getString(2132017587);
        if (Intrinsics.b(str, g())) {
            return false;
        }
        StringBuilder sb2 = new StringBuilder();
        sb2.append(g());
        sb2.append(this.f66356a.getString(2132017581));
        return !Intrinsics.b(str, sb2.toString());
    }

    public final String g() {
        String str = this.f66356a.getPackageManager().getApplicationInfo(this.f66356a.getPackageName(), 0).processName;
        Intrinsics.f(str, "context.packageManager.g…ckageName, 0).processName");
        return str;
    }

    public final boolean h() {
        if (Intrinsics.b(g() + this.f66356a.getString(2132017587), g())) {
            return false;
        }
        String str = g() + this.f66356a.getString(2132017587);
        StringBuilder sb2 = new StringBuilder();
        sb2.append(g());
        sb2.append(this.f66356a.getString(2132017581));
        return Intrinsics.b(str, sb2.toString());
    }
}
