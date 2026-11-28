.class public final Lnicoid/network238/okhttp3/internal/http2/Http2Reader;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/internal/http2/Http2Reader$Companion;,
        Lnicoid/network238/okhttp3/internal/http2/Http2Reader$ContinuationSource;,
        Lnicoid/network238/okhttp3/internal/http2/Http2Reader$Handler;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000F\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u000e\u0018\u0000 &2\u00020\u0001:\u0003$%&B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u000e\u0010\u000c\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u000fJ\u0016\u0010\u0010\u001a\u00020\u00052\u0006\u0010\u0011\u001a\u00020\u00052\u0006\u0010\u000e\u001a\u00020\u000fJ(\u0010\u0012\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0013\u001a\u00020\u00142\u0006\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u0016\u001a\u00020\u0014H\u0002J.\u0010\u0017\u001a\u0008\u0012\u0004\u0012\u00020\u00190\u00182\u0006\u0010\u0013\u001a\u00020\u00142\u0006\u0010\u001a\u001a\u00020\u00142\u0006\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u0016\u001a\u00020\u0014H\u0002J(\u0010\u001b\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0013\u001a\u00020\u00142\u0006\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u0016\u001a\u00020\u0014H\u0002J(\u0010\u001c\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0013\u001a\u00020\u00142\u0006\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u0016\u001a\u00020\u0014H\u0002J\u0018\u0010\u001c\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0016\u001a\u00020\u0014H\u0002J(\u0010\u001d\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0013\u001a\u00020\u00142\u0006\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u0016\u001a\u00020\u0014H\u0002J(\u0010\u001e\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0013\u001a\u00020\u00142\u0006\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u0016\u001a\u00020\u0014H\u0002J(\u0010\u001f\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0013\u001a\u00020\u00142\u0006\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u0016\u001a\u00020\u0014H\u0002J(\u0010 \u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0013\u001a\u00020\u00142\u0006\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u0016\u001a\u00020\u0014H\u0002J(\u0010!\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0013\u001a\u00020\u00142\u0006\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u0016\u001a\u00020\u0014H\u0002J(\u0010\"\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0013\u001a\u00020\u00142\u0006\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u0016\u001a\u00020\u0014H\u0002J\u0008\u0010#\u001a\u00020\rH\u0016R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0008\u001a\u00020\tX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u000bX\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\'"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/http2/Http2Reader;",
        "Ljava/io/Closeable;",
        "source",
        "Lnicoid/network238/okio/BufferedSource;",
        "client",
        "",
        "<init>",
        "(Lnicoid/network238/okio/BufferedSource;Z)V",
        "continuation",
        "Lnicoid/network238/okhttp3/internal/http2/Http2Reader$ContinuationSource;",
        "hpackReader",
        "Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;",
        "readConnectionPreface",
        "",
        "handler",
        "Lnicoid/network238/okhttp3/internal/http2/Http2Reader$Handler;",
        "nextFrame",
        "requireSettings",
        "readHeaders",
        "length",
        "",
        "flags",
        "streamId",
        "readHeaderBlock",
        "",
        "Lnicoid/network238/okhttp3/internal/http2/Header;",
        "padding",
        "readData",
        "readPriority",
        "readRstStream",
        "readSettings",
        "readPushPromise",
        "readPing",
        "readGoAway",
        "readWindowUpdate",
        "close",
        "ContinuationSource",
        "Handler",
        "Companion",
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


# static fields
.field public static final Companion:Lnicoid/network238/okhttp3/internal/http2/Http2Reader$Companion;

.field private static final logger:Ljava/util/logging/Logger;


# instance fields
.field private final client:Z

.field private final continuation:Lnicoid/network238/okhttp3/internal/http2/Http2Reader$ContinuationSource;

.field private final hpackReader:Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;

.field private final source:Lnicoid/network238/okio/BufferedSource;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okhttp3/internal/http2/Http2Reader$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->Companion:Lnicoid/network238/okhttp3/internal/http2/Http2Reader$Companion;

    .line 588
    const-class v0, Lnicoid/network238/okhttp3/internal/http2/Http2;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sput-object v0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->logger:Ljava/util/logging/Logger;

    return-void
.end method

.method public constructor <init>(Lnicoid/network238/okio/BufferedSource;Z)V
    .registers 9

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->source:Lnicoid/network238/okio/BufferedSource;

    .line 62
    iput-boolean p2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->client:Z

    .line 64
    new-instance v1, Lnicoid/network238/okhttp3/internal/http2/Http2Reader$ContinuationSource;

    invoke-direct {v1, p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Reader$ContinuationSource;-><init>(Lnicoid/network238/okio/BufferedSource;)V

    iput-object v1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->continuation:Lnicoid/network238/okhttp3/internal/http2/Http2Reader$ContinuationSource;

    .line 66
    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;

    const/4 v4, 0x4

    const/4 v5, 0x0

    const/16 v2, 0x1000

    const/4 v3, 0x0

    invoke-direct/range {v0 .. v5}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;-><init>(Lnicoid/network238/okio/Source;IIILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    iput-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->hpackReader:Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;

    return-void
.end method

.method public static final synthetic access$getLogger$cp()Ljava/util/logging/Logger;
    .registers 1

    .line 59
    sget-object v0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->logger:Ljava/util/logging/Logger;

    return-object v0
.end method

.method private final readData(Lnicoid/network238/okhttp3/internal/http2/Http2Reader$Handler;III)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-eqz p4, :cond_3

    and-int/lit8 v0, p3, 0x1

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    and-int/lit8 v2, p3, 0x20

    if-nez v2, :cond_2

    and-int/lit8 v2, p3, 0x8

    if-eqz v2, :cond_1

    .line 198
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-interface {v1}, Lnicoid/network238/okio/BufferedSource;->readByte()B

    move-result v1

    const/16 v2, 0xff

    invoke-static {v1, v2}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->and(BI)I

    move-result v1

    goto :goto_1

    :cond_1
    nop

    .line 199
    :goto_1
    sget-object v2, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->Companion:Lnicoid/network238/okhttp3/internal/http2/Http2Reader$Companion;

    invoke-virtual {v2, p2, p3, v1}, Lnicoid/network238/okhttp3/internal/http2/Http2Reader$Companion;->lengthWithoutPadding(III)I

    move-result p2

    .line 201
    iget-object p3, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-interface {p1, v0, p4, p3, p2}, Lnicoid/network238/okhttp3/internal/http2/Http2Reader$Handler;->data(ZILnicoid/network238/okio/BufferedSource;I)V

    .line 202
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->source:Lnicoid/network238/okio/BufferedSource;

    int-to-long p2, v1

    invoke-interface {p1, p2, p3}, Lnicoid/network238/okio/BufferedSource;->skip(J)V

    return-void

    .line 195
    :cond_2
    new-instance p1, Ljava/io/IOException;

    const-string p2, "PROTOCOL_ERROR: FLAG_COMPRESSED without SETTINGS_COMPRESS_DATA"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 189
    :cond_3
    new-instance p1, Ljava/io/IOException;

    const-string p2, "PROTOCOL_ERROR: TYPE_DATA streamId == 0"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private final readGoAway(Lnicoid/network238/okhttp3/internal/http2/Http2Reader$Handler;III)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 p3, 0x8

    if-lt p2, p3, :cond_3

    if-nez p4, :cond_2

    .line 350
    iget-object p4, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-interface {p4}, Lnicoid/network238/okio/BufferedSource;->readInt()I

    move-result p4

    .line 351
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-interface {v0}, Lnicoid/network238/okio/BufferedSource;->readInt()I

    move-result v0

    sub-int/2addr p2, p3

    .line 354
    sget-object p3, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->Companion:Lnicoid/network238/okhttp3/internal/http2/ErrorCode$Companion;

    invoke-virtual {p3, v0}, Lnicoid/network238/okhttp3/internal/http2/ErrorCode$Companion;->fromHttp2(I)Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    move-result-object p3

    if-eqz p3, :cond_1

    .line 357
    sget-object v0, Lnicoid/network238/okio/ByteString;->EMPTY:Lnicoid/network238/okio/ByteString;

    if-lez p2, :cond_0

    .line 359
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->source:Lnicoid/network238/okio/BufferedSource;

    int-to-long v1, p2

    invoke-interface {v0, v1, v2}, Lnicoid/network238/okio/BufferedSource;->readByteString(J)Lnicoid/network238/okio/ByteString;

    move-result-object v0

    .line 361
    :cond_0
    invoke-interface {p1, p4, p3, v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Reader$Handler;->goAway(ILnicoid/network238/okhttp3/internal/http2/ErrorCode;Lnicoid/network238/okio/ByteString;)V

    return-void

    .line 354
    :cond_1
    new-instance p1, Ljava/io/IOException;

    .line 355
    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "TYPE_GOAWAY unexpected error code: "

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 354
    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 349
    :cond_2
    new-instance p1, Ljava/io/IOException;

    const-string p2, "TYPE_GOAWAY streamId != 0"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 348
    :cond_3
    new-instance p1, Ljava/io/IOException;

    new-instance p3, Ljava/lang/StringBuilder;

    const-string p4, "TYPE_GOAWAY length < 8: "

    invoke-direct {p3, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private final readHeaderBlock(IIII)Ljava/util/List;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IIII)",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/internal/http2/Header;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 171
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->continuation:Lnicoid/network238/okhttp3/internal/http2/Http2Reader$ContinuationSource;

    invoke-virtual {v0, p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Reader$ContinuationSource;->setLeft(I)V

    .line 172
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->continuation:Lnicoid/network238/okhttp3/internal/http2/Http2Reader$ContinuationSource;

    invoke-virtual {p1, p2}, Lnicoid/network238/okhttp3/internal/http2/Http2Reader$ContinuationSource;->setPadding(I)V

    .line 173
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->continuation:Lnicoid/network238/okhttp3/internal/http2/Http2Reader$ContinuationSource;

    invoke-virtual {p1, p3}, Lnicoid/network238/okhttp3/internal/http2/Http2Reader$ContinuationSource;->setFlags(I)V

    .line 174
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->continuation:Lnicoid/network238/okhttp3/internal/http2/Http2Reader$ContinuationSource;

    invoke-virtual {p1, p4}, Lnicoid/network238/okhttp3/internal/http2/Http2Reader$ContinuationSource;->setStreamId(I)V

    .line 178
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->hpackReader:Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->readHeaders()V

    .line 179
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->hpackReader:Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;->getAndResetHeaderList()Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method private final readHeaders(Lnicoid/network238/okhttp3/internal/http2/Http2Reader$Handler;III)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-eqz p4, :cond_3

    and-int/lit8 v0, p3, 0x1

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    and-int/lit8 v2, p3, 0x8

    if-eqz v2, :cond_1

    .line 151
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-interface {v1}, Lnicoid/network238/okio/BufferedSource;->readByte()B

    move-result v1

    const/16 v2, 0xff

    invoke-static {v1, v2}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->and(BI)I

    move-result v1

    goto :goto_1

    :cond_1
    nop

    :goto_1
    and-int/lit8 v2, p3, 0x20

    if-eqz v2, :cond_2

    .line 155
    invoke-direct {p0, p1, p4}, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->readPriority(Lnicoid/network238/okhttp3/internal/http2/Http2Reader$Handler;I)V

    add-int/lit8 p2, p2, -0x5

    .line 158
    :cond_2
    sget-object v2, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->Companion:Lnicoid/network238/okhttp3/internal/http2/Http2Reader$Companion;

    invoke-virtual {v2, p2, p3, v1}, Lnicoid/network238/okhttp3/internal/http2/Http2Reader$Companion;->lengthWithoutPadding(III)I

    move-result p2

    .line 159
    invoke-direct {p0, p2, v1, p3, p4}, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->readHeaderBlock(IIII)Ljava/util/List;

    move-result-object p2

    .line 161
    const/4 p3, -0x1

    invoke-interface {p1, v0, p4, p3, p2}, Lnicoid/network238/okhttp3/internal/http2/Http2Reader$Handler;->headers(ZIILjava/util/List;)V

    return-void

    .line 148
    :cond_3
    new-instance p1, Ljava/io/IOException;

    const-string p2, "PROTOCOL_ERROR: TYPE_HEADERS streamId == 0"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private final readPing(Lnicoid/network238/okhttp3/internal/http2/Http2Reader$Handler;III)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0x8

    if-ne p2, v0, :cond_2

    if-nez p4, :cond_1

    .line 335
    iget-object p2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-interface {p2}, Lnicoid/network238/okio/BufferedSource;->readInt()I

    move-result p2

    .line 336
    iget-object p4, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-interface {p4}, Lnicoid/network238/okio/BufferedSource;->readInt()I

    move-result p4

    const/4 v0, 0x1

    and-int/2addr p3, v0

    if-nez p3, :cond_0

    const/4 v0, 0x0

    .line 338
    :cond_0
    invoke-interface {p1, v0, p2, p4}, Lnicoid/network238/okhttp3/internal/http2/Http2Reader$Handler;->ping(ZII)V

    return-void

    .line 334
    :cond_1
    new-instance p1, Ljava/io/IOException;

    const-string p2, "TYPE_PING streamId != 0"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 333
    :cond_2
    new-instance p1, Ljava/io/IOException;

    new-instance p3, Ljava/lang/StringBuilder;

    const-string p4, "TYPE_PING length != 8: "

    invoke-direct {p3, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private final readPriority(Lnicoid/network238/okhttp3/internal/http2/Http2Reader$Handler;I)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 222
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-interface {v0}, Lnicoid/network238/okio/BufferedSource;->readInt()I

    move-result v0

    const/high16 v1, -0x80000000

    and-int/2addr v1, v0

    const/4 v2, 0x1

    if-eqz v1, :cond_0

    move v1, v2

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    const v3, 0x7fffffff

    and-int/2addr v0, v3

    .line 225
    iget-object v3, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-interface {v3}, Lnicoid/network238/okio/BufferedSource;->readByte()B

    move-result v3

    const/16 v4, 0xff

    invoke-static {v3, v4}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->and(BI)I

    move-result v3

    add-int/2addr v3, v2

    .line 226
    invoke-interface {p1, p2, v0, v3, v1}, Lnicoid/network238/okhttp3/internal/http2/Http2Reader$Handler;->priority(IIIZ)V

    return-void
.end method

.method private final readPriority(Lnicoid/network238/okhttp3/internal/http2/Http2Reader$Handler;III)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 p3, 0x5

    if-ne p2, p3, :cond_1

    if-eqz p4, :cond_0

    .line 214
    invoke-direct {p0, p1, p4}, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->readPriority(Lnicoid/network238/okhttp3/internal/http2/Http2Reader$Handler;I)V

    return-void

    .line 213
    :cond_0
    new-instance p1, Ljava/io/IOException;

    const-string p2, "TYPE_PRIORITY streamId == 0"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 212
    :cond_1
    new-instance p1, Ljava/io/IOException;

    new-instance p3, Ljava/lang/StringBuilder;

    const-string p4, "TYPE_PRIORITY length: "

    invoke-direct {p3, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string p3, " != 5"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private final readPushPromise(Lnicoid/network238/okhttp3/internal/http2/Http2Reader$Handler;III)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-eqz p4, :cond_1

    and-int/lit8 v0, p3, 0x8

    if-eqz v0, :cond_0

    .line 319
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-interface {v0}, Lnicoid/network238/okio/BufferedSource;->readByte()B

    move-result v0

    const/16 v1, 0xff

    invoke-static {v0, v1}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->and(BI)I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 320
    :goto_0
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-interface {v1}, Lnicoid/network238/okio/BufferedSource;->readInt()I

    move-result v1

    const v2, 0x7fffffff

    and-int/2addr v1, v2

    .line 321
    sget-object v2, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->Companion:Lnicoid/network238/okhttp3/internal/http2/Http2Reader$Companion;

    add-int/lit8 p2, p2, -0x4

    invoke-virtual {v2, p2, p3, v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Reader$Companion;->lengthWithoutPadding(III)I

    move-result p2

    .line 322
    invoke-direct {p0, p2, v0, p3, p4}, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->readHeaderBlock(IIII)Ljava/util/List;

    move-result-object p2

    .line 323
    invoke-interface {p1, p4, v1, p2}, Lnicoid/network238/okhttp3/internal/http2/Http2Reader$Handler;->pushPromise(IILjava/util/List;)V

    return-void

    .line 317
    :cond_1
    new-instance p1, Ljava/io/IOException;

    const-string p2, "PROTOCOL_ERROR: TYPE_PUSH_PROMISE streamId == 0"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private final readRstStream(Lnicoid/network238/okhttp3/internal/http2/Http2Reader$Handler;III)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 p3, 0x4

    if-ne p2, p3, :cond_2

    if-eqz p4, :cond_1

    .line 238
    iget-object p2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-interface {p2}, Lnicoid/network238/okio/BufferedSource;->readInt()I

    move-result p2

    .line 240
    sget-object p3, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->Companion:Lnicoid/network238/okhttp3/internal/http2/ErrorCode$Companion;

    invoke-virtual {p3, p2}, Lnicoid/network238/okhttp3/internal/http2/ErrorCode$Companion;->fromHttp2(I)Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    move-result-object p3

    if-eqz p3, :cond_0

    .line 243
    invoke-interface {p1, p4, p3}, Lnicoid/network238/okhttp3/internal/http2/Http2Reader$Handler;->rstStream(ILnicoid/network238/okhttp3/internal/http2/ErrorCode;)V

    return-void

    .line 240
    :cond_0
    new-instance p1, Ljava/io/IOException;

    .line 241
    new-instance p3, Ljava/lang/StringBuilder;

    const-string p4, "TYPE_RST_STREAM unexpected error code: "

    invoke-direct {p3, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 240
    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 237
    :cond_1
    new-instance p1, Ljava/io/IOException;

    const-string p2, "TYPE_RST_STREAM streamId == 0"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 236
    :cond_2
    new-instance p1, Ljava/io/IOException;

    new-instance p3, Ljava/lang/StringBuilder;

    const-string p4, "TYPE_RST_STREAM length: "

    invoke-direct {p3, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string p3, " != 4"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private final readSettings(Lnicoid/network238/okhttp3/internal/http2/Http2Reader$Handler;III)V
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-nez p4, :cond_c

    const/4 p4, 0x1

    and-int/2addr p3, p4

    if-eqz p3, :cond_1

    if-nez p2, :cond_0

    .line 256
    invoke-interface {p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Reader$Handler;->ackSettings()V

    return-void

    .line 255
    :cond_0
    new-instance p1, Ljava/io/IOException;

    const-string p2, "FRAME_SIZE_ERROR ack frame should be empty!"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    nop

    .line 260
    rem-int/lit8 p3, p2, 0x6

    if-nez p3, :cond_b

    .line 261
    new-instance p3, Lnicoid/network238/okhttp3/internal/http2/Settings;

    invoke-direct {p3}, Lnicoid/network238/okhttp3/internal/http2/Settings;-><init>()V

    .line 262
    const/4 v0, 0x0

    invoke-static {v0, p2}, Lnicoid/network238/kotlin/ranges/RangesKt;->until(II)Lnicoid/network238/kotlin/ranges/IntRange;

    move-result-object p2

    const/4 v1, 0x6

    invoke-static {p2, v1}, Lnicoid/network238/kotlin/ranges/RangesKt;->step(Lnicoid/network238/kotlin/ranges/IntProgression;I)Lnicoid/network238/kotlin/ranges/IntProgression;

    move-result-object p2

    invoke-virtual {p2}, Lnicoid/network238/kotlin/ranges/IntProgression;->getFirst()I

    move-result v1

    invoke-virtual {p2}, Lnicoid/network238/kotlin/ranges/IntProgression;->getLast()I

    move-result v2

    invoke-virtual {p2}, Lnicoid/network238/kotlin/ranges/IntProgression;->getStep()I

    move-result p2

    if-lez p2, :cond_2

    if-le v1, v2, :cond_3

    :cond_2
    if-gez p2, :cond_a

    if-gt v2, v1, :cond_a

    .line 263
    :cond_3
    :goto_0
    iget-object v3, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-interface {v3}, Lnicoid/network238/okio/BufferedSource;->readShort()S

    move-result v3

    const v4, 0xffff

    invoke-static {v3, v4}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->and(SI)I

    move-result v3

    .line 264
    iget-object v4, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-interface {v4}, Lnicoid/network238/okio/BufferedSource;->readInt()I

    move-result v4

    const/4 v5, 0x2

    if-eq v3, v5, :cond_8

    const/4 v5, 0x4

    if-eq v3, v5, :cond_6

    const/4 v5, 0x5

    if-ne v3, v5, :cond_4

    const/16 v5, 0x4000

    if-lt v4, v5, :cond_5

    const v5, 0xffffff

    if-gt v4, v5, :cond_5

    :cond_4
    goto :goto_1

    .line 292
    :cond_5
    new-instance p1, Ljava/io/IOException;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "PROTOCOL_ERROR SETTINGS_MAX_FRAME_SIZE: "

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_6
    if-ltz v4, :cond_7

    goto :goto_1

    .line 285
    :cond_7
    new-instance p1, Ljava/io/IOException;

    const-string p2, "PROTOCOL_ERROR SETTINGS_INITIAL_WINDOW_SIZE > 2^31 - 1"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_8
    if-eqz v4, :cond_9

    if-eq v4, p4, :cond_9

    .line 274
    new-instance p1, Ljava/io/IOException;

    const-string p2, "PROTOCOL_ERROR SETTINGS_ENABLE_PUSH != 0 or 1"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 304
    :cond_9
    :goto_1
    invoke-virtual {p3, v3, v4}, Lnicoid/network238/okhttp3/internal/http2/Settings;->set(II)Lnicoid/network238/okhttp3/internal/http2/Settings;

    if-eq v1, v2, :cond_a

    add-int/2addr v1, p2

    goto :goto_0

    :cond_a
    nop

    .line 306
    invoke-interface {p1, v0, p3}, Lnicoid/network238/okhttp3/internal/http2/Http2Reader$Handler;->settings(ZLnicoid/network238/okhttp3/internal/http2/Settings;)V

    return-void

    .line 260
    :cond_b
    new-instance p1, Ljava/io/IOException;

    new-instance p3, Ljava/lang/StringBuilder;

    const-string p4, "TYPE_SETTINGS length % 6 != 0: "

    invoke-direct {p3, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 253
    :cond_c
    new-instance p1, Ljava/io/IOException;

    const-string p2, "TYPE_SETTINGS streamId != 0"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private final readWindowUpdate(Lnicoid/network238/okhttp3/internal/http2/Http2Reader$Handler;III)V
    .registers 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 372
    const-string v0, "TYPE_WINDOW_UPDATE length !=4: "

    const/4 v1, 0x4

    if-ne p2, v1, :cond_2

    .line 375
    :try_start_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-interface {v0}, Lnicoid/network238/okio/BufferedSource;->readInt()I

    move-result v0

    const-wide/32 v1, 0x7fffffff

    invoke-static {v0, v1, v2}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->and(IJ)J

    move-result-wide v7
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-wide/16 v0, 0x0

    cmp-long v0, v7, v0

    if-eqz v0, :cond_1

    .line 381
    sget-object p3, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->logger:Ljava/util/logging/Logger;

    sget-object v0, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {p3, v0}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 383
    sget-object v3, Lnicoid/network238/okhttp3/internal/http2/Http2;->INSTANCE:Lnicoid/network238/okhttp3/internal/http2/Http2;

    const/4 v4, 0x1

    move v6, p2

    move v5, p4

    invoke-virtual/range {v3 .. v8}, Lnicoid/network238/okhttp3/internal/http2/Http2;->frameLogWindowUpdate(ZIIJ)Ljava/lang/String;

    move-result-object p2

    .line 382
    move v2, v5

    invoke-virtual {p3, p2}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    goto :goto_0

    .line 381
    :cond_0
    move v2, p4

    .line 391
    :goto_0
    invoke-interface {p1, v2, v7, v8}, Lnicoid/network238/okhttp3/internal/http2/Http2Reader$Handler;->windowUpdate(IJ)V

    return-void

    .line 376
    :cond_1
    move v3, p2

    move v2, p4

    :try_start_1
    new-instance p1, Ljava/io/IOException;

    const-string p2, "windowSizeIncrement was 0"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 378
    :catch_0
    move-exception v0

    move v3, p2

    move v2, p4

    goto :goto_1

    .line 374
    :cond_2
    move v3, p2

    move v2, p4

    new-instance p1, Ljava/io/IOException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 378
    :catch_1
    move-exception v0

    :goto_1
    move-object p1, v0

    sget-object p2, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->logger:Ljava/util/logging/Logger;

    sget-object v0, Lnicoid/network238/okhttp3/internal/http2/Http2;->INSTANCE:Lnicoid/network238/okhttp3/internal/http2/Http2;

    const/4 v1, 0x1

    const/16 v4, 0x8

    move v5, p3

    invoke-virtual/range {v0 .. v5}, Lnicoid/network238/okhttp3/internal/http2/Http2;->frameLog(ZIIII)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 379
    throw p1
.end method


# virtual methods
.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 396
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-interface {v0}, Lnicoid/network238/okio/Source;->close()V

    return-void
.end method

.method public final nextFrame(ZLnicoid/network238/okhttp3/internal/http2/Http2Reader$Handler;)Z
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 94
    :try_start_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->source:Lnicoid/network238/okio/BufferedSource;

    const-wide/16 v1, 0x9

    invoke-interface {v0, v1, v2}, Lnicoid/network238/okio/BufferedSource;->require(J)V
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0

    .line 110
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-static {v0}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->readMedium(Lnicoid/network238/okio/BufferedSource;)I

    move-result v4

    const/16 v0, 0x4000

    if-gt v4, v0, :cond_2

    .line 114
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-interface {v0}, Lnicoid/network238/okio/BufferedSource;->readByte()B

    move-result v0

    const/16 v1, 0xff

    invoke-static {v0, v1}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->and(BI)I

    move-result v5

    .line 115
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-interface {v0}, Lnicoid/network238/okio/BufferedSource;->readByte()B

    move-result v0

    invoke-static {v0, v1}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->and(BI)I

    move-result v6

    .line 116
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-interface {v0}, Lnicoid/network238/okio/BufferedSource;->readInt()I

    move-result v0

    const v1, 0x7fffffff

    and-int v3, v0, v1

    const/16 v0, 0x8

    if-eq v5, v0, :cond_0

    .line 117
    sget-object v0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->logger:Ljava/util/logging/Logger;

    sget-object v1, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 118
    sget-object v1, Lnicoid/network238/okhttp3/internal/http2/Http2;->INSTANCE:Lnicoid/network238/okhttp3/internal/http2/Http2;

    const/4 v2, 0x1

    invoke-virtual/range {v1 .. v6}, Lnicoid/network238/okhttp3/internal/http2/Http2;->frameLog(ZIIII)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    :cond_0
    if-eqz p1, :cond_1

    const/4 p1, 0x4

    if-eq v5, p1, :cond_1

    .line 122
    new-instance p1, Ljava/io/IOException;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "Expected a SETTINGS frame but was "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v0, Lnicoid/network238/okhttp3/internal/http2/Http2;->INSTANCE:Lnicoid/network238/okhttp3/internal/http2/Http2;

    invoke-virtual {v0, v5}, Lnicoid/network238/okhttp3/internal/http2/Http2;->formattedType$okhttp(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    packed-switch v5, :pswitch_data_0

    .line 135
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->source:Lnicoid/network238/okio/BufferedSource;

    int-to-long v0, v4

    invoke-interface {p1, v0, v1}, Lnicoid/network238/okio/BufferedSource;->skip(J)V

    goto :goto_0

    .line 134
    :pswitch_0
    invoke-direct {p0, p2, v4, v6, v3}, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->readWindowUpdate(Lnicoid/network238/okhttp3/internal/http2/Http2Reader$Handler;III)V

    goto :goto_0

    .line 133
    :pswitch_1
    invoke-direct {p0, p2, v4, v6, v3}, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->readGoAway(Lnicoid/network238/okhttp3/internal/http2/Http2Reader$Handler;III)V

    goto :goto_0

    .line 132
    :pswitch_2
    invoke-direct {p0, p2, v4, v6, v3}, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->readPing(Lnicoid/network238/okhttp3/internal/http2/Http2Reader$Handler;III)V

    goto :goto_0

    .line 131
    :pswitch_3
    invoke-direct {p0, p2, v4, v6, v3}, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->readPushPromise(Lnicoid/network238/okhttp3/internal/http2/Http2Reader$Handler;III)V

    goto :goto_0

    .line 130
    :pswitch_4
    invoke-direct {p0, p2, v4, v6, v3}, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->readSettings(Lnicoid/network238/okhttp3/internal/http2/Http2Reader$Handler;III)V

    goto :goto_0

    .line 129
    :pswitch_5
    invoke-direct {p0, p2, v4, v6, v3}, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->readRstStream(Lnicoid/network238/okhttp3/internal/http2/Http2Reader$Handler;III)V

    goto :goto_0

    .line 128
    :pswitch_6
    invoke-direct {p0, p2, v4, v6, v3}, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->readPriority(Lnicoid/network238/okhttp3/internal/http2/Http2Reader$Handler;III)V

    goto :goto_0

    .line 127
    :pswitch_7
    invoke-direct {p0, p2, v4, v6, v3}, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->readHeaders(Lnicoid/network238/okhttp3/internal/http2/Http2Reader$Handler;III)V

    goto :goto_0

    .line 126
    :pswitch_8
    invoke-direct {p0, p2, v4, v6, v3}, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->readData(Lnicoid/network238/okhttp3/internal/http2/Http2Reader$Handler;III)V

    :goto_0
    const/4 p1, 0x1

    return p1

    .line 112
    :cond_2
    new-instance p1, Ljava/io/IOException;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "FRAME_SIZE_ERROR: "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    :catch_0
    move-exception v0

    const/4 p1, 0x0

    return p1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final readConnectionPreface(Lnicoid/network238/okhttp3/internal/http2/Http2Reader$Handler;)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 73
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->client:Z

    if-eqz v0, :cond_1

    .line 75
    const/4 v0, 0x1

    invoke-virtual {p0, v0, p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->nextFrame(ZLnicoid/network238/okhttp3/internal/http2/Http2Reader$Handler;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    .line 76
    :cond_0
    new-instance p1, Ljava/io/IOException;

    const-string v0, "Required SETTINGS preface not received"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 80
    :cond_1
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->source:Lnicoid/network238/okio/BufferedSource;

    sget-object v0, Lnicoid/network238/okhttp3/internal/http2/Http2;->CONNECTION_PREFACE:Lnicoid/network238/okio/ByteString;

    invoke-virtual {v0}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v1

    int-to-long v1, v1

    invoke-interface {p1, v1, v2}, Lnicoid/network238/okio/BufferedSource;->readByteString(J)Lnicoid/network238/okio/ByteString;

    move-result-object p1

    .line 81
    sget-object v1, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->logger:Ljava/util/logging/Logger;

    sget-object v2, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v1, v2}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v2

    if-eqz v2, :cond_2

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "<< CONNECTION "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lnicoid/network238/okio/ByteString;->hex()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v2, v3}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 82
    :cond_2
    invoke-static {v0, p1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    :goto_0
    return-void

    .line 83
    :cond_3
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Expected a connection header but was "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lnicoid/network238/okio/ByteString;->utf8()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
