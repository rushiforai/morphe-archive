.class public abstract Lnicoid/network238/okhttp3/ResponseBody;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/ResponseBody$BomAwareReader;,
        Lnicoid/network238/okhttp3/ResponseBody$Companion;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000`\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0012\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003\u0008&\u0018\u0000 \"2\u00020\u0001:\u0002!\"B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\n\u0010\u0006\u001a\u0004\u0018\u00010\u0007H&J\u0008\u0010\u0008\u001a\u00020\tH&J\u0006\u0010\n\u001a\u00020\u000bJ\u0008\u0010\u000c\u001a\u00020\rH&J\u0006\u0010\u000e\u001a\u00020\u000fJ\u0006\u0010\u0010\u001a\u00020\u0011JD\u0010\u0012\u001a\u0002H\u0013\"\u0008\u0008\u0000\u0010\u0013*\u00020\u0014*\u00020\u00002\u0012\u0010\u0015\u001a\u000e\u0012\u0004\u0012\u00020\r\u0012\u0004\u0012\u0002H\u00130\u00162\u0012\u0010\u0017\u001a\u000e\u0012\u0004\u0012\u0002H\u0013\u0012\u0004\u0012\u00020\u00180\u0016H\u0082\u0008\u00a2\u0006\u0002\u0010\u0019J\u0006\u0010\u001a\u001a\u00020\u0005J\u0006\u0010\u001b\u001a\u00020\u001cJ\u0008\u0010\u001d\u001a\u00020\u001eH\u0002J\u0008\u0010\u001f\u001a\u00020 H\u0016R\u0010\u0010\u0004\u001a\u0004\u0018\u00010\u0005X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006#"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/ResponseBody;",
        "Ljava/io/Closeable;",
        "<init>",
        "()V",
        "reader",
        "Ljava/io/Reader;",
        "contentType",
        "Lnicoid/network238/okhttp3/MediaType;",
        "contentLength",
        "",
        "byteStream",
        "Ljava/io/InputStream;",
        "source",
        "Lnicoid/network238/okio/BufferedSource;",
        "bytes",
        "",
        "byteString",
        "Lnicoid/network238/okio/ByteString;",
        "consumeSource",
        "T",
        "",
        "consumer",
        "Lnicoid/network238/kotlin/Function1;",
        "sizeMapper",
        "",
        "(Lnicoid/network238/okhttp3/ResponseBody;Lnicoid/network238/kotlin/jvm/functions/Function1;Lnicoid/network238/kotlin/jvm/functions/Function1;)Ljava/lang/Object;",
        "charStream",
        "string",
        "",
        "charset",
        "Ljava/nio/charset/Charset;",
        "close",
        "",
        "BomAwareReader",
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
.field public static final Companion:Lnicoid/network238/okhttp3/ResponseBody$Companion;

.field public static final EMPTY:Lnicoid/network238/okhttp3/ResponseBody;


# instance fields
.field private reader:Ljava/io/Reader;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lnicoid/network238/okhttp3/ResponseBody$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okhttp3/ResponseBody$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okhttp3/ResponseBody;->Companion:Lnicoid/network238/okhttp3/ResponseBody$Companion;

    .line 232
    sget-object v2, Lnicoid/network238/okio/ByteString;->EMPTY:Lnicoid/network238/okio/ByteString;

    const/4 v3, 0x1

    invoke-static {v0, v2, v1, v3, v1}, Lnicoid/network238/okhttp3/ResponseBody$Companion;->create$default(Lnicoid/network238/okhttp3/ResponseBody$Companion;Lnicoid/network238/okio/ByteString;Lnicoid/network238/okhttp3/MediaType;ILjava/lang/Object;)Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object v0

    sput-object v0, Lnicoid/network238/okhttp3/ResponseBody;->EMPTY:Lnicoid/network238/okhttp3/ResponseBody;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 101
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final charset()Ljava/nio/charset/Charset;
    .registers 2

    .line 193
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/ResponseBody;->contentType()Lnicoid/network238/okhttp3/MediaType;

    move-result-object v0

    invoke-static {v0}, Lnicoid/network238/okhttp3/internal/Internal;->charsetOrUtf8(Lnicoid/network238/okhttp3/MediaType;)Ljava/nio/charset/Charset;

    move-result-object v0

    return-object v0
.end method

.method private final consumeSource(Lnicoid/network238/okhttp3/ResponseBody;Lnicoid/network238/kotlin/jvm/functions/Function1;Lnicoid/network238/kotlin/jvm/functions/Function1;)Ljava/lang/Object;
    .registers 12
    .param p1, "$this$consumeSource"    # Lnicoid/network238/okhttp3/ResponseBody;
    .param p2, "consumer"    # Lnicoid/network238/kotlin/jvm/functions/Function1;
    .param p3, "sizeMapper"    # Lnicoid/network238/kotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lnicoid/network238/okhttp3/ResponseBody;",
            "Lnicoid/network238/kotlin/jvm/functions/Function1;",
            "Lnicoid/network238/kotlin/jvm/functions/Function1;",
            ")TT;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 141
    .local v0, "$i$f$consumeSource":I
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/ResponseBody;->contentLength()J

    move-result-wide v1

    .line 142
    .local v1, "contentLength":J
    const-wide/32 v3, 0x7fffffff

    cmp-long v3, v1, v3

    if-gtz v3, :cond_4

    .line 146
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/ResponseBody;->source()Lnicoid/network238/okio/BufferedSource;

    move-result-object v3

    check-cast v3, Ljava/io/Closeable;

    .line 412
    .local v3, "$this$use$iv":Ljava/io/Closeable;
    const/4 v4, 0x0

    .line 413
    .local v4, "$i$f$use":I
    const/4 v5, 0x0

    .line 415
    .local v5, "thrown$iv":Ljava/lang/Throwable;
    nop

    .line 416
    :try_start_0
    invoke-interface {p2, v3}, Lnicoid/network238/kotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 421
    nop

    .line 422
    if-eqz v3, :cond_0

    :try_start_1
    invoke-interface {v3}, Ljava/io/Closeable;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 423
    :catchall_0
    move-exception v7

    .line 424
    .local v7, "t$iv":Ljava/lang/Throwable;
    nop

    .line 425
    move-object v5, v7

    .end local v7    # "t$iv":Ljava/lang/Throwable;
    :cond_0
    :goto_0
    nop

    .line 430
    goto :goto_2

    .line 417
    :catchall_1
    move-exception v6

    .line 418
    .local v6, "t$iv":Ljava/lang/Throwable;
    move-object v5, v6

    .line 419
    nop

    .line 421
    .end local v6    # "t$iv":Ljava/lang/Throwable;
    nop

    .line 422
    if-eqz v3, :cond_1

    :try_start_2
    invoke-interface {v3}, Ljava/io/Closeable;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    goto :goto_1

    .line 423
    :catchall_2
    move-exception v6

    .line 424
    .restart local v6    # "t$iv":Ljava/lang/Throwable;
    nop

    .line 412
    invoke-static {v5, v6}, Lnicoid/network238/kotlin/ExceptionsKt;->addSuppressed(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    .end local v6    # "t$iv":Ljava/lang/Throwable;
    :cond_1
    :goto_1
    nop

    .line 430
    const/4 v6, 0x0

    .line 415
    :goto_2
    nop

    .line 432
    .local v6, "result$iv":Ljava/lang/Object;
    if-nez v5, :cond_3

    .line 434
    nop

    .line 146
    .end local v3    # "$this$use$iv":Ljava/io/Closeable;
    .end local v4    # "$i$f$use":I
    .end local v5    # "thrown$iv":Ljava/lang/Throwable;
    .end local v6    # "result$iv":Ljava/lang/Object;
    nop

    .line 147
    .local v6, "bytes":Ljava/lang/Object;
    invoke-interface {p3, v6}, Lnicoid/network238/kotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Number;

    invoke-virtual {v3}, Ljava/lang/Number;->intValue()I

    move-result v3

    .line 148
    .local v3, "size":I
    const-wide/16 v4, -0x1

    cmp-long v4, v1, v4

    if-eqz v4, :cond_2

    int-to-long v4, v3

    cmp-long v4, v1, v4

    if-eqz v4, :cond_2

    .line 149
    new-instance v4, Ljava/io/IOException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Content-Length ("

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, ") and stream length ("

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, ") disagree"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 151
    :cond_2
    return-object v6

    .line 432
    .local v3, "$this$use$iv":Ljava/io/Closeable;
    .restart local v4    # "$i$f$use":I
    .restart local v5    # "thrown$iv":Ljava/lang/Throwable;
    .local v6, "result$iv":Ljava/lang/Object;
    :cond_3
    throw v5

    .line 143
    .end local v3    # "$this$use$iv":Ljava/io/Closeable;
    .end local v4    # "$i$f$use":I
    .end local v5    # "thrown$iv":Ljava/lang/Throwable;
    .end local v6    # "result$iv":Ljava/lang/Object;
    :cond_4
    new-instance v3, Ljava/io/IOException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Cannot buffer entire body for content length: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method public static final create(Ljava/lang/String;Lnicoid/network238/okhttp3/MediaType;)Lnicoid/network238/okhttp3/ResponseBody;
    .registers 3

    sget-object v0, Lnicoid/network238/okhttp3/ResponseBody;->Companion:Lnicoid/network238/okhttp3/ResponseBody$Companion;

    invoke-virtual {v0, p0, p1}, Lnicoid/network238/okhttp3/ResponseBody$Companion;->create(Ljava/lang/String;Lnicoid/network238/okhttp3/MediaType;)Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object p0

    return-object p0
.end method

.method public static final create(Lnicoid/network238/okhttp3/MediaType;JLnicoid/network238/okio/BufferedSource;)Lnicoid/network238/okhttp3/ResponseBody;
    .registers 5

    sget-object v0, Lnicoid/network238/okhttp3/ResponseBody;->Companion:Lnicoid/network238/okhttp3/ResponseBody$Companion;

    invoke-virtual {v0, p0, p1, p2, p3}, Lnicoid/network238/okhttp3/ResponseBody$Companion;->create(Lnicoid/network238/okhttp3/MediaType;JLnicoid/network238/okio/BufferedSource;)Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object p0

    return-object p0
.end method

.method public static final create(Lnicoid/network238/okhttp3/MediaType;Ljava/lang/String;)Lnicoid/network238/okhttp3/ResponseBody;
    .registers 3

    sget-object v0, Lnicoid/network238/okhttp3/ResponseBody;->Companion:Lnicoid/network238/okhttp3/ResponseBody$Companion;

    invoke-virtual {v0, p0, p1}, Lnicoid/network238/okhttp3/ResponseBody$Companion;->create(Lnicoid/network238/okhttp3/MediaType;Ljava/lang/String;)Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object p0

    return-object p0
.end method

.method public static final create(Lnicoid/network238/okhttp3/MediaType;Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okhttp3/ResponseBody;
    .registers 3

    sget-object v0, Lnicoid/network238/okhttp3/ResponseBody;->Companion:Lnicoid/network238/okhttp3/ResponseBody$Companion;

    invoke-virtual {v0, p0, p1}, Lnicoid/network238/okhttp3/ResponseBody$Companion;->create(Lnicoid/network238/okhttp3/MediaType;Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object p0

    return-object p0
.end method

.method public static final create(Lnicoid/network238/okhttp3/MediaType;[B)Lnicoid/network238/okhttp3/ResponseBody;
    .registers 3

    sget-object v0, Lnicoid/network238/okhttp3/ResponseBody;->Companion:Lnicoid/network238/okhttp3/ResponseBody$Companion;

    invoke-virtual {v0, p0, p1}, Lnicoid/network238/okhttp3/ResponseBody$Companion;->create(Lnicoid/network238/okhttp3/MediaType;[B)Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object p0

    return-object p0
.end method

.method public static final create(Lnicoid/network238/okio/BufferedSource;Lnicoid/network238/okhttp3/MediaType;J)Lnicoid/network238/okhttp3/ResponseBody;
    .registers 5

    sget-object v0, Lnicoid/network238/okhttp3/ResponseBody;->Companion:Lnicoid/network238/okhttp3/ResponseBody$Companion;

    invoke-virtual {v0, p0, p1, p2, p3}, Lnicoid/network238/okhttp3/ResponseBody$Companion;->create(Lnicoid/network238/okio/BufferedSource;Lnicoid/network238/okhttp3/MediaType;J)Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object p0

    return-object p0
.end method

.method public static final create(Lnicoid/network238/okio/ByteString;Lnicoid/network238/okhttp3/MediaType;)Lnicoid/network238/okhttp3/ResponseBody;
    .registers 3

    sget-object v0, Lnicoid/network238/okhttp3/ResponseBody;->Companion:Lnicoid/network238/okhttp3/ResponseBody$Companion;

    invoke-virtual {v0, p0, p1}, Lnicoid/network238/okhttp3/ResponseBody$Companion;->create(Lnicoid/network238/okio/ByteString;Lnicoid/network238/okhttp3/MediaType;)Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object p0

    return-object p0
.end method

.method public static final create([BLnicoid/network238/okhttp3/MediaType;)Lnicoid/network238/okhttp3/ResponseBody;
    .registers 3

    sget-object v0, Lnicoid/network238/okhttp3/ResponseBody;->Companion:Lnicoid/network238/okhttp3/ResponseBody$Companion;

    invoke-virtual {v0, p0, p1}, Lnicoid/network238/okhttp3/ResponseBody$Companion;->create([BLnicoid/network238/okhttp3/MediaType;)Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final byteStream()Ljava/io/InputStream;
    .registers 2

    .line 113
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/ResponseBody;->source()Lnicoid/network238/okio/BufferedSource;

    move-result-object v0

    invoke-interface {v0}, Lnicoid/network238/okio/BufferedSource;->inputStream()Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public final byteString()Lnicoid/network238/okio/ByteString;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 378
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/ResponseBody;->contentLength()J

    move-result-wide v0

    const-wide/32 v2, 0x7fffffff

    cmp-long v2, v0, v2

    if-gtz v2, :cond_4

    .line 383
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/ResponseBody;->source()Lnicoid/network238/okio/BufferedSource;

    move-result-object v2

    .line 135
    const/4 v3, 0x0

    :try_start_0
    invoke-interface {v2}, Lnicoid/network238/okio/BufferedSource;->readByteString()Lnicoid/network238/okio/ByteString;

    move-result-object v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v2, :cond_1

    .line 394
    :try_start_1
    invoke-interface {v2}, Ljava/io/Closeable;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v3

    goto :goto_1

    :catchall_1
    move-exception v4

    if-eqz v2, :cond_0

    :try_start_2
    invoke-interface {v2}, Ljava/io/Closeable;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    goto :goto_0

    :catchall_2
    move-exception v2

    .line 384
    invoke-static {v4, v2}, Lnicoid/network238/kotlin/ExceptionsKt;->addSuppressed(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    :cond_0
    :goto_0
    move-object v7, v4

    move-object v4, v3

    move-object v3, v7

    :cond_1
    :goto_1
    if-nez v3, :cond_3

    .line 135
    invoke-virtual {v4}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v2

    const-wide/16 v5, -0x1

    cmp-long v3, v0, v5

    if-eqz v3, :cond_2

    int-to-long v5, v2

    cmp-long v3, v0, v5

    if-eqz v3, :cond_2

    .line 409
    new-instance v3, Ljava/io/IOException;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Content-Length ("

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ") and stream length ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ") disagree"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v3, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_2
    return-object v4

    .line 404
    :cond_3
    throw v3

    .line 380
    :cond_4
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Cannot buffer entire body for content length: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public final bytes()[B
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 344
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/ResponseBody;->contentLength()J

    move-result-wide v0

    const-wide/32 v2, 0x7fffffff

    cmp-long v2, v0, v2

    if-gtz v2, :cond_4

    .line 349
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/ResponseBody;->source()Lnicoid/network238/okio/BufferedSource;

    move-result-object v2

    .line 125
    const/4 v3, 0x0

    :try_start_0
    invoke-interface {v2}, Lnicoid/network238/okio/BufferedSource;->readByteArray()[B

    move-result-object v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v2, :cond_1

    .line 360
    :try_start_1
    invoke-interface {v2}, Ljava/io/Closeable;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v3

    goto :goto_1

    :catchall_1
    move-exception v4

    if-eqz v2, :cond_0

    :try_start_2
    invoke-interface {v2}, Ljava/io/Closeable;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    goto :goto_0

    :catchall_2
    move-exception v2

    .line 350
    invoke-static {v4, v2}, Lnicoid/network238/kotlin/ExceptionsKt;->addSuppressed(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    :cond_0
    :goto_0
    move-object v7, v4

    move-object v4, v3

    move-object v3, v7

    :cond_1
    :goto_1
    if-nez v3, :cond_3

    .line 125
    array-length v2, v4

    const-wide/16 v5, -0x1

    cmp-long v3, v0, v5

    if-eqz v3, :cond_2

    int-to-long v5, v2

    cmp-long v3, v0, v5

    if-eqz v3, :cond_2

    .line 375
    new-instance v3, Ljava/io/IOException;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Content-Length ("

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ") and stream length ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ") disagree"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v3, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_2
    return-object v4

    .line 370
    :cond_3
    throw v3

    .line 346
    :cond_4
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Cannot buffer entire body for content length: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public final charStream()Ljava/io/Reader;
    .registers 4

    .line 167
    iget-object v0, p0, Lnicoid/network238/okhttp3/ResponseBody;->reader:Ljava/io/Reader;

    if-nez v0, :cond_0

    new-instance v0, Lnicoid/network238/okhttp3/ResponseBody$BomAwareReader;

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/ResponseBody;->source()Lnicoid/network238/okio/BufferedSource;

    move-result-object v1

    invoke-direct {p0}, Lnicoid/network238/okhttp3/ResponseBody;->charset()Ljava/nio/charset/Charset;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lnicoid/network238/okhttp3/ResponseBody$BomAwareReader;-><init>(Lnicoid/network238/okio/BufferedSource;Ljava/nio/charset/Charset;)V

    .line 168
    iput-object v0, p0, Lnicoid/network238/okhttp3/ResponseBody;->reader:Ljava/io/Reader;

    :cond_0
    return-object v0
.end method

.method public close()V
    .registers 2

    .line 195
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/ResponseBody;->source()Lnicoid/network238/okio/BufferedSource;

    move-result-object v0

    invoke-static {v0}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->closeQuietly(Ljava/io/Closeable;)V

    return-void
.end method

.method public abstract contentLength()J
.end method

.method public abstract contentType()Lnicoid/network238/okhttp3/MediaType;
.end method

.method public abstract source()Lnicoid/network238/okio/BufferedSource;
.end method

.method public final string()Ljava/lang/String;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 189
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/ResponseBody;->source()Lnicoid/network238/okio/BufferedSource;

    move-result-object v0

    .line 190
    const/4 v1, 0x0

    :try_start_0
    invoke-direct {p0}, Lnicoid/network238/okhttp3/ResponseBody;->charset()Ljava/nio/charset/Charset;

    move-result-object v2

    invoke-static {v0, v2}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->readBomAsCharset(Lnicoid/network238/okio/BufferedSource;Ljava/nio/charset/Charset;)Ljava/nio/charset/Charset;

    move-result-object v2

    invoke-interface {v0, v2}, Lnicoid/network238/okio/BufferedSource;->readString(Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v0, :cond_1

    .line 445
    :try_start_1
    invoke-interface {v0}, Ljava/io/Closeable;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v1

    goto :goto_1

    :catchall_1
    move-exception v2

    if-eqz v0, :cond_0

    :try_start_2
    invoke-interface {v0}, Ljava/io/Closeable;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    goto :goto_0

    :catchall_2
    move-exception v0

    .line 435
    invoke-static {v2, v0}, Lnicoid/network238/kotlin/ExceptionsKt;->addSuppressed(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    :cond_0
    :goto_0
    move-object v3, v2

    move-object v2, v1

    move-object v1, v3

    :cond_1
    :goto_1
    if-nez v1, :cond_2

    return-object v2

    .line 455
    :cond_2
    throw v1
.end method
