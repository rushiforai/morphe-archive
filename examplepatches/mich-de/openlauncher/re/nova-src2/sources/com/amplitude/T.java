package com.amplitude;

import com.amplitude.android.sessionreplay.config.ConfigManager;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class T extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ ConfigManager f20385a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public T(ConfigManager configManager) {
        super(0);
        this.f20385a = configManager;
    }

    @Override // kotlin.jvm.functions.Function0
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public final String invoke() {
        return b.c0.l("Missing remote config, using ", this.f20385a.configSource, " config");
    }
}
