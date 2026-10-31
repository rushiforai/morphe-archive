package t80;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.text.format.DateFormat;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.TimeZone;
import kotlin.ResultKt;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.JvmClassMappingKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.KClass;
import nova.branch.engage.sesame_lite.api_integration.AskPermissionActivity;
import org.jetbrains.annotations.NotNull;
import ou.i1;
import pu.q;
import t70.m0;
import t70.y0;

/* loaded from: classes5.dex */
public final class c implements s80.a, s80.d {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    public final Context f88897a;

    /* renamed from: b, reason: collision with root package name */
    public final Function1 f88898b;

    /* renamed from: c, reason: collision with root package name */
    public final KClass f88899c;

    /* renamed from: d, reason: collision with root package name */
    public final g f88900d;

    public c(Context context, Function1 function1, KClass kClass) {
        Intrinsics.g(context, "context");
        this.f88897a = context;
        this.f88898b = function1;
        this.f88899c = kClass;
        this.f88900d = new g(context);
    }

    @Override // s80.c
    public final s80.e a() {
        return s80.e.f86765a;
    }

    @Override // s80.a
    public final Intent b(Activity activity) {
        KClass kClass = this.f88899c;
        if (kClass != null) {
            return new Intent(activity, (Class<?>) JvmClassMappingKt.b(kClass));
        }
        AskPermissionActivity.Companion.getClass();
        return s80.b.a(activity, new String[]{"android.permission.READ_CALENDAR"});
    }

    @Override // s80.a
    public final String c(Context context) {
        Intrinsics.g(context, "context");
        String string = context.getString(2132019548);
        Intrinsics.f(string, "getString(...)");
        return string;
    }

    @Override // s80.c
    public final String d() {
        return "com.google.android.calendar";
    }

    @Override // s80.d
    public final Object e(ContinuationImpl continuationImpl) {
        a80.e eVar = y0.f88884a;
        return m0.y(a80.d.f488c, new q(this, (Continuation) null, 27), continuationImpl);
    }

    @Override // s80.a
    public final Object f(int i5, Intent intent, Continuation continuation) {
        return Boolean.valueOf(i5 == -1);
    }

    /* JADX WARN: Removed duplicated region for block: B:39:0x00f9  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Serializable g(int i5, ContinuationImpl continuationImpl) {
        b bVar;
        long jCurrentTimeMillis;
        c cVar;
        long j11;
        c cVar2;
        SimpleDateFormat simpleDateFormat;
        if (continuationImpl instanceof b) {
            bVar = (b) continuationImpl;
            int i11 = bVar.f88896z;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                bVar.f88896z = i11 - Integer.MIN_VALUE;
            } else {
                bVar = new b(this, continuationImpl);
            }
        }
        Object objY = bVar.f88894x;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i12 = bVar.f88896z;
        if (i12 == 0) {
            ResultKt.b(objY);
            if (o4.a.a(this.f88897a, "android.permission.READ_CALENDAR") != 0) {
                return EmptyList.f71733a;
            }
            jCurrentTimeMillis = System.currentTimeMillis();
            long j12 = 5184000000L + jCurrentTimeMillis;
            bVar.f88890t = this;
            bVar.f88891u = i5;
            bVar.f88892v = jCurrentTimeMillis;
            bVar.f88893w = j12;
            bVar.f88896z = 1;
            g gVar = this.f88900d;
            gVar.getClass();
            a80.e eVar = y0.f88884a;
            objY = m0.y(a80.d.f488c, new i1(gVar, null), bVar);
            if (objY != coroutineSingletons) {
                cVar = this;
                j11 = j12;
            }
            return coroutineSingletons;
        }
        if (i12 != 1) {
            if (i12 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            i5 = bVar.f88891u;
            cVar2 = bVar.f88890t;
            ResultKt.b(objY);
            List<i> listE1 = b70.g.E1((List) objY, i5);
            ArrayList arrayList = new ArrayList(b70.c.u0(listE1, 10));
            for (i iVar : listE1) {
                if (iVar.f88920c) {
                    simpleDateFormat = new SimpleDateFormat("MMM d", Locale.getDefault());
                    simpleDateFormat.setTimeZone(TimeZone.getTimeZone("UTC"));
                } else {
                    simpleDateFormat = DateFormat.is24HourFormat(cVar2.f88897a) ? new SimpleDateFormat("MMM d HH:mm", Locale.getDefault()) : new SimpleDateFormat("MMM d h:mm a", Locale.getDefault());
                }
                String str = simpleDateFormat.format(new Date(iVar.f88919b));
                String str2 = iVar.f88918a;
                Intrinsics.d(str);
                arrayList.add(new h(str2, iVar.f88921d, str, iVar.f88922e, iVar.f88919b));
            }
            return arrayList;
        }
        long j13 = bVar.f88893w;
        jCurrentTimeMillis = bVar.f88892v;
        i5 = bVar.f88891u;
        cVar = bVar.f88890t;
        ResultKt.b(objY);
        j11 = j13;
        long j14 = jCurrentTimeMillis;
        ArrayList arrayList2 = new ArrayList();
        for (Object obj : (Iterable) objY) {
            if (((d) obj).f88902b) {
                arrayList2.add(obj);
            }
        }
        ArrayList arrayList3 = new ArrayList(b70.c.u0(arrayList2, 10));
        int size = arrayList2.size();
        int i13 = 0;
        while (i13 < size) {
            Object obj2 = arrayList2.get(i13);
            i13++;
            arrayList3.add(((d) obj2).f88901a);
        }
        Set setN1 = b70.g.N1(arrayList3);
        g gVar2 = cVar.f88900d;
        bVar.f88890t = cVar;
        bVar.f88891u = i5;
        bVar.f88896z = 2;
        gVar2.getClass();
        a80.e eVar2 = y0.f88884a;
        objY = m0.y(a80.d.f488c, new f(setN1, gVar2, j14, j11, null), bVar);
        if (objY != coroutineSingletons) {
            cVar2 = cVar;
            List<i> listE12 = b70.g.E1((List) objY, i5);
            ArrayList arrayList4 = new ArrayList(b70.c.u0(listE12, 10));
            while (r14.hasNext()) {
            }
            return arrayList4;
        }
        return coroutineSingletons;
    }
}
