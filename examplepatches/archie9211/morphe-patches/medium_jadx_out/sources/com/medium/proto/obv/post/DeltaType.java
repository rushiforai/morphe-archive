package com.medium.proto.obv.post;

import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireEnum;
import defpackage.g04;
import defpackage.h73;
import defpackage.i04;
import defpackage.n1b;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\b\n\u0002\b\u001e\b\u0086\u0081\u0002\u0018\u0000 \n2\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002:\u0001\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006R\u001a\u0010\u0004\u001a\u00020\u00038\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u0007\u001a\u0004\b\b\u0010\tj\u0002\b\fj\u0002\b\rj\u0002\b\u000ej\u0002\b\u000fj\u0002\b\u0010j\u0002\b\u0011j\u0002\b\u0012j\u0002\b\u0013j\u0002\b\u0014j\u0002\b\u0015j\u0002\b\u0016j\u0002\b\u0017j\u0002\b\u0018j\u0002\b\u0019j\u0002\b\u001aj\u0002\b\u001bj\u0002\b\u001cj\u0002\b\u001dj\u0002\b\u001ej\u0002\b\u001fj\u0002\b ¨\u0006!"}, d2 = {"Lcom/medium/proto/obv/post/DeltaType;", "Lcom/squareup/wire/WireEnum;", "", "", "value", "<init>", "(Ljava/lang/String;II)V", "I", "getValue", "()I", "Companion", "h73", "INSERT_PARAGRAPH_AT", "REMOVE_PARAGRAPH_AT", "UPDATE_PARAGRAPH_AT", "UPDATE_TITLE", "UPDATE_SUBTITLE", "UPDATE_META_DESCRIPTION", "UPDATE_IMAGE", "UPDATE_PREVIEW_IMAGE", "UPDATE_CAPTION", "INSERT_SECTION_AT", "REMOVE_SECTION_AT", "UPDATE_SECTION_AT", "REVERT", "PUBLISH", "UPDATE_POST_DISPLAY", "CLONE", "TRANSLATE", "THROTTLE", "PREDEFINED", "UPDATE_SELECTION", "FAILURE", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class DeltaType implements WireEnum {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ DeltaType[] $VALUES;
    public static final ProtoAdapter<DeltaType> ADAPTER;
    public static final h73 Companion;
    private final int value;
    public static final DeltaType INSERT_PARAGRAPH_AT = new DeltaType("INSERT_PARAGRAPH_AT", 0, 1);
    public static final DeltaType REMOVE_PARAGRAPH_AT = new DeltaType("REMOVE_PARAGRAPH_AT", 1, 2);
    public static final DeltaType UPDATE_PARAGRAPH_AT = new DeltaType("UPDATE_PARAGRAPH_AT", 2, 3);
    public static final DeltaType UPDATE_TITLE = new DeltaType("UPDATE_TITLE", 3, 4);
    public static final DeltaType UPDATE_SUBTITLE = new DeltaType("UPDATE_SUBTITLE", 4, 5);
    public static final DeltaType UPDATE_META_DESCRIPTION = new DeltaType("UPDATE_META_DESCRIPTION", 5, 19);
    public static final DeltaType UPDATE_IMAGE = new DeltaType("UPDATE_IMAGE", 6, 6);
    public static final DeltaType UPDATE_PREVIEW_IMAGE = new DeltaType("UPDATE_PREVIEW_IMAGE", 7, 20);
    public static final DeltaType UPDATE_CAPTION = new DeltaType("UPDATE_CAPTION", 8, 7);
    public static final DeltaType INSERT_SECTION_AT = new DeltaType("INSERT_SECTION_AT", 9, 8);
    public static final DeltaType REMOVE_SECTION_AT = new DeltaType("REMOVE_SECTION_AT", 10, 9);
    public static final DeltaType UPDATE_SECTION_AT = new DeltaType("UPDATE_SECTION_AT", 11, 10);
    public static final DeltaType REVERT = new DeltaType("REVERT", 12, 11);
    public static final DeltaType PUBLISH = new DeltaType("PUBLISH", 13, 12);
    public static final DeltaType UPDATE_POST_DISPLAY = new DeltaType("UPDATE_POST_DISPLAY", 14, 13);
    public static final DeltaType CLONE = new DeltaType("CLONE", 15, 14);
    public static final DeltaType TRANSLATE = new DeltaType("TRANSLATE", 16, 15);
    public static final DeltaType THROTTLE = new DeltaType("THROTTLE", 17, 16);
    public static final DeltaType PREDEFINED = new DeltaType("PREDEFINED", 18, 17);
    public static final DeltaType UPDATE_SELECTION = new DeltaType("UPDATE_SELECTION", 19, 18);
    public static final DeltaType FAILURE = new DeltaType("FAILURE", 20, 99);

    private static final /* synthetic */ DeltaType[] $values() {
        return new DeltaType[]{INSERT_PARAGRAPH_AT, REMOVE_PARAGRAPH_AT, UPDATE_PARAGRAPH_AT, UPDATE_TITLE, UPDATE_SUBTITLE, UPDATE_META_DESCRIPTION, UPDATE_IMAGE, UPDATE_PREVIEW_IMAGE, UPDATE_CAPTION, INSERT_SECTION_AT, REMOVE_SECTION_AT, UPDATE_SECTION_AT, REVERT, PUBLISH, UPDATE_POST_DISPLAY, CLONE, TRANSLATE, THROTTLE, PREDEFINED, UPDATE_SELECTION, FAILURE};
    }

    static {
        DeltaType[] deltaTypeArr$values = $values();
        $VALUES = deltaTypeArr$values;
        $ENTRIES = new i04(deltaTypeArr$values);
        Companion = new h73();
        ADAPTER = new DeltaType$Companion$ADAPTER$1(n1b.a.b(DeltaType.class), Syntax.PROTO_2, null);
    }

    private DeltaType(String str, int i, int i2) {
        this.value = i2;
    }

    public static final DeltaType fromValue(int i) {
        Companion.getClass();
        return h73.a(i);
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static DeltaType valueOf(String str) {
        return (DeltaType) Enum.valueOf(DeltaType.class, str);
    }

    public static DeltaType[] values() {
        return (DeltaType[]) $VALUES.clone();
    }

    @Override // com.squareup.wire.WireEnum
    public int getValue() {
        return this.value;
    }
}
