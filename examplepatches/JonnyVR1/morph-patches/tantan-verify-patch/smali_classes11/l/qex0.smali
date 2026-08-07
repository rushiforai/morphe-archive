.class public final Ll/qex0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/jww0;


# static fields
.field public static final f:Ljava/lang/ThreadLocal;

.field public static final g:Ljava/lang/ThreadLocal;


# instance fields
.field public final a:[B

.field public final b:[B

.field public final c:[B

.field public final d:Ljavax/crypto/spec/SecretKeySpec;

.field public final e:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/oex0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/oex0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/qex0;->f:Ljava/lang/ThreadLocal;

    .line 7
    .line 8
    new-instance v0, Ll/pex0;

    .line 9
    .line 10
    invoke-direct {v0}, Ll/pex0;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Ll/qex0;->g:Ljava/lang/ThreadLocal;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>([BI[B)V
    .locals 4
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
    const/4 v0, 0x1

    .line 5
    invoke-static {v0}, Ll/s4x0;->a(I)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_2

    .line 11
    .line 12
    const/16 v1, 0xc

    .line 13
    .line 14
    const/16 v3, 0x10

    .line 15
    .line 16
    if-eq p2, v1, :cond_1

    .line 17
    .line 18
    if-ne p2, v3, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const-string p0, "IV size should be either 12 or 16 bytes"

    .line 22
    .line 23
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    throw v2

    .line 27
    :cond_1
    :goto_0
    iput p2, p0, Ll/qex0;->e:I

    .line 28
    .line 29
    array-length p2, p1

    .line 30
    invoke-static {p2}, Ll/ufx0;->a(I)V

    .line 31
    .line 32
    .line 33
    new-instance p2, Ljavax/crypto/spec/SecretKeySpec;

    .line 34
    .line 35
    const-string v1, "AES"

    .line 36
    .line 37
    invoke-direct {p2, p1, v1}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iput-object p2, p0, Ll/qex0;->d:Ljavax/crypto/spec/SecretKeySpec;

    .line 41
    .line 42
    sget-object p1, Ll/qex0;->f:Ljava/lang/ThreadLocal;

    .line 43
    .line 44
    invoke-virtual {p1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    check-cast p1, Ljavax/crypto/Cipher;

    .line 49
    .line 50
    invoke-virtual {p1, v0, p2}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 51
    .line 52
    .line 53
    new-array p2, v3, [B

    .line 54
    .line 55
    invoke-virtual {p1, p2}, Ljavax/crypto/Cipher;->doFinal([B)[B

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-static {p1}, Ll/qex0;->c([B)[B

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    iput-object p1, p0, Ll/qex0;->a:[B

    .line 64
    .line 65
    invoke-static {p1}, Ll/qex0;->c([B)[B

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    iput-object p1, p0, Ll/qex0;->b:[B

    .line 70
    .line 71
    iput-object p3, p0, Ll/qex0;->c:[B

    .line 72
    .line 73
    return-void

    .line 74
    :cond_2
    const-string p0, "Can not use AES-EAX in FIPS-mode."

    .line 75
    .line 76
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    throw v2
.end method

.method public static b(Ll/jzw0;)Ll/jww0;
    .locals 3
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
    invoke-virtual {p0}, Ll/jzw0;->a()Ll/rzw0;

    .line 9
    .line 10
    .line 11
    new-instance v0, Ll/qex0;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/jzw0;->c()Ll/xfx0;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {}, Ll/www0;->a()Ll/ayw0;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v1, v2}, Ll/xfx0;->d(Ll/ayw0;)[B

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {p0}, Ll/jzw0;->a()Ll/rzw0;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v2}, Ll/rzw0;->b()I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    invoke-virtual {p0}, Ll/jzw0;->b()Ll/wfx0;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0}, Ll/wfx0;->c()[B

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-direct {v0, v1, v2, p0}, Ll/qex0;-><init>([BI[B)V

    .line 42
    .line 43
    .line 44
    return-object v0

    .line 45
    :cond_0
    const-string p0, "Can not use AES-EAX in FIPS-mode."

    .line 46
    .line 47
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    const/4 p0, 0x0

    .line 51
    return-object p0
.end method

.method public static c([B)[B
    .locals 6

    .line 1
    const/16 v0, 0x10

    .line 2
    .line 3
    new-array v0, v0, [B

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    move v2, v1

    .line 7
    :goto_0
    const/16 v3, 0xf

    .line 8
    .line 9
    if-ge v2, v3, :cond_0

    .line 10
    .line 11
    aget-byte v3, p0, v2

    .line 12
    .line 13
    add-int/2addr v3, v3

    .line 14
    add-int/lit8 v4, v2, 0x1

    .line 15
    .line 16
    aget-byte v5, p0, v4

    .line 17
    .line 18
    and-int/lit16 v5, v5, 0xff

    .line 19
    .line 20
    ushr-int/lit8 v5, v5, 0x7

    .line 21
    .line 22
    xor-int/2addr v3, v5

    .line 23
    and-int/lit16 v3, v3, 0xff

    .line 24
    .line 25
    int-to-byte v3, v3

    .line 26
    aput-byte v3, v0, v2

    .line 27
    .line 28
    move v2, v4

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    aget-byte v2, p0, v3

    .line 31
    .line 32
    add-int/2addr v2, v2

    .line 33
    aget-byte p0, p0, v1

    .line 34
    .line 35
    shr-int/lit8 p0, p0, 0x7

    .line 36
    .line 37
    and-int/lit16 p0, p0, 0x87

    .line 38
    .line 39
    xor-int/2addr p0, v2

    .line 40
    int-to-byte p0, p0

    .line 41
    aput-byte p0, v0, v3

    .line 42
    .line 43
    return-object v0
.end method

.method private static f([B[B)[B
    .locals 5

    .line 1
    array-length v0, p0

    .line 2
    new-array v1, v0, [B

    .line 3
    .line 4
    const/4 v2, 0x0

    .line 5
    :goto_0
    if-ge v2, v0, :cond_0

    .line 6
    .line 7
    aget-byte v3, p0, v2

    .line 8
    .line 9
    aget-byte v4, p1, v2

    .line 10
    .line 11
    xor-int/2addr v3, v4

    .line 12
    int-to-byte v3, v3

    .line 13
    aput-byte v3, v1, v2

    .line 14
    .line 15
    add-int/lit8 v2, v2, 0x1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    return-object v1
.end method


# virtual methods
.method public final a([B[B)[B
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/qex0;->c:[B

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    if-nez v1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0, p1, p2}, Ll/qex0;->e([B[B)[B

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0

    .line 11
    :cond_0
    invoke-static {v0, p1}, Ll/u7x0;->b([B[B)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    iget-object v0, p0, Ll/qex0;->c:[B

    .line 18
    .line 19
    array-length v1, p1

    .line 20
    array-length v0, v0

    .line 21
    invoke-static {p1, v0, v1}, Ljava/util/Arrays;->copyOfRange([BII)[B

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p0, p1, p2}, Ll/qex0;->e([B[B)[B

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0

    .line 30
    :cond_1
    const-string p0, "Decryption failed (OutputPrefix mismatch)."

    .line 31
    .line 32
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    const/4 p0, 0x0

    .line 36
    return-object p0
.end method

.method public final d(Ljavax/crypto/Cipher;I[BII)[B
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/crypto/IllegalBlockSizeException;,
            Ljavax/crypto/BadPaddingException;
        }
    .end annotation

    .line 1
    const/16 v0, 0x10

    .line 2
    .line 3
    new-array v1, v0, [B

    .line 4
    .line 5
    const/16 v2, 0xf

    .line 6
    .line 7
    int-to-byte p2, p2

    .line 8
    aput-byte p2, v1, v2

    .line 9
    .line 10
    if-nez p5, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Ll/qex0;->a:[B

    .line 13
    .line 14
    invoke-static {v1, p0}, Ll/qex0;->f([B[B)[B

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p1, p0}, Ljavax/crypto/Cipher;->doFinal([B)[B

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0

    .line 23
    :cond_0
    invoke-virtual {p1, v1}, Ljavax/crypto/Cipher;->doFinal([B)[B

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    const/4 v1, 0x0

    .line 28
    move v2, v1

    .line 29
    :goto_0
    sub-int v3, p5, v2

    .line 30
    .line 31
    if-le v3, v0, :cond_2

    .line 32
    .line 33
    move v3, v1

    .line 34
    :goto_1
    if-ge v3, v0, :cond_1

    .line 35
    .line 36
    add-int v4, p4, v2

    .line 37
    .line 38
    aget-byte v5, p2, v3

    .line 39
    .line 40
    add-int/2addr v4, v3

    .line 41
    aget-byte v4, p3, v4

    .line 42
    .line 43
    xor-int/2addr v4, v5

    .line 44
    int-to-byte v4, v4

    .line 45
    aput-byte v4, p2, v3

    .line 46
    .line 47
    add-int/lit8 v3, v3, 0x1

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_1
    invoke-virtual {p1, p2}, Ljavax/crypto/Cipher;->doFinal([B)[B

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    add-int/lit8 v2, v2, 0x10

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_2
    add-int/2addr v2, p4

    .line 58
    add-int/2addr p4, p5

    .line 59
    invoke-static {p3, v2, p4}, Ljava/util/Arrays;->copyOfRange([BII)[B

    .line 60
    .line 61
    .line 62
    move-result-object p3

    .line 63
    array-length p4, p3

    .line 64
    if-ne p4, v0, :cond_3

    .line 65
    .line 66
    iget-object p0, p0, Ll/qex0;->a:[B

    .line 67
    .line 68
    invoke-static {p3, p0}, Ll/qex0;->f([B[B)[B

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    goto :goto_3

    .line 73
    :cond_3
    iget-object p0, p0, Ll/qex0;->b:[B

    .line 74
    .line 75
    invoke-static {p0, v0}, Ljava/util/Arrays;->copyOf([BI)[B

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    :goto_2
    array-length p4, p3

    .line 80
    if-ge v1, p4, :cond_4

    .line 81
    .line 82
    aget-byte p4, p0, v1

    .line 83
    .line 84
    aget-byte p5, p3, v1

    .line 85
    .line 86
    xor-int/2addr p4, p5

    .line 87
    int-to-byte p4, p4

    .line 88
    aput-byte p4, p0, v1

    .line 89
    .line 90
    add-int/lit8 v1, v1, 0x1

    .line 91
    .line 92
    goto :goto_2

    .line 93
    :cond_4
    aget-byte p3, p0, p4

    .line 94
    .line 95
    xor-int/lit16 p3, p3, 0x80

    .line 96
    .line 97
    int-to-byte p3, p3

    .line 98
    aput-byte p3, p0, p4

    .line 99
    .line 100
    :goto_3
    invoke-static {p2, p0}, Ll/qex0;->f([B[B)[B

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    invoke-virtual {p1, p0}, Ljavax/crypto/Cipher;->doFinal([B)[B

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    return-object p0
.end method

.method public final e([B[B)[B
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    array-length v6, p1

    .line 2
    iget v1, p0, Ll/qex0;->e:I

    .line 3
    .line 4
    sub-int v1, v6, v1

    .line 5
    .line 6
    add-int/lit8 v7, v1, -0x10

    .line 7
    .line 8
    if-ltz v7, :cond_3

    .line 9
    .line 10
    sget-object v1, Ll/qex0;->f:Ljava/lang/ThreadLocal;

    .line 11
    .line 12
    invoke-virtual {v1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Ljavax/crypto/Cipher;

    .line 17
    .line 18
    iget-object v2, p0, Ll/qex0;->d:Ljavax/crypto/spec/SecretKeySpec;

    .line 19
    .line 20
    const/4 v8, 0x1

    .line 21
    invoke-virtual {v1, v8, v2}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 22
    .line 23
    .line 24
    const/4 v4, 0x0

    .line 25
    iget v5, p0, Ll/qex0;->e:I

    .line 26
    .line 27
    const/4 v2, 0x0

    .line 28
    move-object v0, p0

    .line 29
    move-object v3, p1

    .line 30
    invoke-virtual/range {v0 .. v5}, Ll/qex0;->d(Ljavax/crypto/Cipher;I[BII)[B

    .line 31
    .line 32
    .line 33
    move-result-object v9

    .line 34
    const/4 v10, 0x0

    .line 35
    if-nez p2, :cond_0

    .line 36
    .line 37
    new-array v0, v10, [B

    .line 38
    .line 39
    move-object v3, v0

    .line 40
    goto :goto_0

    .line 41
    :cond_0
    move-object v3, p2

    .line 42
    :goto_0
    const/4 v4, 0x0

    .line 43
    array-length v5, v3

    .line 44
    const/4 v2, 0x1

    .line 45
    move-object v0, p0

    .line 46
    invoke-virtual/range {v0 .. v5}, Ll/qex0;->d(Ljavax/crypto/Cipher;I[BII)[B

    .line 47
    .line 48
    .line 49
    move-result-object v11

    .line 50
    const/4 v2, 0x2

    .line 51
    iget v4, p0, Ll/qex0;->e:I

    .line 52
    .line 53
    move-object v3, p1

    .line 54
    move v5, v7

    .line 55
    invoke-virtual/range {v0 .. v5}, Ll/qex0;->d(Ljavax/crypto/Cipher;I[BII)[B

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    add-int/lit8 v6, v6, -0x10

    .line 60
    .line 61
    move v2, v10

    .line 62
    :goto_1
    const/16 v4, 0x10

    .line 63
    .line 64
    if-ge v10, v4, :cond_1

    .line 65
    .line 66
    add-int v4, v6, v10

    .line 67
    .line 68
    aget-byte v4, p1, v4

    .line 69
    .line 70
    aget-byte v7, v11, v10

    .line 71
    .line 72
    xor-int/2addr v4, v7

    .line 73
    aget-byte v7, v9, v10

    .line 74
    .line 75
    xor-int/2addr v4, v7

    .line 76
    aget-byte v7, v1, v10

    .line 77
    .line 78
    xor-int/2addr v4, v7

    .line 79
    or-int/2addr v2, v4

    .line 80
    int-to-byte v2, v2

    .line 81
    add-int/lit8 v10, v10, 0x1

    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_1
    if-nez v2, :cond_2

    .line 85
    .line 86
    sget-object v1, Ll/qex0;->g:Ljava/lang/ThreadLocal;

    .line 87
    .line 88
    invoke-virtual {v1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    check-cast v1, Ljavax/crypto/Cipher;

    .line 93
    .line 94
    iget-object v2, p0, Ll/qex0;->d:Ljavax/crypto/spec/SecretKeySpec;

    .line 95
    .line 96
    new-instance v4, Ljavax/crypto/spec/IvParameterSpec;

    .line 97
    .line 98
    invoke-direct {v4, v9}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {v1, v8, v2, v4}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 102
    .line 103
    .line 104
    iget v0, p0, Ll/qex0;->e:I

    .line 105
    .line 106
    invoke-virtual {v1, p1, v0, v5}, Ljavax/crypto/Cipher;->doFinal([BII)[B

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    return-object v0

    .line 111
    :cond_2
    new-instance v0, Ljavax/crypto/AEADBadTagException;

    .line 112
    .line 113
    const-string v1, "tag mismatch"

    .line 114
    .line 115
    invoke-direct {v0, v1}, Ljavax/crypto/AEADBadTagException;-><init>(Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    throw v0

    .line 119
    :cond_3
    const-string v0, "ciphertext too short"

    .line 120
    .line 121
    invoke-static {v0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    const/4 v0, 0x0

    .line 125
    return-object v0
.end method
