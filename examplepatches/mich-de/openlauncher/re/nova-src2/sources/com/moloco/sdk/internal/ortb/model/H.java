package com.moloco.sdk.internal.ortb.model;

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
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\b\b\u0081\u0081\u0002\u0018\u0000 \u00042\b\u0012\u0004\u0012\u00020\u00000\u0001:\u0001\u0005B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003j\u0002\b\u0006j\u0002\b\u0007j\u0002\b\b¨\u0006\t"}, d2 = {"Lcom/moloco/sdk/internal/ortb/model/H;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Ljava/lang/String;I)V", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "a", "b", "c", "d", "moloco-sdk_release"}, k = 1, mv = {2, 0, 0})
@Serializable
/* loaded from: classes4.dex */
public final class H {

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final Lazy<KSerializer<Object>> f36694a;

    /* renamed from: b, reason: collision with root package name */
    @SerialName("top")
    public static final H f36695b = new H("Top", 0);

    /* renamed from: c, reason: collision with root package name */
    @SerialName("center")
    public static final H f36696c = new H("Center", 1);

    /* renamed from: d, reason: collision with root package name */
    @SerialName("bottom")
    public static final H f36697d = new H("Bottom", 2);

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ H[] f36698e;

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ EnumEntries f36699f;

    /* renamed from: com.moloco.sdk.internal.ortb.model.H$a, reason: from kotlin metadata */
    public static final class Companion {
        public Companion() {
        }

        public final /* synthetic */ KSerializer a() {
            return (KSerializer) H.f36694a.getValue();
        }

        @NotNull
        public final KSerializer<H> serializer() {
            return a();
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    static {
        H[] hArrA = a();
        f36698e = hArrA;
        f36699f = EnumEntriesKt.a(hArrA);
        INSTANCE = new Companion(null);
        f36694a = LazyKt.b(LazyThreadSafetyMode.f71680b, new com.instabridge.ai.tools.a(11));
    }

    public H(String str, int i5) {
    }

    public static final /* synthetic */ H[] a() {
        return new H[]{f36695b, f36696c, f36697d};
    }

    @NotNull
    public static EnumEntries<H> d() {
        return f36699f;
    }

    public static H valueOf(String str) {
        return (H) Enum.valueOf(H.class, str);
    }

    public static H[] values() {
        return (H[]) f36698e.clone();
    }
}
