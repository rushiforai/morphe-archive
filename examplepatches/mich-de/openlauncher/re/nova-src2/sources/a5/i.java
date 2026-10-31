package a5;

import android.view.View;
import androidx.core.graphics.Insets;
import com.instabridge.mobilesdk.api.AnalyticsSink;
import com.instabridge.mobilesdk.api.PlanFilter;
import com.stripe.android.payments.StripeBrowserLauncherActivity;
import com.teslacoilsw.launcher.novamobile.NovaMobileActivity;
import java.text.BreakIterator;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentSkipListMap;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final /* synthetic */ class i implements cf.b, AnalyticsSink, PlanFilter, a0, ep.p {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f297a;

    public /* synthetic */ i(int i5) {
        this.f297a = i5;
    }

    @Override // ep.p
    public Object a() {
        switch (this.f297a) {
            case 22:
                return new ep.o(true);
            case 23:
                return new ArrayDeque();
            case 24:
                return new LinkedHashMap();
            case 25:
                return new TreeMap();
            case 26:
                return new ConcurrentHashMap();
            case 27:
                return new ConcurrentSkipListMap();
            case 28:
                return new ArrayList();
            default:
                return new LinkedHashSet();
        }
    }

    @Override // com.instabridge.mobilesdk.api.PlanFilter
    public List apply(List list) {
        return PlanFilter.Companion.Identity$lambda$0(list);
    }

    @Override // cf.b
    public boolean b(int i5, int i11, int i12, int i13, int i14) {
        return false;
    }

    public void c(el.d dVar) {
    }

    /* JADX WARN: Removed duplicated region for block: B:48:0x00c6  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x00eb  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public e1.s d(e1.m0 m0Var) {
        e1.r rVarW;
        e1.r rVarW2;
        e1.s sVar;
        int i5;
        int iFollowing;
        e1.s sVarA;
        switch (this.f297a) {
            case 15:
                aq.y yVar = (aq.y) m0Var.f51339d;
                return new e1.s(yVar.b(yVar.f15537b), yVar.b(yVar.f15538c), m0Var.h() == e1.i.f51308a);
            case 16:
                return io.sentry.config.a.t(m0Var, e1.t.f51383c);
            case 17:
                return io.sentry.config.a.t(m0Var, e1.t.f51382b);
            default:
                e1.s sVar2 = (e1.s) m0Var.f51338c;
                if (sVar2 == null) {
                    return io.sentry.config.a.t(m0Var, e1.t.f51383c);
                }
                e1.r rVar = sVar2.f51376b;
                e1.r rVar2 = sVar2.f51375a;
                aq.y yVar2 = (aq.y) m0Var.f51339d;
                if (m0Var.f51337b) {
                    rVarW2 = io.sentry.config.a.w(m0Var, yVar2, rVar2);
                    rVarW = rVar;
                    rVar = rVar2;
                    rVar2 = rVarW2;
                } else {
                    rVarW = io.sentry.config.a.w(m0Var, yVar2, rVar);
                    rVarW2 = rVarW;
                }
                if (Intrinsics.b(rVarW2, rVar)) {
                    return sVar2;
                }
                e1.s sVar3 = new e1.s(rVar2, rVarW, m0Var.h() == e1.i.f51308a || (m0Var.h() == e1.i.f51310c && rVar2.f51371b > rVarW.f51371b));
                aq.y yVar3 = (aq.y) m0Var.f51339d;
                e1.r rVar3 = sVar3.f51375a;
                long j11 = rVar3.f51372c;
                e1.r rVar4 = sVar3.f51376b;
                if (j11 != rVar4.f51372c) {
                    boolean z11 = sVar3.f51377c;
                    if ((z11 ? rVar3 : rVar4).f51371b == 0) {
                        if (z11) {
                            rVar3 = rVar4;
                        }
                        if (((m3.l0) yVar3.f15540e).f75927a.f75914a.f75880b.length() == rVar3.f51371b) {
                            new Ref.BooleanRef().f71859a = true;
                            String str = ((m3.l0) yVar3.f15540e).f75927a.f75914a.f75880b;
                            sVar = (e1.s) m0Var.f51338c;
                            boolean z12 = m0Var.f51337b;
                            if (sVar != null) {
                                String str2 = ((m3.l0) yVar3.f15540e).f75927a.f75914a.f75880b;
                                i5 = yVar3.f15537b;
                                int length = str2.length();
                                if (i5 != 0) {
                                }
                                return sVarA;
                            }
                        }
                    }
                } else if (rVar3.f51371b == rVar4.f51371b) {
                    String str3 = ((m3.l0) yVar3.f15540e).f75927a.f75914a.f75880b;
                    sVar = (e1.s) m0Var.f51338c;
                    boolean z122 = m0Var.f51337b;
                    if (sVar != null && str3.length() != 0) {
                        String str22 = ((m3.l0) yVar3.f15540e).f75927a.f75914a.f75880b;
                        i5 = yVar3.f15537b;
                        int length2 = str22.length();
                        if (i5 != 0) {
                            BreakIterator characterInstance = BreakIterator.getCharacterInstance();
                            characterInstance.setText(str22);
                            int iFollowing2 = characterInstance.following(0);
                            sVarA = z122 ? e1.s.a(sVar3, io.sentry.config.a.A(sVar3.f51375a, yVar3, iFollowing2), null, true, 2) : e1.s.a(sVar3, null, io.sentry.config.a.A(sVar3.f51376b, yVar3, iFollowing2), false, 1);
                        } else if (i5 == length2) {
                            BreakIterator characterInstance2 = BreakIterator.getCharacterInstance();
                            characterInstance2.setText(str22);
                            int iPreceding = characterInstance2.preceding(length2);
                            sVarA = z122 ? e1.s.a(sVar3, io.sentry.config.a.A(sVar3.f51375a, yVar3, iPreceding), null, false, 2) : e1.s.a(sVar3, null, io.sentry.config.a.A(sVar3.f51376b, yVar3, iPreceding), true, 1);
                        } else {
                            boolean z13 = sVar.f51377c;
                            if (z122 ^ z13) {
                                BreakIterator characterInstance3 = BreakIterator.getCharacterInstance();
                                characterInstance3.setText(str22);
                                iFollowing = characterInstance3.preceding(i5);
                            } else {
                                BreakIterator characterInstance4 = BreakIterator.getCharacterInstance();
                                characterInstance4.setText(str22);
                                iFollowing = characterInstance4.following(i5);
                            }
                            sVarA = z122 ? e1.s.a(sVar3, io.sentry.config.a.A(sVar3.f51375a, yVar3, iFollowing), null, z13, 2) : e1.s.a(sVar3, null, io.sentry.config.a.A(sVar3.f51376b, yVar3, iFollowing), z13, 1);
                        }
                        return sVarA;
                    }
                }
                return sVar3;
        }
    }

    @Override // com.instabridge.mobilesdk.api.AnalyticsSink
    public void track(String str, Map map) {
        AnalyticsSink.Companion.Noop$lambda$0(str, map);
    }

    @Override // a5.a0
    public h2 u(View view, h2 h2Var) {
        switch (this.f297a) {
            case 10:
                return com.moloco.sdk.internal.s.a(view, h2Var);
            case 11:
                return com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose.n.a(view, h2Var);
            case 12:
                List list = NovaMobileActivity.f45911x;
                Insets insetsG = h2Var.f296a.g(7);
                view.setPadding(view.getPaddingLeft(), insetsG.top, view.getPaddingRight(), insetsG.bottom);
                return h2Var;
            default:
                int i5 = StripeBrowserLauncherActivity.f44244p;
                Intrinsics.g(view, "view");
                Insets insetsG2 = h2Var.f296a.g(7);
                Intrinsics.f(insetsG2, "getInsets(...)");
                view.setPaddingRelative(insetsG2.bottom, view.getPaddingTop(), view.getPaddingEnd(), view.getPaddingBottom());
                return h2.f295b;
        }
    }
}
