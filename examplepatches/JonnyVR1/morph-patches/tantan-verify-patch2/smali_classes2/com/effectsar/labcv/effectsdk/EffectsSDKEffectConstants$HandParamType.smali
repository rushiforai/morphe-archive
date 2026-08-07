.class public final enum Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "HandParamType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;

.field public static final enum BEF_HAND_ALGO_AUTO_MODE:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;

.field public static final enum BEF_HAND_ALGO_LOW_POWER_MODE:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;

.field public static final enum BEF_HAND_ALGO_MAX_TEST_FRAME:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;

.field public static final enum BEF_HAND_ALGO_TIME_ELAPSED_THRESHOLD:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;

.field public static final enum BEF_HAND_CLS_SMOOTH_FACTOR:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;

.field public static final enum BEF_HAND_DETECT_MIN_SIDE:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;

.field public static final enum BEF_HAND_IS_USE_DOUBLE_GESTURE:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;

.field public static final enum BEF_HAND_MAX_HAND_NUM:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;

.field public static final enum BEF_HAND_NARUTO_GESTUER:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;

.field public static final enum BEF_HAND_USE_ACTION_SMOOTH:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;

.field public static final enum BEF_HNAD_ENLARGE_FACTOR_REG:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 14

    .line 1
    new-instance v0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;

    .line 2
    .line 3
    const-string v1, "BEF_HAND_MAX_HAND_NUM"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x2

    .line 7
    invoke-direct {v0, v1, v2, v3}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;-><init>(Ljava/lang/String;II)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;->BEF_HAND_MAX_HAND_NUM:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;

    .line 11
    .line 12
    new-instance v1, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;

    .line 13
    .line 14
    const-string v2, "BEF_HAND_DETECT_MIN_SIDE"

    .line 15
    .line 16
    const/4 v4, 0x1

    .line 17
    const/4 v5, 0x3

    .line 18
    invoke-direct {v1, v2, v4, v5}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;-><init>(Ljava/lang/String;II)V

    .line 19
    .line 20
    .line 21
    sput-object v1, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;->BEF_HAND_DETECT_MIN_SIDE:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;

    .line 22
    .line 23
    new-instance v2, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;

    .line 24
    .line 25
    const-string v4, "BEF_HAND_CLS_SMOOTH_FACTOR"

    .line 26
    .line 27
    const/4 v6, 0x4

    .line 28
    invoke-direct {v2, v4, v3, v6}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;-><init>(Ljava/lang/String;II)V

    .line 29
    .line 30
    .line 31
    sput-object v2, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;->BEF_HAND_CLS_SMOOTH_FACTOR:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;

    .line 32
    .line 33
    new-instance v3, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;

    .line 34
    .line 35
    const-string v4, "BEF_HAND_USE_ACTION_SMOOTH"

    .line 36
    .line 37
    const/4 v7, 0x5

    .line 38
    invoke-direct {v3, v4, v5, v7}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;-><init>(Ljava/lang/String;II)V

    .line 39
    .line 40
    .line 41
    sput-object v3, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;->BEF_HAND_USE_ACTION_SMOOTH:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;

    .line 42
    .line 43
    new-instance v4, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;

    .line 44
    .line 45
    const-string v5, "BEF_HAND_ALGO_LOW_POWER_MODE"

    .line 46
    .line 47
    const/4 v8, 0x6

    .line 48
    invoke-direct {v4, v5, v6, v8}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;-><init>(Ljava/lang/String;II)V

    .line 49
    .line 50
    .line 51
    sput-object v4, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;->BEF_HAND_ALGO_LOW_POWER_MODE:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;

    .line 52
    .line 53
    new-instance v5, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;

    .line 54
    .line 55
    const-string v6, "BEF_HAND_ALGO_AUTO_MODE"

    .line 56
    .line 57
    const/4 v9, 0x7

    .line 58
    invoke-direct {v5, v6, v7, v9}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;-><init>(Ljava/lang/String;II)V

    .line 59
    .line 60
    .line 61
    sput-object v5, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;->BEF_HAND_ALGO_AUTO_MODE:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;

    .line 62
    .line 63
    new-instance v6, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;

    .line 64
    .line 65
    const-string v7, "BEF_HAND_ALGO_TIME_ELAPSED_THRESHOLD"

    .line 66
    .line 67
    const/16 v10, 0x8

    .line 68
    .line 69
    invoke-direct {v6, v7, v8, v10}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;-><init>(Ljava/lang/String;II)V

    .line 70
    .line 71
    .line 72
    sput-object v6, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;->BEF_HAND_ALGO_TIME_ELAPSED_THRESHOLD:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;

    .line 73
    .line 74
    new-instance v7, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;

    .line 75
    .line 76
    const-string v8, "BEF_HAND_ALGO_MAX_TEST_FRAME"

    .line 77
    .line 78
    const/16 v11, 0x9

    .line 79
    .line 80
    invoke-direct {v7, v8, v9, v11}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;-><init>(Ljava/lang/String;II)V

    .line 81
    .line 82
    .line 83
    sput-object v7, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;->BEF_HAND_ALGO_MAX_TEST_FRAME:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;

    .line 84
    .line 85
    new-instance v8, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;

    .line 86
    .line 87
    const-string v9, "BEF_HAND_IS_USE_DOUBLE_GESTURE"

    .line 88
    .line 89
    const/16 v12, 0xa

    .line 90
    .line 91
    invoke-direct {v8, v9, v10, v12}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;-><init>(Ljava/lang/String;II)V

    .line 92
    .line 93
    .line 94
    sput-object v8, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;->BEF_HAND_IS_USE_DOUBLE_GESTURE:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;

    .line 95
    .line 96
    new-instance v9, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;

    .line 97
    .line 98
    const-string v10, "BEF_HNAD_ENLARGE_FACTOR_REG"

    .line 99
    .line 100
    const/16 v13, 0xb

    .line 101
    .line 102
    invoke-direct {v9, v10, v11, v13}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;-><init>(Ljava/lang/String;II)V

    .line 103
    .line 104
    .line 105
    sput-object v9, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;->BEF_HNAD_ENLARGE_FACTOR_REG:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;

    .line 106
    .line 107
    new-instance v10, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;

    .line 108
    .line 109
    const-string v11, "BEF_HAND_NARUTO_GESTUER"

    .line 110
    .line 111
    const/16 v13, 0xc

    .line 112
    .line 113
    invoke-direct {v10, v11, v12, v13}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;-><init>(Ljava/lang/String;II)V

    .line 114
    .line 115
    .line 116
    sput-object v10, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;->BEF_HAND_NARUTO_GESTUER:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;

    .line 117
    .line 118
    filled-new-array/range {v0 .. v10}, [Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    sput-object v0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;->$VALUES:[Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;

    .line 123
    .line 124
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput p3, p0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;
    .locals 1

    .line 1
    const-class v0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;
    .locals 1

    .line 1
    sget-object v0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;->$VALUES:[Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HandParamType;->value:I

    .line 2
    .line 3
    return p0
.end method
