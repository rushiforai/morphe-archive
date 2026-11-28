.class public final Lnicoid/network238/okio/internal/-SegmentedByteString;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000L\n\u0002\u0010\u0015\n\u0002\u0010\u0008\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0010\u0012\n\u0002\u0010\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0005\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0010\u000b\n\u0002\u0008\u0007\n\u0002\u0010\u0000\n\u0002\u0008\u0004\u001a+\u0010\u0005\u001a\u00020\u0001*\u00020\u00002\u0006\u0010\u0002\u001a\u00020\u00012\u0006\u0010\u0003\u001a\u00020\u00012\u0006\u0010\u0004\u001a\u00020\u0001H\u0000\u00a2\u0006\u0004\u0008\u0005\u0010\u0006\u001a\u001b\u0010\t\u001a\u00020\u0001*\u00020\u00072\u0006\u0010\u0008\u001a\u00020\u0001H\u0000\u00a2\u0006\u0004\u0008\t\u0010\n\u001a7\u0010\u000f\u001a\u00020\r*\u00020\u00072\u001e\u0010\u000e\u001a\u001a\u0012\u0004\u0012\u00020\u000c\u0012\u0004\u0012\u00020\u0001\u0012\u0004\u0012\u00020\u0001\u0012\u0004\u0012\u00020\r0\u000bH\u0080\u0008\u00f8\u0001\u0000\u00a2\u0006\u0004\u0008\u000f\u0010\u0010\u001aD\u0010\u000f\u001a\u00020\r*\u00020\u00072\u0006\u0010\u0011\u001a\u00020\u00012\u0006\u0010\u0012\u001a\u00020\u00012\u001e\u0010\u000e\u001a\u001a\u0012\u0004\u0012\u00020\u000c\u0012\u0004\u0012\u00020\u0001\u0012\u0004\u0012\u00020\u0001\u0012\u0004\u0012\u00020\r0\u000bH\u0082\u0008\u00a2\u0006\u0004\u0008\u000f\u0010\u0013\u001a$\u0010\u0015\u001a\u00020\u0014*\u00020\u00072\u0006\u0010\u0011\u001a\u00020\u00012\u0006\u0010\u0012\u001a\u00020\u0001H\u0080\u0008\u00a2\u0006\u0004\u0008\u0015\u0010\u0016\u001a\u001c\u0010\u0018\u001a\u00020\u0017*\u00020\u00072\u0006\u0010\u0008\u001a\u00020\u0001H\u0080\u0008\u00a2\u0006\u0004\u0008\u0018\u0010\u0019\u001a\u0014\u0010\u001a\u001a\u00020\u0001*\u00020\u0007H\u0080\u0008\u00a2\u0006\u0004\u0008\u001a\u0010\u001b\u001a\u0014\u0010\u001c\u001a\u00020\u000c*\u00020\u0007H\u0080\u0008\u00a2\u0006\u0004\u0008\u001c\u0010\u001d\u001a,\u0010\"\u001a\u00020\r*\u00020\u00072\u0006\u0010\u001f\u001a\u00020\u001e2\u0006\u0010 \u001a\u00020\u00012\u0006\u0010!\u001a\u00020\u0001H\u0080\u0008\u00a2\u0006\u0004\u0008\"\u0010#\u001a4\u0010\'\u001a\u00020&*\u00020\u00072\u0006\u0010 \u001a\u00020\u00012\u0006\u0010$\u001a\u00020\u00142\u0006\u0010%\u001a\u00020\u00012\u0006\u0010!\u001a\u00020\u0001H\u0080\u0008\u00a2\u0006\u0004\u0008\'\u0010(\u001a4\u0010\'\u001a\u00020&*\u00020\u00072\u0006\u0010 \u001a\u00020\u00012\u0006\u0010$\u001a\u00020\u000c2\u0006\u0010%\u001a\u00020\u00012\u0006\u0010!\u001a\u00020\u0001H\u0080\u0008\u00a2\u0006\u0004\u0008\'\u0010)\u001a4\u0010,\u001a\u00020\r*\u00020\u00072\u0006\u0010 \u001a\u00020\u00012\u0006\u0010*\u001a\u00020\u000c2\u0006\u0010+\u001a\u00020\u00012\u0006\u0010!\u001a\u00020\u0001H\u0080\u0008\u00a2\u0006\u0004\u0008,\u0010-\u001a\u001e\u0010/\u001a\u00020&*\u00020\u00072\u0008\u0010$\u001a\u0004\u0018\u00010.H\u0080\u0008\u00a2\u0006\u0004\u0008/\u00100\u001a\u0014\u00101\u001a\u00020\u0001*\u00020\u0007H\u0080\u0008\u00a2\u0006\u0004\u00081\u0010\u001b\u0082\u0002\u0007\n\u0005\u0008\u009920\u0001\u00a8\u00062"
    }
    d2 = {
        "",
        "",
        "value",
        "fromIndex",
        "toIndex",
        "binarySearch",
        "([IIII)I",
        "Lnicoid/network238/okio/SegmentedByteString;",
        "pos",
        "segment",
        "(Lnicoid/network238/okio/SegmentedByteString;I)I",
        "Lnicoid/network238/kotlin/Function3;",
        "",
        "",
        "action",
        "forEachSegment",
        "(Lnicoid/network238/okio/SegmentedByteString;Lnicoid/network238/kotlin/jvm/functions/Function3;)V",
        "beginIndex",
        "endIndex",
        "(Lnicoid/network238/okio/SegmentedByteString;IILnicoid/network238/kotlin/jvm/functions/Function3;)V",
        "Lnicoid/network238/okio/ByteString;",
        "commonSubstring",
        "(Lnicoid/network238/okio/SegmentedByteString;II)Lnicoid/network238/okio/ByteString;",
        "",
        "commonInternalGet",
        "(Lnicoid/network238/okio/SegmentedByteString;I)B",
        "commonGetSize",
        "(Lnicoid/network238/okio/SegmentedByteString;)I",
        "commonToByteArray",
        "(Lnicoid/network238/okio/SegmentedByteString;)[B",
        "Lnicoid/network238/okio/Buffer;",
        "buffer",
        "offset",
        "byteCount",
        "commonWrite",
        "(Lnicoid/network238/okio/SegmentedByteString;Lnicoid/network238/okio/Buffer;II)V",
        "other",
        "otherOffset",
        "",
        "commonRangeEquals",
        "(Lnicoid/network238/okio/SegmentedByteString;ILnicoid/network238/okio/ByteString;II)Z",
        "(Lnicoid/network238/okio/SegmentedByteString;I[BII)Z",
        "target",
        "targetOffset",
        "commonCopyInto",
        "(Lnicoid/network238/okio/SegmentedByteString;I[BII)V",
        "",
        "commonEquals",
        "(Lnicoid/network238/okio/SegmentedByteString;Ljava/lang/Object;)Z",
        "commonHashCode",
        "okio"
    }
    k = 0x2
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public static final binarySearch([IIII)I
    .registers 6

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    add-int/lit8 p3, p3, -0x1

    :goto_0
    if-gt p2, p3, :cond_2

    add-int v0, p2, p3

    ushr-int/lit8 v0, v0, 0x1

    .line 38
    aget v1, p0, v0

    if-ge v1, p1, :cond_0

    add-int/lit8 p2, v0, 0x1

    goto :goto_0

    :cond_0
    if-le v1, p1, :cond_1

    add-int/lit8 p3, v0, -0x1

    goto :goto_0

    :cond_1
    return v0

    :cond_2
    neg-int p0, p2

    add-int/lit8 p0, p0, -0x1

    return p0
.end method

.method public static final commonCopyInto(Lnicoid/network238/okio/SegmentedByteString;I[BII)V
    .registers 27
    .param p0, "$this$commonCopyInto"    # Lnicoid/network238/okio/SegmentedByteString;
    .param p1, "offset"    # I
    .param p2, "target"    # [B
    .param p3, "targetOffset"    # I
    .param p4, "byteCount"    # I

    move/from16 v0, p1

    move-object/from16 v1, p2

    move/from16 v2, p4

    const-string v3, "<this>"

    move-object/from16 v4, p0

    invoke-static {v4, v3}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v3, "target"

    invoke-static {v1, v3}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v3, 0x0

    .line 213
    .local v3, "$i$f$commonCopyInto":I
    invoke-virtual {v4}, Lnicoid/network238/okio/SegmentedByteString;->size()I

    move-result v5

    int-to-long v6, v5

    int-to-long v8, v0

    int-to-long v10, v2

    invoke-static/range {v6 .. v11}, Lnicoid/network238/okio/-SegmentedByteString;->checkOffsetAndCount(JJJ)V

    .line 214
    array-length v5, v1

    int-to-long v6, v5

    move/from16 v5, p3

    int-to-long v8, v5

    int-to-long v10, v2

    invoke-static/range {v6 .. v11}, Lnicoid/network238/okio/-SegmentedByteString;->checkOffsetAndCount(JJJ)V

    .line 216
    nop

    .line 217
    add-int v6, v0, v2

    .local v6, "endIndex$iv":I
    move/from16 v7, p1

    .local v7, "beginIndex$iv":I
    move-object/from16 v8, p0

    .local v8, "$this$forEachSegment$iv":Lnicoid/network238/okio/SegmentedByteString;
    const/4 v9, 0x0

    .line 304
    .local v9, "$i$f$forEachSegment":I
    invoke-static {v8, v7}, Lnicoid/network238/okio/internal/-SegmentedByteString;->segment(Lnicoid/network238/okio/SegmentedByteString;I)I

    move-result v10

    .line 305
    .local v10, "s$iv":I
    move v11, v7

    move v12, v5

    .line 306
    .local v11, "pos$iv":I
    .local v12, "targetOffset":I
    :goto_0
    if-ge v11, v6, :cond_1

    .line 307
    if-nez v10, :cond_0

    const/4 v13, 0x0

    goto :goto_1

    :cond_0
    invoke-virtual {v8}, Lnicoid/network238/okio/SegmentedByteString;->getDirectory$okio()[I

    move-result-object v13

    add-int/lit8 v14, v10, -0x1

    aget v13, v13, v14

    .line 308
    .local v13, "segmentOffset$iv":I
    :goto_1
    invoke-virtual {v8}, Lnicoid/network238/okio/SegmentedByteString;->getDirectory$okio()[I

    move-result-object v14

    aget v14, v14, v10

    sub-int/2addr v14, v13

    .line 309
    .local v14, "segmentSize$iv":I
    invoke-virtual {v8}, Lnicoid/network238/okio/SegmentedByteString;->getDirectory$okio()[I

    move-result-object v15

    invoke-virtual {v8}, Lnicoid/network238/okio/SegmentedByteString;->getSegments$okio()[[B

    move-result-object v16

    move-object/from16 v0, v16

    check-cast v0, [Ljava/lang/Object;

    array-length v0, v0

    add-int/2addr v0, v10

    aget v0, v15, v0

    .line 311
    .local v0, "segmentPos$iv":I
    add-int v15, v13, v14

    invoke-static {v6, v15}, Ljava/lang/Math;->min(II)I

    move-result v15

    sub-int/2addr v15, v11

    .line 312
    .local v15, "byteCount$iv":I
    sub-int v16, v11, v13

    add-int v16, v0, v16

    .line 313
    .local v16, "offset$iv":I
    invoke-virtual {v8}, Lnicoid/network238/okio/SegmentedByteString;->getSegments$okio()[[B

    move-result-object v17

    aget-object v17, v17, v10

    .local v17, "data":[B
    move/from16 v18, v16

    .local v18, "offset":I
    move/from16 v19, v15

    .local v19, "byteCount":I
    move-object/from16 v20, v17

    .end local v17    # "data":[B
    .local v20, "data":[B
    const/16 v17, 0x0

    .line 218
    .local v17, "$i$a$-forEachSegment--SegmentedByteString$commonCopyInto$1":I
    move/from16 v21, v0

    .end local v0    # "segmentPos$iv":I
    .local v21, "segmentPos$iv":I
    add-int v0, v18, v19

    move/from16 v2, v18

    move/from16 v18, v3

    move-object/from16 v3, v20

    .end local v20    # "data":[B
    .local v2, "offset":I
    .local v3, "data":[B
    .local v18, "$i$f$commonCopyInto":I
    invoke-static {v3, v1, v12, v2, v0}, Lnicoid/network238/kotlin/collections/ArraysKt;->copyInto([B[BIII)[B

    .line 219
    add-int v12, v12, v19

    .line 220
    nop

    .line 313
    .end local v2    # "offset":I
    .end local v3    # "data":[B
    .end local v17    # "$i$a$-forEachSegment--SegmentedByteString$commonCopyInto$1":I
    .end local v19    # "byteCount":I
    nop

    .line 314
    add-int/2addr v11, v15

    .line 315
    nop

    .end local v13    # "segmentOffset$iv":I
    .end local v14    # "segmentSize$iv":I
    .end local v15    # "byteCount$iv":I
    .end local v16    # "offset$iv":I
    .end local v21    # "segmentPos$iv":I
    add-int/lit8 v10, v10, 0x1

    move/from16 v0, p1

    move/from16 v2, p4

    move/from16 v3, v18

    goto :goto_0

    .line 317
    .end local v18    # "$i$f$commonCopyInto":I
    .local v3, "$i$f$commonCopyInto":I
    :cond_1
    nop

    .line 221
    .end local v6    # "endIndex$iv":I
    .end local v7    # "beginIndex$iv":I
    .end local v8    # "$this$forEachSegment$iv":Lnicoid/network238/okio/SegmentedByteString;
    .end local v9    # "$i$f$forEachSegment":I
    .end local v10    # "s$iv":I
    .end local v11    # "pos$iv":I
    return-void
.end method

.method public static final commonEquals(Lnicoid/network238/okio/SegmentedByteString;Ljava/lang/Object;)Z
    .registers 7
    .param p0, "$this$commonEquals"    # Lnicoid/network238/okio/SegmentedByteString;
    .param p1, "other"    # Ljava/lang/Object;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 224
    .local v0, "$i$f$commonEquals":I
    nop

    .line 225
    const/4 v1, 0x1

    if-ne p1, p0, :cond_0

    goto :goto_0

    .line 226
    :cond_0
    instance-of v2, p1, Lnicoid/network238/okio/ByteString;

    const/4 v3, 0x0

    if-eqz v2, :cond_2

    move-object v2, p1

    check-cast v2, Lnicoid/network238/okio/ByteString;

    invoke-virtual {v2}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v2

    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->size()I

    move-result v4

    if-ne v2, v4, :cond_1

    move-object v2, p1

    check-cast v2, Lnicoid/network238/okio/ByteString;

    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->size()I

    move-result v4

    invoke-virtual {p0, v3, v2, v3, v4}, Lnicoid/network238/okio/SegmentedByteString;->rangeEquals(ILnicoid/network238/okio/ByteString;II)Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_0

    :cond_1
    move v1, v3

    goto :goto_0

    .line 227
    :cond_2
    move v1, v3

    .line 224
    :goto_0
    return v1
.end method

.method public static final commonGetSize(Lnicoid/network238/okio/SegmentedByteString;)I
    .registers 4
    .param p0, "$this$commonGetSize"    # Lnicoid/network238/okio/SegmentedByteString;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 140
    .local v0, "$i$f$commonGetSize":I
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getDirectory$okio()[I

    move-result-object v1

    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getSegments$okio()[[B

    move-result-object v2

    check-cast v2, [Ljava/lang/Object;

    array-length v2, v2

    add-int/lit8 v2, v2, -0x1

    aget v1, v1, v2

    return v1
.end method

.method public static final commonHashCode(Lnicoid/network238/okio/SegmentedByteString;)I
    .registers 19
    .param p0, "$this$commonHashCode"    # Lnicoid/network238/okio/SegmentedByteString;

    move-object/from16 v0, p0

    const-string v1, "<this>"

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v1, 0x0

    .line 232
    .local v1, "$i$f$commonHashCode":I
    const/4 v2, 0x0

    .local v2, "result":I
    invoke-virtual {v0}, Lnicoid/network238/okio/SegmentedByteString;->getHashCode$okio()I

    move-result v2

    .line 233
    if-eqz v2, :cond_0

    return v2

    .line 236
    :cond_0
    const/4 v2, 0x1

    .line 237
    move-object/from16 v3, p0

    .local v3, "$this$forEachSegment$iv":Lnicoid/network238/okio/SegmentedByteString;
    const/4 v4, 0x0

    .line 318
    .local v4, "$i$f$forEachSegment":I
    invoke-virtual {v3}, Lnicoid/network238/okio/SegmentedByteString;->getSegments$okio()[[B

    move-result-object v5

    check-cast v5, [Ljava/lang/Object;

    array-length v5, v5

    .line 319
    .local v5, "segmentCount$iv":I
    const/4 v6, 0x0

    .line 320
    .local v6, "s$iv":I
    const/4 v7, 0x0

    .line 321
    .local v7, "pos$iv":I
    :goto_0
    if-ge v6, v5, :cond_2

    .line 322
    invoke-virtual {v3}, Lnicoid/network238/okio/SegmentedByteString;->getDirectory$okio()[I

    move-result-object v8

    add-int v9, v5, v6

    aget v8, v8, v9

    .line 323
    .local v8, "segmentPos$iv":I
    invoke-virtual {v3}, Lnicoid/network238/okio/SegmentedByteString;->getDirectory$okio()[I

    move-result-object v9

    aget v9, v9, v6

    .line 325
    .local v9, "nextSegmentOffset$iv":I
    invoke-virtual {v3}, Lnicoid/network238/okio/SegmentedByteString;->getSegments$okio()[[B

    move-result-object v10

    aget-object v10, v10, v6

    .local v10, "data":[B
    sub-int v11, v9, v7

    .local v11, "byteCount":I
    move v12, v8

    .local v12, "offset":I
    const/4 v13, 0x0

    .line 238
    .local v13, "$i$a$-forEachSegment--SegmentedByteString$commonHashCode$1":I
    move v14, v12

    .line 239
    .local v14, "i":I
    add-int v15, v12, v11

    .line 240
    .local v15, "limit":I
    :goto_1
    if-ge v14, v15, :cond_1

    .line 241
    mul-int/lit8 v16, v2, 0x1f

    aget-byte v17, v10, v14

    add-int v2, v16, v17

    .line 242
    add-int/lit8 v14, v14, 0x1

    goto :goto_1

    .line 244
    :cond_1
    nop

    .line 325
    .end local v10    # "data":[B
    .end local v11    # "byteCount":I
    .end local v12    # "offset":I
    .end local v13    # "$i$a$-forEachSegment--SegmentedByteString$commonHashCode$1":I
    .end local v14    # "i":I
    .end local v15    # "limit":I
    nop

    .line 326
    move v7, v9

    .line 327
    nop

    .end local v8    # "segmentPos$iv":I
    .end local v9    # "nextSegmentOffset$iv":I
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 329
    :cond_2
    nop

    .line 245
    .end local v3    # "$this$forEachSegment$iv":Lnicoid/network238/okio/SegmentedByteString;
    .end local v4    # "$i$f$forEachSegment":I
    .end local v5    # "segmentCount$iv":I
    .end local v6    # "s$iv":I
    .end local v7    # "pos$iv":I
    invoke-virtual {v0, v2}, Lnicoid/network238/okio/SegmentedByteString;->setHashCode$okio(I)V

    .line 246
    return v2
.end method

.method public static final commonInternalGet(Lnicoid/network238/okio/SegmentedByteString;I)B
    .registers 10
    .param p0, "$this$commonInternalGet"    # Lnicoid/network238/okio/SegmentedByteString;
    .param p1, "pos"    # I

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 133
    .local v0, "$i$f$commonInternalGet":I
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getDirectory$okio()[I

    move-result-object v1

    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getSegments$okio()[[B

    move-result-object v2

    check-cast v2, [Ljava/lang/Object;

    array-length v2, v2

    add-int/lit8 v2, v2, -0x1

    aget v1, v1, v2

    int-to-long v2, v1

    int-to-long v4, p1

    const-wide/16 v6, 0x1

    invoke-static/range {v2 .. v7}, Lnicoid/network238/okio/-SegmentedByteString;->checkOffsetAndCount(JJJ)V

    .line 134
    invoke-static {p0, p1}, Lnicoid/network238/okio/internal/-SegmentedByteString;->segment(Lnicoid/network238/okio/SegmentedByteString;I)I

    move-result v1

    .line 135
    .local v1, "segment":I
    if-nez v1, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getDirectory$okio()[I

    move-result-object v2

    add-int/lit8 v3, v1, -0x1

    aget v2, v2, v3

    .line 136
    .local v2, "segmentOffset":I
    :goto_0
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getDirectory$okio()[I

    move-result-object v3

    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getSegments$okio()[[B

    move-result-object v4

    check-cast v4, [Ljava/lang/Object;

    array-length v4, v4

    add-int/2addr v4, v1

    aget v3, v3, v4

    .line 137
    .local v3, "segmentPos":I
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getSegments$okio()[[B

    move-result-object v4

    aget-object v4, v4, v1

    sub-int v5, p1, v2

    add-int/2addr v5, v3

    aget-byte v4, v4, v5

    return v4
.end method

.method public static final commonRangeEquals(Lnicoid/network238/okio/SegmentedByteString;ILnicoid/network238/okio/ByteString;II)Z
    .registers 27
    .param p0, "$this$commonRangeEquals"    # Lnicoid/network238/okio/SegmentedByteString;
    .param p1, "offset"    # I
    .param p2, "other"    # Lnicoid/network238/okio/ByteString;
    .param p3, "otherOffset"    # I
    .param p4, "byteCount"    # I

    move/from16 v0, p1

    move-object/from16 v1, p2

    const-string v2, "<this>"

    move-object/from16 v3, p0

    invoke-static {v3, v2}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "other"

    invoke-static {v1, v2}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v2, 0x0

    .line 177
    .local v2, "$i$f$commonRangeEquals":I
    if-ltz v0, :cond_4

    invoke-virtual {v3}, Lnicoid/network238/okio/SegmentedByteString;->size()I

    move-result v5

    sub-int v5, v5, p4

    if-le v0, v5, :cond_0

    move/from16 v18, v2

    const/16 v21, 0x0

    goto/16 :goto_2

    .line 179
    :cond_0
    nop

    .line 180
    add-int v5, v0, p4

    .local v5, "endIndex$iv":I
    move/from16 v6, p1

    .local v6, "beginIndex$iv":I
    move-object/from16 v7, p0

    .local v7, "$this$forEachSegment$iv":Lnicoid/network238/okio/SegmentedByteString;
    const/4 v8, 0x0

    .line 276
    .local v8, "$i$f$forEachSegment":I
    invoke-static {v7, v6}, Lnicoid/network238/okio/internal/-SegmentedByteString;->segment(Lnicoid/network238/okio/SegmentedByteString;I)I

    move-result v9

    .line 277
    .local v9, "s$iv":I
    move v10, v6

    move/from16 v11, p3

    .line 278
    .local v10, "pos$iv":I
    .local v11, "otherOffset":I
    :goto_0
    if-ge v10, v5, :cond_3

    .line 279
    if-nez v9, :cond_1

    const/4 v12, 0x0

    goto :goto_1

    :cond_1
    invoke-virtual {v7}, Lnicoid/network238/okio/SegmentedByteString;->getDirectory$okio()[I

    move-result-object v12

    add-int/lit8 v13, v9, -0x1

    aget v12, v12, v13

    .line 280
    .local v12, "segmentOffset$iv":I
    :goto_1
    invoke-virtual {v7}, Lnicoid/network238/okio/SegmentedByteString;->getDirectory$okio()[I

    move-result-object v13

    aget v13, v13, v9

    sub-int/2addr v13, v12

    .line 281
    .local v13, "segmentSize$iv":I
    invoke-virtual {v7}, Lnicoid/network238/okio/SegmentedByteString;->getDirectory$okio()[I

    move-result-object v14

    invoke-virtual {v7}, Lnicoid/network238/okio/SegmentedByteString;->getSegments$okio()[[B

    move-result-object v15

    check-cast v15, [Ljava/lang/Object;

    array-length v15, v15

    add-int/2addr v15, v9

    aget v14, v14, v15

    .line 283
    .local v14, "segmentPos$iv":I
    add-int v15, v12, v13

    invoke-static {v5, v15}, Ljava/lang/Math;->min(II)I

    move-result v15

    sub-int/2addr v15, v10

    .line 284
    .local v15, "byteCount$iv":I
    sub-int v16, v10, v12

    add-int v16, v14, v16

    .line 285
    .local v16, "offset$iv":I
    invoke-virtual {v7}, Lnicoid/network238/okio/SegmentedByteString;->getSegments$okio()[[B

    move-result-object v17

    aget-object v17, v17, v9

    .local v17, "data":[B
    move/from16 v18, v16

    .local v18, "offset":I
    move/from16 v19, v15

    .local v19, "byteCount":I
    move-object/from16 v20, v17

    .end local v17    # "data":[B
    .local v20, "data":[B
    const/16 v17, 0x0

    .line 181
    .local v17, "$i$a$-forEachSegment--SegmentedByteString$commonRangeEquals$1":I
    move/from16 v4, v18

    move/from16 v0, v19

    const/16 v21, 0x0

    move/from16 v18, v2

    move-object/from16 v2, v20

    .end local v19    # "byteCount":I
    .end local v20    # "data":[B
    .local v0, "byteCount":I
    .local v2, "data":[B
    .local v4, "offset":I
    .local v18, "$i$f$commonRangeEquals":I
    invoke-virtual {v1, v11, v2, v4, v0}, Lnicoid/network238/okio/ByteString;->rangeEquals(I[BII)Z

    move-result v19

    if-nez v19, :cond_2

    return v21

    .line 182
    :cond_2
    add-int/2addr v11, v0

    .line 183
    nop

    .line 285
    .end local v0    # "byteCount":I
    .end local v2    # "data":[B
    .end local v4    # "offset":I
    .end local v17    # "$i$a$-forEachSegment--SegmentedByteString$commonRangeEquals$1":I
    nop

    .line 286
    add-int/2addr v10, v15

    .line 287
    nop

    .end local v12    # "segmentOffset$iv":I
    .end local v13    # "segmentSize$iv":I
    .end local v14    # "segmentPos$iv":I
    .end local v15    # "byteCount$iv":I
    .end local v16    # "offset$iv":I
    add-int/lit8 v9, v9, 0x1

    move/from16 v0, p1

    move/from16 v2, v18

    goto :goto_0

    .line 289
    .end local v18    # "$i$f$commonRangeEquals":I
    .local v2, "$i$f$commonRangeEquals":I
    :cond_3
    nop

    .line 184
    .end local v5    # "endIndex$iv":I
    .end local v6    # "beginIndex$iv":I
    .end local v7    # "$this$forEachSegment$iv":Lnicoid/network238/okio/SegmentedByteString;
    .end local v8    # "$i$f$forEachSegment":I
    .end local v9    # "s$iv":I
    .end local v10    # "pos$iv":I
    const/4 v0, 0x1

    return v0

    .line 177
    .end local v11    # "otherOffset":I
    :cond_4
    move/from16 v18, v2

    const/16 v21, 0x0

    .end local v2    # "$i$f$commonRangeEquals":I
    .restart local v18    # "$i$f$commonRangeEquals":I
    :goto_2
    return v21
.end method

.method public static final commonRangeEquals(Lnicoid/network238/okio/SegmentedByteString;I[BII)Z
    .registers 27
    .param p0, "$this$commonRangeEquals"    # Lnicoid/network238/okio/SegmentedByteString;
    .param p1, "offset"    # I
    .param p2, "other"    # [B
    .param p3, "otherOffset"    # I
    .param p4, "byteCount"    # I

    move/from16 v0, p1

    move-object/from16 v1, p2

    move/from16 v2, p3

    const-string v3, "<this>"

    move-object/from16 v4, p0

    invoke-static {v4, v3}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v3, "other"

    invoke-static {v1, v3}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v3, 0x0

    .line 193
    .local v3, "$i$f$commonRangeEquals":I
    if-ltz v0, :cond_5

    invoke-virtual {v4}, Lnicoid/network238/okio/SegmentedByteString;->size()I

    move-result v6

    sub-int v6, v6, p4

    if-gt v0, v6, :cond_5

    .line 194
    if-ltz v2, :cond_4

    array-length v6, v1

    sub-int v6, v6, p4

    if-le v2, v6, :cond_0

    move/from16 v19, v3

    const/16 v17, 0x0

    goto/16 :goto_2

    .line 199
    :cond_0
    nop

    .line 200
    add-int v6, v0, p4

    .local v6, "endIndex$iv":I
    move/from16 v7, p1

    .local v7, "beginIndex$iv":I
    move-object/from16 v8, p0

    .local v8, "$this$forEachSegment$iv":Lnicoid/network238/okio/SegmentedByteString;
    const/4 v9, 0x0

    .line 290
    .local v9, "$i$f$forEachSegment":I
    invoke-static {v8, v7}, Lnicoid/network238/okio/internal/-SegmentedByteString;->segment(Lnicoid/network238/okio/SegmentedByteString;I)I

    move-result v10

    .line 291
    .local v10, "s$iv":I
    move v11, v7

    move v12, v2

    .line 292
    .local v11, "pos$iv":I
    .local v12, "otherOffset":I
    :goto_0
    if-ge v11, v6, :cond_3

    .line 293
    if-nez v10, :cond_1

    const/4 v13, 0x0

    goto :goto_1

    :cond_1
    invoke-virtual {v8}, Lnicoid/network238/okio/SegmentedByteString;->getDirectory$okio()[I

    move-result-object v13

    add-int/lit8 v14, v10, -0x1

    aget v13, v13, v14

    .line 294
    .local v13, "segmentOffset$iv":I
    :goto_1
    invoke-virtual {v8}, Lnicoid/network238/okio/SegmentedByteString;->getDirectory$okio()[I

    move-result-object v14

    aget v14, v14, v10

    sub-int/2addr v14, v13

    .line 295
    .local v14, "segmentSize$iv":I
    invoke-virtual {v8}, Lnicoid/network238/okio/SegmentedByteString;->getDirectory$okio()[I

    move-result-object v15

    invoke-virtual {v8}, Lnicoid/network238/okio/SegmentedByteString;->getSegments$okio()[[B

    move-result-object v16

    const/16 v17, 0x0

    move-object/from16 v5, v16

    check-cast v5, [Ljava/lang/Object;

    array-length v5, v5

    add-int/2addr v5, v10

    aget v5, v15, v5

    .line 297
    .local v5, "segmentPos$iv":I
    add-int v15, v13, v14

    invoke-static {v6, v15}, Ljava/lang/Math;->min(II)I

    move-result v15

    sub-int/2addr v15, v11

    .line 298
    .local v15, "byteCount$iv":I
    sub-int v16, v11, v13

    add-int v16, v5, v16

    .line 299
    .local v16, "offset$iv":I
    invoke-virtual {v8}, Lnicoid/network238/okio/SegmentedByteString;->getSegments$okio()[[B

    move-result-object v18

    aget-object v18, v18, v10

    .local v18, "data":[B
    move/from16 v19, v16

    .local v19, "offset":I
    move/from16 v20, v15

    .local v20, "byteCount":I
    move-object/from16 v21, v18

    .end local v18    # "data":[B
    .local v21, "data":[B
    const/16 v18, 0x0

    .line 201
    .local v18, "$i$a$-forEachSegment--SegmentedByteString$commonRangeEquals$2":I
    move/from16 v0, v19

    move/from16 v2, v20

    move/from16 v19, v3

    move-object/from16 v3, v21

    .end local v20    # "byteCount":I
    .end local v21    # "data":[B
    .local v0, "offset":I
    .local v2, "byteCount":I
    .local v3, "data":[B
    .local v19, "$i$f$commonRangeEquals":I
    invoke-static {v3, v0, v1, v12, v2}, Lnicoid/network238/okio/-SegmentedByteString;->arrayRangeEquals([BI[BII)Z

    move-result v20

    if-nez v20, :cond_2

    return v17

    .line 202
    :cond_2
    add-int/2addr v12, v2

    .line 203
    nop

    .line 299
    .end local v0    # "offset":I
    .end local v2    # "byteCount":I
    .end local v3    # "data":[B
    .end local v18    # "$i$a$-forEachSegment--SegmentedByteString$commonRangeEquals$2":I
    nop

    .line 300
    add-int/2addr v11, v15

    .line 301
    nop

    .end local v5    # "segmentPos$iv":I
    .end local v13    # "segmentOffset$iv":I
    .end local v14    # "segmentSize$iv":I
    .end local v15    # "byteCount$iv":I
    .end local v16    # "offset$iv":I
    add-int/lit8 v10, v10, 0x1

    move/from16 v0, p1

    move/from16 v2, p3

    move/from16 v3, v19

    goto :goto_0

    .line 303
    .end local v19    # "$i$f$commonRangeEquals":I
    .local v3, "$i$f$commonRangeEquals":I
    :cond_3
    nop

    .line 204
    .end local v6    # "endIndex$iv":I
    .end local v7    # "beginIndex$iv":I
    .end local v8    # "$this$forEachSegment$iv":Lnicoid/network238/okio/SegmentedByteString;
    .end local v9    # "$i$f$forEachSegment":I
    .end local v10    # "s$iv":I
    .end local v11    # "pos$iv":I
    const/4 v0, 0x1

    return v0

    .line 194
    .end local v12    # "otherOffset":I
    :cond_4
    move/from16 v19, v3

    const/16 v17, 0x0

    .end local v3    # "$i$f$commonRangeEquals":I
    .restart local v19    # "$i$f$commonRangeEquals":I
    goto :goto_2

    .line 193
    .end local v19    # "$i$f$commonRangeEquals":I
    .restart local v3    # "$i$f$commonRangeEquals":I
    :cond_5
    move/from16 v19, v3

    const/16 v17, 0x0

    .line 196
    .end local v3    # "$i$f$commonRangeEquals":I
    .restart local v19    # "$i$f$commonRangeEquals":I
    :goto_2
    return v17
.end method

.method public static final commonSubstring(Lnicoid/network238/okio/SegmentedByteString;II)Lnicoid/network238/okio/ByteString;
    .registers 15
    .param p0, "$this$commonSubstring"    # Lnicoid/network238/okio/SegmentedByteString;
    .param p1, "beginIndex"    # I
    .param p2, "endIndex"    # I

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 103
    .local v0, "$i$f$commonSubstring":I
    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ltz p1, :cond_0

    move v3, v2

    goto :goto_0

    :cond_0
    move v3, v1

    :goto_0
    if-eqz v3, :cond_a

    .line 104
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->size()I

    move-result v3

    if-gt p2, v3, :cond_1

    move v3, v2

    goto :goto_1

    :cond_1
    move v3, v1

    :goto_1
    const-string v4, "endIndex="

    if-eqz v3, :cond_9

    .line 106
    sub-int v3, p2, p1

    .line 107
    .local v3, "subLen":I
    if-gez v3, :cond_2

    move v2, v1

    :cond_2
    if-eqz v2, :cond_8

    .line 109
    nop

    .line 110
    if-nez p1, :cond_3

    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->size()I

    move-result v2

    if-ne p2, v2, :cond_3

    move-object v1, p0

    check-cast v1, Lnicoid/network238/okio/ByteString;

    return-object v1

    .line 111
    :cond_3
    if-ne p1, p2, :cond_4

    sget-object v1, Lnicoid/network238/okio/ByteString;->EMPTY:Lnicoid/network238/okio/ByteString;

    return-object v1

    .line 114
    :cond_4
    invoke-static {p0, p1}, Lnicoid/network238/okio/internal/-SegmentedByteString;->segment(Lnicoid/network238/okio/SegmentedByteString;I)I

    move-result v2

    .line 115
    .local v2, "beginSegment":I
    add-int/lit8 v4, p2, -0x1

    invoke-static {p0, v4}, Lnicoid/network238/okio/internal/-SegmentedByteString;->segment(Lnicoid/network238/okio/SegmentedByteString;I)I

    move-result v4

    .line 117
    .local v4, "endSegment":I
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getSegments$okio()[[B

    move-result-object v5

    check-cast v5, [Ljava/lang/Object;

    add-int/lit8 v6, v4, 0x1

    invoke-static {v5, v2, v6}, Lnicoid/network238/kotlin/collections/ArraysKt;->copyOfRange([Ljava/lang/Object;II)[Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [[B

    .line 118
    .local v5, "newSegments":[[B
    move-object v6, v5

    check-cast v6, [Ljava/lang/Object;

    array-length v6, v6

    mul-int/lit8 v6, v6, 0x2

    new-array v6, v6, [I

    .line 119
    .local v6, "newDirectory":[I
    const/4 v7, 0x0

    .line 120
    .local v7, "index":I
    move v8, v2

    .local v8, "s":I
    if-gt v8, v4, :cond_6

    .line 121
    :goto_2
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getDirectory$okio()[I

    move-result-object v9

    aget v9, v9, v8

    sub-int/2addr v9, p1

    invoke-static {v9, v3}, Ljava/lang/Math;->min(II)I

    move-result v9

    aput v9, v6, v7

    .line 122
    add-int/lit8 v9, v7, 0x1

    .end local v7    # "index":I
    .local v9, "index":I
    move-object v10, v5

    check-cast v10, [Ljava/lang/Object;

    array-length v10, v10

    add-int/2addr v7, v10

    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getDirectory$okio()[I

    move-result-object v10

    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getSegments$okio()[[B

    move-result-object v11

    check-cast v11, [Ljava/lang/Object;

    array-length v11, v11

    add-int/2addr v11, v8

    aget v10, v10, v11

    aput v10, v6, v7

    .line 120
    if-eq v8, v4, :cond_5

    add-int/lit8 v8, v8, 0x1

    move v7, v9

    goto :goto_2

    :cond_5
    move v7, v9

    .line 126
    .end local v8    # "s":I
    .end local v9    # "index":I
    .restart local v7    # "index":I
    :cond_6
    if-eqz v2, :cond_7

    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getDirectory$okio()[I

    move-result-object v1

    add-int/lit8 v8, v2, -0x1

    aget v1, v1, v8

    .line 127
    .local v1, "segmentOffset":I
    :cond_7
    move-object v8, v5

    check-cast v8, [Ljava/lang/Object;

    array-length v8, v8

    aget v9, v6, v8

    sub-int v10, p1, v1

    add-int/2addr v9, v10

    aput v9, v6, v8

    .line 129
    new-instance v8, Lnicoid/network238/okio/SegmentedByteString;

    invoke-direct {v8, v5, v6}, Lnicoid/network238/okio/SegmentedByteString;-><init>([[B[I)V

    check-cast v8, Lnicoid/network238/okio/ByteString;

    return-object v8

    .line 249
    .end local v1    # "segmentOffset":I
    .end local v2    # "beginSegment":I
    .end local v4    # "endSegment":I
    .end local v5    # "newSegments":[[B
    .end local v6    # "newDirectory":[I
    .end local v7    # "index":I
    :cond_8
    const/4 v1, 0x0

    .line 107
    .local v1, "$i$a$-require--SegmentedByteString$commonSubstring$3":I
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, " < beginIndex="

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .end local v1    # "$i$a$-require--SegmentedByteString$commonSubstring$3":I
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 249
    .end local v3    # "subLen":I
    :cond_9
    const/4 v1, 0x0

    .line 104
    .local v1, "$i$a$-require--SegmentedByteString$commonSubstring$2":I
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " > length("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const/16 v3, 0x29

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .end local v1    # "$i$a$-require--SegmentedByteString$commonSubstring$2":I
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 249
    :cond_a
    const/4 v1, 0x0

    .line 103
    .local v1, "$i$a$-require--SegmentedByteString$commonSubstring$1":I
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "beginIndex="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " < 0"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .end local v1    # "$i$a$-require--SegmentedByteString$commonSubstring$1":I
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public static final commonToByteArray(Lnicoid/network238/okio/SegmentedByteString;)[B
    .registers 16
    .param p0, "$this$commonToByteArray"    # Lnicoid/network238/okio/SegmentedByteString;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 143
    .local v0, "$i$f$commonToByteArray":I
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->size()I

    move-result v1

    new-array v1, v1, [B

    .line 144
    .local v1, "result":[B
    const/4 v2, 0x0

    .line 145
    .local v2, "resultPos":I
    move-object v3, p0

    .local v3, "$this$forEachSegment$iv":Lnicoid/network238/okio/SegmentedByteString;
    const/4 v4, 0x0

    .line 250
    .local v4, "$i$f$forEachSegment":I
    invoke-virtual {v3}, Lnicoid/network238/okio/SegmentedByteString;->getSegments$okio()[[B

    move-result-object v5

    check-cast v5, [Ljava/lang/Object;

    array-length v5, v5

    .line 251
    .local v5, "segmentCount$iv":I
    const/4 v6, 0x0

    .line 252
    .local v6, "s$iv":I
    const/4 v7, 0x0

    .line 253
    .local v7, "pos$iv":I
    :goto_0
    if-ge v6, v5, :cond_0

    .line 254
    invoke-virtual {v3}, Lnicoid/network238/okio/SegmentedByteString;->getDirectory$okio()[I

    move-result-object v8

    add-int v9, v5, v6

    aget v8, v8, v9

    .line 255
    .local v8, "segmentPos$iv":I
    invoke-virtual {v3}, Lnicoid/network238/okio/SegmentedByteString;->getDirectory$okio()[I

    move-result-object v9

    aget v9, v9, v6

    .line 257
    .local v9, "nextSegmentOffset$iv":I
    invoke-virtual {v3}, Lnicoid/network238/okio/SegmentedByteString;->getSegments$okio()[[B

    move-result-object v10

    aget-object v10, v10, v6

    .local v10, "data":[B
    sub-int v11, v9, v7

    .local v11, "byteCount":I
    move v12, v8

    .local v12, "offset":I
    const/4 v13, 0x0

    .line 146
    .local v13, "$i$a$-forEachSegment--SegmentedByteString$commonToByteArray$1":I
    nop

    .line 147
    nop

    .line 148
    nop

    .line 149
    nop

    .line 150
    add-int v14, v12, v11

    .line 146
    invoke-static {v10, v1, v2, v12, v14}, Lnicoid/network238/kotlin/collections/ArraysKt;->copyInto([B[BIII)[B

    .line 152
    add-int/2addr v2, v11

    .line 153
    nop

    .line 257
    .end local v10    # "data":[B
    .end local v11    # "byteCount":I
    .end local v12    # "offset":I
    .end local v13    # "$i$a$-forEachSegment--SegmentedByteString$commonToByteArray$1":I
    nop

    .line 258
    move v7, v9

    .line 259
    nop

    .end local v8    # "segmentPos$iv":I
    .end local v9    # "nextSegmentOffset$iv":I
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 261
    :cond_0
    nop

    .line 154
    .end local v3    # "$this$forEachSegment$iv":Lnicoid/network238/okio/SegmentedByteString;
    .end local v4    # "$i$f$forEachSegment":I
    .end local v5    # "segmentCount$iv":I
    .end local v6    # "s$iv":I
    .end local v7    # "pos$iv":I
    return-object v1
.end method

.method public static final commonWrite(Lnicoid/network238/okio/SegmentedByteString;Lnicoid/network238/okio/Buffer;II)V
    .registers 27
    .param p0, "$this$commonWrite"    # Lnicoid/network238/okio/SegmentedByteString;
    .param p1, "buffer"    # Lnicoid/network238/okio/Buffer;
    .param p2, "offset"    # I
    .param p3, "byteCount"    # I

    move-object/from16 v0, p1

    move/from16 v1, p3

    const-string v2, "<this>"

    move-object/from16 v3, p0

    invoke-static {v3, v2}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "buffer"

    invoke-static {v0, v2}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v2, 0x0

    .line 158
    .local v2, "$i$f$commonWrite":I
    add-int v4, p2, v1

    .local v4, "endIndex$iv":I
    move/from16 v5, p2

    .local v5, "beginIndex$iv":I
    move-object/from16 v6, p0

    .local v6, "$this$forEachSegment$iv":Lnicoid/network238/okio/SegmentedByteString;
    const/4 v7, 0x0

    .line 262
    .local v7, "$i$f$forEachSegment":I
    invoke-static {v6, v5}, Lnicoid/network238/okio/internal/-SegmentedByteString;->segment(Lnicoid/network238/okio/SegmentedByteString;I)I

    move-result v8

    .line 263
    .local v8, "s$iv":I
    move v9, v5

    .line 264
    .local v9, "pos$iv":I
    :goto_0
    if-ge v9, v4, :cond_2

    .line 265
    if-nez v8, :cond_0

    const/4 v10, 0x0

    goto :goto_1

    :cond_0
    invoke-virtual {v6}, Lnicoid/network238/okio/SegmentedByteString;->getDirectory$okio()[I

    move-result-object v10

    add-int/lit8 v11, v8, -0x1

    aget v10, v10, v11

    .line 266
    .local v10, "segmentOffset$iv":I
    :goto_1
    invoke-virtual {v6}, Lnicoid/network238/okio/SegmentedByteString;->getDirectory$okio()[I

    move-result-object v11

    aget v11, v11, v8

    sub-int/2addr v11, v10

    .line 267
    .local v11, "segmentSize$iv":I
    invoke-virtual {v6}, Lnicoid/network238/okio/SegmentedByteString;->getDirectory$okio()[I

    move-result-object v12

    invoke-virtual {v6}, Lnicoid/network238/okio/SegmentedByteString;->getSegments$okio()[[B

    move-result-object v13

    check-cast v13, [Ljava/lang/Object;

    array-length v13, v13

    add-int/2addr v13, v8

    aget v12, v12, v13

    .line 269
    .local v12, "segmentPos$iv":I
    add-int v13, v10, v11

    invoke-static {v4, v13}, Ljava/lang/Math;->min(II)I

    move-result v13

    sub-int/2addr v13, v9

    .line 270
    .local v13, "byteCount$iv":I
    sub-int v14, v9, v10

    add-int/2addr v14, v12

    .line 271
    .local v14, "offset$iv":I
    invoke-virtual {v6}, Lnicoid/network238/okio/SegmentedByteString;->getSegments$okio()[[B

    move-result-object v15

    aget-object v15, v15, v8

    .local v15, "data":[B
    move/from16 v16, v13

    .local v16, "byteCount":I
    move/from16 v19, v14

    .local v19, "offset":I
    move-object/from16 v18, v15

    .end local v15    # "data":[B
    .local v18, "data":[B
    const/4 v15, 0x0

    .line 159
    .local v15, "$i$a$-forEachSegment--SegmentedByteString$commonWrite$1":I
    new-instance v17, Lnicoid/network238/okio/Segment;

    add-int v20, v19, v16

    const/16 v21, 0x1

    const/16 v22, 0x0

    invoke-direct/range {v17 .. v22}, Lnicoid/network238/okio/Segment;-><init>([BIIZZ)V

    move-object/from16 v20, v17

    .line 160
    .local v20, "segment":Lnicoid/network238/okio/Segment;
    move/from16 v17, v2

    .end local v2    # "$i$f$commonWrite":I
    .local v17, "$i$f$commonWrite":I
    iget-object v2, v0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    if-nez v2, :cond_1

    .line 161
    move-object/from16 v2, v20

    .end local v20    # "segment":Lnicoid/network238/okio/Segment;
    .local v2, "segment":Lnicoid/network238/okio/Segment;
    iput-object v2, v2, Lnicoid/network238/okio/Segment;->prev:Lnicoid/network238/okio/Segment;

    .line 162
    iget-object v3, v2, Lnicoid/network238/okio/Segment;->prev:Lnicoid/network238/okio/Segment;

    iput-object v3, v2, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    .line 163
    iget-object v3, v2, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    iput-object v3, v0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    goto :goto_2

    .line 165
    .end local v2    # "segment":Lnicoid/network238/okio/Segment;
    .restart local v20    # "segment":Lnicoid/network238/okio/Segment;
    :cond_1
    move-object/from16 v2, v20

    .end local v20    # "segment":Lnicoid/network238/okio/Segment;
    .restart local v2    # "segment":Lnicoid/network238/okio/Segment;
    iget-object v3, v0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    invoke-static {v3}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iget-object v3, v3, Lnicoid/network238/okio/Segment;->prev:Lnicoid/network238/okio/Segment;

    invoke-static {v3}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v3, v2}, Lnicoid/network238/okio/Segment;->push(Lnicoid/network238/okio/Segment;)Lnicoid/network238/okio/Segment;

    .line 167
    :goto_2
    nop

    .line 271
    .end local v2    # "segment":Lnicoid/network238/okio/Segment;
    .end local v15    # "$i$a$-forEachSegment--SegmentedByteString$commonWrite$1":I
    .end local v16    # "byteCount":I
    .end local v18    # "data":[B
    .end local v19    # "offset":I
    nop

    .line 272
    add-int/2addr v9, v13

    .line 273
    nop

    .end local v10    # "segmentOffset$iv":I
    .end local v11    # "segmentSize$iv":I
    .end local v12    # "segmentPos$iv":I
    .end local v13    # "byteCount$iv":I
    .end local v14    # "offset$iv":I
    add-int/lit8 v8, v8, 0x1

    move-object/from16 v3, p0

    move/from16 v2, v17

    goto :goto_0

    .line 275
    .end local v17    # "$i$f$commonWrite":I
    .local v2, "$i$f$commonWrite":I
    :cond_2
    move/from16 v17, v2

    .line 168
    .end local v2    # "$i$f$commonWrite":I
    .end local v4    # "endIndex$iv":I
    .end local v5    # "beginIndex$iv":I
    .end local v6    # "$this$forEachSegment$iv":Lnicoid/network238/okio/SegmentedByteString;
    .end local v7    # "$i$f$forEachSegment":I
    .end local v8    # "s$iv":I
    .end local v9    # "pos$iv":I
    .restart local v17    # "$i$f$commonWrite":I
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v2

    int-to-long v4, v1

    add-long/2addr v2, v4

    invoke-virtual {v0, v2, v3}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    .line 169
    return-void
.end method

.method private static final forEachSegment(Lnicoid/network238/okio/SegmentedByteString;IILnicoid/network238/kotlin/jvm/functions/Function3;)V
    .registers 15
    .param p0, "$this$forEachSegment"    # Lnicoid/network238/okio/SegmentedByteString;
    .param p1, "beginIndex"    # I
    .param p2, "endIndex"    # I
    .param p3, "action"    # Lnicoid/network238/kotlin/jvm/functions/Function3;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/okio/SegmentedByteString;",
            "II",
            "Lnicoid/network238/kotlin/jvm/functions/Function3;",
            ")V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 84
    .local v0, "$i$f$forEachSegment":I
    invoke-static {p0, p1}, Lnicoid/network238/okio/internal/-SegmentedByteString;->segment(Lnicoid/network238/okio/SegmentedByteString;I)I

    move-result v1

    .line 85
    .local v1, "s":I
    move v2, p1

    .line 86
    .local v2, "pos":I
    :goto_0
    if-ge v2, p2, :cond_1

    .line 87
    if-nez v1, :cond_0

    const/4 v3, 0x0

    goto :goto_1

    :cond_0
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getDirectory$okio()[I

    move-result-object v3

    add-int/lit8 v4, v1, -0x1

    aget v3, v3, v4

    .line 88
    .local v3, "segmentOffset":I
    :goto_1
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getDirectory$okio()[I

    move-result-object v4

    aget v4, v4, v1

    sub-int/2addr v4, v3

    .line 89
    .local v4, "segmentSize":I
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getDirectory$okio()[I

    move-result-object v5

    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getSegments$okio()[[B

    move-result-object v6

    check-cast v6, [Ljava/lang/Object;

    array-length v6, v6

    add-int/2addr v6, v1

    aget v5, v5, v6

    .line 91
    .local v5, "segmentPos":I
    add-int v6, v3, v4

    invoke-static {p2, v6}, Ljava/lang/Math;->min(II)I

    move-result v6

    sub-int/2addr v6, v2

    .line 92
    .local v6, "byteCount":I
    sub-int v7, v2, v3

    add-int/2addr v7, v5

    .line 93
    .local v7, "offset":I
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getSegments$okio()[[B

    move-result-object v8

    aget-object v8, v8, v1

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-interface {p3, v8, v9, v10}, Lnicoid/network238/kotlin/jvm/functions/Function3;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    add-int/2addr v2, v6

    .line 95
    nop

    .end local v3    # "segmentOffset":I
    .end local v4    # "segmentSize":I
    .end local v5    # "segmentPos":I
    .end local v6    # "byteCount":I
    .end local v7    # "offset":I
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 97
    :cond_1
    return-void
.end method

.method public static final forEachSegment(Lnicoid/network238/okio/SegmentedByteString;Lnicoid/network238/kotlin/jvm/functions/Function3;)V
    .registers 11
    .param p0, "$this$forEachSegment"    # Lnicoid/network238/okio/SegmentedByteString;
    .param p1, "action"    # Lnicoid/network238/kotlin/jvm/functions/Function3;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/okio/SegmentedByteString;",
            "Lnicoid/network238/kotlin/jvm/functions/Function3;",
            ")V"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "action"

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 62
    .local v0, "$i$f$forEachSegment":I
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getSegments$okio()[[B

    move-result-object v1

    check-cast v1, [Ljava/lang/Object;

    array-length v1, v1

    .line 63
    .local v1, "segmentCount":I
    const/4 v2, 0x0

    .line 64
    .local v2, "s":I
    const/4 v3, 0x0

    .line 65
    .local v3, "pos":I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 66
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getDirectory$okio()[I

    move-result-object v4

    add-int v5, v1, v2

    aget v4, v4, v5

    .line 67
    .local v4, "segmentPos":I
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getDirectory$okio()[I

    move-result-object v5

    aget v5, v5, v2

    .line 69
    .local v5, "nextSegmentOffset":I
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getSegments$okio()[[B

    move-result-object v6

    aget-object v6, v6, v2

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    sub-int v8, v5, v3

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-interface {p1, v6, v7, v8}, Lnicoid/network238/kotlin/jvm/functions/Function3;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    move v3, v5

    .line 71
    nop

    .end local v4    # "segmentPos":I
    .end local v5    # "nextSegmentOffset":I
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 73
    :cond_0
    return-void
.end method

.method public static final segment(Lnicoid/network238/okio/SegmentedByteString;I)I
    .registers 4

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 54
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getDirectory$okio()[I

    move-result-object v0

    add-int/lit8 p1, p1, 0x1

    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getSegments$okio()[[B

    move-result-object p0

    array-length p0, p0

    const/4 v1, 0x0

    invoke-static {v0, p1, v1, p0}, Lnicoid/network238/okio/internal/-SegmentedByteString;->binarySearch([IIII)I

    move-result p0

    if-ltz p0, :cond_0

    return p0

    :cond_0
    not-int p0, p0

    return p0
.end method
