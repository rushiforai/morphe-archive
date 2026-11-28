.class public final Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/http2/Hpack;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Reader"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000P\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0004\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0011\n\u0002\u0008\u0005\n\u0002\u0010 \n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\r\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\n\u0018\u00002\u00020\u0001B#\u0008\u0007\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u000c\u0010\u0015\u001a\u0008\u0012\u0004\u0012\u00020\u000b0\u0016J\u0006\u0010\u0006\u001a\u00020\u0005J\u0008\u0010\u0017\u001a\u00020\u0018H\u0002J\u0008\u0010\u0019\u001a\u00020\u0018H\u0002J\u0010\u0010\u001a\u001a\u00020\u00052\u0006\u0010\u001b\u001a\u00020\u0005H\u0002J\u0006\u0010\u001c\u001a\u00020\u0018J\u0010\u0010\u001d\u001a\u00020\u00182\u0006\u0010\u001e\u001a\u00020\u0005H\u0002J\u0010\u0010\u001f\u001a\u00020\u00052\u0006\u0010\u001e\u001a\u00020\u0005H\u0002J\u0010\u0010 \u001a\u00020\u00182\u0006\u0010\u001e\u001a\u00020\u0005H\u0002J\u0008\u0010!\u001a\u00020\u0018H\u0002J\u0010\u0010\"\u001a\u00020\u00182\u0006\u0010#\u001a\u00020\u0005H\u0002J\u0008\u0010$\u001a\u00020\u0018H\u0002J\u0010\u0010%\u001a\u00020&2\u0006\u0010\u001e\u001a\u00020\u0005H\u0002J\u0010\u0010\'\u001a\u00020(2\u0006\u0010\u001e\u001a\u00020\u0005H\u0002J\u0018\u0010)\u001a\u00020\u00182\u0006\u0010\u001e\u001a\u00020\u00052\u0006\u0010*\u001a\u00020\u000bH\u0002J\u0008\u0010+\u001a\u00020\u0005H\u0002J\u0016\u0010,\u001a\u00020\u00052\u0006\u0010-\u001a\u00020\u00052\u0006\u0010.\u001a\u00020\u0005J\u0006\u0010/\u001a\u00020&J\u0010\u00100\u001a\u00020\u00182\u0006\u00101\u001a\u00020\u000bH\u0002R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0005X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0014\u0010\t\u001a\u0008\u0012\u0004\u0012\u00020\u000b0\nX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000c\u001a\u00020\rX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0002\u001a\u00020\u000eX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001c\u0010\u000f\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u000b0\u00108\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0004\n\u0002\u0010\u0011R\u000e\u0010\u0012\u001a\u00020\u0005X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u0013\u001a\u00020\u00058\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u0014\u001a\u00020\u00058\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u00062"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;",
        "",
        "source",
        "Lnicoid/network238/okio/Source;",
        "headerTableSizeSetting",
        "",
        "maxDynamicTableByteCount",
        "<init>",
        "(Lnicoid/network238/okio/Source;II)V",
        "headerList",
        "",
        "Lnicoid/network238/okhttp3/internal/http2/Header;",
        "headerListByteCount",
        "",
        "Lnicoid/network238/okio/BufferedSource;",
        "dynamicTable",
        "",
        "[Lnicoid/network238/okhttp3/internal/http2/Header;",
        "nextHeaderIndex",
        "headerCount",
        "dynamicTableByteCount",
        "getAndResetHeaderList",
        "",
        "adjustDynamicTableByteCount",
        "",
        "clearDynamicTable",
        "evictToRecoverBytes",
        "bytesToRecover",
        "readHeaders",
        "readIndexedHeader",
        "index",
        "dynamicTableIndex",
        "readLiteralHeaderWithoutIndexingIndexedName",
        "readLiteralHeaderWithoutIndexingNewName",
        "readLiteralHeaderWithIncrementalIndexingIndexedName",
        "nameIndex",
        "readLiteralHeaderWithIncrementalIndexingNewName",
        "getName",
        "Lnicoid/network238/okio/ByteString;",
        "isStaticHeader",
        "",
        "insertIntoDynamicTable",
        "entry",
        "readByte",
        "readInt",
        "firstByte",
        "prefixMask",
        "readByteString",
        "addHeader",
        "header",
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

.field public headerCount:I

.field private final headerList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/internal/http2/Header;",
            ">;"
        }
    .end annotation
.end field

.field private headerListByteCount:J

.field private final headerTableSizeSetting:I

.field private maxDynamicTableByteCount:I

.field private nextHeaderIndex:I

.field private final source:Lnicoid/network238/okio/BufferedSource;


# direct methods
.method public constructor <init>(Lnicoid/network238/okio/Source;I)V
    .registers 9

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v4, 0x4

    const/4 v5, 0x0

    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    invoke-direct/range {v0 .. v5}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;-><init>(Lnicoid/network238/okio/Source;IIILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(Lnicoid/network238/okio/Source;II)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 126
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 130
    iput p2, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->headerTableSizeSetting:I

    .line 131
    iput p3, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->maxDynamicTableByteCount:I

    .line 133
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->headerList:Ljava/util/List;

    .line 135
    invoke-static {p1}, Lnicoid/network238/okio/Okio;->buffer(Lnicoid/network238/okio/Source;)Lnicoid/network238/okio/BufferedSource;

    move-result-object p1

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->source:Lnicoid/network238/okio/BufferedSource;

    .line 138
    const/16 p1, 0x8

    new-array p1, p1, [Lnicoid/network238/okhttp3/internal/http2/Header;

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->dynamicTable:[Lnicoid/network238/okhttp3/internal/http2/Header;

    .line 141
    const/4 p1, 0x7

    iput p1, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->nextHeaderIndex:I

    return-void
.end method

.method public synthetic constructor <init>(Lnicoid/network238/okio/Source;IIILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 6

    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_0

    move p3, p2

    .line 128
    :cond_0
    invoke-direct {p0, p1, p2, p3}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;-><init>(Lnicoid/network238/okio/Source;II)V

    return-void
.end method

.method private final addHeader(Lnicoid/network238/okhttp3/internal/http2/Header;)V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 412
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->headerList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 414
    iget-object v0, p1, Lnicoid/network238/okhttp3/internal/http2/Header;->name:Lnicoid/network238/okio/ByteString;

    invoke-virtual {v0}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v0

    iget-object p1, p1, Lnicoid/network238/okhttp3/internal/http2/Header;->value:Lnicoid/network238/okio/ByteString;

    invoke-virtual {p1}, Lnicoid/network238/okio/ByteString;->size()I

    move-result p1

    add-int/2addr v0, p1

    .line 415
    iget-wide v1, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->headerListByteCount:J

    int-to-long v3, v0

    add-long/2addr v1, v3

    .line 416
    iput-wide v1, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->headerListByteCount:J

    const-wide/32 v3, 0x40000

    cmp-long p1, v1, v3

    if-gtz p1, :cond_0

    return-void

    .line 418
    :cond_0
    new-instance p1, Ljava/io/IOException;

    const-string v0, "header byte count limit of 262144 exceeded"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private final adjustDynamicTableByteCount()V
    .registers 3

    .line 157
    iget v0, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->maxDynamicTableByteCount:I

    iget v1, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->dynamicTableByteCount:I

    if-ge v0, v1, :cond_1

    if-nez v0, :cond_0

    .line 159
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->clearDynamicTable()V

    return-void

    :cond_0
    sub-int/2addr v1, v0

    .line 161
    invoke-direct {p0, v1}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->evictToRecoverBytes(I)I

    :cond_1
    return-void
.end method

.method private final clearDynamicTable()V
    .registers 7

    .line 167
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->dynamicTable:[Lnicoid/network238/okhttp3/internal/http2/Header;

    const/4 v4, 0x6

    const/4 v5, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static/range {v0 .. v5}, Lnicoid/network238/kotlin/collections/ArraysKt;->fill$default([Ljava/lang/Object;Ljava/lang/Object;IIILjava/lang/Object;)V

    .line 168
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->dynamicTable:[Lnicoid/network238/okhttp3/internal/http2/Header;

    array-length v0, v0

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->nextHeaderIndex:I

    .line 169
    const/4 v0, 0x0

    iput v0, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->headerCount:I

    .line 170
    iput v0, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->dynamicTableByteCount:I

    return-void
.end method

.method private final dynamicTableIndex(I)I
    .registers 3

    .line 269
    iget v0, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->nextHeaderIndex:I

    add-int/lit8 v0, v0, 0x1

    add-int/2addr v0, p1

    return v0
.end method

.method private final evictToRecoverBytes(I)I
    .registers 6

    const/4 v0, 0x0

    if-lez p1, :cond_1

    .line 179
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->dynamicTable:[Lnicoid/network238/okhttp3/internal/http2/Header;

    array-length v1, v1

    add-int/lit8 v1, v1, -0x1

    .line 180
    :goto_0
    iget v2, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->nextHeaderIndex:I

    if-lt v1, v2, :cond_0

    if-lez p1, :cond_0

    .line 181
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->dynamicTable:[Lnicoid/network238/okhttp3/internal/http2/Header;

    aget-object v2, v2, v1

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 182
    iget v2, v2, Lnicoid/network238/okhttp3/internal/http2/Header;->hpackSize:I

    sub-int/2addr p1, v2

    .line 183
    iget v3, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->dynamicTableByteCount:I

    sub-int/2addr v3, v2

    iput v3, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->dynamicTableByteCount:I

    .line 184
    iget v2, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->headerCount:I

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->headerCount:I

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 189
    :cond_0
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->dynamicTable:[Lnicoid/network238/okhttp3/internal/http2/Header;

    add-int/lit8 v2, v2, 0x1

    add-int v1, v2, v0

    .line 193
    iget v3, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->headerCount:I

    .line 188
    invoke-static {p1, v2, p1, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 195
    iget p1, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->nextHeaderIndex:I

    add-int/2addr p1, v0

    iput p1, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->nextHeaderIndex:I

    :cond_1
    return v0
.end method

.method private final getName(I)Lnicoid/network238/okio/ByteString;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 301
    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->isStaticHeader(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 302
    sget-object v0, Lnicoid/network238/okhttp3/internal/http2/Hpack;->INSTANCE:Lnicoid/network238/okhttp3/internal/http2/Hpack;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http2/Hpack;->getSTATIC_HEADER_TABLE()[Lnicoid/network238/okhttp3/internal/http2/Header;

    move-result-object v0

    aget-object p1, v0, p1

    iget-object p1, p1, Lnicoid/network238/okhttp3/internal/http2/Header;->name:Lnicoid/network238/okio/ByteString;

    return-object p1

    .line 304
    :cond_0
    sget-object v0, Lnicoid/network238/okhttp3/internal/http2/Hpack;->INSTANCE:Lnicoid/network238/okhttp3/internal/http2/Hpack;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http2/Hpack;->getSTATIC_HEADER_TABLE()[Lnicoid/network238/okhttp3/internal/http2/Header;

    move-result-object v0

    array-length v0, v0

    sub-int v0, p1, v0

    invoke-direct {p0, v0}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->dynamicTableIndex(I)I

    move-result v0

    if-ltz v0, :cond_1

    .line 305
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->dynamicTable:[Lnicoid/network238/okhttp3/internal/http2/Header;

    array-length v2, v1

    if-ge v0, v2, :cond_1

    .line 309
    aget-object p1, v1, v0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p1, p1, Lnicoid/network238/okhttp3/internal/http2/Header;->name:Lnicoid/network238/okio/ByteString;

    return-object p1

    .line 306
    :cond_1
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Header index too large "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    add-int/lit8 p1, p1, 0x1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private final insertIntoDynamicTable(ILnicoid/network238/okhttp3/internal/http2/Header;)V
    .registers 8

    .line 320
    invoke-direct {p0, p2}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->addHeader(Lnicoid/network238/okhttp3/internal/http2/Header;)V

    .line 322
    iget v0, p2, Lnicoid/network238/okhttp3/internal/http2/Header;->hpackSize:I

    const/4 v1, -0x1

    if-eq p1, v1, :cond_0

    .line 324
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->dynamicTable:[Lnicoid/network238/okhttp3/internal/http2/Header;

    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->dynamicTableIndex(I)I

    move-result v3

    aget-object v2, v2, v3

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v2, v2, Lnicoid/network238/okhttp3/internal/http2/Header;->hpackSize:I

    sub-int/2addr v0, v2

    .line 328
    :cond_0
    iget v2, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->maxDynamicTableByteCount:I

    if-le v0, v2, :cond_1

    .line 329
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->clearDynamicTable()V

    return-void

    .line 334
    :cond_1
    iget v3, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->dynamicTableByteCount:I

    add-int/2addr v3, v0

    sub-int/2addr v3, v2

    .line 335
    invoke-direct {p0, v3}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->evictToRecoverBytes(I)I

    move-result v2

    if-ne p1, v1, :cond_3

    .line 338
    iget p1, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->headerCount:I

    add-int/lit8 p1, p1, 0x1

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->dynamicTable:[Lnicoid/network238/okhttp3/internal/http2/Header;

    array-length v2, v1

    if-le p1, v2, :cond_2

    .line 339
    array-length p1, v1

    shl-int/lit8 p1, p1, 0x1

    new-array p1, p1, [Lnicoid/network238/okhttp3/internal/http2/Header;

    .line 340
    array-length v2, v1

    array-length v3, v1

    const/4 v4, 0x0

    invoke-static {v1, v4, p1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 341
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->dynamicTable:[Lnicoid/network238/okhttp3/internal/http2/Header;

    array-length v1, v1

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->nextHeaderIndex:I

    .line 342
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->dynamicTable:[Lnicoid/network238/okhttp3/internal/http2/Header;

    move-object v1, p1

    .line 344
    :cond_2
    iget p1, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->nextHeaderIndex:I

    add-int/lit8 v2, p1, -0x1

    iput v2, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->nextHeaderIndex:I

    .line 345
    aput-object p2, v1, p1

    .line 346
    iget p1, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->headerCount:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->headerCount:I

    goto :goto_0

    .line 348
    :cond_3
    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->dynamicTableIndex(I)I

    move-result v1

    add-int/2addr v1, v2

    add-int/2addr p1, v1

    .line 349
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->dynamicTable:[Lnicoid/network238/okhttp3/internal/http2/Header;

    aput-object p2, v1, p1

    .line 351
    :goto_0
    iget p1, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->dynamicTableByteCount:I

    add-int/2addr p1, v0

    iput p1, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->dynamicTableByteCount:I

    return-void
.end method

.method private final isStaticHeader(I)Z
    .registers 4

    if-ltz p1, :cond_0

    .line 312
    sget-object v0, Lnicoid/network238/okhttp3/internal/http2/Hpack;->INSTANCE:Lnicoid/network238/okhttp3/internal/http2/Hpack;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http2/Hpack;->getSTATIC_HEADER_TABLE()[Lnicoid/network238/okhttp3/internal/http2/Header;

    move-result-object v0

    array-length v0, v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    if-gt p1, v0, :cond_0

    return v1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method private final readByte()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 355
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-interface {v0}, Lnicoid/network238/okio/BufferedSource;->readByte()B

    move-result v0

    const/16 v1, 0xff

    invoke-static {v0, v1}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->and(BI)I

    move-result v0

    return v0
.end method

.method private final readIndexedHeader(I)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 256
    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->isStaticHeader(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 257
    sget-object v0, Lnicoid/network238/okhttp3/internal/http2/Hpack;->INSTANCE:Lnicoid/network238/okhttp3/internal/http2/Hpack;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http2/Hpack;->getSTATIC_HEADER_TABLE()[Lnicoid/network238/okhttp3/internal/http2/Header;

    move-result-object v0

    aget-object p1, v0, p1

    .line 258
    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->addHeader(Lnicoid/network238/okhttp3/internal/http2/Header;)V

    return-void

    .line 260
    :cond_0
    sget-object v0, Lnicoid/network238/okhttp3/internal/http2/Hpack;->INSTANCE:Lnicoid/network238/okhttp3/internal/http2/Hpack;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http2/Hpack;->getSTATIC_HEADER_TABLE()[Lnicoid/network238/okhttp3/internal/http2/Header;

    move-result-object v0

    array-length v0, v0

    sub-int v0, p1, v0

    invoke-direct {p0, v0}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->dynamicTableIndex(I)I

    move-result v0

    if-ltz v0, :cond_1

    .line 261
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->dynamicTable:[Lnicoid/network238/okhttp3/internal/http2/Header;

    array-length v2, v1

    if-ge v0, v2, :cond_1

    .line 264
    aget-object p1, v1, v0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->addHeader(Lnicoid/network238/okhttp3/internal/http2/Header;)V

    return-void

    .line 262
    :cond_1
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Header index too large "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    add-int/lit8 p1, p1, 0x1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private final readLiteralHeaderWithIncrementalIndexingIndexedName(I)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 287
    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->getName(I)Lnicoid/network238/okio/ByteString;

    move-result-object p1

    .line 288
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->readByteString()Lnicoid/network238/okio/ByteString;

    move-result-object v0

    .line 289
    new-instance v1, Lnicoid/network238/okhttp3/internal/http2/Header;

    invoke-direct {v1, p1, v0}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Lnicoid/network238/okio/ByteString;Lnicoid/network238/okio/ByteString;)V

    const/4 p1, -0x1

    invoke-direct {p0, p1, v1}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->insertIntoDynamicTable(ILnicoid/network238/okhttp3/internal/http2/Header;)V

    return-void
.end method

.method private final readLiteralHeaderWithIncrementalIndexingNewName()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 294
    sget-object v0, Lnicoid/network238/okhttp3/internal/http2/Hpack;->INSTANCE:Lnicoid/network238/okhttp3/internal/http2/Hpack;

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->readByteString()Lnicoid/network238/okio/ByteString;

    move-result-object v1

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/internal/http2/Hpack;->checkLowercase(Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/ByteString;

    move-result-object v0

    .line 295
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->readByteString()Lnicoid/network238/okio/ByteString;

    move-result-object v1

    .line 296
    new-instance v2, Lnicoid/network238/okhttp3/internal/http2/Header;

    invoke-direct {v2, v0, v1}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Lnicoid/network238/okio/ByteString;Lnicoid/network238/okio/ByteString;)V

    const/4 v0, -0x1

    invoke-direct {p0, v0, v2}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->insertIntoDynamicTable(ILnicoid/network238/okhttp3/internal/http2/Header;)V

    return-void
.end method

.method private final readLiteralHeaderWithoutIndexingIndexedName(I)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 273
    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->getName(I)Lnicoid/network238/okio/ByteString;

    move-result-object p1

    .line 274
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->readByteString()Lnicoid/network238/okio/ByteString;

    move-result-object v0

    .line 275
    new-instance v1, Lnicoid/network238/okhttp3/internal/http2/Header;

    invoke-direct {v1, p1, v0}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Lnicoid/network238/okio/ByteString;Lnicoid/network238/okio/ByteString;)V

    invoke-direct {p0, v1}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->addHeader(Lnicoid/network238/okhttp3/internal/http2/Header;)V

    return-void
.end method

.method private final readLiteralHeaderWithoutIndexingNewName()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 280
    sget-object v0, Lnicoid/network238/okhttp3/internal/http2/Hpack;->INSTANCE:Lnicoid/network238/okhttp3/internal/http2/Hpack;

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->readByteString()Lnicoid/network238/okio/ByteString;

    move-result-object v1

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/internal/http2/Hpack;->checkLowercase(Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/ByteString;

    move-result-object v0

    .line 281
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->readByteString()Lnicoid/network238/okio/ByteString;

    move-result-object v1

    .line 282
    new-instance v2, Lnicoid/network238/okhttp3/internal/http2/Header;

    invoke-direct {v2, v0, v1}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Lnicoid/network238/okio/ByteString;Lnicoid/network238/okio/ByteString;)V

    invoke-direct {p0, v2}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->addHeader(Lnicoid/network238/okhttp3/internal/http2/Header;)V

    return-void
.end method


# virtual methods
.method public final getAndResetHeaderList()Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/internal/http2/Header;",
            ">;"
        }
    .end annotation

    .line 148
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->headerList:Ljava/util/List;

    invoke-static {v0}, Lnicoid/network238/kotlin/collections/CollectionsKt;->toList(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v0

    .line 149
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->headerList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 150
    const-wide/16 v1, 0x0

    iput-wide v1, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->headerListByteCount:J

    return-object v0
.end method

.method public final maxDynamicTableByteCount()I
    .registers 2

    .line 154
    iget v0, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->maxDynamicTableByteCount:I

    return v0
.end method

.method public final readByteString()Lnicoid/network238/okio/ByteString;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 392
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->readByte()I

    move-result v0

    and-int/lit16 v1, v0, 0x80

    const/16 v2, 0x80

    if-ne v1, v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 394
    :goto_0
    const/16 v2, 0x7f

    invoke-virtual {p0, v0, v2}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->readInt(II)I

    move-result v0

    int-to-long v2, v0

    .line 397
    iget-wide v4, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->headerListByteCount:J

    add-long/2addr v4, v2

    const-wide/32 v6, 0x40000

    cmp-long v0, v4, v6

    if-gtz v0, :cond_2

    if-eqz v1, :cond_1

    .line 402
    new-instance v0, Lnicoid/network238/okio/Buffer;

    invoke-direct {v0}, Lnicoid/network238/okio/Buffer;-><init>()V

    .line 403
    sget-object v1, Lnicoid/network238/okhttp3/internal/http2/Huffman;->INSTANCE:Lnicoid/network238/okhttp3/internal/http2/Huffman;

    iget-object v4, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-virtual {v1, v4, v2, v3, v0}, Lnicoid/network238/okhttp3/internal/http2/Huffman;->decode(Lnicoid/network238/okio/BufferedSource;JLnicoid/network238/okio/BufferedSink;)V

    .line 404
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->readByteString()Lnicoid/network238/okio/ByteString;

    move-result-object v0

    return-object v0

    .line 406
    :cond_1
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-interface {v0, v2, v3}, Lnicoid/network238/okio/BufferedSource;->readByteString(J)Lnicoid/network238/okio/ByteString;

    move-result-object v0

    return-object v0

    .line 398
    :cond_2
    new-instance v0, Ljava/io/IOException;

    const-string v1, "header byte count limit of 262144 exceeded"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final readHeaders()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 206
    :goto_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-interface {v0}, Lnicoid/network238/okio/BufferedSource;->exhausted()Z

    move-result v0

    if-nez v0, :cond_7

    .line 207
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-interface {v0}, Lnicoid/network238/okio/BufferedSource;->readByte()B

    move-result v0

    const/16 v1, 0xff

    invoke-static {v0, v1}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->and(BI)I

    move-result v0

    const/16 v1, 0x80

    if-eq v0, v1, :cond_6

    and-int/lit16 v2, v0, 0x80

    if-ne v2, v1, :cond_0

    .line 216
    const/16 v1, 0x7f

    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->readInt(II)I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    .line 217
    invoke-direct {p0, v0}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->readIndexedHeader(I)V

    goto :goto_0

    :cond_0
    const/16 v1, 0x40

    if-ne v0, v1, :cond_1

    .line 222
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->readLiteralHeaderWithIncrementalIndexingNewName()V

    goto :goto_0

    :cond_1
    and-int/lit8 v2, v0, 0x40

    if-ne v2, v1, :cond_2

    .line 227
    const/16 v1, 0x3f

    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->readInt(II)I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    .line 228
    invoke-direct {p0, v0}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->readLiteralHeaderWithIncrementalIndexingIndexedName(I)V

    goto :goto_0

    :cond_2
    and-int/lit8 v1, v0, 0x20

    const/16 v2, 0x20

    if-ne v1, v2, :cond_4

    .line 233
    const/16 v1, 0x1f

    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->readInt(II)I

    move-result v0

    iput v0, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->maxDynamicTableByteCount:I

    if-ltz v0, :cond_3

    .line 234
    iget v1, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->headerTableSizeSetting:I

    if-gt v0, v1, :cond_3

    .line 237
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->adjustDynamicTableByteCount()V

    goto :goto_0

    .line 235
    :cond_3
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid dynamic table size update "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->maxDynamicTableByteCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_4
    const/16 v1, 0x10

    if-eq v0, v1, :cond_5

    if-eqz v0, :cond_5

    .line 247
    const/16 v1, 0xf

    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->readInt(II)I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    .line 248
    invoke-direct {p0, v0}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->readLiteralHeaderWithoutIndexingIndexedName(I)V

    goto :goto_0

    .line 242
    :cond_5
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->readLiteralHeaderWithoutIndexingNewName()V

    goto/16 :goto_0

    .line 211
    :cond_6
    new-instance v0, Ljava/io/IOException;

    const-string v1, "index == 0"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_7
    return-void
.end method

.method public final readInt(II)I
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    and-int/2addr p1, p2

    if-ge p1, p2, :cond_0

    return p1

    :cond_0
    int-to-long p1, p2

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    const/4 v2, 0x5

    const-string v3, "HPACK integer overflow"

    if-eq v0, v2, :cond_3

    .line 376
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->readByte()I

    move-result v2

    add-int/lit8 v0, v0, 0x1

    and-int/lit8 v4, v2, 0x7f

    int-to-long v4, v4

    shl-long/2addr v4, v1

    const-wide/32 v6, 0x7fffffff

    sub-long/2addr v6, p1

    cmp-long v6, v4, v6

    if-gtz v6, :cond_2

    add-long/2addr p1, v4

    and-int/lit16 v2, v2, 0x80

    if-eqz v2, :cond_1

    add-int/lit8 v1, v1, 0x7

    goto :goto_0

    :cond_1
    long-to-int p1, p1

    return p1

    .line 380
    :cond_2
    new-instance p1, Ljava/io/IOException;

    invoke-direct {p1, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 374
    :cond_3
    new-instance p1, Ljava/io/IOException;

    invoke-direct {p1, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
