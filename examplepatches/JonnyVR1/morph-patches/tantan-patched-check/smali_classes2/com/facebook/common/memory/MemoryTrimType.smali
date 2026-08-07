.class public final enum Lcom/facebook/common/memory/MemoryTrimType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/facebook/common/memory/MemoryTrimType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/facebook/common/memory/MemoryTrimType;

.field public static final enum OnAppBackgrounded:Lcom/facebook/common/memory/MemoryTrimType;

.field public static final enum OnCloseToDalvikHeapLimit:Lcom/facebook/common/memory/MemoryTrimType;

.field public static final enum OnJavaMemoryRed:Lcom/facebook/common/memory/MemoryTrimType;

.field public static final enum OnJavaMemoryYellow:Lcom/facebook/common/memory/MemoryTrimType;

.field public static final enum OnSystemLowMemoryWhileAppInBackgroundLowSeverity:Lcom/facebook/common/memory/MemoryTrimType;

.field public static final enum OnSystemLowMemoryWhileAppInForeground:Lcom/facebook/common/memory/MemoryTrimType;

.field public static final enum OnSystemMemoryCriticallyLowWhileAppInForeground:Lcom/facebook/common/memory/MemoryTrimType;

.field public static final enum OnSystemMemoryRed:Lcom/facebook/common/memory/MemoryTrimType;

.field public static final enum OnSystemMemoryYellow:Lcom/facebook/common/memory/MemoryTrimType;

.field public static final enum OnSystemModerateMemory:Lcom/facebook/common/memory/MemoryTrimType;


# instance fields
.field private mSuggestedTrimRatio:D


# direct methods
.method static constructor <clinit>()V
    .locals 15

    .line 1
    new-instance v0, Lcom/facebook/common/memory/MemoryTrimType;

    .line 2
    .line 3
    const-string v1, "OnCloseToDalvikHeapLimit"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const-wide/high16 v3, 0x3fe0000000000000L    # 0.5

    .line 7
    .line 8
    invoke-direct {v0, v1, v2, v3, v4}, Lcom/facebook/common/memory/MemoryTrimType;-><init>(Ljava/lang/String;ID)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/facebook/common/memory/MemoryTrimType;->OnCloseToDalvikHeapLimit:Lcom/facebook/common/memory/MemoryTrimType;

    .line 12
    .line 13
    new-instance v1, Lcom/facebook/common/memory/MemoryTrimType;

    .line 14
    .line 15
    const-string v2, "OnSystemMemoryCriticallyLowWhileAppInForeground"

    .line 16
    .line 17
    const/4 v5, 0x1

    .line 18
    const-wide/high16 v6, 0x3ff0000000000000L    # 1.0

    .line 19
    .line 20
    invoke-direct {v1, v2, v5, v6, v7}, Lcom/facebook/common/memory/MemoryTrimType;-><init>(Ljava/lang/String;ID)V

    .line 21
    .line 22
    .line 23
    sput-object v1, Lcom/facebook/common/memory/MemoryTrimType;->OnSystemMemoryCriticallyLowWhileAppInForeground:Lcom/facebook/common/memory/MemoryTrimType;

    .line 24
    .line 25
    new-instance v2, Lcom/facebook/common/memory/MemoryTrimType;

    .line 26
    .line 27
    const-string v5, "OnSystemLowMemoryWhileAppInForeground"

    .line 28
    .line 29
    const/4 v8, 0x2

    .line 30
    invoke-direct {v2, v5, v8, v3, v4}, Lcom/facebook/common/memory/MemoryTrimType;-><init>(Ljava/lang/String;ID)V

    .line 31
    .line 32
    .line 33
    sput-object v2, Lcom/facebook/common/memory/MemoryTrimType;->OnSystemLowMemoryWhileAppInForeground:Lcom/facebook/common/memory/MemoryTrimType;

    .line 34
    .line 35
    move-wide v4, v3

    .line 36
    new-instance v3, Lcom/facebook/common/memory/MemoryTrimType;

    .line 37
    .line 38
    const-string v8, "OnSystemLowMemoryWhileAppInBackgroundLowSeverity"

    .line 39
    .line 40
    const/4 v9, 0x3

    .line 41
    invoke-direct {v3, v8, v9, v6, v7}, Lcom/facebook/common/memory/MemoryTrimType;-><init>(Ljava/lang/String;ID)V

    .line 42
    .line 43
    .line 44
    sput-object v3, Lcom/facebook/common/memory/MemoryTrimType;->OnSystemLowMemoryWhileAppInBackgroundLowSeverity:Lcom/facebook/common/memory/MemoryTrimType;

    .line 45
    .line 46
    move-wide v8, v4

    .line 47
    new-instance v4, Lcom/facebook/common/memory/MemoryTrimType;

    .line 48
    .line 49
    const-string v5, "OnSystemModerateMemory"

    .line 50
    .line 51
    const/4 v10, 0x4

    .line 52
    invoke-direct {v4, v5, v10, v8, v9}, Lcom/facebook/common/memory/MemoryTrimType;-><init>(Ljava/lang/String;ID)V

    .line 53
    .line 54
    .line 55
    sput-object v4, Lcom/facebook/common/memory/MemoryTrimType;->OnSystemModerateMemory:Lcom/facebook/common/memory/MemoryTrimType;

    .line 56
    .line 57
    new-instance v5, Lcom/facebook/common/memory/MemoryTrimType;

    .line 58
    .line 59
    const-string v10, "OnAppBackgrounded"

    .line 60
    .line 61
    const/4 v11, 0x5

    .line 62
    invoke-direct {v5, v10, v11, v6, v7}, Lcom/facebook/common/memory/MemoryTrimType;-><init>(Ljava/lang/String;ID)V

    .line 63
    .line 64
    .line 65
    sput-object v5, Lcom/facebook/common/memory/MemoryTrimType;->OnAppBackgrounded:Lcom/facebook/common/memory/MemoryTrimType;

    .line 66
    .line 67
    move-wide v10, v6

    .line 68
    new-instance v6, Lcom/facebook/common/memory/MemoryTrimType;

    .line 69
    .line 70
    const-string v7, "OnJavaMemoryRed"

    .line 71
    .line 72
    const/4 v12, 0x6

    .line 73
    invoke-direct {v6, v7, v12, v10, v11}, Lcom/facebook/common/memory/MemoryTrimType;-><init>(Ljava/lang/String;ID)V

    .line 74
    .line 75
    .line 76
    sput-object v6, Lcom/facebook/common/memory/MemoryTrimType;->OnJavaMemoryRed:Lcom/facebook/common/memory/MemoryTrimType;

    .line 77
    .line 78
    new-instance v7, Lcom/facebook/common/memory/MemoryTrimType;

    .line 79
    .line 80
    const-string v12, "OnJavaMemoryYellow"

    .line 81
    .line 82
    const/4 v13, 0x7

    .line 83
    invoke-direct {v7, v12, v13, v8, v9}, Lcom/facebook/common/memory/MemoryTrimType;-><init>(Ljava/lang/String;ID)V

    .line 84
    .line 85
    .line 86
    sput-object v7, Lcom/facebook/common/memory/MemoryTrimType;->OnJavaMemoryYellow:Lcom/facebook/common/memory/MemoryTrimType;

    .line 87
    .line 88
    move-wide v12, v8

    .line 89
    new-instance v8, Lcom/facebook/common/memory/MemoryTrimType;

    .line 90
    .line 91
    const-string v9, "OnSystemMemoryRed"

    .line 92
    .line 93
    const/16 v14, 0x8

    .line 94
    .line 95
    invoke-direct {v8, v9, v14, v10, v11}, Lcom/facebook/common/memory/MemoryTrimType;-><init>(Ljava/lang/String;ID)V

    .line 96
    .line 97
    .line 98
    sput-object v8, Lcom/facebook/common/memory/MemoryTrimType;->OnSystemMemoryRed:Lcom/facebook/common/memory/MemoryTrimType;

    .line 99
    .line 100
    new-instance v9, Lcom/facebook/common/memory/MemoryTrimType;

    .line 101
    .line 102
    const-string v10, "OnSystemMemoryYellow"

    .line 103
    .line 104
    const/16 v11, 0x9

    .line 105
    .line 106
    invoke-direct {v9, v10, v11, v12, v13}, Lcom/facebook/common/memory/MemoryTrimType;-><init>(Ljava/lang/String;ID)V

    .line 107
    .line 108
    .line 109
    sput-object v9, Lcom/facebook/common/memory/MemoryTrimType;->OnSystemMemoryYellow:Lcom/facebook/common/memory/MemoryTrimType;

    .line 110
    .line 111
    filled-new-array/range {v0 .. v9}, [Lcom/facebook/common/memory/MemoryTrimType;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    sput-object v0, Lcom/facebook/common/memory/MemoryTrimType;->$VALUES:[Lcom/facebook/common/memory/MemoryTrimType;

    .line 116
    .line 117
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ID)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(D)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-wide p3, p0, Lcom/facebook/common/memory/MemoryTrimType;->mSuggestedTrimRatio:D

    .line 5
    .line 6
    return-void
.end method

.method public static fromInt(I)Lcom/facebook/common/memory/MemoryTrimType;
    .locals 5

    .line 1
    invoke-static {}, Lcom/facebook/common/memory/MemoryTrimType;->values()[Lcom/facebook/common/memory/MemoryTrimType;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    array-length v1, v0

    .line 6
    const/4 v2, 0x0

    .line 7
    :goto_0
    if-ge v2, v1, :cond_1

    .line 8
    .line 9
    aget-object v3, v0, v2

    .line 10
    .line 11
    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    .line 12
    .line 13
    .line 14
    move-result v4

    .line 15
    if-ne v4, p0, :cond_0

    .line 16
    .line 17
    return-object v3

    .line 18
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    const-string v0, "Unknown type: "

    .line 22
    .line 23
    invoke-static {v0, p0}, Ll/za50;->a(Ljava/lang/String;I)V

    .line 24
    .line 25
    .line 26
    const/4 p0, 0x0

    .line 27
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/facebook/common/memory/MemoryTrimType;
    .locals 1

    .line 1
    const-class v0, Lcom/facebook/common/memory/MemoryTrimType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/facebook/common/memory/MemoryTrimType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/facebook/common/memory/MemoryTrimType;
    .locals 1

    .line 1
    sget-object v0, Lcom/facebook/common/memory/MemoryTrimType;->$VALUES:[Lcom/facebook/common/memory/MemoryTrimType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/facebook/common/memory/MemoryTrimType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/facebook/common/memory/MemoryTrimType;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getSuggestedTrimRatio()D
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/facebook/common/memory/MemoryTrimType;->mSuggestedTrimRatio:D

    .line 2
    .line 3
    return-wide v0
.end method
