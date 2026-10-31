package io.branch.search.internal;

import android.content.ComponentName;
import com.facebook.ads.internal.util.common.FbValidationUtils;
import io.branch.search.internal.requesthandler.model.Link;
import java.util.ArrayList;
import java.util.Collection;
import java.util.EnumSet;
import java.util.List;
import java.util.Set;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.IntProgressionIterator;
import kotlin.ranges.IntRange;
import nova.branch.engage.sesame_lite.internal.Pkgs;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.ba, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3081ba extends U9 {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: j, reason: collision with root package name */
    @NotNull
    public static final List<String> f64022j = ul.b.Q("com.android.messages", Pkgs.CONTACTS_DEFAULT, "com.android.settings", "com.google.android.apps.maps", "com.android.chrome", "com.google.android.googlequicksearchbox", "com.google.android.youtube", "com.google.android.calendar", "com.android.vending", "com.netflix.mediaclient", "com.amazon.mShop.android.shopping", FbValidationUtils.FB_PACKAGE, "com.instagram.android", "com.google.android.apps.youtube.music", "com.spotify.music", Pkgs.WHATSAPP);

    /* renamed from: k, reason: collision with root package name */
    @NotNull
    public static final List<String> f64023k = ul.b.Q("com.android.settings:settingsWiFi", "com.android.chrome:new-tab-shortcut", "com.google.android.youtube:search-shortcut", "com.android.vending:VIEW_MY_DOWNLOADS", "com.google.android.googlequicksearchbox:text_shortcut", "com.android.chrome:dynamic-new-incognito-tab-shortcut", "com.instagram.android:activity", "com.google.android.deskclock:Alarm_Create", "com.google.android.youtube:shorts-shortcut", "com.zhiliaoapp.musically:NOTIFICATION", "com.google.android.contacts:shortcut-add-contact", "com.google.android.apps.maps:manifest_home", "com.google.android.gm:manifest_compose_shortcut", "com.google.android.apps.messaging:manifest-shortcut-new_message", "com.google.android.calendar:launcher_shortcuts_shortcut_new_event", "com.google.android.apps.docs:launcher_shortcut_search", "com.google.android.apps.nbu.files:manifest-shortcut-downloads", "com.google.android.GoogleCamera:video", "com.android.settings:settingsBatteryPower", "com.google.android.googlequicksearchbox:voice_shortcut", "com.google.android.apps.maps:manifest_work", "com.android.settings:settingsBluetooth", "com.android.settings:settingsDataUsage", "com.google.android.youtube:subscriptions-shortcut", "com.google.android.calendar:launcher_shortcuts_shortcut_new_reminder", "com.android.settings:settingsAirplaneMode", "com.google.android.youtube:explore-shortcut", "com.google.android.deskclock:Timer_Create");

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final F4 f64024e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final C3269mc f64025f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f64026g;

    /* renamed from: h, reason: collision with root package name */
    @NotNull
    public final Set<u40.a> f64027h;

    /* renamed from: i, reason: collision with root package name */
    @NotNull
    public final Set<u40.a> f64028i;

    /* renamed from: io.branch.search.internal.ba$a */
    public static final class a {
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3081ba(@NotNull F4 contextDelegate, @NotNull C3269mc ssml, boolean z11, @NotNull Set zeroStateAppDataTypes, @NotNull Set zeroStateLinksDataTypes, @NotNull I analyticalBufferRepository, @NotNull C3356rf userHandleRepository) {
        super("OrganicsZeroStateRepository", contextDelegate, analyticalBufferRepository, userHandleRepository, z11);
        Intrinsics.g(contextDelegate, "contextDelegate");
        Intrinsics.g(ssml, "ssml");
        Intrinsics.g(zeroStateAppDataTypes, "zeroStateAppDataTypes");
        Intrinsics.g(zeroStateLinksDataTypes, "zeroStateLinksDataTypes");
        Intrinsics.g(analyticalBufferRepository, "analyticalBufferRepository");
        Intrinsics.g(userHandleRepository, "userHandleRepository");
        this.f64024e = contextDelegate;
        this.f64025f = ssml;
        this.f64026g = z11;
        this.f64027h = zeroStateAppDataTypes;
        this.f64028i = zeroStateLinksDataTypes;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(Set set, int i5, long j11, int i11, int i12, int i13, boolean z11, List list, Continuation continuation) {
        C3098ca c3098ca;
        boolean z12;
        C3081ba c3081ba;
        Set set2;
        Je je2;
        if (continuation instanceof C3098ca) {
            c3098ca = (C3098ca) continuation;
            int i14 = c3098ca.f64107g;
            if ((i14 & Integer.MIN_VALUE) != 0) {
                c3098ca.f64107g = i14 - Integer.MIN_VALUE;
            } else {
                c3098ca = new C3098ca(this, continuation);
            }
        }
        Object objZeroState = c3098ca.f64105e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i15 = c3098ca.f64107g;
        if (i15 == 0) {
            ResultKt.b(objZeroState);
            C3309p1 c3309p1 = C3309p1.f65465a;
            EnumC3131e9 tag = EnumC3131e9.InternalDebug;
            c3309p1.getClass();
            Intrinsics.g(tag, "tag");
            Je je3 = new Je(tag, c3309p1);
            EnumSet<u40.a> ssmlTypes = EnumSet.copyOf((Collection) set);
            C3269mc c3269mc = this.f64025f;
            Intrinsics.f(ssmlTypes, "ssmlTypes");
            long[] jArrA = a(j11, ssmlTypes);
            IntRange intRangeM0 = kotlin.ranges.a.m0(0, i5);
            ArrayList arrayList = new ArrayList(b70.c.u0(intRangeM0, 10));
            IntProgressionIterator it = intRangeM0.iterator();
            while (it.f71911c) {
                it.nextInt();
                arrayList.add(u40.u.f90637c);
            }
            Object[] array = list.toArray(new String[0]);
            Intrinsics.e(array, "null cannot be cast to non-null type kotlin.Array<T of kotlin.collections.ArraysKt__ArraysJVMKt.toTypedArray>");
            c3098ca.f64101a = this;
            c3098ca.f64102b = set;
            c3098ca.f64103c = je3;
            c3098ca.f64104d = z11;
            c3098ca.f64107g = 1;
            objZeroState = ((u40.h) c3269mc.f65159f.getValue()).zeroState(null, ssmlTypes, jArrA, i12, i13, i11, (String[]) array, arrayList, c3269mc.f65155b);
            if (objZeroState == coroutineSingletons) {
                return coroutineSingletons;
            }
            z12 = z11;
            c3081ba = this;
            set2 = set;
            je2 = je3;
        } else {
            if (i15 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            z12 = c3098ca.f64104d;
            je2 = c3098ca.f64103c;
            set2 = c3098ca.f64102b;
            c3081ba = c3098ca.f64101a;
            ResultKt.b(objZeroState);
        }
        u40.r[] rVarArr = (u40.r[]) objZeroState;
        C3309p1.a(EnumC3131e9.SesameLite, (Throwable) null, new C3132ea(set2, rVarArr));
        ArrayList arrayList2 = new ArrayList(rVarArr.length);
        int length = rVarArr.length;
        int i16 = 0;
        while (i16 < length) {
            u40.r rVar = rVarArr[i16];
            boolean z13 = c3081ba.f64026g;
            ComponentName componentName = c3081ba.f63453d;
            F4 contextDelegate = c3081ba.f64024e;
            Intrinsics.g(rVar, "<this>");
            u40.s sVar = rVar.f90616k;
            Intrinsics.g(contextDelegate, "contextDelegate");
            String str = sVar.f90620b;
            u40.q qVar = sVar.f90627i;
            String str2 = rVar.f90609d;
            EnumC3449x6 enumC3449x6A = C3068ae.a(rVar.f90607b);
            String string = qVar.f90604a.toString();
            String str3 = rVar.f90609d;
            String str4 = qVar instanceof u40.m ? ((u40.m) qVar).f90599d : null;
            String strA = C3068ae.a(sVar);
            String strA2 = C3068ae.a(sVar);
            String str5 = (strA2 == null || strA2.equals("dynamic")) ? null : rVar.f90608c;
            u40.r[] rVarArr2 = rVarArr;
            Long lValueOf = Long.valueOf(sVar.f90621c);
            List<Link> listA = C3068ae.a(sVar, contextDelegate);
            C7 c7A = C3068ae.a(rVar.f90616k, rVar, false, true, z13, componentName);
            C7 c7A2 = C3068ae.a(rVar.f90616k, rVar, true, true, z13, componentName);
            u40.s[] sVarArr = rVar.f90617l;
            ArrayList arrayList3 = new ArrayList(sVarArr.length);
            int length2 = sVarArr.length;
            int i17 = 0;
            while (i17 < length2) {
                arrayList3.add(C3068ae.a(sVarArr[i17], rVar, z13, componentName, contextDelegate));
                i17++;
                c3081ba = c3081ba;
            }
            C3081ba c3081ba2 = c3081ba;
            arrayList2.add(new eg(null, str, null, str2, enumC3449x6A, null, string, str3, null, str4, strA, str5, lValueOf, listA, null, null, c7A, c7A2, arrayList3, null, z12 ? EnumC3396u4.SuggestedLinks : EnumC3396u4.SuggestedApps, null, b70.h.f17594a));
            i16++;
            c3081ba = c3081ba2;
            rVarArr = rVarArr2;
        }
        String message = "Finished sesame-lite-zero-state " + b70.g.X0(set2);
        je2.getClass();
        Intrinsics.g(message, "message");
        je2.a(message);
        je2.f62751b = System.currentTimeMillis();
        return arrayList2;
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x001a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(String str, String str2, long j11, String str3, Set set, Long l9, Long l11, Long l12, Boolean bool, List list, Continuation continuation) {
        C3149fa c3149fa;
        String str4;
        String str5;
        String str6;
        long jLongValue;
        C3081ba c3081ba = this;
        long j12 = j11;
        if (continuation instanceof C3149fa) {
            c3149fa = (C3149fa) continuation;
            int i5 = c3149fa.f64487h;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c3149fa.f64487h = i5 - Integer.MIN_VALUE;
            } else {
                c3149fa = new C3149fa(c3081ba, continuation);
            }
        }
        C3149fa c3149fa2 = c3149fa;
        Object obj = c3149fa2.f64485f;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c3149fa2.f64487h;
        if (i11 == 0) {
            ResultKt.b(obj);
            try {
                int i12 = Result.f71687b;
                int i13 = (int) j12;
                if (l9 != null) {
                    try {
                        jLongValue = l9.longValue();
                    } catch (Throwable th2) {
                        th = th2;
                        str4 = str;
                        str5 = str2;
                        str6 = str3;
                        int i14 = Result.f71687b;
                        return c3081ba.a(str4, str5, j12, str6, ResultKt.a(th));
                    }
                } else {
                    jLongValue = -1;
                }
                int iLongValue = l11 != null ? (int) l11.longValue() : -1;
                int iLongValue2 = l12 != null ? (int) l12.longValue() : -1;
                boolean zBooleanValue = bool != null ? bool.booleanValue() : false;
                List list2 = list == null ? EmptyList.f71733a : list;
                c3149fa2.f64480a = c3081ba;
                str4 = str;
                try {
                    c3149fa2.f64481b = str4;
                    c3149fa2.f64482c = str2;
                    c3149fa2.f64483d = str3;
                    c3149fa2.f64484e = j12;
                    c3149fa2.f64487h = 1;
                    Object objA = c3081ba.a(set, i13, jLongValue, -1, iLongValue, iLongValue2, zBooleanValue, list2, c3149fa2);
                    return objA == coroutineSingletons ? coroutineSingletons : objA;
                } catch (Throwable th3) {
                    th = th3;
                    c3081ba = this;
                    str5 = str2;
                    str6 = str3;
                    int i142 = Result.f71687b;
                    return c3081ba.a(str4, str5, j12, str6, ResultKt.a(th));
                }
            } catch (Throwable th4) {
                th = th4;
                str4 = str;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            long j13 = c3149fa2.f64484e;
            str6 = c3149fa2.f64483d;
            str5 = c3149fa2.f64482c;
            String str7 = c3149fa2.f64481b;
            C3081ba c3081ba2 = c3149fa2.f64480a;
            try {
                ResultKt.b(obj);
                return obj;
            } catch (Throwable th5) {
                th = th5;
                j12 = j13;
                str4 = str7;
                c3081ba = c3081ba2;
            }
        }
        int i1422 = Result.f71687b;
        return c3081ba.a(str4, str5, j12, str6, ResultKt.a(th));
    }
}
