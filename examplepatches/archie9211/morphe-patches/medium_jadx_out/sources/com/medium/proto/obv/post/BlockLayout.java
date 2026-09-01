package com.medium.proto.obv.post;

import com.medium.android.common.post.text.Kmm.pUlNWdybf;
import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireEnum;
import defpackage.g04;
import defpackage.hs0;
import defpackage.i04;
import defpackage.n1b;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\b\n\u0002\b\u0015\b\u0086\u0081\u0002\u0018\u0000 \n2\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002:\u0001\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006R\u001a\u0010\u0004\u001a\u00020\u00038\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u0007\u001a\u0004\b\b\u0010\tj\u0002\b\fj\u0002\b\rj\u0002\b\u000ej\u0002\b\u000fj\u0002\b\u0010j\u0002\b\u0011j\u0002\b\u0012j\u0002\b\u0013j\u0002\b\u0014j\u0002\b\u0015j\u0002\b\u0016j\u0002\b\u0017¨\u0006\u0018"}, d2 = {"Lcom/medium/proto/obv/post/BlockLayout;", "Lcom/squareup/wire/WireEnum;", "", "", "value", "<init>", "(Ljava/lang/String;II)V", "I", "getValue", "()I", "Companion", "hs0", "INSET_CENTER", "INSET_LEFT", "OUTSET_CENTER", "OUTSET_LEFT", "FULL_WIDTH", "OUTSET_ROW", "OUTSET_ROW_CONTINUE", "FULL_WIDTH_CROPPED_COVER", "CONSTRAINED_HEIGHT_PREVIEW", "CROPPED_HEIGHT_PREVIEW", "INSET_CENTER_SMALL", "INSET_RIGHT", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class BlockLayout implements WireEnum {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ BlockLayout[] $VALUES;
    public static final ProtoAdapter<BlockLayout> ADAPTER;
    public static final hs0 Companion;
    private final int value;
    public static final BlockLayout INSET_CENTER = new BlockLayout("INSET_CENTER", 0, 1);
    public static final BlockLayout INSET_LEFT = new BlockLayout("INSET_LEFT", 1, 2);
    public static final BlockLayout OUTSET_CENTER = new BlockLayout("OUTSET_CENTER", 2, 3);
    public static final BlockLayout OUTSET_LEFT = new BlockLayout("OUTSET_LEFT", 3, 4);
    public static final BlockLayout FULL_WIDTH = new BlockLayout("FULL_WIDTH", 4, 5);
    public static final BlockLayout OUTSET_ROW = new BlockLayout("OUTSET_ROW", 5, 6);
    public static final BlockLayout OUTSET_ROW_CONTINUE = new BlockLayout("OUTSET_ROW_CONTINUE", 6, 7);
    public static final BlockLayout FULL_WIDTH_CROPPED_COVER = new BlockLayout("FULL_WIDTH_CROPPED_COVER", 7, 8);
    public static final BlockLayout CONSTRAINED_HEIGHT_PREVIEW = new BlockLayout(pUlNWdybf.iCnzUvUpng, 8, 9);
    public static final BlockLayout CROPPED_HEIGHT_PREVIEW = new BlockLayout("CROPPED_HEIGHT_PREVIEW", 9, 10);
    public static final BlockLayout INSET_CENTER_SMALL = new BlockLayout("INSET_CENTER_SMALL", 10, 11);
    public static final BlockLayout INSET_RIGHT = new BlockLayout("INSET_RIGHT", 11, 12);

    private static final /* synthetic */ BlockLayout[] $values() {
        return new BlockLayout[]{INSET_CENTER, INSET_LEFT, OUTSET_CENTER, OUTSET_LEFT, FULL_WIDTH, OUTSET_ROW, OUTSET_ROW_CONTINUE, FULL_WIDTH_CROPPED_COVER, CONSTRAINED_HEIGHT_PREVIEW, CROPPED_HEIGHT_PREVIEW, INSET_CENTER_SMALL, INSET_RIGHT};
    }

    private BlockLayout(String str, int i, int i2) {
        this.value = i2;
    }

    public static final BlockLayout fromValue(int i) {
        Companion.getClass();
        return hs0.a(i);
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static BlockLayout valueOf(String str) {
        return (BlockLayout) Enum.valueOf(BlockLayout.class, str);
    }

    public static BlockLayout[] values() {
        return (BlockLayout[]) $VALUES.clone();
    }

    @Override // com.squareup.wire.WireEnum
    public int getValue() {
        return this.value;
    }

    static {
        BlockLayout[] blockLayoutArr$values = $values();
        $VALUES = blockLayoutArr$values;
        $ENTRIES = new i04(blockLayoutArr$values);
        Companion = new hs0();
        ADAPTER = new BlockLayout$Companion$ADAPTER$1(n1b.a.b(BlockLayout.class), Syntax.PROTO_2, null);
    }
}
