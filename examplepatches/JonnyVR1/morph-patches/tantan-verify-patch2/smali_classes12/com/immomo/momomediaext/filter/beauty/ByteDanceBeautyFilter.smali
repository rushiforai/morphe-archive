.class public Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyFilter;
.super Lcom/momo/mcamera/mask/FaceFilterPipeline;
.source "SourceFile"


# instance fields
.field private byteDanceFilter:Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;

.field private firstFlipFilter:Lcom/immomo/momomediaext/filter/beauty/VerticalFlipFilter;

.field private secondFlipFilter:Lcom/immomo/momomediaext/filter/beauty/VerticalFlipFilter;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper$IBeautyErrorListener;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/mask/FaceFilterPipeline;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/immomo/momomediaext/filter/beauty/VerticalFlipFilter;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/immomo/momomediaext/filter/beauty/VerticalFlipFilter;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyFilter;->firstFlipFilter:Lcom/immomo/momomediaext/filter/beauty/VerticalFlipFilter;

    .line 10
    .line 11
    new-instance v0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;

    .line 12
    .line 13
    invoke-direct {v0, p1, p2}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;-><init>(Landroid/content/Context;Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper$IBeautyErrorListener;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyFilter;->byteDanceFilter:Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;

    .line 17
    .line 18
    new-instance p1, Lcom/immomo/momomediaext/filter/beauty/VerticalFlipFilter;

    .line 19
    .line 20
    invoke-direct {p1}, Lcom/immomo/momomediaext/filter/beauty/VerticalFlipFilter;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyFilter;->secondFlipFilter:Lcom/immomo/momomediaext/filter/beauty/VerticalFlipFilter;

    .line 24
    .line 25
    new-instance p1, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 28
    .line 29
    .line 30
    iget-object p2, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyFilter;->firstFlipFilter:Lcom/immomo/momomediaext/filter/beauty/VerticalFlipFilter;

    .line 31
    .line 32
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    iget-object p2, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyFilter;->byteDanceFilter:Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;

    .line 36
    .line 37
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    iget-object p2, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyFilter;->secondFlipFilter:Lcom/immomo/momomediaext/filter/beauty/VerticalFlipFilter;

    .line 41
    .line 42
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/FaceFilterPipeline;->constructGroupFilter(Ljava/util/List;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method


# virtual methods
.method public declared-synchronized destroy()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-super {p0}, Ll/ogk;->destroy()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    .line 5
    monitor-exit p0

    .line 6
    return-void

    .line 7
    :catchall_0
    move-exception v0

    .line 8
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 9
    throw v0
.end method

.method public forbidBeauty(Z)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyFilter;->byteDanceFilter:Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->forbidBeauty(Z)Z

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
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyFilter;->byteDanceFilter:Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->isByteDanceBeautyEnable()Z

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

.method public release()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyFilter;->byteDanceFilter:Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->release()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public removeBody(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyFilter;->byteDanceFilter:Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->removeBody(Ljava/lang/String;)Z

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

.method public removeMakeup(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyFilter;->byteDanceFilter:Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->removeMakeup(Ljava/lang/String;)Z

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

.method public removeMakeupStyle(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyFilter;->byteDanceFilter:Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->removeMakeupStyle(Ljava/lang/String;Ljava/lang/String;)Z

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
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyFilter;->byteDanceFilter:Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->setMMCVInfo(Ll/omw;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setOnDetectCompleteListener(Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper$IFaceDetectCompleteListener;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyFilter;->byteDanceFilter:Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->setOnDetectCompleteListener(Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper$IFaceDetectCompleteListener;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public updateBeautyBodyValue(Ljava/lang/String;Ljava/lang/String;F)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyFilter;->byteDanceFilter:Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->updateBeautyBodyValue(Ljava/lang/String;Ljava/lang/String;F)Z

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

.method public updateFaceBeautyValue(Ljava/lang/String;Ljava/lang/String;F)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyFilter;->byteDanceFilter:Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->updateFaceBeautyValue(Ljava/lang/String;Ljava/lang/String;F)Z

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

.method public updateMakeupStyleValue(Ljava/lang/String;Ljava/lang/String;F)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyFilter;->byteDanceFilter:Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->updateMakeupStyleValue(Ljava/lang/String;Ljava/lang/String;F)Z

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

.method public updateMakeupValue(Ljava/lang/String;Ljava/lang/String;F)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyFilter;->byteDanceFilter:Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFilter;->updateMakeupValue(Ljava/lang/String;Ljava/lang/String;F)Z

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
