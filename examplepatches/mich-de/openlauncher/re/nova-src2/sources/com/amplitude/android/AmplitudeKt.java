package com.amplitude.android;

import android.content.Context;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000&\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0000\u001a/\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0017\u0010\u0006\u001a\u0013\u0012\u0004\u0012\u00020\b\u0012\u0004\u0012\u00020\t0\u0007¢\u0006\u0002\b\n¨\u0006\u000b"}, d2 = {"Amplitude", "Lcom/amplitude/android/Amplitude;", "apiKey", b.f42142b, "context", "Landroid/content/Context;", "configs", "Lkotlin/Function1;", "Lcom/amplitude/android/ConfigurationBuilder;", b.f42142b, "Lkotlin/ExtensionFunctionType;", "android_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class AmplitudeKt {
    @NotNull
    public static final Amplitude Amplitude(@NotNull String apiKey, @NotNull Context context, @NotNull Function1<? super ConfigurationBuilder, Unit> configs) {
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(context, "context");
        Intrinsics.g(configs, "configs");
        ConfigurationBuilder configurationBuilder = new ConfigurationBuilder(apiKey, context);
        configs.invoke(configurationBuilder);
        return new Amplitude(configurationBuilder.build());
    }
}
