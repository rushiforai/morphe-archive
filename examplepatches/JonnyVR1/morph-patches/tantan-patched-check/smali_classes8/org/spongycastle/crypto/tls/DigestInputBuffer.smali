.class Lorg/spongycastle/crypto/tls/DigestInputBuffer;
.super Ljava/io/ByteArrayOutputStream;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public updateDigest(Lorg/spongycastle/crypto/Digest;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ljava/io/ByteArrayOutputStream;->buf:[B

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iget p0, p0, Ljava/io/ByteArrayOutputStream;->count:I

    .line 5
    .line 6
    invoke-interface {p1, v0, v1, p0}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
