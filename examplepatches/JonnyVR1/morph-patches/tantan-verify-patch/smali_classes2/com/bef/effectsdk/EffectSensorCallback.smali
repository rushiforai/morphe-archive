.class public Lcom/bef/effectsdk/EffectSensorCallback;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Lcom/amazing/annotation/EffectKeep;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bef/effectsdk/EffectSensorCallback$GetSensorInfo;
    }
.end annotation


# static fields
.field private static sGetSensorInfo:Lcom/bef/effectsdk/EffectSensorCallback$GetSensorInfo;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static registerStr(II)Z
    .locals 1
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation

    .line 1
    sget-object v0, Lcom/bef/effectsdk/EffectSensorCallback;->sGetSensorInfo:Lcom/bef/effectsdk/EffectSensorCallback$GetSensorInfo;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-interface {v0, p0, p1}, Lcom/bef/effectsdk/EffectSensorCallback$GetSensorInfo;->onRegister(II)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method private static setRateStr(II)Z
    .locals 1
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation

    .line 1
    sget-object v0, Lcom/bef/effectsdk/EffectSensorCallback;->sGetSensorInfo:Lcom/bef/effectsdk/EffectSensorCallback$GetSensorInfo;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-interface {v0, p0, p1}, Lcom/bef/effectsdk/EffectSensorCallback$GetSensorInfo;->onSetRate(II)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public static setSensorInfoCallback(Lcom/bef/effectsdk/EffectSensorCallback$GetSensorInfo;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/bef/effectsdk/EffectSensorCallback;->sGetSensorInfo:Lcom/bef/effectsdk/EffectSensorCallback$GetSensorInfo;

    .line 2
    .line 3
    return-void
.end method

.method private static unregisterStr(I)Z
    .locals 1
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation

    .line 1
    sget-object v0, Lcom/bef/effectsdk/EffectSensorCallback;->sGetSensorInfo:Lcom/bef/effectsdk/EffectSensorCallback$GetSensorInfo;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-interface {v0, p0}, Lcom/bef/effectsdk/EffectSensorCallback$GetSensorInfo;->onUnregister(I)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method
