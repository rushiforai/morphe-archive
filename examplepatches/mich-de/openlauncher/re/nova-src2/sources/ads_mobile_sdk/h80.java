package ads_mobile_sdk;

import java.util.concurrent.CancellationException;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlinx.coroutines.TimeoutCancellationException;

/* loaded from: classes.dex */
public final class h80 extends w.b {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ i80 f4241a;

    public h80(i80 i80Var) {
        this.f4241a = i80Var;
    }

    @Override // w.b
    public final void onNavigationEvent(int i5) {
        kz2 kz2Var = this.f4241a.f4666c;
        wv0 wv0Var = wv0.CUI_NAME_CUSTOM_TABS_NAVIGATION_EVENT;
        mi3 mi3Var = new mi3(new ur2(), new fh1(), new tu2(), new s8());
        EmptyList emptyList = EmptyList.f71733a;
        if (ji3.b().f4777a == null) {
            em2 em2VarA = kz2.a(kz2Var, wv0Var, emptyList, mi3Var);
            try {
                ji3.a().e().A = Integer.valueOf(i5);
                Unit unit = Unit.f71706a;
                em2VarA.close();
            } catch (Throwable th2) {
                try {
                    em2VarA.b(th2);
                    if (th2 instanceof b.a4) {
                        throw th2;
                    }
                    if (!(th2 instanceof TimeoutCancellationException) && !(th2 instanceof CancellationException)) {
                        em2VarA.a(th2);
                    }
                    if (th2 instanceof TimeoutCancellationException) {
                        throw new lw0(th2);
                    }
                    if (th2 instanceof CancellationException) {
                        throw new du0(th2);
                    }
                    if (!(th2 instanceof dv0)) {
                        throw new iu0(th2);
                    }
                    throw th2;
                } finally {
                }
            }
        } else {
            th3 th3VarA = ji3.a(wv0Var, emptyList, true);
            try {
                ji3.a().e().A = Integer.valueOf(i5);
                Unit unit2 = Unit.f71706a;
                th3VarA.close();
            } catch (Throwable th3) {
                try {
                    th3VarA.b(th3);
                    if (th3 instanceof b.a4) {
                        throw th3;
                    }
                    if (!(th3 instanceof TimeoutCancellationException) && !(th3 instanceof CancellationException)) {
                        th3VarA.a(th3);
                    }
                    if (th3 instanceof TimeoutCancellationException) {
                        throw new lw0(th3);
                    }
                    if (th3 instanceof CancellationException) {
                        throw new du0(th3);
                    }
                    if (!(th3 instanceof dv0)) {
                        throw new iu0(th3);
                    }
                    throw th3;
                } finally {
                }
            }
        }
    }
}
