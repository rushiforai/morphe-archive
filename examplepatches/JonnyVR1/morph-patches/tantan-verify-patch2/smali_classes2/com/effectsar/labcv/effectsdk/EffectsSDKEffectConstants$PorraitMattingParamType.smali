.class public final enum Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PorraitMattingParamType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "PorraitMattingParamType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PorraitMattingParamType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PorraitMattingParamType;

.field public static final enum BEF_MP_EdgeMode:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PorraitMattingParamType;

.field public static final enum BEF_MP_FrashEvery:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PorraitMattingParamType;

.field public static final enum BEF_MP_OutputMinSideLen:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PorraitMattingParamType;

.field public static final enum BEF_MP_VIDEO_MODE:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PorraitMattingParamType;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 1
    new-instance v0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PorraitMattingParamType;

    .line 2
    .line 3
    const-string v1, "BEF_MP_EdgeMode"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PorraitMattingParamType;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PorraitMattingParamType;->BEF_MP_EdgeMode:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PorraitMattingParamType;

    .line 10
    .line 11
    new-instance v1, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PorraitMattingParamType;

    .line 12
    .line 13
    const-string v2, "BEF_MP_FrashEvery"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v1, v2, v3, v3}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PorraitMattingParamType;-><init>(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PorraitMattingParamType;->BEF_MP_FrashEvery:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PorraitMattingParamType;

    .line 20
    .line 21
    new-instance v2, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PorraitMattingParamType;

    .line 22
    .line 23
    const-string v3, "BEF_MP_OutputMinSideLen"

    .line 24
    .line 25
    const/4 v4, 0x2

    .line 26
    invoke-direct {v2, v3, v4, v4}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PorraitMattingParamType;-><init>(Ljava/lang/String;II)V

    .line 27
    .line 28
    .line 29
    sput-object v2, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PorraitMattingParamType;->BEF_MP_OutputMinSideLen:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PorraitMattingParamType;

    .line 30
    .line 31
    new-instance v3, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PorraitMattingParamType;

    .line 32
    .line 33
    const/4 v4, 0x3

    .line 34
    const/4 v5, 0x5

    .line 35
    const-string v6, "BEF_MP_VIDEO_MODE"

    .line 36
    .line 37
    invoke-direct {v3, v6, v4, v5}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PorraitMattingParamType;-><init>(Ljava/lang/String;II)V

    .line 38
    .line 39
    .line 40
    sput-object v3, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PorraitMattingParamType;->BEF_MP_VIDEO_MODE:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PorraitMattingParamType;

    .line 41
    .line 42
    filled-new-array {v0, v1, v2, v3}, [Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PorraitMattingParamType;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    sput-object v0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PorraitMattingParamType;->$VALUES:[Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PorraitMattingParamType;

    .line 47
    .line 48
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
    iput p3, p0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PorraitMattingParamType;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PorraitMattingParamType;
    .locals 1

    .line 1
    const-class v0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PorraitMattingParamType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PorraitMattingParamType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PorraitMattingParamType;
    .locals 1

    .line 1
    sget-object v0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PorraitMattingParamType;->$VALUES:[Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PorraitMattingParamType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PorraitMattingParamType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PorraitMattingParamType;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PorraitMattingParamType;->value:I

    .line 2
    .line 3
    return p0
.end method
