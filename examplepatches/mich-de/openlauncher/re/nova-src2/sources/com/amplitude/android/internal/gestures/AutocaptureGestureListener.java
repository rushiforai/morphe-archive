package com.amplitude.android.internal.gestures;

import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.View;
import com.amplitude.android.AutocaptureState;
import com.amplitude.android.InteractionType;
import com.amplitude.android.internal.ViewHierarchyScanner;
import com.amplitude.android.internal.ViewTarget;
import com.amplitude.android.internal.ViewTargetKt;
import com.amplitude.android.internal.locators.ViewTargetLocator;
import com.amplitude.common.Logger;
import java.lang.ref.WeakReference;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010$\n\u0002\u0010\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u0007\n\u0002\b\u000b\b\u0007\u0018\u00002\u00020\u0001B}\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012*\u0010\u0006\u001a&\u0012\u0004\u0012\u00020\u0005\u0012\u0012\u0012\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\t0\b\u0012\u0004\u0012\u00020\n0\u0007j\u0002`\u000b\u0012\u0006\u0010\f\u001a\u00020\r\u0012\f\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00100\u000f\u0012\f\u0010\u0011\u001a\b\u0012\u0004\u0012\u00020\u00130\u0012\u0012\u0016\b\u0002\u0010\u0014\u001a\u0010\u0012\u0004\u0012\u00020\u0016\u0012\u0004\u0012\u00020\n\u0018\u00010\u0015¢\u0006\u0002\u0010\u0017J\u0010\u0010\u001d\u001a\u00020\u001e2\u0006\u0010\u001f\u001a\u00020 H\u0016J*\u0010!\u001a\u00020\u001e2\b\u0010\"\u001a\u0004\u0018\u00010 2\u0006\u0010#\u001a\u00020 2\u0006\u0010$\u001a\u00020%2\u0006\u0010&\u001a\u00020%H\u0016J\u0010\u0010'\u001a\u00020\n2\u0006\u0010\u001f\u001a\u00020 H\u0016J*\u0010(\u001a\u00020\u001e2\b\u0010\"\u001a\u0004\u0018\u00010 2\u0006\u0010#\u001a\u00020 2\u0006\u0010)\u001a\u00020%2\u0006\u0010*\u001a\u00020%H\u0016J\u0010\u0010+\u001a\u00020\n2\u0006\u0010\u001f\u001a\u00020 H\u0016J\u0010\u0010,\u001a\u00020\u001e2\u0006\u0010\u001f\u001a\u00020 H\u0016J!\u0010-\u001a\u00020\n2\u0012\u0010.\u001a\u000e\u0012\u0004\u0012\u00020\u0016\u0012\u0004\u0012\u00020\n0\u0015H\u0000¢\u0006\u0002\b/R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u0018\u001a\u00020\u00138BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b\u0019\u0010\u001aR\u0014\u0010\u0011\u001a\b\u0012\u0004\u0012\u00020\u00130\u0012X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u001b\u001a\b\u0012\u0004\u0012\u00020\u00030\u001cX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\f\u001a\u00020\rX\u0082\u0004¢\u0006\u0002\n\u0000R\u001c\u0010\u0014\u001a\u0010\u0012\u0004\u0012\u00020\u0016\u0012\u0004\u0012\u00020\n\u0018\u00010\u0015X\u0082\u000e¢\u0006\u0002\n\u0000R2\u0010\u0006\u001a&\u0012\u0004\u0012\u00020\u0005\u0012\u0012\u0012\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\t0\b\u0012\u0004\u0012\u00020\n0\u0007j\u0002`\u000bX\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00100\u000fX\u0082\u0004¢\u0006\u0002\n\u0000¨\u00060"}, d2 = {"Lcom/amplitude/android/internal/gestures/AutocaptureGestureListener;", "Landroid/view/GestureDetector$OnGestureListener;", "decorView", "Landroid/view/View;", "activityName", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "track", "Lkotlin/Function2;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lcom/amplitude/android/internal/TrackFunction;", "logger", "Lcom/amplitude/common/Logger;", "viewTargetLocators", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lcom/amplitude/android/internal/locators/ViewTargetLocator;", "autocaptureStateProvider", "Lkotlin/Function0;", "Lcom/amplitude/android/AutocaptureState;", "onViewTargetFound", "Lkotlin/Function1;", "Lcom/amplitude/android/internal/ViewTarget;", "(Landroid/view/View;Ljava/lang/String;Lkotlin/jvm/functions/Function2;Lcom/amplitude/common/Logger;Ljava/util/List;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function1;)V", "autocaptureState", "getAutocaptureState", "()Lcom/amplitude/android/AutocaptureState;", "decorViewRef", "Ljava/lang/ref/WeakReference;", "onDown", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "e", "Landroid/view/MotionEvent;", "onFling", "e1", "e2", "velocityX", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "velocityY", "onLongPress", "onScroll", "distanceX", "distanceY", "onShowPress", "onSingleTapUp", "setViewTargetFoundCallback", "callback", "setViewTargetFoundCallback$android_release", "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes2.dex */
public final class AutocaptureGestureListener implements GestureDetector.OnGestureListener {

    @NotNull
    private final String activityName;

    @NotNull
    private final Function0<AutocaptureState> autocaptureStateProvider;

    @NotNull
    private final WeakReference<View> decorViewRef;

    @NotNull
    private final Logger logger;

    @Nullable
    private Function1<? super ViewTarget, Unit> onViewTargetFound;

    @NotNull
    private final Function2<String, Map<String, ? extends Object>, Unit> track;

    @NotNull
    private final List<ViewTargetLocator> viewTargetLocators;

    /* JADX WARN: Multi-variable type inference failed */
    public AutocaptureGestureListener(@NotNull View decorView, @NotNull String activityName, @NotNull Function2<? super String, ? super Map<String, ? extends Object>, Unit> track, @NotNull Logger logger, @NotNull List<? extends ViewTargetLocator> viewTargetLocators, @NotNull Function0<AutocaptureState> autocaptureStateProvider, @Nullable Function1<? super ViewTarget, Unit> function1) {
        Intrinsics.g(decorView, "decorView");
        Intrinsics.g(activityName, "activityName");
        Intrinsics.g(track, "track");
        Intrinsics.g(logger, "logger");
        Intrinsics.g(viewTargetLocators, "viewTargetLocators");
        Intrinsics.g(autocaptureStateProvider, "autocaptureStateProvider");
        this.activityName = activityName;
        this.track = track;
        this.logger = logger;
        this.viewTargetLocators = viewTargetLocators;
        this.autocaptureStateProvider = autocaptureStateProvider;
        this.onViewTargetFound = function1;
        this.decorViewRef = new WeakReference<>(decorView);
    }

    private final AutocaptureState getAutocaptureState() {
        return (AutocaptureState) this.autocaptureStateProvider.invoke();
    }

    @Override // android.view.GestureDetector.OnGestureListener
    public boolean onDown(@NotNull MotionEvent e3) {
        Intrinsics.g(e3, "e");
        return false;
    }

    @Override // android.view.GestureDetector.OnGestureListener
    public boolean onFling(@Nullable MotionEvent e12, @NotNull MotionEvent e22, float velocityX, float velocityY) {
        Intrinsics.g(e22, "e2");
        return false;
    }

    @Override // android.view.GestureDetector.OnGestureListener
    public void onLongPress(@NotNull MotionEvent e3) {
        Intrinsics.g(e3, "e");
    }

    @Override // android.view.GestureDetector.OnGestureListener
    public boolean onScroll(@Nullable MotionEvent e12, @NotNull MotionEvent e22, float distanceX, float distanceY) {
        Intrinsics.g(e22, "e2");
        return false;
    }

    @Override // android.view.GestureDetector.OnGestureListener
    public void onShowPress(@NotNull MotionEvent e3) {
        Intrinsics.g(e3, "e");
    }

    @Override // android.view.GestureDetector.OnGestureListener
    public boolean onSingleTapUp(@NotNull MotionEvent e3) {
        Intrinsics.g(e3, "e");
        if (getAutocaptureState().getInteractions().isEmpty()) {
            return false;
        }
        View view = this.decorViewRef.get();
        if (view == null) {
            this.logger.error("DecorView is null in onSingleTapUp()");
            Unit unit = Unit.f71706a;
            return false;
        }
        ViewTarget viewTargetFindTarget = ViewHierarchyScanner.findTarget(view, new Pair(Float.valueOf(e3.getX()), Float.valueOf(e3.getY())), this.viewTargetLocators, ViewTarget.Type.Clickable, this.logger);
        if (viewTargetFindTarget == null) {
            this.logger.warn("Unable to find click target. No event captured.");
            Unit unit2 = Unit.f71706a;
            return false;
        }
        Function1<? super ViewTarget, Unit> function1 = this.onViewTargetFound;
        if (function1 != null) {
            function1.invoke(viewTargetFindTarget);
        }
        if (getAutocaptureState().getInteractions().contains(InteractionType.ElementInteraction.INSTANCE)) {
            this.track.invoke("[Amplitude] Element Interacted", ViewTargetKt.buildElementInteractedProperties(viewTargetFindTarget, this.activityName));
        }
        return false;
    }

    public final void setViewTargetFoundCallback$android_release(@NotNull Function1<? super ViewTarget, Unit> callback) {
        Intrinsics.g(callback, "callback");
        this.onViewTargetFound = callback;
    }

    public /* synthetic */ AutocaptureGestureListener(View view, String str, Function2 function2, Logger logger, List list, Function0 function0, Function1 function1, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(view, str, function2, logger, list, function0, (i5 & 64) != 0 ? null : function1);
    }
}
