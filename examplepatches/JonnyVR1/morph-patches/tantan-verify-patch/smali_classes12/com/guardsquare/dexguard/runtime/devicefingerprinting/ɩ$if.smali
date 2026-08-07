.class final enum Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "if"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/guardsquare/dexguard/runtime/devicefingerprinting/\u0269$if;",
        ">;"
    }
.end annotation


# static fields
.field private static ʻ:I = 0x0

.field private static ʼ:I = 0x1

.field private static ʽ:I

.field public static final enum ˊ:Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;

.field public static final enum ˋ:Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;

.field private static final synthetic ˎ:[Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;

.field private static final ˏ:[B

.field public static final enum ॱ:Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 1
    invoke-static {}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;->ˊ()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;

    .line 5
    .line 6
    sget v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;->ʻ:I

    .line 7
    .line 8
    and-int/lit8 v2, v1, 0x2d

    .line 9
    .line 10
    int-to-byte v2, v2

    .line 11
    sget-object v3, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;->ˏ:[B

    .line 12
    .line 13
    const/4 v4, 0x5

    .line 14
    aget-byte v5, v3, v4

    .line 15
    .line 16
    int-to-byte v5, v5

    .line 17
    and-int/lit8 v1, v1, 0x28

    .line 18
    .line 19
    int-to-byte v1, v1

    .line 20
    invoke-static {v2, v5, v1}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;->ˎ(SIS)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v1}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const/4 v2, 0x0

    .line 29
    invoke-direct {v0, v1, v2}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;-><init>(Ljava/lang/String;I)V

    .line 30
    .line 31
    .line 32
    sput-object v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;->ˊ:Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;

    .line 33
    .line 34
    new-instance v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;

    .line 35
    .line 36
    const/4 v5, 0x2

    .line 37
    aget-byte v6, v3, v5

    .line 38
    .line 39
    int-to-byte v7, v6

    .line 40
    aget-byte v4, v3, v4

    .line 41
    .line 42
    int-to-byte v4, v4

    .line 43
    int-to-byte v6, v6

    .line 44
    invoke-static {v7, v4, v6}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;->ˎ(SIS)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    invoke-virtual {v4}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v4

    .line 52
    const/4 v6, 0x1

    .line 53
    invoke-direct {v1, v4, v6}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;-><init>(Ljava/lang/String;I)V

    .line 54
    .line 55
    .line 56
    sput-object v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;->ॱ:Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;

    .line 57
    .line 58
    new-instance v4, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;

    .line 59
    .line 60
    const/4 v6, 0x7

    .line 61
    aget-byte v6, v3, v6

    .line 62
    .line 63
    int-to-byte v6, v6

    .line 64
    aget-byte v7, v3, v5

    .line 65
    .line 66
    int-to-byte v7, v7

    .line 67
    const/16 v8, 0x17

    .line 68
    .line 69
    aget-byte v3, v3, v8

    .line 70
    .line 71
    int-to-byte v3, v3

    .line 72
    invoke-static {v6, v7, v3}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;->ˎ(SIS)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    invoke-virtual {v3}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v3

    .line 80
    invoke-direct {v4, v3, v5}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;-><init>(Ljava/lang/String;I)V

    .line 81
    .line 82
    .line 83
    sput-object v4, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;->ˋ:Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;

    .line 84
    .line 85
    filled-new-array {v0, v1, v4}, [Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    sput-object v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;->ˎ:[Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;

    .line 90
    .line 91
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;->ʽ:I

    .line 92
    .line 93
    and-int/lit8 v1, v0, 0x27

    .line 94
    .line 95
    or-int/lit8 v0, v0, 0x27

    .line 96
    .line 97
    add-int/2addr v1, v0

    .line 98
    rem-int/lit16 v0, v1, 0x80

    .line 99
    .line 100
    sput v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;->ʼ:I

    .line 101
    .line 102
    rem-int/2addr v1, v5

    .line 103
    if-nez v1, :cond_0

    .line 104
    .line 105
    const/16 v0, 0x14

    .line 106
    .line 107
    div-int/2addr v0, v2

    .line 108
    :cond_0
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;
    .locals 2

    .line 1
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;->ʼ:I

    .line 2
    .line 3
    xor-int/lit8 v1, v0, 0x4f

    .line 4
    .line 5
    and-int/lit8 v0, v0, 0x4f

    .line 6
    .line 7
    shl-int/lit8 v0, v0, 0x1

    .line 8
    .line 9
    add-int/2addr v1, v0

    .line 10
    rem-int/lit16 v0, v1, 0x80

    .line 11
    .line 12
    sput v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;->ʽ:I

    .line 13
    .line 14
    rem-int/lit8 v1, v1, 0x2

    .line 15
    .line 16
    const-class v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;

    .line 17
    .line 18
    if-nez v1, :cond_0

    .line 19
    .line 20
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    check-cast p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;

    .line 25
    .line 26
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;->ʽ:I

    .line 27
    .line 28
    or-int/lit8 v1, v0, 0x27

    .line 29
    .line 30
    shl-int/lit8 v1, v1, 0x1

    .line 31
    .line 32
    xor-int/lit8 v0, v0, 0x27

    .line 33
    .line 34
    sub-int/2addr v1, v0

    .line 35
    rem-int/lit16 v1, v1, 0x80

    .line 36
    .line 37
    sput v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;->ʼ:I

    .line 38
    .line 39
    return-object p0

    .line 40
    :cond_0
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 41
    .line 42
    .line 43
    const/4 p0, 0x0

    .line 44
    throw p0
.end method

.method public static values()[Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;
    .locals 3

    .line 1
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;->ʽ:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x53

    .line 4
    .line 5
    rem-int/lit16 v0, v0, 0x80

    .line 6
    .line 7
    sput v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;->ʼ:I

    .line 8
    .line 9
    sget-object v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;->ˎ:[Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;

    .line 10
    .line 11
    invoke-virtual {v0}, [Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;->clone()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, [Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;

    .line 16
    .line 17
    sget v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;->ʽ:I

    .line 18
    .line 19
    add-int/lit8 v1, v1, 0x11

    .line 20
    .line 21
    rem-int/lit16 v2, v1, 0x80

    .line 22
    .line 23
    sput v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;->ʼ:I

    .line 24
    .line 25
    rem-int/lit8 v1, v1, 0x2

    .line 26
    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    return-object v0

    .line 30
    :cond_0
    const/4 v0, 0x0

    .line 31
    throw v0
.end method

.method private static ˊ()V
    .locals 1

    const/16 v0, 0x26

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;->ˏ:[B

    const/16 v0, 0x9e

    sput v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;->ʻ:I

    return-void

    :array_0
    .array-data 1
        0x27t
        -0x5ft
        0x0t
        -0x64t
        -0x9t
        0x1t
        -0xft
        0x7t
        0x4t
        -0xft
        -0x1t
        -0x15t
        0x11t
        -0x3t
        -0x5t
        -0x9t
        -0xft
        0x1at
        -0xft
        -0x4t
        -0x17t
        0x1at
        -0x19t
        0xdt
        -0x11t
        -0x6t
        0xbt
        -0x3t
        -0xft
        -0x4t
        -0x17t
        0x1at
        -0x19t
        0xdt
        -0x11t
        -0x6t
        0xbt
        -0x3t
    .end array-data
.end method

.method private static ˎ(SIS)Ljava/lang/String;
    .locals 7

    sget-object v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;->ˏ:[B

    mul-int/lit8 p1, p1, 0x4

    rsub-int/lit8 p1, p1, 0xf

    add-int/lit8 p2, p2, 0x41

    mul-int/lit8 p0, p0, 0x2

    rsub-int/lit8 p0, p0, 0x1b

    new-array v1, p1, [B

    const/4 v2, 0x0

    if-nez v0, :cond_1

    sget p2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;->ʽ:I

    add-int/lit8 p2, p2, 0x4d

    rem-int/lit16 v3, p2, 0x80

    sput v3, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;->ʼ:I

    rem-int/lit8 p2, p2, 0x2

    if-eqz p2, :cond_0

    move p2, p0

    move-object v3, v0

    move v4, v2

    move v0, p1

    goto :goto_1

    :cond_0
    const/4 p0, 0x0

    throw p0

    :cond_1
    move v3, v2

    :goto_0
    add-int/lit8 p0, p0, 0x1

    add-int/lit8 v4, v3, 0x1

    int-to-byte v5, p2

    aput-byte v5, v1, v3

    if-ne v4, p1, :cond_2

    new-instance p0, Ljava/lang/String;

    invoke-direct {p0, v1, v2}, Ljava/lang/String;-><init>([BI)V

    sget p1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;->ʼ:I

    add-int/lit8 p1, p1, 0x51

    rem-int/lit16 p1, p1, 0x80

    sput p1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$if;->ʽ:I

    return-object p0

    :cond_2
    aget-byte v3, v0, p0

    move v6, p2

    move p2, p0

    move p0, v3

    move-object v3, v0

    move v0, v6

    :goto_1
    sub-int/2addr v0, p0

    add-int/lit8 p0, v0, -0x4

    move v0, p2

    move p2, p0

    move p0, v0

    move-object v0, v3

    move v3, v4

    goto :goto_0
.end method
