.class public final Ll/d4x0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final b:Ljava/lang/ThreadLocal;


# instance fields
.field public final a:Ljavax/crypto/SecretKey;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/c4x0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/c4x0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/d4x0;->b:Ljava/lang/ThreadLocal;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>([BZ)V
    .locals 1
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
    const/4 p2, 0x2

    .line 5
    invoke-static {p2}, Ll/s4x0;->a(I)Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    array-length p2, p1

    .line 12
    invoke-static {p2}, Ll/ufx0;->a(I)V

    .line 13
    .line 14
    .line 15
    new-instance p2, Ljavax/crypto/spec/SecretKeySpec;

    .line 16
    .line 17
    const-string v0, "AES"

    .line 18
    .line 19
    invoke-direct {p2, p1, v0}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iput-object p2, p0, Ll/d4x0;->a:Ljavax/crypto/SecretKey;

    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    const-string p0, "Can not use AES-GCM in FIPS-mode, as BoringCrypto module is not available."

    .line 26
    .line 27
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    const/4 p0, 0x0

    .line 31
    throw p0
.end method


# virtual methods
.method public final a([B[B[B)[B
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    array-length v0, p1

    .line 2
    const/4 v1, 0x0

    .line 3
    const/16 v2, 0xc

    .line 4
    .line 5
    if-ne v0, v2, :cond_3

    .line 6
    .line 7
    array-length v0, p2

    .line 8
    const/16 v3, 0x1c

    .line 9
    .line 10
    if-lt v0, v3, :cond_2

    .line 11
    .line 12
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    const/4 v4, 0x0

    .line 17
    invoke-static {p2, v4, v2}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    .line 18
    .line 19
    .line 20
    move-result-object v5

    .line 21
    invoke-virtual {v3, v5}, Ljava/nio/ByteBuffer;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    if-eqz v3, :cond_1

    .line 26
    .line 27
    const-string v1, "java.vendor"

    .line 28
    .line 29
    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    const-string v3, "The Android Project"

    .line 34
    .line 35
    invoke-static {v1, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    new-instance v1, Ljavax/crypto/spec/GCMParameterSpec;

    .line 39
    .line 40
    const/16 v3, 0x80

    .line 41
    .line 42
    invoke-direct {v1, v3, p1, v4, v2}, Ljavax/crypto/spec/GCMParameterSpec;-><init>(I[BII)V

    .line 43
    .line 44
    .line 45
    sget-object p1, Ll/d4x0;->b:Ljava/lang/ThreadLocal;

    .line 46
    .line 47
    invoke-virtual {p1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    check-cast v3, Ljavax/crypto/Cipher;

    .line 52
    .line 53
    const/4 v4, 0x2

    .line 54
    iget-object p0, p0, Ll/d4x0;->a:Ljavax/crypto/SecretKey;

    .line 55
    .line 56
    invoke-virtual {v3, v4, p0, v1}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 57
    .line 58
    .line 59
    if-eqz p3, :cond_0

    .line 60
    .line 61
    array-length p0, p3

    .line 62
    if-eqz p0, :cond_0

    .line 63
    .line 64
    invoke-virtual {p1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    check-cast p0, Ljavax/crypto/Cipher;

    .line 69
    .line 70
    invoke-virtual {p0, p3}, Ljavax/crypto/Cipher;->updateAAD([B)V

    .line 71
    .line 72
    .line 73
    :cond_0
    add-int/lit8 v0, v0, -0xc

    .line 74
    .line 75
    invoke-virtual {p1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    check-cast p0, Ljavax/crypto/Cipher;

    .line 80
    .line 81
    invoke-virtual {p0, p2, v2, v0}, Ljavax/crypto/Cipher;->doFinal([BII)[B

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    return-object p0

    .line 86
    :cond_1
    const-string p0, "iv does not match prepended iv"

    .line 87
    .line 88
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    return-object v1

    .line 92
    :cond_2
    const-string p0, "ciphertext too short"

    .line 93
    .line 94
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    return-object v1

    .line 98
    :cond_3
    const-string p0, "iv is wrong size"

    .line 99
    .line 100
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    return-object v1
.end method
