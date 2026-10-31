package com.amplitude.android.utilities;

import android.app.Activity;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.util.TTConst;
import java.lang.ref.WeakReference;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\u001b\u0012\f\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0002\u0010\u0007J\u000f\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0006HÆ\u0003J#\u0010\u000e\u001a\u00020\u00002\u000e\b\u0002\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0015HÖ\u0001R\u0017\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0016"}, d2 = {"Lcom/amplitude/android/utilities/ActivityCallbackEvent;", b.f42142b, "activity", "Ljava/lang/ref/WeakReference;", "Landroid/app/Activity;", TTConst.TRACK_TYPE, "Lcom/amplitude/android/utilities/ActivityCallbackType;", "(Ljava/lang/ref/WeakReference;Lcom/amplitude/android/utilities/ActivityCallbackType;)V", "getActivity", "()Ljava/lang/ref/WeakReference;", "getType", "()Lcom/amplitude/android/utilities/ActivityCallbackType;", "component1", "component2", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", b.f42142b, "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final /* data */ class ActivityCallbackEvent {

    @NotNull
    private final WeakReference<Activity> activity;

    @NotNull
    private final ActivityCallbackType type;

    public ActivityCallbackEvent(@NotNull WeakReference<Activity> activity, @NotNull ActivityCallbackType type) {
        Intrinsics.g(activity, "activity");
        Intrinsics.g(type, "type");
        this.activity = activity;
        this.type = type;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ ActivityCallbackEvent copy$default(ActivityCallbackEvent activityCallbackEvent, WeakReference weakReference, ActivityCallbackType activityCallbackType, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            weakReference = activityCallbackEvent.activity;
        }
        if ((i5 & 2) != 0) {
            activityCallbackType = activityCallbackEvent.type;
        }
        return activityCallbackEvent.copy(weakReference, activityCallbackType);
    }

    @NotNull
    public final WeakReference<Activity> component1() {
        return this.activity;
    }

    @NotNull
    /* renamed from: component2, reason: from getter */
    public final ActivityCallbackType getType() {
        return this.type;
    }

    @NotNull
    public final ActivityCallbackEvent copy(@NotNull WeakReference<Activity> activity, @NotNull ActivityCallbackType type) {
        Intrinsics.g(activity, "activity");
        Intrinsics.g(type, "type");
        return new ActivityCallbackEvent(activity, type);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof ActivityCallbackEvent)) {
            return false;
        }
        ActivityCallbackEvent activityCallbackEvent = (ActivityCallbackEvent) other;
        return Intrinsics.b(this.activity, activityCallbackEvent.activity) && this.type == activityCallbackEvent.type;
    }

    @NotNull
    public final WeakReference<Activity> getActivity() {
        return this.activity;
    }

    @NotNull
    public final ActivityCallbackType getType() {
        return this.type;
    }

    public int hashCode() {
        return this.type.hashCode() + (this.activity.hashCode() * 31);
    }

    @NotNull
    public String toString() {
        return "ActivityCallbackEvent(activity=" + this.activity + ", type=" + this.type + ')';
    }
}
