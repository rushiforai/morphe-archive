package com.amplitude.android.internal.locators;

import a2.c;
import android.view.View;
import android.widget.Button;
import b70.g;
import com.amplitude.android.internal.ViewResourceUtils;
import com.amplitude.android.internal.ViewTarget;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.ArrayList;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000B\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0007\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0000\u0018\u0000 \u00172\u00020\u0001:\u0002\u0017\u0018B\u0005¢\u0006\u0002\u0010\u0002J\f\u0010\b\u001a\u00020\t*\u00020\u0005H\u0002J\f\u0010\n\u001a\u00020\u000b*\u00020\u0005H\u0002J*\u0010\f\u001a\u0004\u0018\u00010\t*\u00020\r2\u0012\u0010\u000e\u001a\u000e\u0012\u0004\u0012\u00020\u0010\u0012\u0004\u0012\u00020\u00100\u000f2\u0006\u0010\u0011\u001a\u00020\u0012H\u0016J\f\u0010\u0013\u001a\u00020\u0014*\u00020\u0005H\u0002J \u0010\u0015\u001a\u00020\u000b*\u00020\u00052\u0012\u0010\u0016\u001a\u000e\u0012\u0004\u0012\u00020\u0010\u0012\u0004\u0012\u00020\u00100\u000fH\u0002R\u0018\u0010\u0003\u001a\u00020\u0004*\u00020\u00058BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0019"}, d2 = {"Lcom/amplitude/android/internal/locators/AndroidViewTargetLocator;", "Lcom/amplitude/android/internal/locators/ViewTargetLocator;", "()V", "hierarchy", b.f42142b, "Landroid/view/View;", "getHierarchy", "(Landroid/view/View;)Ljava/lang/String;", "createViewTarget", "Lcom/amplitude/android/internal/ViewTarget;", "isViewTappable", b.f42142b, "locate", b.f42142b, "targetPosition", "Lkotlin/Pair;", b.f42142b, "targetType", "Lcom/amplitude/android/internal/ViewTarget$Type;", "readFrustrationAttributes", "Lcom/amplitude/android/internal/locators/AndroidViewTargetLocator$FrustrationSettings;", "touchWithinBounds", "position", k.O, "FrustrationSettings", "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes2.dex */
public final class AndroidViewTargetLocator implements ViewTargetLocator {

    @NotNull
    private static final String HIERARCHY_DELIMITER = " → ";

    @NotNull
    private static final String SOURCE = "android_view";

    @Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000b\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0082\b\u0018\u00002\u00020\u0001B\u0019\u0012\b\b\u0002\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0004\u001a\u00020\u0003¢\u0006\u0002\u0010\u0005J\t\u0010\t\u001a\u00020\u0003HÆ\u0003J\t\u0010\n\u001a\u00020\u0003HÆ\u0003J\u001d\u0010\u000b\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\f\u001a\u00020\u00032\b\u0010\r\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u000e\u001a\u00020\u000fHÖ\u0001J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001R\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\u0007¨\u0006\u0012"}, d2 = {"Lcom/amplitude/android/internal/locators/AndroidViewTargetLocator$FrustrationSettings;", b.f42142b, "ignoreRageClick", b.f42142b, "ignoreDeadClick", "(ZZ)V", "getIgnoreDeadClick", "()Z", "getIgnoreRageClick", "component1", "component2", "copy", "equals", InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", b.f42142b, "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    public static final /* data */ class FrustrationSettings {
        private final boolean ignoreDeadClick;
        private final boolean ignoreRageClick;

        /* JADX WARN: Illegal instructions before constructor call */
        public FrustrationSettings() {
            boolean z11 = false;
            this(z11, z11, 3, null);
        }

        public static /* synthetic */ FrustrationSettings copy$default(FrustrationSettings frustrationSettings, boolean z11, boolean z12, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                z11 = frustrationSettings.ignoreRageClick;
            }
            if ((i5 & 2) != 0) {
                z12 = frustrationSettings.ignoreDeadClick;
            }
            return frustrationSettings.copy(z11, z12);
        }

        /* renamed from: component1, reason: from getter */
        public final boolean getIgnoreRageClick() {
            return this.ignoreRageClick;
        }

        /* renamed from: component2, reason: from getter */
        public final boolean getIgnoreDeadClick() {
            return this.ignoreDeadClick;
        }

        @NotNull
        public final FrustrationSettings copy(boolean ignoreRageClick, boolean ignoreDeadClick) {
            return new FrustrationSettings(ignoreRageClick, ignoreDeadClick);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof FrustrationSettings)) {
                return false;
            }
            FrustrationSettings frustrationSettings = (FrustrationSettings) other;
            return this.ignoreRageClick == frustrationSettings.ignoreRageClick && this.ignoreDeadClick == frustrationSettings.ignoreDeadClick;
        }

        public final boolean getIgnoreDeadClick() {
            return this.ignoreDeadClick;
        }

        public final boolean getIgnoreRageClick() {
            return this.ignoreRageClick;
        }

        public int hashCode() {
            return Boolean.hashCode(this.ignoreDeadClick) + (Boolean.hashCode(this.ignoreRageClick) * 31);
        }

        @NotNull
        public String toString() {
            StringBuilder sb2 = new StringBuilder("FrustrationSettings(ignoreRageClick=");
            sb2.append(this.ignoreRageClick);
            sb2.append(", ignoreDeadClick=");
            return c.p(sb2, this.ignoreDeadClick, ')');
        }

        public FrustrationSettings(boolean z11, boolean z12) {
            this.ignoreRageClick = z11;
            this.ignoreDeadClick = z12;
        }

        public /* synthetic */ FrustrationSettings(boolean z11, boolean z12, int i5, DefaultConstructorMarker defaultConstructorMarker) {
            this((i5 & 1) != 0 ? false : z11, (i5 & 2) != 0 ? false : z12);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x003e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private final ViewTarget createViewTarget(View view) {
        String string;
        CharSequence text;
        String canonicalName = view.getClass().getCanonicalName();
        if (canonicalName == null) {
            canonicalName = view.getClass().getSimpleName();
        }
        String str = canonicalName;
        String resourceIdWithFallback = ViewResourceUtils.INSTANCE.getResourceIdWithFallback(view);
        String hierarchy = getHierarchy(view);
        Object tag = view.getTag();
        if (tag == null) {
            string = null;
        } else {
            if (!(tag instanceof String) && !(tag instanceof Number) && !(tag instanceof Boolean) && !(tag instanceof Character)) {
                tag = null;
            }
            if (tag != null) {
                string = tag.toString();
            }
        }
        Button button = view instanceof Button ? (Button) view : null;
        String string2 = (button == null || (text = button.getText()) == null) ? null : text.toString();
        CharSequence contentDescription = view.getContentDescription();
        String string3 = contentDescription != null ? contentDescription.toString() : null;
        FrustrationSettings frustrationAttributes = readFrustrationAttributes(view);
        return new ViewTarget(view, str, resourceIdWithFallback, string, string2, string3, SOURCE, hierarchy, frustrationAttributes.getIgnoreRageClick(), frustrationAttributes.getIgnoreDeadClick());
    }

    private final String getHierarchy(View view) {
        ArrayList arrayList = new ArrayList();
        while (view != null) {
            arrayList.add(view.getClass().getSimpleName());
            Object parent = view.getParent();
            view = parent instanceof View ? (View) parent : null;
        }
        return g.f1(arrayList, HIERARCHY_DELIMITER, null, null, 0, null, 62);
    }

    private final boolean isViewTappable(View view) {
        return view.isClickable() && view.getVisibility() == 0;
    }

    private final FrustrationSettings readFrustrationAttributes(View view) {
        Object tag = view.getTag(-1989905945);
        Boolean bool = tag instanceof Boolean ? (Boolean) tag : null;
        boolean zBooleanValue = bool != null ? bool.booleanValue() : false;
        Object tag2 = view.getTag(-633031234);
        Boolean bool2 = tag2 instanceof Boolean ? (Boolean) tag2 : null;
        boolean zBooleanValue2 = bool2 != null ? bool2.booleanValue() : false;
        Object tag3 = view.getTag(457577948);
        Boolean bool3 = tag3 instanceof Boolean ? (Boolean) tag3 : null;
        boolean zBooleanValue3 = bool3 != null ? bool3.booleanValue() : false;
        return new FrustrationSettings(zBooleanValue || zBooleanValue3, zBooleanValue2 || zBooleanValue3);
    }

    private final boolean touchWithinBounds(View view, Pair<Float, Float> pair) {
        float fFloatValue = ((Number) pair.f71683a).floatValue();
        float fFloatValue2 = ((Number) pair.f71684b).floatValue();
        int[] iArr = new int[2];
        int[] iArr2 = new int[2];
        view.getRootView().getLocationOnScreen(iArr);
        view.getLocationOnScreen(iArr2);
        int i5 = iArr2[0] - iArr[0];
        int i11 = iArr2[1] - iArr[1];
        return fFloatValue >= ((float) i5) && fFloatValue <= ((float) (view.getWidth() + i5)) && fFloatValue2 >= ((float) i11) && fFloatValue2 <= ((float) (view.getHeight() + i11));
    }

    @Override // com.amplitude.android.internal.locators.ViewTargetLocator
    @Nullable
    public ViewTarget locate(@NotNull Object obj, @NotNull Pair<Float, Float> targetPosition, @NotNull ViewTarget.Type targetType) {
        Intrinsics.g(obj, "<this>");
        Intrinsics.g(targetPosition, "targetPosition");
        Intrinsics.g(targetType, "targetType");
        View view = obj instanceof View ? (View) obj : null;
        if (view != null) {
            View view2 = (View) obj;
            if (!touchWithinBounds(view2, targetPosition) || targetType != ViewTarget.Type.Clickable || !isViewTappable(view2)) {
                view = null;
            }
            if (view != null) {
                return createViewTarget(view2);
            }
        }
        return null;
    }
}
