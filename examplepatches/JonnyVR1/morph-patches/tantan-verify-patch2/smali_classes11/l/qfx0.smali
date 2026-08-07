.class public final Ll/qfx0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/zax0;


# instance fields
.field public final a:Ljavax/crypto/SecretKey;

.field public final b:[B

.field public final c:[B


# direct methods
.method public constructor <init>([B)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    array-length v0, p1

    .line 5
    invoke-static {v0}, Ll/ufx0;->a(I)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Ljavax/crypto/spec/SecretKeySpec;

    .line 9
    .line 10
    const-string v1, "AES"

    .line 11
    .line 12
    invoke-direct {v0, p1, v1}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Ll/qfx0;->a:Ljavax/crypto/SecretKey;

    .line 16
    .line 17
    invoke-static {}, Ll/qfx0;->b()Ljavax/crypto/Cipher;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    const/4 v1, 0x1

    .line 22
    invoke-virtual {p1, v1, v0}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 23
    .line 24
    .line 25
    const/16 v0, 0x10

    .line 26
    .line 27
    new-array v0, v0, [B

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Ljavax/crypto/Cipher;->doFinal([B)[B

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-static {p1}, Ll/cax0;->a([B)[B

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    iput-object p1, p0, Ll/qfx0;->b:[B

    .line 38
    .line 39
    invoke-static {p1}, Ll/cax0;->a([B)[B

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iput-object p1, p0, Ll/qfx0;->c:[B

    .line 44
    .line 45
    return-void
.end method

.method public static b()Ljavax/crypto/Cipher;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {v0}, Ll/s4x0;->a(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    sget-object v0, Ll/cfx0;->b:Ll/cfx0;

    .line 9
    .line 10
    const-string v1, "AES/ECB/NoPadding"

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ll/cfx0;->a(Ljava/lang/String;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ljavax/crypto/Cipher;

    .line 17
    .line 18
    return-object v0

    .line 19
    :cond_0
    const-string v0, "Can not use AES-CMAC in FIPS-mode."

    .line 20
    .line 21
    invoke-static {v0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    return-object v0
.end method


# virtual methods
.method public final a([BI)[B
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    const/16 v0, 0x10

    .line 2
    .line 3
    if-gt p2, v0, :cond_3

    .line 4
    .line 5
    iget-object v1, p0, Ll/qfx0;->a:Ljavax/crypto/SecretKey;

    .line 6
    .line 7
    invoke-static {}, Ll/qfx0;->b()Ljavax/crypto/Cipher;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    const/4 v3, 0x1

    .line 12
    invoke-virtual {v2, v3, v1}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 13
    .line 14
    .line 15
    array-length v1, p1

    .line 16
    int-to-double v4, v1

    .line 17
    const-wide/high16 v6, 0x4030000000000000L    # 16.0

    .line 18
    .line 19
    div-double/2addr v4, v6

    .line 20
    invoke-static {v4, v5}, Ljava/lang/Math;->ceil(D)D

    .line 21
    .line 22
    .line 23
    move-result-wide v4

    .line 24
    double-to-int v4, v4

    .line 25
    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    add-int/lit8 v4, v3, -0x1

    .line 30
    .line 31
    mul-int/lit8 v5, v4, 0x10

    .line 32
    .line 33
    mul-int/2addr v3, v0

    .line 34
    const/4 v6, 0x0

    .line 35
    if-ne v3, v1, :cond_0

    .line 36
    .line 37
    iget-object p0, p0, Ll/qfx0;->b:[B

    .line 38
    .line 39
    invoke-static {p1, v5, p0, v6, v0}, Ll/sex0;->d([BI[BII)[B

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    goto :goto_0

    .line 44
    :cond_0
    invoke-static {p1, v5, v1}, Ljava/util/Arrays;->copyOfRange([BII)[B

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    array-length v3, v1

    .line 49
    if-ge v3, v0, :cond_2

    .line 50
    .line 51
    invoke-static {v1, v0}, Ljava/util/Arrays;->copyOf([BI)[B

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    const/16 v5, -0x80

    .line 56
    .line 57
    aput-byte v5, v1, v3

    .line 58
    .line 59
    iget-object p0, p0, Ll/qfx0;->c:[B

    .line 60
    .line 61
    invoke-static {v1, p0}, Ll/sex0;->c([B[B)[B

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    :goto_0
    new-array v1, v0, [B

    .line 66
    .line 67
    move v3, v6

    .line 68
    :goto_1
    if-ge v3, v4, :cond_1

    .line 69
    .line 70
    mul-int/lit8 v5, v3, 0x10

    .line 71
    .line 72
    invoke-static {v1, v6, p1, v5, v0}, Ll/sex0;->d([BI[BII)[B

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-virtual {v2, v1}, Ljavax/crypto/Cipher;->doFinal([B)[B

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    add-int/lit8 v3, v3, 0x1

    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_1
    invoke-static {p0, v1}, Ll/sex0;->c([B[B)[B

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-virtual {v2, p0}, Ljavax/crypto/Cipher;->doFinal([B)[B

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-static {p0, p2}, Ljava/util/Arrays;->copyOf([BI)[B

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    return-object p0

    .line 96
    :cond_2
    const-string p0, "x must be smaller than a block."

    .line 97
    .line 98
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    const/4 p0, 0x0

    .line 102
    return-object p0

    .line 103
    :cond_3
    new-instance p0, Ljava/security/InvalidAlgorithmParameterException;

    .line 104
    .line 105
    const-string p1, "outputLength too large, max is 16 bytes"

    .line 106
    .line 107
    invoke-direct {p0, p1}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    throw p0
.end method
