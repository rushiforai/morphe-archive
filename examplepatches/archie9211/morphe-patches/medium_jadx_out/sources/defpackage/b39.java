package defpackage;

import com.medium.proto.obv.post.ParagraphType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class b39 {
    public static final /* synthetic */ int[] a;
    public static final /* synthetic */ int[] b;

    static {
        int[] iArr = new int[ParagraphType.values().length];
        try {
            iArr[ParagraphType.ULI.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[ParagraphType.OLI.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[ParagraphType.PRE.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            iArr[ParagraphType.MIXTAPE_EMBED.ordinal()] = 4;
        } catch (NoSuchFieldError unused4) {
        }
        try {
            iArr[ParagraphType.P.ordinal()] = 5;
        } catch (NoSuchFieldError unused5) {
        }
        try {
            iArr[ParagraphType.IFRAME.ordinal()] = 6;
        } catch (NoSuchFieldError unused6) {
        }
        try {
            iArr[ParagraphType.H1.ordinal()] = 7;
        } catch (NoSuchFieldError unused7) {
        }
        try {
            iArr[ParagraphType.H4.ordinal()] = 8;
        } catch (NoSuchFieldError unused8) {
        }
        try {
            iArr[ParagraphType.SECTION_CAPTION.ordinal()] = 9;
        } catch (NoSuchFieldError unused9) {
        }
        try {
            iArr[ParagraphType.COVER_TITLE.ordinal()] = 10;
        } catch (NoSuchFieldError unused10) {
        }
        try {
            iArr[ParagraphType.H2.ordinal()] = 11;
        } catch (NoSuchFieldError unused11) {
        }
        try {
            iArr[ParagraphType.H3.ordinal()] = 12;
        } catch (NoSuchFieldError unused12) {
        }
        try {
            iArr[ParagraphType.IMG.ordinal()] = 13;
        } catch (NoSuchFieldError unused13) {
        }
        try {
            iArr[ParagraphType.HR.ordinal()] = 14;
        } catch (NoSuchFieldError unused14) {
        }
        try {
            iArr[ParagraphType.BQ.ordinal()] = 15;
        } catch (NoSuchFieldError unused15) {
        }
        try {
            iArr[ParagraphType.PQ.ordinal()] = 16;
        } catch (NoSuchFieldError unused16) {
        }
        a = iArr;
        int[] iArr2 = new int[u29.values().length];
        try {
            iArr2[u29.VIEW.ordinal()] = 1;
        } catch (NoSuchFieldError unused17) {
        }
        try {
            iArr2[u29.EDIT.ordinal()] = 2;
        } catch (NoSuchFieldError unused18) {
        }
        b = iArr2;
    }
}
