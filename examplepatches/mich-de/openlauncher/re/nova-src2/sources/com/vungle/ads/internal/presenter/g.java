package com.vungle.ads.internal.presenter;

import com.vungle.ads.MraidTemplateError;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class g extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ r f47376a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ MraidTemplateError f47377b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ boolean f47378c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ String f47379d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g(r rVar, MraidTemplateError mraidTemplateError, boolean z11, String str) {
        super(0);
        this.f47376a = rVar;
        this.f47377b = mraidTemplateError;
        this.f47378c = z11;
        this.f47379d = str;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        this.f47376a.a(this.f47377b, this.f47378c, this.f47379d);
        return Unit.f71706a;
    }
}
