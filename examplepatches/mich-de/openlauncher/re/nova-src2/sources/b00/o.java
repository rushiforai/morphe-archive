package b00;

import androidx.compose.runtime.snapshots.SnapshotStateList;
import c3.t2;
import com.teslacoilsw.launcher.NovaLauncher;
import com.teslacoilsw.launcher.minusone.NovaFeedContentView;
import com.teslacoilsw.launcher.search.AppSearchResultsView;
import e10.s2;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;

/* loaded from: classes.dex */
public final class o implements w70.n {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f16422a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f16423b;

    public /* synthetic */ o(Object obj, int i5) {
        this.f16422a = i5;
        this.f16423b = obj;
    }

    /* JADX WARN: Removed duplicated region for block: B:9:0x0018  */
    @Override // w70.n
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object emit(Object obj, Continuation continuation) {
        Continuation continuation2;
        Object next;
        Object next2;
        Object next3;
        Object next4;
        w70.t tVar;
        switch (this.f16422a) {
            case 0:
                e20.d dVar = (e20.d) this.f16423b;
                ArrayList arrayListK1 = b70.g.K1((List) obj);
                Iterator it = arrayListK1.iterator();
                while (true) {
                    continuation2 = null;
                    if (it.hasNext()) {
                        next = it.next();
                        u10.e0 e0Var = ((e20.k) next).f52041c;
                        u10.h0 h0Var = e0Var instanceof u10.h0 ? (u10.h0) e0Var : null;
                        if (h0Var == null || !h0Var.f90382c) {
                        }
                    } else {
                        next = null;
                    }
                }
                if (next == null) {
                    EmptyList emptyList = EmptyList.f71733a;
                    u10.h0 h0Var2 = NovaFeedContentView.f45879y;
                    arrayListK1.add(new e20.k(emptyList, h0Var2.f90373a, h0Var2, true));
                }
                Iterator it2 = arrayListK1.iterator();
                while (true) {
                    if (it2.hasNext()) {
                        next2 = it2.next();
                        u10.e0 e0Var2 = ((e20.k) next2).f52041c;
                        u10.h0 h0Var3 = e0Var2 instanceof u10.h0 ? (u10.h0) e0Var2 : null;
                        if (h0Var3 == null || h0Var3.f90382c) {
                        }
                    } else {
                        next2 = null;
                    }
                }
                if (next2 == null) {
                    EmptyList emptyList2 = EmptyList.f71733a;
                    u10.h0 h0Var4 = NovaFeedContentView.f45880z;
                    arrayListK1.add(new e20.k(emptyList2, h0Var4.f90373a, h0Var4, true));
                }
                Iterator it3 = arrayListK1.iterator();
                while (true) {
                    if (it3.hasNext()) {
                        next3 = it3.next();
                        if (((e20.k) next3).f52041c instanceof u10.w0) {
                        }
                    } else {
                        next3 = null;
                    }
                }
                if (next3 == null) {
                    arrayListK1.add(new e20.k(EmptyList.f71733a, "WeatherCard:Weather", new u10.w0("WeatherCard:Weather"), true));
                }
                Iterator it4 = arrayListK1.iterator();
                while (true) {
                    if (it4.hasNext()) {
                        next4 = it4.next();
                        if (((e20.k) next4).f52041c instanceof u10.c0) {
                        }
                    } else {
                        next4 = null;
                    }
                }
                if (next4 == null) {
                    arrayListK1.add(new e20.k(EmptyList.f71733a, "GamesCard:Games", new u10.c0(), true));
                }
                Object objA = e20.e.a(dVar.f52015a).a(new e20.c(arrayListK1, continuation2, 0), continuation);
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                if (objA != coroutineSingletons) {
                    objA = Unit.f71706a;
                }
                return objA == coroutineSingletons ? objA : Unit.f71706a;
            case 1:
                ((t2) this.f16423b).f19426a.p(((Number) obj).floatValue());
                return Unit.f71706a;
            case 2:
                ((s2) this.f16423b).f51810e = obj;
                return Unit.f71706a;
            case 3:
                i0.h hVar = (i0.h) obj;
                SnapshotStateList snapshotStateList = (SnapshotStateList) this.f16423b;
                if (hVar instanceof i0.f) {
                    snapshotStateList.add(hVar);
                } else if (hVar instanceof i0.g) {
                    snapshotStateList.remove(((i0.g) hVar).a());
                } else if (hVar instanceof i0.d) {
                    snapshotStateList.add(hVar);
                } else if (hVar instanceof i0.e) {
                    snapshotStateList.remove(((i0.e) hVar).a());
                } else if (hVar instanceof i0.k) {
                    snapshotStateList.add(hVar);
                } else if (hVar instanceof i0.l) {
                    snapshotStateList.remove(((i0.l) hVar).a());
                } else if (hVar instanceof i0.j) {
                    snapshotStateList.remove(((i0.j) hVar).a());
                }
                return Unit.f71706a;
            case 4:
                mc0.d.f76206a.m("novaColorSchemeManager palletFlow " + ((tz.o) obj), new Object[0]);
                ((NovaLauncher) this.f16423b).recreate();
                return Unit.f71706a;
            case 5:
                ((p1.p1) this.f16423b).setValue(obj);
                return Unit.f71706a;
            case 6:
                AppSearchResultsView appSearchResultsView = (AppSearchResultsView) this.f16423b;
                List list = (List) obj;
                ArrayList arrayList = new ArrayList(b70.c.u0(list, 10));
                Iterator it5 = list.iterator();
                while (it5.hasNext()) {
                    arrayList.add(((e20.k) it5.next()).f52041c);
                }
                ArrayList arrayList2 = new ArrayList();
                Iterator it6 = arrayList.iterator();
                while (it6.hasNext()) {
                    Object next5 = it6.next();
                    if (next5 instanceof u10.c) {
                        arrayList2.add(next5);
                    }
                }
                appSearchResultsView.K = arrayList2;
                return Unit.f71706a;
            default:
                if (continuation instanceof w70.t) {
                    tVar = (w70.t) continuation;
                    int i5 = tVar.f94018v;
                    if ((i5 & Integer.MIN_VALUE) != 0) {
                        tVar.f94018v = i5 - Integer.MIN_VALUE;
                    } else {
                        tVar = new w70.t(this, continuation);
                    }
                }
                Object obj2 = tVar.f94016t;
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i11 = tVar.f94018v;
                if (i11 == 0) {
                    ResultKt.b(obj2);
                    v70.x xVar = (v70.x) this.f16423b;
                    if (obj == null) {
                        obj = x70.b.f95216b;
                    }
                    tVar.f94018v = 1;
                    if (((v70.w) xVar).f92201d.t(obj, tVar) == coroutineSingletons2) {
                        return coroutineSingletons2;
                    }
                } else {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj2);
                }
                return Unit.f71706a;
        }
    }
}
