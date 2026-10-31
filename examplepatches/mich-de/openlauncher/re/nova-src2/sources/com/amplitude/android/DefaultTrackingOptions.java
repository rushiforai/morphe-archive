package com.amplitude.android;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import kotlin.Deprecated;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.JvmField;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Deprecated
@Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\n\n\u0002\u0010#\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010!\n\u0002\b\t\b\u0017\u0018\u0000 \"2\u00020\u0001:\u0001\"B \b\u0010\u0012\u0017\u0010\u0002\u001a\u0013\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\u0002\b\u0005¢\u0006\u0002\u0010\u0006B/\b\u0007\u0012\b\b\u0002\u0010\u0007\u001a\u00020\b\u0012\b\b\u0002\u0010\t\u001a\u00020\b\u0012\b\b\u0002\u0010\n\u001a\u00020\b\u0012\b\b\u0002\u0010\u000b\u001a\u00020\b¢\u0006\u0002\u0010\fJ&\u0010\u001f\u001a\u00020\u00042\u0017\u0010\u0002\u001a\u0013\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\u0002\b\u0005H\u0000¢\u0006\u0002\b J\b\u0010!\u001a\u00020\u0004H\u0002R$\u0010\t\u001a\u00020\b2\u0006\u0010\r\u001a\u00020\b@FX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u000e\u0010\u000f\"\u0004\b\u0010\u0010\u0011R\u001a\u0010\u0012\u001a\b\u0012\u0004\u0012\u00020\u00140\u00138@X\u0080\u0004¢\u0006\u0006\u001a\u0004\b\u0015\u0010\u0016R$\u0010\n\u001a\u00020\b2\u0006\u0010\r\u001a\u00020\b@FX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0017\u0010\u000f\"\u0004\b\u0018\u0010\u0011R%\u0010\u0019\u001a\u0019\u0012\u0015\u0012\u0013\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\u0002\b\u00050\u001aX\u0082\u0004¢\u0006\u0002\n\u0000R$\u0010\u000b\u001a\u00020\b2\u0006\u0010\r\u001a\u00020\b@FX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u001b\u0010\u000f\"\u0004\b\u001c\u0010\u0011R$\u0010\u0007\u001a\u00020\b2\u0006\u0010\r\u001a\u00020\b@FX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u001d\u0010\u000f\"\u0004\b\u001e\u0010\u0011¨\u0006#"}, d2 = {"Lcom/amplitude/android/DefaultTrackingOptions;", b.f42142b, "listener", "Lkotlin/Function1;", b.f42142b, "Lkotlin/ExtensionFunctionType;", "(Lkotlin/jvm/functions/Function1;)V", "sessions", b.f42142b, "appLifecycles", "deepLinks", "screenViews", "(ZZZZ)V", "value", "getAppLifecycles", "()Z", "setAppLifecycles", "(Z)V", "autocaptureOptions", b.f42142b, "Lcom/amplitude/android/AutocaptureOption;", "getAutocaptureOptions$android_release", "()Ljava/util/Set;", "getDeepLinks", "setDeepLinks", "propertyChangeListeners", b.f42142b, "getScreenViews", "setScreenViews", "getSessions", "setSessions", "addPropertyChangeListener", "addPropertyChangeListener$android_release", "notifyChanged", k.O, "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public class DefaultTrackingOptions {
    private boolean appLifecycles;
    private boolean deepLinks;

    @NotNull
    private final List<Function1<DefaultTrackingOptions, Unit>> propertyChangeListeners;
    private boolean screenViews;
    private boolean sessions;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);

    @JvmField
    @NotNull
    public static final DefaultTrackingOptions ALL = new DefaultTrackingOptions(true, true, true, true);

    @JvmField
    @NotNull
    public static final DefaultTrackingOptions NONE = new DefaultTrackingOptions(false, false, false, false);

    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002R\u0016\u0010\u0003\u001a\u00020\u00048\u0006X\u0087\u0004¢\u0006\b\n\u0000\u0012\u0004\b\u0005\u0010\u0002R\u0016\u0010\u0006\u001a\u00020\u00048\u0006X\u0087\u0004¢\u0006\b\n\u0000\u0012\u0004\b\u0007\u0010\u0002¨\u0006\b"}, d2 = {"Lcom/amplitude/android/DefaultTrackingOptions$Companion;", b.f42142b, "()V", "ALL", "Lcom/amplitude/android/DefaultTrackingOptions;", "getALL$annotations", "NONE", "getNONE$annotations", "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        @Deprecated
        public static /* synthetic */ void getALL$annotations() {
        }

        @Deprecated
        public static /* synthetic */ void getNONE$annotations() {
        }

        private Companion() {
        }
    }

    @JvmOverloads
    public DefaultTrackingOptions() {
        this(false, false, false, false, 15, null);
    }

    private final void notifyChanged() {
        Iterator<Function1<DefaultTrackingOptions, Unit>> it = this.propertyChangeListeners.iterator();
        while (it.hasNext()) {
            it.next().invoke(this);
        }
    }

    public final void addPropertyChangeListener$android_release(@NotNull Function1<? super DefaultTrackingOptions, Unit> listener) {
        Intrinsics.g(listener, "listener");
        this.propertyChangeListeners.add(listener);
    }

    public final boolean getAppLifecycles() {
        return this.appLifecycles;
    }

    @NotNull
    public final Set<AutocaptureOption> getAutocaptureOptions$android_release() {
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        if (this.sessions) {
            linkedHashSet.add(AutocaptureOption.SESSIONS);
        }
        if (this.appLifecycles) {
            linkedHashSet.add(AutocaptureOption.APP_LIFECYCLES);
        }
        if (this.deepLinks) {
            linkedHashSet.add(AutocaptureOption.DEEP_LINKS);
        }
        if (this.screenViews) {
            linkedHashSet.add(AutocaptureOption.SCREEN_VIEWS);
        }
        return linkedHashSet;
    }

    public final boolean getDeepLinks() {
        return this.deepLinks;
    }

    public final boolean getScreenViews() {
        return this.screenViews;
    }

    public final boolean getSessions() {
        return this.sessions;
    }

    public final void setAppLifecycles(boolean z11) {
        this.appLifecycles = z11;
        notifyChanged();
    }

    public final void setDeepLinks(boolean z11) {
        this.deepLinks = z11;
        notifyChanged();
    }

    public final void setScreenViews(boolean z11) {
        this.screenViews = z11;
        notifyChanged();
    }

    public final void setSessions(boolean z11) {
        this.sessions = z11;
        notifyChanged();
    }

    @JvmOverloads
    public DefaultTrackingOptions(boolean z11) {
        this(z11, false, false, false, 14, null);
    }

    @JvmOverloads
    public DefaultTrackingOptions(boolean z11, boolean z12) {
        this(z11, z12, false, false, 12, null);
    }

    @JvmOverloads
    public DefaultTrackingOptions(boolean z11, boolean z12, boolean z13) {
        this(z11, z12, z13, false, 8, null);
    }

    @JvmOverloads
    public DefaultTrackingOptions(boolean z11, boolean z12, boolean z13, boolean z14) {
        this.sessions = z11;
        this.appLifecycles = z12;
        this.deepLinks = z13;
        this.screenViews = z14;
        this.propertyChangeListeners = new ArrayList();
    }

    public /* synthetic */ DefaultTrackingOptions(boolean z11, boolean z12, boolean z13, boolean z14, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? true : z11, (i5 & 2) != 0 ? false : z12, (i5 & 4) != 0 ? false : z13, (i5 & 8) != 0 ? false : z14);
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public DefaultTrackingOptions(@NotNull Function1<? super DefaultTrackingOptions, Unit> listener) {
        this(false, false, false, false, 15, null);
        Intrinsics.g(listener, "listener");
        this.propertyChangeListeners.add(listener);
    }
}
