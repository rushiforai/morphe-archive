.class public Lorg/spongycastle/crypto/tls/ServerSRPParams;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field protected B:Ljava/math/BigInteger;

.field protected N:Ljava/math/BigInteger;

.field protected g:Ljava/math/BigInteger;

.field protected s:[B


# direct methods
.method public constructor <init>(Ljava/math/BigInteger;Ljava/math/BigInteger;[BLjava/math/BigInteger;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/ServerSRPParams;->N:Ljava/math/BigInteger;

    .line 5
    .line 6
    iput-object p2, p0, Lorg/spongycastle/crypto/tls/ServerSRPParams;->g:Ljava/math/BigInteger;

    .line 7
    .line 8
    invoke-static {p3}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/ServerSRPParams;->s:[B

    .line 13
    .line 14
    iput-object p4, p0, Lorg/spongycastle/crypto/tls/ServerSRPParams;->B:Ljava/math/BigInteger;

    .line 15
    .line 16
    return-void
.end method

.method public static parse(Ljava/io/InputStream;)Lorg/spongycastle/crypto/tls/ServerSRPParams;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-static {p0}, Lorg/spongycastle/crypto/tls/TlsSRPUtils;->readSRPParameter(Ljava/io/InputStream;)Ljava/math/BigInteger;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p0}, Lorg/spongycastle/crypto/tls/TlsSRPUtils;->readSRPParameter(Ljava/io/InputStream;)Ljava/math/BigInteger;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {p0}, Lorg/spongycastle/crypto/tls/TlsUtils;->readOpaque8(Ljava/io/InputStream;)[B

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-static {p0}, Lorg/spongycastle/crypto/tls/TlsSRPUtils;->readSRPParameter(Ljava/io/InputStream;)Ljava/math/BigInteger;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    new-instance v3, Lorg/spongycastle/crypto/tls/ServerSRPParams;

    .line 18
    .line 19
    invoke-direct {v3, v0, v1, v2, p0}, Lorg/spongycastle/crypto/tls/ServerSRPParams;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;[BLjava/math/BigInteger;)V

    .line 20
    .line 21
    .line 22
    return-object v3
.end method


# virtual methods
.method public encode(Ljava/io/OutputStream;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/ServerSRPParams;->N:Ljava/math/BigInteger;

    .line 2
    .line 3
    invoke-static {v0, p1}, Lorg/spongycastle/crypto/tls/TlsSRPUtils;->writeSRPParameter(Ljava/math/BigInteger;Ljava/io/OutputStream;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/ServerSRPParams;->g:Ljava/math/BigInteger;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lorg/spongycastle/crypto/tls/TlsSRPUtils;->writeSRPParameter(Ljava/math/BigInteger;Ljava/io/OutputStream;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/ServerSRPParams;->s:[B

    .line 12
    .line 13
    invoke-static {v0, p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeOpaque8([BLjava/io/OutputStream;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/ServerSRPParams;->B:Ljava/math/BigInteger;

    .line 17
    .line 18
    invoke-static {p0, p1}, Lorg/spongycastle/crypto/tls/TlsSRPUtils;->writeSRPParameter(Ljava/math/BigInteger;Ljava/io/OutputStream;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public getB()Ljava/math/BigInteger;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/ServerSRPParams;->B:Ljava/math/BigInteger;

    .line 2
    .line 3
    return-object p0
.end method

.method public getG()Ljava/math/BigInteger;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/ServerSRPParams;->g:Ljava/math/BigInteger;

    .line 2
    .line 3
    return-object p0
.end method

.method public getN()Ljava/math/BigInteger;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/ServerSRPParams;->N:Ljava/math/BigInteger;

    .line 2
    .line 3
    return-object p0
.end method

.method public getS()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/ServerSRPParams;->s:[B

    .line 2
    .line 3
    return-object p0
.end method
