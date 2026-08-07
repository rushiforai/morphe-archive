.class public Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;
.super Ll/jt2;
.source "SourceFile"

# interfaces
.implements Ll/suf;


# instance fields
.field private byteDanceHelper:Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;

.field private resourceMap:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper$IBeautyErrorListener;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/jt2;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->resourceMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 10
    .line 11
    new-instance v0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;

    .line 12
    .line 13
    invoke-direct {v0, p1, p2}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;-><init>(Landroid/content/Context;Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper$IBeautyErrorListener;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->byteDanceHelper:Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;

    .line 17
    .line 18
    return-void
.end method

.method private checkResourceValid(Ljava/lang/String;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->byteDanceHelper:Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->byteDanceHelper:Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->getResourceRootPath()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    sget-object p0, Ljava/io/File;->separator:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-static {p0}, Lcom/core/glcore/util/FileUtil;->exist(Ljava/lang/String;)Z

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    return p0

    .line 43
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 44
    return p0
.end method

.method private updateComposerNodes(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->byteDanceHelper:Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->updateComposerNodes(Ljava/lang/String;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method private updateComposerNodesIntensity(Ljava/lang/String;Ljava/lang/String;F)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->byteDanceHelper:Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->updateComposerNodesIntensity(Ljava/lang/String;Ljava/lang/String;F)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method


# virtual methods
.method public destroy()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/gfj;->destroy()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->release()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public forbidBeauty(Z)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->byteDanceHelper:Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->forbidBeauty(Z)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public isByteDanceBeautyEnable()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->byteDanceHelper:Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->isEnable()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public newTextureReady(ILl/gfj;Z)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->byteDanceHelper:Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p2}, Ll/wej;->getWidth()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    invoke-virtual {p2}, Ll/wej;->getHeight()I

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    sget-object v4, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;->CLOCKWISE_ROTATE_0:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;

    .line 14
    .line 15
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 16
    .line 17
    .line 18
    move-result-wide v5

    .line 19
    move v1, p1

    .line 20
    invoke-virtual/range {v0 .. v6}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->processTexture(IIILcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;J)I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    invoke-super {p0, p1, p2, p3}, Ll/jt2;->newTextureReady(ILl/gfj;Z)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    move v1, p1

    .line 29
    invoke-super {p0, v1, p2, p3}, Ll/jt2;->newTextureReady(ILl/gfj;Z)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public release()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->byteDanceHelper:Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->release()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->resourceMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public removeBody(Ljava/lang/String;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->resourceMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ljava/lang/String;

    .line 8
    .line 9
    invoke-direct {p0, p1}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->checkResourceValid(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const-string v0, ""

    .line 16
    .line 17
    invoke-direct {p0, p1, v0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->updateComposerNodes(Ljava/lang/String;Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0

    .line 22
    :cond_0
    const/4 p0, 0x1

    .line 23
    return p0
.end method

.method public removeMakeup(Ljava/lang/String;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->resourceMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ljava/lang/String;

    .line 8
    .line 9
    invoke-direct {p0, p1}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->checkResourceValid(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const-string v0, ""

    .line 16
    .line 17
    invoke-direct {p0, p1, v0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->updateComposerNodes(Ljava/lang/String;Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0

    .line 22
    :cond_0
    const/4 p0, 0x1

    .line 23
    return p0
.end method

.method public removeMakeupStyle(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->resourceMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ljava/lang/String;

    .line 8
    .line 9
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->resourceMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 10
    .line 11
    invoke-virtual {v0, p2}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    check-cast p2, Ljava/lang/String;

    .line 16
    .line 17
    invoke-direct {p0, p1}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->checkResourceValid(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    const/4 v1, 0x1

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    invoke-direct {p0, p2}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->checkResourceValid(Ljava/lang/String;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    const-string v0, ""

    .line 31
    .line 32
    invoke-direct {p0, p1, v0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->updateComposerNodes(Ljava/lang/String;Ljava/lang/String;)Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-eqz p1, :cond_0

    .line 37
    .line 38
    invoke-direct {p0, p2, v0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->updateComposerNodes(Ljava/lang/String;Ljava/lang/String;)Z

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    if-eqz p0, :cond_0

    .line 43
    .line 44
    return v1

    .line 45
    :cond_0
    const/4 p0, 0x0

    .line 46
    return p0

    .line 47
    :cond_1
    return v1
.end method

.method public setCameraPosition(Z)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->byteDanceHelper:Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->setCameraPosition(Z)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public setMMCVInfo(Ll/omw;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->byteDanceHelper:Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget v1, p0, Ll/wej;->width:I

    .line 6
    .line 7
    iget p0, p0, Ll/wej;->height:I

    .line 8
    .line 9
    invoke-virtual {v0, p1, v1, p0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->processFaceFeature(Ll/omw;II)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public setOnDetectCompleteListener(Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper$IFaceDetectCompleteListener;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->byteDanceHelper:Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper;->setOnDetectCompleteListener(Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper$IFaceDetectCompleteListener;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public updateBeautyBodyValue(Ljava/lang/String;Ljava/lang/String;F)Z
    .locals 2

    .line 1
    const-string v0, "_"

    .line 2
    .line 3
    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-direct {p0, p1}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->checkResourceValid(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    return p0

    .line 17
    :cond_0
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->resourceMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 18
    .line 19
    invoke-virtual {v0, p2}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    const-string v0, ""

    .line 26
    .line 27
    invoke-direct {p0, v0, p1}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->updateComposerNodes(Ljava/lang/String;Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->resourceMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 31
    .line 32
    invoke-virtual {v0, p2, p1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->resourceMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 37
    .line 38
    invoke-virtual {v0, p2}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Ljava/lang/CharSequence;

    .line 43
    .line 44
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-nez v0, :cond_2

    .line 49
    .line 50
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->resourceMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 51
    .line 52
    invoke-virtual {v0, p2}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    check-cast v0, Ljava/lang/String;

    .line 57
    .line 58
    invoke-direct {p0, v0, p1}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->updateComposerNodes(Ljava/lang/String;Ljava/lang/String;)Z

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->resourceMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 62
    .line 63
    invoke-virtual {v0, p2, p1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    :cond_2
    :goto_0
    invoke-direct {p0, p1, p2, p3}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->updateComposerNodesIntensity(Ljava/lang/String;Ljava/lang/String;F)Z

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    return p0
.end method

.method public updateFaceBeautyValue(Ljava/lang/String;Ljava/lang/String;F)Z
    .locals 2

    .line 1
    const-string v0, "_"

    .line 2
    .line 3
    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-direct {p0, v0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->checkResourceValid(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    return p0

    .line 17
    :cond_0
    iget-object v1, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->resourceMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 18
    .line 19
    invoke-virtual {v1, p1}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-nez v1, :cond_1

    .line 24
    .line 25
    iget-object v1, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->resourceMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 26
    .line 27
    invoke-virtual {v1, p1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    const-string p1, ""

    .line 31
    .line 32
    invoke-direct {p0, p1, v0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->updateComposerNodes(Ljava/lang/String;Ljava/lang/String;)Z

    .line 33
    .line 34
    .line 35
    :cond_1
    invoke-direct {p0, v0, p2, p3}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->updateComposerNodesIntensity(Ljava/lang/String;Ljava/lang/String;F)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    return p0
.end method

.method public updateMakeupStyleValue(Ljava/lang/String;Ljava/lang/String;F)Z
    .locals 2

    .line 1
    const-string v0, "_"

    .line 2
    .line 3
    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-direct {p0, p1}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->checkResourceValid(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    return p0

    .line 17
    :cond_0
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->resourceMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 18
    .line 19
    invoke-virtual {v0, p2}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    const-string v0, ""

    .line 26
    .line 27
    invoke-direct {p0, v0, p1}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->updateComposerNodes(Ljava/lang/String;Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->resourceMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 31
    .line 32
    invoke-virtual {v0, p2, p1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->resourceMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 37
    .line 38
    invoke-virtual {v0, p2}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Ljava/lang/CharSequence;

    .line 43
    .line 44
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-nez v0, :cond_2

    .line 49
    .line 50
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->resourceMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 51
    .line 52
    invoke-virtual {v0, p2}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    check-cast v0, Ljava/lang/String;

    .line 57
    .line 58
    invoke-direct {p0, v0, p1}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->updateComposerNodes(Ljava/lang/String;Ljava/lang/String;)Z

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->resourceMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 62
    .line 63
    invoke-virtual {v0, p2, p1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    :cond_2
    :goto_0
    invoke-direct {p0, p1, p2, p3}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->updateComposerNodesIntensity(Ljava/lang/String;Ljava/lang/String;F)Z

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    return p0
.end method

.method public updateMakeupValue(Ljava/lang/String;Ljava/lang/String;F)Z
    .locals 2

    .line 1
    const-string v0, "_"

    .line 2
    .line 3
    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-direct {p0, p1}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->checkResourceValid(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    return p0

    .line 17
    :cond_0
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->resourceMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 18
    .line 19
    invoke-virtual {v0, p2}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    const-string v0, ""

    .line 26
    .line 27
    invoke-direct {p0, v0, p1}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->updateComposerNodes(Ljava/lang/String;Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->resourceMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 31
    .line 32
    invoke-virtual {v0, p2, p1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->resourceMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 37
    .line 38
    invoke-virtual {v0, p2}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Ljava/lang/CharSequence;

    .line 43
    .line 44
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-nez v0, :cond_2

    .line 49
    .line 50
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->resourceMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 51
    .line 52
    invoke-virtual {v0, p2}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    check-cast v0, Ljava/lang/String;

    .line 57
    .line 58
    invoke-direct {p0, v0, p1}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->updateComposerNodes(Ljava/lang/String;Ljava/lang/String;)Z

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->resourceMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 62
    .line 63
    invoke-virtual {v0, p2, p1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    :cond_2
    :goto_0
    invoke-direct {p0, p1, p2, p3}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->updateComposerNodesIntensity(Ljava/lang/String;Ljava/lang/String;F)Z

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    return p0
.end method
