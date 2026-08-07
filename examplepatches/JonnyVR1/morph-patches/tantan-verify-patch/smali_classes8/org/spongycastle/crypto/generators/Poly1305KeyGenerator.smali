.class public Lorg/spongycastle/crypto/generators/Poly1305KeyGenerator;
.super Lorg/spongycastle/crypto/CipherKeyGenerator;
.source "SourceFile"


# static fields
.field private static final R_MASK_HIGH_4:B = 0xft

.field private static final R_MASK_LOW_2:B = -0x4t


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lorg/spongycastle/crypto/CipherKeyGenerator;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static checkKey([B)V
    .locals 2

    .line 1
    array-length v0, p0

    .line 2
    const/16 v1, 0x20

    .line 3
    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    const/16 v0, 0x13

    .line 7
    .line 8
    aget-byte v0, p0, v0

    .line 9
    .line 10
    const/16 v1, 0xf

    .line 11
    .line 12
    invoke-static {v0, v1}, Lorg/spongycastle/crypto/generators/Poly1305KeyGenerator;->checkMask(BB)V

    .line 13
    .line 14
    .line 15
    const/16 v0, 0x17

    .line 16
    .line 17
    aget-byte v0, p0, v0

    .line 18
    .line 19
    invoke-static {v0, v1}, Lorg/spongycastle/crypto/generators/Poly1305KeyGenerator;->checkMask(BB)V

    .line 20
    .line 21
    .line 22
    const/16 v0, 0x1b

    .line 23
    .line 24
    aget-byte v0, p0, v0

    .line 25
    .line 26
    invoke-static {v0, v1}, Lorg/spongycastle/crypto/generators/Poly1305KeyGenerator;->checkMask(BB)V

    .line 27
    .line 28
    .line 29
    const/16 v0, 0x1f

    .line 30
    .line 31
    aget-byte v0, p0, v0

    .line 32
    .line 33
    invoke-static {v0, v1}, Lorg/spongycastle/crypto/generators/Poly1305KeyGenerator;->checkMask(BB)V

    .line 34
    .line 35
    .line 36
    const/16 v0, 0x14

    .line 37
    .line 38
    aget-byte v0, p0, v0

    .line 39
    .line 40
    const/4 v1, -0x4

    .line 41
    invoke-static {v0, v1}, Lorg/spongycastle/crypto/generators/Poly1305KeyGenerator;->checkMask(BB)V

    .line 42
    .line 43
    .line 44
    const/16 v0, 0x18

    .line 45
    .line 46
    aget-byte v0, p0, v0

    .line 47
    .line 48
    invoke-static {v0, v1}, Lorg/spongycastle/crypto/generators/Poly1305KeyGenerator;->checkMask(BB)V

    .line 49
    .line 50
    .line 51
    const/16 v0, 0x1c

    .line 52
    .line 53
    aget-byte p0, p0, v0

    .line 54
    .line 55
    invoke-static {p0, v1}, Lorg/spongycastle/crypto/generators/Poly1305KeyGenerator;->checkMask(BB)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_0
    const-string p0, "Poly1305 key must be 256 bits."

    .line 60
    .line 61
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method private static checkMask(BB)V
    .locals 0

    .line 1
    not-int p1, p1

    .line 2
    and-int/2addr p0, p1

    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-string p0, "Invalid format for r portion of Poly1305 key."

    .line 7
    .line 8
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static clamp([B)V
    .locals 2

    .line 1
    array-length v0, p0

    .line 2
    const/16 v1, 0x20

    .line 3
    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    const/16 v0, 0x13

    .line 7
    .line 8
    aget-byte v1, p0, v0

    .line 9
    .line 10
    and-int/lit8 v1, v1, 0xf

    .line 11
    .line 12
    int-to-byte v1, v1

    .line 13
    aput-byte v1, p0, v0

    .line 14
    .line 15
    const/16 v0, 0x17

    .line 16
    .line 17
    aget-byte v1, p0, v0

    .line 18
    .line 19
    and-int/lit8 v1, v1, 0xf

    .line 20
    .line 21
    int-to-byte v1, v1

    .line 22
    aput-byte v1, p0, v0

    .line 23
    .line 24
    const/16 v0, 0x1b

    .line 25
    .line 26
    aget-byte v1, p0, v0

    .line 27
    .line 28
    and-int/lit8 v1, v1, 0xf

    .line 29
    .line 30
    int-to-byte v1, v1

    .line 31
    aput-byte v1, p0, v0

    .line 32
    .line 33
    const/16 v0, 0x1f

    .line 34
    .line 35
    aget-byte v1, p0, v0

    .line 36
    .line 37
    and-int/lit8 v1, v1, 0xf

    .line 38
    .line 39
    int-to-byte v1, v1

    .line 40
    aput-byte v1, p0, v0

    .line 41
    .line 42
    const/16 v0, 0x14

    .line 43
    .line 44
    aget-byte v1, p0, v0

    .line 45
    .line 46
    and-int/lit8 v1, v1, -0x4

    .line 47
    .line 48
    int-to-byte v1, v1

    .line 49
    aput-byte v1, p0, v0

    .line 50
    .line 51
    const/16 v0, 0x18

    .line 52
    .line 53
    aget-byte v1, p0, v0

    .line 54
    .line 55
    and-int/lit8 v1, v1, -0x4

    .line 56
    .line 57
    int-to-byte v1, v1

    .line 58
    aput-byte v1, p0, v0

    .line 59
    .line 60
    const/16 v0, 0x1c

    .line 61
    .line 62
    aget-byte v1, p0, v0

    .line 63
    .line 64
    and-int/lit8 v1, v1, -0x4

    .line 65
    .line 66
    int-to-byte v1, v1

    .line 67
    aput-byte v1, p0, v0

    .line 68
    .line 69
    return-void

    .line 70
    :cond_0
    const-string p0, "Poly1305 key must be 256 bits."

    .line 71
    .line 72
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method


# virtual methods
.method public generateKey()[B
    .locals 0

    .line 1
    invoke-super {p0}, Lorg/spongycastle/crypto/CipherKeyGenerator;->generateKey()[B

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lorg/spongycastle/crypto/generators/Poly1305KeyGenerator;->clamp([B)V

    .line 6
    .line 7
    .line 8
    return-object p0
.end method

.method public init(Lorg/spongycastle/crypto/KeyGenerationParameters;)V
    .locals 2

    .line 1
    new-instance v0, Lorg/spongycastle/crypto/KeyGenerationParameters;

    .line 2
    .line 3
    invoke-virtual {p1}, Lorg/spongycastle/crypto/KeyGenerationParameters;->getRandom()Ljava/security/SecureRandom;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const/16 v1, 0x100

    .line 8
    .line 9
    invoke-direct {v0, p1, v1}, Lorg/spongycastle/crypto/KeyGenerationParameters;-><init>(Ljava/security/SecureRandom;I)V

    .line 10
    .line 11
    .line 12
    invoke-super {p0, v0}, Lorg/spongycastle/crypto/CipherKeyGenerator;->init(Lorg/spongycastle/crypto/KeyGenerationParameters;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
