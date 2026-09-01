package com.medium.proto.obv.post;

import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireEnum;
import defpackage.g04;
import defpackage.i04;
import defpackage.n1b;
import defpackage.qv1;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\b\n\u0002\b\"\b\u0086\u0081\u0002\u0018\u0000 \n2\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002:\u0001\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006R\u001a\u0010\u0004\u001a\u00020\u00038\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u0007\u001a\u0004\b\b\u0010\tj\u0002\b\fj\u0002\b\rj\u0002\b\u000ej\u0002\b\u000fj\u0002\b\u0010j\u0002\b\u0011j\u0002\b\u0012j\u0002\b\u0013j\u0002\b\u0014j\u0002\b\u0015j\u0002\b\u0016j\u0002\b\u0017j\u0002\b\u0018j\u0002\b\u0019j\u0002\b\u001aj\u0002\b\u001bj\u0002\b\u001cj\u0002\b\u001dj\u0002\b\u001ej\u0002\b\u001fj\u0002\b j\u0002\b!j\u0002\b\"j\u0002\b#j\u0002\b$¨\u0006%"}, d2 = {"Lcom/medium/proto/obv/post/ColorType;", "Lcom/squareup/wire/WireEnum;", "", "", "value", "<init>", "(Ljava/lang/String;II)V", "I", "getValue", "()I", "Companion", "qv1", "DEFAULT", "BROOK", "CRUSH", "FRESH", "GRAY", "GRIMACE", "LIME", "LIPSTICK", "MAGIC", "MIDDAY", "MIDNIGHT", "SEAWEED", "WARM", "BROOK_LIGHT", "CRUSH_LIGHT", "FRESH_LIGHT", "GRAY_LIGHT", "GRIMACE_LIGHT", "LIME_LIGHT", "LIPSTICK_LIGHT", "MAGIC_LIGHT", "MIDDAY_LIGHT", "MIDNIGHT_LIGHT", "SEAWEED_LIGHT", "WARM_LIGHT", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class ColorType implements WireEnum {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ ColorType[] $VALUES;
    public static final ProtoAdapter<ColorType> ADAPTER;
    public static final qv1 Companion;
    private final int value;
    public static final ColorType DEFAULT = new ColorType("DEFAULT", 0, 1);
    public static final ColorType BROOK = new ColorType("BROOK", 1, 2);
    public static final ColorType CRUSH = new ColorType("CRUSH", 2, 3);
    public static final ColorType FRESH = new ColorType("FRESH", 3, 4);
    public static final ColorType GRAY = new ColorType("GRAY", 4, 5);
    public static final ColorType GRIMACE = new ColorType("GRIMACE", 5, 6);
    public static final ColorType LIME = new ColorType("LIME", 6, 7);
    public static final ColorType LIPSTICK = new ColorType("LIPSTICK", 7, 8);
    public static final ColorType MAGIC = new ColorType("MAGIC", 8, 9);
    public static final ColorType MIDDAY = new ColorType("MIDDAY", 9, 10);
    public static final ColorType MIDNIGHT = new ColorType("MIDNIGHT", 10, 11);
    public static final ColorType SEAWEED = new ColorType("SEAWEED", 11, 12);
    public static final ColorType WARM = new ColorType("WARM", 12, 13);
    public static final ColorType BROOK_LIGHT = new ColorType("BROOK_LIGHT", 13, 102);
    public static final ColorType CRUSH_LIGHT = new ColorType("CRUSH_LIGHT", 14, 103);
    public static final ColorType FRESH_LIGHT = new ColorType("FRESH_LIGHT", 15, 104);
    public static final ColorType GRAY_LIGHT = new ColorType("GRAY_LIGHT", 16, PanasonicMakernoteDirectory.TAG_COUNTRY);
    public static final ColorType GRIMACE_LIGHT = new ColorType("GRIMACE_LIGHT", 17, 106);
    public static final ColorType LIME_LIGHT = new ColorType("LIME_LIGHT", 18, 107);
    public static final ColorType LIPSTICK_LIGHT = new ColorType("LIPSTICK_LIGHT", 19, 108);
    public static final ColorType MAGIC_LIGHT = new ColorType("MAGIC_LIGHT", 20, 109);
    public static final ColorType MIDDAY_LIGHT = new ColorType("MIDDAY_LIGHT", 21, 110);
    public static final ColorType MIDNIGHT_LIGHT = new ColorType("MIDNIGHT_LIGHT", 22, PanasonicMakernoteDirectory.TAG_LANDMARK);
    public static final ColorType SEAWEED_LIGHT = new ColorType("SEAWEED_LIGHT", 23, PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION);
    public static final ColorType WARM_LIGHT = new ColorType("WARM_LIGHT", 24, 113);

    private static final /* synthetic */ ColorType[] $values() {
        return new ColorType[]{DEFAULT, BROOK, CRUSH, FRESH, GRAY, GRIMACE, LIME, LIPSTICK, MAGIC, MIDDAY, MIDNIGHT, SEAWEED, WARM, BROOK_LIGHT, CRUSH_LIGHT, FRESH_LIGHT, GRAY_LIGHT, GRIMACE_LIGHT, LIME_LIGHT, LIPSTICK_LIGHT, MAGIC_LIGHT, MIDDAY_LIGHT, MIDNIGHT_LIGHT, SEAWEED_LIGHT, WARM_LIGHT};
    }

    static {
        ColorType[] colorTypeArr$values = $values();
        $VALUES = colorTypeArr$values;
        $ENTRIES = new i04(colorTypeArr$values);
        Companion = new qv1();
        ADAPTER = new ColorType$Companion$ADAPTER$1(n1b.a.b(ColorType.class), Syntax.PROTO_2, null);
    }

    private ColorType(String str, int i, int i2) {
        this.value = i2;
    }

    public static final ColorType fromValue(int i) {
        Companion.getClass();
        return qv1.a(i);
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static ColorType valueOf(String str) {
        return (ColorType) Enum.valueOf(ColorType.class, str);
    }

    public static ColorType[] values() {
        return (ColorType[]) $VALUES.clone();
    }

    @Override // com.squareup.wire.WireEnum
    public int getValue() {
        return this.value;
    }
}
