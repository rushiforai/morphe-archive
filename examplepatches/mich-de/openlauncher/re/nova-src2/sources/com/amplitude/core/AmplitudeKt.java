package com.amplitude.core;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000 \n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0000\u001a'\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0017\u0010\u0004\u001a\u0013\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u00070\u0005¢\u0006\u0002\b\b¨\u0006\t"}, d2 = {"Amplitude", "Lcom/amplitude/core/Amplitude;", "apiKey", b.f42142b, "configs", "Lkotlin/Function1;", "Lcom/amplitude/core/ConfigurationBuilder;", b.f42142b, "Lkotlin/ExtensionFunctionType;", "core"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class AmplitudeKt {
    @NotNull
    public static final Amplitude Amplitude(@NotNull String apiKey, @NotNull Function1<? super ConfigurationBuilder, Unit> configs) {
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(configs, "configs");
        ConfigurationBuilder configurationBuilder = new ConfigurationBuilder(apiKey);
        configs.invoke(configurationBuilder);
        return new Amplitude(configurationBuilder.build());
    }
}
