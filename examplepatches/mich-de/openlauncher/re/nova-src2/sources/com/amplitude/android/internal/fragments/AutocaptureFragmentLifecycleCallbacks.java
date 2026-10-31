package com.amplitude.android.internal.fragments;

import androidx.fragment.app.d1;
import androidx.fragment.app.h0;
import androidx.fragment.app.h1;
import androidx.fragment.app.m0;
import com.amplitude.android.utilities.DefaultEventUtils;
import com.amplitude.common.Logger;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Map;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.MapsKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000B\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\u0010$\n\u0002\u0010\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\b\u0000\u0018\u00002\u00020\u0001BK\u0012*\u0010\b\u001a&\u0012\u0004\u0012\u00020\u0003\u0012\u0012\u0012\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u0004\u0012\u0004\u0012\u00020\u00060\u0002j\u0002`\u0007\u0012\u0006\u0010\n\u001a\u00020\t\u0012\u000e\b\u0002\u0010\r\u001a\b\u0012\u0004\u0012\u00020\f0\u000b¢\u0006\u0004\b\u000e\u0010\u000fJ\u001f\u0010\u0014\u001a\u00020\u00062\u0006\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u0013\u001a\u00020\u0012H\u0016¢\u0006\u0004\b\u0014\u0010\u0015R8\u0010\b\u001a&\u0012\u0004\u0012\u00020\u0003\u0012\u0012\u0012\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u0004\u0012\u0004\u0012\u00020\u00060\u0002j\u0002`\u00078\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0016R\u0014\u0010\n\u001a\u00020\t8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u0017R\u001a\u0010\r\u001a\b\u0012\u0004\u0012\u00020\f0\u000b8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\r\u0010\u0018¨\u0006\u0019"}, d2 = {"Lcom/amplitude/android/internal/fragments/AutocaptureFragmentLifecycleCallbacks;", "Landroidx/fragment/app/d1;", "Lkotlin/Function2;", b.f42142b, b.f42142b, b.f42142b, b.f42142b, "Lcom/amplitude/android/internal/TrackFunction;", "track", "Lcom/amplitude/common/Logger;", "logger", "Lkotlin/Function0;", b.f42142b, "screenViewsEnabled", "<init>", "(Lkotlin/jvm/functions/Function2;Lcom/amplitude/common/Logger;Lkotlin/jvm/functions/Function0;)V", "Landroidx/fragment/app/h1;", "fm", "Landroidx/fragment/app/h0;", InneractiveMediationDefs.GENDER_FEMALE, "onFragmentResumed", "(Landroidx/fragment/app/h1;Landroidx/fragment/app/h0;)V", "Lkotlin/jvm/functions/Function2;", "Lcom/amplitude/common/Logger;", "Lkotlin/jvm/functions/Function0;", "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class AutocaptureFragmentLifecycleCallbacks extends d1 {

    @NotNull
    private final Logger logger;

    @NotNull
    private final Function0<Boolean> screenViewsEnabled;

    @NotNull
    private final Function2<String, Map<String, ? extends Object>, Unit> track;

    public /* synthetic */ AutocaptureFragmentLifecycleCallbacks(Function2 function2, Logger logger, Function0 function0, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(function2, logger, (i5 & 4) != 0 ? new Function0<Boolean>() { // from class: com.amplitude.android.internal.fragments.AutocaptureFragmentLifecycleCallbacks.1
            @Override // kotlin.jvm.functions.Function0
            @NotNull
            public final Boolean invoke() {
                return Boolean.TRUE;
            }
        } : function0);
    }

    @Override // androidx.fragment.app.d1
    public void onFragmentResumed(@NotNull h1 fm, @NotNull h0 f11) {
        Object objA;
        Intrinsics.g(fm, "fm");
        Intrinsics.g(f11, "f");
        if (((Boolean) this.screenViewsEnabled.invoke()).booleanValue()) {
            String canonicalName = f11.getClass().getCanonicalName();
            if (canonicalName == null) {
                canonicalName = f11.getClass().getSimpleName();
            }
            try {
                int i5 = Result.f71687b;
                objA = f11.getResources().getResourceEntryName(f11.getId());
            } catch (Throwable th2) {
                int i11 = Result.f71687b;
                objA = ResultKt.a(th2);
            }
            Throwable thA = Result.a(objA);
            if (thA != null) {
                this.logger.error("Failed to get resource entry name: " + thA);
            }
            if (objA instanceof Result.Failure) {
                objA = null;
            }
            String str = (String) objA;
            m0 activity = f11.getActivity();
            this.track.invoke("[Amplitude] Fragment Viewed", MapsKt.j0(new Pair("[Amplitude] Fragment Class", canonicalName), new Pair("[Amplitude] Fragment Identifier", str), new Pair("[Amplitude] Screen Name", activity != null ? DefaultEventUtils.INSTANCE.getScreenName$android_release(activity) : null), new Pair("[Amplitude] Fragment Tag", f11.getTag())));
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public AutocaptureFragmentLifecycleCallbacks(@NotNull Function2<? super String, ? super Map<String, ? extends Object>, Unit> track, @NotNull Logger logger, @NotNull Function0<Boolean> screenViewsEnabled) {
        Intrinsics.g(track, "track");
        Intrinsics.g(logger, "logger");
        Intrinsics.g(screenViewsEnabled, "screenViewsEnabled");
        this.track = track;
        this.logger = logger;
        this.screenViewsEnabled = screenViewsEnabled;
    }
}
