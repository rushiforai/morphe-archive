package defpackage;

import com.medium.proto.obv.post.MarkupType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract /* synthetic */ class ri7 {
    public static final /* synthetic */ int[] a;
    public static final /* synthetic */ int[] b;

    static {
        int[] iArr = new int[MarkupType.values().length];
        try {
            iArr[MarkupType.STRONG.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[MarkupType.A.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[MarkupType.EM.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            iArr[MarkupType.HIGHLIGHT.ordinal()] = 4;
        } catch (NoSuchFieldError unused4) {
        }
        try {
            iArr[MarkupType.WARNING.ordinal()] = 5;
        } catch (NoSuchFieldError unused5) {
        }
        try {
            iArr[MarkupType.COMMENT.ordinal()] = 6;
        } catch (NoSuchFieldError unused6) {
        }
        try {
            iArr[MarkupType.QUOTE.ordinal()] = 7;
        } catch (NoSuchFieldError unused7) {
        }
        try {
            iArr[MarkupType.SENTENCE_DEPRECATED.ordinal()] = 8;
        } catch (NoSuchFieldError unused8) {
        }
        try {
            iArr[MarkupType.QUERY.ordinal()] = 9;
        } catch (NoSuchFieldError unused9) {
        }
        try {
            iArr[MarkupType.CODE.ordinal()] = 10;
        } catch (NoSuchFieldError unused10) {
        }
        try {
            iArr[MarkupType.UNUSED_DETAIL.ordinal()] = 11;
        } catch (NoSuchFieldError unused11) {
        }
        a = iArr;
        int[] iArr2 = new int[com.medium.android.graphql.type.MarkupType.values().length];
        try {
            iArr2[com.medium.android.graphql.type.MarkupType.STRONG.ordinal()] = 1;
        } catch (NoSuchFieldError unused12) {
        }
        try {
            iArr2[com.medium.android.graphql.type.MarkupType.A.ordinal()] = 2;
        } catch (NoSuchFieldError unused13) {
        }
        try {
            iArr2[com.medium.android.graphql.type.MarkupType.EM.ordinal()] = 3;
        } catch (NoSuchFieldError unused14) {
        }
        try {
            iArr2[com.medium.android.graphql.type.MarkupType.HIGHLIGHT.ordinal()] = 4;
        } catch (NoSuchFieldError unused15) {
        }
        try {
            iArr2[com.medium.android.graphql.type.MarkupType.WARNING.ordinal()] = 5;
        } catch (NoSuchFieldError unused16) {
        }
        try {
            iArr2[com.medium.android.graphql.type.MarkupType.COMMENT.ordinal()] = 6;
        } catch (NoSuchFieldError unused17) {
        }
        try {
            iArr2[com.medium.android.graphql.type.MarkupType.QUOTE.ordinal()] = 7;
        } catch (NoSuchFieldError unused18) {
        }
        try {
            iArr2[com.medium.android.graphql.type.MarkupType.SENTENCE_DEPRECATED.ordinal()] = 8;
        } catch (NoSuchFieldError unused19) {
        }
        try {
            iArr2[com.medium.android.graphql.type.MarkupType.QUERY.ordinal()] = 9;
        } catch (NoSuchFieldError unused20) {
        }
        try {
            iArr2[com.medium.android.graphql.type.MarkupType.CODE.ordinal()] = 10;
        } catch (NoSuchFieldError unused21) {
        }
        try {
            iArr2[com.medium.android.graphql.type.MarkupType.UNUSED_DETAIL.ordinal()] = 11;
        } catch (NoSuchFieldError unused22) {
        }
        try {
            iArr2[com.medium.android.graphql.type.MarkupType.UNKNOWN__.ordinal()] = 12;
        } catch (NoSuchFieldError unused23) {
        }
        b = iArr2;
    }
}
