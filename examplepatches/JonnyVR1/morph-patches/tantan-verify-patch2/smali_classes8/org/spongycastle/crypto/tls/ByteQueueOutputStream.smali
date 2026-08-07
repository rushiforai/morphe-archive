.class public Lorg/spongycastle/crypto/tls/ByteQueueOutputStream;
.super Ljava/io/OutputStream;
.source "SourceFile"


# instance fields
.field private buffer:Lorg/spongycastle/crypto/tls/ByteQueue;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lorg/spongycastle/crypto/tls/ByteQueue;

    .line 5
    .line 6
    invoke-direct {v0}, Lorg/spongycastle/crypto/tls/ByteQueue;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lorg/spongycastle/crypto/tls/ByteQueueOutputStream;->buffer:Lorg/spongycastle/crypto/tls/ByteQueue;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public getBuffer()Lorg/spongycastle/crypto/tls/ByteQueue;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/ByteQueueOutputStream;->buffer:Lorg/spongycastle/crypto/tls/ByteQueue;

    .line 2
    .line 3
    return-object p0
.end method

.method public write(I)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/ByteQueueOutputStream;->buffer:Lorg/spongycastle/crypto/tls/ByteQueue;

    .line 2
    .line 3
    int-to-byte p1, p1

    .line 4
    const/4 v0, 0x1

    .line 5
    new-array v1, v0, [B

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    aput-byte p1, v1, v2

    .line 9
    .line 10
    invoke-virtual {p0, v1, v2, v0}, Lorg/spongycastle/crypto/tls/ByteQueue;->addData([BII)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public write([BII)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/ByteQueueOutputStream;->buffer:Lorg/spongycastle/crypto/tls/ByteQueue;

    invoke-virtual {p0, p1, p2, p3}, Lorg/spongycastle/crypto/tls/ByteQueue;->addData([BII)V

    return-void
.end method
