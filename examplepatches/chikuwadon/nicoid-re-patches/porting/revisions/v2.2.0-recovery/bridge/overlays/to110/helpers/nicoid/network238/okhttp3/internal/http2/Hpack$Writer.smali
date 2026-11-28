.class public final Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/http2/Hpack;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Writer"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000B\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0010\u0011\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u0002\n\u0002\u0008\u0006\n\u0002\u0010 \n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0018\u00002\u00020\u0001B%\u0008\u0007\u0012\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u0003\u0012\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u0008\u0010\u0014\u001a\u00020\u0015H\u0002J\u0010\u0010\u0016\u001a\u00020\u00032\u0006\u0010\u0017\u001a\u00020\u0003H\u0002J\u0010\u0010\u0018\u001a\u00020\u00152\u0006\u0010\u0019\u001a\u00020\u000fH\u0002J\u0014\u0010\u001a\u001a\u00020\u00152\u000c\u0010\u001b\u001a\u0008\u0012\u0004\u0012\u00020\u000f0\u001cJ\u001e\u0010\u001d\u001a\u00020\u00152\u0006\u0010\u001e\u001a\u00020\u00032\u0006\u0010\u001f\u001a\u00020\u00032\u0006\u0010 \u001a\u00020\u0003J\u000e\u0010!\u001a\u00020\u00152\u0006\u0010\"\u001a\u00020#J\u000e\u0010$\u001a\u00020\u00152\u0006\u0010\u0002\u001a\u00020\u0003J\u0008\u0010%\u001a\u00020\u0015H\u0002R\u0012\u0010\u0002\u001a\u00020\u00038\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u0003X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u0005X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u000c\u001a\u00020\u00038\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u001c\u0010\r\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u000f0\u000e8\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0004\n\u0002\u0010\u0010R\u000e\u0010\u0011\u001a\u00020\u0003X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u0012\u001a\u00020\u00038\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u0013\u001a\u00020\u00038\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006&"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;",
        "",
        "headerTableSizeSetting",
        "",
        "useCompression",
        "",
        "out",
        "Lnicoid/network238/okio/Buffer;",
        "<init>",
        "(IZLnicoid/network238/okio/Buffer;)V",
        "smallestHeaderTableSizeSetting",
        "emitDynamicTableSizeUpdate",
        "maxDynamicTableByteCount",
        "dynamicTable",
        "",
        "Lnicoid/network238/okhttp3/internal/http2/Header;",
        "[Lnicoid/network238/okhttp3/internal/http2/Header;",
        "nextHeaderIndex",
        "headerCount",
        "dynamicTableByteCount",
        "clearDynamicTable",
        "",
        "evictToRecoverBytes",
        "bytesToRecover",
        "insertIntoDynamicTable",
        "entry",
        "writeHeaders",
        "headerBlock",
        "",
        "writeInt",
        "value",
        "prefixMask",
        "bits",
        "writeByteString",
        "data",
        "Lnicoid/network238/okio/ByteString;",
        "resizeHeaderTable",
        "adjustDynamicTableByteCount",
        "okhttp"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public dynamicTable:[Lnicoid/network238/okhttp3/internal/http2/Header;

.field public dynamicTableByteCount:I

.field private emitDynamicTableSizeUpdate:Z

.field public headerCount:I

.field public headerTableSizeSetting:I

.field public maxDynamicTableByteCount:I

.field private nextHeaderIndex:I

.field private final out:Lnicoid/network238/okio/Buffer;

.field private smallestHeaderTableSizeSetting:I

.field private final useCompression:Z


# direct methods
.method public constructor <init>(ILnicoid/network238/okio/Buffer;)V
    .registers 9

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v4, 0x2

    const/4 v5, 0x0

    const/4 v2, 0x0

    move-object v0, p0

    move v1, p1

    move-object v3, p2

    invoke-direct/range {v0 .. v5}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;-><init>(IZLnicoid/network238/okio/Buffer;ILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(IZLnicoid/network238/okio/Buffer;)V
    .registers 4

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 433
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 436
    iput p1, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->headerTableSizeSetting:I

    .line 437
    iput-boolean p2, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->useCompression:Z

    .line 438
    iput-object p3, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->out:Lnicoid/network238/okio/Buffer;

    .line 444
    const p2, 0x7fffffff

    iput p2, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->smallestHeaderTableSizeSetting:I

    .line 447
    iput p1, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->maxDynamicTableByteCount:I

    .line 450
    const/16 p1, 0x8

    new-array p1, p1, [Lnicoid/network238/okhttp3/internal/http2/Header;

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->dynamicTable:[Lnicoid/network238/okhttp3/internal/http2/Header;

    .line 453
    const/4 p1, 0x7

    iput p1, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->nextHeaderIndex:I

    return-void
.end method

.method public synthetic constructor <init>(IZLnicoid/network238/okio/Buffer;ILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 6

    and-int/lit8 p5, p4, 0x1

    if-eqz p5, :cond_0

    const/16 p1, 0x1000

    :cond_0
    and-int/lit8 p4, p4, 0x2

    if-eqz p4, :cond_1

    const/4 p2, 0x1

    .line 435
    :cond_1
    invoke-direct {p0, p1, p2, p3}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;-><init>(IZLnicoid/network238/okio/Buffer;)V

    return-void
.end method

.method public constructor <init>(Lnicoid/network238/okio/Buffer;)V
    .registers 8

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v4, 0x3

    const/4 v5, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    move-object v0, p0

    move-object v3, p1

    invoke-direct/range {v0 .. v5}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;-><init>(IZLnicoid/network238/okio/Buffer;ILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method private final adjustDynamicTableByteCount()V
    .registers 3

    .line 658
    iget v0, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->maxDynamicTableByteCount:I

    iget v1, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->dynamicTableByteCount:I

    if-ge v0, v1, :cond_1

    if-nez v0, :cond_0

    .line 660
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->clearDynamicTable()V

    return-void

    :cond_0
    sub-int/2addr v1, v0

    .line 662
    invoke-direct {p0, v1}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->evictToRecoverBytes(I)I

    :cond_1
    return-void
.end method

.method private final clearDynamicTable()V
    .registers 7

    .line 460
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->dynamicTable:[Lnicoid/network238/okhttp3/internal/http2/Header;

    const/4 v4, 0x6

    const/4 v5, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static/range {v0 .. v5}, Lnicoid/network238/kotlin/collections/ArraysKt;->fill$default([Ljava/lang/Object;Ljava/lang/Object;IIILjava/lang/Object;)V

    .line 461
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->dynamicTable:[Lnicoid/network238/okhttp3/internal/http2/Header;

    array-length v0, v0

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->nextHeaderIndex:I

    .line 462
    const/4 v0, 0x0

    iput v0, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->headerCount:I

    .line 463
    iput v0, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->dynamicTableByteCount:I

    return-void
.end method

.method private final evictToRecoverBytes(I)I
    .registers 6

    const/4 v0, 0x0

    if-lez p1, :cond_1

    .line 472
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->dynamicTable:[Lnicoid/network238/okhttp3/internal/http2/Header;

    array-length v1, v1

    add-int/lit8 v1, v1, -0x1

    .line 473
    :goto_0
    iget v2, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->nextHeaderIndex:I

    if-lt v1, v2, :cond_0

    if-lez p1, :cond_0

    .line 474
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->dynamicTable:[Lnicoid/network238/okhttp3/internal/http2/Header;

    aget-object v2, v2, v1

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v2, v2, Lnicoid/network238/okhttp3/internal/http2/Header;->hpackSize:I

    sub-int/2addr p1, v2

    .line 475
    iget v2, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->dynamicTableByteCount:I

    iget-object v3, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->dynamicTable:[Lnicoid/network238/okhttp3/internal/http2/Header;

    aget-object v3, v3, v1

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v3, v3, Lnicoid/network238/okhttp3/internal/http2/Header;->hpackSize:I

    sub-int/2addr v2, v3

    iput v2, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->dynamicTableByteCount:I

    .line 476
    iget v2, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->headerCount:I

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->headerCount:I

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 481
    :cond_0
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->dynamicTable:[Lnicoid/network238/okhttp3/internal/http2/Header;

    add-int/lit8 v2, v2, 0x1

    add-int v1, v2, v0

    .line 485
    iget v3, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->headerCount:I

    .line 480
    invoke-static {p1, v2, p1, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 487
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->dynamicTable:[Lnicoid/network238/okhttp3/internal/http2/Header;

    iget v1, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->nextHeaderIndex:I

    add-int/lit8 v1, v1, 0x1

    add-int v2, v1, v0

    const/4 v3, 0x0

    invoke-static {p1, v1, v2, v3}, Ljava/util/Arrays;->fill([Ljava/lang/Object;IILjava/lang/Object;)V

    .line 488
    iget p1, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->nextHeaderIndex:I

    add-int/2addr p1, v0

    iput p1, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->nextHeaderIndex:I

    :cond_1
    return v0
.end method

.method private final insertIntoDynamicTable(Lnicoid/network238/okhttp3/internal/http2/Header;)V
    .registers 8

    .line 494
    iget v0, p1, Lnicoid/network238/okhttp3/internal/http2/Header;->hpackSize:I

    .line 497
    iget v1, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->maxDynamicTableByteCount:I

    if-le v0, v1, :cond_0

    .line 498
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->clearDynamicTable()V

    return-void

    .line 503
    :cond_0
    iget v2, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->dynamicTableByteCount:I

    add-int/2addr v2, v0

    sub-int/2addr v2, v1

    .line 504
    invoke-direct {p0, v2}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->evictToRecoverBytes(I)I

    .line 506
    iget v1, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->headerCount:I

    add-int/lit8 v1, v1, 0x1

    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->dynamicTable:[Lnicoid/network238/okhttp3/internal/http2/Header;

    array-length v3, v2

    if-le v1, v3, :cond_1

    .line 507
    array-length v1, v2

    shl-int/lit8 v1, v1, 0x1

    new-array v1, v1, [Lnicoid/network238/okhttp3/internal/http2/Header;

    .line 508
    array-length v3, v2

    array-length v4, v2

    const/4 v5, 0x0

    invoke-static {v2, v5, v1, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 509
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->dynamicTable:[Lnicoid/network238/okhttp3/internal/http2/Header;

    array-length v2, v2

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->nextHeaderIndex:I

    .line 510
    iput-object v1, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->dynamicTable:[Lnicoid/network238/okhttp3/internal/http2/Header;

    move-object v2, v1

    .line 512
    :cond_1
    iget v1, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->nextHeaderIndex:I

    add-int/lit8 v3, v1, -0x1

    iput v3, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->nextHeaderIndex:I

    .line 513
    aput-object p1, v2, v1

    .line 514
    iget p1, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->headerCount:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->headerCount:I

    .line 515
    iget p1, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->dynamicTableByteCount:I

    add-int/2addr p1, v0

    iput p1, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->dynamicTableByteCount:I

    return-void
.end method


# virtual methods
.method public final resizeHeaderTable(I)V
    .registers 3

    .line 643
    iput p1, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->headerTableSizeSetting:I

    .line 644
    const/16 v0, 0x4000

    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    move-result p1

    .line 646
    iget v0, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->maxDynamicTableByteCount:I

    if-ne v0, p1, :cond_0

    return-void

    :cond_0
    if-ge p1, v0, :cond_1

    .line 650
    iget v0, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->smallestHeaderTableSizeSetting:I

    invoke-static {v0, p1}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 649
    iput v0, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->smallestHeaderTableSizeSetting:I

    :cond_1
    nop

    .line 652
    const/4 v0, 0x1

    iput-boolean v0, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->emitDynamicTableSizeUpdate:Z

    .line 653
    iput p1, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->maxDynamicTableByteCount:I

    .line 654
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->adjustDynamicTableByteCount()V

    return-void
.end method

.method public final writeByteString(Lnicoid/network238/okio/ByteString;)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 630
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->useCompression:Z

    const/16 v1, 0x7f

    if-eqz v0, :cond_0

    sget-object v0, Lnicoid/network238/okhttp3/internal/http2/Huffman;->INSTANCE:Lnicoid/network238/okhttp3/internal/http2/Huffman;

    invoke-virtual {v0, p1}, Lnicoid/network238/okhttp3/internal/http2/Huffman;->encodedLength(Lnicoid/network238/okio/ByteString;)I

    move-result v2

    invoke-virtual {p1}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v3

    if-ge v2, v3, :cond_0

    .line 631
    new-instance v2, Lnicoid/network238/okio/Buffer;

    invoke-direct {v2}, Lnicoid/network238/okio/Buffer;-><init>()V

    .line 632
    invoke-virtual {v0, p1, v2}, Lnicoid/network238/okhttp3/internal/http2/Huffman;->encode(Lnicoid/network238/okio/ByteString;Lnicoid/network238/okio/BufferedSink;)V

    .line 633
    invoke-virtual {v2}, Lnicoid/network238/okio/Buffer;->readByteString()Lnicoid/network238/okio/ByteString;

    move-result-object p1

    .line 634
    invoke-virtual {p1}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v0

    const/16 v2, 0x80

    invoke-virtual {p0, v0, v1, v2}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->writeInt(III)V

    .line 635
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->out:Lnicoid/network238/okio/Buffer;

    invoke-virtual {v0, p1}, Lnicoid/network238/okio/Buffer;->write(Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/Buffer;

    return-void

    .line 637
    :cond_0
    invoke-virtual {p1}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v0

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->writeInt(III)V

    .line 638
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->out:Lnicoid/network238/okio/Buffer;

    invoke-virtual {v0, p1}, Lnicoid/network238/okio/Buffer;->write(Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/Buffer;

    return-void
.end method

.method public final writeHeaders(Ljava/util/List;)V
    .registers 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/internal/http2/Header;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 525
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->emitDynamicTableSizeUpdate:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 526
    iget v0, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->smallestHeaderTableSizeSetting:I

    iget v2, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->maxDynamicTableByteCount:I

    const/16 v3, 0x20

    const/16 v4, 0x1f

    if-ge v0, v2, :cond_0

    .line 528
    invoke-virtual {p0, v0, v4, v3}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->writeInt(III)V

    :cond_0
    nop

    .line 530
    iput-boolean v1, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->emitDynamicTableSizeUpdate:Z

    .line 531
    const v0, 0x7fffffff

    iput v0, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->smallestHeaderTableSizeSetting:I

    .line 532
    iget v0, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->maxDynamicTableByteCount:I

    invoke-virtual {p0, v0, v4, v3}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->writeInt(III)V

    :cond_1
    nop

    .line 535
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_b

    .line 536
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lnicoid/network238/okhttp3/internal/http2/Header;

    .line 537
    iget-object v4, v3, Lnicoid/network238/okhttp3/internal/http2/Header;->name:Lnicoid/network238/okio/ByteString;

    invoke-virtual {v4}, Lnicoid/network238/okio/ByteString;->toAsciiLowercase()Lnicoid/network238/okio/ByteString;

    move-result-object v4

    .line 538
    iget-object v5, v3, Lnicoid/network238/okhttp3/internal/http2/Header;->value:Lnicoid/network238/okio/ByteString;

    .line 542
    sget-object v6, Lnicoid/network238/okhttp3/internal/http2/Hpack;->INSTANCE:Lnicoid/network238/okhttp3/internal/http2/Hpack;

    invoke-virtual {v6}, Lnicoid/network238/okhttp3/internal/http2/Hpack;->getNAME_TO_FIRST_INDEX()Ljava/util/Map;

    move-result-object v7

    invoke-interface {v7, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    const/4 v8, -0x1

    if-eqz v7, :cond_4

    .line 544
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    add-int/lit8 v9, v7, 0x1

    const/4 v10, 0x2

    if-gt v10, v9, :cond_3

    const/16 v10, 0x8

    if-ge v9, v10, :cond_3

    .line 550
    invoke-virtual {v6}, Lnicoid/network238/okhttp3/internal/http2/Hpack;->getSTATIC_HEADER_TABLE()[Lnicoid/network238/okhttp3/internal/http2/Header;

    move-result-object v10

    aget-object v10, v10, v7

    iget-object v10, v10, Lnicoid/network238/okhttp3/internal/http2/Header;->value:Lnicoid/network238/okio/ByteString;

    invoke-static {v10, v5}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    move v6, v9

    goto :goto_1

    .line 552
    :cond_2
    invoke-virtual {v6}, Lnicoid/network238/okhttp3/internal/http2/Hpack;->getSTATIC_HEADER_TABLE()[Lnicoid/network238/okhttp3/internal/http2/Header;

    move-result-object v6

    aget-object v6, v6, v9

    iget-object v6, v6, Lnicoid/network238/okhttp3/internal/http2/Header;->value:Lnicoid/network238/okio/ByteString;

    invoke-static {v6, v5}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    add-int/lit8 v7, v7, 0x2

    move v6, v9

    move v9, v7

    goto :goto_1

    :cond_3
    move v6, v9

    move v9, v8

    goto :goto_1

    .line 542
    :cond_4
    move v6, v8

    move v9, v6

    .line 552
    :goto_1
    if-ne v9, v8, :cond_7

    .line 559
    iget v7, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->nextHeaderIndex:I

    add-int/lit8 v7, v7, 0x1

    iget-object v10, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->dynamicTable:[Lnicoid/network238/okhttp3/internal/http2/Header;

    array-length v10, v10

    :goto_2
    if-ge v7, v10, :cond_7

    .line 560
    iget-object v11, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->dynamicTable:[Lnicoid/network238/okhttp3/internal/http2/Header;

    aget-object v11, v11, v7

    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v11, v11, Lnicoid/network238/okhttp3/internal/http2/Header;->name:Lnicoid/network238/okio/ByteString;

    invoke-static {v11, v4}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_6

    .line 561
    iget-object v11, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->dynamicTable:[Lnicoid/network238/okhttp3/internal/http2/Header;

    aget-object v11, v11, v7

    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v11, v11, Lnicoid/network238/okhttp3/internal/http2/Header;->value:Lnicoid/network238/okio/ByteString;

    invoke-static {v11, v5}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_5

    .line 562
    iget v9, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->nextHeaderIndex:I

    sub-int/2addr v7, v9

    sget-object v9, Lnicoid/network238/okhttp3/internal/http2/Hpack;->INSTANCE:Lnicoid/network238/okhttp3/internal/http2/Hpack;

    invoke-virtual {v9}, Lnicoid/network238/okhttp3/internal/http2/Hpack;->getSTATIC_HEADER_TABLE()[Lnicoid/network238/okhttp3/internal/http2/Header;

    move-result-object v9

    array-length v9, v9

    add-int/2addr v9, v7

    goto :goto_3

    :cond_5
    if-ne v6, v8, :cond_6

    .line 565
    iget v6, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->nextHeaderIndex:I

    sub-int v6, v7, v6

    sget-object v11, Lnicoid/network238/okhttp3/internal/http2/Hpack;->INSTANCE:Lnicoid/network238/okhttp3/internal/http2/Hpack;

    invoke-virtual {v11}, Lnicoid/network238/okhttp3/internal/http2/Hpack;->getSTATIC_HEADER_TABLE()[Lnicoid/network238/okhttp3/internal/http2/Header;

    move-result-object v11

    array-length v11, v11

    add-int/2addr v6, v11

    :cond_6
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    :cond_7
    :goto_3
    if-eq v9, v8, :cond_8

    .line 574
    const/16 v3, 0x7f

    const/16 v4, 0x80

    invoke-virtual {p0, v9, v3, v4}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->writeInt(III)V

    goto :goto_4

    :cond_8
    const/16 v7, 0x40

    if-ne v6, v8, :cond_9

    .line 579
    iget-object v6, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->out:Lnicoid/network238/okio/Buffer;

    invoke-virtual {v6, v7}, Lnicoid/network238/okio/Buffer;->writeByte(I)Lnicoid/network238/okio/Buffer;

    .line 580
    invoke-virtual {p0, v4}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->writeByteString(Lnicoid/network238/okio/ByteString;)V

    .line 581
    invoke-virtual {p0, v5}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->writeByteString(Lnicoid/network238/okio/ByteString;)V

    .line 582
    invoke-direct {p0, v3}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->insertIntoDynamicTable(Lnicoid/network238/okhttp3/internal/http2/Header;)V

    goto :goto_4

    .line 585
    :cond_9
    sget-object v8, Lnicoid/network238/okhttp3/internal/http2/Header;->PSEUDO_PREFIX:Lnicoid/network238/okio/ByteString;

    invoke-virtual {v4, v8}, Lnicoid/network238/okio/ByteString;->startsWith(Lnicoid/network238/okio/ByteString;)Z

    move-result v8

    if-eqz v8, :cond_a

    sget-object v8, Lnicoid/network238/okhttp3/internal/http2/Header;->TARGET_AUTHORITY:Lnicoid/network238/okio/ByteString;

    invoke-static {v8, v4}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_a

    .line 588
    const/16 v3, 0xf

    invoke-virtual {p0, v6, v3, v1}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->writeInt(III)V

    .line 589
    invoke-virtual {p0, v5}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->writeByteString(Lnicoid/network238/okio/ByteString;)V

    goto :goto_4

    :cond_a
    nop

    .line 594
    const/16 v4, 0x3f

    invoke-virtual {p0, v6, v4, v7}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->writeInt(III)V

    .line 595
    invoke-virtual {p0, v5}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->writeByteString(Lnicoid/network238/okio/ByteString;)V

    .line 596
    invoke-direct {p0, v3}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->insertIntoDynamicTable(Lnicoid/network238/okhttp3/internal/http2/Header;)V

    :goto_4
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_0

    :cond_b
    return-void
.end method

.method public final writeInt(III)V
    .registers 5

    .line 616
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->out:Lnicoid/network238/okio/Buffer;

    if-ge p1, p2, :cond_0

    or-int/2addr p3, p1

    .line 611
    invoke-virtual {v0, p3}, Lnicoid/network238/okio/Buffer;->writeByte(I)Lnicoid/network238/okio/Buffer;

    return-void

    :cond_0
    or-int/2addr p3, p2

    .line 616
    invoke-virtual {v0, p3}, Lnicoid/network238/okio/Buffer;->writeByte(I)Lnicoid/network238/okio/Buffer;

    sub-int/2addr p1, p2

    .line 625
    :goto_0
    iget-object p2, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;->out:Lnicoid/network238/okio/Buffer;

    const/16 p3, 0x80

    if-lt p1, p3, :cond_1

    and-int/lit8 v0, p1, 0x7f

    or-int/2addr v0, p3

    .line 622
    invoke-virtual {p2, v0}, Lnicoid/network238/okio/Buffer;->writeByte(I)Lnicoid/network238/okio/Buffer;

    ushr-int/lit8 p1, p1, 0x7

    goto :goto_0

    .line 625
    :cond_1
    invoke-virtual {p2, p1}, Lnicoid/network238/okio/Buffer;->writeByte(I)Lnicoid/network238/okio/Buffer;

    return-void
.end method
