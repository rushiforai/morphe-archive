.class public Lcom/momo/xeengine/lightningrender/StickerModel;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation


# instance fields
.field private assetPath:Ljava/lang/String;

.field private businessType:Ljava/lang/String;

.field private duration:J

.field private stickerId:Ljava/lang/String;

.field private userFlag:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, -0x1

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/momo/xeengine/lightningrender/StickerModel;->duration:J

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public getAssetPath()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/lightningrender/StickerModel;->assetPath:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getBusinessType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/lightningrender/StickerModel;->businessType:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDuration()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/xeengine/lightningrender/StickerModel;->duration:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getStickerId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/lightningrender/StickerModel;->stickerId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUserFlag()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xeengine/lightningrender/StickerModel;->userFlag:I

    .line 2
    .line 3
    return p0
.end method

.method public setAssetPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/lightningrender/StickerModel;->assetPath:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setBusinessType(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/lightningrender/StickerModel;->businessType:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setDuration(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/momo/xeengine/lightningrender/StickerModel;->duration:J

    .line 2
    .line 3
    return-void
.end method

.method public setStickerId(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/lightningrender/StickerModel;->stickerId:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setUserFlag(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xeengine/lightningrender/StickerModel;->userFlag:I

    .line 2
    .line 3
    return-void
.end method
