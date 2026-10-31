package io.branch.search.internal;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: io.branch.search.internal.ke, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3237ke extends Lambda implements Function1<String, Unit> {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ C3271me<Object> f64933a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3237ke(C3271me<Object> c3271me) {
        super(1);
        this.f64933a = c3271me;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        String line = (String) obj;
        Intrinsics.g(line, "line");
        if (line.length() > 0) {
            try {
                this.f64933a.a(new JSONObject(line));
            } catch (JSONException e3) {
                C3309p1.a(EnumC3131e9.Others, "Failure converting line to json for TrackingAnalytics ".concat(this.f64933a.getClass().getSimpleName()), e3);
            }
        }
        return Unit.f71706a;
    }
}
