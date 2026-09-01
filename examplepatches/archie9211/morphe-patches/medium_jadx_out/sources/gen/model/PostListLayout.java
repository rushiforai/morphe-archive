package gen.model;

import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireEnum;
import defpackage.g04;
import defpackage.i04;
import defpackage.n1b;
import defpackage.oh9;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\b\n\u0002\b\u0015\b\u0086\u0081\u0002\u0018\u0000 \n2\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002:\u0001\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006R\u001a\u0010\u0004\u001a\u00020\u00038\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u0007\u001a\u0004\b\b\u0010\tj\u0002\b\fj\u0002\b\rj\u0002\b\u000ej\u0002\b\u000fj\u0002\b\u0010j\u0002\b\u0011j\u0002\b\u0012j\u0002\b\u0013j\u0002\b\u0014j\u0002\b\u0015j\u0002\b\u0016j\u0002\b\u0017¨\u0006\u0018"}, d2 = {"Lgen/model/PostListLayout;", "Lcom/squareup/wire/WireEnum;", "", "", "value", "<init>", "(Ljava/lang/String;II)V", "I", "getValue", "()I", "Companion", "oh9", "GRID_TEXT_OVER_IMAGE_FULL_BLEED", "GRID_TEXT_OVER_IMAGE_WITH_MARGIN", "GRID_TEXT_UNDER_IMAGE_FULL_BLEED", "GRID_TEXT_UNDER_IMAGE_WITH_MARGIN", "LIST", "STREAM", "TEXT_OVER_IMAGE_SIDE_RAIL", "AUTO_GRID", "TWO_COLUMN_DENSE", "THREE_COLUMN_DENSE", "THREE_COLUMN", "OUTSET_HERO_GRID", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class PostListLayout implements WireEnum {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ PostListLayout[] $VALUES;
    public static final ProtoAdapter<PostListLayout> ADAPTER;
    public static final oh9 Companion;
    private final int value;
    public static final PostListLayout GRID_TEXT_OVER_IMAGE_FULL_BLEED = new PostListLayout("GRID_TEXT_OVER_IMAGE_FULL_BLEED", 0, 1);
    public static final PostListLayout GRID_TEXT_OVER_IMAGE_WITH_MARGIN = new PostListLayout("GRID_TEXT_OVER_IMAGE_WITH_MARGIN", 1, 2);
    public static final PostListLayout GRID_TEXT_UNDER_IMAGE_FULL_BLEED = new PostListLayout("GRID_TEXT_UNDER_IMAGE_FULL_BLEED", 2, 3);
    public static final PostListLayout GRID_TEXT_UNDER_IMAGE_WITH_MARGIN = new PostListLayout("GRID_TEXT_UNDER_IMAGE_WITH_MARGIN", 3, 4);
    public static final PostListLayout LIST = new PostListLayout("LIST", 4, 5);
    public static final PostListLayout STREAM = new PostListLayout("STREAM", 5, 6);
    public static final PostListLayout TEXT_OVER_IMAGE_SIDE_RAIL = new PostListLayout("TEXT_OVER_IMAGE_SIDE_RAIL", 6, 7);
    public static final PostListLayout AUTO_GRID = new PostListLayout("AUTO_GRID", 7, 8);
    public static final PostListLayout TWO_COLUMN_DENSE = new PostListLayout("TWO_COLUMN_DENSE", 8, 9);
    public static final PostListLayout THREE_COLUMN_DENSE = new PostListLayout("THREE_COLUMN_DENSE", 9, 10);
    public static final PostListLayout THREE_COLUMN = new PostListLayout("THREE_COLUMN", 10, 11);
    public static final PostListLayout OUTSET_HERO_GRID = new PostListLayout("OUTSET_HERO_GRID", 11, 12);

    private static final /* synthetic */ PostListLayout[] $values() {
        return new PostListLayout[]{GRID_TEXT_OVER_IMAGE_FULL_BLEED, GRID_TEXT_OVER_IMAGE_WITH_MARGIN, GRID_TEXT_UNDER_IMAGE_FULL_BLEED, GRID_TEXT_UNDER_IMAGE_WITH_MARGIN, LIST, STREAM, TEXT_OVER_IMAGE_SIDE_RAIL, AUTO_GRID, TWO_COLUMN_DENSE, THREE_COLUMN_DENSE, THREE_COLUMN, OUTSET_HERO_GRID};
    }

    static {
        PostListLayout[] postListLayoutArr$values = $values();
        $VALUES = postListLayoutArr$values;
        $ENTRIES = new i04(postListLayoutArr$values);
        Companion = new oh9();
        ADAPTER = new PostListLayout$Companion$ADAPTER$1(n1b.a.b(PostListLayout.class), Syntax.PROTO_2, null);
    }

    private PostListLayout(String str, int i, int i2) {
        this.value = i2;
    }

    public static final PostListLayout fromValue(int i) {
        Companion.getClass();
        return oh9.a(i);
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static PostListLayout valueOf(String str) {
        return (PostListLayout) Enum.valueOf(PostListLayout.class, str);
    }

    public static PostListLayout[] values() {
        return (PostListLayout[]) $VALUES.clone();
    }

    @Override // com.squareup.wire.WireEnum
    public int getValue() {
        return this.value;
    }
}
