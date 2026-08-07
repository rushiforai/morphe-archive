.class public Lcom/momo/mcamera/filtermanager/SplitChangeFilter;
.super Ll/ogk;
.source "SourceFile"

# interfaces
.implements Ll/suf;


# instance fields
.field curFilterA:Ll/jt2;

.field curFilterB:Ll/jt2;

.field isStashed:Z

.field mStashedA:Ll/jt2;

.field mStashedB:Ll/jt2;

.field splitFilter:Ll/qxf0;


# direct methods
.method public constructor <init>(Ll/jt2;Ll/jt2;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/ogk;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/qxf0;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/qxf0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/momo/mcamera/filtermanager/SplitChangeFilter;->splitFilter:Ll/qxf0;

    .line 10
    .line 11
    iput-object p1, p0, Lcom/momo/mcamera/filtermanager/SplitChangeFilter;->curFilterA:Ll/jt2;

    .line 12
    .line 13
    iput-object p2, p0, Lcom/momo/mcamera/filtermanager/SplitChangeFilter;->curFilterB:Ll/jt2;

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/SplitChangeFilter;->splitFilter:Ll/qxf0;

    .line 19
    .line 20
    invoke-virtual {p2, v0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/SplitChangeFilter;->splitFilter:Ll/qxf0;

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-virtual {v0, p1, v1}, Ll/hs10;->registerFilterLocation(Ll/gfj;I)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Lcom/momo/mcamera/filtermanager/SplitChangeFilter;->splitFilter:Ll/qxf0;

    .line 30
    .line 31
    const/4 v0, 0x1

    .line 32
    invoke-virtual {p1, p2, v0}, Ll/hs10;->registerFilterLocation(Ll/gfj;I)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lcom/momo/mcamera/filtermanager/SplitChangeFilter;->splitFilter:Ll/qxf0;

    .line 36
    .line 37
    invoke-virtual {p1, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Lcom/momo/mcamera/filtermanager/SplitChangeFilter;->curFilterA:Ll/jt2;

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Ll/ogk;->registerInitialFilter(Ll/jt2;)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Lcom/momo/mcamera/filtermanager/SplitChangeFilter;->curFilterB:Ll/jt2;

    .line 46
    .line 47
    invoke-virtual {p0, p1}, Ll/ogk;->registerInitialFilter(Ll/jt2;)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Lcom/momo/mcamera/filtermanager/SplitChangeFilter;->splitFilter:Ll/qxf0;

    .line 51
    .line 52
    invoke-virtual {p0, p1}, Ll/ogk;->registerTerminalFilter(Ll/jt2;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method


# virtual methods
.method public changeAngleAndCenter(FLandroid/graphics/PointF;)V
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
    iget-object p0, p0, Lcom/momo/mcamera/filtermanager/SplitChangeFilter;->splitFilter:Ll/qxf0;

    .line 7
    .line 8
    invoke-virtual {p0, p2, p1}, Ll/qxf0;->Q1(Landroid/graphics/PointF;F)V

    .line 9
    .line 10
    .line 11
    monitor-exit v0

    .line 12
    return-void

    .line 13
    :catchall_0
    move-exception p0

    .line 14
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    throw p0
.end method

.method public changeFilter(Ll/jt2;Ll/jt2;)Ljava/util/ArrayList;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/jt2;",
            "Ll/jt2;",
            ")",
            "Ljava/util/ArrayList<",
            "Ll/jt2;",
            ">;"
        }
    .end annotation

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
    new-instance v1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    iget-object v2, p0, Lcom/momo/mcamera/filtermanager/SplitChangeFilter;->curFilterA:Ll/jt2;

    .line 12
    .line 13
    if-ne v2, p1, :cond_0

    .line 14
    .line 15
    iget-object v3, p0, Lcom/momo/mcamera/filtermanager/SplitChangeFilter;->curFilterB:Ll/jt2;

    .line 16
    .line 17
    if-ne v3, p2, :cond_0

    .line 18
    .line 19
    monitor-exit v0

    .line 20
    return-object v1

    .line 21
    :catchall_0
    move-exception p0

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    if-eqz v2, :cond_1

    .line 24
    .line 25
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    :cond_1
    iget-object v2, p0, Lcom/momo/mcamera/filtermanager/SplitChangeFilter;->curFilterB:Ll/jt2;

    .line 29
    .line 30
    if-eqz v2, :cond_2

    .line 31
    .line 32
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    :cond_2
    iget-boolean v2, p0, Lcom/momo/mcamera/filtermanager/SplitChangeFilter;->isStashed:Z

    .line 36
    .line 37
    if-eqz v2, :cond_3

    .line 38
    .line 39
    iput-object p1, p0, Lcom/momo/mcamera/filtermanager/SplitChangeFilter;->mStashedA:Ll/jt2;

    .line 40
    .line 41
    iput-object p2, p0, Lcom/momo/mcamera/filtermanager/SplitChangeFilter;->mStashedB:Ll/jt2;

    .line 42
    .line 43
    :cond_3
    iget-object v2, p0, Lcom/momo/mcamera/filtermanager/SplitChangeFilter;->curFilterA:Ll/jt2;

    .line 44
    .line 45
    invoke-virtual {p0, v2}, Ll/ogk;->removeInitialFilter(Ll/jt2;)V

    .line 46
    .line 47
    .line 48
    iget-object v2, p0, Lcom/momo/mcamera/filtermanager/SplitChangeFilter;->curFilterB:Ll/jt2;

    .line 49
    .line 50
    invoke-virtual {p0, v2}, Ll/ogk;->removeInitialFilter(Ll/jt2;)V

    .line 51
    .line 52
    .line 53
    iget-object v2, p0, Lcom/momo/mcamera/filtermanager/SplitChangeFilter;->splitFilter:Ll/qxf0;

    .line 54
    .line 55
    invoke-virtual {p0, v2}, Ll/ogk;->removeTerminalFilter(Ll/jt2;)V

    .line 56
    .line 57
    .line 58
    iget-object v2, p0, Lcom/momo/mcamera/filtermanager/SplitChangeFilter;->curFilterA:Ll/jt2;

    .line 59
    .line 60
    iget-object v3, p0, Lcom/momo/mcamera/filtermanager/SplitChangeFilter;->splitFilter:Ll/qxf0;

    .line 61
    .line 62
    invoke-virtual {v2, v3}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 63
    .line 64
    .line 65
    iget-object v2, p0, Lcom/momo/mcamera/filtermanager/SplitChangeFilter;->curFilterB:Ll/jt2;

    .line 66
    .line 67
    iget-object v3, p0, Lcom/momo/mcamera/filtermanager/SplitChangeFilter;->splitFilter:Ll/qxf0;

    .line 68
    .line 69
    invoke-virtual {v2, v3}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 70
    .line 71
    .line 72
    iget-object v2, p0, Lcom/momo/mcamera/filtermanager/SplitChangeFilter;->splitFilter:Ll/qxf0;

    .line 73
    .line 74
    invoke-virtual {p1, v2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 75
    .line 76
    .line 77
    iget-object v2, p0, Lcom/momo/mcamera/filtermanager/SplitChangeFilter;->splitFilter:Ll/qxf0;

    .line 78
    .line 79
    invoke-virtual {p2, v2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 80
    .line 81
    .line 82
    iget-object v2, p0, Lcom/momo/mcamera/filtermanager/SplitChangeFilter;->splitFilter:Ll/qxf0;

    .line 83
    .line 84
    const/4 v3, 0x0

    .line 85
    invoke-virtual {v2, p1, v3}, Ll/hs10;->registerFilterLocation(Ll/gfj;I)V

    .line 86
    .line 87
    .line 88
    iget-object v2, p0, Lcom/momo/mcamera/filtermanager/SplitChangeFilter;->splitFilter:Ll/qxf0;

    .line 89
    .line 90
    const/4 v3, 0x1

    .line 91
    invoke-virtual {v2, p2, v3}, Ll/hs10;->registerFilterLocation(Ll/gfj;I)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p0, p1}, Ll/ogk;->registerInitialFilter(Ll/jt2;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p0, p2}, Ll/ogk;->registerInitialFilter(Ll/jt2;)V

    .line 98
    .line 99
    .line 100
    iget-object v2, p0, Lcom/momo/mcamera/filtermanager/SplitChangeFilter;->splitFilter:Ll/qxf0;

    .line 101
    .line 102
    invoke-virtual {p0, v2}, Ll/ogk;->registerTerminalFilter(Ll/jt2;)V

    .line 103
    .line 104
    .line 105
    iput-object p1, p0, Lcom/momo/mcamera/filtermanager/SplitChangeFilter;->curFilterA:Ll/jt2;

    .line 106
    .line 107
    iput-object p2, p0, Lcom/momo/mcamera/filtermanager/SplitChangeFilter;->curFilterB:Ll/jt2;

    .line 108
    .line 109
    monitor-exit v0

    .line 110
    return-object v1

    .line 111
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 112
    throw p0
.end method

.method public changeMix(F)V
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
    iget-object p0, p0, Lcom/momo/mcamera/filtermanager/SplitChangeFilter;->splitFilter:Ll/qxf0;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/qxf0;->R1(F)V

    .line 9
    .line 10
    .line 11
    monitor-exit v0

    .line 12
    return-void

    .line 13
    :catchall_0
    move-exception p0

    .line 14
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    throw p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/ogk;->destroy()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setMMCVInfo(Ll/omw;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/SplitChangeFilter;->curFilterA:Ll/jt2;

    .line 2
    .line 3
    instance-of v1, v0, Ll/suf;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    check-cast v0, Ll/suf;

    .line 8
    .line 9
    invoke-interface {v0, p1}, Ll/suf;->setMMCVInfo(Ll/omw;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/momo/mcamera/filtermanager/SplitChangeFilter;->curFilterB:Ll/jt2;

    .line 13
    .line 14
    instance-of v0, p0, Ll/suf;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    check-cast p0, Ll/suf;

    .line 19
    .line 20
    invoke-interface {p0, p1}, Ll/suf;->setMMCVInfo(Ll/omw;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    return-void
.end method

.method public setVSplit(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/filtermanager/SplitChangeFilter;->splitFilter:Ll/qxf0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/qxf0;->S1(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public stash()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/jt2;",
            ">;"
        }
    .end annotation

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
    iget-boolean v1, p0, Lcom/momo/mcamera/filtermanager/SplitChangeFilter;->isStashed:Z

    .line 7
    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    iget-object v1, p0, Lcom/momo/mcamera/filtermanager/SplitChangeFilter;->curFilterA:Ll/jt2;

    .line 11
    .line 12
    iput-object v1, p0, Lcom/momo/mcamera/filtermanager/SplitChangeFilter;->mStashedA:Ll/jt2;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/momo/mcamera/filtermanager/SplitChangeFilter;->curFilterB:Ll/jt2;

    .line 15
    .line 16
    iput-object v1, p0, Lcom/momo/mcamera/filtermanager/SplitChangeFilter;->mStashedB:Ll/jt2;

    .line 17
    .line 18
    new-instance v1, Lcom/momo/mcamera/mask/NormalFilter;

    .line 19
    .line 20
    invoke-direct {v1}, Lcom/momo/mcamera/mask/NormalFilter;-><init>()V

    .line 21
    .line 22
    .line 23
    new-instance v2, Lcom/momo/mcamera/mask/NormalFilter;

    .line 24
    .line 25
    invoke-direct {v2}, Lcom/momo/mcamera/mask/NormalFilter;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, v1, v2}, Lcom/momo/mcamera/filtermanager/SplitChangeFilter;->changeFilter(Ll/jt2;Ll/jt2;)Ljava/util/ArrayList;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    const/4 v2, 0x1

    .line 33
    iput-boolean v2, p0, Lcom/momo/mcamera/filtermanager/SplitChangeFilter;->isStashed:Z

    .line 34
    .line 35
    monitor-exit v0

    .line 36
    return-object v1

    .line 37
    :catchall_0
    move-exception p0

    .line 38
    goto :goto_0

    .line 39
    :cond_0
    new-instance p0, Ljava/util/ArrayList;

    .line 40
    .line 41
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 42
    .line 43
    .line 44
    monitor-exit v0

    .line 45
    return-object p0

    .line 46
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 47
    throw p0
.end method

.method public unStash()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/jt2;",
            ">;"
        }
    .end annotation

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
    iget-boolean v1, p0, Lcom/momo/mcamera/filtermanager/SplitChangeFilter;->isStashed:Z

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    iput-boolean v1, p0, Lcom/momo/mcamera/filtermanager/SplitChangeFilter;->isStashed:Z

    .line 12
    .line 13
    iget-object v1, p0, Lcom/momo/mcamera/filtermanager/SplitChangeFilter;->mStashedA:Ll/jt2;

    .line 14
    .line 15
    iget-object v2, p0, Lcom/momo/mcamera/filtermanager/SplitChangeFilter;->mStashedB:Ll/jt2;

    .line 16
    .line 17
    invoke-virtual {p0, v1, v2}, Lcom/momo/mcamera/filtermanager/SplitChangeFilter;->changeFilter(Ll/jt2;Ll/jt2;)Ljava/util/ArrayList;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    monitor-exit v0

    .line 22
    return-object p0

    .line 23
    :catchall_0
    move-exception p0

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    new-instance p0, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 28
    .line 29
    .line 30
    monitor-exit v0

    .line 31
    return-object p0

    .line 32
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    throw p0
.end method
