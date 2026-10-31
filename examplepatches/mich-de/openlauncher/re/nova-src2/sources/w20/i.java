package w20;

import android.content.Context;
import android.content.Intent;
import com.teslacoilsw.launcher.util.NamedIntent;
import e10.s2;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class i extends ga.e {

    /* renamed from: r, reason: collision with root package name */
    public final s2 f93683r;

    /* renamed from: s, reason: collision with root package name */
    public final Intent f93684s;

    public /* synthetic */ i(Context context, NamedIntent namedIntent) {
        this(context, namedIntent, null);
    }

    @Override // ga.e
    public final Intent d() {
        return this.f93684s;
    }

    public final s2 f0() {
        return this.f93683r;
    }

    public i(Context context, NamedIntent namedIntent, s2 s2Var) {
        this.f93683r = s2Var;
        Intent intent = namedIntent.f46369b;
        Intrinsics.d(intent);
        this.f93684s = intent;
        this.o = namedIntent.f46370c;
        this.f57300l = namedIntent.a(context);
    }
}
