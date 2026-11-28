.class final Lnicoid/network238/ApiConnection254$OneShot;
.super Lnicoid/network238/okhttp3/RequestBody;
.source "ApiConnection254.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/ApiConnection254;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "OneShot"
.end annotation


# instance fields
.field final bytes:[B

.field final type:Lnicoid/network238/okhttp3/MediaType;

.field final used:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method constructor <init>([BLnicoid/network238/okhttp3/MediaType;)V
    .registers 4

    .line 65
    invoke-direct {p0}, Lnicoid/network238/okhttp3/RequestBody;-><init>()V

    .line 64
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lnicoid/network238/ApiConnection254$OneShot;->used:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 65
    iput-object p1, p0, Lnicoid/network238/ApiConnection254$OneShot;->bytes:[B

    iput-object p2, p0, Lnicoid/network238/ApiConnection254$OneShot;->type:Lnicoid/network238/okhttp3/MediaType;

    return-void
.end method


# virtual methods
.method public contentLength()J
    .registers 3

    .line 67
    iget-object v0, p0, Lnicoid/network238/ApiConnection254$OneShot;->bytes:[B

    array-length v0, v0

    int-to-long v0, v0

    return-wide v0
.end method

.method public contentType()Lnicoid/network238/okhttp3/MediaType;
    .registers 2

    .line 66
    iget-object v0, p0, Lnicoid/network238/ApiConnection254$OneShot;->type:Lnicoid/network238/okhttp3/MediaType;

    return-object v0
.end method

.method public isOneShot()Z
    .registers 2

    .line 68
    const/4 v0, 0x1

    return v0
.end method

.method public writeTo(Lnicoid/network238/okio/BufferedSink;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 69
    iget-object v0, p0, Lnicoid/network238/ApiConnection254$OneShot;->used:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnicoid/network238/ApiConnection254$OneShot;->bytes:[B

    invoke-interface {p1, v0}, Lnicoid/network238/okio/BufferedSink;->write([B)Lnicoid/network238/okio/BufferedSink;

    return-void

    :cond_0
    new-instance p1, Ljava/io/IOException;

    const-string v0, "API request replay blocked"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
