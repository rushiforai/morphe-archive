.class public final enum Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$TextureFormat;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "TextureFormat"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$TextureFormat;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$TextureFormat;

.field public static final enum Texture_Oes:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$TextureFormat;

.field public static final enum Texure2D:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$TextureFormat;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$TextureFormat;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/16 v2, 0xde1

    .line 5
    .line 6
    const-string v3, "Texure2D"

    .line 7
    .line 8
    invoke-direct {v0, v3, v1, v2}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$TextureFormat;-><init>(Ljava/lang/String;II)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$TextureFormat;->Texure2D:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$TextureFormat;

    .line 12
    .line 13
    new-instance v1, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$TextureFormat;

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    const v3, 0x8d65

    .line 17
    .line 18
    .line 19
    const-string v4, "Texture_Oes"

    .line 20
    .line 21
    invoke-direct {v1, v4, v2, v3}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$TextureFormat;-><init>(Ljava/lang/String;II)V

    .line 22
    .line 23
    .line 24
    sput-object v1, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$TextureFormat;->Texture_Oes:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$TextureFormat;

    .line 25
    .line 26
    filled-new-array {v0, v1}, [Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$TextureFormat;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    sput-object v0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$TextureFormat;->$VALUES:[Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$TextureFormat;

    .line 31
    .line 32
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
    iput p3, p0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$TextureFormat;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$TextureFormat;
    .locals 1

    .line 1
    const-class v0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$TextureFormat;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$TextureFormat;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$TextureFormat;
    .locals 1

    .line 1
    sget-object v0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$TextureFormat;->$VALUES:[Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$TextureFormat;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$TextureFormat;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$TextureFormat;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$TextureFormat;->value:I

    .line 2
    .line 3
    return p0
.end method
