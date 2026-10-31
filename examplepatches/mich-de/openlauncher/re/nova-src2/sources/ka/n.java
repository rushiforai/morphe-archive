package ka;

import aa.a0;
import ab.e0;
import ai.r2;
import android.content.ComponentName;
import android.content.Context;
import android.content.pm.LauncherApps;
import android.content.pm.ShortcutInfo;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Handler;
import android.os.UserHandle;
import android.service.notification.StatusBarNotification;
import com.android.launcher3.icons.BitmapInfo;
import com.android.launcher3.popup.PopupContainerWithArrow;
import com.android.launcher3.shortcuts.DeepShortcutView;
import fa.l0;
import fz.d0;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.function.Function;
import java.util.stream.Collectors;
import mx.g0;
import o9.t1;
import r10.o0;

/* loaded from: classes2.dex */
public abstract class n {

    /* renamed from: a, reason: collision with root package name */
    public static final r2 f71298a = new r2(16);

    /* JADX WARN: Type inference failed for: r0v0, types: [ka.k] */
    public static k a(final Context context, final ga.e eVar, final Handler handler, final PopupContainerWithArrow popupContainerWithArrow, final ArrayList arrayList, final List list) {
        final ComponentName componentNameI = eVar.i();
        final UserHandle userHandle = eVar.o;
        return new Runnable() { // from class: ka.k
            /* JADX WARN: Multi-variable type inference failed */
            @Override // java.lang.Runnable
            public final void run() throws Throwable {
                boolean z11;
                List list2;
                List list3;
                ga.e eVar2;
                char c11;
                boolean z12;
                ga.j jVar;
                Bitmap bitmapY;
                PopupContainerWithArrow popupContainerWithArrow2;
                boolean z13;
                List list4;
                List list5 = list;
                boolean zIsEmpty = list5.isEmpty();
                final Context context2 = context;
                final ga.e eVar3 = eVar;
                Handler handler2 = handler;
                final PopupContainerWithArrow popupContainerWithArrow3 = popupContainerWithArrow;
                if (!zIsEmpty) {
                    ha.g gVarA = ha.g.a();
                    handler2.post(new l0(29, popupContainerWithArrow3, gVarA == null ? Collections.EMPTY_LIST : (List) Arrays.asList(gVarA.getActiveNotifications((String[]) list5.stream().map(new aa.t(20)).toArray(new a0(3)))).stream().map(new Function() { // from class: ka.l
                        @Override // java.util.function.Function
                        public final Object apply(Object obj) {
                            return new ha.c(context2, (StatusBarNotification) obj, eVar3);
                        }
                    }).collect(Collectors.toList())));
                }
                d0 d0Var = t1.c(context2).f80135d;
                List list6 = popupContainerWithArrow3.f21231e0;
                List list7 = arrayList;
                boolean z14 = false;
                if (list6 == null) {
                    boolean z15 = false;
                    int i5 = 4;
                    int i11 = -107;
                    androidx.room.h hVar = new androidx.room.h(context2, userHandle);
                    ComponentName componentName = componentNameI;
                    if (componentName == null) {
                        hVar.f15218a = true;
                    } else {
                        ((LauncherApps.ShortcutQuery) hVar.f15219b).setActivity(componentName);
                    }
                    ArrayList arrayListC = hVar.c(9);
                    String str = list5.isEmpty() ? null : ((mz.h) list5.get(0)).f77342b;
                    if (str != null) {
                        Iterator it = arrayListC.iterator();
                        while (true) {
                            if (it.hasNext()) {
                                if (((ShortcutInfo) it.next()).getId().equals(str)) {
                                    it.remove();
                                    break;
                                }
                            } else {
                                break;
                            }
                        }
                    }
                    Collections.sort(arrayListC, n.f71298a);
                    if (arrayListC.size() > 4) {
                        ArrayList arrayList2 = new ArrayList(4);
                        int size = arrayListC.size();
                        int i12 = 0;
                        int i13 = 0;
                        while (i13 < size) {
                            ShortcutInfo shortcutInfo = (ShortcutInfo) arrayListC.get(i13);
                            int size2 = arrayList2.size();
                            if (size2 < i5) {
                                arrayList2.add(shortcutInfo);
                                if (shortcutInfo.isDynamic()) {
                                    i12++;
                                }
                            } else if (shortcutInfo.isDynamic() && i12 < 2) {
                                i12++;
                                arrayList2.remove(size2 - i12);
                                arrayList2.add(shortcutInfo);
                            }
                            i13++;
                            i5 = 4;
                        }
                        arrayListC = arrayList2;
                    }
                    int i14 = 0;
                    for (List list8 = list7; i14 < arrayListC.size() && i14 < list8.size(); list8 = list8) {
                        final ShortcutInfo shortcutInfo2 = (ShortcutInfo) arrayListC.get(i14);
                        final ga.j jVar2 = new ga.j(context2, shortcutInfo2);
                        d0Var.o(jVar2, shortcutInfo2, z15, d0Var.f567m);
                        jVar2.f57299k = i14;
                        jVar2.f57291c = i11;
                        final DeepShortcutView deepShortcutView = (DeepShortcutView) list8.get(i14);
                        final int i15 = 1;
                        handler2.post(new Runnable() { // from class: ka.m
                            @Override // java.lang.Runnable
                            public final void run() {
                                switch (i15) {
                                    case 0:
                                        deepShortcutView.a(jVar2, shortcutInfo2, popupContainerWithArrow3);
                                        break;
                                    default:
                                        deepShortcutView.a(jVar2, shortcutInfo2, popupContainerWithArrow3);
                                        break;
                                }
                            }
                        });
                        i14++;
                        i11 = i11;
                        z15 = z15;
                    }
                    return;
                }
                int i16 = 0;
                while (i16 < list6.size() && i16 < list7.size()) {
                    final DeepShortcutView deepShortcutView2 = (DeepShortcutView) list7.get(i16);
                    oy.a aVar = (oy.a) list6.get(i16);
                    final ShortcutInfo shortcutInfo3 = (ShortcutInfo) aVar.f81121d.invoke(context2);
                    if (shortcutInfo3 != null) {
                        ga.j jVar3 = new ga.j(context2, shortcutInfo3);
                        d0Var.o(jVar3, shortcutInfo3, z14, d0Var.f567m);
                        list2 = list6;
                        list3 = list7;
                        eVar2 = eVar3;
                        z11 = z14;
                        jVar = jVar3;
                        z12 = true;
                        c11 = 4;
                    } else {
                        int i17 = ((ga.f) eVar3).f57304r.f21152b;
                        z11 = z14;
                        g.p pVar = new g.p(deepShortcutView2, 11);
                        Uri uri = aVar.f81119b;
                        ga.j jVar4 = new ga.j();
                        list2 = list6;
                        UserHandle userHandle2 = aVar.f81122e;
                        jVar4.o = userHandle2;
                        list3 = list7;
                        jVar4.f57290b = 1;
                        CharSequence charSequence = aVar.f81118a;
                        jVar4.f57300l = charSequence;
                        eVar2 = eVar3;
                        jVar4.f57301m = context2.getPackageManager().getUserBadgedLabel(charSequence, userHandle2);
                        jVar4.f57322x = aVar.f81120c;
                        Context context3 = g0.f77088a;
                        int i18 = g0.g().f56216y;
                        Drawable drawable = context2.getDrawable(2131231886);
                        c11 = 4;
                        jVar4.f57304r = (drawable == null || (bitmapY = e0.Y(drawable, i18, i18, 4)) == null) ? BitmapInfo.f21150d : BitmapInfo.a(bitmapY);
                        if (uri != null) {
                            int i19 = g0.g().f56216y;
                            x8.i iVar = new x8.i(context2.getApplicationContext());
                            iVar.f95306c = uri;
                            iVar.d(v30.e.b(i19, i19));
                            iVar.f95314k = Boolean.FALSE;
                            iVar.f95307d = new c00.d(jVar4, i19, pVar);
                            iVar.c();
                            a9.b bVarB = o0.b(uri, i17, -1);
                            z12 = true;
                            if (bVarB != null) {
                                a9.b[] bVarArr = new a9.b[1];
                                bVarArr[z11 ? 1 : 0] = bVarB;
                                iVar.f95309f = ul.b.h0(kotlin.collections.c.b1(bVarArr));
                            }
                            m8.a.a(context2).b(iVar.a());
                        } else {
                            z12 = true;
                        }
                        jVar = jVar4;
                    }
                    jVar.f57299k = i16;
                    jVar.f57291c = -107;
                    if (shortcutInfo3 != null) {
                        final int i21 = 0;
                        final ga.j jVar5 = jVar;
                        handler2.post(new Runnable() { // from class: ka.m
                            @Override // java.lang.Runnable
                            public final void run() {
                                switch (i21) {
                                    case 0:
                                        deepShortcutView2.a(jVar5, shortcutInfo3, popupContainerWithArrow3);
                                        break;
                                    default:
                                        deepShortcutView2.a(jVar5, shortcutInfo3, popupContainerWithArrow3);
                                        break;
                                }
                            }
                        });
                        popupContainerWithArrow2 = popupContainerWithArrow3;
                        z13 = z11;
                        list4 = list3;
                    } else {
                        popupContainerWithArrow2 = popupContainerWithArrow3;
                        z13 = z11;
                        list4 = list3;
                        handler2.post(new c40.e(deepShortcutView2, jVar, eVar2, popupContainerWithArrow2, 4));
                    }
                    i16++;
                    popupContainerWithArrow3 = popupContainerWithArrow2;
                    z14 = z13;
                    list7 = list4;
                    list6 = list2;
                    eVar3 = eVar2;
                }
            }
        };
    }
}
