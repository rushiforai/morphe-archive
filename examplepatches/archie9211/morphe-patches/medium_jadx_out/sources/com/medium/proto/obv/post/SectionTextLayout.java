package com.medium.proto.obv.post;

import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireEnum;
import defpackage.g04;
import defpackage.i04;
import defpackage.kvb;
import defpackage.n1b;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\b\n\u0002\b\u0010\b\u0086\u0081\u0002\u0018\u0000 \n2\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002:\u0001\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006R\u001a\u0010\u0004\u001a\u00020\u00038\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u0007\u001a\u0004\b\b\u0010\tj\u0002\b\fj\u0002\b\rj\u0002\b\u000ej\u0002\b\u000fj\u0002\b\u0010j\u0002\b\u0011j\u0002\b\u0012¨\u0006\u0013"}, d2 = {"Lcom/medium/proto/obv/post/SectionTextLayout;", "Lcom/squareup/wire/WireEnum;", "", "", "value", "<init>", "(Ljava/lang/String;II)V", "I", "getValue", "()I", "Companion", "kvb", "FLOW", "BOTTOM_CENTER", "MIDDLE_CENTER", "TOP_CENTER", "CAPTION_ONLY", "SERIES_COVER", "SERIES_COVER_TITLELESS", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class SectionTextLayout implements WireEnum {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ SectionTextLayout[] $VALUES;
    public static final ProtoAdapter<SectionTextLayout> ADAPTER;
    public static final kvb Companion;
    private final int value;
    public static final SectionTextLayout FLOW = new SectionTextLayout("FLOW", 0, 1);
    public static final SectionTextLayout BOTTOM_CENTER = new SectionTextLayout("BOTTOM_CENTER", 1, 2);
    public static final SectionTextLayout MIDDLE_CENTER = new SectionTextLayout("MIDDLE_CENTER", 2, 3);
    public static final SectionTextLayout TOP_CENTER = new SectionTextLayout("TOP_CENTER", 3, 4);
    public static final SectionTextLayout CAPTION_ONLY = new SectionTextLayout("CAPTION_ONLY", 4, 5);
    public static final SectionTextLayout SERIES_COVER = new SectionTextLayout("SERIES_COVER", 5, 6);
    public static final SectionTextLayout SERIES_COVER_TITLELESS = new SectionTextLayout("SERIES_COVER_TITLELESS", 6, 7);

    private static final /* synthetic */ SectionTextLayout[] $values() {
        return new SectionTextLayout[]{FLOW, BOTTOM_CENTER, MIDDLE_CENTER, TOP_CENTER, CAPTION_ONLY, SERIES_COVER, SERIES_COVER_TITLELESS};
    }

    static {
        SectionTextLayout[] sectionTextLayoutArr$values = $values();
        $VALUES = sectionTextLayoutArr$values;
        $ENTRIES = new i04(sectionTextLayoutArr$values);
        Companion = new kvb();
        ADAPTER = new SectionTextLayout$Companion$ADAPTER$1(n1b.a.b(SectionTextLayout.class), Syntax.PROTO_2, null);
    }

    private SectionTextLayout(String str, int i, int i2) {
        this.value = i2;
    }

    public static final SectionTextLayout fromValue(int i) {
        Companion.getClass();
        return kvb.a(i);
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static SectionTextLayout valueOf(String str) {
        return (SectionTextLayout) Enum.valueOf(SectionTextLayout.class, str);
    }

    public static SectionTextLayout[] values() {
        return (SectionTextLayout[]) $VALUES.clone();
    }

    @Override // com.squareup.wire.WireEnum
    public int getValue() {
        return this.value;
    }
}
