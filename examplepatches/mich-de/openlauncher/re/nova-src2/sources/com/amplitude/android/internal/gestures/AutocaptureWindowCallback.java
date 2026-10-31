package com.amplitude.android.internal.gestures;

import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.View;
import android.view.Window;
import com.amplitude.android.AutocaptureState;
import com.amplitude.android.internal.ViewTarget;
import com.amplitude.android.internal.locators.ViewTargetLocator;
import com.amplitude.android.migration.DatabaseConstants;
import com.amplitude.common.Logger;
import com.amplitude.eventbridge.EventBridgeChannel;
import java.lang.ref.WeakReference;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000~\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010$\n\u0002\u0010\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0010\u0018\u00002\u00020\u0001:\u00013B\u008b\u0001\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012*\u0010\b\u001a&\u0012\u0004\u0012\u00020\u0007\u0012\u0012\u0012\u0010\u0012\u0004\u0012\u00020\u0007\u0012\u0006\u0012\u0004\u0018\u00010\u000b0\n\u0012\u0004\u0012\u00020\f0\tj\u0002`\r\u0012\f\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00100\u000f\u0012\u0006\u0010\u0011\u001a\u00020\u0012\u0012\f\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00150\u0014\u0012\b\b\u0002\u0010\u0016\u001a\u00020\u0017\u0012\b\b\u0002\u0010\u0018\u001a\u00020\u0019\u0012\b\b\u0002\u0010\u001a\u001a\u00020\u001b¢\u0006\u0002\u0010\u001cJ\u0012\u0010/\u001a\u0002002\b\u00101\u001a\u0004\u0018\u000102H\u0016R\u0014\u0010\u0006\u001a\u00020\u0007X\u0084\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u001d\u0010\u001eR\u001a\u0010\u001f\u001a\b\u0012\u0004\u0012\u00020\u00050 X\u0084\u0004¢\u0006\b\n\u0000\u001a\u0004\b!\u0010\"R\u000e\u0010\u001a\u001a\u00020\u001bX\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u0018\u001a\u00020\u0019X\u0084\u0004¢\u0006\b\n\u0000\u001a\u0004\b#\u0010$R\u001c\u0010%\u001a\u0004\u0018\u00010&X\u0084\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b'\u0010(\"\u0004\b)\u0010*R\u0014\u0010\u0011\u001a\u00020\u0012X\u0084\u0004¢\u0006\b\n\u0000\u001a\u0004\b+\u0010,R\u000e\u0010\u0016\u001a\u00020\u0017X\u0082\u0004¢\u0006\u0002\n\u0000R\u001a\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00100\u000fX\u0084\u0004¢\u0006\b\n\u0000\u001a\u0004\b-\u0010.¨\u00064"}, d2 = {"Lcom/amplitude/android/internal/gestures/AutocaptureWindowCallback;", "Lcom/amplitude/android/internal/gestures/WindowCallbackAdapter;", "delegate", "Landroid/view/Window$Callback;", "decorView", "Landroid/view/View;", "activityName", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "track", "Lkotlin/Function2;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lcom/amplitude/android/internal/TrackFunction;", "viewTargetLocators", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lcom/amplitude/android/internal/locators/ViewTargetLocator;", "logger", "Lcom/amplitude/common/Logger;", "autocaptureStateProvider", "Lkotlin/Function0;", "Lcom/amplitude/android/AutocaptureState;", "motionEventObtainer", "Lcom/amplitude/android/internal/gestures/AutocaptureWindowCallback$MotionEventObtainer;", "gestureListener", "Lcom/amplitude/android/internal/gestures/AutocaptureGestureListener;", "gestureDetector", "Landroid/view/GestureDetector;", "(Landroid/view/Window$Callback;Landroid/view/View;Ljava/lang/String;Lkotlin/jvm/functions/Function2;Ljava/util/List;Lcom/amplitude/common/Logger;Lkotlin/jvm/functions/Function0;Lcom/amplitude/android/internal/gestures/AutocaptureWindowCallback$MotionEventObtainer;Lcom/amplitude/android/internal/gestures/AutocaptureGestureListener;Landroid/view/GestureDetector;)V", "getActivityName", "()Ljava/lang/String;", "decorViewRef", "Ljava/lang/ref/WeakReference;", "getDecorViewRef", "()Ljava/lang/ref/WeakReference;", "getGestureListener", "()Lcom/amplitude/android/internal/gestures/AutocaptureGestureListener;", "lastFoundViewTarget", "Lcom/amplitude/android/internal/ViewTarget;", "getLastFoundViewTarget", "()Lcom/amplitude/android/internal/ViewTarget;", "setLastFoundViewTarget", "(Lcom/amplitude/android/internal/ViewTarget;)V", "getLogger", "()Lcom/amplitude/common/Logger;", "getViewTargetLocators", "()Ljava/util/List;", "dispatchTouchEvent", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, DatabaseConstants.EVENT_FIELD, "Landroid/view/MotionEvent;", "MotionEventObtainer", "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public class AutocaptureWindowCallback extends WindowCallbackAdapter {

    @NotNull
    private final String activityName;

    @NotNull
    private final WeakReference<View> decorViewRef;

    @NotNull
    private final GestureDetector gestureDetector;

    @NotNull
    private final AutocaptureGestureListener gestureListener;

    @Nullable
    private ViewTarget lastFoundViewTarget;

    @NotNull
    private final Logger logger;

    @NotNull
    private final MotionEventObtainer motionEventObtainer;

    @NotNull
    private final List<ViewTargetLocator> viewTargetLocators;

    @Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\bf\u0018\u00002\u00020\u0001J\u0010\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0003H\u0016ø\u0001\u0000\u0082\u0002\u0006\n\u0004\b!0\u0001¨\u0006\u0005À\u0006\u0001"}, d2 = {"Lcom/amplitude/android/internal/gestures/AutocaptureWindowCallback$MotionEventObtainer;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "obtain", "Landroid/view/MotionEvent;", "origin", "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    public interface MotionEventObtainer {
        @NotNull
        default MotionEvent obtain(@NotNull MotionEvent origin) {
            Intrinsics.g(origin, "origin");
            MotionEvent motionEventObtain = MotionEvent.obtain(origin);
            Intrinsics.f(motionEventObtain, "obtain(...)");
            return motionEventObtain;
        }
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public /* synthetic */ AutocaptureWindowCallback(Window.Callback callback, View view, String str, Function2 function2, List list, Logger logger, Function0 function0, MotionEventObtainer motionEventObtainer, AutocaptureGestureListener autocaptureGestureListener, GestureDetector gestureDetector, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        MotionEventObtainer motionEventObtainer2 = (i5 & 128) != 0 ? new MotionEventObtainer() { // from class: com.amplitude.android.internal.gestures.AutocaptureWindowCallback.1
        } : motionEventObtainer;
        AutocaptureGestureListener autocaptureGestureListener2 = (i5 & 256) != 0 ? new AutocaptureGestureListener(view, str, function2, logger, list, function0, null, 64, null) : autocaptureGestureListener;
        this(callback, view, str, function2, list, logger, function0, motionEventObtainer2, autocaptureGestureListener2, (i5 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? new GestureDetector(view.getContext(), autocaptureGestureListener2) : gestureDetector);
    }

    @Override // com.amplitude.android.internal.gestures.WindowCallbackAdapter, android.view.Window.Callback
    public boolean dispatchTouchEvent(@Nullable MotionEvent event) {
        if (event != null) {
            MotionEvent motionEventObtain = this.motionEventObtainer.obtain(event);
            try {
                try {
                    this.gestureDetector.onTouchEvent(motionEventObtain);
                } catch (Exception e3) {
                    this.logger.error("Error handling touch event: " + e3);
                    Unit unit = Unit.f71706a;
                }
            } finally {
                motionEventObtain.recycle();
            }
        }
        return super.dispatchTouchEvent(event);
    }

    @NotNull
    public final String getActivityName() {
        return this.activityName;
    }

    @NotNull
    public final WeakReference<View> getDecorViewRef() {
        return this.decorViewRef;
    }

    @NotNull
    public final AutocaptureGestureListener getGestureListener() {
        return this.gestureListener;
    }

    @Nullable
    public final ViewTarget getLastFoundViewTarget() {
        return this.lastFoundViewTarget;
    }

    @NotNull
    public final Logger getLogger() {
        return this.logger;
    }

    @NotNull
    public final List<ViewTargetLocator> getViewTargetLocators() {
        return this.viewTargetLocators;
    }

    public final void setLastFoundViewTarget(@Nullable ViewTarget viewTarget) {
        this.lastFoundViewTarget = viewTarget;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Multi-variable type inference failed */
    public AutocaptureWindowCallback(@NotNull Window.Callback delegate, @NotNull View decorView, @NotNull String activityName, @NotNull Function2<? super String, ? super Map<String, ? extends Object>, Unit> track, @NotNull List<? extends ViewTargetLocator> viewTargetLocators, @NotNull Logger logger, @NotNull Function0<AutocaptureState> autocaptureStateProvider, @NotNull MotionEventObtainer motionEventObtainer, @NotNull AutocaptureGestureListener gestureListener, @NotNull GestureDetector gestureDetector) {
        super(delegate);
        Intrinsics.g(delegate, "delegate");
        Intrinsics.g(decorView, "decorView");
        Intrinsics.g(activityName, "activityName");
        Intrinsics.g(track, "track");
        Intrinsics.g(viewTargetLocators, "viewTargetLocators");
        Intrinsics.g(logger, "logger");
        Intrinsics.g(autocaptureStateProvider, "autocaptureStateProvider");
        Intrinsics.g(motionEventObtainer, "motionEventObtainer");
        Intrinsics.g(gestureListener, "gestureListener");
        Intrinsics.g(gestureDetector, "gestureDetector");
        this.activityName = activityName;
        this.viewTargetLocators = viewTargetLocators;
        this.logger = logger;
        this.motionEventObtainer = motionEventObtainer;
        this.gestureListener = gestureListener;
        this.gestureDetector = gestureDetector;
        this.decorViewRef = new WeakReference<>(decorView);
        gestureListener.setViewTargetFoundCallback$android_release(new Function1<ViewTarget, Unit>() { // from class: com.amplitude.android.internal.gestures.AutocaptureWindowCallback.2
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Object invoke(Object obj) {
                invoke((ViewTarget) obj);
                return Unit.f71706a;
            }

            public final void invoke(@NotNull ViewTarget it) {
                Intrinsics.g(it, "it");
                AutocaptureWindowCallback.this.setLastFoundViewTarget(it);
            }
        });
    }
}
