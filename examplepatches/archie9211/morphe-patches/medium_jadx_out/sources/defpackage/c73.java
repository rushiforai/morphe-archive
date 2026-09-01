package defpackage;

import com.medium.proto.obv.post.DeltaType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract /* synthetic */ class c73 {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[DeltaType.values().length];
        try {
            iArr[DeltaType.INSERT_PARAGRAPH_AT.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[DeltaType.REMOVE_PARAGRAPH_AT.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[DeltaType.UPDATE_PARAGRAPH_AT.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            iArr[DeltaType.UPDATE_TITLE.ordinal()] = 4;
        } catch (NoSuchFieldError unused4) {
        }
        try {
            iArr[DeltaType.UPDATE_SUBTITLE.ordinal()] = 5;
        } catch (NoSuchFieldError unused5) {
        }
        try {
            iArr[DeltaType.UPDATE_META_DESCRIPTION.ordinal()] = 6;
        } catch (NoSuchFieldError unused6) {
        }
        try {
            iArr[DeltaType.UPDATE_IMAGE.ordinal()] = 7;
        } catch (NoSuchFieldError unused7) {
        }
        try {
            iArr[DeltaType.UPDATE_PREVIEW_IMAGE.ordinal()] = 8;
        } catch (NoSuchFieldError unused8) {
        }
        try {
            iArr[DeltaType.UPDATE_CAPTION.ordinal()] = 9;
        } catch (NoSuchFieldError unused9) {
        }
        try {
            iArr[DeltaType.INSERT_SECTION_AT.ordinal()] = 10;
        } catch (NoSuchFieldError unused10) {
        }
        try {
            iArr[DeltaType.REMOVE_SECTION_AT.ordinal()] = 11;
        } catch (NoSuchFieldError unused11) {
        }
        try {
            iArr[DeltaType.UPDATE_SECTION_AT.ordinal()] = 12;
        } catch (NoSuchFieldError unused12) {
        }
        try {
            iArr[DeltaType.UPDATE_POST_DISPLAY.ordinal()] = 13;
        } catch (NoSuchFieldError unused13) {
        }
        try {
            iArr[DeltaType.UPDATE_SELECTION.ordinal()] = 14;
        } catch (NoSuchFieldError unused14) {
        }
        try {
            iArr[DeltaType.REVERT.ordinal()] = 15;
        } catch (NoSuchFieldError unused15) {
        }
        try {
            iArr[DeltaType.PUBLISH.ordinal()] = 16;
        } catch (NoSuchFieldError unused16) {
        }
        try {
            iArr[DeltaType.CLONE.ordinal()] = 17;
        } catch (NoSuchFieldError unused17) {
        }
        try {
            iArr[DeltaType.TRANSLATE.ordinal()] = 18;
        } catch (NoSuchFieldError unused18) {
        }
        try {
            iArr[DeltaType.THROTTLE.ordinal()] = 19;
        } catch (NoSuchFieldError unused19) {
        }
        try {
            iArr[DeltaType.PREDEFINED.ordinal()] = 20;
        } catch (NoSuchFieldError unused20) {
        }
        try {
            iArr[DeltaType.FAILURE.ordinal()] = 21;
        } catch (NoSuchFieldError unused21) {
        }
        a = iArr;
    }
}
