.class final Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "\u0269"
.end annotation


# static fields
.field private static ʽ:I = 0x0

.field private static final ॱ:[B

.field private static ᐝ:I = 0x1


# instance fields
.field private ˊ:Z

.field private final ˋ:Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ı$ǃ;

.field private final ˎ:Ljava/security/MessageDigest;

.field private final ˏ:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x33

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ॱ:[B

    return-void

    :array_0
    .array-data 1
        0x42t
        0x52t
        0x2at
        -0x17t
        0x6t
        -0x18t
        0x12t
        0x30t
        -0x48t
        0xbt
        -0x1t
        -0x15t
        0x0t
        0x6t
        -0xet
        -0x8t
        0x48t
        -0x22t
        -0x1bt
        -0x11t
        -0x3t
        0xft
        -0x9t
        -0x1t
        0x1et
        -0x28t
        -0x1t
        -0x1t
        -0x11t
        -0x4t
        -0x8t
        -0x1t
        -0x1t
        -0x11t
        -0x4t
        0x8t
        0x4t
        0x11t
        -0x8t
        -0x6t
        -0x4t
        -0x1t
        -0x12t
        0x28t
        -0x28t
        -0x8t
        -0x4t
        0x10t
        -0x10t
        0x8t
        -0x5t
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 6

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ˏ:Landroid/content/Context;

    .line 5
    .line 6
    new-instance p1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ı$ǃ;

    .line 7
    .line 8
    invoke-direct {p1}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ı$ǃ;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ˋ:Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ı$ǃ;

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    const/4 v0, 0x0

    .line 15
    :try_start_0
    sget-object v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ॱ:[B

    .line 16
    .line 17
    const/16 v2, 0x18

    .line 18
    .line 19
    aget-byte v2, v1, v2

    .line 20
    .line 21
    int-to-byte v2, v2

    .line 22
    const/16 v3, 0xa

    .line 23
    .line 24
    aget-byte v4, v1, v3

    .line 25
    .line 26
    neg-int v4, v4

    .line 27
    int-to-byte v4, v4

    .line 28
    invoke-static {v2, p1, v4}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ॱ(ISI)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-virtual {v2}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v2
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    .line 36
    :try_start_1
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    aget-byte v3, v1, v3

    .line 41
    .line 42
    int-to-byte v3, v3

    .line 43
    const/4 v4, 0x3

    .line 44
    aget-byte v4, v1, v4

    .line 45
    .line 46
    neg-int v4, v4

    .line 47
    int-to-byte v4, v4

    .line 48
    const/16 v5, 0xb

    .line 49
    .line 50
    aget-byte v5, v1, v5

    .line 51
    .line 52
    neg-int v5, v5

    .line 53
    int-to-byte v5, v5

    .line 54
    invoke-static {v3, v4, v5}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ॱ(ISI)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    invoke-virtual {v3}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    const/16 v4, 0x32

    .line 67
    .line 68
    aget-byte v1, v1, v4

    .line 69
    .line 70
    neg-int v1, v1

    .line 71
    int-to-byte v1, v1

    .line 72
    const/16 v4, 0x24

    .line 73
    .line 74
    const/16 v5, 0x14

    .line 75
    .line 76
    invoke-static {v4, v5, v1}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ॱ(ISI)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-virtual {v1}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    const-class v4, Ljava/lang/String;

    .line 85
    .line 86
    filled-new-array {v4}, [Ljava/lang/Class;

    .line 87
    .line 88
    .line 89
    move-result-object v4

    .line 90
    invoke-virtual {v3, v1, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    invoke-virtual {v1, v0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    check-cast v1, Ljava/security/MessageDigest;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 99
    .line 100
    move-object v0, v1

    .line 101
    goto :goto_0

    .line 102
    :catchall_0
    move-exception v1

    .line 103
    :try_start_2
    invoke-virtual {v1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    if-eqz v2, :cond_0

    .line 108
    .line 109
    throw v2

    .line 110
    :cond_0
    throw v1
    :try_end_2
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_2 .. :try_end_2} :catch_0

    .line 111
    :catch_0
    :goto_0
    iput-object v0, p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ˎ:Ljava/security/MessageDigest;

    .line 112
    .line 113
    iput-boolean p1, p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ˊ:Z

    .line 114
    .line 115
    return-void
.end method

.method public static synthetic ˊ(Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;)Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ı$ǃ;
    .locals 3

    .line 77
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ᐝ:I

    xor-int/lit8 v1, v0, 0x7d

    and-int/lit8 v2, v0, 0x7d

    shl-int/lit8 v2, v2, 0x1

    add-int/2addr v1, v2

    rem-int/lit16 v1, v1, 0x80

    sput v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ʽ:I

    iget-object p0, p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ˋ:Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ı$ǃ;

    or-int/lit8 v1, v0, 0x1

    shl-int/lit8 v1, v1, 0x1

    xor-int/lit8 v0, v0, 0x1

    sub-int/2addr v1, v0

    rem-int/lit16 v1, v1, 0x80

    sput v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ʽ:I

    return-object p0
.end method

.method private static ˋ(I)[B
    .locals 6

    .line 74
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ᐝ:I

    shr-int/lit8 v1, p0, 0x18

    int-to-byte v1, v1

    shr-int/lit8 v2, p0, 0x10

    int-to-byte v2, v2

    shr-int/lit8 v3, p0, 0x8

    int-to-byte v3, v3

    int-to-byte p0, p0

    const/4 v4, 0x4

    .line 75
    new-array v4, v4, [B

    const/4 v5, 0x0

    aput-byte v1, v4, v5

    const/4 v1, 0x1

    aput-byte v2, v4, v1

    const/4 v2, 0x2

    aput-byte v3, v4, v2

    const/4 v2, 0x3

    aput-byte p0, v4, v2

    or-int/lit8 p0, v0, 0x9

    shl-int/2addr p0, v1

    xor-int/lit8 v0, v0, 0x9

    sub-int/2addr p0, v0

    .line 76
    rem-int/lit16 p0, p0, 0x80

    sput p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ʽ:I

    return-object v4
.end method

.method public static synthetic ˎ(Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;)Landroid/content/Context;
    .locals 2

    .line 66
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ʽ:I

    or-int/lit8 v1, v0, 0x5f

    shl-int/lit8 v1, v1, 0x1

    xor-int/lit8 v0, v0, 0x5f

    sub-int/2addr v1, v0

    rem-int/lit16 v1, v1, 0x80

    sput v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ᐝ:I

    iget-object p0, p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ˏ:Landroid/content/Context;

    and-int/lit8 v0, v1, 0x77

    or-int/lit8 v1, v1, 0x77

    add-int/2addr v0, v1

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ʽ:I

    rem-int/lit8 v0, v0, 0x2

    if-nez v0, :cond_0

    return-object p0

    :cond_0
    const/4 p0, 0x0

    throw p0
.end method

.method private static ॱ(ISI)Ljava/lang/String;
    .locals 6

    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ᐝ:I

    add-int/lit8 v1, v0, 0x69

    rem-int/lit16 v1, v1, 0x80

    sput v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ʽ:I

    add-int/lit8 p1, p1, 0x53

    add-int/lit8 v1, p2, 0x6

    sget-object v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ॱ:[B

    add-int/lit8 p0, p0, 0x4

    new-array v1, v1, [B

    add-int/lit8 p2, p2, 0x5

    const/4 v3, 0x0

    if-nez v2, :cond_1

    add-int/lit8 v0, v0, 0x53

    rem-int/lit16 v4, v0, 0x80

    sput v4, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ʽ:I

    rem-int/lit8 v0, v0, 0x2

    if-nez v0, :cond_0

    move v0, p1

    move-object v4, v2

    move v2, v3

    move p1, p0

    goto :goto_1

    :cond_0
    const/4 p0, 0x0

    throw p0

    :cond_1
    move v0, v3

    :goto_0
    int-to-byte v4, p1

    aput-byte v4, v1, v0

    add-int/lit8 p0, p0, 0x1

    if-ne v0, p2, :cond_2

    new-instance p0, Ljava/lang/String;

    invoke-direct {p0, v1, v3}, Ljava/lang/String;-><init>([BI)V

    sget p1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ᐝ:I

    add-int/lit8 p1, p1, 0x7d

    rem-int/lit16 p1, p1, 0x80

    sput p1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ʽ:I

    return-object p0

    :cond_2
    add-int/lit8 v0, v0, 0x1

    aget-byte v4, v2, p0

    move v5, p1

    move p1, p0

    move p0, v4

    move-object v4, v2

    move v2, v0

    move v0, v5

    :goto_1
    sub-int/2addr v0, p0

    add-int/lit8 p0, v0, -0x3

    move v0, p1

    move p1, p0

    move p0, v0

    move v0, v2

    move-object v2, v4

    goto :goto_0
.end method


# virtual methods
.method public final ˊ()Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Fingerprint;
    .locals 6

    .line 1
    new-instance v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Fingerprint;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ˎ:Ljava/security/MessageDigest;

    .line 4
    .line 5
    :try_start_0
    sget-object v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ॱ:[B

    .line 6
    .line 7
    const/16 v3, 0xa

    .line 8
    .line 9
    aget-byte v3, v2, v3

    .line 10
    .line 11
    int-to-byte v3, v3

    .line 12
    const/4 v4, 0x3

    .line 13
    aget-byte v4, v2, v4

    .line 14
    .line 15
    neg-int v4, v4

    .line 16
    int-to-byte v4, v4

    .line 17
    const/16 v5, 0xb

    .line 18
    .line 19
    aget-byte v5, v2, v5

    .line 20
    .line 21
    neg-int v5, v5

    .line 22
    int-to-byte v5, v5

    .line 23
    invoke-static {v3, v4, v5}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ॱ(ISI)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    invoke-virtual {v3}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    const/16 v4, 0x25

    .line 36
    .line 37
    aget-byte v2, v2, v4

    .line 38
    .line 39
    int-to-byte v2, v2

    .line 40
    const/4 v4, 0x0

    .line 41
    const/16 v5, 0x19

    .line 42
    .line 43
    invoke-static {v5, v2, v4}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ॱ(ISI)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-virtual {v2}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    const/4 v4, 0x0

    .line 52
    invoke-virtual {v3, v2, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-virtual {v2, v1, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    check-cast v1, [B
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 61
    .line 62
    iget-boolean p0, p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ˊ:Z

    .line 63
    .line 64
    invoke-direct {v0, v1, p0}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Fingerprint;-><init>([BZ)V

    .line 65
    .line 66
    .line 67
    return-object v0

    .line 68
    :catchall_0
    move-exception p0

    .line 69
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    if-eqz v0, :cond_0

    .line 74
    .line 75
    throw v0

    .line 76
    :cond_0
    throw p0
.end method

.method public final ˋ(Ljava/lang/String;)V
    .locals 2

    .line 1
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ᐝ:I

    .line 2
    .line 3
    or-int/lit8 v1, v0, 0x79

    .line 4
    .line 5
    shl-int/lit8 v1, v1, 0x1

    .line 6
    .line 7
    xor-int/lit8 v0, v0, 0x79

    .line 8
    .line 9
    sub-int/2addr v1, v0

    .line 10
    rem-int/lit16 v1, v1, 0x80

    .line 11
    .line 12
    sput v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ʽ:I

    .line 13
    .line 14
    iget-object v0, p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ˏ:Landroid/content/Context;

    .line 15
    .line 16
    iget-object v1, p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ˋ:Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ı$ǃ;

    .line 17
    .line 18
    invoke-static {v0, p1, v1}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;->ˋ(Landroid/content/Context;Ljava/lang/String;Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ı;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ʽ:I

    .line 25
    .line 26
    and-int/lit8 v1, v0, 0x1

    .line 27
    .line 28
    or-int/lit8 v0, v0, 0x1

    .line 29
    .line 30
    add-int/2addr v1, v0

    .line 31
    rem-int/lit16 v0, v1, 0x80

    .line 32
    .line 33
    sput v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ᐝ:I

    .line 34
    .line 35
    rem-int/lit8 v1, v1, 0x2

    .line 36
    .line 37
    if-nez v1, :cond_0

    .line 38
    .line 39
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    const/16 v1, 0x3c

    .line 44
    .line 45
    div-int/lit8 v1, v1, 0x0

    .line 46
    .line 47
    if-lez v0, :cond_1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-lez v0, :cond_1

    .line 55
    .line 56
    :goto_0
    iget-object p0, p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ˎ:Ljava/security/MessageDigest;

    .line 57
    .line 58
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p0, p1}, Ljava/security/MessageDigest;->update([B)V

    .line 63
    .line 64
    .line 65
    :cond_1
    sget p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ʽ:I

    .line 66
    .line 67
    add-int/lit8 p0, p0, 0x71

    .line 68
    .line 69
    rem-int/lit16 p0, p0, 0x80

    .line 70
    .line 71
    sput p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ᐝ:I

    .line 72
    .line 73
    return-void
.end method

.method public final ˎ(I)V
    .locals 2

    .line 67
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ʽ:I

    and-int/lit8 v1, v0, 0x6f

    or-int/lit8 v0, v0, 0x6f

    add-int/2addr v1, v0

    rem-int/lit16 v1, v1, 0x80

    sput v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ᐝ:I

    .line 68
    invoke-static {p1}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ˋ(I)[B

    move-result-object p1

    .line 69
    iget-object p0, p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ˎ:Ljava/security/MessageDigest;

    invoke-virtual {p0, p1}, Ljava/security/MessageDigest;->update([B)V

    sget p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ᐝ:I

    xor-int/lit8 p1, p0, 0x67

    and-int/lit8 p0, p0, 0x67

    shl-int/lit8 p0, p0, 0x1

    add-int/2addr p1, p0

    rem-int/lit16 p0, p1, 0x80

    sput p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ʽ:I

    rem-int/lit8 p1, p1, 0x2

    if-nez p1, :cond_0

    return-void

    :cond_0
    const/4 p0, 0x0

    throw p0
.end method

.method public final varargs ˎ([B)V
    .locals 3

    .line 1
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ʽ:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x1d

    .line 4
    .line 5
    rem-int/lit16 v0, v0, 0x80

    .line 6
    .line 7
    sput v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ᐝ:I

    .line 8
    .line 9
    if-eqz p1, :cond_1

    .line 10
    .line 11
    or-int/lit8 v1, v0, 0x11

    .line 12
    .line 13
    shl-int/lit8 v1, v1, 0x1

    .line 14
    .line 15
    xor-int/lit8 v2, v0, 0x11

    .line 16
    .line 17
    sub-int/2addr v1, v2

    .line 18
    rem-int/lit16 v2, v1, 0x80

    .line 19
    .line 20
    sput v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ʽ:I

    .line 21
    .line 22
    rem-int/lit8 v1, v1, 0x2

    .line 23
    .line 24
    if-nez v1, :cond_0

    .line 25
    .line 26
    array-length v1, p1

    .line 27
    if-lez v1, :cond_1

    .line 28
    .line 29
    add-int/lit8 v0, v0, 0x4d

    .line 30
    .line 31
    rem-int/lit16 v1, v0, 0x80

    .line 32
    .line 33
    sput v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ʽ:I

    .line 34
    .line 35
    rem-int/lit8 v0, v0, 0x2

    .line 36
    .line 37
    iget-object p0, p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ˎ:Ljava/security/MessageDigest;

    .line 38
    .line 39
    invoke-virtual {p0, p1}, Ljava/security/MessageDigest;->update([B)V

    .line 40
    .line 41
    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    const/16 p0, 0x12

    .line 45
    .line 46
    div-int/lit8 p0, p0, 0x0

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    array-length p0, p1

    .line 50
    const/4 p0, 0x0

    .line 51
    throw p0

    .line 52
    :cond_1
    :goto_0
    sget p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ʽ:I

    .line 53
    .line 54
    xor-int/lit8 p1, p0, 0x25

    .line 55
    .line 56
    and-int/lit8 p0, p0, 0x25

    .line 57
    .line 58
    shl-int/lit8 p0, p0, 0x1

    .line 59
    .line 60
    add-int/2addr p1, p0

    .line 61
    rem-int/lit16 p1, p1, 0x80

    .line 62
    .line 63
    sput p1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ᐝ:I

    .line 64
    .line 65
    return-void
.end method

.method public final varargs ˏ([B)V
    .locals 3

    .line 1
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ᐝ:I

    .line 2
    .line 3
    or-int/lit8 v1, v0, 0x15

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    shl-int/2addr v1, v2

    .line 7
    xor-int/lit8 v0, v0, 0x15

    .line 8
    .line 9
    sub-int/2addr v1, v0

    .line 10
    rem-int/lit16 v1, v1, 0x80

    .line 11
    .line 12
    sput v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ʽ:I

    .line 13
    .line 14
    if-eqz p1, :cond_1

    .line 15
    .line 16
    xor-int/lit8 v0, v1, 0xf

    .line 17
    .line 18
    and-int/lit8 v1, v1, 0xf

    .line 19
    .line 20
    shl-int/2addr v1, v2

    .line 21
    add-int/2addr v0, v1

    .line 22
    rem-int/lit16 v0, v0, 0x80

    .line 23
    .line 24
    sput v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ᐝ:I

    .line 25
    .line 26
    array-length v1, p1

    .line 27
    if-lez v1, :cond_1

    .line 28
    .line 29
    add-int/lit8 v0, v0, 0x5b

    .line 30
    .line 31
    rem-int/lit16 v1, v0, 0x80

    .line 32
    .line 33
    sput v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ʽ:I

    .line 34
    .line 35
    rem-int/lit8 v0, v0, 0x2

    .line 36
    .line 37
    iget-object v1, p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ˎ:Ljava/security/MessageDigest;

    .line 38
    .line 39
    if-eqz v0, :cond_0

    .line 40
    .line 41
    invoke-virtual {v1, p1}, Ljava/security/MessageDigest;->update([B)V

    .line 42
    .line 43
    .line 44
    const/4 p1, 0x0

    .line 45
    iput-boolean p1, p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ˊ:Z

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    invoke-virtual {v1, p1}, Ljava/security/MessageDigest;->update([B)V

    .line 49
    .line 50
    .line 51
    iput-boolean v2, p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ˊ:Z

    .line 52
    .line 53
    :cond_1
    :goto_0
    sget p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ʽ:I

    .line 54
    .line 55
    or-int/lit8 p1, p0, 0x41

    .line 56
    .line 57
    shl-int/2addr p1, v2

    .line 58
    xor-int/lit8 p0, p0, 0x41

    .line 59
    .line 60
    sub-int/2addr p1, p0

    .line 61
    rem-int/lit16 p0, p1, 0x80

    .line 62
    .line 63
    sput p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/FingerprintGenerator$ɩ;->ᐝ:I

    .line 64
    .line 65
    rem-int/lit8 p1, p1, 0x2

    .line 66
    .line 67
    if-eqz p1, :cond_2

    .line 68
    .line 69
    return-void

    .line 70
    :cond_2
    const/4 p0, 0x0

    .line 71
    throw p0
.end method
