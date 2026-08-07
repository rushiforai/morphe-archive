.class final enum Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "\u01c3"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/guardsquare/dexguard/runtime/devicefingerprinting/\u0269$\u01c3;",
        ">;"
    }
.end annotation


# static fields
.field private static ʼ:I = 0x0

.field public static final enum ˊ:Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;

.field private static final synthetic ˋ:[Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;

.field private static final ˎ:[B = null

.field public static final enum ˏ:Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;

.field public static final enum ॱ:Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;

.field private static ॱॱ:I = 0x0

.field private static ᐝ:I = 0x1


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 1
    invoke-static {}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;->ˋ()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;

    .line 5
    .line 6
    sget-object v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;->ˎ:[B

    .line 7
    .line 8
    const/4 v2, 0x5

    .line 9
    aget-byte v3, v1, v2

    .line 10
    .line 11
    int-to-byte v4, v3

    .line 12
    xor-int/lit8 v5, v4, 0x7

    .line 13
    .line 14
    and-int/lit8 v6, v4, 0x7

    .line 15
    .line 16
    or-int/2addr v5, v6

    .line 17
    int-to-byte v5, v5

    .line 18
    int-to-byte v3, v3

    .line 19
    invoke-static {v4, v5, v3}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;->ॱ(BBB)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    invoke-virtual {v3}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    const/4 v4, 0x0

    .line 28
    invoke-direct {v0, v3, v4}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;-><init>(Ljava/lang/String;I)V

    .line 29
    .line 30
    .line 31
    sput-object v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;->ˏ:Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;

    .line 32
    .line 33
    new-instance v3, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;

    .line 34
    .line 35
    sget v5, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;->ʼ:I

    .line 36
    .line 37
    and-int/lit8 v5, v5, 0x7

    .line 38
    .line 39
    int-to-byte v5, v5

    .line 40
    const/4 v6, 0x6

    .line 41
    aget-byte v6, v1, v6

    .line 42
    .line 43
    int-to-byte v6, v6

    .line 44
    add-int/lit8 v7, v6, -0x2

    .line 45
    .line 46
    int-to-byte v7, v7

    .line 47
    invoke-static {v5, v6, v7}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;->ॱ(BBB)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v5

    .line 51
    invoke-virtual {v5}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v5

    .line 55
    const/4 v6, 0x1

    .line 56
    invoke-direct {v3, v5, v6}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;-><init>(Ljava/lang/String;I)V

    .line 57
    .line 58
    .line 59
    sput-object v3, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;->ॱ:Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;

    .line 60
    .line 61
    new-instance v5, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;

    .line 62
    .line 63
    aget-byte v1, v1, v2

    .line 64
    .line 65
    int-to-byte v1, v1

    .line 66
    add-int/lit8 v2, v1, 0x4

    .line 67
    .line 68
    int-to-byte v2, v2

    .line 69
    const/16 v7, 0x14

    .line 70
    .line 71
    invoke-static {v7, v1, v2}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;->ॱ(BBB)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-virtual {v1}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    const/4 v2, 0x2

    .line 80
    invoke-direct {v5, v1, v2}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;-><init>(Ljava/lang/String;I)V

    .line 81
    .line 82
    .line 83
    sput-object v5, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;->ˊ:Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;

    .line 84
    .line 85
    filled-new-array {v0, v3, v5}, [Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    sput-object v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;->ˋ:[Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;

    .line 90
    .line 91
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;->ॱॱ:I

    .line 92
    .line 93
    add-int/2addr v0, v6

    .line 94
    rem-int/lit16 v1, v0, 0x80

    .line 95
    .line 96
    sput v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;->ᐝ:I

    .line 97
    .line 98
    rem-int/2addr v0, v2

    .line 99
    if-nez v0, :cond_0

    .line 100
    .line 101
    const/16 v0, 0x40

    .line 102
    .line 103
    div-int/2addr v0, v4

    .line 104
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

.method public static valueOf(Ljava/lang/String;)Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;
    .locals 2

    .line 1
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;->ॱॱ:I

    .line 2
    .line 3
    and-int/lit8 v1, v0, 0x19

    .line 4
    .line 5
    or-int/lit8 v0, v0, 0x19

    .line 6
    .line 7
    add-int/2addr v1, v0

    .line 8
    rem-int/lit16 v1, v1, 0x80

    .line 9
    .line 10
    sput v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;->ᐝ:I

    .line 11
    .line 12
    const-class v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;

    .line 13
    .line 14
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;

    .line 19
    .line 20
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;->ᐝ:I

    .line 21
    .line 22
    and-int/lit8 v1, v0, 0x59

    .line 23
    .line 24
    or-int/lit8 v0, v0, 0x59

    .line 25
    .line 26
    add-int/2addr v1, v0

    .line 27
    rem-int/lit16 v1, v1, 0x80

    .line 28
    .line 29
    sput v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;->ॱॱ:I

    .line 30
    .line 31
    return-object p0
.end method

.method public static values()[Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;
    .locals 2

    .line 1
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;->ᐝ:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x2f

    .line 4
    .line 5
    rem-int/lit16 v0, v0, 0x80

    .line 6
    .line 7
    sput v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;->ॱॱ:I

    .line 8
    .line 9
    sget-object v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;->ˋ:[Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;

    .line 10
    .line 11
    invoke-virtual {v0}, [Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;->clone()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, [Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;

    .line 16
    .line 17
    sget v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;->ॱॱ:I

    .line 18
    .line 19
    add-int/lit8 v1, v1, 0x53

    .line 20
    .line 21
    rem-int/lit16 v1, v1, 0x80

    .line 22
    .line 23
    sput v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;->ᐝ:I

    .line 24
    .line 25
    return-object v0
.end method

.method private static ˋ()V
    .locals 1

    const/16 v0, 0x11

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;->ˎ:[B

    const/16 v0, 0x9b

    sput v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;->ʼ:I

    return-void

    :array_0
    .array-data 1
        0x5dt
        -0x39t
        0x75t
        -0x74t
        -0xft
        0x0t
        0x5t
        -0x9t
        -0x8t
        0xft
        0x0t
        0x9t
        0x5t
        -0x1t
        0x1t
        -0x6t
        0xbt
    .end array-data
.end method

.method private static ॱ(BBB)Ljava/lang/String;
    .locals 6

    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;->ᐝ:I

    add-int/lit8 v0, v0, 0x53

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;->ॱॱ:I

    sget-object v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;->ˎ:[B

    add-int/lit8 v1, p2, 0x3

    add-int/lit8 p0, p0, 0x41

    rsub-int/lit8 p1, p1, 0xa

    new-array v1, v1, [B

    add-int/lit8 p2, p2, 0x2

    const/4 v2, 0x0

    if-nez v0, :cond_0

    move v3, p2

    move v4, v2

    goto :goto_1

    :cond_0
    move v3, v2

    :goto_0
    add-int/lit8 p1, p1, 0x1

    int-to-byte v4, p0

    aput-byte v4, v1, v3

    add-int/lit8 v4, v3, 0x1

    if-ne v3, p2, :cond_1

    new-instance p0, Ljava/lang/String;

    invoke-direct {p0, v1, v2}, Ljava/lang/String;-><init>([BI)V

    return-object p0

    :cond_1
    aget-byte v3, v0, p1

    sget v5, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;->ᐝ:I

    add-int/lit8 v5, v5, 0x43

    rem-int/lit16 v5, v5, 0x80

    sput v5, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/ɩ$ǃ;->ॱॱ:I

    :goto_1
    sub-int/2addr p0, v3

    add-int/lit8 p0, p0, 0x2

    move v3, v4

    goto :goto_0
.end method
