package com.moloco.sdk.publisher;

import java.util.Locale;
import kotlin.Metadata;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text._OneToManyTitlecaseMappingsKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\n\n\u0002\u0010\u000e\n\u0002\b\u0002\b\u0086\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0006\u0010\u000b\u001a\u00020\fJ\u0006\u0010\r\u001a\u00020\fj\u0002\b\u0004j\u0002\b\u0005j\u0002\b\u0006j\u0002\b\u0007j\u0002\b\bj\u0002\b\tj\u0002\b\n¨\u0006\u000e"}, d2 = {"Lcom/moloco/sdk/publisher/AdFormatType;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Ljava/lang/String;I)V", "BANNER", "INTERSTITIAL", "REWARDED", "MREC", "NATIVE", "INLINE_ADAPTIVE_BANNER", "ANCHORED_ADAPTIVE_BANNER", "toLowercase", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toTitlecase", "moloco-sdk_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class AdFormatType {
    private static final /* synthetic */ EnumEntries $ENTRIES;
    private static final /* synthetic */ AdFormatType[] $VALUES;
    public static final AdFormatType BANNER = new AdFormatType("BANNER", 0);
    public static final AdFormatType INTERSTITIAL = new AdFormatType("INTERSTITIAL", 1);
    public static final AdFormatType REWARDED = new AdFormatType("REWARDED", 2);
    public static final AdFormatType MREC = new AdFormatType("MREC", 3);
    public static final AdFormatType NATIVE = new AdFormatType("NATIVE", 4);
    public static final AdFormatType INLINE_ADAPTIVE_BANNER = new AdFormatType("INLINE_ADAPTIVE_BANNER", 5);
    public static final AdFormatType ANCHORED_ADAPTIVE_BANNER = new AdFormatType("ANCHORED_ADAPTIVE_BANNER", 6);

    private static final /* synthetic */ AdFormatType[] $values() {
        return new AdFormatType[]{BANNER, INTERSTITIAL, REWARDED, MREC, NATIVE, INLINE_ADAPTIVE_BANNER, ANCHORED_ADAPTIVE_BANNER};
    }

    static {
        AdFormatType[] adFormatTypeArr$values = $values();
        $VALUES = adFormatTypeArr$values;
        $ENTRIES = EnumEntriesKt.a(adFormatTypeArr$values);
    }

    private AdFormatType(String str, int i5) {
    }

    @NotNull
    public static EnumEntries<AdFormatType> getEntries() {
        return $ENTRIES;
    }

    public static AdFormatType valueOf(String str) {
        return (AdFormatType) Enum.valueOf(AdFormatType.class, str);
    }

    public static AdFormatType[] values() {
        return (AdFormatType[]) $VALUES.clone();
    }

    @NotNull
    public final String toLowercase() {
        String lowerCase = toString().toLowerCase(Locale.ROOT);
        Intrinsics.f(lowerCase, "toLowerCase(...)");
        return lowerCase;
    }

    @NotNull
    public final String toTitlecase() {
        String lowercase = toLowercase();
        if (lowercase.length() <= 0) {
            return lowercase;
        }
        StringBuilder sb2 = new StringBuilder();
        char cCharAt = lowercase.charAt(0);
        sb2.append((Object) (Character.isLowerCase(cCharAt) ? _OneToManyTitlecaseMappingsKt.a(cCharAt) : String.valueOf(cCharAt)));
        String strSubstring = lowercase.substring(1);
        Intrinsics.f(strSubstring, "substring(...)");
        sb2.append(strSubstring);
        return sb2.toString();
    }
}
