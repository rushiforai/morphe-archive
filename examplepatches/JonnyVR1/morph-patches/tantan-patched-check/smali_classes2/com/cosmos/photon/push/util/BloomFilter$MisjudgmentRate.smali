.class public final enum Lcom/cosmos/photon/push/util/BloomFilter$MisjudgmentRate;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cosmos/photon/push/util/BloomFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "MisjudgmentRate"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/cosmos/photon/push/util/BloomFilter$MisjudgmentRate;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/cosmos/photon/push/util/BloomFilter$MisjudgmentRate;

.field public static final enum HIGH:Lcom/cosmos/photon/push/util/BloomFilter$MisjudgmentRate;

.field public static final enum MIDDLE:Lcom/cosmos/photon/push/util/BloomFilter$MisjudgmentRate;

.field public static final enum SMALL:Lcom/cosmos/photon/push/util/BloomFilter$MisjudgmentRate;

.field public static final enum VERY_SMALL:Lcom/cosmos/photon/push/util/BloomFilter$MisjudgmentRate;


# instance fields
.field private seeds:[I


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 1
    new-instance v0, Lcom/cosmos/photon/push/util/BloomFilter$MisjudgmentRate;

    .line 2
    .line 3
    const/4 v1, 0x5

    .line 4
    const/4 v2, 0x7

    .line 5
    const/4 v3, 0x2

    .line 6
    const/4 v4, 0x3

    .line 7
    filled-new-array {v3, v4, v1, v2}, [I

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const-string v2, "VERY_SMALL"

    .line 12
    .line 13
    const/4 v5, 0x0

    .line 14
    invoke-direct {v0, v2, v5, v1}, Lcom/cosmos/photon/push/util/BloomFilter$MisjudgmentRate;-><init>(Ljava/lang/String;I[I)V

    .line 15
    .line 16
    .line 17
    sput-object v0, Lcom/cosmos/photon/push/util/BloomFilter$MisjudgmentRate;->VERY_SMALL:Lcom/cosmos/photon/push/util/BloomFilter$MisjudgmentRate;

    .line 18
    .line 19
    new-instance v1, Lcom/cosmos/photon/push/util/BloomFilter$MisjudgmentRate;

    .line 20
    .line 21
    const/16 v2, 0x8

    .line 22
    .line 23
    new-array v2, v2, [I

    .line 24
    .line 25
    fill-array-data v2, :array_0

    .line 26
    .line 27
    .line 28
    const-string v5, "SMALL"

    .line 29
    .line 30
    const/4 v6, 0x1

    .line 31
    invoke-direct {v1, v5, v6, v2}, Lcom/cosmos/photon/push/util/BloomFilter$MisjudgmentRate;-><init>(Ljava/lang/String;I[I)V

    .line 32
    .line 33
    .line 34
    sput-object v1, Lcom/cosmos/photon/push/util/BloomFilter$MisjudgmentRate;->SMALL:Lcom/cosmos/photon/push/util/BloomFilter$MisjudgmentRate;

    .line 35
    .line 36
    new-instance v2, Lcom/cosmos/photon/push/util/BloomFilter$MisjudgmentRate;

    .line 37
    .line 38
    const/16 v5, 0x10

    .line 39
    .line 40
    new-array v5, v5, [I

    .line 41
    .line 42
    fill-array-data v5, :array_1

    .line 43
    .line 44
    .line 45
    const-string v6, "MIDDLE"

    .line 46
    .line 47
    invoke-direct {v2, v6, v3, v5}, Lcom/cosmos/photon/push/util/BloomFilter$MisjudgmentRate;-><init>(Ljava/lang/String;I[I)V

    .line 48
    .line 49
    .line 50
    sput-object v2, Lcom/cosmos/photon/push/util/BloomFilter$MisjudgmentRate;->MIDDLE:Lcom/cosmos/photon/push/util/BloomFilter$MisjudgmentRate;

    .line 51
    .line 52
    new-instance v3, Lcom/cosmos/photon/push/util/BloomFilter$MisjudgmentRate;

    .line 53
    .line 54
    const/16 v5, 0x20

    .line 55
    .line 56
    new-array v5, v5, [I

    .line 57
    .line 58
    fill-array-data v5, :array_2

    .line 59
    .line 60
    .line 61
    const-string v6, "HIGH"

    .line 62
    .line 63
    invoke-direct {v3, v6, v4, v5}, Lcom/cosmos/photon/push/util/BloomFilter$MisjudgmentRate;-><init>(Ljava/lang/String;I[I)V

    .line 64
    .line 65
    .line 66
    sput-object v3, Lcom/cosmos/photon/push/util/BloomFilter$MisjudgmentRate;->HIGH:Lcom/cosmos/photon/push/util/BloomFilter$MisjudgmentRate;

    .line 67
    .line 68
    filled-new-array {v0, v1, v2, v3}, [Lcom/cosmos/photon/push/util/BloomFilter$MisjudgmentRate;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    sput-object v0, Lcom/cosmos/photon/push/util/BloomFilter$MisjudgmentRate;->$VALUES:[Lcom/cosmos/photon/push/util/BloomFilter$MisjudgmentRate;

    .line 73
    .line 74
    return-void

    .line 75
    :array_0
    .array-data 4
        0x2
        0x3
        0x5
        0x7
        0xb
        0xd
        0x11
        0x13
    .end array-data

    .line 76
    .line 77
    .line 78
    .line 79
    .line 80
    .line 81
    .line 82
    .line 83
    .line 84
    .line 85
    .line 86
    .line 87
    .line 88
    .line 89
    .line 90
    .line 91
    .line 92
    .line 93
    .line 94
    .line 95
    :array_1
    .array-data 4
        0x2
        0x3
        0x5
        0x7
        0xb
        0xd
        0x11
        0x13
        0x17
        0x1d
        0x1f
        0x25
        0x29
        0x2b
        0x2f
        0x35
    .end array-data

    .line 96
    .line 97
    .line 98
    .line 99
    .line 100
    .line 101
    .line 102
    .line 103
    .line 104
    .line 105
    .line 106
    .line 107
    .line 108
    .line 109
    .line 110
    .line 111
    .line 112
    .line 113
    .line 114
    .line 115
    .line 116
    .line 117
    .line 118
    .line 119
    .line 120
    .line 121
    .line 122
    .line 123
    .line 124
    .line 125
    .line 126
    .line 127
    .line 128
    .line 129
    .line 130
    .line 131
    :array_2
    .array-data 4
        0x2
        0x3
        0x5
        0x7
        0xb
        0xd
        0x11
        0x13
        0x17
        0x1d
        0x1f
        0x25
        0x29
        0x2b
        0x2f
        0x35
        0x3b
        0x3d
        0x43
        0x47
        0x49
        0x4f
        0x53
        0x59
        0x61
        0x65
        0x67
        0x6b
        0x6d
        0x71
        0x7f
        0x83
    .end array-data
.end method

.method private constructor <init>(Ljava/lang/String;I[I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Lcom/cosmos/photon/push/util/BloomFilter$MisjudgmentRate;->seeds:[I

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic access$000(Lcom/cosmos/photon/push/util/BloomFilter$MisjudgmentRate;)[I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/cosmos/photon/push/util/BloomFilter$MisjudgmentRate;->seeds:[I

    .line 2
    .line 3
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/cosmos/photon/push/util/BloomFilter$MisjudgmentRate;
    .locals 1

    .line 1
    const-class v0, Lcom/cosmos/photon/push/util/BloomFilter$MisjudgmentRate;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/cosmos/photon/push/util/BloomFilter$MisjudgmentRate;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/cosmos/photon/push/util/BloomFilter$MisjudgmentRate;
    .locals 1

    .line 1
    sget-object v0, Lcom/cosmos/photon/push/util/BloomFilter$MisjudgmentRate;->$VALUES:[Lcom/cosmos/photon/push/util/BloomFilter$MisjudgmentRate;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/cosmos/photon/push/util/BloomFilter$MisjudgmentRate;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/cosmos/photon/push/util/BloomFilter$MisjudgmentRate;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getSeeds()[I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/cosmos/photon/push/util/BloomFilter$MisjudgmentRate;->seeds:[I

    .line 2
    .line 3
    return-object p0
.end method

.method public setSeeds([I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cosmos/photon/push/util/BloomFilter$MisjudgmentRate;->seeds:[I

    .line 2
    .line 3
    return-void
.end method
