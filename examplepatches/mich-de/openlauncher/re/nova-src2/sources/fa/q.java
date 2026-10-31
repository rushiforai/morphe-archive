package fa;

import android.content.Context;
import android.content.Intent;
import android.content.pm.LauncherApps;
import android.content.pm.ShortcutInfo;
import android.os.UserHandle;
import android.util.ArraySet;
import android.util.Log;
import com.android.launcher3.shortcuts.ShortcutKey;
import com.android.launcher3.util.ComponentKey;
import com.google.android.gms.internal.measurement.v6;
import com.teslacoilsw.launcher.preferences.fragments.SettingsGestures;
import com.teslacoilsw.launcher.util.NamedIntent;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.function.Consumer;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import kotlin.coroutines.EmptyCoroutineContext;

/* loaded from: classes.dex */
public final class q {

    /* renamed from: a, reason: collision with root package name */
    public final ya.s f54464a = new ya.s();

    /* renamed from: b, reason: collision with root package name */
    public final ArrayList f54465b = new ArrayList();

    /* renamed from: c, reason: collision with root package name */
    public final ArrayList f54466c = new ArrayList();

    /* renamed from: d, reason: collision with root package name */
    public final ya.s f54467d = new ya.s();

    /* renamed from: e, reason: collision with root package name */
    public final ya.s f54468e = new ya.s();

    /* renamed from: f, reason: collision with root package name */
    public final HashMap f54469f = new HashMap();

    /* renamed from: g, reason: collision with root package name */
    public final v6 f54470g = new v6(8);

    /* renamed from: h, reason: collision with root package name */
    public int f54471h = 0;

    /* JADX WARN: Removed duplicated region for block: B:22:0x005b A[Catch: all -> 0x0022, TryCatch #0 {all -> 0x0022, blocks: (B:5:0x0007, B:8:0x0025, B:39:0x00be, B:41:0x00c2, B:45:0x00d0, B:50:0x00db, B:52:0x00e2, B:48:0x00d5, B:44:0x00cc, B:54:0x00e9, B:56:0x00ed, B:20:0x0041, B:21:0x004b, B:22:0x005b, B:30:0x006b, B:32:0x007a, B:33:0x0087, B:35:0x008f, B:36:0x00a6, B:37:0x00b7), top: B:61:0x0007 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final synchronized void a(Context context, ga.e eVar, boolean z11, a0 a0Var) {
        if (a0Var != null) {
            try {
                a0Var.f54360a.add(new z("Adding item to ID map: " + eVar.toString()));
            } finally {
            }
        }
        this.f54464a.put(eVar.f57289a, eVar);
        int i5 = eVar.f57290b;
        if (i5 == 0 || i5 == 1) {
            int i11 = eVar.f57291c;
            if (i11 == -100 || i11 == -101) {
                this.f54465b.add(eVar);
            } else if (!z11) {
                ga.c cVarD = d(i11);
                cVarD.R0((ga.j) eVar, cVarD.H.size(), false);
            } else if (i11 < 0) {
                ga.j jVar = (ga.j) eVar;
                ga.c cVarD2 = d(i11);
                if (!cVarD2.H.c(jVar)) {
                    int iW0 = cVarD2.W0(jVar);
                    eVar.f57299k = iW0;
                    cVarD2.R0((ga.j) eVar, iW0, false);
                }
            } else if (!this.f54467d.d(i11)) {
                Log.e("BgDataModel", "adding item: " + eVar + " to a folder that  doesn't exist");
            }
        } else if (i5 == 2) {
            this.f54467d.put(eVar.f57289a, (ga.c) eVar);
            this.f54465b.add(eVar);
        } else if (i5 == 4 || i5 == 5) {
            this.f54466c.add((ga.g) eVar);
        } else if (i5 != 6) {
        }
        if (z11 && (eVar instanceof ga.f)) {
            ga.f fVar = (ga.f) eVar;
            NamedIntent namedIntent = fVar.f57309w;
            ShortcutKey shortcutKeyD = null;
            ShortcutKey shortcutKeyD2 = namedIntent == null ? null : namedIntent.d();
            NamedIntent namedIntent2 = fVar.f57308v;
            if (namedIntent2 != null) {
                shortcutKeyD = namedIntent2.d();
            }
            if (shortcutKeyD2 != null) {
                h(context, shortcutKeyD2.f21252b);
            }
            if (shortcutKeyD != null) {
                h(context, shortcutKeyD.f21252b);
            }
        }
        if (z11 && eVar.f57290b == 6) {
            h(context, eVar.o);
        }
    }

    public final synchronized void b() {
        this.f54465b.clear();
        this.f54466c.clear();
        this.f54467d.clear();
        this.f54464a.clear();
        this.f54469f.clear();
        this.f54468e.clear();
    }

    public final synchronized ya.p c() {
        ya.p pVar;
        int iBinarySearch;
        int i5;
        int iBinarySearch2;
        try {
            pVar = new ya.p();
            ya.s sVar = this.f54464a;
            sVar.getClass();
            int i11 = 0;
            while (true) {
                if (!(i11 < sVar.size())) {
                    break;
                }
                int i12 = i11 + 1;
                ga.e eVar = (ga.e) sVar.valueAt(i11);
                if (eVar.f57291c == -100 && (iBinarySearch2 = Arrays.binarySearch(pVar.f97193a, 0, pVar.f97194b, (i5 = eVar.f57292d))) < 0) {
                    pVar.d((-iBinarySearch2) - 1, i5);
                }
                i11 = i12;
            }
            if (pVar.isEmpty() && (iBinarySearch = Arrays.binarySearch(pVar.f97193a, 0, pVar.f97194b, 0)) < 0) {
                pVar.d((-iBinarySearch) - 1, 0);
            }
        } catch (Throwable th2) {
            throw th2;
        }
        return pVar;
    }

    public final synchronized ga.c d(int i5) {
        ga.c aVar;
        try {
            aVar = (ga.c) this.f54467d.get(i5);
            if (aVar == null) {
                aVar = i5 <= -200 ? new iz.a() : new ga.c();
                this.f54467d.put(i5, aVar);
            }
        } catch (Throwable th2) {
            throw th2;
        }
        return aVar;
    }

    public final void e(UserHandle userHandle, Consumer consumer) {
        ya.s sVar = this.f54464a;
        sVar.getClass();
        int i5 = 0;
        while (i5 < sVar.size()) {
            int i11 = i5 + 1;
            ga.e eVar = (ga.e) sVar.valueAt(i5);
            if ((eVar instanceof ga.j) && userHandle.equals(eVar.o)) {
                consumer.accept((ga.j) eVar);
            }
            i5 = i11;
        }
        ya.s sVar2 = this.f54468e;
        int size = sVar2.size() - 1;
        if (size < 0) {
            return;
        }
        sVar2.valueAt(size).getClass();
        throw new ClassCastException();
    }

    public final synchronized void f(Context context, Iterable iterable) {
        Intent intent;
        Intent intent2;
        try {
            ArraySet arraySet = new ArraySet();
            Iterator it = iterable.iterator();
            while (it.hasNext()) {
                ga.e eVar = (ga.e) it.next();
                if (eVar instanceof ga.f) {
                    NamedIntent namedIntent = ((ga.f) eVar).f57308v;
                    if (namedIntent != null && (intent2 = namedIntent.f46369b) != null && ShortcutKey.d(intent2, namedIntent.f46370c) != null) {
                        arraySet.add(eVar.o);
                    }
                    NamedIntent namedIntent2 = ((ga.f) eVar).f57309w;
                    if (namedIntent2 != null && (intent = namedIntent2.f46369b) != null && ShortcutKey.d(intent, namedIntent2.f46370c) != null) {
                        arraySet.add(eVar.o);
                    }
                }
                int i5 = eVar.f57290b;
                if (i5 == 0 || i5 == 1) {
                    this.f54465b.remove(eVar);
                } else if (i5 == 2) {
                    this.f54467d.remove(eVar.f57289a);
                    this.f54465b.remove(eVar);
                } else if (i5 == 4 || i5 == 5) {
                    this.f54466c.remove(eVar);
                } else if (i5 == 6) {
                    arraySet.add(eVar.o);
                    this.f54465b.remove(eVar);
                }
                this.f54464a.remove(eVar.f57289a);
            }
            arraySet.forEach(new ab.f0(4, this, context));
        } catch (Throwable th2) {
            throw th2;
        }
    }

    public final synchronized void g(String str, List list, UserHandle userHandle) {
        if (str != null) {
            try {
                Iterator it = this.f54469f.keySet().iterator();
                while (it.hasNext()) {
                    ComponentKey componentKey = (ComponentKey) it.next();
                    if (componentKey.f21251a.getPackageName().equals(str) && componentKey.f21252b.equals(userHandle)) {
                        it.remove();
                    }
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        Iterator it2 = list.iterator();
        while (it2.hasNext()) {
            ShortcutInfo shortcutInfo = (ShortcutInfo) it2.next();
            if (shortcutInfo.isEnabled() && (shortcutInfo.isDeclaredInManifest() || shortcutInfo.isDynamic())) {
                if (shortcutInfo.getActivity() != null) {
                    ComponentKey componentKey2 = new ComponentKey(shortcutInfo.getActivity(), shortcutInfo.getUserHandle());
                    Integer num = (Integer) this.f54469f.get(componentKey2);
                    HashMap map = this.f54469f;
                    int iIntValue = 1;
                    if (num != null) {
                        iIntValue = 1 + num.intValue();
                    }
                    map.put(componentKey2, Integer.valueOf(iIntValue));
                }
            }
        }
    }

    public final synchronized void h(Context context, UserHandle userHandle) {
        try {
            qa.b bVarC = new androidx.room.h(context, userHandle).c(6);
            if (bVarC.f83909a) {
                Map map = (Map) bVarC.stream().collect(Collectors.groupingBy(new n(2), Collectors.mapping(new n(4), Collectors.toSet())));
                Stream.Builder builder = Stream.builder();
                Objects.requireNonNull(builder);
                e(userHandle, new f(builder, 2));
                Stream streamFlatMap = builder.build().flatMap(new n(5));
                x xVar = (x) x.f54523e.h(context);
                xVar.a();
                for (Map.Entry entry : ((Map) Stream.concat(streamFlatMap, Stream.concat(Stream.concat(xVar.f54527d.stream().filter(new aa.y(userHandle, 1)).map(new ab.b0(userHandle, 2)), Arrays.stream(SettingsGestures.f46098l).map(new n(6)).filter(new db.e(4)).map(new n(7))), ((List) t70.m0.u(EmptyCoroutineContext.f71803a, new b00.p(new e20.d(context), null, 1))).stream().map(new n(0)))).filter(new db.e(3)).collect(Collectors.groupingBy(new n(1), Collectors.mapping(new n(3), Collectors.toSet())))).entrySet()) {
                    Set set = (Set) entry.getValue();
                    Set set2 = (Set) map.remove(entry.getKey());
                    if (set2 == null) {
                        set2 = Collections.EMPTY_SET;
                    }
                    if (set2.size() != set.size() || !set2.containsAll(set)) {
                        try {
                            ((LauncherApps) context.getSystemService(LauncherApps.class)).pinShortcuts((String) entry.getKey(), new ArrayList(set), userHandle);
                        } catch (IllegalStateException | SecurityException e3) {
                            Log.w("BgDataModel", "Failed to pin shortcut", e3);
                        }
                    }
                }
                map.keySet().forEach(new o(context, userHandle, 0));
            }
        } catch (Throwable th2) {
            throw th2;
        }
    }
}
