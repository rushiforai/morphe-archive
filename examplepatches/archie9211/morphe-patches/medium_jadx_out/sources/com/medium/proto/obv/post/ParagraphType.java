package com.medium.proto.obv.post;

import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireEnum;
import defpackage.g04;
import defpackage.h39;
import defpackage.i04;
import defpackage.n1b;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\b\n\u0002\b\u0019\b\u0086\u0081\u0002\u0018\u0000 \n2\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002:\u0001\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006R\u001a\u0010\u0004\u001a\u00020\u00038\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u0007\u001a\u0004\b\b\u0010\tj\u0002\b\fj\u0002\b\rj\u0002\b\u000ej\u0002\b\u000fj\u0002\b\u0010j\u0002\b\u0011j\u0002\b\u0012j\u0002\b\u0013j\u0002\b\u0014j\u0002\b\u0015j\u0002\b\u0016j\u0002\b\u0017j\u0002\b\u0018j\u0002\b\u0019j\u0002\b\u001aj\u0002\b\u001b¨\u0006\u001c"}, d2 = {"Lcom/medium/proto/obv/post/ParagraphType;", "Lcom/squareup/wire/WireEnum;", "", "", "value", "<init>", "(Ljava/lang/String;II)V", "I", "getValue", "()I", "Companion", "h39", "P", "H2", "H3", "IMG", "HR", "BQ", "PQ", "PRE", "ULI", "OLI", "IFRAME", "H1", "H4", "MIXTAPE_EMBED", "SECTION_CAPTION", "COVER_TITLE", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class ParagraphType implements WireEnum {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ ParagraphType[] $VALUES;
    public static final ProtoAdapter<ParagraphType> ADAPTER;
    public static final h39 Companion;
    private final int value;
    public static final ParagraphType P = new ParagraphType("P", 0, 1);
    public static final ParagraphType H2 = new ParagraphType("H2", 1, 2);
    public static final ParagraphType H3 = new ParagraphType("H3", 2, 3);
    public static final ParagraphType IMG = new ParagraphType("IMG", 3, 4);
    public static final ParagraphType HR = new ParagraphType("HR", 4, 5);
    public static final ParagraphType BQ = new ParagraphType("BQ", 5, 6);
    public static final ParagraphType PQ = new ParagraphType("PQ", 6, 7);
    public static final ParagraphType PRE = new ParagraphType("PRE", 7, 8);
    public static final ParagraphType ULI = new ParagraphType("ULI", 8, 9);
    public static final ParagraphType OLI = new ParagraphType("OLI", 9, 10);
    public static final ParagraphType IFRAME = new ParagraphType("IFRAME", 10, 11);
    public static final ParagraphType H1 = new ParagraphType("H1", 11, 12);
    public static final ParagraphType H4 = new ParagraphType("H4", 12, 13);
    public static final ParagraphType MIXTAPE_EMBED = new ParagraphType("MIXTAPE_EMBED", 13, 14);
    public static final ParagraphType SECTION_CAPTION = new ParagraphType("SECTION_CAPTION", 14, 15);
    public static final ParagraphType COVER_TITLE = new ParagraphType("COVER_TITLE", 15, 16);

    private static final /* synthetic */ ParagraphType[] $values() {
        return new ParagraphType[]{P, H2, H3, IMG, HR, BQ, PQ, PRE, ULI, OLI, IFRAME, H1, H4, MIXTAPE_EMBED, SECTION_CAPTION, COVER_TITLE};
    }

    static {
        ParagraphType[] paragraphTypeArr$values = $values();
        $VALUES = paragraphTypeArr$values;
        $ENTRIES = new i04(paragraphTypeArr$values);
        Companion = new h39();
        ADAPTER = new ParagraphType$Companion$ADAPTER$1(n1b.a.b(ParagraphType.class), Syntax.PROTO_2, null);
    }

    private ParagraphType(String str, int i, int i2) {
        this.value = i2;
    }

    public static final ParagraphType fromValue(int i) {
        Companion.getClass();
        return h39.a(i);
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static ParagraphType valueOf(String str) {
        return (ParagraphType) Enum.valueOf(ParagraphType.class, str);
    }

    public static ParagraphType[] values() {
        return (ParagraphType[]) $VALUES.clone();
    }

    @Override // com.squareup.wire.WireEnum
    public int getValue() {
        return this.value;
    }
}
