.class public Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;
.super Lcom/momo/mcamera/mask/FaceFilterPipeline;
.source "SourceFile"

# interfaces
.implements Lcom/immomo/momomediaext/filter/beauty/IBeautyAdapter;


# instance fields
.field private byteDanceBeautyFilter:Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyFilter;

.field private context:Landroid/content/Context;

.field private currentType:I

.field private enableDraw:Z

.field private listener:Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper$IBeautyErrorListener;

.field private lookupFilter:Lcom/immomo/momomediaext/filter/beauty/BeautyLookupFilter;

.field private momoBeautyFilter:Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;

.field private normalFilter:Lcom/momo/mcamera/mask/NormalFilter;

.field private warpScaleFactor:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/mask/FaceFilterPipeline;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, -0x40800000    # -1.0f

    .line 5
    .line 6
    iput v0, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->warpScaleFactor:F

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->enableDraw:Z

    .line 10
    .line 11
    iput-object p1, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->context:Landroid/content/Context;

    .line 12
    .line 13
    new-instance p1, Lcom/momo/mcamera/mask/NormalFilter;

    .line 14
    .line 15
    invoke-direct {p1}, Lcom/momo/mcamera/mask/NormalFilter;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->normalFilter:Lcom/momo/mcamera/mask/NormalFilter;

    .line 19
    .line 20
    new-instance p1, Lcom/immomo/momomediaext/filter/beauty/BeautyLookupFilter;

    .line 21
    .line 22
    invoke-direct {p1}, Lcom/immomo/momomediaext/filter/beauty/BeautyLookupFilter;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object p1, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->lookupFilter:Lcom/immomo/momomediaext/filter/beauty/BeautyLookupFilter;

    .line 26
    .line 27
    new-instance p1, Ljava/util/ArrayList;

    .line 28
    .line 29
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->normalFilter:Lcom/momo/mcamera/mask/NormalFilter;

    .line 33
    .line 34
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->lookupFilter:Lcom/immomo/momomediaext/filter/beauty/BeautyLookupFilter;

    .line 38
    .line 39
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/FaceFilterPipeline;->constructGroupFilter(Ljava/util/List;)V

    .line 43
    .line 44
    .line 45
    const/4 p1, -0x1

    .line 46
    iput p1, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->currentType:I

    .line 47
    .line 48
    return-void
.end method

.method private buildByteDanceFilter()V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->isByteDanceBeautyFilter()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->byteDanceBeautyFilter:Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyFilter;

    .line 9
    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    new-instance v0, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyFilter;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->context:Landroid/content/Context;

    .line 15
    .line 16
    iget-object v2, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->listener:Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper$IBeautyErrorListener;

    .line 17
    .line 18
    invoke-direct {v0, v1, v2}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyFilter;-><init>(Landroid/content/Context;Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper$IBeautyErrorListener;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->byteDanceBeautyFilter:Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyFilter;

    .line 22
    .line 23
    :cond_1
    iget v0, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->currentType:I

    .line 24
    .line 25
    const/4 v1, -0x1

    .line 26
    if-ne v0, v1, :cond_2

    .line 27
    .line 28
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->normalFilter:Lcom/momo/mcamera/mask/NormalFilter;

    .line 29
    .line 30
    iget-object v1, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->byteDanceBeautyFilter:Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyFilter;

    .line 31
    .line 32
    invoke-virtual {p0, v0, v1}, Lcom/momo/mcamera/mask/FaceFilterPipeline;->resetFilter(Ll/jt2;Ll/jt2;)Z

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_2
    invoke-direct {p0}, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->isMomoBeautyFilter()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_3

    .line 41
    .line 42
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->momoBeautyFilter:Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;

    .line 43
    .line 44
    iget-object v1, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->byteDanceBeautyFilter:Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyFilter;

    .line 45
    .line 46
    invoke-virtual {p0, v0, v1}, Lcom/momo/mcamera/mask/FaceFilterPipeline;->resetFilter(Ll/jt2;Ll/jt2;)Z

    .line 47
    .line 48
    .line 49
    :cond_3
    :goto_0
    return-void
.end method

.method private buildMomoFilter()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->isMomoBeautyFilter()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->momoBeautyFilter:Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;

    .line 9
    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    new-instance v0, Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->context:Landroid/content/Context;

    .line 15
    .line 16
    invoke-direct {v0, v1}, Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;-><init>(Landroid/content/Context;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->momoBeautyFilter:Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;

    .line 20
    .line 21
    :cond_1
    iget v0, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->currentType:I

    .line 22
    .line 23
    const/4 v1, -0x1

    .line 24
    if-ne v0, v1, :cond_2

    .line 25
    .line 26
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->normalFilter:Lcom/momo/mcamera/mask/NormalFilter;

    .line 27
    .line 28
    iget-object v1, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->momoBeautyFilter:Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;

    .line 29
    .line 30
    invoke-virtual {p0, v0, v1}, Lcom/momo/mcamera/mask/FaceFilterPipeline;->resetFilter(Ll/jt2;Ll/jt2;)Z

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_2
    invoke-direct {p0}, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->isByteDanceBeautyFilter()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_3

    .line 39
    .line 40
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->byteDanceBeautyFilter:Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyFilter;

    .line 41
    .line 42
    iget-object v1, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->momoBeautyFilter:Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;

    .line 43
    .line 44
    invoke-virtual {p0, v0, v1}, Lcom/momo/mcamera/mask/FaceFilterPipeline;->resetFilter(Ll/jt2;Ll/jt2;)Z

    .line 45
    .line 46
    .line 47
    :cond_3
    :goto_0
    return-void
.end method

.method private clear()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->normalFilter:Lcom/momo/mcamera/mask/NormalFilter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/gfj;->destroy()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->momoBeautyFilter:Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;->destroy()V

    .line 13
    .line 14
    .line 15
    :cond_1
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->byteDanceBeautyFilter:Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyFilter;

    .line 16
    .line 17
    if-eqz p0, :cond_2

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyFilter;->destroy()V

    .line 20
    .line 21
    .line 22
    :cond_2
    return-void
.end method

.method private isByteDanceBeautyFilter()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->currentType:I

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method private isMomoBeautyFilter()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->currentType:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eqz p0, :cond_1

    .line 5
    .line 6
    if-ne p0, v0, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_1
    :goto_0
    return v0
.end method


# virtual methods
.method public changeFaceWarp(IFF)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->isMomoBeautyFilter()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->momoBeautyFilter:Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;->setWarpType(I)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->momoBeautyFilter:Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;

    .line 13
    .line 14
    const-string v0, "thin_face"

    .line 15
    .line 16
    invoke-virtual {p1, v0, p2}, Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;->updateFaceBeautyValue(Ljava/lang/String;F)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->momoBeautyFilter:Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;

    .line 20
    .line 21
    const-string p1, "big_eye"

    .line 22
    .line 23
    invoke-virtual {p0, p1, p3}, Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;->updateFaceBeautyValue(Ljava/lang/String;F)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public changeLookupFilter(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->lookupFilter:Lcom/immomo/momomediaext/filter/beauty/BeautyLookupFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/filter/beauty/BeautyLookupFilter;->setLookupPath(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public changeWarpScaleFactor(F)V
    .locals 1

    .line 1
    iput p1, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->warpScaleFactor:F

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->isMomoBeautyFilter()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->momoBeautyFilter:Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;->setWarpScaleFactor(F)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public declared-synchronized destroy()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-super {p0}, Ll/ogk;->destroy()V

    .line 3
    .line 4
    .line 5
    invoke-direct {p0}, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 6
    .line 7
    .line 8
    monitor-exit p0

    .line 9
    return-void

    .line 10
    :catchall_0
    move-exception v0

    .line 11
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 12
    throw v0
.end method

.method public enableDraw(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->enableDraw:Z

    .line 2
    .line 3
    return-void
.end method

.method public forbidBeauty(Z)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->isByteDanceBeautyFilter()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->byteDanceBeautyFilter:Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyFilter;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyFilter;->forbidBeauty(Z)Z

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public isBeautyEnable()Z
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->isByteDanceBeautyFilter()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->byteDanceBeautyFilter:Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyFilter;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyFilter;->isByteDanceBeautyEnable()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x1

    .line 15
    return p0
.end method

.method public isEnableDraw()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->enableDraw:Z

    .line 2
    .line 3
    return p0
.end method

.method public newTextureReady(ILl/gfj;Z)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->enableDraw:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0, p1, p2, p3}, Ll/ogk;->newTextureReady(ILl/gfj;Z)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-virtual {p2}, Ll/wej;->getWidth()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-virtual {p0, v0}, Ll/wej;->setWidth(I)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p2}, Ll/wej;->getHeight()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-virtual {p0, v0}, Ll/wej;->setHeight(I)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ll/gfj;->getLockObject()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    monitor-enter v0

    .line 28
    :try_start_0
    invoke-virtual {p0}, Ll/gfj;->getRenderTargets()Ljava/util/List;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    if-eqz v2, :cond_1

    .line 41
    .line 42
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    check-cast v2, Ll/dfj;

    .line 47
    .line 48
    iget-object v3, p2, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 49
    .line 50
    iput-object v3, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 51
    .line 52
    invoke-interface {v2, p1, p0, p3}, Ll/dfj;->newTextureReady(ILl/gfj;Z)V

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :catchall_0
    move-exception p0

    .line 57
    goto :goto_1

    .line 58
    :cond_1
    monitor-exit v0

    .line 59
    return-void

    .line 60
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 61
    throw p0
.end method

.method public release()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->byteDanceBeautyFilter:Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyFilter;->release()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public removeBody(Ljava/lang/String;)Z
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->isByteDanceBeautyFilter()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->byteDanceBeautyFilter:Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyFilter;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyFilter;->removeBody(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public removeMakeup(Ljava/lang/String;)Z
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->isByteDanceBeautyFilter()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->byteDanceBeautyFilter:Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyFilter;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyFilter;->removeMakeup(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public removeMakeupStyle(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->isByteDanceBeautyFilter()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->byteDanceBeautyFilter:Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyFilter;

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyFilter;->removeMakeupStyle(Ljava/lang/String;Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public setMMCVInfo(Ll/omw;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->isMomoBeautyFilter()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->momoBeautyFilter:Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;->setMMCVInfo(Ll/omw;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-direct {p0}, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->isByteDanceBeautyFilter()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->byteDanceBeautyFilter:Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyFilter;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyFilter;->setMMCVInfo(Ll/omw;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    return-void
.end method

.method public setOnBeautyErrorListener(Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper$IBeautyErrorListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->listener:Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper$IBeautyErrorListener;

    .line 2
    .line 3
    return-void
.end method

.method public setOnDetectCompleteListener(Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper$IFaceDetectCompleteListener;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->byteDanceBeautyFilter:Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyFilter;->setOnDetectCompleteListener(Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper$IFaceDetectCompleteListener;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public switchBeauty(I)V
    .locals 2

    .line 1
    const/4 v0, 0x2

    .line 2
    if-ne p1, v0, :cond_0

    .line 3
    .line 4
    invoke-direct {p0}, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->buildByteDanceFilter()V

    .line 5
    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    invoke-direct {p0}, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->buildMomoFilter()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->momoBeautyFilter:Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    if-ne p1, v1, :cond_1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    const/4 v1, 0x0

    .line 18
    :goto_0
    invoke-virtual {v0, v1}, Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;->changeDokiBeautyFilter(Z)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->momoBeautyFilter:Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;

    .line 22
    .line 23
    iget v1, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->warpScaleFactor:F

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;->setWarpScaleFactor(F)V

    .line 26
    .line 27
    .line 28
    :goto_1
    iput p1, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->currentType:I

    .line 29
    .line 30
    return-void
.end method

.method public switchSmoothFilter(Z)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->isMomoBeautyFilter()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->momoBeautyFilter:Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;->switchSmoothFilter(Z)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->momoBeautyFilter:Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;->switchWhiteningFilter(Z)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public updateBeautyBodyValue(Ljava/lang/String;Ljava/lang/String;F)Z
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->isByteDanceBeautyFilter()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->byteDanceBeautyFilter:Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyFilter;

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2, p3}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyFilter;->updateBeautyBodyValue(Ljava/lang/String;Ljava/lang/String;F)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public updateByteDanceFaceBeautyValue(Ljava/lang/String;Ljava/lang/String;F)Z
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->isByteDanceBeautyFilter()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->byteDanceBeautyFilter:Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyFilter;

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2, p3}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyFilter;->updateFaceBeautyValue(Ljava/lang/String;Ljava/lang/String;F)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public updateFaceBeautyValue(Ljava/lang/String;F)Z
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->isMomoBeautyFilter()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->momoBeautyFilter:Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2}, Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;->updateFaceBeautyValue(Ljava/lang/String;F)V

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x1

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public updateLookupFilterIntensity(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->lookupFilter:Lcom/immomo/momomediaext/filter/beauty/BeautyLookupFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/filter/beauty/BeautyLookupFilter;->setIntensity(F)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public updateMakeupStyleValue(Ljava/lang/String;Ljava/lang/String;F)Z
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->isByteDanceBeautyFilter()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->byteDanceBeautyFilter:Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyFilter;

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2, p3}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyFilter;->updateMakeupStyleValue(Ljava/lang/String;Ljava/lang/String;F)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public updateMakeupValue(Ljava/lang/String;Ljava/lang/String;F)Z
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->isByteDanceBeautyFilter()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->byteDanceBeautyFilter:Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyFilter;

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2, p3}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceBeautyFilter;->updateMakeupValue(Ljava/lang/String;Ljava/lang/String;F)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method
