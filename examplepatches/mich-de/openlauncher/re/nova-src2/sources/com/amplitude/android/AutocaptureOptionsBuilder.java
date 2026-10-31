package com.amplitude.android;

import b70.g;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.LinkedHashSet;
import java.util.Set;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0010#\n\u0002\b\u0005\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\"\n\u0002\b\u0002\u0018\u00002\u00020\u0001B\u0005¢\u0006\u0002\u0010\u0002J\u0006\u0010\u0013\u001a\u00020\u0014J\f\u0010\u0015\u001a\b\u0012\u0004\u0012\u00020\u00040\u0016J\r\u0010\u0017\u001a\u00020\u0014*\u00020\u0004H\u0086\u0002R\u0011\u0010\u0003\u001a\u00020\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\u0006R\u0011\u0010\u0007\u001a\u00020\u0004¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\u0006R\u0011\u0010\t\u001a\u00020\u0004¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u0006R\u0011\u0010\u000b\u001a\u00020\u0004¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\u0006R\u0014\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00040\u000eX\u0082\u0004¢\u0006\u0002\n\u0000R\u0011\u0010\u000f\u001a\u00020\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0006R\u0011\u0010\u0011\u001a\u00020\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0006¨\u0006\u0018"}, d2 = {"Lcom/amplitude/android/AutocaptureOptionsBuilder;", b.f42142b, "()V", "appLifecycles", "Lcom/amplitude/android/AutocaptureOption;", "getAppLifecycles", "()Lcom/amplitude/android/AutocaptureOption;", "deepLinks", "getDeepLinks", "elementInteractions", "getElementInteractions", "frustrationInteractions", "getFrustrationInteractions", "options", b.f42142b, "screenViews", "getScreenViews", "sessions", "getSessions", "addAll", b.f42142b, "build", b.f42142b, "unaryPlus", "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class AutocaptureOptionsBuilder {

    @NotNull
    private final Set<AutocaptureOption> options = new LinkedHashSet();

    @NotNull
    private final AutocaptureOption sessions = AutocaptureOption.SESSIONS;

    @NotNull
    private final AutocaptureOption appLifecycles = AutocaptureOption.APP_LIFECYCLES;

    @NotNull
    private final AutocaptureOption deepLinks = AutocaptureOption.DEEP_LINKS;

    @NotNull
    private final AutocaptureOption screenViews = AutocaptureOption.SCREEN_VIEWS;

    @NotNull
    private final AutocaptureOption elementInteractions = AutocaptureOption.ELEMENT_INTERACTIONS;

    @NotNull
    private final AutocaptureOption frustrationInteractions = AutocaptureOption.FRUSTRATION_INTERACTIONS;

    public final void addAll() {
        this.options.addAll(AutocaptureOption.INSTANCE.getALL());
    }

    @NotNull
    public final Set<AutocaptureOption> build() {
        return g.N1(this.options);
    }

    @NotNull
    public final AutocaptureOption getAppLifecycles() {
        return this.appLifecycles;
    }

    @NotNull
    public final AutocaptureOption getDeepLinks() {
        return this.deepLinks;
    }

    @NotNull
    public final AutocaptureOption getElementInteractions() {
        return this.elementInteractions;
    }

    @NotNull
    public final AutocaptureOption getFrustrationInteractions() {
        return this.frustrationInteractions;
    }

    @NotNull
    public final AutocaptureOption getScreenViews() {
        return this.screenViews;
    }

    @NotNull
    public final AutocaptureOption getSessions() {
        return this.sessions;
    }

    public final void unaryPlus(@NotNull AutocaptureOption autocaptureOption) {
        Intrinsics.g(autocaptureOption, "<this>");
        this.options.add(autocaptureOption);
    }
}
