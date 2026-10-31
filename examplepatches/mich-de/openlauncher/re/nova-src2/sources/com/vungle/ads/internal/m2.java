package com.vungle.ads.internal;

import android.content.Context;
import com.vungle.ads.internal.persistence.FilePreferences;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class m2 extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Context f46920a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public m2(Context context) {
        super(0);
        this.f46920a = context;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        return ServiceLocator.f46726d.a(this.f46920a).getService(FilePreferences.class);
    }
}
