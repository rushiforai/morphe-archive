.class public Lcom/momo/mcamera/mask/FaceDetectSingleLineGroup;
.super Lcom/momo/mcamera/mask/FaceDetectGroupFilter;
.source "SourceFile"

# interfaces
.implements Ll/gam;


# instance fields
.field private destroyList:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "Ll/jt2;",
            ">;"
        }
    .end annotation
.end field

.field private faceDetectGroupFilters:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/suf;",
            ">;"
        }
    .end annotation
.end field

.field private mFilters:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/jt2;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/jt2;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/mask/FaceDetectGroupFilter;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/momo/mcamera/mask/FaceDetectSingleLineGroup;->faceDetectGroupFilters:Ljava/util/ArrayList;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/momo/mcamera/mask/FaceDetectSingleLineGroup;->mFilters:Ljava/util/ArrayList;

    .line 17
    .line 18
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/momo/mcamera/mask/FaceDetectSingleLineGroup;->destroyList:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 24
    .line 25
    invoke-direct {p0, p1}, Lcom/momo/mcamera/mask/FaceDetectSingleLineGroup;->constructGroupFilter(Ljava/util/List;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method private constructGroupFilter(Ljava/util/List;)V
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
    if-lez v0, :cond_4

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    check-cast v1, Ll/jt2;

    .line 13
    .line 14
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    add-int/lit8 v2, v2, -0x1

    .line 19
    .line 20
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    check-cast v2, Ll/jt2;

    .line 25
    .line 26
    invoke-virtual {p0, v1}, Ll/ogk;->registerInitialFilter(Ll/jt2;)V

    .line 27
    .line 28
    .line 29
    const/4 v1, 0x0

    .line 30
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    add-int/lit8 v3, v3, -0x1

    .line 35
    .line 36
    if-gt v0, v3, :cond_3

    .line 37
    .line 38
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    check-cast v3, Ll/jt2;

    .line 43
    .line 44
    instance-of v4, v3, Ll/suf;

    .line 45
    .line 46
    if-eqz v4, :cond_0

    .line 47
    .line 48
    iget-object v4, p0, Lcom/momo/mcamera/mask/FaceDetectSingleLineGroup;->faceDetectGroupFilters:Ljava/util/ArrayList;

    .line 49
    .line 50
    move-object v5, v3

    .line 51
    check-cast v5, Ll/suf;

    .line 52
    .line 53
    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    :cond_0
    iget-object v4, p0, Lcom/momo/mcamera/mask/FaceDetectSingleLineGroup;->mFilters:Ljava/util/ArrayList;

    .line 57
    .line 58
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    invoke-virtual {v3}, Ll/gfj;->getTargets()Ljava/util/List;

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    invoke-interface {v4}, Ljava/util/List;->clear()V

    .line 66
    .line 67
    .line 68
    if-nez v1, :cond_1

    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_1
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v4

    .line 75
    check-cast v4, Ll/dfj;

    .line 76
    .line 77
    invoke-virtual {v1, v4}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 78
    .line 79
    .line 80
    :goto_1
    if-lez v0, :cond_2

    .line 81
    .line 82
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    add-int/lit8 v1, v1, -0x1

    .line 87
    .line 88
    if-ge v0, v1, :cond_2

    .line 89
    .line 90
    invoke-virtual {p0, v3}, Ll/ogk;->registerFilter(Ll/jt2;)V

    .line 91
    .line 92
    .line 93
    :cond_2
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    check-cast v1, Ll/jt2;

    .line 98
    .line 99
    add-int/lit8 v0, v0, 0x1

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_3
    invoke-virtual {v2, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p0, v2}, Ll/ogk;->registerTerminalFilter(Ll/jt2;)V

    .line 106
    .line 107
    .line 108
    :cond_4
    return-void
.end method

.method private destructGroupFilter()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/FaceDetectSingleLineGroup;->mFilters:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_3

    .line 8
    .line 9
    iget-object v0, p0, Lcom/momo/mcamera/mask/FaceDetectSingleLineGroup;->mFilters:Ljava/util/ArrayList;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ll/jt2;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/momo/mcamera/mask/FaceDetectSingleLineGroup;->mFilters:Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    add-int/lit8 v2, v2, -0x1

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Ll/jt2;

    .line 31
    .line 32
    invoke-virtual {p0, v1}, Ll/ogk;->removeTerminalFilter(Ll/jt2;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1}, Ll/gfj;->clearTarget()V

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Lcom/momo/mcamera/mask/FaceDetectSingleLineGroup;->mFilters:Ljava/util/ArrayList;

    .line 39
    .line 40
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    add-int/lit8 v1, v1, -0x1

    .line 45
    .line 46
    :goto_0
    if-ltz v1, :cond_2

    .line 47
    .line 48
    iget-object v2, p0, Lcom/momo/mcamera/mask/FaceDetectSingleLineGroup;->mFilters:Ljava/util/ArrayList;

    .line 49
    .line 50
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    check-cast v2, Ll/jt2;

    .line 55
    .line 56
    instance-of v3, v2, Ll/suf;

    .line 57
    .line 58
    if-eqz v3, :cond_0

    .line 59
    .line 60
    iget-object v3, p0, Lcom/momo/mcamera/mask/FaceDetectSingleLineGroup;->faceDetectGroupFilters:Ljava/util/ArrayList;

    .line 61
    .line 62
    move-object v4, v2

    .line 63
    check-cast v4, Ll/suf;

    .line 64
    .line 65
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    :cond_0
    invoke-virtual {v2}, Ll/gfj;->clearTarget()V

    .line 69
    .line 70
    .line 71
    if-lez v1, :cond_1

    .line 72
    .line 73
    iget-object v3, p0, Lcom/momo/mcamera/mask/FaceDetectSingleLineGroup;->mFilters:Ljava/util/ArrayList;

    .line 74
    .line 75
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 76
    .line 77
    .line 78
    move-result v3

    .line 79
    add-int/lit8 v3, v3, -0x1

    .line 80
    .line 81
    if-ge v1, v3, :cond_1

    .line 82
    .line 83
    invoke-virtual {p0, v2}, Ll/ogk;->removeFilter(Ll/jt2;)V

    .line 84
    .line 85
    .line 86
    :cond_1
    add-int/lit8 v1, v1, -0x1

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_2
    invoke-virtual {p0, v0}, Ll/ogk;->removeInitialFilter(Ll/jt2;)V

    .line 90
    .line 91
    .line 92
    iget-object p0, p0, Lcom/momo/mcamera/mask/FaceDetectSingleLineGroup;->mFilters:Ljava/util/ArrayList;

    .line 93
    .line 94
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 95
    .line 96
    .line 97
    :cond_3
    return-void
.end method

.method private doDestroyFilters()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/FaceDetectSingleLineGroup;->destroyList:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ll/jt2;

    .line 18
    .line 19
    invoke-virtual {v1}, Ll/gfj;->destroy()V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget-object p0, p0, Lcom/momo/mcamera/mask/FaceDetectSingleLineGroup;->destroyList:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 24
    .line 25
    invoke-virtual {p0}, Ljava/util/concurrent/CopyOnWriteArrayList;->clear()V

    .line 26
    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public declared-synchronized addEndFilter(Ll/jt2;)V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p0}, Ll/gfj;->getLockObject()Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    monitor-enter v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 7
    :try_start_1
    iget-object v1, p0, Lcom/momo/mcamera/mask/FaceDetectSingleLineGroup;->mFilters:Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-lez v1, :cond_1

    .line 14
    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/ogk;->getTerminalFilters()Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    const/4 v3, 0x1

    .line 26
    if-ne v2, v3, :cond_1

    .line 27
    .line 28
    const/4 v2, 0x0

    .line 29
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    check-cast v1, Ll/jt2;

    .line 34
    .line 35
    invoke-virtual {p0, v1}, Ll/ogk;->removeTerminalFilter(Ll/jt2;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0, v1}, Ll/ogk;->registerFilter(Ll/jt2;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1}, Ll/gfj;->getTargets()Ljava/util/List;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1, p1}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p1, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0, p1}, Ll/ogk;->registerTerminalFilter(Ll/jt2;)V

    .line 55
    .line 56
    .line 57
    instance-of v1, p1, Ll/suf;

    .line 58
    .line 59
    if-eqz v1, :cond_0

    .line 60
    .line 61
    iget-object v1, p0, Lcom/momo/mcamera/mask/FaceDetectSingleLineGroup;->faceDetectGroupFilters:Ljava/util/ArrayList;

    .line 62
    .line 63
    move-object v2, p1

    .line 64
    check-cast v2, Ll/suf;

    .line 65
    .line 66
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :catchall_0
    move-exception p1

    .line 71
    goto :goto_1

    .line 72
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/momo/mcamera/mask/FaceDetectSingleLineGroup;->mFilters:Ljava/util/ArrayList;

    .line 73
    .line 74
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    :cond_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 78
    monitor-exit p0

    .line 79
    return-void

    .line 80
    :goto_1
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 81
    :try_start_3
    throw p1

    .line 82
    :catchall_1
    move-exception p1

    .line 83
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 84
    throw p1
.end method

.method public declared-synchronized addFilter(Ll/jt2;)V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p0}, Ll/gfj;->getLockObject()Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    monitor-enter v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 7
    :try_start_1
    iget-object v1, p0, Lcom/momo/mcamera/mask/FaceDetectSingleLineGroup;->mFilters:Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-lez v1, :cond_0

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/ogk;->getInitialFilters()Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    const/4 v3, 0x1

    .line 26
    if-ne v2, v3, :cond_1

    .line 27
    .line 28
    const/4 v2, 0x0

    .line 29
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    check-cast v1, Ll/jt2;

    .line 34
    .line 35
    invoke-virtual {p0, v1}, Ll/ogk;->removeInitialFilter(Ll/jt2;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0, p1}, Ll/ogk;->registerInitialFilter(Ll/jt2;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1}, Ll/gfj;->getTargets()Ljava/util/List;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    invoke-interface {v3}, Ljava/util/List;->clear()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1, v1}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0, v1}, Ll/ogk;->registerFilter(Ll/jt2;)V

    .line 52
    .line 53
    .line 54
    iget-object v1, p0, Lcom/momo/mcamera/mask/FaceDetectSingleLineGroup;->mFilters:Ljava/util/ArrayList;

    .line 55
    .line 56
    invoke-virtual {v1, v2, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :catchall_0
    move-exception p1

    .line 61
    goto :goto_1

    .line 62
    :cond_0
    invoke-virtual {p0, p1}, Ll/ogk;->registerInitialFilter(Ll/jt2;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p1, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0, p1}, Ll/ogk;->registerTerminalFilter(Ll/jt2;)V

    .line 69
    .line 70
    .line 71
    iget-object v1, p0, Lcom/momo/mcamera/mask/FaceDetectSingleLineGroup;->mFilters:Ljava/util/ArrayList;

    .line 72
    .line 73
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    :cond_1
    :goto_0
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 77
    monitor-exit p0

    .line 78
    return-void

    .line 79
    :goto_1
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 80
    :try_start_3
    throw p1

    .line 81
    :catchall_1
    move-exception p1

    .line 82
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 83
    throw p1
.end method

.method public declared-synchronized addFilterToDestroy(Ll/jt2;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/FaceDetectSingleLineGroup;->mFilters:Ljava/util/ArrayList;

    .line 3
    .line 4
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/momo/mcamera/mask/FaceDetectSingleLineGroup;->mFilters:Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception p1

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/FaceDetectSingleLineGroup;->destroyList:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    .line 24
    .line 25
    :cond_1
    monitor-exit p0

    .line 26
    return-void

    .line 27
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 28
    throw p1
.end method

.method public newTextureReady(ILl/gfj;Z)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/gfj;->getLockObject()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    invoke-super {p0, p1, p2, p3}, Ll/ogk;->newTextureReady(ILl/gfj;Z)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Lcom/momo/mcamera/mask/FaceDetectSingleLineGroup;->destroyList:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->size()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-lez p1, :cond_0

    .line 16
    .line 17
    invoke-direct {p0}, Lcom/momo/mcamera/mask/FaceDetectSingleLineGroup;->doDestroyFilters()V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :catchall_0
    move-exception p0

    .line 22
    goto :goto_1

    .line 23
    :cond_0
    :goto_0
    monitor-exit v0

    .line 24
    return-void

    .line 25
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    throw p0
.end method

.method public declared-synchronized removeFilterFromLine(Ll/jt2;)V
    .locals 7

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p0}, Ll/gfj;->getLockObject()Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    monitor-enter v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 10
    monitor-exit p0

    .line 11
    return-void

    .line 12
    :catchall_0
    move-exception p1

    .line 13
    goto/16 :goto_3

    .line 14
    .line 15
    :cond_0
    const/4 v1, 0x0

    .line 16
    :goto_0
    :try_start_2
    iget-object v2, p0, Lcom/momo/mcamera/mask/FaceDetectSingleLineGroup;->mFilters:Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-ge v1, v2, :cond_7

    .line 23
    .line 24
    iget-object v2, p0, Lcom/momo/mcamera/mask/FaceDetectSingleLineGroup;->mFilters:Ljava/util/ArrayList;

    .line 25
    .line 26
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    check-cast v2, Ll/jt2;

    .line 31
    .line 32
    if-ne v2, p1, :cond_6

    .line 33
    .line 34
    const/4 v3, 0x0

    .line 35
    if-lez v1, :cond_1

    .line 36
    .line 37
    iget-object v4, p0, Lcom/momo/mcamera/mask/FaceDetectSingleLineGroup;->mFilters:Ljava/util/ArrayList;

    .line 38
    .line 39
    add-int/lit8 v5, v1, -0x1

    .line 40
    .line 41
    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    check-cast v4, Ll/jt2;

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_1
    move-object v4, v3

    .line 49
    :goto_1
    add-int/lit8 v5, v1, 0x1

    .line 50
    .line 51
    iget-object v6, p0, Lcom/momo/mcamera/mask/FaceDetectSingleLineGroup;->mFilters:Ljava/util/ArrayList;

    .line 52
    .line 53
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    .line 54
    .line 55
    .line 56
    move-result v6

    .line 57
    if-ge v5, v6, :cond_2

    .line 58
    .line 59
    iget-object v3, p0, Lcom/momo/mcamera/mask/FaceDetectSingleLineGroup;->mFilters:Ljava/util/ArrayList;

    .line 60
    .line 61
    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    check-cast v3, Ll/jt2;

    .line 66
    .line 67
    :cond_2
    if-nez v4, :cond_3

    .line 68
    .line 69
    if-eqz v3, :cond_3

    .line 70
    .line 71
    invoke-virtual {v2}, Ll/gfj;->getTargets()Ljava/util/List;

    .line 72
    .line 73
    .line 74
    move-result-object v4

    .line 75
    invoke-interface {v4}, Ljava/util/List;->clear()V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p0, v2}, Ll/ogk;->removeInitialFilter(Ll/jt2;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p0, v3}, Ll/ogk;->registerInitialFilter(Ll/jt2;)V

    .line 82
    .line 83
    .line 84
    goto :goto_2

    .line 85
    :cond_3
    if-nez v3, :cond_4

    .line 86
    .line 87
    if-eqz v4, :cond_4

    .line 88
    .line 89
    invoke-virtual {v4}, Ll/gfj;->getTargets()Ljava/util/List;

    .line 90
    .line 91
    .line 92
    move-result-object v3

    .line 93
    invoke-interface {v3}, Ljava/util/List;->clear()V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v2}, Ll/gfj;->getTargets()Ljava/util/List;

    .line 97
    .line 98
    .line 99
    move-result-object v3

    .line 100
    invoke-interface {v3}, Ljava/util/List;->clear()V

    .line 101
    .line 102
    .line 103
    invoke-virtual {p0, v2}, Ll/ogk;->removeTerminalFilter(Ll/jt2;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {p0, v4}, Ll/ogk;->registerTerminalFilter(Ll/jt2;)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {v4, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 110
    .line 111
    .line 112
    goto :goto_2

    .line 113
    :cond_4
    if-eqz v4, :cond_5

    .line 114
    .line 115
    if-eqz v3, :cond_5

    .line 116
    .line 117
    invoke-virtual {v4, v2}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v2, v3}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {p0, v2}, Ll/ogk;->removeFilter(Ll/jt2;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v4, v3}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 127
    .line 128
    .line 129
    :cond_5
    :goto_2
    iget-object v3, p0, Lcom/momo/mcamera/mask/FaceDetectSingleLineGroup;->mFilters:Ljava/util/ArrayList;

    .line 130
    .line 131
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    iget-object v3, p0, Lcom/momo/mcamera/mask/FaceDetectSingleLineGroup;->destroyList:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 135
    .line 136
    if-eqz v3, :cond_6

    .line 137
    .line 138
    invoke-virtual {v3, v2}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    :cond_6
    add-int/lit8 v1, v1, 0x1

    .line 142
    .line 143
    goto :goto_0

    .line 144
    :cond_7
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 145
    monitor-exit p0

    .line 146
    return-void

    .line 147
    :goto_3
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 148
    :try_start_4
    throw p1

    .line 149
    :catchall_1
    move-exception p1

    .line 150
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 151
    throw p1
.end method

.method public declared-synchronized resetFilter(Ll/jt2;Ll/jt2;)Z
    .locals 8

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p0}, Ll/gfj;->getLockObject()Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    monitor-enter v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz p2, :cond_c

    .line 9
    .line 10
    if-eqz p1, :cond_c

    .line 11
    .line 12
    if-ne p1, p2, :cond_0

    .line 13
    .line 14
    goto/16 :goto_3

    .line 15
    .line 16
    :cond_0
    move v2, v1

    .line 17
    move v3, v2

    .line 18
    :goto_0
    :try_start_1
    iget-object v4, p0, Lcom/momo/mcamera/mask/FaceDetectSingleLineGroup;->mFilters:Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 21
    .line 22
    .line 23
    move-result v4

    .line 24
    const/4 v5, 0x1

    .line 25
    if-ge v2, v4, :cond_8

    .line 26
    .line 27
    iget-object v4, p0, Lcom/momo/mcamera/mask/FaceDetectSingleLineGroup;->mFilters:Ljava/util/ArrayList;

    .line 28
    .line 29
    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    check-cast v4, Ll/jt2;

    .line 34
    .line 35
    if-ne v4, p1, :cond_7

    .line 36
    .line 37
    const/4 v3, 0x0

    .line 38
    if-lez v2, :cond_1

    .line 39
    .line 40
    iget-object v4, p0, Lcom/momo/mcamera/mask/FaceDetectSingleLineGroup;->mFilters:Ljava/util/ArrayList;

    .line 41
    .line 42
    add-int/lit8 v6, v2, -0x1

    .line 43
    .line 44
    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    check-cast v4, Ll/jt2;

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :catchall_0
    move-exception p1

    .line 52
    goto/16 :goto_4

    .line 53
    .line 54
    :cond_1
    move-object v4, v3

    .line 55
    :goto_1
    add-int/lit8 v6, v2, 0x1

    .line 56
    .line 57
    iget-object v7, p0, Lcom/momo/mcamera/mask/FaceDetectSingleLineGroup;->mFilters:Ljava/util/ArrayList;

    .line 58
    .line 59
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    .line 60
    .line 61
    .line 62
    move-result v7

    .line 63
    if-ge v6, v7, :cond_2

    .line 64
    .line 65
    iget-object v3, p0, Lcom/momo/mcamera/mask/FaceDetectSingleLineGroup;->mFilters:Ljava/util/ArrayList;

    .line 66
    .line 67
    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    check-cast v3, Ll/jt2;

    .line 72
    .line 73
    :cond_2
    if-eqz v4, :cond_3

    .line 74
    .line 75
    if-nez v3, :cond_6

    .line 76
    .line 77
    :cond_3
    if-nez v4, :cond_4

    .line 78
    .line 79
    if-eqz v3, :cond_4

    .line 80
    .line 81
    invoke-virtual {p1}, Ll/gfj;->clearTarget()V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p0, p1}, Ll/ogk;->removeInitialFilter(Ll/jt2;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0, p2}, Ll/ogk;->registerTerminalFilter(Ll/jt2;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p2, v3}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 91
    .line 92
    .line 93
    goto :goto_2

    .line 94
    :cond_4
    if-nez v3, :cond_5

    .line 95
    .line 96
    if-eqz v4, :cond_5

    .line 97
    .line 98
    invoke-virtual {v4}, Ll/gfj;->clearTarget()V

    .line 99
    .line 100
    .line 101
    invoke-virtual {p1}, Ll/gfj;->clearTarget()V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p0, p1}, Ll/ogk;->removeTerminalFilter(Ll/jt2;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p0, p2}, Ll/ogk;->registerTerminalFilter(Ll/jt2;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {v4, p2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p2, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 114
    .line 115
    .line 116
    goto :goto_2

    .line 117
    :cond_5
    if-eqz v4, :cond_6

    .line 118
    .line 119
    if-eqz v3, :cond_6

    .line 120
    .line 121
    invoke-virtual {v4, p1}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {p1, v3}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {p0, p1}, Ll/ogk;->removeFilter(Ll/jt2;)V

    .line 128
    .line 129
    .line 130
    invoke-virtual {p0, p2}, Ll/ogk;->registerFilter(Ll/jt2;)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {v4, p2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 134
    .line 135
    .line 136
    invoke-virtual {p2, v3}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 137
    .line 138
    .line 139
    :cond_6
    :goto_2
    move v3, v5

    .line 140
    :cond_7
    add-int/lit8 v2, v2, 0x1

    .line 141
    .line 142
    goto :goto_0

    .line 143
    :cond_8
    if-nez v3, :cond_9

    .line 144
    .line 145
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 146
    monitor-exit p0

    .line 147
    return v1

    .line 148
    :cond_9
    :try_start_2
    instance-of v1, p1, Ll/suf;

    .line 149
    .line 150
    if-eqz v1, :cond_a

    .line 151
    .line 152
    iget-object v1, p0, Lcom/momo/mcamera/mask/FaceDetectSingleLineGroup;->faceDetectGroupFilters:Ljava/util/ArrayList;

    .line 153
    .line 154
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 155
    .line 156
    .line 157
    :cond_a
    instance-of v1, p2, Ll/suf;

    .line 158
    .line 159
    if-eqz v1, :cond_b

    .line 160
    .line 161
    iget-object v1, p0, Lcom/momo/mcamera/mask/FaceDetectSingleLineGroup;->faceDetectGroupFilters:Ljava/util/ArrayList;

    .line 162
    .line 163
    move-object v2, p2

    .line 164
    check-cast v2, Ll/suf;

    .line 165
    .line 166
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 167
    .line 168
    .line 169
    :cond_b
    iget-object v1, p0, Lcom/momo/mcamera/mask/FaceDetectSingleLineGroup;->mFilters:Ljava/util/ArrayList;

    .line 170
    .line 171
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    iget-object p1, p0, Lcom/momo/mcamera/mask/FaceDetectSingleLineGroup;->mFilters:Ljava/util/ArrayList;

    .line 175
    .line 176
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 177
    .line 178
    .line 179
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 180
    monitor-exit p0

    .line 181
    return v5

    .line 182
    :cond_c
    :goto_3
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 183
    monitor-exit p0

    .line 184
    return v1

    .line 185
    :goto_4
    :try_start_4
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 186
    :try_start_5
    throw p1

    .line 187
    :catchall_1
    move-exception p1

    .line 188
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 189
    throw p1
.end method

.method public declared-synchronized resetFilters(Ljava/util/List;)Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/jt2;",
            ">;)",
            "Ljava/util/ArrayList<",
            "Ll/jt2;",
            ">;"
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p0}, Ll/gfj;->getLockObject()Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    monitor-enter v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 7
    :try_start_1
    new-instance v1, Ljava/util/ArrayList;

    .line 8
    .line 9
    iget-object v2, p0, Lcom/momo/mcamera/mask/FaceDetectSingleLineGroup;->mFilters:Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 12
    .line 13
    .line 14
    invoke-direct {p0}, Lcom/momo/mcamera/mask/FaceDetectSingleLineGroup;->destructGroupFilter()V

    .line 15
    .line 16
    .line 17
    invoke-direct {p0, p1}, Lcom/momo/mcamera/mask/FaceDetectSingleLineGroup;->constructGroupFilter(Ljava/util/List;)V

    .line 18
    .line 19
    .line 20
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 21
    monitor-exit p0

    .line 22
    return-object v1

    .line 23
    :catchall_0
    move-exception p1

    .line 24
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 25
    :try_start_3
    throw p1

    .line 26
    :catchall_1
    move-exception p1

    .line 27
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 28
    throw p1
.end method

.method public declared-synchronized setMMCVInfo(Ll/omw;)V
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p0}, Ll/gfj;->getLockObject()Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    monitor-enter v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 7
    :try_start_1
    iget-object v1, p0, Lcom/momo/mcamera/mask/FaceDetectSingleLineGroup;->faceDetectGroupFilters:Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-eqz v2, :cond_0

    .line 18
    .line 19
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    check-cast v2, Ll/suf;

    .line 24
    .line 25
    invoke-interface {v2, p1}, Ll/suf;->setMMCVInfo(Ll/omw;)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :catchall_0
    move-exception p1

    .line 30
    goto :goto_1

    .line 31
    :cond_0
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 32
    monitor-exit p0

    .line 33
    return-void

    .line 34
    :goto_1
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 35
    :try_start_3
    throw p1

    .line 36
    :catchall_1
    move-exception p1

    .line 37
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 38
    throw p1
.end method

.method public declared-synchronized setPlayStatusChangeListener(Ll/aqw;)V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p0}, Ll/gfj;->getLockObject()Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    monitor-enter v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 7
    :try_start_1
    iget-object v1, p0, Lcom/momo/mcamera/mask/FaceDetectSingleLineGroup;->mFilters:Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-eqz v2, :cond_1

    .line 18
    .line 19
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    check-cast v2, Ll/jt2;

    .line 24
    .line 25
    instance-of v3, v2, Lcom/momo/mcamera/mask/StickerAdjustFilter;

    .line 26
    .line 27
    if-eqz v3, :cond_0

    .line 28
    .line 29
    check-cast v2, Lcom/momo/mcamera/mask/StickerAdjustFilter;

    .line 30
    .line 31
    invoke-virtual {v2, p1}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->setplayStatusListener(Ll/aqw;)V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :catchall_0
    move-exception p1

    .line 36
    goto :goto_1

    .line 37
    :cond_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 38
    monitor-exit p0

    .line 39
    return-void

    .line 40
    :goto_1
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 41
    :try_start_3
    throw p1

    .line 42
    :catchall_1
    move-exception p1

    .line 43
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 44
    throw p1
.end method

.method public declared-synchronized setTimeStamp(J)V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p0}, Ll/gfj;->getLockObject()Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    monitor-enter v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 7
    :try_start_1
    iget-object v1, p0, Lcom/momo/mcamera/mask/FaceDetectSingleLineGroup;->mFilters:Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-eqz v2, :cond_1

    .line 18
    .line 19
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    check-cast v2, Ll/jt2;

    .line 24
    .line 25
    instance-of v3, v2, Ll/gam;

    .line 26
    .line 27
    if-eqz v3, :cond_0

    .line 28
    .line 29
    check-cast v2, Ll/gam;

    .line 30
    .line 31
    invoke-interface {v2, p1, p2}, Ll/gam;->setTimeStamp(J)V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :catchall_0
    move-exception p1

    .line 36
    goto :goto_1

    .line 37
    :cond_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 38
    monitor-exit p0

    .line 39
    return-void

    .line 40
    :goto_1
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 41
    :try_start_3
    throw p1

    .line 42
    :catchall_1
    move-exception p1

    .line 43
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 44
    throw p1
.end method
