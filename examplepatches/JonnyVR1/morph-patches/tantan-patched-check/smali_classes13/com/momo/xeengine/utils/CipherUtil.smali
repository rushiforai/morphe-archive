.class public Lcom/momo/xeengine/utils/CipherUtil;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation


# static fields
.field private static final ALGORITHM:[Ljava/lang/String;

.field private static final MODE:[Ljava/lang/String;

.field private static final OPERATION:[I

.field private static final PADDING:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    const-string v0, "DESede"

    .line 2
    .line 3
    const-string v1, "RSA"

    .line 4
    .line 5
    const-string v2, "AES"

    .line 6
    .line 7
    const-string v3, "DES"

    .line 8
    .line 9
    filled-new-array {v2, v3, v0, v1}, [Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sput-object v0, Lcom/momo/xeengine/utils/CipherUtil;->ALGORITHM:[Ljava/lang/String;

    .line 14
    .line 15
    const-string v0, "ECB"

    .line 16
    .line 17
    const-string v1, "CBC"

    .line 18
    .line 19
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sput-object v0, Lcom/momo/xeengine/utils/CipherUtil;->MODE:[Ljava/lang/String;

    .line 24
    .line 25
    const-string v0, "NoPadding"

    .line 26
    .line 27
    const-string v1, "PKCS5Padding"

    .line 28
    .line 29
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    sput-object v0, Lcom/momo/xeengine/utils/CipherUtil;->PADDING:[Ljava/lang/String;

    .line 34
    .line 35
    const/4 v0, 0x1

    .line 36
    const/4 v1, 0x2

    .line 37
    filled-new-array {v0, v1}, [I

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    sput-object v0, Lcom/momo/xeengine/utils/CipherUtil;->OPERATION:[I

    .line 42
    .line 43
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static crypt(IIII[B[B)[B
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    sget-object v1, Lcom/momo/xeengine/utils/CipherUtil;->ALGORITHM:[Ljava/lang/String;

    .line 3
    .line 4
    aget-object v2, v1, p1

    .line 5
    .line 6
    invoke-static {v2}, Ljavax/crypto/SecretKeyFactory;->getInstance(Ljava/lang/String;)Ljavax/crypto/SecretKeyFactory;

    .line 7
    .line 8
    .line 9
    move-result-object v2

    .line 10
    if-nez v2, :cond_0

    .line 11
    .line 12
    return-object v0

    .line 13
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 16
    .line 17
    .line 18
    aget-object p1, v1, p1

    .line 19
    .line 20
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const/16 p1, 0x2f

    .line 24
    .line 25
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    sget-object v1, Lcom/momo/xeengine/utils/CipherUtil;->MODE:[Ljava/lang/String;

    .line 29
    .line 30
    aget-object p2, v1, p2

    .line 31
    .line 32
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    sget-object p1, Lcom/momo/xeengine/utils/CipherUtil;->PADDING:[Ljava/lang/String;

    .line 39
    .line 40
    aget-object p1, p1, p3

    .line 41
    .line 42
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-static {p1}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    if-nez p1, :cond_1

    .line 54
    .line 55
    return-object v0

    .line 56
    :cond_1
    new-instance p2, Ljavax/crypto/spec/DESKeySpec;

    .line 57
    .line 58
    invoke-direct {p2, p4}, Ljavax/crypto/spec/DESKeySpec;-><init>([B)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v2, p2}, Ljavax/crypto/SecretKeyFactory;->generateSecret(Ljava/security/spec/KeySpec;)Ljavax/crypto/SecretKey;

    .line 62
    .line 63
    .line 64
    move-result-object p2

    .line 65
    sget-object p3, Lcom/momo/xeengine/utils/CipherUtil;->OPERATION:[I

    .line 66
    .line 67
    aget p0, p3, p0

    .line 68
    .line 69
    invoke-virtual {p1, p0, p2}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p1, p5}, Ljavax/crypto/Cipher;->doFinal([B)[B

    .line 73
    .line 74
    .line 75
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 76
    return-object p0

    .line 77
    :catchall_0
    move-exception p0

    .line 78
    new-instance p1, Ljava/lang/StringBuilder;

    .line 79
    .line 80
    const-string p2, "crypt: "

    .line 81
    .line 82
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    const-string p1, "[XENGINE]"

    .line 93
    .line 94
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 95
    .line 96
    .line 97
    return-object v0
.end method
