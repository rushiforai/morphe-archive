.class public Ll/aeg;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/p1/mobile/putong/live/base/data/BLiveTaskSummary;

.field public final b:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

.field public final c:Z

.field public final d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveTask;",
            ">;"
        }
    .end annotation
.end field

.field public final e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAdvanceTask;",
            ">;"
        }
    .end annotation
.end field

.field public f:Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTaskSummary;

.field public g:Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksProgress;

.field public final h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

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
    iput-object v0, p0, Ll/aeg;->d:Ljava/util/List;

    .line 10
    .line 11
    new-instance v1, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v1, p0, Ll/aeg;->e:Ljava/util/List;

    .line 17
    .line 18
    new-instance v2, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v2, p0, Ll/aeg;->h:Ljava/util/List;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 26
    .line 27
    iget-object v4, v3, Lcom/p1/mobile/putong/live/base/data/BLiveData;->taskSummary:Lcom/p1/mobile/putong/live/base/data/BLiveTaskSummary;

    .line 28
    .line 29
    iput-object v4, p0, Ll/aeg;->a:Lcom/p1/mobile/putong/live/base/data/BLiveTaskSummary;

    .line 30
    .line 31
    iget-object v4, v3, Lcom/p1/mobile/putong/live/base/data/BLiveData;->scoreSummary:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 32
    .line 33
    iput-object v4, p0, Ll/aeg;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 34
    .line 35
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveData;->tasks:Ljava/util/List;

    .line 36
    .line 37
    invoke-static {v3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    if-nez v3, :cond_0

    .line 42
    .line 43
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 44
    .line 45
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveData;->tasks:Ljava/util/List;

    .line 46
    .line 47
    invoke-interface {v0, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 48
    .line 49
    .line 50
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 51
    .line 52
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->advancedTasks:Ljava/util/List;

    .line 53
    .line 54
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-nez v0, :cond_1

    .line 59
    .line 60
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 61
    .line 62
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->advancedTasks:Ljava/util/List;

    .line 63
    .line 64
    invoke-interface {v1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 65
    .line 66
    .line 67
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 68
    .line 69
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->accompanyTaskSummary:Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTaskSummary;

    .line 70
    .line 71
    iput-object v1, p0, Ll/aeg;->f:Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTaskSummary;

    .line 72
    .line 73
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->accompanyTasks:Ljava/util/List;

    .line 74
    .line 75
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-nez v0, :cond_2

    .line 80
    .line 81
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 82
    .line 83
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->accompanyTasks:Ljava/util/List;

    .line 84
    .line 85
    invoke-interface {v2, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 86
    .line 87
    .line 88
    :cond_2
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 89
    .line 90
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->accompanyTaskProgress:Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksProgress;

    .line 91
    .line 92
    iput-object p1, p0, Ll/aeg;->g:Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksProgress;

    .line 93
    .line 94
    const/4 p1, 0x0

    .line 95
    iput-boolean p1, p0, Ll/aeg;->c:Z

    .line 96
    .line 97
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLiveTask;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    const-string v0, "TaskTypeWatch"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTask;->type:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTask;->done:Z

    .line 12
    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/base/data/BLiveTask;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    const-string v0, "TaskTypeWatch"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTask;->type:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTask;->done:Z

    .line 12
    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method


# virtual methods
.method public c()Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/aeg;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    iget-object p0, p0, Ll/aeg;->d:Ljava/util/List;

    .line 12
    .line 13
    new-instance v0, Ll/ydg;

    .line 14
    .line 15
    invoke-direct {v0}, Ll/ydg;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    const/4 p0, 0x1

    .line 25
    return p0

    .line 26
    :cond_1
    return v1
.end method

.method public d()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveTask;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/aeg;->d:Ljava/util/List;

    .line 2
    .line 3
    new-instance v0, Ll/zdg;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/zdg;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public e()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/aeg;->c:Z

    .line 2
    .line 3
    return p0
.end method
