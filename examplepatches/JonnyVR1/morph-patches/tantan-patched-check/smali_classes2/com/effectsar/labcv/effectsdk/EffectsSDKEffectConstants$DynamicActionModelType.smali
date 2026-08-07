.class public final enum Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$DynamicActionModelType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "DynamicActionModelType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$DynamicActionModelType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$DynamicActionModelType;

.field public static final enum BEF_AI_DYNAMIC_ACTION_MODEL_DETECT:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$DynamicActionModelType;

.field public static final enum BEF_AI_DYNAMIC_ACTION_MODEL_DYNAMIC_ACTION:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$DynamicActionModelType;

.field public static final enum BEF_AI_DYNAMIC_ACTION_MODEL_SK:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$DynamicActionModelType;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 1
    new-instance v0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$DynamicActionModelType;

    .line 2
    .line 3
    const-string v1, "BEF_AI_DYNAMIC_ACTION_MODEL_SK"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    invoke-direct {v0, v1, v2, v3}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$DynamicActionModelType;-><init>(Ljava/lang/String;II)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$DynamicActionModelType;->BEF_AI_DYNAMIC_ACTION_MODEL_SK:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$DynamicActionModelType;

    .line 11
    .line 12
    new-instance v1, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$DynamicActionModelType;

    .line 13
    .line 14
    const-string v2, "BEF_AI_DYNAMIC_ACTION_MODEL_DETECT"

    .line 15
    .line 16
    const/4 v4, 0x2

    .line 17
    invoke-direct {v1, v2, v3, v4}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$DynamicActionModelType;-><init>(Ljava/lang/String;II)V

    .line 18
    .line 19
    .line 20
    sput-object v1, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$DynamicActionModelType;->BEF_AI_DYNAMIC_ACTION_MODEL_DETECT:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$DynamicActionModelType;

    .line 21
    .line 22
    new-instance v2, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$DynamicActionModelType;

    .line 23
    .line 24
    const-string v3, "BEF_AI_DYNAMIC_ACTION_MODEL_DYNAMIC_ACTION"

    .line 25
    .line 26
    const/4 v5, 0x4

    .line 27
    invoke-direct {v2, v3, v4, v5}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$DynamicActionModelType;-><init>(Ljava/lang/String;II)V

    .line 28
    .line 29
    .line 30
    sput-object v2, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$DynamicActionModelType;->BEF_AI_DYNAMIC_ACTION_MODEL_DYNAMIC_ACTION:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$DynamicActionModelType;

    .line 31
    .line 32
    filled-new-array {v0, v1, v2}, [Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$DynamicActionModelType;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    sput-object v0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$DynamicActionModelType;->$VALUES:[Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$DynamicActionModelType;

    .line 37
    .line 38
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
    iput p3, p0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$DynamicActionModelType;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$DynamicActionModelType;
    .locals 1

    .line 1
    const-class v0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$DynamicActionModelType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$DynamicActionModelType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$DynamicActionModelType;
    .locals 1

    .line 1
    sget-object v0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$DynamicActionModelType;->$VALUES:[Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$DynamicActionModelType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$DynamicActionModelType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$DynamicActionModelType;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$DynamicActionModelType;->value:I

    .line 2
    .line 3
    return p0
.end method
