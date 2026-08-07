.class final enum Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "\u0269"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/guardsquare/dexguard/runtime/devicefingerprinting/\u0269$\u0269;",
        ">;"
    }
.end annotation


# static fields
.field private static ʼ:I = 0x1

.field private static ʽ:I

.field public static final enum ˊ:Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;

.field private static enum ˋ:Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;

.field private static enum ˎ:Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;

.field public static final enum ˏ:Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;

.field private static final synthetic ॱ:[Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;

.field private static final ᐝ:[B


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 1
    invoke-static {}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;->ॱ()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;

    .line 5
    .line 6
    sget-object v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;->ᐝ:[B

    .line 7
    .line 8
    const/4 v2, 0x5

    .line 9
    aget-byte v3, v1, v2

    .line 10
    .line 11
    const/4 v4, 0x1

    .line 12
    sub-int/2addr v3, v4

    .line 13
    int-to-byte v3, v3

    .line 14
    const/16 v5, 0xa

    .line 15
    .line 16
    aget-byte v5, v1, v5

    .line 17
    .line 18
    int-to-byte v5, v5

    .line 19
    add-int/lit8 v6, v5, -0x2

    .line 20
    .line 21
    int-to-byte v6, v6

    .line 22
    invoke-static {v3, v5, v6}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;->ˎ(BIS)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    invoke-virtual {v3}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    const/4 v5, 0x0

    .line 31
    invoke-direct {v0, v3, v5}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;-><init>(Ljava/lang/String;I)V

    .line 32
    .line 33
    .line 34
    sput-object v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;->ˏ:Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;

    .line 35
    .line 36
    new-instance v3, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;

    .line 37
    .line 38
    const/16 v5, 0x13

    .line 39
    .line 40
    aget-byte v5, v1, v5

    .line 41
    .line 42
    int-to-byte v5, v5

    .line 43
    aget-byte v6, v1, v2

    .line 44
    .line 45
    int-to-byte v6, v6

    .line 46
    const/4 v7, 0x7

    .line 47
    aget-byte v7, v1, v7

    .line 48
    .line 49
    int-to-byte v7, v7

    .line 50
    invoke-static {v5, v6, v7}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;->ˎ(BIS)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v5

    .line 54
    invoke-virtual {v5}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v5

    .line 58
    invoke-direct {v3, v5, v4}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;-><init>(Ljava/lang/String;I)V

    .line 59
    .line 60
    .line 61
    sput-object v3, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;->ˋ:Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;

    .line 62
    .line 63
    new-instance v3, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;

    .line 64
    .line 65
    aget-byte v2, v1, v2

    .line 66
    .line 67
    sub-int/2addr v2, v4

    .line 68
    int-to-byte v2, v2

    .line 69
    const/16 v5, 0x14

    .line 70
    .line 71
    aget-byte v5, v1, v5

    .line 72
    .line 73
    neg-int v5, v5

    .line 74
    int-to-byte v5, v5

    .line 75
    const/16 v6, 0x17

    .line 76
    .line 77
    invoke-static {v6, v2, v5}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;->ˎ(BIS)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    invoke-virtual {v2}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    const/4 v5, 0x2

    .line 86
    invoke-direct {v3, v2, v5}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;-><init>(Ljava/lang/String;I)V

    .line 87
    .line 88
    .line 89
    sput-object v3, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;->ˎ:Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;

    .line 90
    .line 91
    new-instance v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;

    .line 92
    .line 93
    const/16 v3, 0xd

    .line 94
    .line 95
    aget-byte v3, v1, v3

    .line 96
    .line 97
    int-to-byte v3, v3

    .line 98
    int-to-byte v6, v3

    .line 99
    const/4 v7, 0x4

    .line 100
    aget-byte v1, v1, v7

    .line 101
    .line 102
    int-to-byte v1, v1

    .line 103
    invoke-static {v3, v6, v1}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;->ˎ(BIS)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    invoke-virtual {v1}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    const/4 v3, 0x3

    .line 112
    invoke-direct {v2, v1, v3}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;-><init>(Ljava/lang/String;I)V

    .line 113
    .line 114
    .line 115
    sput-object v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;->ˊ:Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;

    .line 116
    .line 117
    sget-object v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;->ˋ:Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;

    .line 118
    .line 119
    sget-object v3, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;->ˎ:Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;

    .line 120
    .line 121
    filled-new-array {v0, v1, v3, v2}, [Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    sput-object v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;->ॱ:[Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;

    .line 126
    .line 127
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;->ʽ:I

    .line 128
    .line 129
    or-int/lit8 v1, v0, 0x77

    .line 130
    .line 131
    shl-int/2addr v1, v4

    .line 132
    xor-int/lit8 v0, v0, 0x77

    .line 133
    .line 134
    sub-int/2addr v1, v0

    .line 135
    rem-int/lit16 v0, v1, 0x80

    .line 136
    .line 137
    sput v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;->ʼ:I

    .line 138
    .line 139
    rem-int/2addr v1, v5

    .line 140
    if-eqz v1, :cond_0

    .line 141
    .line 142
    return-void

    .line 143
    :cond_0
    const/4 v0, 0x0

    .line 144
    throw v0
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

.method public static valueOf(Ljava/lang/String;)Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;
    .locals 2

    .line 1
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;->ʼ:I

    .line 2
    .line 3
    or-int/lit8 v1, v0, 0x73

    .line 4
    .line 5
    shl-int/lit8 v1, v1, 0x1

    .line 6
    .line 7
    xor-int/lit8 v0, v0, 0x73

    .line 8
    .line 9
    sub-int/2addr v1, v0

    .line 10
    rem-int/lit16 v0, v1, 0x80

    .line 11
    .line 12
    sput v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;->ʽ:I

    .line 13
    .line 14
    rem-int/lit8 v1, v1, 0x2

    .line 15
    .line 16
    const-class v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;

    .line 17
    .line 18
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;

    .line 23
    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    const/16 v0, 0x3a

    .line 27
    .line 28
    div-int/lit8 v0, v0, 0x0

    .line 29
    .line 30
    :cond_0
    return-object p0
.end method

.method public static values()[Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;
    .locals 3

    .line 1
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;->ʽ:I

    .line 2
    .line 3
    xor-int/lit8 v1, v0, 0x37

    .line 4
    .line 5
    and-int/lit8 v0, v0, 0x37

    .line 6
    .line 7
    shl-int/lit8 v0, v0, 0x1

    .line 8
    .line 9
    add-int/2addr v1, v0

    .line 10
    rem-int/lit16 v1, v1, 0x80

    .line 11
    .line 12
    sput v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;->ʼ:I

    .line 13
    .line 14
    sget-object v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;->ॱ:[Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;

    .line 15
    .line 16
    invoke-virtual {v0}, [Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;->clone()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, [Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;

    .line 21
    .line 22
    sget v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;->ʽ:I

    .line 23
    .line 24
    or-int/lit8 v2, v1, 0x6d

    .line 25
    .line 26
    shl-int/lit8 v2, v2, 0x1

    .line 27
    .line 28
    xor-int/lit8 v1, v1, 0x6d

    .line 29
    .line 30
    sub-int/2addr v2, v1

    .line 31
    rem-int/lit16 v1, v2, 0x80

    .line 32
    .line 33
    sput v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;->ʼ:I

    .line 34
    .line 35
    rem-int/lit8 v2, v2, 0x2

    .line 36
    .line 37
    if-eqz v2, :cond_0

    .line 38
    .line 39
    return-object v0

    .line 40
    :cond_0
    const/4 v0, 0x0

    .line 41
    throw v0
.end method

.method private static ˎ(BIS)Ljava/lang/String;
    .locals 7

    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;->ʼ:I

    add-int/lit8 v0, v0, 0x4d

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;->ʽ:I

    rem-int/lit8 v0, v0, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v0, :cond_1

    add-int/lit8 v0, p1, 0x2

    rsub-int/lit8 p0, p0, 0x3a

    sget-object v4, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;->ᐝ:[B

    add-int/lit8 p2, p2, 0x11

    new-array v0, v0, [B

    add-int/lit8 p1, p1, 0x7b

    if-nez v4, :cond_0

    move v5, v3

    goto :goto_0

    :cond_0
    move v1, v3

    goto :goto_1

    :cond_1
    add-int/lit8 v0, p1, 0x4

    rsub-int/lit8 p0, p0, 0x58

    sget-object v4, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;->ᐝ:[B

    add-int/lit8 p2, p2, 0x4

    new-array v0, v0, [B

    add-int/lit8 p1, p1, 0x3

    if-nez v4, :cond_2

    move v5, v2

    :goto_0
    add-int/lit8 v1, v1, 0x47

    rem-int/lit16 v1, v1, 0x80

    sput v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;->ʼ:I

    move-object v1, v0

    move v0, p2

    move p2, p1

    goto :goto_2

    :cond_2
    move v1, v2

    :goto_1
    int-to-byte v5, p0

    aput-byte v5, v0, v1

    add-int/lit8 v5, v1, 0x1

    if-ne v1, p1, :cond_3

    new-instance p0, Ljava/lang/String;

    invoke-direct {p0, v0, v2}, Ljava/lang/String;-><init>([BI)V

    return-object p0

    :cond_3
    aget-byte v1, v4, p2

    move v6, p2

    move p2, p1

    move p1, v1

    move-object v1, v0

    move v0, v6

    :goto_2
    sub-int/2addr p0, p1

    add-int/lit8 p1, v0, 0x1

    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;->ʼ:I

    add-int/lit8 v0, v0, 0x77

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;->ʽ:I

    move v0, p2

    move p2, p1

    move p1, v0

    move-object v0, v1

    move v1, v5

    goto :goto_1
.end method

.method private static ॱ()V
    .locals 1

    const/16 v0, 0x16

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ɩ;->ᐝ:[B

    return-void

    :array_0
    .array-data 1
        0x7at
        0x7dt
        -0x67t
        -0x7bt
        0x8t
        0x1t
        -0x4t
        0xet
        0x1t
        -0x3t
        0x2t
        -0x7t
        0x7t
        0x3t
        -0x3t
        -0x1t
        -0x8t
        0x9t
        -0x16t
        0x15t
        -0x5t
        0x8t
    .end array-data
.end method
