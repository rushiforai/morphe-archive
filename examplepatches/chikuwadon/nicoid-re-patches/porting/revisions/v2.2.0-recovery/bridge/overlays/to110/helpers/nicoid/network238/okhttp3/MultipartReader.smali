.class public final Lnicoid/network238/okhttp3/MultipartReader;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/MultipartReader$Companion;,
        Lnicoid/network238/okhttp3/MultipartReader$Part;,
        Lnicoid/network238/okhttp3/MultipartReader$PartSource;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000R\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0004\u0018\u0000 \u001f2\u00020\u0001:\u0003\u001d\u001e\u001fB\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0006\u0010\u0007B\u0011\u0008\u0016\u0012\u0006\u0010\u0008\u001a\u00020\t\u00a2\u0006\u0004\u0008\u0006\u0010\nJ\u0008\u0010\u0016\u001a\u0004\u0018\u00010\u0017J\u0010\u0010\u0018\u001a\u00020\u00192\u0006\u0010\u001a\u001a\u00020\u0019H\u0002J\u0008\u0010\u001b\u001a\u00020\u001cH\u0016R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0013\u0010\u0004\u001a\u00020\u00058\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0004\u0010\u000bR\u000e\u0010\u000c\u001a\u00020\rX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000e\u001a\u00020\rX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000f\u001a\u00020\u0010X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0011\u001a\u00020\u0012X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0013\u001a\u00020\u0012X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0014\u001a\u0008\u0018\u00010\u0015R\u00020\u0000X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006 "
    }
    d2 = {
        "Lnicoid/network238/okhttp3/MultipartReader;",
        "Ljava/io/Closeable;",
        "source",
        "Lnicoid/network238/okio/BufferedSource;",
        "boundary",
        "",
        "<init>",
        "(Lnicoid/network238/okio/BufferedSource;Ljava/lang/String;)V",
        "response",
        "Lnicoid/network238/okhttp3/ResponseBody;",
        "(Lnicoid/network238/okhttp3/ResponseBody;)V",
        "()Ljava/lang/String;",
        "dashDashBoundary",
        "Lnicoid/network238/okio/ByteString;",
        "crlfDashDashBoundary",
        "partCount",
        "",
        "closed",
        "",
        "noMoreParts",
        "currentPart",
        "Lnicoid/network238/okhttp3/MultipartReader$PartSource;",
        "nextPart",
        "Lnicoid/network238/okhttp3/MultipartReader$Part;",
        "currentPartBytesRemaining",
        "",
        "maxByteCount",
        "close",
        "",
        "PartSource",
        "Part",
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
.field public static final Companion:Lnicoid/network238/okhttp3/MultipartReader$Companion;

.field private static final afterBoundaryOptions:Lnicoid/network238/okio/Options;


# instance fields
.field private final boundary:Ljava/lang/String;

.field private closed:Z

.field private final crlfDashDashBoundary:Lnicoid/network238/okio/ByteString;

.field private currentPart:Lnicoid/network238/okhttp3/MultipartReader$PartSource;

.field private final dashDashBoundary:Lnicoid/network238/okio/ByteString;

.field private noMoreParts:Z

.field private partCount:I

.field private final source:Lnicoid/network238/okio/BufferedSource;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    new-instance v0, Lnicoid/network238/okhttp3/MultipartReader$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okhttp3/MultipartReader$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okhttp3/MultipartReader;->Companion:Lnicoid/network238/okhttp3/MultipartReader$Companion;

    .line 224
    sget-object v0, Lnicoid/network238/okio/Options;->Companion:Lnicoid/network238/okio/Options$Companion;

    .line 226
    sget-object v1, Lnicoid/network238/okio/ByteString;->Companion:Lnicoid/network238/okio/ByteString$Companion;

    const-string v2, "\r\n"

    invoke-virtual {v1, v2}, Lnicoid/network238/okio/ByteString$Companion;->encodeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object v2

    .line 228
    const-string v3, "--"

    invoke-virtual {v1, v3}, Lnicoid/network238/okio/ByteString$Companion;->encodeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object v3

    .line 230
    const-string v4, " "

    invoke-virtual {v1, v4}, Lnicoid/network238/okio/ByteString$Companion;->encodeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object v4

    .line 232
    const-string v5, "\t"

    invoke-virtual {v1, v5}, Lnicoid/network238/okio/ByteString$Companion;->encodeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object v1

    const/4 v5, 0x4

    new-array v5, v5, [Lnicoid/network238/okio/ByteString;

    const/4 v6, 0x0

    aput-object v2, v5, v6

    const/4 v2, 0x1

    aput-object v3, v5, v2

    const/4 v2, 0x2

    aput-object v4, v5, v2

    const/4 v2, 0x3

    aput-object v1, v5, v2

    .line 224
    invoke-virtual {v0, v5}, Lnicoid/network238/okio/Options$Companion;->of([Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/Options;

    move-result-object v0

    sput-object v0, Lnicoid/network238/okhttp3/MultipartReader;->afterBoundaryOptions:Lnicoid/network238/okio/Options;

    return-void
.end method

.method public constructor <init>(Lnicoid/network238/okhttp3/ResponseBody;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 90
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/ResponseBody;->source()Lnicoid/network238/okio/BufferedSource;

    move-result-object v0

    .line 92
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/ResponseBody;->contentType()Lnicoid/network238/okhttp3/MediaType;

    move-result-object p1

    if-eqz p1, :cond_0

    const-string v1, "boundary"

    invoke-virtual {p1, v1}, Lnicoid/network238/okhttp3/MediaType;->parameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 89
    invoke-direct {p0, v0, p1}, Lnicoid/network238/okhttp3/MultipartReader;-><init>(Lnicoid/network238/okio/BufferedSource;Ljava/lang/String;)V

    return-void

    .line 93
    :cond_0
    new-instance p1, Ljava/net/ProtocolException;

    const-string v0, "expected the Content-Type to have a boundary parameter"

    invoke-direct {p1, v0}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public constructor <init>(Lnicoid/network238/okio/BufferedSource;Ljava/lang/String;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    iput-object p1, p0, Lnicoid/network238/okhttp3/MultipartReader;->source:Lnicoid/network238/okio/BufferedSource;

    .line 62
    iput-object p2, p0, Lnicoid/network238/okhttp3/MultipartReader;->boundary:Ljava/lang/String;

    .line 66
    new-instance p1, Lnicoid/network238/okio/Buffer;

    invoke-direct {p1}, Lnicoid/network238/okio/Buffer;-><init>()V

    .line 67
    const-string v0, "--"

    invoke-virtual {p1, v0}, Lnicoid/network238/okio/Buffer;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/Buffer;

    move-result-object p1

    .line 68
    invoke-virtual {p1, p2}, Lnicoid/network238/okio/Buffer;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/Buffer;

    move-result-object p1

    .line 69
    invoke-virtual {p1}, Lnicoid/network238/okio/Buffer;->readByteString()Lnicoid/network238/okio/ByteString;

    move-result-object p1

    iput-object p1, p0, Lnicoid/network238/okhttp3/MultipartReader;->dashDashBoundary:Lnicoid/network238/okio/ByteString;

    .line 76
    new-instance p1, Lnicoid/network238/okio/Buffer;

    invoke-direct {p1}, Lnicoid/network238/okio/Buffer;-><init>()V

    .line 77
    const-string v0, "\r\n--"

    invoke-virtual {p1, v0}, Lnicoid/network238/okio/Buffer;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/Buffer;

    move-result-object p1

    .line 78
    invoke-virtual {p1, p2}, Lnicoid/network238/okio/Buffer;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/Buffer;

    move-result-object p1

    .line 79
    invoke-virtual {p1}, Lnicoid/network238/okio/Buffer;->readByteString()Lnicoid/network238/okio/ByteString;

    move-result-object p1

    iput-object p1, p0, Lnicoid/network238/okhttp3/MultipartReader;->crlfDashDashBoundary:Lnicoid/network238/okio/ByteString;

    return-void
.end method

.method public static final synthetic access$currentPartBytesRemaining(Lnicoid/network238/okhttp3/MultipartReader;J)J
    .registers 3

    .line 58
    invoke-direct {p0, p1, p2}, Lnicoid/network238/okhttp3/MultipartReader;->currentPartBytesRemaining(J)J

    move-result-wide p0

    return-wide p0
.end method

.method public static final synthetic access$getAfterBoundaryOptions$cp()Lnicoid/network238/okio/Options;
    .registers 1

    .line 58
    sget-object v0, Lnicoid/network238/okhttp3/MultipartReader;->afterBoundaryOptions:Lnicoid/network238/okio/Options;

    return-object v0
.end method

.method public static final synthetic access$getCurrentPart$p(Lnicoid/network238/okhttp3/MultipartReader;)Lnicoid/network238/okhttp3/MultipartReader$PartSource;
    .registers 1

    .line 58
    iget-object p0, p0, Lnicoid/network238/okhttp3/MultipartReader;->currentPart:Lnicoid/network238/okhttp3/MultipartReader$PartSource;

    return-object p0
.end method

.method public static final synthetic access$getSource$p(Lnicoid/network238/okhttp3/MultipartReader;)Lnicoid/network238/okio/BufferedSource;
    .registers 1

    .line 58
    iget-object p0, p0, Lnicoid/network238/okhttp3/MultipartReader;->source:Lnicoid/network238/okio/BufferedSource;

    return-object p0
.end method

.method public static final synthetic access$setCurrentPart$p(Lnicoid/network238/okhttp3/MultipartReader;Lnicoid/network238/okhttp3/MultipartReader$PartSource;)V
    .registers 2

    .line 58
    iput-object p1, p0, Lnicoid/network238/okhttp3/MultipartReader;->currentPart:Lnicoid/network238/okhttp3/MultipartReader$PartSource;

    return-void
.end method

.method private final currentPartBytesRemaining(J)J
    .registers 13

    .line 189
    iget-object v0, p0, Lnicoid/network238/okhttp3/MultipartReader;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-interface {v0}, Lnicoid/network238/okio/BufferedSource;->getBuffer()Lnicoid/network238/okio/Buffer;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    invoke-static {v0, v1, p1, p2}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    const-wide/16 v2, 0x1

    add-long v8, v0, v2

    .line 191
    iget-object v4, p0, Lnicoid/network238/okhttp3/MultipartReader;->source:Lnicoid/network238/okio/BufferedSource;

    .line 192
    iget-object v5, p0, Lnicoid/network238/okhttp3/MultipartReader;->crlfDashDashBoundary:Lnicoid/network238/okio/ByteString;

    .line 191
    const-wide/16 v6, 0x0

    invoke-interface/range {v4 .. v9}, Lnicoid/network238/okio/BufferedSource;->indexOf(Lnicoid/network238/okio/ByteString;JJ)J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v2, v0, v2

    if-eqz v2, :cond_0

    return-wide v0

    .line 200
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/MultipartReader;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-interface {v0}, Lnicoid/network238/okio/BufferedSource;->getBuffer()Lnicoid/network238/okio/Buffer;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    cmp-long v0, v0, v8

    if-ltz v0, :cond_1

    invoke-static {v8, v9, p1, p2}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p1

    return-wide p1

    .line 203
    :cond_1
    new-instance p1, Ljava/io/EOFException;

    invoke-direct {p1}, Ljava/io/EOFException;-><init>()V

    throw p1
.end method


# virtual methods
.method public final boundary()Ljava/lang/String;
    .registers 2

    .line 62
    iget-object v0, p0, Lnicoid/network238/okhttp3/MultipartReader;->boundary:Ljava/lang/String;

    return-object v0
.end method

.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 209
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/MultipartReader;->closed:Z

    if-eqz v0, :cond_0

    return-void

    .line 210
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lnicoid/network238/okhttp3/MultipartReader;->closed:Z

    .line 211
    const/4 v0, 0x0

    iput-object v0, p0, Lnicoid/network238/okhttp3/MultipartReader;->currentPart:Lnicoid/network238/okhttp3/MultipartReader$PartSource;

    .line 212
    iget-object v0, p0, Lnicoid/network238/okhttp3/MultipartReader;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-interface {v0}, Lnicoid/network238/okio/Source;->close()V

    return-void
.end method

.method public final nextPart()Lnicoid/network238/okhttp3/MultipartReader$Part;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 98
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/MultipartReader;->closed:Z

    if-nez v0, :cond_5

    .line 100
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/MultipartReader;->noMoreParts:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return-object v1

    .line 103
    :cond_0
    iget v0, p0, Lnicoid/network238/okhttp3/MultipartReader;->partCount:I

    const-wide/16 v2, 0x0

    if-nez v0, :cond_1

    iget-object v0, p0, Lnicoid/network238/okhttp3/MultipartReader;->source:Lnicoid/network238/okio/BufferedSource;

    iget-object v4, p0, Lnicoid/network238/okhttp3/MultipartReader;->dashDashBoundary:Lnicoid/network238/okio/ByteString;

    invoke-interface {v0, v2, v3, v4}, Lnicoid/network238/okio/BufferedSource;->rangeEquals(JLnicoid/network238/okio/ByteString;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 105
    iget-object v0, p0, Lnicoid/network238/okhttp3/MultipartReader;->source:Lnicoid/network238/okio/BufferedSource;

    iget-object v2, p0, Lnicoid/network238/okhttp3/MultipartReader;->dashDashBoundary:Lnicoid/network238/okio/ByteString;

    invoke-virtual {v2}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v2

    int-to-long v2, v2

    invoke-interface {v0, v2, v3}, Lnicoid/network238/okio/BufferedSource;->skip(J)V

    goto :goto_1

    :cond_1
    :goto_0
    nop

    .line 109
    const-wide/16 v4, 0x2000

    invoke-direct {p0, v4, v5}, Lnicoid/network238/okhttp3/MultipartReader;->currentPartBytesRemaining(J)J

    move-result-wide v4

    cmp-long v0, v4, v2

    .line 113
    iget-object v6, p0, Lnicoid/network238/okhttp3/MultipartReader;->source:Lnicoid/network238/okio/BufferedSource;

    if-eqz v0, :cond_2

    .line 111
    invoke-interface {v6, v4, v5}, Lnicoid/network238/okio/BufferedSource;->skip(J)V

    goto :goto_0

    .line 113
    :cond_2
    iget-object v0, p0, Lnicoid/network238/okhttp3/MultipartReader;->crlfDashDashBoundary:Lnicoid/network238/okio/ByteString;

    invoke-virtual {v0}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v0

    int-to-long v2, v0

    invoke-interface {v6, v2, v3}, Lnicoid/network238/okio/BufferedSource;->skip(J)V

    :goto_1
    const/4 v0, 0x0

    .line 119
    :goto_2
    iget-object v2, p0, Lnicoid/network238/okhttp3/MultipartReader;->source:Lnicoid/network238/okio/BufferedSource;

    sget-object v3, Lnicoid/network238/okhttp3/MultipartReader;->afterBoundaryOptions:Lnicoid/network238/okio/Options;

    invoke-interface {v2, v3}, Lnicoid/network238/okio/BufferedSource;->select(Lnicoid/network238/okio/Options;)I

    move-result v2

    const-string v3, "unexpected characters after boundary"

    const/4 v4, 0x1

    packed-switch v2, :pswitch_data_0

    goto :goto_2

    :pswitch_0
    move v0, v4

    goto :goto_2

    :pswitch_1
    if-nez v0, :cond_4

    .line 129
    iget v0, p0, Lnicoid/network238/okhttp3/MultipartReader;->partCount:I

    if-eqz v0, :cond_3

    .line 130
    iput-boolean v4, p0, Lnicoid/network238/okhttp3/MultipartReader;->noMoreParts:Z

    return-object v1

    .line 129
    :cond_3
    new-instance v0, Ljava/net/ProtocolException;

    const-string v1, "expected at least 1 part"

    invoke-direct {v0, v1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 128
    :cond_4
    new-instance v0, Ljava/net/ProtocolException;

    invoke-direct {v0, v3}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 122
    :pswitch_2
    iget v0, p0, Lnicoid/network238/okhttp3/MultipartReader;->partCount:I

    add-int/2addr v0, v4

    iput v0, p0, Lnicoid/network238/okhttp3/MultipartReader;->partCount:I

    .line 147
    new-instance v0, Lnicoid/network238/okhttp3/internal/http1/HeadersReader;

    iget-object v1, p0, Lnicoid/network238/okhttp3/MultipartReader;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-direct {v0, v1}, Lnicoid/network238/okhttp3/internal/http1/HeadersReader;-><init>(Lnicoid/network238/okio/BufferedSource;)V

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http1/HeadersReader;->readHeaders()Lnicoid/network238/okhttp3/Headers;

    move-result-object v0

    .line 148
    new-instance v1, Lnicoid/network238/okhttp3/MultipartReader$PartSource;

    invoke-direct {v1, p0}, Lnicoid/network238/okhttp3/MultipartReader$PartSource;-><init>(Lnicoid/network238/okhttp3/MultipartReader;)V

    .line 149
    iput-object v1, p0, Lnicoid/network238/okhttp3/MultipartReader;->currentPart:Lnicoid/network238/okhttp3/MultipartReader$PartSource;

    .line 150
    new-instance v2, Lnicoid/network238/okhttp3/MultipartReader$Part;

    invoke-static {v1}, Lnicoid/network238/okio/Okio;->buffer(Lnicoid/network238/okio/Source;)Lnicoid/network238/okio/BufferedSource;

    move-result-object v1

    invoke-direct {v2, v0, v1}, Lnicoid/network238/okhttp3/MultipartReader$Part;-><init>(Lnicoid/network238/okhttp3/Headers;Lnicoid/network238/okio/BufferedSource;)V

    return-object v2

    .line 141
    :pswitch_3
    new-instance v0, Ljava/net/ProtocolException;

    invoke-direct {v0, v3}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 98
    :cond_5
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "closed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method
