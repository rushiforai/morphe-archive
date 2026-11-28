.class public final Lnicoid/network238/okio/Options$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okio/Options;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000<\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0011\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0010 \n\u0002\u0008\u0007\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J!\u0010\u0004\u001a\u00020\u00052\u0012\u0010\u0006\u001a\n\u0012\u0006\u0008\u0001\u0012\u00020\u00080\u0007\"\u00020\u0008H\u0007\u00a2\u0006\u0002\u0010\tJT\u0010\n\u001a\u00020\u000b2\u0008\u0008\u0002\u0010\u000c\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u000f2\u0008\u0008\u0002\u0010\u0010\u001a\u00020\u00112\u000c\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u00122\u0008\u0008\u0002\u0010\u0013\u001a\u00020\u00112\u0008\u0008\u0002\u0010\u0014\u001a\u00020\u00112\u000c\u0010\u0015\u001a\u0008\u0012\u0004\u0012\u00020\u00110\u0012H\u0002R\u0018\u0010\u0016\u001a\u00020\r*\u00020\u000f8BX\u0082\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0017\u0010\u0018\u00a8\u0006\u0019"
    }
    d2 = {
        "Lnicoid/network238/okio/Options$Companion;",
        "",
        "<init>",
        "()V",
        "of",
        "Lnicoid/network238/okio/Options;",
        "byteStrings",
        "",
        "Lnicoid/network238/okio/ByteString;",
        "([Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/Options;",
        "buildTrieRecursive",
        "",
        "nodeOffset",
        "",
        "node",
        "Lnicoid/network238/okio/Buffer;",
        "byteStringOffset",
        "",
        "",
        "fromIndex",
        "toIndex",
        "indexes",
        "intCount",
        "getIntCount",
        "(Lnicoid/network238/okio/Buffer;)J",
        "okio"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 2

    invoke-direct {p0}, Lnicoid/network238/okio/Options$Companion;-><init>()V

    return-void
.end method

.method private final buildTrieRecursive(JLnicoid/network238/okio/Buffer;ILjava/util/List;IILjava/util/List;)V
    .registers 30
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Lnicoid/network238/okio/Buffer;",
            "I",
            "Ljava/util/List<",
            "+",
            "Lnicoid/network238/okio/ByteString;",
            ">;II",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v9, p3

    move/from16 v10, p4

    move-object/from16 v5, p5

    move/from16 v1, p6

    move/from16 v11, p7

    move-object/from16 v8, p8

    const-string v2, "Failed requirement."

    if-ge v1, v11, :cond_12

    move v3, v1

    :goto_0
    if-ge v3, v11, :cond_1

    .line 120
    invoke-interface {v5, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lnicoid/network238/okio/ByteString;

    invoke-virtual {v4}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v4

    if-lt v4, v10, :cond_0

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 124
    :cond_1
    invoke-interface/range {p5 .. p6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lnicoid/network238/okio/ByteString;

    add-int/lit8 v3, v11, -0x1

    .line 125
    invoke-interface {v5, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lnicoid/network238/okio/ByteString;

    .line 129
    invoke-virtual {v2}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v4

    const/4 v12, -0x1

    if-ne v10, v4, :cond_2

    .line 130
    invoke-interface {v8, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v2

    add-int/lit8 v1, v1, 0x1

    .line 132
    invoke-interface {v5, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lnicoid/network238/okio/ByteString;

    move v6, v1

    move v1, v2

    move-object v2, v4

    goto :goto_1

    .line 129
    :cond_2
    move v6, v1

    move v1, v12

    .line 135
    :goto_1
    invoke-virtual {v2, v10}, Lnicoid/network238/okio/ByteString;->getByte(I)B

    move-result v4

    invoke-virtual {v3, v10}, Lnicoid/network238/okio/ByteString;->getByte(I)B

    move-result v7

    const-wide/16 v13, 0x2

    if-eq v4, v7, :cond_c

    add-int/lit8 v2, v6, 0x1

    const/4 v3, 0x1

    :goto_2
    if-ge v2, v11, :cond_4

    add-int/lit8 v4, v2, -0x1

    .line 139
    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lnicoid/network238/okio/ByteString;

    invoke-virtual {v4, v10}, Lnicoid/network238/okio/ByteString;->getByte(I)B

    move-result v4

    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lnicoid/network238/okio/ByteString;

    invoke-virtual {v7, v10}, Lnicoid/network238/okio/ByteString;->getByte(I)B

    move-result v7

    if-eq v4, v7, :cond_3

    add-int/lit8 v3, v3, 0x1

    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 145
    :cond_4
    invoke-direct {v0, v9}, Lnicoid/network238/okio/Options$Companion;->getIntCount(Lnicoid/network238/okio/Buffer;)J

    move-result-wide v15

    add-long v15, p1, v15

    add-long/2addr v15, v13

    shl-int/lit8 v2, v3, 0x1

    int-to-long v13, v2

    add-long/2addr v15, v13

    .line 147
    invoke-virtual {v9, v3}, Lnicoid/network238/okio/Buffer;->writeInt(I)Lnicoid/network238/okio/Buffer;

    .line 148
    invoke-virtual {v9, v1}, Lnicoid/network238/okio/Buffer;->writeInt(I)Lnicoid/network238/okio/Buffer;

    move v1, v6

    :goto_3
    if-ge v1, v11, :cond_7

    .line 151
    invoke-interface {v5, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lnicoid/network238/okio/ByteString;

    invoke-virtual {v2, v10}, Lnicoid/network238/okio/ByteString;->getByte(I)B

    move-result v2

    if-eq v1, v6, :cond_5

    add-int/lit8 v3, v1, -0x1

    .line 152
    invoke-interface {v5, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lnicoid/network238/okio/ByteString;

    invoke-virtual {v3, v10}, Lnicoid/network238/okio/ByteString;->getByte(I)B

    move-result v3

    if-eq v2, v3, :cond_6

    :cond_5
    and-int/lit16 v2, v2, 0xff

    .line 153
    invoke-virtual {v9, v2}, Lnicoid/network238/okio/Buffer;->writeInt(I)Lnicoid/network238/okio/Buffer;

    :cond_6
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 157
    :cond_7
    new-instance v3, Lnicoid/network238/okio/Buffer;

    invoke-direct {v3}, Lnicoid/network238/okio/Buffer;-><init>()V

    :goto_4
    if-ge v6, v11, :cond_b

    .line 160
    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnicoid/network238/okio/ByteString;

    invoke-virtual {v1, v10}, Lnicoid/network238/okio/ByteString;->getByte(I)B

    move-result v1

    add-int/lit8 v2, v6, 0x1

    move v4, v2

    :goto_5
    if-ge v4, v11, :cond_9

    .line 163
    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lnicoid/network238/okio/ByteString;

    invoke-virtual {v7, v10}, Lnicoid/network238/okio/ByteString;->getByte(I)B

    move-result v7

    if-eq v1, v7, :cond_8

    move v7, v4

    goto :goto_6

    :cond_8
    add-int/lit8 v4, v4, 0x1

    goto :goto_5

    :cond_9
    move v7, v11

    :goto_6
    if-ne v2, v7, :cond_a

    add-int/lit8 v1, v10, 0x1

    .line 170
    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lnicoid/network238/okio/ByteString;

    invoke-virtual {v2}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v2

    if-ne v1, v2, :cond_a

    .line 173
    invoke-interface {v8, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    invoke-virtual {v9, v1}, Lnicoid/network238/okio/Buffer;->writeInt(I)Lnicoid/network238/okio/Buffer;

    move-wide v1, v15

    goto :goto_7

    .line 176
    :cond_a
    invoke-direct {v0, v3}, Lnicoid/network238/okio/Options$Companion;->getIntCount(Lnicoid/network238/okio/Buffer;)J

    move-result-wide v1

    add-long/2addr v1, v15

    long-to-int v1, v1

    mul-int/2addr v1, v12

    invoke-virtual {v9, v1}, Lnicoid/network238/okio/Buffer;->writeInt(I)Lnicoid/network238/okio/Buffer;

    add-int/lit8 v4, v10, 0x1

    .line 177
    move-wide v1, v15

    invoke-direct/range {v0 .. v8}, Lnicoid/network238/okio/Options$Companion;->buildTrieRecursive(JLnicoid/network238/okio/Buffer;ILjava/util/List;IILjava/util/List;)V

    :goto_7
    move-wide v15, v1

    move v6, v7

    goto :goto_4

    .line 191
    :cond_b
    invoke-virtual {v9, v3}, Lnicoid/network238/okio/Buffer;->writeAll(Lnicoid/network238/okio/Source;)J

    return-void

    :cond_c
    nop

    .line 195
    invoke-virtual {v2}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v4

    invoke-virtual {v3}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v7

    invoke-static {v4, v7}, Ljava/lang/Math;->min(II)I

    move-result v4

    const/4 v7, 0x0

    move v15, v10

    :goto_8
    if-ge v15, v4, :cond_d

    .line 196
    move/from16 v16, v12

    invoke-virtual {v2, v15}, Lnicoid/network238/okio/ByteString;->getByte(I)B

    move-result v12

    move-wide/from16 v17, v13

    invoke-virtual {v3, v15}, Lnicoid/network238/okio/ByteString;->getByte(I)B

    move-result v13

    if-ne v12, v13, :cond_e

    add-int/lit8 v7, v7, 0x1

    add-int/lit8 v15, v15, 0x1

    move/from16 v12, v16

    move-wide/from16 v13, v17

    goto :goto_8

    .line 195
    :cond_d
    move/from16 v16, v12

    move-wide/from16 v17, v13

    .line 204
    :cond_e
    invoke-direct {v0, v9}, Lnicoid/network238/okio/Options$Companion;->getIntCount(Lnicoid/network238/okio/Buffer;)J

    move-result-wide v3

    add-long v3, p1, v3

    add-long v3, v3, v17

    int-to-long v12, v7

    add-long/2addr v3, v12

    const-wide/16 v12, 0x1

    add-long/2addr v3, v12

    neg-int v12, v7

    .line 206
    invoke-virtual {v9, v12}, Lnicoid/network238/okio/Buffer;->writeInt(I)Lnicoid/network238/okio/Buffer;

    .line 207
    invoke-virtual {v9, v1}, Lnicoid/network238/okio/Buffer;->writeInt(I)Lnicoid/network238/okio/Buffer;

    add-int v1, v10, v7

    :goto_9
    if-ge v10, v1, :cond_f

    .line 210
    invoke-virtual {v2, v10}, Lnicoid/network238/okio/ByteString;->getByte(I)B

    move-result v7

    and-int/lit16 v7, v7, 0xff

    invoke-virtual {v9, v7}, Lnicoid/network238/okio/Buffer;->writeInt(I)Lnicoid/network238/okio/Buffer;

    add-int/lit8 v10, v10, 0x1

    goto :goto_9

    :cond_f
    add-int/lit8 v2, v6, 0x1

    if-ne v2, v11, :cond_11

    .line 215
    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lnicoid/network238/okio/ByteString;

    invoke-virtual {v2}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v2

    if-ne v1, v2, :cond_10

    .line 216
    invoke-interface {v8, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    invoke-virtual {v9, v1}, Lnicoid/network238/okio/Buffer;->writeInt(I)Lnicoid/network238/okio/Buffer;

    return-void

    .line 215
    :cond_10
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Check failed."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 219
    :cond_11
    move-wide/from16 v19, v3

    move v4, v1

    move-wide/from16 v1, v19

    new-instance v3, Lnicoid/network238/okio/Buffer;

    invoke-direct {v3}, Lnicoid/network238/okio/Buffer;-><init>()V

    .line 220
    invoke-direct {v0, v3}, Lnicoid/network238/okio/Options$Companion;->getIntCount(Lnicoid/network238/okio/Buffer;)J

    move-result-wide v12

    add-long/2addr v12, v1

    long-to-int v7, v12

    mul-int/lit8 v7, v7, -0x1

    invoke-virtual {v9, v7}, Lnicoid/network238/okio/Buffer;->writeInt(I)Lnicoid/network238/okio/Buffer;

    .line 221
    move v7, v11

    invoke-direct/range {v0 .. v8}, Lnicoid/network238/okio/Options$Companion;->buildTrieRecursive(JLnicoid/network238/okio/Buffer;ILjava/util/List;IILjava/util/List;)V

    .line 230
    invoke-virtual {v9, v3}, Lnicoid/network238/okio/Buffer;->writeAll(Lnicoid/network238/okio/Source;)J

    return-void

    .line 118
    :cond_12
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static synthetic buildTrieRecursive$default(Lnicoid/network238/okio/Options$Companion;JLnicoid/network238/okio/Buffer;ILjava/util/List;IILjava/util/List;ILjava/lang/Object;)V
    .registers 20

    and-int/lit8 v0, p9, 0x1

    if-eqz v0, :cond_0

    const-wide/16 p1, 0x0

    :cond_0
    move-wide v1, p1

    and-int/lit8 p1, p9, 0x4

    const/4 p2, 0x0

    if-eqz p1, :cond_1

    move v4, p2

    goto :goto_0

    :cond_1
    move v4, p4

    :goto_0
    and-int/lit8 p1, p9, 0x10

    if-eqz p1, :cond_2

    move v6, p2

    goto :goto_1

    :cond_2
    move v6, p6

    :goto_1
    and-int/lit8 p1, p9, 0x20

    if-eqz p1, :cond_3

    .line 115
    invoke-interface {p5}, Ljava/util/List;->size()I

    move-result p1

    move v7, p1

    goto :goto_2

    .line 0
    :cond_3
    move/from16 v7, p7

    .line 109
    :goto_2
    move-object v0, p0

    move-object v3, p3

    move-object v5, p5

    move-object/from16 v8, p8

    invoke-direct/range {v0 .. v8}, Lnicoid/network238/okio/Options$Companion;->buildTrieRecursive(JLnicoid/network238/okio/Buffer;ILjava/util/List;IILjava/util/List;)V

    return-void
.end method

.method private final getIntCount(Lnicoid/network238/okio/Buffer;)J
    .registers 6

    .line 235
    invoke-virtual {p1}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    const-wide/16 v2, 0x4

    div-long/2addr v0, v2

    return-wide v0
.end method


# virtual methods
.method public final varargs of([Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/Options;
    .registers 18

    move-object/from16 v0, p1

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 38
    array-length v1, v0

    const/4 v2, 0x0

    const/4 v3, -0x1

    const/4 v4, 0x0

    if-nez v1, :cond_0

    .line 40
    new-instance v0, Lnicoid/network238/okio/Options;

    new-array v1, v4, [Lnicoid/network238/okio/ByteString;

    filled-new-array {v4, v3}, [I

    move-result-object v3

    invoke-direct {v0, v1, v3, v2}, Lnicoid/network238/okio/Options;-><init>([Lnicoid/network238/okio/ByteString;[ILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    return-object v0

    .line 45
    :cond_0
    invoke-static {v0}, Lnicoid/network238/kotlin/collections/ArraysKt;->toMutableList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    .line 46
    invoke-static {v5}, Lnicoid/network238/kotlin/collections/CollectionsKt;->sort(Ljava/util/List;)V

    .line 47
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v1

    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13, v1}, Ljava/util/ArrayList;-><init>(I)V

    move v6, v4

    :goto_0
    if-ge v6, v1, :cond_1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v13, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 241
    :cond_1
    array-length v1, v0

    move v3, v4

    move v11, v3

    :goto_1
    if-ge v3, v1, :cond_2

    aget-object v6, v0, v3

    add-int/lit8 v12, v11, 0x1

    .line 49
    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x6

    const/4 v10, 0x0

    invoke-static/range {v5 .. v10}, Lnicoid/network238/kotlin/collections/CollectionsKt;->binarySearch$default(Ljava/util/List;Ljava/lang/Comparable;IIILjava/lang/Object;)I

    move-result v6

    .line 50
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v13, v6, v7}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v3, v3, 0x1

    move v11, v12

    goto :goto_1

    :cond_2
    nop

    .line 52
    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnicoid/network238/okio/ByteString;

    invoke-virtual {v1}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v1

    if-lez v1, :cond_8

    move v1, v4

    .line 58
    :goto_2
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v3

    if-ge v1, v3, :cond_6

    .line 59
    invoke-interface {v5, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lnicoid/network238/okio/ByteString;

    add-int/lit8 v6, v1, 0x1

    move v7, v6

    .line 61
    :goto_3
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v8

    if-ge v7, v8, :cond_5

    .line 62
    invoke-interface {v5, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lnicoid/network238/okio/ByteString;

    .line 63
    invoke-virtual {v8, v3}, Lnicoid/network238/okio/ByteString;->startsWith(Lnicoid/network238/okio/ByteString;)Z

    move-result v9

    if-eqz v9, :cond_5

    .line 64
    invoke-virtual {v8}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v9

    invoke-virtual {v3}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v10

    if-eq v9, v10, :cond_4

    .line 65
    invoke-interface {v13, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Number;

    invoke-virtual {v8}, Ljava/lang/Number;->intValue()I

    move-result v8

    invoke-interface {v13, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Number;

    invoke-virtual {v9}, Ljava/lang/Number;->intValue()I

    move-result v9

    if-le v8, v9, :cond_3

    .line 66
    invoke-interface {v5, v7}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 67
    invoke-interface {v13, v7}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Number;

    invoke-virtual {v8}, Ljava/lang/Number;->intValue()I

    goto :goto_3

    :cond_3
    add-int/lit8 v7, v7, 0x1

    goto :goto_3

    .line 64
    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "duplicate option: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_5
    move v1, v6

    goto :goto_2

    .line 75
    :cond_6
    new-instance v8, Lnicoid/network238/okio/Buffer;

    invoke-direct {v8}, Lnicoid/network238/okio/Buffer;-><init>()V

    .line 76
    const-wide/16 v6, 0x0

    const/4 v9, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/16 v14, 0x35

    const/4 v15, 0x0

    move-object v10, v5

    move-object/from16 v5, p0

    invoke-static/range {v5 .. v15}, Lnicoid/network238/okio/Options$Companion;->buildTrieRecursive$default(Lnicoid/network238/okio/Options$Companion;JLnicoid/network238/okio/Buffer;ILjava/util/List;IILjava/util/List;ILjava/lang/Object;)V

    .line 78
    invoke-direct {v5, v8}, Lnicoid/network238/okio/Options$Companion;->getIntCount(Lnicoid/network238/okio/Buffer;)J

    move-result-wide v6

    long-to-int v1, v6

    new-array v3, v1, [I

    :goto_4
    if-ge v4, v1, :cond_7

    .line 79
    invoke-virtual {v8}, Lnicoid/network238/okio/Buffer;->readInt()I

    move-result v6

    aput v6, v3, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_4

    .line 82
    :cond_7
    new-instance v1, Lnicoid/network238/okio/Options;

    array-length v4, v0

    invoke-static {v0, v4}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lnicoid/network238/okio/ByteString;

    invoke-direct {v1, v0, v3, v2}, Lnicoid/network238/okio/Options;-><init>([Lnicoid/network238/okio/ByteString;[ILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    return-object v1

    .line 52
    :cond_8
    move-object/from16 v5, p0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "the empty byte string is not a supported option"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
