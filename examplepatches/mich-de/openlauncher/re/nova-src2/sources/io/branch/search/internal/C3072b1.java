package io.branch.search.internal;

import com.amplitude.eventbridge.EventBridgeChannel;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.b1, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3072b1 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f63969a;

    /* renamed from: b, reason: collision with root package name */
    public final int f63970b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final String f63971c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final String f63972d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final String f63973e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final String f63974f;

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public final String f63975g;

    /* renamed from: h, reason: collision with root package name */
    @NotNull
    public final String f63976h;

    /* renamed from: i, reason: collision with root package name */
    @NotNull
    public final String f63977i;

    /* renamed from: j, reason: collision with root package name */
    @Nullable
    public final Integer f63978j;

    /* renamed from: k, reason: collision with root package name */
    @Nullable
    public final String f63979k;

    public /* synthetic */ C3072b1(int i5, String str) {
        this("unspecified", i5, "auto_suggestions", "auto_suggestions", "unspecified", "unspecified", "unspecified", "unspecified", str, null, null);
    }

    public static C3072b1 a(C3072b1 c3072b1, Integer num, String str, int i5) {
        String packageName = c3072b1.f63969a;
        int i11 = c3072b1.f63970b;
        String containerType = c3072b1.f63971c;
        String entityType = c3072b1.f63972d;
        String entityId = c3072b1.f63973e;
        String shortcutType = c3072b1.f63974f;
        String label = c3072b1.f63975g;
        String adState = c3072b1.f63976h;
        String autosuggestion = c3072b1.f63977i;
        if ((i5 & EventBridgeChannel.QUEUE_CAPACITY) != 0) {
            num = c3072b1.f63978j;
        }
        Integer num2 = num;
        if ((i5 & 1024) != 0) {
            str = c3072b1.f63979k;
        }
        Intrinsics.g(packageName, "packageName");
        Intrinsics.g(containerType, "containerType");
        Intrinsics.g(entityType, "entityType");
        Intrinsics.g(entityId, "entityId");
        Intrinsics.g(shortcutType, "shortcutType");
        Intrinsics.g(label, "label");
        Intrinsics.g(adState, "adState");
        Intrinsics.g(autosuggestion, "autosuggestion");
        return new C3072b1(packageName, i11, containerType, entityType, entityId, shortcutType, label, adState, autosuggestion, num2, str);
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C3072b1)) {
            return false;
        }
        C3072b1 c3072b1 = (C3072b1) obj;
        return Intrinsics.b(this.f63969a, c3072b1.f63969a) && this.f63970b == c3072b1.f63970b && Intrinsics.b(this.f63971c, c3072b1.f63971c) && Intrinsics.b(this.f63972d, c3072b1.f63972d) && Intrinsics.b(this.f63973e, c3072b1.f63973e) && Intrinsics.b(this.f63974f, c3072b1.f63974f) && Intrinsics.b(this.f63975g, c3072b1.f63975g) && Intrinsics.b(this.f63976h, c3072b1.f63976h) && Intrinsics.b(this.f63977i, c3072b1.f63977i) && Intrinsics.b(this.f63978j, c3072b1.f63978j) && Intrinsics.b(this.f63979k, c3072b1.f63979k);
    }

    public final int hashCode() {
        int iA = C3248l8.a(this.f63977i, C3248l8.a(this.f63976h, C3248l8.a(this.f63975g, C3248l8.a(this.f63974f, C3248l8.a(this.f63973e, C3248l8.a(this.f63972d, C3248l8.a(this.f63971c, C3214j8.a(this.f63970b, this.f63969a.hashCode() * 31, 31), 31), 31), 31), 31), 31), 31), 31);
        Integer num = this.f63978j;
        int iHashCode = (iA + (num == null ? 0 : num.hashCode())) * 31;
        String str = this.f63979k;
        return iHashCode + (str != null ? str.hashCode() : 0);
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("AutoSuggestEntityAnalyticsData(packageName=");
        sb2.append(this.f63969a);
        sb2.append(", resultId=");
        sb2.append(this.f63970b);
        sb2.append(", containerType=");
        sb2.append(this.f63971c);
        sb2.append(", entityType=");
        sb2.append(this.f63972d);
        sb2.append(", entityId=");
        sb2.append(this.f63973e);
        sb2.append(", shortcutType=");
        sb2.append(this.f63974f);
        sb2.append(", label=");
        sb2.append(this.f63975g);
        sb2.append(", adState=");
        sb2.append(this.f63976h);
        sb2.append(", autosuggestion=");
        sb2.append(this.f63977i);
        sb2.append(", rank=");
        sb2.append(this.f63978j);
        sb2.append(", reason=");
        return h6.c1.t(sb2, this.f63979k, ')');
    }

    public C3072b1(@NotNull String packageName, int i5, @NotNull String containerType, @NotNull String entityType, @NotNull String entityId, @NotNull String shortcutType, @NotNull String label, @NotNull String adState, @NotNull String autosuggestion, @Nullable Integer num, @Nullable String str) {
        Intrinsics.g(packageName, "packageName");
        Intrinsics.g(containerType, "containerType");
        Intrinsics.g(entityType, "entityType");
        Intrinsics.g(entityId, "entityId");
        Intrinsics.g(shortcutType, "shortcutType");
        Intrinsics.g(label, "label");
        Intrinsics.g(adState, "adState");
        Intrinsics.g(autosuggestion, "autosuggestion");
        this.f63969a = packageName;
        this.f63970b = i5;
        this.f63971c = containerType;
        this.f63972d = entityType;
        this.f63973e = entityId;
        this.f63974f = shortcutType;
        this.f63975g = label;
        this.f63976h = adState;
        this.f63977i = autosuggestion;
        this.f63978j = num;
        this.f63979k = str;
    }
}
