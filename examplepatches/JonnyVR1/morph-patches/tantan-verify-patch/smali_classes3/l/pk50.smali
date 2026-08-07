.class public Ll/pk50;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static h:Ll/pk50;


# instance fields
.field public a:Ll/dj50;

.field public b:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/data/OMSData;",
            ">;"
        }
    .end annotation
.end field

.field public c:Ll/sj50;

.field public d:Ll/dxv;

.field public e:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ll/fl50;",
            ">;"
        }
    .end annotation
.end field

.field public f:Ll/rj50;

.field public g:Ll/th50;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/pk50;->e:Ljava/util/HashMap;

    .line 10
    .line 11
    return-void
.end method

.method public static j()Ll/pk50;
    .locals 2

    .line 1
    sget-object v0, Ll/pk50;->h:Ll/pk50;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/pk50;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/pk50;->h:Ll/pk50;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/pk50;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/pk50;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/pk50;->h:Ll/pk50;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Ll/pk50;->h:Ll/pk50;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public a()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/pk50;->e:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_3

    .line 8
    .line 9
    invoke-static {}, Ll/uk50;->f()Ll/uk50;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Ll/uk50;->c()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/pk50;->e:Ljava/util/HashMap;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_3

    .line 31
    .line 32
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    check-cast v1, Ljava/util/Map$Entry;

    .line 37
    .line 38
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    check-cast v1, Ll/fl50;

    .line 43
    .line 44
    if-nez v1, :cond_0

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    iget-object v2, p0, Ll/pk50;->d:Ll/dxv;

    .line 48
    .line 49
    invoke-interface {v1}, Ll/fl50;->c()Ljava/util/List;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    invoke-virtual {v2, v3}, Ll/dxv;->c(Ljava/util/List;)V

    .line 54
    .line 55
    .line 56
    iget-object v2, p0, Ll/pk50;->a:Ll/dj50;

    .line 57
    .line 58
    invoke-virtual {v2}, Ll/dj50;->L()Z

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    if-eqz v2, :cond_1

    .line 63
    .line 64
    iget-object v2, p0, Ll/pk50;->a:Ll/dj50;

    .line 65
    .line 66
    invoke-interface {v1}, Ll/fl50;->d()Ljava/util/List;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    invoke-virtual {v2, v3}, Ll/dj50;->N(Ljava/util/List;)V

    .line 71
    .line 72
    .line 73
    :cond_1
    iget-object v2, p0, Ll/pk50;->a:Ll/dj50;

    .line 74
    .line 75
    invoke-virtual {v2}, Ll/dj50;->K()Z

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    if-eqz v2, :cond_2

    .line 80
    .line 81
    iget-object v2, p0, Ll/pk50;->a:Ll/dj50;

    .line 82
    .line 83
    invoke-interface {v1}, Ll/fl50;->e()Ljava/util/List;

    .line 84
    .line 85
    .line 86
    move-result-object v3

    .line 87
    invoke-virtual {v2, v3}, Ll/dj50;->M(Ljava/util/List;)V

    .line 88
    .line 89
    .line 90
    :cond_2
    iget-object v2, p0, Ll/pk50;->c:Ll/sj50;

    .line 91
    .line 92
    invoke-interface {v1}, Ll/fl50;->b()Ljava/util/HashMap;

    .line 93
    .line 94
    .line 95
    move-result-object v3

    .line 96
    invoke-virtual {v2, v3}, Ll/sj50;->c(Ljava/util/HashMap;)V

    .line 97
    .line 98
    .line 99
    invoke-static {}, Ll/uk50;->f()Ll/uk50;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    invoke-interface {v1}, Ll/fl50;->a()Ljava/util/List;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    invoke-virtual {v2, v1}, Ll/uk50;->k(Ljava/util/List;)V

    .line 108
    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_3
    iget-object p0, p0, Ll/pk50;->a:Ll/dj50;

    .line 112
    .line 113
    sget-boolean v0, Ll/uqb0;->A:Z

    .line 114
    .line 115
    invoke-virtual {p0, v0}, Ll/dj50;->H(Z)V

    .line 116
    .line 117
    .line 118
    return-void
.end method

.method public b()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/pk50;->t()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/pk50;->b:Lrx/subjects/a;

    .line 9
    .line 10
    new-instance v0, Ll/th50;

    .line 11
    .line 12
    invoke-direct {v0}, Ll/th50;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Ll/pk50;->g:Ll/th50;

    .line 16
    .line 17
    new-instance v0, Ll/rj50;

    .line 18
    .line 19
    invoke-direct {v0}, Ll/rj50;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Ll/pk50;->f:Ll/rj50;

    .line 23
    .line 24
    new-instance v0, Ll/dj50;

    .line 25
    .line 26
    invoke-direct {v0}, Ll/dj50;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Ll/pk50;->a:Ll/dj50;

    .line 30
    .line 31
    new-instance v0, Ll/sj50;

    .line 32
    .line 33
    invoke-direct {v0}, Ll/sj50;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Ll/pk50;->c:Ll/sj50;

    .line 37
    .line 38
    new-instance v0, Ll/dxv;

    .line 39
    .line 40
    invoke-direct {v0}, Ll/dxv;-><init>()V

    .line 41
    .line 42
    .line 43
    iput-object v0, p0, Ll/pk50;->d:Ll/dxv;

    .line 44
    .line 45
    return-void
.end method

.method public c()Ll/dj50;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pk50;->a:Ll/dj50;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Lcom/p1/mobile/putong/data/OMSData;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pk50;->g:Ll/th50;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/th50;->z()Ll/th50$a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ll/mof0;->m()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/p1/mobile/putong/data/OMSData;

    .line 12
    .line 13
    return-object p0
.end method

.method public e()Lcom/p1/mobile/putong/data/OMSData;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pk50;->g:Ll/th50;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/th50;->z()Ll/th50$a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/p1/mobile/putong/data/OMSData;

    .line 12
    .line 13
    return-object p0
.end method

.method public f()Ll/rj50;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pk50;->f:Ll/rj50;

    .line 2
    .line 3
    return-object p0
.end method

.method public g()Ll/sj50;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pk50;->c:Ll/sj50;

    .line 2
    .line 3
    return-object p0
.end method

.method public h()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/OMSAdCardInfo;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/pk50;->g:Ll/th50;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/th50;->z()Ll/th50$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/mof0;->m()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return-object p0

    .line 15
    :cond_0
    iget-object p0, p0, Ll/pk50;->g:Ll/th50;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/th50;->z()Ll/th50$a;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Ll/mof0;->m()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    check-cast p0, Lcom/p1/mobile/putong/data/OMSData;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSData;->cards:Ljava/util/List;

    .line 28
    .line 29
    return-object p0
.end method

.method public i()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/OMSDialogInfo;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/pk50;->g:Ll/th50;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/th50;->z()Ll/th50$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/mof0;->m()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return-object p0

    .line 15
    :cond_0
    iget-object p0, p0, Ll/pk50;->g:Ll/th50;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/th50;->z()Ll/th50$a;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Ll/mof0;->m()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    check-cast p0, Lcom/p1/mobile/putong/data/OMSData;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSData;->dialogs:Ljava/util/List;

    .line 28
    .line 29
    return-object p0
.end method

.method public k()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/OMSSlotsInfo;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/pk50;->g:Ll/th50;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/th50;->z()Ll/th50$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/mof0;->m()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return-object p0

    .line 15
    :cond_0
    iget-object p0, p0, Ll/pk50;->g:Ll/th50;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/th50;->z()Ll/th50$a;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Ll/mof0;->m()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    check-cast p0, Lcom/p1/mobile/putong/data/OMSData;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSData;->slots:Ljava/util/List;

    .line 28
    .line 29
    return-object p0
.end method

.method public l()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/SwipeExcites;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/pk50;->g:Ll/th50;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/th50;->z()Ll/th50$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/mof0;->m()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return-object p0

    .line 15
    :cond_0
    iget-object p0, p0, Ll/pk50;->g:Ll/th50;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/th50;->z()Ll/th50$a;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Ll/mof0;->m()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    check-cast p0, Lcom/p1/mobile/putong/data/OMSData;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSData;->swipeExcites:Ljava/util/List;

    .line 28
    .line 29
    return-object p0
.end method

.method public m()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/OMSThemeInfo;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/pk50;->g:Ll/th50;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/th50;->z()Ll/th50$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/mof0;->m()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return-object p0

    .line 15
    :cond_0
    iget-object p0, p0, Ll/pk50;->g:Ll/th50;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/th50;->z()Ll/th50$a;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Ll/mof0;->m()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    check-cast p0, Lcom/p1/mobile/putong/data/OMSData;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSData;->themes:Ljava/util/List;

    .line 28
    .line 29
    return-object p0
.end method

.method public n()Ll/th50;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pk50;->g:Ll/th50;

    .line 2
    .line 3
    return-object p0
.end method

.method public o()Ll/dxv;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pk50;->d:Ll/dxv;

    .line 2
    .line 3
    return-object p0
.end method

.method public p(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pk50;->g:Ll/th50;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/th50;->z()Ll/th50$a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Ll/th50$a;->F(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public q(Ljava/lang/String;Ll/fl50;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pk50;->e:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/pk50;->e:Ljava/util/HashMap;

    .line 10
    .line 11
    invoke-virtual {p0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    const-string p0, "the module name is already exits"

    .line 16
    .line 17
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public r(Ljava/lang/String;I)V
    .locals 1
    .param p2    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/pk50;->c:Ll/sj50;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/pk50;->c:Ll/sj50;

    .line 10
    .line 11
    invoke-virtual {p0, p1, p2}, Ll/sj50;->d(Ljava/lang/String;I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public s()Lrx/subjects/a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/data/OMSData;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/pk50;->b:Lrx/subjects/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public t()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pk50;->b:Lrx/subjects/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lrx/subjects/a;->onCompleted()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Ll/pk50;->b:Lrx/subjects/a;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public u(Lcom/p1/mobile/putong/data/OMSData;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pk50;->g:Ll/th50;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/th50;->z()Ll/th50$a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Ll/mof0;->A(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
