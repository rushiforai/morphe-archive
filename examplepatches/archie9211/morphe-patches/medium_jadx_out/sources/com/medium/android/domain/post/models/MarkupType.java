package com.medium.android.domain.post.models;

import com.drew.imaging.raf.yvq.AXoTRPEGKEve;
import defpackage.g04;
import defpackage.rv8;
import kotlin.Metadata;
import pushnotifications.SY.eoLmc;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\u000e\b\u0087\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003j\u0002\b\u0004j\u0002\b\u0005j\u0002\b\u0006j\u0002\b\u0007j\u0002\b\bj\u0002\b\tj\u0002\b\nj\u0002\b\u000bj\u0002\b\fj\u0002\b\rj\u0002\b\u000e¨\u0006\u000f"}, d2 = {"Lcom/medium/android/domain/post/models/MarkupType;", "", "<init>", "(Ljava/lang/String;I)V", "STRONG", "EM", "A", "HIGHLIGHT", "WARNING", "COMMENT", "QUOTE", "SENTENCE_DEPRECATED", "QUERY", "CODE", "UNUSED_DETAIL", "domain_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class MarkupType {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ MarkupType[] $VALUES;
    public static final MarkupType STRONG = new MarkupType(AXoTRPEGKEve.qVCsIoC, 0);
    public static final MarkupType EM = new MarkupType("EM", 1);
    public static final MarkupType A = new MarkupType("A", 2);
    public static final MarkupType HIGHLIGHT = new MarkupType("HIGHLIGHT", 3);
    public static final MarkupType WARNING = new MarkupType(eoLmc.QzVOVqvFOz, 4);
    public static final MarkupType COMMENT = new MarkupType("COMMENT", 5);
    public static final MarkupType QUOTE = new MarkupType("QUOTE", 6);
    public static final MarkupType SENTENCE_DEPRECATED = new MarkupType("SENTENCE_DEPRECATED", 7);
    public static final MarkupType QUERY = new MarkupType("QUERY", 8);
    public static final MarkupType CODE = new MarkupType("CODE", 9);
    public static final MarkupType UNUSED_DETAIL = new MarkupType("UNUSED_DETAIL", 10);

    private static final /* synthetic */ MarkupType[] $values() {
        return new MarkupType[]{STRONG, EM, A, HIGHLIGHT, WARNING, COMMENT, QUOTE, SENTENCE_DEPRECATED, QUERY, CODE, UNUSED_DETAIL};
    }

    private MarkupType(String str, int i) {
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static MarkupType valueOf(String str) {
        return (MarkupType) Enum.valueOf(MarkupType.class, str);
    }

    public static MarkupType[] values() {
        return (MarkupType[]) $VALUES.clone();
    }

    static {
        MarkupType[] markupTypeArr$values = $values();
        $VALUES = markupTypeArr$values;
        $ENTRIES = rv8.x(markupTypeArr$values);
    }
}
