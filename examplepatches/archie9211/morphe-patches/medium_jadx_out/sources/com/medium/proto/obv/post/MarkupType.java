package com.medium.proto.obv.post;

import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireEnum;
import defpackage.g04;
import defpackage.i04;
import defpackage.n1b;
import defpackage.qi7;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\b\n\u0002\b\u0014\b\u0086\u0081\u0002\u0018\u0000 \n2\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002:\u0001\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006R\u001a\u0010\u0004\u001a\u00020\u00038\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u0007\u001a\u0004\b\b\u0010\tj\u0002\b\fj\u0002\b\rj\u0002\b\u000ej\u0002\b\u000fj\u0002\b\u0010j\u0002\b\u0011j\u0002\b\u0012j\u0002\b\u0013j\u0002\b\u0014j\u0002\b\u0015j\u0002\b\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/proto/obv/post/MarkupType;", "Lcom/squareup/wire/WireEnum;", "", "", "value", "<init>", "(Ljava/lang/String;II)V", "I", "getValue", "()I", "Companion", "qi7", "STRONG", "EM", "A", "HIGHLIGHT", "WARNING", "COMMENT", "QUOTE", "SENTENCE_DEPRECATED", "QUERY", "CODE", "UNUSED_DETAIL", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class MarkupType implements WireEnum {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ MarkupType[] $VALUES;
    public static final ProtoAdapter<MarkupType> ADAPTER;
    public static final qi7 Companion;
    private final int value;
    public static final MarkupType STRONG = new MarkupType("STRONG", 0, 1);
    public static final MarkupType EM = new MarkupType("EM", 1, 2);
    public static final MarkupType A = new MarkupType("A", 2, 3);
    public static final MarkupType HIGHLIGHT = new MarkupType("HIGHLIGHT", 3, 4);
    public static final MarkupType WARNING = new MarkupType("WARNING", 4, 5);
    public static final MarkupType COMMENT = new MarkupType("COMMENT", 5, 6);
    public static final MarkupType QUOTE = new MarkupType("QUOTE", 6, 7);
    public static final MarkupType SENTENCE_DEPRECATED = new MarkupType("SENTENCE_DEPRECATED", 7, 8);
    public static final MarkupType QUERY = new MarkupType("QUERY", 8, 9);
    public static final MarkupType CODE = new MarkupType("CODE", 9, 10);
    public static final MarkupType UNUSED_DETAIL = new MarkupType("UNUSED_DETAIL", 10, 11);

    private static final /* synthetic */ MarkupType[] $values() {
        return new MarkupType[]{STRONG, EM, A, HIGHLIGHT, WARNING, COMMENT, QUOTE, SENTENCE_DEPRECATED, QUERY, CODE, UNUSED_DETAIL};
    }

    static {
        MarkupType[] markupTypeArr$values = $values();
        $VALUES = markupTypeArr$values;
        $ENTRIES = new i04(markupTypeArr$values);
        Companion = new qi7();
        ADAPTER = new MarkupType$Companion$ADAPTER$1(n1b.a.b(MarkupType.class), Syntax.PROTO_2, null);
    }

    private MarkupType(String str, int i, int i2) {
        this.value = i2;
    }

    public static final MarkupType fromValue(int i) {
        Companion.getClass();
        return qi7.a(i);
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

    @Override // com.squareup.wire.WireEnum
    public int getValue() {
        return this.value;
    }
}
