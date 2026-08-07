.class public final enum Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$IntensityType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "IntensityType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$IntensityType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$IntensityType;

.field public static final enum BeautySharp:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$IntensityType;

.field public static final enum BeautySmooth:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$IntensityType;

.field public static final enum BeautyWhite:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$IntensityType;

.field public static final enum FaceReshape:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$IntensityType;

.field public static final enum Filter:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$IntensityType;

.field public static final enum MakeUpBlusher:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$IntensityType;

.field public static final enum MakeUpLip:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$IntensityType;


# instance fields
.field private id:I


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .line 1
    new-instance v0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$IntensityType;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/16 v2, 0xc

    .line 5
    .line 6
    const-string v3, "Filter"

    .line 7
    .line 8
    invoke-direct {v0, v3, v1, v2}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$IntensityType;-><init>(Ljava/lang/String;II)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$IntensityType;->Filter:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$IntensityType;

    .line 12
    .line 13
    new-instance v1, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$IntensityType;

    .line 14
    .line 15
    const-string v2, "BeautyWhite"

    .line 16
    .line 17
    const/4 v3, 0x1

    .line 18
    invoke-direct {v1, v2, v3, v3}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$IntensityType;-><init>(Ljava/lang/String;II)V

    .line 19
    .line 20
    .line 21
    sput-object v1, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$IntensityType;->BeautyWhite:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$IntensityType;

    .line 22
    .line 23
    new-instance v2, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$IntensityType;

    .line 24
    .line 25
    const-string v3, "BeautySmooth"

    .line 26
    .line 27
    const/4 v4, 0x2

    .line 28
    invoke-direct {v2, v3, v4, v4}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$IntensityType;-><init>(Ljava/lang/String;II)V

    .line 29
    .line 30
    .line 31
    sput-object v2, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$IntensityType;->BeautySmooth:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$IntensityType;

    .line 32
    .line 33
    new-instance v3, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$IntensityType;

    .line 34
    .line 35
    const-string v4, "FaceReshape"

    .line 36
    .line 37
    const/4 v5, 0x3

    .line 38
    invoke-direct {v3, v4, v5, v5}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$IntensityType;-><init>(Ljava/lang/String;II)V

    .line 39
    .line 40
    .line 41
    sput-object v3, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$IntensityType;->FaceReshape:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$IntensityType;

    .line 42
    .line 43
    new-instance v4, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$IntensityType;

    .line 44
    .line 45
    const/4 v5, 0x4

    .line 46
    const/16 v6, 0x9

    .line 47
    .line 48
    const-string v7, "BeautySharp"

    .line 49
    .line 50
    invoke-direct {v4, v7, v5, v6}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$IntensityType;-><init>(Ljava/lang/String;II)V

    .line 51
    .line 52
    .line 53
    sput-object v4, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$IntensityType;->BeautySharp:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$IntensityType;

    .line 54
    .line 55
    new-instance v5, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$IntensityType;

    .line 56
    .line 57
    const/4 v6, 0x5

    .line 58
    const/16 v7, 0x11

    .line 59
    .line 60
    const-string v8, "MakeUpLip"

    .line 61
    .line 62
    invoke-direct {v5, v8, v6, v7}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$IntensityType;-><init>(Ljava/lang/String;II)V

    .line 63
    .line 64
    .line 65
    sput-object v5, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$IntensityType;->MakeUpLip:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$IntensityType;

    .line 66
    .line 67
    new-instance v6, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$IntensityType;

    .line 68
    .line 69
    const/4 v7, 0x6

    .line 70
    const/16 v8, 0x12

    .line 71
    .line 72
    const-string v9, "MakeUpBlusher"

    .line 73
    .line 74
    invoke-direct {v6, v9, v7, v8}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$IntensityType;-><init>(Ljava/lang/String;II)V

    .line 75
    .line 76
    .line 77
    sput-object v6, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$IntensityType;->MakeUpBlusher:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$IntensityType;

    .line 78
    .line 79
    filled-new-array/range {v0 .. v6}, [Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$IntensityType;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    sput-object v0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$IntensityType;->$VALUES:[Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$IntensityType;

    .line 84
    .line 85
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
    iput p3, p0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$IntensityType;->id:I

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$IntensityType;
    .locals 1

    .line 1
    const-class v0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$IntensityType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$IntensityType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$IntensityType;
    .locals 1

    .line 1
    sget-object v0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$IntensityType;->$VALUES:[Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$IntensityType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$IntensityType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$IntensityType;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getId()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$IntensityType;->id:I

    .line 2
    .line 3
    return p0
.end method
