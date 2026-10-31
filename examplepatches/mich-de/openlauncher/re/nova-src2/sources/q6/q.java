package q6;

import android.adservices.measurement.MeasurementManager;
import android.content.Context;
import android.os.Bundle;
import android.os.Parcelable;
import androidx.navigation.NavBackStackEntryState;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import kotlin.collections.ArrayDeque;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.ArrayIteratorKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import p6.l0;
import ps.i0;

/* loaded from: classes2.dex */
public final class q extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f83713j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ Context f83714k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ q(Context context, int i5) {
        super(1);
        this.f83713j = i5;
        this.f83714k = context;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f83713j) {
            case 0:
                Bundle bundle = (Bundle) obj;
                l0 l0VarG = i0.g(this.f83714k);
                LinkedHashMap linkedHashMap = l0VarG.n;
                if (bundle != null) {
                    bundle.setClassLoader(l0VarG.f82252a.getClassLoader());
                    l0VarG.f82255d = bundle.getBundle("android-support-nav:controller:navigatorState");
                    l0VarG.f82256e = bundle.getParcelableArray("android-support-nav:controller:backStack");
                    linkedHashMap.clear();
                    int[] intArray = bundle.getIntArray("android-support-nav:controller:backStackDestIds");
                    ArrayList<String> stringArrayList = bundle.getStringArrayList("android-support-nav:controller:backStackIds");
                    if (intArray != null && stringArrayList != null) {
                        int length = intArray.length;
                        int i5 = 0;
                        int i11 = 0;
                        while (i5 < length) {
                            l0VarG.f82264m.put(Integer.valueOf(intArray[i5]), stringArrayList.get(i11));
                            i5++;
                            i11++;
                        }
                    }
                    ArrayList<String> stringArrayList2 = bundle.getStringArrayList("android-support-nav:controller:backStackStates");
                    if (stringArrayList2 != null) {
                        for (String id2 : stringArrayList2) {
                            Parcelable[] parcelableArray = bundle.getParcelableArray("android-support-nav:controller:backStackStates:" + id2);
                            if (parcelableArray != null) {
                                Intrinsics.f(id2, "id");
                                ArrayDeque arrayDeque = new ArrayDeque(parcelableArray.length);
                                b70.a aVarA = ArrayIteratorKt.a(parcelableArray);
                                while (aVarA.hasNext()) {
                                    Parcelable parcelable = (Parcelable) aVarA.next();
                                    Intrinsics.e(parcelable, "null cannot be cast to non-null type androidx.navigation.NavBackStackEntryState");
                                    arrayDeque.addLast((NavBackStackEntryState) parcelable);
                                }
                                linkedHashMap.put(id2, arrayDeque);
                            }
                        }
                    }
                    l0VarG.f82257f = bundle.getBoolean("android-support-nav:controller:deepLinkHandled");
                }
                return l0VarG;
            default:
                Context it = (Context) obj;
                Intrinsics.g(it, "it");
                Context context = this.f83714k;
                Intrinsics.g(context, "context");
                MeasurementManager measurementManager = MeasurementManager.get(context);
                Intrinsics.f(measurementManager, "get(context)");
                return new v6.b(measurementManager);
        }
    }
}
