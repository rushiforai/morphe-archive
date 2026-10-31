package com.amplitude.android.internal;

import a2.c;
import b.c0;
import b.c9;
import com.amplitude.core.events.Plan;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.lang.ref.WeakReference;
import kotlin.Metadata;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0012\n\u0002\u0018\u0002\n\u0002\b\u0010\n\u0002\u0010\b\n\u0002\b\u0003\b\u0086\b\u0018\u00002\u00020\u0001:\u00012Bg\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0001\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0004\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0004\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\u0004\u0012\b\u0010\b\u001a\u0004\u0018\u00010\u0004\u0012\u0006\u0010\t\u001a\u00020\u0004\u0012\b\u0010\n\u001a\u0004\u0018\u00010\u0004\u0012\b\b\u0002\u0010\u000b\u001a\u00020\f\u0012\b\b\u0002\u0010\r\u001a\u00020\f¢\u0006\u0002\u0010\u000eJ\u000b\u0010 \u001a\u0004\u0018\u00010\u0001HÂ\u0003J\u000e\u0010!\u001a\u00020\fHÀ\u0003¢\u0006\u0002\b\"J\u000b\u0010#\u001a\u0004\u0018\u00010\u0004HÆ\u0003J\u000b\u0010$\u001a\u0004\u0018\u00010\u0004HÆ\u0003J\u000b\u0010%\u001a\u0004\u0018\u00010\u0004HÆ\u0003J\u000b\u0010&\u001a\u0004\u0018\u00010\u0004HÆ\u0003J\u000b\u0010'\u001a\u0004\u0018\u00010\u0004HÆ\u0003J\t\u0010(\u001a\u00020\u0004HÆ\u0003J\u000b\u0010)\u001a\u0004\u0018\u00010\u0004HÆ\u0003J\u000e\u0010*\u001a\u00020\fHÀ\u0003¢\u0006\u0002\b+J{\u0010,\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u00012\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u00042\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00042\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00042\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00042\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00042\b\b\u0002\u0010\t\u001a\u00020\u00042\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u00042\b\b\u0002\u0010\u000b\u001a\u00020\f2\b\b\u0002\u0010\r\u001a\u00020\fHÆ\u0001J\u0013\u0010-\u001a\u00020\f2\b\u0010.\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010/\u001a\u000200HÖ\u0001J\t\u00101\u001a\u00020\u0004HÖ\u0001R\u0010\u0010\u0002\u001a\u0004\u0018\u00010\u0001X\u0082\u0004¢\u0006\u0002\n\u0000R\u0013\u0010\b\u001a\u0004\u0018\u00010\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010R\u0014\u0010\r\u001a\u00020\fX\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0012R\u0014\u0010\u000b\u001a\u00020\fX\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0012R\u0013\u0010\u0003\u001a\u0004\u0018\u00010\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0010R\u0013\u0010\n\u001a\u0004\u0018\u00010\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0015\u0010\u0010R\u0011\u0010\u0016\u001a\u00020\f8F¢\u0006\u0006\u001a\u0004\b\u0016\u0010\u0012R\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0017\u0010\u0010R\u0011\u0010\t\u001a\u00020\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0018\u0010\u0010R\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0019\u0010\u0010R\u0013\u0010\u0007\u001a\u0004\u0018\u00010\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u001a\u0010\u0010R\u0013\u0010\u001b\u001a\u0004\u0018\u00010\u00018F¢\u0006\u0006\u001a\u0004\b\u001c\u0010\u001dR\u0014\u0010\u001e\u001a\b\u0012\u0004\u0012\u00020\u00010\u001fX\u0082\u0004¢\u0006\u0002\n\u0000¨\u00063"}, d2 = {"Lcom/amplitude/android/internal/ViewTarget;", b.f42142b, "_view", "className", b.f42142b, "resourceName", "tag", "text", "accessibilityLabel", Plan.AMP_PLAN_SOURCE, "hierarchy", "ampIgnoreRageClick", b.f42142b, "ampIgnoreDeadClick", "(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)V", "getAccessibilityLabel", "()Ljava/lang/String;", "getAmpIgnoreDeadClick$android_release", "()Z", "getAmpIgnoreRageClick$android_release", "getClassName", "getHierarchy", "isIgnoredForFrustration", "getResourceName", "getSource", "getTag", "getText", "view", "getView", "()Ljava/lang/Object;", "viewRef", "Ljava/lang/ref/WeakReference;", "component1", "component10", "component10$android_release", "component2", "component3", "component4", "component5", "component6", "component7", "component8", "component9", "component9$android_release", "copy", "equals", InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", "Type", "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final /* data */ class ViewTarget {

    @Nullable
    private final Object _view;

    @Nullable
    private final String accessibilityLabel;
    private final boolean ampIgnoreDeadClick;
    private final boolean ampIgnoreRageClick;

    @Nullable
    private final String className;

    @Nullable
    private final String hierarchy;

    @Nullable
    private final String resourceName;

    @NotNull
    private final String source;

    @Nullable
    private final String tag;

    @Nullable
    private final String text;

    @NotNull
    private final WeakReference<Object> viewRef;

    /* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
    /* JADX WARN: Unknown enum class pattern. Please report as an issue! */
    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\u0003\b\u0086\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002j\u0002\b\u0003¨\u0006\u0004"}, d2 = {"Lcom/amplitude/android/internal/ViewTarget$Type;", b.f42142b, "(Ljava/lang/String;I)V", "Clickable", "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    public static final class Type {
        private static final /* synthetic */ EnumEntries $ENTRIES;
        private static final /* synthetic */ Type[] $VALUES;
        public static final Type Clickable = new Type("Clickable", 0);

        private static final /* synthetic */ Type[] $values() {
            return new Type[]{Clickable};
        }

        static {
            Type[] typeArr$values = $values();
            $VALUES = typeArr$values;
            $ENTRIES = EnumEntriesKt.a(typeArr$values);
        }

        private Type(String str, int i5) {
        }

        @NotNull
        public static EnumEntries<Type> getEntries() {
            return $ENTRIES;
        }

        public static Type valueOf(String str) {
            return (Type) Enum.valueOf(Type.class, str);
        }

        public static Type[] values() {
            return (Type[]) $VALUES.clone();
        }
    }

    public ViewTarget(@Nullable Object obj, @Nullable String str, @Nullable String str2, @Nullable String str3, @Nullable String str4, @Nullable String str5, @NotNull String source, @Nullable String str6, boolean z11, boolean z12) {
        Intrinsics.g(source, "source");
        this._view = obj;
        this.className = str;
        this.resourceName = str2;
        this.tag = str3;
        this.text = str4;
        this.accessibilityLabel = str5;
        this.source = source;
        this.hierarchy = str6;
        this.ampIgnoreRageClick = z11;
        this.ampIgnoreDeadClick = z12;
        this.viewRef = new WeakReference<>(obj);
    }

    /* renamed from: component1, reason: from getter */
    private final Object get_view() {
        return this._view;
    }

    public static /* synthetic */ ViewTarget copy$default(ViewTarget viewTarget, Object obj, String str, String str2, String str3, String str4, String str5, String str6, String str7, boolean z11, boolean z12, int i5, Object obj2) {
        if ((i5 & 1) != 0) {
            obj = viewTarget._view;
        }
        if ((i5 & 2) != 0) {
            str = viewTarget.className;
        }
        if ((i5 & 4) != 0) {
            str2 = viewTarget.resourceName;
        }
        if ((i5 & 8) != 0) {
            str3 = viewTarget.tag;
        }
        if ((i5 & 16) != 0) {
            str4 = viewTarget.text;
        }
        if ((i5 & 32) != 0) {
            str5 = viewTarget.accessibilityLabel;
        }
        if ((i5 & 64) != 0) {
            str6 = viewTarget.source;
        }
        if ((i5 & 128) != 0) {
            str7 = viewTarget.hierarchy;
        }
        if ((i5 & 256) != 0) {
            z11 = viewTarget.ampIgnoreRageClick;
        }
        if ((i5 & EventBridgeChannel.QUEUE_CAPACITY) != 0) {
            z12 = viewTarget.ampIgnoreDeadClick;
        }
        boolean z13 = z11;
        boolean z14 = z12;
        String str8 = str6;
        String str9 = str7;
        String str10 = str4;
        String str11 = str5;
        return viewTarget.copy(obj, str, str2, str3, str10, str11, str8, str9, z13, z14);
    }

    /* renamed from: component10$android_release, reason: from getter */
    public final boolean getAmpIgnoreDeadClick() {
        return this.ampIgnoreDeadClick;
    }

    @Nullable
    /* renamed from: component2, reason: from getter */
    public final String getClassName() {
        return this.className;
    }

    @Nullable
    /* renamed from: component3, reason: from getter */
    public final String getResourceName() {
        return this.resourceName;
    }

    @Nullable
    /* renamed from: component4, reason: from getter */
    public final String getTag() {
        return this.tag;
    }

    @Nullable
    /* renamed from: component5, reason: from getter */
    public final String getText() {
        return this.text;
    }

    @Nullable
    /* renamed from: component6, reason: from getter */
    public final String getAccessibilityLabel() {
        return this.accessibilityLabel;
    }

    @NotNull
    /* renamed from: component7, reason: from getter */
    public final String getSource() {
        return this.source;
    }

    @Nullable
    /* renamed from: component8, reason: from getter */
    public final String getHierarchy() {
        return this.hierarchy;
    }

    /* renamed from: component9$android_release, reason: from getter */
    public final boolean getAmpIgnoreRageClick() {
        return this.ampIgnoreRageClick;
    }

    @NotNull
    public final ViewTarget copy(@Nullable Object _view, @Nullable String className, @Nullable String resourceName, @Nullable String tag, @Nullable String text, @Nullable String accessibilityLabel, @NotNull String source, @Nullable String hierarchy, boolean ampIgnoreRageClick, boolean ampIgnoreDeadClick) {
        Intrinsics.g(source, "source");
        return new ViewTarget(_view, className, resourceName, tag, text, accessibilityLabel, source, hierarchy, ampIgnoreRageClick, ampIgnoreDeadClick);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof ViewTarget)) {
            return false;
        }
        ViewTarget viewTarget = (ViewTarget) other;
        return Intrinsics.b(this._view, viewTarget._view) && Intrinsics.b(this.className, viewTarget.className) && Intrinsics.b(this.resourceName, viewTarget.resourceName) && Intrinsics.b(this.tag, viewTarget.tag) && Intrinsics.b(this.text, viewTarget.text) && Intrinsics.b(this.accessibilityLabel, viewTarget.accessibilityLabel) && Intrinsics.b(this.source, viewTarget.source) && Intrinsics.b(this.hierarchy, viewTarget.hierarchy) && this.ampIgnoreRageClick == viewTarget.ampIgnoreRageClick && this.ampIgnoreDeadClick == viewTarget.ampIgnoreDeadClick;
    }

    @Nullable
    public final String getAccessibilityLabel() {
        return this.accessibilityLabel;
    }

    public final boolean getAmpIgnoreDeadClick$android_release() {
        return this.ampIgnoreDeadClick;
    }

    public final boolean getAmpIgnoreRageClick$android_release() {
        return this.ampIgnoreRageClick;
    }

    @Nullable
    public final String getClassName() {
        return this.className;
    }

    @Nullable
    public final String getHierarchy() {
        return this.hierarchy;
    }

    @Nullable
    public final String getResourceName() {
        return this.resourceName;
    }

    @NotNull
    public final String getSource() {
        return this.source;
    }

    @Nullable
    public final String getTag() {
        return this.tag;
    }

    @Nullable
    public final String getText() {
        return this.text;
    }

    @Nullable
    public final Object getView() {
        return this.viewRef.get();
    }

    public int hashCode() {
        Object obj = this._view;
        int iHashCode = (obj == null ? 0 : obj.hashCode()) * 31;
        String str = this.className;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.resourceName;
        int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.tag;
        int iHashCode4 = (iHashCode3 + (str3 == null ? 0 : str3.hashCode())) * 31;
        String str4 = this.text;
        int iHashCode5 = (iHashCode4 + (str4 == null ? 0 : str4.hashCode())) * 31;
        String str5 = this.accessibilityLabel;
        int iE = c0.e((iHashCode5 + (str5 == null ? 0 : str5.hashCode())) * 31, 31, this.source);
        String str6 = this.hierarchy;
        return Boolean.hashCode(this.ampIgnoreDeadClick) + c9.f((iE + (str6 != null ? str6.hashCode() : 0)) * 31, 31, this.ampIgnoreRageClick);
    }

    public final boolean isIgnoredForFrustration() {
        return this.ampIgnoreRageClick && this.ampIgnoreDeadClick;
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("ViewTarget(_view=");
        sb2.append(this._view);
        sb2.append(", className=");
        sb2.append(this.className);
        sb2.append(", resourceName=");
        sb2.append(this.resourceName);
        sb2.append(", tag=");
        sb2.append(this.tag);
        sb2.append(", text=");
        sb2.append(this.text);
        sb2.append(", accessibilityLabel=");
        sb2.append(this.accessibilityLabel);
        sb2.append(", source=");
        sb2.append(this.source);
        sb2.append(", hierarchy=");
        sb2.append(this.hierarchy);
        sb2.append(", ampIgnoreRageClick=");
        sb2.append(this.ampIgnoreRageClick);
        sb2.append(", ampIgnoreDeadClick=");
        return c.p(sb2, this.ampIgnoreDeadClick, ')');
    }

    public /* synthetic */ ViewTarget(Object obj, String str, String str2, String str3, String str4, String str5, String str6, String str7, boolean z11, boolean z12, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(obj, str, str2, str3, str4, str5, str6, str7, (i5 & 256) != 0 ? false : z11, (i5 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? false : z12);
    }
}
