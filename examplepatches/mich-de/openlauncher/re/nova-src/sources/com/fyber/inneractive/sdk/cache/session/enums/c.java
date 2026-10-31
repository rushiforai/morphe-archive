package com.fyber.inneractive.sdk.cache.session.enums;

import com.fyber.inneractive.sdk.config.enums.UnitDisplayType;

/* JADX WARN: Enum visitor error
jadx.core.utils.exceptions.JadxRuntimeException: Init of enum field 'REWARDED_VIDEO' uses external variables
	at jadx.core.dex.visitors.EnumVisitor.createEnumFieldByConstructor(EnumVisitor.java:451)
	at jadx.core.dex.visitors.EnumVisitor.processEnumFieldByRegister(EnumVisitor.java:395)
	at jadx.core.dex.visitors.EnumVisitor.extractEnumFieldsFromFilledArray(EnumVisitor.java:324)
	at jadx.core.dex.visitors.EnumVisitor.extractEnumFieldsFromInsn(EnumVisitor.java:262)
	at jadx.core.dex.visitors.EnumVisitor.convertToEnum(EnumVisitor.java:151)
	at jadx.core.dex.visitors.EnumVisitor.visit(EnumVisitor.java:100)
 */
/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* loaded from: classes.dex */
public final class c {
    private static final /* synthetic */ c[] $VALUES;
    public static final c BANNER_DISPLAY;
    public static final c INTERSTITIAL_DISPLAY;
    public static final c INTERSTITIAL_VIDEO;
    public static final c NONE;
    public static final c RECTANGLE_DISPLAY;
    public static final c REWARDED_DISPLAY;
    public static final c REWARDED_VIDEO;
    private boolean mShouldCountCompletion;
    private UnitDisplayType mType;

    static {
        UnitDisplayType unitDisplayType = UnitDisplayType.REWARDED;
        c cVar = new c("REWARDED_VIDEO", 0, unitDisplayType, true);
        REWARDED_VIDEO = cVar;
        UnitDisplayType unitDisplayType2 = UnitDisplayType.INTERSTITIAL;
        c cVar2 = new c("INTERSTITIAL_VIDEO", 1, unitDisplayType2, true);
        INTERSTITIAL_VIDEO = cVar2;
        c cVar3 = new c("RECTANGLE_DISPLAY", 2, UnitDisplayType.MRECT, false);
        RECTANGLE_DISPLAY = cVar3;
        c cVar4 = new c("REWARDED_DISPLAY", 3, unitDisplayType, true);
        REWARDED_DISPLAY = cVar4;
        c cVar5 = new c("BANNER_DISPLAY", 4, UnitDisplayType.BANNER, false);
        BANNER_DISPLAY = cVar5;
        c cVar6 = new c("INTERSTITIAL_DISPLAY", 5, unitDisplayType2, false);
        INTERSTITIAL_DISPLAY = cVar6;
        c cVar7 = new c("NONE", 6, UnitDisplayType.DEFAULT, false);
        NONE = cVar7;
        $VALUES = new c[]{cVar, cVar2, cVar3, cVar4, cVar5, cVar6, cVar7};
    }

    public c(String str, int i5, UnitDisplayType unitDisplayType, boolean z11) {
        this.mType = unitDisplayType;
        this.mShouldCountCompletion = z11;
    }

    public static c a(String str, String str2) {
        int i5 = b.f27689a[UnitDisplayType.fromValue(str).ordinal()];
        if (i5 == 1) {
            return str2.contains("video") ? REWARDED_VIDEO : REWARDED_DISPLAY;
        }
        if (i5 == 2) {
            return RECTANGLE_DISPLAY;
        }
        if (i5 == 3) {
            return BANNER_DISPLAY;
        }
        if (i5 != 4) {
            return null;
        }
        return str2.contains("video") ? INTERSTITIAL_VIDEO : INTERSTITIAL_DISPLAY;
    }

    public static c valueOf(String str) {
        return (c) Enum.valueOf(c.class, str);
    }

    public static c[] values() {
        return (c[]) $VALUES.clone();
    }

    public final boolean b() {
        return this.mShouldCountCompletion;
    }

    public final UnitDisplayType a() {
        return this.mType;
    }
}
