.class public final Lnicoid/network238/okhttp3/RequestBody$Companion$toRequestBody$2;
.super Lnicoid/network238/okhttp3/RequestBody;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnicoid/network238/okhttp3/RequestBody$Companion;->create(Ljava/io/FileDescriptor;Lnicoid/network238/okhttp3/MediaType;)Lnicoid/network238/okhttp3/RequestBody;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000#\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\n\u0010\u0002\u001a\u0004\u0018\u00010\u0003H\u0016J\u0008\u0010\u0004\u001a\u00020\u0005H\u0016J\u0010\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\tH\u0016\u00a8\u0006\n"
    }
    d2 = {
        "nicoid/network238/okhttp3/RequestBody$Companion$toRequestBody$2",
        "Lnicoid/network238/okhttp3/RequestBody;",
        "contentType",
        "Lnicoid/network238/okhttp3/MediaType;",
        "isOneShot",
        "",
        "writeTo",
        "",
        "sink",
        "Lnicoid/network238/okio/BufferedSink;",
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
.field final synthetic $contentType:Lnicoid/network238/okhttp3/MediaType;

.field final synthetic $this_toRequestBody:Ljava/io/FileDescriptor;


# direct methods
.method constructor <init>(Lnicoid/network238/okhttp3/MediaType;Ljava/io/FileDescriptor;)V
    .registers 3

    iput-object p1, p0, Lnicoid/network238/okhttp3/RequestBody$Companion$toRequestBody$2;->$contentType:Lnicoid/network238/okhttp3/MediaType;

    iput-object p2, p0, Lnicoid/network238/okhttp3/RequestBody$Companion$toRequestBody$2;->$this_toRequestBody:Ljava/io/FileDescriptor;

    .line 147
    invoke-direct {p0}, Lnicoid/network238/okhttp3/RequestBody;-><init>()V

    return-void
.end method


# virtual methods
.method public contentType()Lnicoid/network238/okhttp3/MediaType;
    .registers 2

    .line 148
    iget-object v0, p0, Lnicoid/network238/okhttp3/RequestBody$Companion$toRequestBody$2;->$contentType:Lnicoid/network238/okhttp3/MediaType;

    return-object v0
.end method

.method public isOneShot()Z
    .registers 2

    const/4 v0, 0x1

    return v0
.end method

.method public writeTo(Lnicoid/network238/okio/BufferedSink;)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 153
    new-instance v0, Ljava/io/FileInputStream;

    iget-object v1, p0, Lnicoid/network238/okhttp3/RequestBody$Companion$toRequestBody$2;->$this_toRequestBody:Ljava/io/FileDescriptor;

    invoke-direct {v0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/FileDescriptor;)V

    .line 154
    :try_start_0
    invoke-interface {p1}, Lnicoid/network238/okio/BufferedSink;->getBuffer()Lnicoid/network238/okio/Buffer;

    move-result-object p1

    invoke-static {v0}, Lnicoid/network238/okio/Okio;->source(Ljava/io/InputStream;)Lnicoid/network238/okio/Source;

    move-result-object v1

    invoke-virtual {p1, v1}, Lnicoid/network238/okio/Buffer;->writeAll(Lnicoid/network238/okio/Source;)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 153
    const/4 p1, 0x0

    invoke-static {v0, p1}, Lnicoid/network238/kotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :catchall_1
    move-exception v1

    invoke-static {v0, p1}, Lnicoid/network238/kotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v1
.end method
