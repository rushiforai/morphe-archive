.class public Lcom/effectsar/labcv/effectsdk/BefDynamicActionInfo$DynamicSkInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/effectsar/labcv/effectsdk/BefDynamicActionInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DynamicSkInfo"
.end annotation


# instance fields
.field private id:I

.field private keyPoints:[Lcom/effectsar/labcv/effectsdk/BefPublicDefine$BefKeyPoint;

.field private rect:Lcom/effectsar/labcv/effectsdk/BefPublicDefine$BefRect;


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
.method public getId()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/BefDynamicActionInfo$DynamicSkInfo;->id:I

    .line 2
    .line 3
    return p0
.end method

.method public getKeyPoints()[Lcom/effectsar/labcv/effectsdk/BefPublicDefine$BefKeyPoint;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/BefDynamicActionInfo$DynamicSkInfo;->keyPoints:[Lcom/effectsar/labcv/effectsdk/BefPublicDefine$BefKeyPoint;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRect()Lcom/effectsar/labcv/effectsdk/BefPublicDefine$BefRect;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/BefDynamicActionInfo$DynamicSkInfo;->rect:Lcom/effectsar/labcv/effectsdk/BefPublicDefine$BefRect;

    .line 2
    .line 3
    return-object p0
.end method

.method public setId(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/BefDynamicActionInfo$DynamicSkInfo;->id:I

    .line 2
    .line 3
    return-void
.end method

.method public setKeyPoints([Lcom/effectsar/labcv/effectsdk/BefPublicDefine$BefKeyPoint;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/effectsar/labcv/effectsdk/BefDynamicActionInfo$DynamicSkInfo;->keyPoints:[Lcom/effectsar/labcv/effectsdk/BefPublicDefine$BefKeyPoint;

    .line 2
    .line 3
    return-void
.end method

.method public setRect(Lcom/effectsar/labcv/effectsdk/BefPublicDefine$BefRect;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/effectsar/labcv/effectsdk/BefDynamicActionInfo$DynamicSkInfo;->rect:Lcom/effectsar/labcv/effectsdk/BefPublicDefine$BefRect;

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
    const-string v1, "DynamicSkInfo{id="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Lcom/effectsar/labcv/effectsdk/BefDynamicActionInfo$DynamicSkInfo;->id:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", rect="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/effectsar/labcv/effectsdk/BefDynamicActionInfo$DynamicSkInfo;->rect:Lcom/effectsar/labcv/effectsdk/BefPublicDefine$BefRect;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", keyPoints="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/BefDynamicActionInfo$DynamicSkInfo;->keyPoints:[Lcom/effectsar/labcv/effectsdk/BefPublicDefine$BefKeyPoint;

    .line 29
    .line 30
    invoke-static {p0}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const/16 p0, 0x7d

    .line 38
    .line 39
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0
.end method
