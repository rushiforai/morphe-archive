package defpackage;

import com.medium.android.graphql.type.ParagraphType;
import com.medium.proto.obv.post.BlockLayout;
import com.medium.proto.obv.post.SyntaxHighlightMode;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract /* synthetic */ class m19 {
    public static final /* synthetic */ int[] a;
    public static final /* synthetic */ int[] b;
    public static final /* synthetic */ int[] c;
    public static final /* synthetic */ int[] d;

    static {
        int[] iArr = new int[ParagraphType.values().length];
        try {
            iArr[ParagraphType.P.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[ParagraphType.OLI.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[ParagraphType.H4.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            iArr[ParagraphType.MIXTAPE_EMBED.ordinal()] = 4;
        } catch (NoSuchFieldError unused4) {
        }
        try {
            iArr[ParagraphType.IFRAME.ordinal()] = 5;
        } catch (NoSuchFieldError unused5) {
        }
        try {
            iArr[ParagraphType.SECTION_CAPTION.ordinal()] = 6;
        } catch (NoSuchFieldError unused6) {
        }
        try {
            iArr[ParagraphType.H2.ordinal()] = 7;
        } catch (NoSuchFieldError unused7) {
        }
        try {
            iArr[ParagraphType.H3.ordinal()] = 8;
        } catch (NoSuchFieldError unused8) {
        }
        try {
            iArr[ParagraphType.IMG.ordinal()] = 9;
        } catch (NoSuchFieldError unused9) {
        }
        try {
            iArr[ParagraphType.HR.ordinal()] = 10;
        } catch (NoSuchFieldError unused10) {
        }
        try {
            iArr[ParagraphType.BQ.ordinal()] = 11;
        } catch (NoSuchFieldError unused11) {
        }
        try {
            iArr[ParagraphType.PQ.ordinal()] = 12;
        } catch (NoSuchFieldError unused12) {
        }
        try {
            iArr[ParagraphType.PRE.ordinal()] = 13;
        } catch (NoSuchFieldError unused13) {
        }
        try {
            iArr[ParagraphType.ULI.ordinal()] = 14;
        } catch (NoSuchFieldError unused14) {
        }
        try {
            iArr[ParagraphType.H1.ordinal()] = 15;
        } catch (NoSuchFieldError unused15) {
        }
        a = iArr;
        int[] iArr2 = new int[SyntaxHighlightMode.values().length];
        try {
            iArr2[SyntaxHighlightMode.AUTO.ordinal()] = 1;
        } catch (NoSuchFieldError unused16) {
        }
        try {
            iArr2[SyntaxHighlightMode.EXPLICIT.ordinal()] = 2;
        } catch (NoSuchFieldError unused17) {
        }
        b = iArr2;
        int[] iArr3 = new int[BlockLayout.values().length];
        try {
            iArr3[BlockLayout.INSET_CENTER.ordinal()] = 1;
        } catch (NoSuchFieldError unused18) {
        }
        try {
            iArr3[BlockLayout.INSET_LEFT.ordinal()] = 2;
        } catch (NoSuchFieldError unused19) {
        }
        try {
            iArr3[BlockLayout.OUTSET_CENTER.ordinal()] = 3;
        } catch (NoSuchFieldError unused20) {
        }
        try {
            iArr3[BlockLayout.OUTSET_LEFT.ordinal()] = 4;
        } catch (NoSuchFieldError unused21) {
        }
        try {
            iArr3[BlockLayout.FULL_WIDTH.ordinal()] = 5;
        } catch (NoSuchFieldError unused22) {
        }
        try {
            iArr3[BlockLayout.OUTSET_ROW.ordinal()] = 6;
        } catch (NoSuchFieldError unused23) {
        }
        try {
            iArr3[BlockLayout.OUTSET_ROW_CONTINUE.ordinal()] = 7;
        } catch (NoSuchFieldError unused24) {
        }
        try {
            iArr3[BlockLayout.FULL_WIDTH_CROPPED_COVER.ordinal()] = 8;
        } catch (NoSuchFieldError unused25) {
        }
        try {
            iArr3[BlockLayout.CONSTRAINED_HEIGHT_PREVIEW.ordinal()] = 9;
        } catch (NoSuchFieldError unused26) {
        }
        try {
            iArr3[BlockLayout.CROPPED_HEIGHT_PREVIEW.ordinal()] = 10;
        } catch (NoSuchFieldError unused27) {
        }
        try {
            iArr3[BlockLayout.INSET_CENTER_SMALL.ordinal()] = 11;
        } catch (NoSuchFieldError unused28) {
        }
        try {
            iArr3[BlockLayout.INSET_RIGHT.ordinal()] = 12;
        } catch (NoSuchFieldError unused29) {
        }
        c = iArr3;
        int[] iArr4 = new int[com.medium.proto.obv.post.ParagraphType.values().length];
        try {
            iArr4[com.medium.proto.obv.post.ParagraphType.P.ordinal()] = 1;
        } catch (NoSuchFieldError unused30) {
        }
        try {
            iArr4[com.medium.proto.obv.post.ParagraphType.H2.ordinal()] = 2;
        } catch (NoSuchFieldError unused31) {
        }
        try {
            iArr4[com.medium.proto.obv.post.ParagraphType.H3.ordinal()] = 3;
        } catch (NoSuchFieldError unused32) {
        }
        try {
            iArr4[com.medium.proto.obv.post.ParagraphType.IMG.ordinal()] = 4;
        } catch (NoSuchFieldError unused33) {
        }
        try {
            iArr4[com.medium.proto.obv.post.ParagraphType.HR.ordinal()] = 5;
        } catch (NoSuchFieldError unused34) {
        }
        try {
            iArr4[com.medium.proto.obv.post.ParagraphType.BQ.ordinal()] = 6;
        } catch (NoSuchFieldError unused35) {
        }
        try {
            iArr4[com.medium.proto.obv.post.ParagraphType.PQ.ordinal()] = 7;
        } catch (NoSuchFieldError unused36) {
        }
        try {
            iArr4[com.medium.proto.obv.post.ParagraphType.PRE.ordinal()] = 8;
        } catch (NoSuchFieldError unused37) {
        }
        try {
            iArr4[com.medium.proto.obv.post.ParagraphType.ULI.ordinal()] = 9;
        } catch (NoSuchFieldError unused38) {
        }
        try {
            iArr4[com.medium.proto.obv.post.ParagraphType.OLI.ordinal()] = 10;
        } catch (NoSuchFieldError unused39) {
        }
        try {
            iArr4[com.medium.proto.obv.post.ParagraphType.IFRAME.ordinal()] = 11;
        } catch (NoSuchFieldError unused40) {
        }
        try {
            iArr4[com.medium.proto.obv.post.ParagraphType.H1.ordinal()] = 12;
        } catch (NoSuchFieldError unused41) {
        }
        try {
            iArr4[com.medium.proto.obv.post.ParagraphType.H4.ordinal()] = 13;
        } catch (NoSuchFieldError unused42) {
        }
        try {
            iArr4[com.medium.proto.obv.post.ParagraphType.MIXTAPE_EMBED.ordinal()] = 14;
        } catch (NoSuchFieldError unused43) {
        }
        try {
            iArr4[com.medium.proto.obv.post.ParagraphType.SECTION_CAPTION.ordinal()] = 15;
        } catch (NoSuchFieldError unused44) {
        }
        try {
            iArr4[com.medium.proto.obv.post.ParagraphType.COVER_TITLE.ordinal()] = 16;
        } catch (NoSuchFieldError unused45) {
        }
        d = iArr4;
    }
}
