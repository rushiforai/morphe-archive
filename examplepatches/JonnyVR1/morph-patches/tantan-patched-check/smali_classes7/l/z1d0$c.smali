.class public final Ll/z1d0$c;
.super Ll/z1d0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/z1d0;->create(Ll/e7y;Ljava/io/File;)Ll/z1d0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/e7y;

.field public final synthetic b:Ljava/io/File;


# direct methods
.method public constructor <init>(Ll/e7y;Ljava/io/File;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/z1d0$c;->a:Ll/e7y;

    .line 2
    .line 3
    iput-object p2, p0, Ll/z1d0$c;->b:Ljava/io/File;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/z1d0;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public contentLength()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/z1d0$c;->b:Ljava/io/File;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/io/File;->length()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public contentType()Ll/e7y;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z1d0$c;->a:Ll/e7y;

    .line 2
    .line 3
    return-object p0
.end method

.method public writeTo(Lokio/BufferedSink;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/z1d0$c;->b:Ljava/io/File;

    .line 2
    .line 3
    invoke-static {p0}, Lokio/Okio;->source(Ljava/io/File;)Lokio/Source;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :try_start_0
    invoke-interface {p1, p0}, Lokio/BufferedSink;->writeAll(Lokio/Source;)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-interface {p0}, Lokio/Source;->close()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void

    .line 16
    :catchall_0
    move-exception p1

    .line 17
    :try_start_1
    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 18
    :catchall_1
    move-exception v0

    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    :try_start_2
    invoke-interface {p0}, Lokio/Source;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :catchall_2
    move-exception p0

    .line 26
    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 27
    .line 28
    .line 29
    :cond_1
    :goto_0
    throw v0
.end method
