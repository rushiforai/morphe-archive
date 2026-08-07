.class public Lcom/momo/mcamera/mask/cartoon/CartoonMutex;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final MAKEUP_SIZE:I = 0x8

.field private static final MICRO_SIZE:I = 0x15


# instance fields
.field private volatile isCurrentCartoonStatus:Z

.field private lastMakeupPath:Ljava/lang/String;

.field private lastMakeupValues:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private lastMcrioValues:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private microMutex:Z

.field private volatile microProcessOnce:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;->microProcessOnce:Z

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;->microMutex:Z

    .line 9
    .line 10
    new-instance v0, Ljava/util/HashMap;

    .line 11
    .line 12
    const/16 v1, 0x8

    .line 13
    .line 14
    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;->lastMakeupValues:Ljava/util/HashMap;

    .line 18
    .line 19
    new-instance v0, Ljava/util/HashMap;

    .line 20
    .line 21
    const/16 v1, 0x15

    .line 22
    .line 23
    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;->lastMcrioValues:Ljava/util/HashMap;

    .line 27
    .line 28
    return-void
.end method

.method private clearMakeupValues(Lcom/momo/xeengine/lightningrender/ILightningRender;)V
    .locals 2

    .line 1
    invoke-interface {p1}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getMakeupLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "makeup_blush"

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-interface {p0, v0, v1}, Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;->setEffectIntensity(Ljava/lang/String;F)V

    .line 9
    .line 10
    .line 11
    invoke-interface {p1}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getMakeupLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string v0, "makeup_facial"

    .line 16
    .line 17
    invoke-interface {p0, v0, v1}, Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;->setEffectIntensity(Ljava/lang/String;F)V

    .line 18
    .line 19
    .line 20
    invoke-interface {p1}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getMakeupLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const-string v0, "makeup_eyebrow"

    .line 25
    .line 26
    invoke-interface {p0, v0, v1}, Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;->setEffectIntensity(Ljava/lang/String;F)V

    .line 27
    .line 28
    .line 29
    invoke-interface {p1}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getMakeupLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const-string v0, "makeup_eyes"

    .line 34
    .line 35
    invoke-interface {p0, v0, v1}, Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;->setEffectIntensity(Ljava/lang/String;F)V

    .line 36
    .line 37
    .line 38
    invoke-interface {p1}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getMakeupLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    const-string v0, "makeup_lips"

    .line 43
    .line 44
    invoke-interface {p0, v0, v1}, Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;->setEffectIntensity(Ljava/lang/String;F)V

    .line 45
    .line 46
    .line 47
    invoke-interface {p1}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getMakeupLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    const-string v0, "makeup_pupil"

    .line 52
    .line 53
    invoke-interface {p0, v0, v1}, Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;->setEffectIntensity(Ljava/lang/String;F)V

    .line 54
    .line 55
    .line 56
    invoke-interface {p1}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getMakeupLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    const-string v0, "makeup_lut"

    .line 61
    .line 62
    invoke-interface {p0, v0, v1}, Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;->setEffectIntensity(Ljava/lang/String;F)V

    .line 63
    .line 64
    .line 65
    invoke-interface {p1}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getMakeupLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    const-string p1, "makeup_all"

    .line 70
    .line 71
    invoke-interface {p0, p1, v1}, Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;->setEffectIntensity(Ljava/lang/String;F)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method private clearMircoValues(Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;->lastMcrioValues:Ljava/util/HashMap;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/HashMap;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;->lastMcrioValues:Ljava/util/HashMap;

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Ljava/util/Map$Entry;

    .line 34
    .line 35
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Ljava/lang/String;

    .line 40
    .line 41
    const/4 v1, 0x0

    .line 42
    invoke-virtual {p1, v0, v1}, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->setFaceBeautyValue(Ljava/lang/String;F)V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    return-void
.end method

.method private makeupEnable(Lcom/momo/xeengine/lightningrender/ILightningRender;Z)V
    .locals 1

    .line 1
    invoke-interface {p1}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getMakeupLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "makeup_blush"

    .line 6
    .line 7
    invoke-interface {p0, v0, p2}, Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;->disableEffect(Ljava/lang/String;Z)V

    .line 8
    .line 9
    .line 10
    invoke-interface {p1}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getMakeupLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const-string v0, "makeup_facial"

    .line 15
    .line 16
    invoke-interface {p0, v0, p2}, Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;->disableEffect(Ljava/lang/String;Z)V

    .line 17
    .line 18
    .line 19
    invoke-interface {p1}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getMakeupLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string v0, "makeup_eyebrow"

    .line 24
    .line 25
    invoke-interface {p0, v0, p2}, Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;->disableEffect(Ljava/lang/String;Z)V

    .line 26
    .line 27
    .line 28
    invoke-interface {p1}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getMakeupLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const-string v0, "makeup_eyes"

    .line 33
    .line 34
    invoke-interface {p0, v0, p2}, Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;->disableEffect(Ljava/lang/String;Z)V

    .line 35
    .line 36
    .line 37
    invoke-interface {p1}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getMakeupLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    const-string v0, "makeup_lips"

    .line 42
    .line 43
    invoke-interface {p0, v0, p2}, Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;->disableEffect(Ljava/lang/String;Z)V

    .line 44
    .line 45
    .line 46
    invoke-interface {p1}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getMakeupLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    const-string v0, "makeup_pupil"

    .line 51
    .line 52
    invoke-interface {p0, v0, p2}, Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;->disableEffect(Ljava/lang/String;Z)V

    .line 53
    .line 54
    .line 55
    invoke-interface {p1}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getMakeupLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    const-string v0, "makeup_lut"

    .line 60
    .line 61
    invoke-interface {p0, v0, p2}, Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;->disableEffect(Ljava/lang/String;Z)V

    .line 62
    .line 63
    .line 64
    invoke-interface {p1}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getMakeupLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    const-string p1, "makeup_all"

    .line 69
    .line 70
    invoke-interface {p0, p1, p2}, Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;->disableEffect(Ljava/lang/String;Z)V

    .line 71
    .line 72
    .line 73
    return-void
.end method


# virtual methods
.method public addMaskModel(Lcom/momo/mcamera/mask/MaskModel;Lcom/momo/xeengine/lightningrender/ILightningRender;Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_4

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getAdditionalInfo()Lcom/momo/mcamera/mask/AdditionalInfo;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_4

    .line 8
    .line 9
    if-nez p2, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getAdditionalInfo()Lcom/momo/mcamera/mask/AdditionalInfo;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/AdditionalInfo;->isCartoonFaceEnable()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_3

    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getAdditionalInfo()Lcom/momo/mcamera/mask/AdditionalInfo;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/AdditionalInfo;->getCartoonFaceType()I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    const/4 v0, 0x4

    .line 31
    const/4 v1, 0x1

    .line 32
    if-ne p1, v0, :cond_1

    .line 33
    .line 34
    const/4 p1, 0x0

    .line 35
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;->microMutex:Z

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;->microMutex:Z

    .line 39
    .line 40
    :goto_0
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;->isCurrentCartoonStatus:Z

    .line 41
    .line 42
    invoke-interface {p2, v1}, Lcom/momo/xeengine/lightningrender/ILightningRender;->setCartoonFaceEnable(Z)V

    .line 43
    .line 44
    .line 45
    invoke-direct {p0, p2, v1}, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;->makeupEnable(Lcom/momo/xeengine/lightningrender/ILightningRender;Z)V

    .line 46
    .line 47
    .line 48
    iget-boolean p1, p0, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;->microMutex:Z

    .line 49
    .line 50
    if-eqz p1, :cond_2

    .line 51
    .line 52
    invoke-direct {p0, p3}, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;->clearMircoValues(Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;)V

    .line 53
    .line 54
    .line 55
    :cond_2
    invoke-direct {p0, p2}, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;->clearMakeupValues(Lcom/momo/xeengine/lightningrender/ILightningRender;)V

    .line 56
    .line 57
    .line 58
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;->microProcessOnce:Z

    .line 59
    .line 60
    return-void

    .line 61
    :cond_3
    iget-boolean p1, p0, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;->isCurrentCartoonStatus:Z

    .line 62
    .line 63
    if-eqz p1, :cond_4

    .line 64
    .line 65
    invoke-virtual {p0, p2, p3}, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;->revertAllValue(Lcom/momo/xeengine/lightningrender/ILightningRender;Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;)V

    .line 66
    .line 67
    .line 68
    :cond_4
    :goto_1
    return-void
.end method

.method public doProcess()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;->isCurrentCartoonStatus:Z

    .line 2
    .line 3
    return p0
.end method

.method public intercept()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;->isCurrentCartoonStatus:Z

    .line 2
    .line 3
    return p0
.end method

.method public interceptMakeup(Ljava/lang/String;F)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;->lastMakeupValues:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;->isCurrentCartoonStatus:Z

    .line 11
    .line 12
    return p0
.end method

.method public interceptMakeupPath(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;->lastMakeupPath:Ljava/lang/String;

    .line 2
    .line 3
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;->isCurrentCartoonStatus:Z

    .line 4
    .line 5
    return p0
.end method

.method public interceptMicro(Ljava/lang/String;F)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;->lastMcrioValues:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    iget-boolean p1, p0, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;->isCurrentCartoonStatus:Z

    .line 11
    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;->microMutex:Z

    .line 15
    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    return p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method public interceptMicroProcess()Z
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;->isCurrentCartoonStatus:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;->microMutex:Z

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    move v0, v1

    .line 13
    :goto_0
    iget-boolean v2, p0, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;->microProcessOnce:Z

    .line 14
    .line 15
    if-eqz v2, :cond_1

    .line 16
    .line 17
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;->microProcessOnce:Z

    .line 18
    .line 19
    return v1

    .line 20
    :cond_1
    return v0
.end method

.method public interceptRemoveAllMakeup()Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;->lastMakeupPath:Ljava/lang/String;

    .line 3
    .line 4
    iget-object p0, p0, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;->lastMakeupValues:Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/util/HashMap;->clear()V

    .line 7
    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public interceptRemoveMakeup(Ljava/lang/String;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;->lastMakeupValues:Ljava/util/HashMap;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;->isCurrentCartoonStatus:Z

    .line 12
    .line 13
    return p0
.end method

.method public revertAllValue(Lcom/momo/xeengine/lightningrender/ILightningRender;Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;->isCurrentCartoonStatus:Z

    .line 3
    .line 4
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;->microProcessOnce:Z

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    invoke-interface {p1, v0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->setCartoonFaceEnable(Z)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0, p1, v0}, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;->makeupEnable(Lcom/momo/xeengine/lightningrender/ILightningRender;Z)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;->revertMakeupValue(Lcom/momo/xeengine/lightningrender/ILightningRender;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    if-eqz p2, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0, p2}, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;->revertMicroValue(Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;)V

    .line 20
    .line 21
    .line 22
    :cond_1
    return-void
.end method

.method public revertMakeupValue(Lcom/momo/xeengine/lightningrender/ILightningRender;)V
    .locals 3

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;->lastMakeupPath:Ljava/lang/String;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p1, v0}, Lcom/momo/xeengine/IXEngine;->addLibraryPath(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-interface {p1}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getMakeupLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p0, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;->lastMakeupPath:Ljava/lang/String;

    .line 15
    .line 16
    invoke-interface {v0, v1}, Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;->addEffect(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;->lastMakeupValues:Ljava/util/HashMap;

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/util/HashMap;->isEmpty()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    iget-object p0, p0, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;->lastMakeupValues:Ljava/util/HashMap;

    .line 30
    .line 31
    invoke-virtual {p0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_1

    .line 44
    .line 45
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    check-cast v0, Ljava/util/Map$Entry;

    .line 50
    .line 51
    invoke-interface {p1}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getMakeupLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    check-cast v2, Ljava/lang/String;

    .line 60
    .line 61
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    check-cast v0, Ljava/lang/Float;

    .line 66
    .line 67
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    invoke-interface {v1, v2, v0}, Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;->setEffectIntensity(Ljava/lang/String;F)V

    .line 72
    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_1
    return-void
.end method

.method public revertMicroBodyMakeupValues(Lcom/momo/xeengine/lightningrender/ILightningRender;Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;->isCurrentCartoonStatus:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;->revertAllValue(Lcom/momo/xeengine/lightningrender/ILightningRender;Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 p1, 0x0

    .line 9
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;->isCurrentCartoonStatus:Z

    .line 10
    .line 11
    return-void
.end method

.method public revertMicroValue(Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;->lastMcrioValues:Ljava/util/HashMap;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/HashMap;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;->lastMcrioValues:Ljava/util/HashMap;

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Ljava/util/Map$Entry;

    .line 34
    .line 35
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    check-cast v1, Ljava/lang/String;

    .line 40
    .line 41
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    check-cast v0, Ljava/lang/Float;

    .line 46
    .line 47
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    invoke-virtual {p1, v1, v0}, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->setFaceBeautyValue(Ljava/lang/String;F)V

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_0
    return-void
.end method

.method public setCartoonFaceEnable(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;->isCurrentCartoonStatus:Z

    .line 2
    .line 3
    return-void
.end method
