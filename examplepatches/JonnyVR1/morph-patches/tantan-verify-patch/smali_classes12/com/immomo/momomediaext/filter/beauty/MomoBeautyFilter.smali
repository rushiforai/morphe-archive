.class public Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;
.super Lcom/momo/mcamera/mask/FaceFilterPipeline;
.source "SourceFile"


# instance fields
.field private context:Landroid/content/Context;

.field private destroyList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/jt2;",
            ">;"
        }
    .end annotation
.end field

.field private faceLightingFilter:Ll/jt2;

.field private faceWarpFilter:Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;

.field private skinSmoothFilter:Ll/jt2;

.field private skinSmoothManager:Ll/orf0;

.field private skinWhiteningManager:Ll/qrf0;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/mask/FaceFilterPipeline;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;->destroyList:Ljava/util/List;

    .line 10
    .line 11
    iput-object p1, p0, Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;->context:Landroid/content/Context;

    .line 12
    .line 13
    new-instance v0, Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;

    .line 14
    .line 15
    invoke-direct {v0}, Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;->faceWarpFilter:Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;

    .line 19
    .line 20
    const/4 v1, 0x1

    .line 21
    invoke-virtual {v0, v1}, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->setMaxFaces(I)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;->faceWarpFilter:Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;

    .line 25
    .line 26
    check-cast v0, Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;->setEnableWarp(Z)V

    .line 29
    .line 30
    .line 31
    new-instance v0, Ll/qrf0;

    .line 32
    .line 33
    invoke-direct {v0}, Ll/qrf0;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;->skinWhiteningManager:Ll/qrf0;

    .line 37
    .line 38
    invoke-virtual {v0, p1, v1}, Ll/qrf0;->b(Landroid/content/Context;I)Ll/jt2;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iput-object p1, p0, Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;->faceLightingFilter:Ll/jt2;

    .line 43
    .line 44
    new-instance p1, Ll/orf0;

    .line 45
    .line 46
    invoke-direct {p1}, Ll/orf0;-><init>()V

    .line 47
    .line 48
    .line 49
    iput-object p1, p0, Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;->skinSmoothManager:Ll/orf0;

    .line 50
    .line 51
    invoke-virtual {p1, v1}, Ll/orf0;->a(I)Ll/jt2;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    iput-object p1, p0, Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;->skinSmoothFilter:Ll/jt2;

    .line 56
    .line 57
    new-instance p1, Ljava/util/ArrayList;

    .line 58
    .line 59
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;->faceWarpFilter:Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;

    .line 63
    .line 64
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;->skinSmoothFilter:Ll/jt2;

    .line 68
    .line 69
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;->faceLightingFilter:Ll/jt2;

    .line 73
    .line 74
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/FaceFilterPipeline;->constructGroupFilter(Ljava/util/List;)V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method private setSkinLightingLevel(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;->skinWhiteningManager:Ll/qrf0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/qrf0;->c(F)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method private setSkinSmoothLevel(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;->skinSmoothManager:Ll/orf0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/orf0;->c(F)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method


# virtual methods
.method public changeDokiBeautyFilter(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;->faceWarpFilter:Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/16 v1, 0xa

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->setWarpType(I)V

    .line 8
    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/16 v1, 0x9

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->setWarpType(I)V

    .line 14
    .line 15
    .line 16
    :goto_0
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;->switchSmoothFilter(Z)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;->switchWhiteningFilter(Z)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public declared-synchronized destroy()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-super {p0}, Ll/ogk;->destroy()V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;->destroyList:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-lez v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;->destroyList:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Ll/jt2;

    .line 30
    .line 31
    invoke-virtual {v1}, Ll/gfj;->destroy()V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :catchall_0
    move-exception v0

    .line 36
    goto :goto_1

    .line 37
    :cond_0
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;->destroyList:Ljava/util/List;

    .line 38
    .line 39
    invoke-interface {v0}, Ljava/util/List;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 40
    .line 41
    .line 42
    :cond_1
    monitor-exit p0

    .line 43
    return-void

    .line 44
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 45
    throw v0
.end method

.method public newTextureReady(ILl/gfj;Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/ogk;->newTextureReady(ILl/gfj;Z)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;->destroyList:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-lez p1, :cond_1

    .line 11
    .line 12
    iget-object p1, p0, Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;->destroyList:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    if-eqz p2, :cond_0

    .line 23
    .line 24
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    check-cast p2, Ll/jt2;

    .line 29
    .line 30
    invoke-virtual {p2}, Ll/gfj;->destroy()V

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;->destroyList:Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 37
    .line 38
    .line 39
    :cond_1
    return-void
.end method

.method public setMMCVInfo(Ll/omw;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Lcom/momo/mcamera/mask/FaceFilterPipeline;->setMMCVInfo(Ll/omw;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/FaceFilterPipeline;->getFilters()Ljava/util/List;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, 0x0

    .line 13
    :goto_0
    if-ge v1, v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/FaceFilterPipeline;->getFilters()Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    instance-of v2, v2, Ll/suf;

    .line 24
    .line 25
    if-eqz v2, :cond_0

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/FaceFilterPipeline;->getFilters()Ljava/util/List;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    check-cast v2, Ll/suf;

    .line 36
    .line 37
    invoke-interface {v2, p1}, Ll/suf;->setMMCVInfo(Ll/omw;)V

    .line 38
    .line 39
    .line 40
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    return-void
.end method

.method public setWarpScaleFactor(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;->faceWarpFilter:Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->setScaleFactor(F)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setWarpType(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;->faceWarpFilter:Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->setWarpType(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public switchSmoothFilter(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;->skinSmoothManager:Ll/orf0;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/orf0;->b()F

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object v1, p0, Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;->skinSmoothManager:Ll/orf0;

    .line 10
    .line 11
    invoke-virtual {v1, p1}, Ll/orf0;->a(I)Ll/jt2;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object v1, p0, Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;->skinSmoothFilter:Ll/jt2;

    .line 16
    .line 17
    if-eq v1, p1, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0, v1, p1}, Lcom/momo/mcamera/mask/FaceFilterPipeline;->resetFilter(Ll/jt2;Ll/jt2;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    iget-object v1, p0, Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;->destroyList:Ljava/util/List;

    .line 26
    .line 27
    iget-object v2, p0, Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;->skinSmoothFilter:Ll/jt2;

    .line 28
    .line 29
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    iput-object p1, p0, Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;->skinSmoothFilter:Ll/jt2;

    .line 33
    .line 34
    :cond_0
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;->skinSmoothManager:Ll/orf0;

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Ll/orf0;->c(F)V

    .line 37
    .line 38
    .line 39
    :cond_1
    return-void
.end method

.method public switchWhiteningFilter(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;->skinWhiteningManager:Ll/qrf0;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/qrf0;->a()F

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object v1, p0, Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;->skinWhiteningManager:Ll/qrf0;

    .line 10
    .line 11
    iget-object v2, p0, Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;->context:Landroid/content/Context;

    .line 12
    .line 13
    invoke-virtual {v1, v2, p1}, Ll/qrf0;->b(Landroid/content/Context;I)Ll/jt2;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iget-object v1, p0, Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;->faceLightingFilter:Ll/jt2;

    .line 18
    .line 19
    if-eq v1, p1, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0, v1, p1}, Lcom/momo/mcamera/mask/FaceFilterPipeline;->resetFilter(Ll/jt2;Ll/jt2;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    iget-object v1, p0, Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;->destroyList:Ljava/util/List;

    .line 28
    .line 29
    iget-object v2, p0, Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;->faceLightingFilter:Ll/jt2;

    .line 30
    .line 31
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    iput-object p1, p0, Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;->faceLightingFilter:Ll/jt2;

    .line 35
    .line 36
    :cond_0
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;->skinWhiteningManager:Ll/qrf0;

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Ll/qrf0;->c(F)V

    .line 39
    .line 40
    .line 41
    :cond_1
    return-void
.end method

.method public updateFaceBeautyValue(Ljava/lang/String;F)V
    .locals 1

    .line 1
    const-string v0, "skin_whitening"

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-direct {p0, p2}, Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;->setSkinLightingLevel(F)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    const-string v0, "skin_smooth"

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    invoke-direct {p0, p2}, Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;->setSkinSmoothLevel(F)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    const/4 v0, 0x0

    .line 26
    cmpl-float v0, p2, v0

    .line 27
    .line 28
    if-nez v0, :cond_2

    .line 29
    .line 30
    const p2, 0x3c23d70a    # 0.01f

    .line 31
    .line 32
    .line 33
    :cond_2
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/MomoBeautyFilter;->faceWarpFilter:Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;

    .line 34
    .line 35
    if-eqz p0, :cond_3

    .line 36
    .line 37
    invoke-interface {p0, p1, p2}, Lcom/momo/mcamera/mask/facewarp/IFaceWarp;->changeFaceBeautyValue(Ljava/lang/String;F)V

    .line 38
    .line 39
    .line 40
    :cond_3
    return-void
.end method
