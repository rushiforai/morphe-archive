package com.medium.proto.obv.post;

import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireEnum;
import defpackage.g04;
import defpackage.hvb;
import defpackage.i04;
import defpackage.n1b;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\b\n\u0002\b\u0014\b\u0086\u0081\u0002\u0018\u0000 \n2\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002:\u0001\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006R\u001a\u0010\u0004\u001a\u00020\u00038\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u0007\u001a\u0004\b\b\u0010\tj\u0002\b\fj\u0002\b\rj\u0002\b\u000ej\u0002\b\u000fj\u0002\b\u0010j\u0002\b\u0011j\u0002\b\u0012j\u0002\b\u0013j\u0002\b\u0014j\u0002\b\u0015j\u0002\b\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/proto/obv/post/SectionImageLayout;", "Lcom/squareup/wire/WireEnum;", "", "", "value", "<init>", "(Ljava/lang/String;II)V", "I", "getValue", "()I", "Companion", "hvb", "NONE", "FULL_BLEED", "UNUSED_LEFT", "UNUSED_RIGHT", "CONTENT", "FULL_SCREEN", "ASPECT_RATIO", "COVER_FADE", "ASPECT_RATIO_VIEWPORT", "SECTION_FILL_CROP", "SECTION_FILL_OVERFLOW_X", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class SectionImageLayout implements WireEnum {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ SectionImageLayout[] $VALUES;
    public static final ProtoAdapter<SectionImageLayout> ADAPTER;
    public static final hvb Companion;
    private final int value;
    public static final SectionImageLayout NONE = new SectionImageLayout("NONE", 0, 1);
    public static final SectionImageLayout FULL_BLEED = new SectionImageLayout("FULL_BLEED", 1, 2);
    public static final SectionImageLayout UNUSED_LEFT = new SectionImageLayout("UNUSED_LEFT", 2, 3);
    public static final SectionImageLayout UNUSED_RIGHT = new SectionImageLayout("UNUSED_RIGHT", 3, 4);
    public static final SectionImageLayout CONTENT = new SectionImageLayout("CONTENT", 4, 5);
    public static final SectionImageLayout FULL_SCREEN = new SectionImageLayout("FULL_SCREEN", 5, 6);
    public static final SectionImageLayout ASPECT_RATIO = new SectionImageLayout("ASPECT_RATIO", 6, 7);
    public static final SectionImageLayout COVER_FADE = new SectionImageLayout("COVER_FADE", 7, 8);
    public static final SectionImageLayout ASPECT_RATIO_VIEWPORT = new SectionImageLayout("ASPECT_RATIO_VIEWPORT", 8, 9);
    public static final SectionImageLayout SECTION_FILL_CROP = new SectionImageLayout("SECTION_FILL_CROP", 9, 10);
    public static final SectionImageLayout SECTION_FILL_OVERFLOW_X = new SectionImageLayout("SECTION_FILL_OVERFLOW_X", 10, 11);

    private static final /* synthetic */ SectionImageLayout[] $values() {
        return new SectionImageLayout[]{NONE, FULL_BLEED, UNUSED_LEFT, UNUSED_RIGHT, CONTENT, FULL_SCREEN, ASPECT_RATIO, COVER_FADE, ASPECT_RATIO_VIEWPORT, SECTION_FILL_CROP, SECTION_FILL_OVERFLOW_X};
    }

    static {
        SectionImageLayout[] sectionImageLayoutArr$values = $values();
        $VALUES = sectionImageLayoutArr$values;
        $ENTRIES = new i04(sectionImageLayoutArr$values);
        Companion = new hvb();
        ADAPTER = new SectionImageLayout$Companion$ADAPTER$1(n1b.a.b(SectionImageLayout.class), Syntax.PROTO_2, null);
    }

    private SectionImageLayout(String str, int i, int i2) {
        this.value = i2;
    }

    public static final SectionImageLayout fromValue(int i) {
        Companion.getClass();
        return hvb.a(i);
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static SectionImageLayout valueOf(String str) {
        return (SectionImageLayout) Enum.valueOf(SectionImageLayout.class, str);
    }

    public static SectionImageLayout[] values() {
        return (SectionImageLayout[]) $VALUES.clone();
    }

    @Override // com.squareup.wire.WireEnum
    public int getValue() {
        return this.value;
    }
}
