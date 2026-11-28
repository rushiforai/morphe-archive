.class public final Lnicoid/network238/okhttp3/MultipartBody;
.super Lnicoid/network238/okhttp3/RequestBody;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/MultipartBody$Builder;,
        Lnicoid/network238/okhttp3/MultipartBody$Companion;,
        Lnicoid/network238/okhttp3/MultipartBody$NoCloseSink;,
        Lnicoid/network238/okhttp3/MultipartBody$Part;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000N\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0004\n\u0002\u0010\u000b\n\u0002\u0008\u0005\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0007\u0018\u0000 &2\u00020\u0001:\u0004$%&\'B\'\u0008\u0000\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u000c\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u0007\u00a2\u0006\u0004\u0008\t\u0010\nJ\u000e\u0010\u0016\u001a\u00020\u00082\u0006\u0010\u0017\u001a\u00020\u0014J\u0008\u0010\u0018\u001a\u00020\u0019H\u0016J\u0008\u0010\r\u001a\u00020\u0005H\u0016J\r\u0010\u0004\u001a\u00020\u0005H\u0007\u00a2\u0006\u0002\u0008\u001aJ\r\u0010\u0010\u001a\u00020\u0011H\u0007\u00a2\u0006\u0002\u0008\u001bJ\r\u0010\u0013\u001a\u00020\u0014H\u0007\u00a2\u0006\u0002\u0008\u001cJ\u0013\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u0007H\u0007\u00a2\u0006\u0002\u0008\u001dJ\u0008\u0010\u000e\u001a\u00020\u000fH\u0016J\u0010\u0010\u001e\u001a\u00020\u001f2\u0006\u0010 \u001a\u00020!H\u0016J\u001a\u0010\"\u001a\u00020\u000f2\u0008\u0010 \u001a\u0004\u0018\u00010!2\u0006\u0010#\u001a\u00020\u0019H\u0002R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0013\u0010\u0004\u001a\u00020\u00058\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0004\u0010\u000bR\u0019\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u00078\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0006\u0010\u000cR\u000e\u0010\r\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000e\u001a\u00020\u000fX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0011\u0010\u0010\u001a\u00020\u00118G\u00a2\u0006\u0006\u001a\u0004\u0008\u0010\u0010\u0012R\u0011\u0010\u0013\u001a\u00020\u00148G\u00a2\u0006\u0006\u001a\u0004\u0008\u0013\u0010\u0015\u00a8\u0006("
    }
    d2 = {
        "Lnicoid/network238/okhttp3/MultipartBody;",
        "Lnicoid/network238/okhttp3/RequestBody;",
        "boundaryByteString",
        "Lnicoid/network238/okio/ByteString;",
        "type",
        "Lnicoid/network238/okhttp3/MediaType;",
        "parts",
        "",
        "Lnicoid/network238/okhttp3/MultipartBody$Part;",
        "<init>",
        "(Lnicoid/network238/okio/ByteString;Lnicoid/network238/okhttp3/MediaType;Ljava/util/List;)V",
        "()Lnicoid/network238/okhttp3/MediaType;",
        "()Ljava/util/List;",
        "contentType",
        "contentLength",
        "",
        "boundary",
        "",
        "()Ljava/lang/String;",
        "size",
        "",
        "()I",
        "part",
        "index",
        "isOneShot",
        "",
        "-deprecated_type",
        "-deprecated_boundary",
        "-deprecated_size",
        "-deprecated_parts",
        "writeTo",
        "",
        "sink",
        "Lnicoid/network238/okio/BufferedSink;",
        "writeOrCountBytes",
        "countBytes",
        "Part",
        "Builder",
        "Companion",
        "NoCloseSink",
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
.field public static final ALTERNATIVE:Lnicoid/network238/okhttp3/MediaType;

.field private static final COLONSPACE:[B

.field private static final CRLF:[B

.field public static final Companion:Lnicoid/network238/okhttp3/MultipartBody$Companion;

.field private static final DASHDASH:[B

.field public static final DIGEST:Lnicoid/network238/okhttp3/MediaType;

.field public static final FORM:Lnicoid/network238/okhttp3/MediaType;

.field public static final MIXED:Lnicoid/network238/okhttp3/MediaType;

.field public static final PARALLEL:Lnicoid/network238/okhttp3/MediaType;


# instance fields
.field private final boundaryByteString:Lnicoid/network238/okio/ByteString;

.field private contentLength:J

.field private final contentType:Lnicoid/network238/okhttp3/MediaType;

.field private final parts:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/MultipartBody$Part;",
            ">;"
        }
    .end annotation
.end field

.field private final type:Lnicoid/network238/okhttp3/MediaType;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnicoid/network238/okhttp3/MultipartBody$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okhttp3/MultipartBody$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okhttp3/MultipartBody;->Companion:Lnicoid/network238/okhttp3/MultipartBody$Companion;

    .line 323
    sget-object v0, Lnicoid/network238/okhttp3/MediaType;->Companion:Lnicoid/network238/okhttp3/MediaType$Companion;

    const-string v1, "multipart/mixed"

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/MediaType$Companion;->get(Ljava/lang/String;)Lnicoid/network238/okhttp3/MediaType;

    move-result-object v1

    sput-object v1, Lnicoid/network238/okhttp3/MultipartBody;->MIXED:Lnicoid/network238/okhttp3/MediaType;

    .line 331
    const-string v1, "multipart/alternative"

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/MediaType$Companion;->get(Ljava/lang/String;)Lnicoid/network238/okhttp3/MediaType;

    move-result-object v1

    sput-object v1, Lnicoid/network238/okhttp3/MultipartBody;->ALTERNATIVE:Lnicoid/network238/okhttp3/MediaType;

    .line 339
    const-string v1, "multipart/digest"

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/MediaType$Companion;->get(Ljava/lang/String;)Lnicoid/network238/okhttp3/MediaType;

    move-result-object v1

    sput-object v1, Lnicoid/network238/okhttp3/MultipartBody;->DIGEST:Lnicoid/network238/okhttp3/MediaType;

    .line 346
    const-string v1, "multipart/parallel"

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/MediaType$Companion;->get(Ljava/lang/String;)Lnicoid/network238/okhttp3/MediaType;

    move-result-object v1

    sput-object v1, Lnicoid/network238/okhttp3/MultipartBody;->PARALLEL:Lnicoid/network238/okhttp3/MediaType;

    .line 354
    const-string v1, "multipart/form-data"

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/MediaType$Companion;->get(Ljava/lang/String;)Lnicoid/network238/okhttp3/MediaType;

    move-result-object v0

    sput-object v0, Lnicoid/network238/okhttp3/MultipartBody;->FORM:Lnicoid/network238/okhttp3/MediaType;

    .line 356
    const/4 v0, 0x2

    new-array v1, v0, [B

    fill-array-data v1, :array_0

    sput-object v1, Lnicoid/network238/okhttp3/MultipartBody;->COLONSPACE:[B

    .line 357
    new-array v1, v0, [B

    fill-array-data v1, :array_1

    sput-object v1, Lnicoid/network238/okhttp3/MultipartBody;->CRLF:[B

    .line 358
    new-array v0, v0, [B

    fill-array-data v0, :array_2

    sput-object v0, Lnicoid/network238/okhttp3/MultipartBody;->DASHDASH:[B

    return-void

    nop

    :array_0
    .array-data 1
        0x3at
        0x20t
    .end array-data

    nop

    :array_1
    .array-data 1
        0xdt
        0xat
    .end array-data

    nop

    :array_2
    .array-data 1
        0x2dt
        0x2dt
    .end array-data
.end method

.method public constructor <init>(Lnicoid/network238/okio/ByteString;Lnicoid/network238/okhttp3/MediaType;Ljava/util/List;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/okio/ByteString;",
            "Lnicoid/network238/okhttp3/MediaType;",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/MultipartBody$Part;",
            ">;)V"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 35
    invoke-direct {p0}, Lnicoid/network238/okhttp3/RequestBody;-><init>()V

    .line 37
    iput-object p1, p0, Lnicoid/network238/okhttp3/MultipartBody;->boundaryByteString:Lnicoid/network238/okio/ByteString;

    .line 38
    iput-object p2, p0, Lnicoid/network238/okhttp3/MultipartBody;->type:Lnicoid/network238/okhttp3/MediaType;

    .line 39
    iput-object p3, p0, Lnicoid/network238/okhttp3/MultipartBody;->parts:Ljava/util/List;

    .line 41
    sget-object p1, Lnicoid/network238/okhttp3/MediaType;->Companion:Lnicoid/network238/okhttp3/MediaType$Companion;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string p3, "; boundary="

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/MultipartBody;->boundary()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lnicoid/network238/okhttp3/MediaType$Companion;->get(Ljava/lang/String;)Lnicoid/network238/okhttp3/MediaType;

    move-result-object p1

    iput-object p1, p0, Lnicoid/network238/okhttp3/MultipartBody;->contentType:Lnicoid/network238/okhttp3/MediaType;

    .line 42
    const-wide/16 p1, -0x1

    iput-wide p1, p0, Lnicoid/network238/okhttp3/MultipartBody;->contentLength:J

    return-void
.end method

.method private final writeOrCountBytes(Lnicoid/network238/okio/BufferedSink;Z)J
    .registers 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    if-eqz p2, :cond_0

    .line 123
    new-instance p1, Lnicoid/network238/okio/Buffer;

    invoke-direct {p1}, Lnicoid/network238/okio/Buffer;-><init>()V

    move-object v1, p1

    goto :goto_0

    .line 0
    :cond_0
    move-object v1, v0

    .line 123
    :goto_0
    nop

    .line 127
    iget-object v2, p0, Lnicoid/network238/okhttp3/MultipartBody;->parts:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x0

    const-wide/16 v4, 0x0

    move v6, v3

    :goto_1
    if-ge v6, v2, :cond_5

    .line 128
    iget-object v7, p0, Lnicoid/network238/okhttp3/MultipartBody;->parts:Ljava/util/List;

    invoke-interface {v7, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lnicoid/network238/okhttp3/MultipartBody$Part;

    .line 129
    invoke-virtual {v7}, Lnicoid/network238/okhttp3/MultipartBody$Part;->headers()Lnicoid/network238/okhttp3/Headers;

    move-result-object v8

    .line 130
    invoke-virtual {v7}, Lnicoid/network238/okhttp3/MultipartBody$Part;->body()Lnicoid/network238/okhttp3/RequestBody;

    move-result-object v7

    .line 132
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v9, Lnicoid/network238/okhttp3/MultipartBody;->DASHDASH:[B

    invoke-interface {p1, v9}, Lnicoid/network238/okio/BufferedSink;->write([B)Lnicoid/network238/okio/BufferedSink;

    .line 133
    iget-object v9, p0, Lnicoid/network238/okhttp3/MultipartBody;->boundaryByteString:Lnicoid/network238/okio/ByteString;

    invoke-interface {p1, v9}, Lnicoid/network238/okio/BufferedSink;->write(Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/BufferedSink;

    .line 134
    sget-object v9, Lnicoid/network238/okhttp3/MultipartBody;->CRLF:[B

    invoke-interface {p1, v9}, Lnicoid/network238/okio/BufferedSink;->write([B)Lnicoid/network238/okio/BufferedSink;

    if-eqz v8, :cond_1

    .line 137
    invoke-virtual {v8}, Lnicoid/network238/okhttp3/Headers;->size()I

    move-result v9

    move v10, v3

    :goto_2
    if-ge v10, v9, :cond_1

    .line 139
    invoke-virtual {v8, v10}, Lnicoid/network238/okhttp3/Headers;->name(I)Ljava/lang/String;

    move-result-object v11

    invoke-interface {p1, v11}, Lnicoid/network238/okio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/BufferedSink;

    move-result-object v11

    .line 140
    sget-object v12, Lnicoid/network238/okhttp3/MultipartBody;->COLONSPACE:[B

    invoke-interface {v11, v12}, Lnicoid/network238/okio/BufferedSink;->write([B)Lnicoid/network238/okio/BufferedSink;

    move-result-object v11

    .line 141
    invoke-virtual {v8, v10}, Lnicoid/network238/okhttp3/Headers;->value(I)Ljava/lang/String;

    move-result-object v12

    invoke-interface {v11, v12}, Lnicoid/network238/okio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/BufferedSink;

    move-result-object v11

    .line 142
    sget-object v12, Lnicoid/network238/okhttp3/MultipartBody;->CRLF:[B

    invoke-interface {v11, v12}, Lnicoid/network238/okio/BufferedSink;->write([B)Lnicoid/network238/okio/BufferedSink;

    add-int/lit8 v10, v10, 0x1

    goto :goto_2

    .line 146
    :cond_1
    invoke-virtual {v7}, Lnicoid/network238/okhttp3/RequestBody;->contentType()Lnicoid/network238/okhttp3/MediaType;

    move-result-object v8

    if-eqz v8, :cond_2

    .line 149
    const-string v9, "Content-Type: "

    invoke-interface {p1, v9}, Lnicoid/network238/okio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/BufferedSink;

    move-result-object v9

    .line 150
    invoke-virtual {v8}, Lnicoid/network238/okhttp3/MediaType;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v9, v8}, Lnicoid/network238/okio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/BufferedSink;

    move-result-object v8

    .line 151
    sget-object v9, Lnicoid/network238/okhttp3/MultipartBody;->CRLF:[B

    invoke-interface {v8, v9}, Lnicoid/network238/okio/BufferedSink;->write([B)Lnicoid/network238/okio/BufferedSink;

    .line 155
    :cond_2
    invoke-virtual {v7}, Lnicoid/network238/okhttp3/RequestBody;->contentLength()J

    move-result-wide v8

    const-wide/16 v10, -0x1

    cmp-long v12, v8, v10

    if-nez v12, :cond_3

    if-eqz p2, :cond_3

    .line 157
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1}, Lnicoid/network238/okio/Buffer;->clear()V

    return-wide v10

    .line 161
    :cond_3
    sget-object v10, Lnicoid/network238/okhttp3/MultipartBody;->CRLF:[B

    invoke-interface {p1, v10}, Lnicoid/network238/okio/BufferedSink;->write([B)Lnicoid/network238/okio/BufferedSink;

    if-eqz p2, :cond_4

    add-long/2addr v4, v8

    goto :goto_3

    .line 166
    :cond_4
    new-instance v8, Lnicoid/network238/okhttp3/MultipartBody$NoCloseSink;

    invoke-direct {v8, p1}, Lnicoid/network238/okhttp3/MultipartBody$NoCloseSink;-><init>(Lnicoid/network238/okio/Sink;)V

    invoke-static {v8}, Lnicoid/network238/okio/Okio;->buffer(Lnicoid/network238/okio/Sink;)Lnicoid/network238/okio/BufferedSink;

    move-result-object v8

    :try_start_0
    invoke-virtual {v7, v8}, Lnicoid/network238/okhttp3/RequestBody;->writeTo(Lnicoid/network238/okio/BufferedSink;)V

    sget-object v7, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-static {v8, v0}, Lnicoid/network238/kotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 169
    :goto_3
    invoke-interface {p1, v10}, Lnicoid/network238/okio/BufferedSink;->write([B)Lnicoid/network238/okio/BufferedSink;

    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_1

    :catchall_0
    move-exception p1

    .line 166
    :try_start_1
    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :catchall_1
    move-exception p2

    invoke-static {v8, p1}, Lnicoid/network238/kotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw p2

    .line 172
    :cond_5
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lnicoid/network238/okhttp3/MultipartBody;->DASHDASH:[B

    invoke-interface {p1, v0}, Lnicoid/network238/okio/BufferedSink;->write([B)Lnicoid/network238/okio/BufferedSink;

    .line 173
    iget-object v2, p0, Lnicoid/network238/okhttp3/MultipartBody;->boundaryByteString:Lnicoid/network238/okio/ByteString;

    invoke-interface {p1, v2}, Lnicoid/network238/okio/BufferedSink;->write(Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/BufferedSink;

    .line 174
    invoke-interface {p1, v0}, Lnicoid/network238/okio/BufferedSink;->write([B)Lnicoid/network238/okio/BufferedSink;

    .line 175
    sget-object v0, Lnicoid/network238/okhttp3/MultipartBody;->CRLF:[B

    invoke-interface {p1, v0}, Lnicoid/network238/okio/BufferedSink;->write([B)Lnicoid/network238/okio/BufferedSink;

    if-eqz p2, :cond_6

    .line 178
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide p1

    add-long/2addr v4, p1

    .line 179
    invoke-virtual {v1}, Lnicoid/network238/okio/Buffer;->clear()V

    :cond_6
    return-wide v4
.end method


# virtual methods
.method public final -deprecated_boundary()Ljava/lang/String;
    .registers 2

    .line 74
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/MultipartBody;->boundary()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final -deprecated_parts()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/MultipartBody$Part;",
            ">;"
        }
    .end annotation

    .line 90
    iget-object v0, p0, Lnicoid/network238/okhttp3/MultipartBody;->parts:Ljava/util/List;

    return-object v0
.end method

.method public final -deprecated_size()I
    .registers 2

    .line 82
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/MultipartBody;->size()I

    move-result v0

    return v0
.end method

.method public final -deprecated_type()Lnicoid/network238/okhttp3/MediaType;
    .registers 2

    .line 66
    iget-object v0, p0, Lnicoid/network238/okhttp3/MultipartBody;->type:Lnicoid/network238/okhttp3/MediaType;

    return-object v0
.end method

.method public final boundary()Ljava/lang/String;
    .registers 2

    .line 46
    iget-object v0, p0, Lnicoid/network238/okhttp3/MultipartBody;->boundaryByteString:Lnicoid/network238/okio/ByteString;

    invoke-virtual {v0}, Lnicoid/network238/okio/ByteString;->utf8()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public contentLength()J
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 94
    iget-wide v0, p0, Lnicoid/network238/okhttp3/MultipartBody;->contentLength:J

    const-wide/16 v2, -0x1

    cmp-long v2, v0, v2

    if-nez v2, :cond_0

    .line 96
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lnicoid/network238/okhttp3/MultipartBody;->writeOrCountBytes(Lnicoid/network238/okio/BufferedSink;Z)J

    move-result-wide v0

    .line 97
    iput-wide v0, p0, Lnicoid/network238/okhttp3/MultipartBody;->contentLength:J

    :cond_0
    return-wide v0
.end method

.method public contentType()Lnicoid/network238/okhttp3/MediaType;
    .registers 2

    .line 58
    iget-object v0, p0, Lnicoid/network238/okhttp3/MultipartBody;->contentType:Lnicoid/network238/okhttp3/MediaType;

    return-object v0
.end method

.method public isOneShot()Z
    .registers 3

    .line 55
    iget-object v0, p0, Lnicoid/network238/okhttp3/MultipartBody;->parts:Ljava/util/List;

    .line 391
    instance-of v1, v0, Ljava/util/Collection;

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 392
    :cond_0
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnicoid/network238/okhttp3/MultipartBody$Part;

    .line 55
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/MultipartBody$Part;->body()Lnicoid/network238/okhttp3/RequestBody;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/RequestBody;->isOneShot()Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v0, 0x1

    return v0

    :cond_2
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method public final part(I)Lnicoid/network238/okhttp3/MultipartBody$Part;
    .registers 3

    .line 53
    iget-object v0, p0, Lnicoid/network238/okhttp3/MultipartBody;->parts:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lnicoid/network238/okhttp3/MultipartBody$Part;

    return-object p1
.end method

.method public final parts()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/MultipartBody$Part;",
            ">;"
        }
    .end annotation

    .line 39
    iget-object v0, p0, Lnicoid/network238/okhttp3/MultipartBody;->parts:Ljava/util/List;

    return-object v0
.end method

.method public final size()I
    .registers 2

    .line 51
    iget-object v0, p0, Lnicoid/network238/okhttp3/MultipartBody;->parts:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public final type()Lnicoid/network238/okhttp3/MediaType;
    .registers 2

    .line 38
    iget-object v0, p0, Lnicoid/network238/okhttp3/MultipartBody;->type:Lnicoid/network238/okhttp3/MediaType;

    return-object v0
.end method

.method public writeTo(Lnicoid/network238/okio/BufferedSink;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 104
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lnicoid/network238/okhttp3/MultipartBody;->writeOrCountBytes(Lnicoid/network238/okio/BufferedSink;Z)J

    return-void
.end method
