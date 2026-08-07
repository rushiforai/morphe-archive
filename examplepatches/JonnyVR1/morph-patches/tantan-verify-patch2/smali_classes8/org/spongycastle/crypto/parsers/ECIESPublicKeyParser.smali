.class public Lorg/spongycastle/crypto/parsers/ECIESPublicKeyParser;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/KeyParser;


# instance fields
.field private ecParams:Lorg/spongycastle/crypto/params/ECDomainParameters;


# direct methods
.method public constructor <init>(Lorg/spongycastle/crypto/params/ECDomainParameters;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/spongycastle/crypto/parsers/ECIESPublicKeyParser;->ecParams:Lorg/spongycastle/crypto/params/ECDomainParameters;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public readKey(Ljava/io/InputStream;)Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/io/InputStream;->read()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_3

    .line 7
    .line 8
    const/4 v2, 0x2

    .line 9
    const/4 v3, 0x7

    .line 10
    const/4 v4, 0x1

    .line 11
    if-eq v0, v2, :cond_2

    .line 12
    .line 13
    const/4 v5, 0x3

    .line 14
    if-eq v0, v5, :cond_2

    .line 15
    .line 16
    const/4 v5, 0x4

    .line 17
    if-eq v0, v5, :cond_1

    .line 18
    .line 19
    const/4 v5, 0x6

    .line 20
    if-eq v0, v5, :cond_1

    .line 21
    .line 22
    if-ne v0, v3, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/16 p0, 0x10

    .line 26
    .line 27
    invoke-static {v0, p0}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const-string p1, "Sender\'s public key has invalid point encoding 0x"

    .line 32
    .line 33
    invoke-static {p1, p0}, Ll/rr10;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    return-object v1

    .line 37
    :cond_1
    :goto_0
    iget-object v1, p0, Lorg/spongycastle/crypto/parsers/ECIESPublicKeyParser;->ecParams:Lorg/spongycastle/crypto/params/ECDomainParameters;

    .line 38
    .line 39
    invoke-virtual {v1}, Lorg/spongycastle/crypto/params/ECDomainParameters;->getCurve()Lorg/spongycastle/math/ec/ECCurve;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v1}, Lorg/spongycastle/math/ec/ECCurve;->getFieldSize()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    add-int/2addr v1, v3

    .line 48
    div-int/lit8 v1, v1, 0x8

    .line 49
    .line 50
    mul-int/2addr v1, v2

    .line 51
    add-int/2addr v1, v4

    .line 52
    new-array v1, v1, [B

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_2
    iget-object v1, p0, Lorg/spongycastle/crypto/parsers/ECIESPublicKeyParser;->ecParams:Lorg/spongycastle/crypto/params/ECDomainParameters;

    .line 56
    .line 57
    invoke-virtual {v1}, Lorg/spongycastle/crypto/params/ECDomainParameters;->getCurve()Lorg/spongycastle/math/ec/ECCurve;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v1}, Lorg/spongycastle/math/ec/ECCurve;->getFieldSize()I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    add-int/2addr v1, v3

    .line 66
    div-int/lit8 v1, v1, 0x8

    .line 67
    .line 68
    add-int/2addr v1, v4

    .line 69
    new-array v1, v1, [B

    .line 70
    .line 71
    :goto_1
    const/4 v2, 0x0

    .line 72
    int-to-byte v0, v0

    .line 73
    aput-byte v0, v1, v2

    .line 74
    .line 75
    array-length v0, v1

    .line 76
    sub-int/2addr v0, v4

    .line 77
    invoke-static {p1, v1, v4, v0}, Lorg/spongycastle/util/io/Streams;->readFully(Ljava/io/InputStream;[BII)I

    .line 78
    .line 79
    .line 80
    new-instance p1, Lorg/spongycastle/crypto/params/ECPublicKeyParameters;

    .line 81
    .line 82
    iget-object v0, p0, Lorg/spongycastle/crypto/parsers/ECIESPublicKeyParser;->ecParams:Lorg/spongycastle/crypto/params/ECDomainParameters;

    .line 83
    .line 84
    invoke-virtual {v0}, Lorg/spongycastle/crypto/params/ECDomainParameters;->getCurve()Lorg/spongycastle/math/ec/ECCurve;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-virtual {v0, v1}, Lorg/spongycastle/math/ec/ECCurve;->decodePoint([B)Lorg/spongycastle/math/ec/ECPoint;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    iget-object p0, p0, Lorg/spongycastle/crypto/parsers/ECIESPublicKeyParser;->ecParams:Lorg/spongycastle/crypto/params/ECDomainParameters;

    .line 93
    .line 94
    invoke-direct {p1, v0, p0}, Lorg/spongycastle/crypto/params/ECPublicKeyParameters;-><init>(Lorg/spongycastle/math/ec/ECPoint;Lorg/spongycastle/crypto/params/ECDomainParameters;)V

    .line 95
    .line 96
    .line 97
    return-object p1

    .line 98
    :cond_3
    const-string p0, "Sender\'s public key invalid."

    .line 99
    .line 100
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    return-object v1
.end method
