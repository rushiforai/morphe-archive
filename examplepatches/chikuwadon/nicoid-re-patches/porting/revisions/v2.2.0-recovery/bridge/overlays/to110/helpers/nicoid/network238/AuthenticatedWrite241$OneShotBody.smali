.class final Lnicoid/network238/AuthenticatedWrite241$OneShotBody;
.super Lnicoid/network238/okhttp3/RequestBody;
.source "AuthenticatedWrite241.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/AuthenticatedWrite241;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "OneShotBody"
.end annotation


# instance fields
.field private final bytes:[B

.field private final type:Lnicoid/network238/okhttp3/MediaType;


# direct methods
.method constructor <init>([BLnicoid/network238/okhttp3/MediaType;)V
    .registers 3

    .line 32
    invoke-direct {p0}, Lnicoid/network238/okhttp3/RequestBody;-><init>()V

    iput-object p1, p0, Lnicoid/network238/AuthenticatedWrite241$OneShotBody;->bytes:[B

    iput-object p2, p0, Lnicoid/network238/AuthenticatedWrite241$OneShotBody;->type:Lnicoid/network238/okhttp3/MediaType;

    return-void
.end method


# virtual methods
.method public contentLength()J
    .registers 3

    .line 34
    iget-object v0, p0, Lnicoid/network238/AuthenticatedWrite241$OneShotBody;->bytes:[B

    array-length v0, v0

    int-to-long v0, v0

    return-wide v0
.end method

.method public contentType()Lnicoid/network238/okhttp3/MediaType;
    .registers 2

    .line 33
    iget-object v0, p0, Lnicoid/network238/AuthenticatedWrite241$OneShotBody;->type:Lnicoid/network238/okhttp3/MediaType;

    return-object v0
.end method

.method public isOneShot()Z
    .registers 2

    .line 35
    const/4 v0, 0x1

    return v0
.end method

.method public writeTo(Lnicoid/network238/okio/BufferedSink;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 36
    iget-object v0, p0, Lnicoid/network238/AuthenticatedWrite241$OneShotBody;->bytes:[B

    invoke-interface {p1, v0}, Lnicoid/network238/okio/BufferedSink;->write([B)Lnicoid/network238/okio/BufferedSink;

    return-void
.end method
