package io.branch.search.internal;

import android.content.SharedPreferences;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class L5 extends Lambda implements Function0<Float> {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ K5 f62839a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public L5(K5 k52) {
        super(0);
        this.f62839a = k52;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        SharedPreferences sharedPreferences = this.f62839a.f62782b;
        Float fValueOf = sharedPreferences.contains("detailed_analytics_device_rank") ? Float.valueOf(sharedPreferences.getFloat("detailed_analytics_device_rank", 0.0f)) : null;
        return Float.valueOf(fValueOf != null ? fValueOf.floatValue() : K5.a(this.f62839a));
    }
}
