package com.moloco.sdk.internal.ortb.model;

import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.LazyThreadSafetyMode;
import kotlin.Metadata;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.SerialName;
import kotlinx.serialization.Serializable;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\n\b\u0081\u0081\u0002\u0018\u0000 \u00042\b\u0012\u0004\u0012\u00020\u00000\u0001:\u0001\u0005B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003j\u0002\b\u0006j\u0002\b\u0007j\u0002\b\bj\u0002\b\tj\u0002\b\n¨\u0006\u000b"}, d2 = {"Lcom/moloco/sdk/internal/ortb/model/w;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Ljava/lang/String;I)V", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "a", "b", "c", "d", "e", InneractiveMediationDefs.GENDER_FEMALE, "moloco-sdk_release"}, k = 1, mv = {2, 0, 0})
@Serializable
/* loaded from: classes4.dex */
public final class w {

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final Lazy<KSerializer<Object>> f36846a;

    /* renamed from: b, reason: collision with root package name */
    @SerialName("start")
    public static final w f36847b = new w("Start", 0);

    /* renamed from: c, reason: collision with root package name */
    @SerialName("center")
    public static final w f36848c = new w("Center", 1);

    /* renamed from: d, reason: collision with root package name */
    @SerialName("end")
    public static final w f36849d = new w("End", 2);

    /* renamed from: e, reason: collision with root package name */
    @SerialName("left")
    public static final w f36850e = new w("Left", 3);

    /* renamed from: f, reason: collision with root package name */
    @SerialName("right")
    public static final w f36851f = new w("Right", 4);

    /* renamed from: g, reason: collision with root package name */
    public static final /* synthetic */ w[] f36852g;

    /* renamed from: h, reason: collision with root package name */
    public static final /* synthetic */ EnumEntries f36853h;

    /* renamed from: com.moloco.sdk.internal.ortb.model.w$a, reason: from kotlin metadata */
    public static final class Companion {
        public Companion() {
        }

        public final /* synthetic */ KSerializer a() {
            return (KSerializer) w.f36846a.getValue();
        }

        @NotNull
        public final KSerializer<w> serializer() {
            return a();
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    static {
        w[] wVarArrA = a();
        f36852g = wVarArrA;
        f36853h = EnumEntriesKt.a(wVarArrA);
        INSTANCE = new Companion(null);
        f36846a = LazyKt.b(LazyThreadSafetyMode.f71680b, new com.instabridge.ai.tools.a(12));
    }

    public w(String str, int i5) {
    }

    public static final /* synthetic */ w[] a() {
        return new w[]{f36847b, f36848c, f36849d, f36850e, f36851f};
    }

    @NotNull
    public static EnumEntries<w> d() {
        return f36853h;
    }

    public static w valueOf(String str) {
        return (w) Enum.valueOf(w.class, str);
    }

    public static w[] values() {
        return (w[]) f36852g.clone();
    }
}
