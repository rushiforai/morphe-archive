package io.branch.search.internal;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;
import org.json.JSONObject;

/* renamed from: io.branch.search.internal.i7, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3197i7 extends Lambda implements Function0<String> {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ JSONObject f64740a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ x80.h0 f64741b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f64742c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3197i7(JSONObject jSONObject, x80.h0 h0Var, int i5) {
        super(0);
        this.f64740a = jSONObject;
        this.f64741b = h0Var;
        this.f64742c = i5;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        return this.f64740a + ", url: " + this.f64741b.f95509a + ", code: " + this.f64742c;
    }
}
