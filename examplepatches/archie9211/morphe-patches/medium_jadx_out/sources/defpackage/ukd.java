package defpackage;

import androidx.work.impl.WorkDatabase;
import com.medium.android.data.preferences.DarkMode;
import com.medium.android.yourfollowingfeed.ui.YourFollowingFeedFragment;
import gen.model.SourceParameter;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.UUID;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ukd implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;

    public /* synthetic */ ukd(Object obj, Object obj2, Object obj3, int i) {
        this.a = i;
        this.c = obj;
        this.d = obj2;
        this.b = obj3;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        int i2 = 1;
        n92 n92Var = null;
        c1e c1eVar = c1e.a;
        Object obj = this.b;
        Object obj2 = this.d;
        Object obj3 = this.c;
        switch (i) {
            case 0:
                l78 l78Var = (l78) obj;
                l78Var.setValue((DarkMode) obj3);
                ((x45) obj2).invoke((DarkMode) l78Var.getValue());
                return c1eVar;
            case 1:
                ((l78) obj).setValue(Boolean.FALSE);
                ((l8e) obj3).a.i.d("selectedActivityType", (w9e) obj2);
                return c1eVar;
            case 2:
                n8e n8eVar = (n8e) obj3;
                String str = (String) obj2;
                SourceParameter sourceParameter = ((aae) obj).n;
                n8eVar.getClass();
                str.getClass();
                n8eVar.a.u(str, sourceParameter);
                return c1eVar;
            case 3:
                v7f v7fVar = (v7f) obj3;
                UUID uuid = (UUID) obj2;
                dt2 dt2Var = (dt2) obj;
                v7fVar.getClass();
                String string = uuid.toString();
                d87 d87VarH = d87.h();
                String str2 = v7f.c;
                d87VarH.d(str2, "Updating progress for " + uuid + " (" + dt2Var + ")");
                WorkDatabase workDatabase = v7fVar.a;
                workDatabase.b();
                try {
                    c8f c8fVarE = workDatabase.x().e(string);
                    if (c8fVarE == null) {
                        throw new IllegalStateException("Calls to setProgressAsync() must complete before a ListenableWorker signals completion of work by returning an instance of Result.");
                    }
                    if (c8fVarE.b == j7f.RUNNING) {
                        t7f t7fVar = new t7f(dt2Var, string);
                        u7f u7fVarW = workDatabase.w();
                        u7fVarW.getClass();
                        n01.c0(u7fVarW.a, false, true, new vrd(u7fVarW, 19, t7fVar));
                    } else {
                        d87.h().l(str2, "Ignoring setProgressAsync(...). WorkSpec (" + string + ") is not in a RUNNING state.");
                    }
                    workDatabase.q();
                    return null;
                } catch (Throwable th) {
                    try {
                        d87.h().g(str2, "Error updating Worker progress", th);
                        throw th;
                    } finally {
                        workDatabase.m();
                    }
                }
            case 4:
                m7f m7fVar = (m7f) obj3;
                String str3 = (String) obj2;
                d89 d89Var = (d89) obj;
                final WorkDatabase workDatabase2 = m7fVar.c;
                g8f g8fVarX = workDatabase2.x();
                List listF = g8fVarX.f(str3);
                if (listF.size() > 1) {
                    ik4.k("Can't apply UPDATE policy to the chains of work.");
                    return null;
                }
                a8f a8fVar = (a8f) bu1.z0(listF);
                if (a8fVar == null) {
                    fz3.a(new b7f(m7fVar, str3, j54.KEEP, d46.Q(d89Var), 0));
                } else {
                    String str4 = a8fVar.a;
                    c8f c8fVarE2 = g8fVarX.e(str4);
                    if (c8fVarE2 == null) {
                        ygf.f(ev6.y("WorkSpec with ", str4, ", that matches a name \"", str3, "\", wasn't found"));
                        return null;
                    }
                    if (!c8fVarE2.c()) {
                        ik4.k("Can't update OneTimeWorker to Periodic Worker. Update operation must preserve worker's type.");
                        return null;
                    }
                    if (a8fVar.b == j7f.CANCELLED) {
                        g8fVarX.c(str4);
                        fz3.a(new b7f(m7fVar, str3, j54.KEEP, d46.Q(d89Var), 0));
                    } else {
                        final c8f c8fVarB = c8f.b(d89Var.b, a8fVar.a, null, null, null, 0, 0L, 0, 0, 0L, 0, 33554430);
                        i2a i2aVar = m7fVar.f;
                        i2aVar.getClass();
                        workDatabase2.getClass();
                        r32 r32Var = m7fVar.b;
                        r32Var.getClass();
                        final List list = m7fVar.e;
                        list.getClass();
                        final Set set = d89Var.c;
                        final String str5 = c8fVarB.a;
                        final c8f c8fVarE3 = workDatabase2.x().e(str5);
                        if (c8fVarE3 == null) {
                            ay0.e(ev6.x("Worker with ", str5, " doesn't exist"));
                            return null;
                        }
                        if (!c8fVarE3.b.isFinished()) {
                            if (c8fVarE3.c() ^ c8fVarB.c()) {
                                StringBuilder sb = new StringBuilder("Can't update ");
                                sb.append(c8fVarE3.c() ? "Periodic" : "OneTime");
                                sb.append(" Worker to ");
                                throw new UnsupportedOperationException(ka1.v(sb, c8fVarB.c() ? "Periodic" : "OneTime", " Worker. Update operation must preserve worker's type."));
                            }
                            final boolean zF = i2aVar.f(str5);
                            if (!zF) {
                                Iterator it2 = list.iterator();
                                while (it2.hasNext()) {
                                    ((pqb) it2.next()).d(str5);
                                }
                            }
                            workDatabase2.p(new i5b(10, new Runnable() { // from class: m8f
                                @Override // java.lang.Runnable
                                public final void run() {
                                    WorkDatabase workDatabase3 = workDatabase2;
                                    g8f g8fVarX2 = workDatabase3.x();
                                    i8f i8fVarY = workDatabase3.y();
                                    c8f c8fVar = c8fVarE3;
                                    j7f j7fVar = c8fVar.b;
                                    int i3 = c8fVar.k;
                                    long j = c8fVar.n;
                                    int i4 = c8fVar.t + 1;
                                    int i5 = c8fVar.s;
                                    long j2 = c8fVar.u;
                                    int i6 = c8fVar.v;
                                    c8f c8fVar2 = c8fVarB;
                                    c8f c8fVarB2 = c8f.b(c8fVar2, null, j7fVar, null, null, i3, j, i5, i4, j2, i6, 29613053);
                                    if (c8fVar2.v == 1) {
                                        c8fVarB2.u = c8fVar2.u;
                                        c8fVarB2.v++;
                                    }
                                    c8f c8fVarD0 = nk7.D0(list, c8fVarB2);
                                    g8fVarX2.getClass();
                                    n01.c0(g8fVarX2.a, false, true, new zzb(g8fVarX2, c8fVarD0));
                                    i8fVarY.getClass();
                                    String str6 = str5;
                                    str6.getClass();
                                    n01.c0(i8fVarY.a, false, true, new nmc(str6, 26));
                                    i8fVarY.a(str6, set);
                                    if (zF) {
                                        return;
                                    }
                                    g8fVarX2.g(-1L, str6);
                                    u7f u7fVarW2 = workDatabase3.w();
                                    u7fVarW2.getClass();
                                    n01.c0(u7fVarW2.a, false, true, new nmc(str6, 13));
                                }
                            }));
                            if (!zF) {
                                zqb.b(r32Var, workDatabase2, list);
                            }
                        }
                    }
                }
                return c1eVar;
            case 5:
                ((l78) obj).setValue(Boolean.FALSE);
                xpc xpcVar = ((laf) obj3).a.h;
                xpcVar.getClass();
                xpcVar.m(null, (paf) obj2);
                return c1eVar;
            case 6:
                vx0.c0((sb2) obj3, null, null, new hie((j78) obj2, (j78) obj, n92Var, i2), 3);
                return c1eVar;
            case 7:
                SourceParameter sourceParameter2 = (SourceParameter) obj;
                String str6 = ((jw4) obj2).a;
                str6.getClass();
                sourceParameter2.getClass();
                YourFollowingFeedFragment yourFollowingFeedFragment = ((ddf) obj3).b.a;
                ((p13) yourFollowingFeedFragment.Z()).Q(yourFollowingFeedFragment.S(), str6, gp7.u(sourceParameter2));
                return c1eVar;
            case 8:
                ((l78) obj).setValue(Boolean.FALSE);
                ((ddf) obj3).a.c.d("selected_tag_sort", (wdf) obj2);
                return c1eVar;
            default:
                SourceParameter sourceParameter3 = (SourceParameter) obj;
                String str7 = ((aw4) obj2).a;
                str7.getClass();
                sourceParameter3.getClass();
                ((ddf) obj3).b.a(str7, sourceParameter3);
                return c1eVar;
        }
    }
}
