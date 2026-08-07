.class public Lcom/momo/mcamera/mask/FaceFilterPipeline;
.super Lcom/momo/mcamera/mask/FaceDetectGroupFilter;
.source "SourceFile"


# instance fields
.field private mFilters:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/jt2;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/mask/FaceDetectGroupFilter;-><init>()V

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
    iput-object v0, p0, Lcom/momo/mcamera/mask/FaceFilterPipeline;->mFilters:Ljava/util/List;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public addTerminalFilter(Ll/jt2;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/FaceFilterPipeline;->mFilters:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/ogk;->getTerminalFilters()Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p1, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, p1}, Ll/ogk;->registerInitialFilter(Ll/jt2;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, p1}, Ll/ogk;->registerTerminalFilter(Ll/jt2;)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Lcom/momo/mcamera/mask/FaceFilterPipeline;->mFilters:Ljava/util/List;

    .line 29
    .line 30
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    invoke-virtual {p0}, Ll/ogk;->getTerminalFilters()Ljava/util/List;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const/4 v1, 0x0

    .line 39
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    check-cast v0, Ll/jt2;

    .line 44
    .line 45
    iget-object v1, p0, Lcom/momo/mcamera/mask/FaceFilterPipeline;->mFilters:Ljava/util/List;

    .line 46
    .line 47
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    add-int/lit8 v2, v2, -0x1

    .line 52
    .line 53
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    if-ne v1, v0, :cond_1

    .line 58
    .line 59
    invoke-virtual {v0, p0}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0, v0}, Ll/ogk;->removeTerminalFilter(Ll/jt2;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0, p1}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0, v0}, Ll/ogk;->registerFilter(Ll/jt2;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0, p1}, Ll/ogk;->registerTerminalFilter(Ll/jt2;)V

    .line 75
    .line 76
    .line 77
    iget-object p0, p0, Lcom/momo/mcamera/mask/FaceFilterPipeline;->mFilters:Ljava/util/List;

    .line 78
    .line 79
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    :cond_1
    return-void
.end method

.method public constructGroupFilter(Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/jt2;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-lez v0, :cond_3

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    check-cast v2, Ll/jt2;

    .line 13
    .line 14
    add-int/lit8 v3, v0, -0x1

    .line 15
    .line 16
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v4

    .line 20
    check-cast v4, Ll/jt2;

    .line 21
    .line 22
    invoke-virtual {p0, v2}, Ll/ogk;->registerInitialFilter(Ll/jt2;)V

    .line 23
    .line 24
    .line 25
    const/4 v2, 0x0

    .line 26
    :goto_0
    if-ge v1, v0, :cond_2

    .line 27
    .line 28
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v5

    .line 32
    check-cast v5, Ll/jt2;

    .line 33
    .line 34
    invoke-virtual {v5}, Ll/gfj;->clearTarget()V

    .line 35
    .line 36
    .line 37
    if-eqz v2, :cond_0

    .line 38
    .line 39
    invoke-virtual {v2, v5}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    if-lez v1, :cond_1

    .line 43
    .line 44
    if-ge v1, v3, :cond_1

    .line 45
    .line 46
    invoke-virtual {p0, v5}, Ll/ogk;->registerFilter(Ll/jt2;)V

    .line 47
    .line 48
    .line 49
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 50
    .line 51
    move-object v2, v5

    .line 52
    goto :goto_0

    .line 53
    :cond_2
    invoke-virtual {v4, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0, v4}, Ll/ogk;->registerTerminalFilter(Ll/jt2;)V

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Lcom/momo/mcamera/mask/FaceFilterPipeline;->mFilters:Ljava/util/List;

    .line 60
    .line 61
    invoke-interface {p0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 62
    .line 63
    .line 64
    :cond_3
    return-void
.end method

.method public destructGroupFilter()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/FaceFilterPipeline;->mFilters:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_1

    .line 8
    .line 9
    iget-object v1, p0, Lcom/momo/mcamera/mask/FaceFilterPipeline;->mFilters:Ljava/util/List;

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Ll/jt2;

    .line 17
    .line 18
    iget-object v2, p0, Lcom/momo/mcamera/mask/FaceFilterPipeline;->mFilters:Ljava/util/List;

    .line 19
    .line 20
    add-int/lit8 v0, v0, -0x1

    .line 21
    .line 22
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    check-cast v2, Ll/jt2;

    .line 27
    .line 28
    :goto_0
    if-ltz v0, :cond_0

    .line 29
    .line 30
    iget-object v3, p0, Lcom/momo/mcamera/mask/FaceFilterPipeline;->mFilters:Ljava/util/List;

    .line 31
    .line 32
    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    check-cast v3, Ll/jt2;

    .line 37
    .line 38
    invoke-virtual {v3}, Ll/gfj;->clearTarget()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0, v3}, Ll/ogk;->removeFilter(Ll/jt2;)V

    .line 42
    .line 43
    .line 44
    add-int/lit8 v0, v0, -0x1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    invoke-virtual {v2}, Ll/gfj;->clearTarget()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0, v1}, Ll/ogk;->removeInitialFilter(Ll/jt2;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0, v2}, Ll/ogk;->removeTerminalFilter(Ll/jt2;)V

    .line 54
    .line 55
    .line 56
    iget-object p0, p0, Lcom/momo/mcamera/mask/FaceFilterPipeline;->mFilters:Ljava/util/List;

    .line 57
    .line 58
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 59
    .line 60
    .line 61
    :cond_1
    return-void
.end method

.method public getFilters()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/jt2;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/FaceFilterPipeline;->mFilters:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public insertFilter(Ll/jt2;Ll/jt2;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/FaceFilterPipeline;->mFilters:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    :goto_0
    if-ge v1, v0, :cond_3

    .line 9
    .line 10
    iget-object v2, p0, Lcom/momo/mcamera/mask/FaceFilterPipeline;->mFilters:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    if-ne v2, p1, :cond_2

    .line 17
    .line 18
    add-int/lit8 v0, v0, -0x1

    .line 19
    .line 20
    if-ge v1, v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Lcom/momo/mcamera/mask/FaceFilterPipeline;->mFilters:Ljava/util/List;

    .line 23
    .line 24
    add-int/lit8 v2, v1, 0x1

    .line 25
    .line 26
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Ll/jt2;

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_0
    const/4 v0, 0x0

    .line 34
    :goto_1
    if-eqz v0, :cond_1

    .line 35
    .line 36
    invoke-virtual {p1, v0}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1, p2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p2, v0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, p2}, Ll/ogk;->registerFilter(Ll/jt2;)V

    .line 46
    .line 47
    .line 48
    goto :goto_2

    .line 49
    :cond_1
    invoke-virtual {p1, p0}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0, p1}, Ll/ogk;->removeTerminalFilter(Ll/jt2;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p1, p2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p2, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0, p1}, Ll/ogk;->registerFilter(Ll/jt2;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0, p2}, Ll/ogk;->registerTerminalFilter(Ll/jt2;)V

    .line 65
    .line 66
    .line 67
    goto :goto_2

    .line 68
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_3
    const/4 v1, -0x1

    .line 72
    :goto_2
    if-lez v1, :cond_4

    .line 73
    .line 74
    iget-object p0, p0, Lcom/momo/mcamera/mask/FaceFilterPipeline;->mFilters:Ljava/util/List;

    .line 75
    .line 76
    add-int/lit8 v1, v1, 0x1

    .line 77
    .line 78
    invoke-interface {p0, v1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 79
    .line 80
    .line 81
    :cond_4
    return-void
.end method

.method public removeDstFilter(Ll/jt2;)Z
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/FaceFilterPipeline;->mFilters:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    move v2, v1

    .line 9
    :goto_0
    const/4 v3, 0x1

    .line 10
    if-ge v2, v0, :cond_5

    .line 11
    .line 12
    iget-object v4, p0, Lcom/momo/mcamera/mask/FaceFilterPipeline;->mFilters:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v4

    .line 18
    check-cast v4, Ll/jt2;

    .line 19
    .line 20
    if-ne p1, v4, :cond_4

    .line 21
    .line 22
    const/4 v4, 0x0

    .line 23
    if-lez v2, :cond_0

    .line 24
    .line 25
    iget-object v5, p0, Lcom/momo/mcamera/mask/FaceFilterPipeline;->mFilters:Ljava/util/List;

    .line 26
    .line 27
    add-int/lit8 v6, v2, -0x1

    .line 28
    .line 29
    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v5

    .line 33
    check-cast v5, Ll/jt2;

    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_0
    move-object v5, v4

    .line 37
    :goto_1
    sub-int/2addr v0, v3

    .line 38
    if-ge v2, v0, :cond_1

    .line 39
    .line 40
    iget-object v0, p0, Lcom/momo/mcamera/mask/FaceFilterPipeline;->mFilters:Ljava/util/List;

    .line 41
    .line 42
    add-int/lit8 v4, v2, 0x1

    .line 43
    .line 44
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    move-object v4, v0

    .line 49
    check-cast v4, Ll/jt2;

    .line 50
    .line 51
    :cond_1
    if-nez v5, :cond_2

    .line 52
    .line 53
    if-eqz v4, :cond_2

    .line 54
    .line 55
    invoke-virtual {p1, v4}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0, p1}, Ll/ogk;->removeInitialFilter(Ll/jt2;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0, v4}, Ll/ogk;->registerInitialFilter(Ll/jt2;)V

    .line 62
    .line 63
    .line 64
    goto :goto_2

    .line 65
    :cond_2
    if-eqz v5, :cond_3

    .line 66
    .line 67
    if-nez v4, :cond_3

    .line 68
    .line 69
    invoke-virtual {v5, p1}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v5, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0, p1}, Ll/ogk;->removeTerminalFilter(Ll/jt2;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p0, v5}, Ll/ogk;->registerTerminalFilter(Ll/jt2;)V

    .line 79
    .line 80
    .line 81
    goto :goto_2

    .line 82
    :cond_3
    if-eqz v5, :cond_6

    .line 83
    .line 84
    if-eqz v4, :cond_6

    .line 85
    .line 86
    invoke-virtual {v5, p1}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p1, v4}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v5, v4}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {p0, p1}, Ll/ogk;->removeFilter(Ll/jt2;)V

    .line 96
    .line 97
    .line 98
    goto :goto_2

    .line 99
    :cond_4
    add-int/lit8 v2, v2, 0x1

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_5
    const/4 v2, -0x1

    .line 103
    :cond_6
    :goto_2
    if-gez v2, :cond_7

    .line 104
    .line 105
    return v1

    .line 106
    :cond_7
    iget-object p0, p0, Lcom/momo/mcamera/mask/FaceFilterPipeline;->mFilters:Ljava/util/List;

    .line 107
    .line 108
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    return v3
.end method

.method public resetFilter(Ll/jt2;Ll/jt2;)Z
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    if-ne p1, p2, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    iget-object v1, p0, Lcom/momo/mcamera/mask/FaceFilterPipeline;->mFilters:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    move v2, v0

    .line 12
    :goto_0
    const/4 v3, 0x1

    .line 13
    if-ge v2, v1, :cond_7

    .line 14
    .line 15
    iget-object v4, p0, Lcom/momo/mcamera/mask/FaceFilterPipeline;->mFilters:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v4

    .line 21
    check-cast v4, Ll/jt2;

    .line 22
    .line 23
    if-ne v4, p1, :cond_6

    .line 24
    .line 25
    const/4 v4, 0x0

    .line 26
    if-lez v2, :cond_1

    .line 27
    .line 28
    iget-object v5, p0, Lcom/momo/mcamera/mask/FaceFilterPipeline;->mFilters:Ljava/util/List;

    .line 29
    .line 30
    add-int/lit8 v6, v2, -0x1

    .line 31
    .line 32
    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v5

    .line 36
    check-cast v5, Ll/jt2;

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_1
    move-object v5, v4

    .line 40
    :goto_1
    sub-int/2addr v1, v3

    .line 41
    if-ge v2, v1, :cond_2

    .line 42
    .line 43
    iget-object v1, p0, Lcom/momo/mcamera/mask/FaceFilterPipeline;->mFilters:Ljava/util/List;

    .line 44
    .line 45
    add-int/lit8 v4, v2, 0x1

    .line 46
    .line 47
    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    move-object v4, v1

    .line 52
    check-cast v4, Ll/jt2;

    .line 53
    .line 54
    :cond_2
    if-nez v5, :cond_3

    .line 55
    .line 56
    if-nez v4, :cond_3

    .line 57
    .line 58
    invoke-virtual {p1, p0}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0, p1}, Ll/ogk;->removeInitialFilter(Ll/jt2;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0, p1}, Ll/ogk;->removeTerminalFilter(Ll/jt2;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p2, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0, p2}, Ll/ogk;->registerInitialFilter(Ll/jt2;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0, p2}, Ll/ogk;->registerTerminalFilter(Ll/jt2;)V

    .line 74
    .line 75
    .line 76
    goto :goto_2

    .line 77
    :cond_3
    if-nez v5, :cond_4

    .line 78
    .line 79
    invoke-virtual {p1, v4}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0, p1}, Ll/ogk;->removeInitialFilter(Ll/jt2;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p2, v4}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0, p2}, Ll/ogk;->registerInitialFilter(Ll/jt2;)V

    .line 89
    .line 90
    .line 91
    goto :goto_2

    .line 92
    :cond_4
    if-nez v4, :cond_5

    .line 93
    .line 94
    invoke-virtual {v5, p1}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p1, p0}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {p0, p1}, Ll/ogk;->removeTerminalFilter(Ll/jt2;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {v5, p2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {p2, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {p0, p2}, Ll/ogk;->registerTerminalFilter(Ll/jt2;)V

    .line 110
    .line 111
    .line 112
    goto :goto_2

    .line 113
    :cond_5
    invoke-virtual {v5, p1}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {p1, v4}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {p0, p1}, Ll/ogk;->removeFilter(Ll/jt2;)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {v5, p2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {p2, v4}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {p0, p2}, Ll/ogk;->registerFilter(Ll/jt2;)V

    .line 129
    .line 130
    .line 131
    goto :goto_2

    .line 132
    :cond_6
    add-int/lit8 v2, v2, 0x1

    .line 133
    .line 134
    goto :goto_0

    .line 135
    :cond_7
    const/4 v2, -0x1

    .line 136
    :goto_2
    if-gez v2, :cond_8

    .line 137
    .line 138
    return v0

    .line 139
    :cond_8
    iget-object v0, p0, Lcom/momo/mcamera/mask/FaceFilterPipeline;->mFilters:Ljava/util/List;

    .line 140
    .line 141
    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 142
    .line 143
    .line 144
    iget-object p0, p0, Lcom/momo/mcamera/mask/FaceFilterPipeline;->mFilters:Ljava/util/List;

    .line 145
    .line 146
    invoke-interface {p0, v2, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 147
    .line 148
    .line 149
    return v3
.end method

.method public setMMCVInfo(Ll/omw;)V
    .locals 0

    .line 1
    return-void
.end method
