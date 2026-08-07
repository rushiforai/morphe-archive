.class public final enum Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ChromaKeyingParamType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;

.field public static final enum BEF_AI_CHROMA_KEYING_BALP:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;

.field public static final enum BEF_AI_CHROMA_KEYING_BG_B:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;

.field public static final enum BEF_AI_CHROMA_KEYING_BG_G:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;

.field public static final enum BEF_AI_CHROMA_KEYING_BG_R:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;

.field public static final enum BEF_AI_CHROMA_KEYING_CAL_COLOR:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;

.field public static final enum BEF_AI_CHROMA_KEYING_GET_MASK:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;

.field public static final enum BEF_AI_CHROMA_KEYING_KALP:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;

.field public static final enum BEF_AI_CHROMA_KEYING_METHOD:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;

.field public static final enum BEF_AI_CHROMA_KEYING_SHARPEN:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;

.field public static final enum BEF_AI_CHROMA_KEYING_SMOOTH:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 12

    .line 1
    new-instance v0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;

    .line 2
    .line 3
    const-string v1, "BEF_AI_CHROMA_KEYING_METHOD"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;->BEF_AI_CHROMA_KEYING_METHOD:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;

    .line 10
    .line 11
    new-instance v1, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;

    .line 12
    .line 13
    const-string v2, "BEF_AI_CHROMA_KEYING_CAL_COLOR"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v1, v2, v3, v3}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;-><init>(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;->BEF_AI_CHROMA_KEYING_CAL_COLOR:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;

    .line 20
    .line 21
    new-instance v2, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;

    .line 22
    .line 23
    const-string v3, "BEF_AI_CHROMA_KEYING_BG_R"

    .line 24
    .line 25
    const/4 v4, 0x2

    .line 26
    invoke-direct {v2, v3, v4, v4}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;-><init>(Ljava/lang/String;II)V

    .line 27
    .line 28
    .line 29
    sput-object v2, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;->BEF_AI_CHROMA_KEYING_BG_R:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;

    .line 30
    .line 31
    new-instance v3, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;

    .line 32
    .line 33
    const-string v4, "BEF_AI_CHROMA_KEYING_BG_G"

    .line 34
    .line 35
    const/4 v5, 0x3

    .line 36
    invoke-direct {v3, v4, v5, v5}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;-><init>(Ljava/lang/String;II)V

    .line 37
    .line 38
    .line 39
    sput-object v3, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;->BEF_AI_CHROMA_KEYING_BG_G:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;

    .line 40
    .line 41
    new-instance v4, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;

    .line 42
    .line 43
    const-string v5, "BEF_AI_CHROMA_KEYING_BG_B"

    .line 44
    .line 45
    const/4 v6, 0x4

    .line 46
    invoke-direct {v4, v5, v6, v6}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;-><init>(Ljava/lang/String;II)V

    .line 47
    .line 48
    .line 49
    sput-object v4, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;->BEF_AI_CHROMA_KEYING_BG_B:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;

    .line 50
    .line 51
    new-instance v5, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;

    .line 52
    .line 53
    const-string v6, "BEF_AI_CHROMA_KEYING_BALP"

    .line 54
    .line 55
    const/4 v7, 0x5

    .line 56
    invoke-direct {v5, v6, v7, v7}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;-><init>(Ljava/lang/String;II)V

    .line 57
    .line 58
    .line 59
    sput-object v5, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;->BEF_AI_CHROMA_KEYING_BALP:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;

    .line 60
    .line 61
    new-instance v6, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;

    .line 62
    .line 63
    const-string v7, "BEF_AI_CHROMA_KEYING_KALP"

    .line 64
    .line 65
    const/4 v8, 0x6

    .line 66
    invoke-direct {v6, v7, v8, v8}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;-><init>(Ljava/lang/String;II)V

    .line 67
    .line 68
    .line 69
    sput-object v6, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;->BEF_AI_CHROMA_KEYING_KALP:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;

    .line 70
    .line 71
    new-instance v7, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;

    .line 72
    .line 73
    const-string v8, "BEF_AI_CHROMA_KEYING_SMOOTH"

    .line 74
    .line 75
    const/4 v9, 0x7

    .line 76
    invoke-direct {v7, v8, v9, v9}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;-><init>(Ljava/lang/String;II)V

    .line 77
    .line 78
    .line 79
    sput-object v7, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;->BEF_AI_CHROMA_KEYING_SMOOTH:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;

    .line 80
    .line 81
    new-instance v8, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;

    .line 82
    .line 83
    const-string v9, "BEF_AI_CHROMA_KEYING_SHARPEN"

    .line 84
    .line 85
    const/16 v10, 0x8

    .line 86
    .line 87
    invoke-direct {v8, v9, v10, v10}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;-><init>(Ljava/lang/String;II)V

    .line 88
    .line 89
    .line 90
    sput-object v8, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;->BEF_AI_CHROMA_KEYING_SHARPEN:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;

    .line 91
    .line 92
    new-instance v9, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;

    .line 93
    .line 94
    const-string v10, "BEF_AI_CHROMA_KEYING_GET_MASK"

    .line 95
    .line 96
    const/16 v11, 0x9

    .line 97
    .line 98
    invoke-direct {v9, v10, v11, v11}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;-><init>(Ljava/lang/String;II)V

    .line 99
    .line 100
    .line 101
    sput-object v9, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;->BEF_AI_CHROMA_KEYING_GET_MASK:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;

    .line 102
    .line 103
    filled-new-array/range {v0 .. v9}, [Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    sput-object v0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;->$VALUES:[Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;

    .line 108
    .line 109
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
    iput p3, p0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;
    .locals 1

    .line 1
    const-class v0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;
    .locals 1

    .line 1
    sget-object v0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;->$VALUES:[Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ChromaKeyingParamType;->value:I

    .line 2
    .line 3
    return p0
.end method
