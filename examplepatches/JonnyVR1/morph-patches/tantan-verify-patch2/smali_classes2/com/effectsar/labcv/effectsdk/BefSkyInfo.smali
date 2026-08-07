.class public Lcom/effectsar/labcv/effectsdk/BefSkyInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public hasSky:Z

.field private skyMask:Lcom/effectsar/labcv/effectsdk/SkySegment$SkyMask;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getHasSky()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/effectsar/labcv/effectsdk/BefSkyInfo;->hasSky:Z

    .line 2
    .line 3
    return p0
.end method

.method public getSkyMask()Lcom/effectsar/labcv/effectsdk/SkySegment$SkyMask;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/BefSkyInfo;->skyMask:Lcom/effectsar/labcv/effectsdk/SkySegment$SkyMask;

    .line 2
    .line 3
    return-object p0
.end method

.method public setHasSky(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/effectsar/labcv/effectsdk/BefSkyInfo;->hasSky:Z

    .line 2
    .line 3
    return-void
.end method

.method public setSkyMask(Lcom/effectsar/labcv/effectsdk/SkySegment$SkyMask;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/effectsar/labcv/effectsdk/BefSkyInfo;->skyMask:Lcom/effectsar/labcv/effectsdk/SkySegment$SkyMask;

    .line 2
    .line 3
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "BefSkyInfo{hasSky="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-boolean p0, p0, Lcom/effectsar/labcv/effectsdk/BefSkyInfo;->hasSky:Z

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const/16 p0, 0x7d

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method
