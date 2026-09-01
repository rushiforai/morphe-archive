package defpackage;

import com.medium.android.graphql.type.LayoutType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract /* synthetic */ class nf9 {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[LayoutType.values().length];
        try {
            iArr[LayoutType.INSET_CENTER.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[LayoutType.INSET_LEFT.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[LayoutType.OUTSET_CENTER.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            iArr[LayoutType.OUTSET_LEFT.ordinal()] = 4;
        } catch (NoSuchFieldError unused4) {
        }
        try {
            iArr[LayoutType.FULL_WIDTH.ordinal()] = 5;
        } catch (NoSuchFieldError unused5) {
        }
        try {
            iArr[LayoutType.OUTSET_ROW.ordinal()] = 6;
        } catch (NoSuchFieldError unused6) {
        }
        try {
            iArr[LayoutType.OUTSET_ROW_CONTINUE.ordinal()] = 7;
        } catch (NoSuchFieldError unused7) {
        }
        try {
            iArr[LayoutType.FULL_WIDTH_CROPPED_COVER.ordinal()] = 8;
        } catch (NoSuchFieldError unused8) {
        }
        try {
            iArr[LayoutType.CONSTRAINED_HEIGHT_PREVIEW.ordinal()] = 9;
        } catch (NoSuchFieldError unused9) {
        }
        try {
            iArr[LayoutType.CROPPED_HEIGHT_PREVIEW.ordinal()] = 10;
        } catch (NoSuchFieldError unused10) {
        }
        try {
            iArr[LayoutType.INSET_CENTER_SMALL.ordinal()] = 11;
        } catch (NoSuchFieldError unused11) {
        }
        try {
            iArr[LayoutType.INSET_RIGHT.ordinal()] = 12;
        } catch (NoSuchFieldError unused12) {
        }
        try {
            iArr[LayoutType.UNKNOWN__.ordinal()] = 13;
        } catch (NoSuchFieldError unused13) {
        }
        a = iArr;
    }
}
