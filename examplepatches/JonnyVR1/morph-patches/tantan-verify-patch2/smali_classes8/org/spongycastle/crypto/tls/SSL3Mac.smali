.class public Lorg/spongycastle/crypto/tls/SSL3Mac;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/Mac;


# static fields
.field static final IPAD:[B

.field private static final IPAD_BYTE:B = 0x36t

.field static final OPAD:[B

.field private static final OPAD_BYTE:B = 0x5ct


# instance fields
.field private digest:Lorg/spongycastle/crypto/Digest;

.field private padLength:I

.field private secret:[B


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/16 v0, 0x36

    .line 2
    .line 3
    const/16 v1, 0x30

    .line 4
    .line 5
    invoke-static {v0, v1}, Lorg/spongycastle/crypto/tls/SSL3Mac;->genPad(BI)[B

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sput-object v0, Lorg/spongycastle/crypto/tls/SSL3Mac;->IPAD:[B

    .line 10
    .line 11
    const/16 v0, 0x5c

    .line 12
    .line 13
    invoke-static {v0, v1}, Lorg/spongycastle/crypto/tls/SSL3Mac;->genPad(BI)[B

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sput-object v0, Lorg/spongycastle/crypto/tls/SSL3Mac;->OPAD:[B

    .line 18
    .line 19
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/Digest;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/SSL3Mac;->digest:Lorg/spongycastle/crypto/Digest;

    .line 5
    .line 6
    invoke-interface {p1}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    const/16 v0, 0x14

    .line 11
    .line 12
    if-ne p1, v0, :cond_0

    .line 13
    .line 14
    const/16 p1, 0x28

    .line 15
    .line 16
    iput p1, p0, Lorg/spongycastle/crypto/tls/SSL3Mac;->padLength:I

    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    const/16 p1, 0x30

    .line 20
    .line 21
    iput p1, p0, Lorg/spongycastle/crypto/tls/SSL3Mac;->padLength:I

    .line 22
    .line 23
    return-void
.end method

.method private static genPad(BI)[B
    .locals 0

    .line 1
    new-array p1, p1, [B

    .line 2
    .line 3
    invoke-static {p1, p0}, Lorg/spongycastle/util/Arrays;->fill([BB)V

    .line 4
    .line 5
    .line 6
    return-object p1
.end method


# virtual methods
.method public doFinal([BI)I
    .locals 6

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/SSL3Mac;->digest:Lorg/spongycastle/crypto/Digest;

    .line 2
    .line 3
    invoke-interface {v0}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    new-array v1, v0, [B

    .line 8
    .line 9
    iget-object v2, p0, Lorg/spongycastle/crypto/tls/SSL3Mac;->digest:Lorg/spongycastle/crypto/Digest;

    .line 10
    .line 11
    const/4 v3, 0x0

    .line 12
    invoke-interface {v2, v1, v3}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 13
    .line 14
    .line 15
    iget-object v2, p0, Lorg/spongycastle/crypto/tls/SSL3Mac;->digest:Lorg/spongycastle/crypto/Digest;

    .line 16
    .line 17
    iget-object v4, p0, Lorg/spongycastle/crypto/tls/SSL3Mac;->secret:[B

    .line 18
    .line 19
    array-length v5, v4

    .line 20
    invoke-interface {v2, v4, v3, v5}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 21
    .line 22
    .line 23
    iget-object v2, p0, Lorg/spongycastle/crypto/tls/SSL3Mac;->digest:Lorg/spongycastle/crypto/Digest;

    .line 24
    .line 25
    sget-object v4, Lorg/spongycastle/crypto/tls/SSL3Mac;->OPAD:[B

    .line 26
    .line 27
    iget v5, p0, Lorg/spongycastle/crypto/tls/SSL3Mac;->padLength:I

    .line 28
    .line 29
    invoke-interface {v2, v4, v3, v5}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 30
    .line 31
    .line 32
    iget-object v2, p0, Lorg/spongycastle/crypto/tls/SSL3Mac;->digest:Lorg/spongycastle/crypto/Digest;

    .line 33
    .line 34
    invoke-interface {v2, v1, v3, v0}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/SSL3Mac;->digest:Lorg/spongycastle/crypto/Digest;

    .line 38
    .line 39
    invoke-interface {v0, p1, p2}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/SSL3Mac;->reset()V

    .line 44
    .line 45
    .line 46
    return p1
.end method

.method public getAlgorithmName()Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/SSL3Mac;->digest:Lorg/spongycastle/crypto/Digest;

    .line 7
    .line 8
    invoke-interface {p0}, Lorg/spongycastle/crypto/Digest;->getAlgorithmName()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string p0, "/SSL3MAC"

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public getMacSize()I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/SSL3Mac;->digest:Lorg/spongycastle/crypto/Digest;

    .line 2
    .line 3
    invoke-interface {p0}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getUnderlyingDigest()Lorg/spongycastle/crypto/Digest;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/SSL3Mac;->digest:Lorg/spongycastle/crypto/Digest;

    .line 2
    .line 3
    return-object p0
.end method

.method public init(Lorg/spongycastle/crypto/CipherParameters;)V
    .locals 0

    .line 1
    check-cast p1, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 2
    .line 3
    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/KeyParameter;->getKey()[B

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/SSL3Mac;->secret:[B

    .line 12
    .line 13
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/SSL3Mac;->reset()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public reset()V
    .locals 4

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/SSL3Mac;->digest:Lorg/spongycastle/crypto/Digest;

    .line 2
    .line 3
    invoke-interface {v0}, Lorg/spongycastle/crypto/Digest;->reset()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/SSL3Mac;->digest:Lorg/spongycastle/crypto/Digest;

    .line 7
    .line 8
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/SSL3Mac;->secret:[B

    .line 9
    .line 10
    array-length v2, v1

    .line 11
    const/4 v3, 0x0

    .line 12
    invoke-interface {v0, v1, v3, v2}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/SSL3Mac;->digest:Lorg/spongycastle/crypto/Digest;

    .line 16
    .line 17
    sget-object v1, Lorg/spongycastle/crypto/tls/SSL3Mac;->IPAD:[B

    .line 18
    .line 19
    iget p0, p0, Lorg/spongycastle/crypto/tls/SSL3Mac;->padLength:I

    .line 20
    .line 21
    invoke-interface {v0, v1, v3, p0}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public update(B)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/SSL3Mac;->digest:Lorg/spongycastle/crypto/Digest;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lorg/spongycastle/crypto/Digest;->update(B)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public update([BII)V
    .locals 0

    .line 7
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/SSL3Mac;->digest:Lorg/spongycastle/crypto/Digest;

    invoke-interface {p0, p1, p2, p3}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    return-void
.end method
