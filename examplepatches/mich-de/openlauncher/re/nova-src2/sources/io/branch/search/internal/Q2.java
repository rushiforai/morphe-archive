package io.branch.search.internal;

import io.branch.search.internal.C4;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;
import org.json.JSONException;

/* loaded from: classes4.dex */
public final class Q2 extends Lambda implements Function0<Unit> {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ C3240l0 f63207a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ C3202ic f63208b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public Q2(C3240l0 c3240l0, C3202ic c3202ic) {
        super(0);
        this.f63207a = c3240l0;
        this.f63208b = c3202ic;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() throws JSONException {
        String[] strArrA = this.f63207a.a();
        C3202ic c3202ic = this.f63208b;
        for (String str : strArrA) {
            EmptyList emptyList = EmptyList.f71733a;
            c3202ic.a(str, new C4.i.d(emptyList, emptyList, emptyList));
            c3202ic.a(str);
        }
        return Unit.f71706a;
    }
}
