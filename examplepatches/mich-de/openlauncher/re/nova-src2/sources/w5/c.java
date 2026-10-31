package w5;

import android.content.Context;
import android.content.SharedPreferences;
import b3.b1;
import b70.g;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import kotlin.LazyKt;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import u00.p;
import x5.j;

/* loaded from: classes2.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public final p f93758a;

    /* renamed from: b, reason: collision with root package name */
    public final j f93759b;

    /* renamed from: c, reason: collision with root package name */
    public final Context f93760c;

    /* renamed from: d, reason: collision with root package name */
    public final String f93761d;

    /* renamed from: e, reason: collision with root package name */
    public final a70.d f93762e;

    /* renamed from: f, reason: collision with root package name */
    public final Set f93763f;

    public c(Context context, String sharedPreferencesName, Set keysToMigrate, p pVar, j jVar) {
        Intrinsics.g(context, "context");
        Intrinsics.g(sharedPreferencesName, "sharedPreferencesName");
        Intrinsics.g(keysToMigrate, "keysToMigrate");
        b1 b1Var = new b1(20, context, sharedPreferencesName);
        this.f93758a = pVar;
        this.f93759b = jVar;
        this.f93760c = context;
        this.f93761d = sharedPreferencesName;
        this.f93762e = LazyKt.a(b1Var);
        this.f93763f = keysToMigrate == d.f93764a ? null : g.M1(keysToMigrate);
    }

    public final Object a(Object obj, t5.e eVar) {
        return this.f93759b.invoke(new e((SharedPreferences) this.f93762e.getValue(), this.f93763f), obj, eVar);
    }

    /* JADX WARN: Removed duplicated region for block: B:27:0x006a  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(Object obj, ContinuationImpl continuationImpl) {
        b bVar;
        c cVar;
        if (continuationImpl instanceof b) {
            bVar = (b) continuationImpl;
            int i5 = bVar.f93757w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                bVar.f93757w = i5 - Integer.MIN_VALUE;
            } else {
                bVar = new b(this, continuationImpl);
            }
        }
        Object objInvoke = bVar.f93755u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = bVar.f93757w;
        boolean z11 = true;
        if (i11 == 0) {
            ResultKt.b(objInvoke);
            bVar.f93754t = this;
            bVar.f93757w = 1;
            objInvoke = this.f93758a.invoke(obj, bVar);
            if (objInvoke == coroutineSingletons) {
                return coroutineSingletons;
            }
            cVar = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            cVar = bVar.f93754t;
            ResultKt.b(objInvoke);
        }
        if (!((Boolean) objInvoke).booleanValue()) {
            return Boolean.FALSE;
        }
        Set set = cVar.f93763f;
        a70.d dVar = cVar.f93762e;
        if (set == null) {
            Map<String, ?> all = ((SharedPreferences) dVar.getValue()).getAll();
            Intrinsics.f(all, "sharedPrefs.all");
            if (all.isEmpty()) {
                z11 = false;
            }
        } else {
            Set set2 = set;
            SharedPreferences sharedPreferences = (SharedPreferences) dVar.getValue();
            if (!(set2 instanceof Collection) || !set2.isEmpty()) {
                Iterator it = set2.iterator();
                while (it.hasNext()) {
                    if (sharedPreferences.contains((String) it.next())) {
                        break;
                    }
                }
                z11 = false;
            }
        }
        return Boolean.valueOf(z11);
    }
}
