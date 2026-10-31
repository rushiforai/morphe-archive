package com.amplitude.android;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Set;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u001e\n\u0000\n\u0002\u0010\"\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0000\u001a%\u0010\u0000\u001a\b\u0012\u0004\u0012\u00020\u00020\u00012\u0017\u0010\u0003\u001a\u0013\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00060\u0004¢\u0006\u0002\b\u0007¨\u0006\b"}, d2 = {"autocaptureOptions", b.f42142b, "Lcom/amplitude/android/AutocaptureOption;", "init", "Lkotlin/Function1;", "Lcom/amplitude/android/AutocaptureOptionsBuilder;", b.f42142b, "Lkotlin/ExtensionFunctionType;", "android_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class AutocaptureOptionsKt {
    @NotNull
    public static final Set<AutocaptureOption> autocaptureOptions(@NotNull Function1<? super AutocaptureOptionsBuilder, Unit> init) {
        Intrinsics.g(init, "init");
        AutocaptureOptionsBuilder autocaptureOptionsBuilder = new AutocaptureOptionsBuilder();
        init.invoke(autocaptureOptionsBuilder);
        return autocaptureOptionsBuilder.build();
    }
}
