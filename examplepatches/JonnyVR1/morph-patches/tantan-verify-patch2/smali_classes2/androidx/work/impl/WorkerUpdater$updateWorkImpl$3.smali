.class final Landroidx/work/impl/WorkerUpdater$updateWorkImpl$3;
.super Lkotlin/jvm/internal/Lambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function0<",
        "Landroidx/work/WorkManager$UpdateResult;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0008\n\u0000\n\u0002\u0018\u0002\n\u0000\u0010\u0000\u001a\u00020\u0001H\n\u00a2\u0006\u0002\u0008\u0002"
    }
    d2 = {
        "<anonymous>",
        "Landroidx/work/WorkManager$UpdateResult;",
        "invoke"
    }
    k = 0x3
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic $this_updateWorkImpl:Ll/xiq0;

.field final synthetic $workRequest:Landroidx/work/h;


# direct methods
.method public constructor <init>(Ll/xiq0;Landroidx/work/h;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/work/impl/WorkerUpdater$updateWorkImpl$3;->$this_updateWorkImpl:Ll/xiq0;

    .line 2
    .line 3
    iput-object p2, p0, Landroidx/work/impl/WorkerUpdater$updateWorkImpl$3;->$workRequest:Landroidx/work/h;

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final invoke()Landroidx/work/WorkManager$UpdateResult;
    .locals 7

    .line 1
    iget-object v0, p0, Landroidx/work/impl/WorkerUpdater$updateWorkImpl$3;->$this_updateWorkImpl:Ll/xiq0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/xiq0;->r()Landroidx/work/impl/a;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Landroidx/work/impl/WorkerUpdater$updateWorkImpl$3;->$this_updateWorkImpl:Ll/xiq0;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/xiq0;->u()Landroidx/work/impl/WorkDatabase;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Landroidx/work/impl/WorkerUpdater$updateWorkImpl$3;->$this_updateWorkImpl:Ll/xiq0;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/xiq0;->n()Landroidx/work/a;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Landroidx/work/impl/WorkerUpdater$updateWorkImpl$3;->$this_updateWorkImpl:Ll/xiq0;

    .line 29
    .line 30
    invoke-virtual {v0}, Ll/xiq0;->s()Ljava/util/List;

    .line 31
    .line 32
    .line 33
    move-result-object v4

    .line 34
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Landroidx/work/impl/WorkerUpdater$updateWorkImpl$3;->$workRequest:Landroidx/work/h;

    .line 38
    .line 39
    invoke-virtual {v0}, Landroidx/work/h;->d()Ll/mjq0;

    .line 40
    .line 41
    .line 42
    move-result-object v5

    .line 43
    iget-object p0, p0, Landroidx/work/impl/WorkerUpdater$updateWorkImpl$3;->$workRequest:Landroidx/work/h;

    .line 44
    .line 45
    invoke-virtual {p0}, Landroidx/work/h;->c()Ljava/util/Set;

    .line 46
    .line 47
    .line 48
    move-result-object v6

    .line 49
    invoke-static/range {v1 .. v6}, Landroidx/work/impl/WorkerUpdater;->b(Landroidx/work/impl/a;Landroidx/work/impl/WorkDatabase;Landroidx/work/a;Ljava/util/List;Ll/mjq0;Ljava/util/Set;)Landroidx/work/WorkManager$UpdateResult;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    return-object p0
.end method

.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 0

    .line 54
    invoke-virtual {p0}, Landroidx/work/impl/WorkerUpdater$updateWorkImpl$3;->invoke()Landroidx/work/WorkManager$UpdateResult;

    move-result-object p0

    return-object p0
.end method
