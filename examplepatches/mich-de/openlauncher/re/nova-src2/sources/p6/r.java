package p6;

import android.os.Bundle;
import java.util.ArrayList;
import java.util.List;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class r extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ Ref.BooleanRef f82242j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ ArrayList f82243k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ Ref.IntRef f82244l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ t f82245m;
    public final /* synthetic */ Bundle n;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public r(Ref.BooleanRef booleanRef, ArrayList arrayList, Ref.IntRef intRef, t tVar, Bundle bundle) {
        super(1);
        this.f82242j = booleanRef;
        this.f82243k = arrayList;
        this.f82244l = intRef;
        this.f82245m = tVar;
        this.n = bundle;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        List listSubList;
        n entry = (n) obj;
        Intrinsics.g(entry, "entry");
        this.f82242j.f71859a = true;
        ArrayList arrayList = this.f82243k;
        int iIndexOf = arrayList.indexOf(entry);
        if (iIndexOf != -1) {
            Ref.IntRef intRef = this.f82244l;
            int i5 = iIndexOf + 1;
            listSubList = arrayList.subList(intRef.f71861a, i5);
            intRef.f71861a = i5;
        } else {
            listSubList = EmptyList.f71733a;
        }
        this.f82245m.a(entry.f82192b, this.n, entry, listSubList);
        return Unit.f71706a;
    }
}
