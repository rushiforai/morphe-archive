.class public final enum Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "FaceFittingParam"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;

.field public static final enum BEF_AI_FACEFITTING_Config_Cal_TB:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;

.field public static final enum BEF_AI_FACEFITTING_Eyelash_Flag:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;

.field public static final enum BEF_AI_FACEFITTING_Mouth_BS_Limit:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;

.field public static final enum BEF_AI_FACEFITTING_Solver_Camera_Type:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;

.field public static final enum BEF_AI_FACEFITTING_Solver_Eps:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;

.field public static final enum BEF_AI_FACEFITTING_Solver_Lambda:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;

.field public static final enum BEF_AI_FACEFITTING_Solver_MaxIter:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;

.field public static final enum BEF_AI_FACEFITTING_Solver_Ratio:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;

.field public static final enum BEF_AI_FACEFITTING_Solver_Smooth:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;

.field public static final enum BEF_AI_FACEFITTING_Use_Semantic_Lmk:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 13

    .line 1
    new-instance v0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;

    .line 2
    .line 3
    const-string v1, "BEF_AI_FACEFITTING_Solver_Lambda"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    invoke-direct {v0, v1, v2, v3}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;-><init>(Ljava/lang/String;II)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;->BEF_AI_FACEFITTING_Solver_Lambda:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;

    .line 11
    .line 12
    new-instance v1, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;

    .line 13
    .line 14
    const-string v2, "BEF_AI_FACEFITTING_Solver_MaxIter"

    .line 15
    .line 16
    const/4 v4, 0x2

    .line 17
    invoke-direct {v1, v2, v3, v4}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;-><init>(Ljava/lang/String;II)V

    .line 18
    .line 19
    .line 20
    sput-object v1, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;->BEF_AI_FACEFITTING_Solver_MaxIter:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;

    .line 21
    .line 22
    new-instance v2, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;

    .line 23
    .line 24
    const-string v3, "BEF_AI_FACEFITTING_Solver_Eps"

    .line 25
    .line 26
    const/4 v5, 0x3

    .line 27
    invoke-direct {v2, v3, v4, v5}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;-><init>(Ljava/lang/String;II)V

    .line 28
    .line 29
    .line 30
    sput-object v2, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;->BEF_AI_FACEFITTING_Solver_Eps:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;

    .line 31
    .line 32
    new-instance v3, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;

    .line 33
    .line 34
    const-string v4, "BEF_AI_FACEFITTING_Solver_Ratio"

    .line 35
    .line 36
    const/4 v6, 0x4

    .line 37
    invoke-direct {v3, v4, v5, v6}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;-><init>(Ljava/lang/String;II)V

    .line 38
    .line 39
    .line 40
    sput-object v3, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;->BEF_AI_FACEFITTING_Solver_Ratio:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;

    .line 41
    .line 42
    new-instance v4, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;

    .line 43
    .line 44
    const-string v5, "BEF_AI_FACEFITTING_Solver_Smooth"

    .line 45
    .line 46
    const/4 v7, 0x5

    .line 47
    invoke-direct {v4, v5, v6, v7}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;-><init>(Ljava/lang/String;II)V

    .line 48
    .line 49
    .line 50
    sput-object v4, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;->BEF_AI_FACEFITTING_Solver_Smooth:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;

    .line 51
    .line 52
    new-instance v5, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;

    .line 53
    .line 54
    const-string v6, "BEF_AI_FACEFITTING_Solver_Camera_Type"

    .line 55
    .line 56
    const/4 v8, 0x6

    .line 57
    invoke-direct {v5, v6, v7, v8}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;-><init>(Ljava/lang/String;II)V

    .line 58
    .line 59
    .line 60
    sput-object v5, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;->BEF_AI_FACEFITTING_Solver_Camera_Type:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;

    .line 61
    .line 62
    new-instance v6, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;

    .line 63
    .line 64
    const-string v7, "BEF_AI_FACEFITTING_Config_Cal_TB"

    .line 65
    .line 66
    const/4 v9, 0x7

    .line 67
    invoke-direct {v6, v7, v8, v9}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;-><init>(Ljava/lang/String;II)V

    .line 68
    .line 69
    .line 70
    sput-object v6, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;->BEF_AI_FACEFITTING_Config_Cal_TB:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;

    .line 71
    .line 72
    new-instance v7, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;

    .line 73
    .line 74
    const-string v8, "BEF_AI_FACEFITTING_Eyelash_Flag"

    .line 75
    .line 76
    const/16 v10, 0x8

    .line 77
    .line 78
    invoke-direct {v7, v8, v9, v10}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;-><init>(Ljava/lang/String;II)V

    .line 79
    .line 80
    .line 81
    sput-object v7, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;->BEF_AI_FACEFITTING_Eyelash_Flag:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;

    .line 82
    .line 83
    new-instance v8, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;

    .line 84
    .line 85
    const-string v9, "BEF_AI_FACEFITTING_Use_Semantic_Lmk"

    .line 86
    .line 87
    const/16 v11, 0x9

    .line 88
    .line 89
    invoke-direct {v8, v9, v10, v11}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;-><init>(Ljava/lang/String;II)V

    .line 90
    .line 91
    .line 92
    sput-object v8, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;->BEF_AI_FACEFITTING_Use_Semantic_Lmk:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;

    .line 93
    .line 94
    new-instance v9, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;

    .line 95
    .line 96
    const-string v10, "BEF_AI_FACEFITTING_Mouth_BS_Limit"

    .line 97
    .line 98
    const/16 v12, 0xa

    .line 99
    .line 100
    invoke-direct {v9, v10, v11, v12}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;-><init>(Ljava/lang/String;II)V

    .line 101
    .line 102
    .line 103
    sput-object v9, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;->BEF_AI_FACEFITTING_Mouth_BS_Limit:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;

    .line 104
    .line 105
    filled-new-array/range {v0 .. v9}, [Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    sput-object v0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;->$VALUES:[Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;

    .line 110
    .line 111
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
    iput p3, p0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;
    .locals 1

    .line 1
    const-class v0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;
    .locals 1

    .line 1
    sget-object v0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;->$VALUES:[Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;->value:I

    .line 2
    .line 3
    return p0
.end method
