.class public Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/base/util/RxTaskQueue$a;,
        Lcom/p1/mobile/putong/live/base/util/RxTaskQueue$RxQueueNullException;
    }
.end annotation


# instance fields
.field public final a:Ljava/lang/String;

.field public b:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Lcom/p1/mobile/putong/live/base/util/RxTaskQueue$a<",
            "*>;>;"
        }
    .end annotation
.end field

.field public c:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/PriorityQueue;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/PriorityQueue;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;->b:Ljava/util/Queue;

    .line 10
    .line 11
    new-instance v0, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v1, "RxTaskQueue"

    .line 14
    .line 15
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;->a:Ljava/lang/String;

    .line 26
    .line 27
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;Lcom/p1/mobile/putong/live/base/util/RxTaskQueue$a;Lrx/subjects/a;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;->h(Lcom/p1/mobile/putong/live/base/util/RxTaskQueue$a;Lrx/subjects/a;Ljava/lang/Object;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;Lrx/subjects/a;Lcom/p1/mobile/putong/live/base/util/RxTaskQueue$a;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;->i(Lrx/subjects/a;Lcom/p1/mobile/putong/live/base/util/RxTaskQueue$a;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;Lrx/subjects/a;Lcom/p1/mobile/putong/live/base/util/RxTaskQueue$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;->j(Lrx/subjects/a;Lcom/p1/mobile/putong/live/base/util/RxTaskQueue$a;)V

    return-void
.end method


# virtual methods
.method public d()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;->c:Z

    .line 3
    .line 4
    return-void
.end method

.method public e(Ljava/lang/String;Lrx/c;)Lrx/c;
    .locals 2
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Lrx/c<",
            "TR;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/vrd0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p1, p2, v1}, Ll/vrd0;-><init>(Ljava/lang/String;Lrx/c;I)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;->g(Ll/vrd0;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public f(Ljava/lang/String;Lrx/c;I)Lrx/c;
    .locals 1
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Lrx/c<",
            "TR;>;I)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/vrd0;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2, p3}, Ll/vrd0;-><init>(Ljava/lang/String;Lrx/c;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;->g(Ll/vrd0;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public g(Ll/vrd0;)Lrx/c;
    .locals 3
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/vrd0<",
            "TR;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue$a;-><init>(Ll/zrd0;)V

    .line 5
    .line 6
    .line 7
    iput-object p1, v0, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue$a;->a:Ll/vrd0;

    .line 8
    .line 9
    iget p1, p1, Ll/vrd0;->c:I

    .line 10
    .line 11
    iput p1, v0, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue$a;->c:I

    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;->b:Ljava/util/Queue;

    .line 14
    .line 15
    invoke-interface {p1, v0}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iput-object p1, v0, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue$a;->b:Lrx/subjects/a;

    .line 23
    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;->b:Ljava/util/Queue;

    .line 25
    .line 26
    invoke-interface {v1}, Ljava/util/Collection;->size()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    const/4 v2, 0x1

    .line 31
    if-ne v1, v2, :cond_0

    .line 32
    .line 33
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;->c:Z

    .line 34
    .line 35
    if-nez v1, :cond_0

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;->k(Lcom/p1/mobile/putong/live/base/util/RxTaskQueue$a;)V

    .line 38
    .line 39
    .line 40
    :cond_0
    invoke-virtual {p1}, Lrx/c;->asObservable()Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    return-object p0
.end method

.method public final synthetic h(Lcom/p1/mobile/putong/live/base/util/RxTaskQueue$a;Lrx/subjects/a;Ljava/lang/Object;)V
    .locals 1

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    new-instance p0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v0, "Observable emit null value for UniqueId: "

    .line 6
    .line 7
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue$a;->a:Ll/vrd0;

    .line 11
    .line 12
    iget-object v0, v0, Ll/vrd0;->a:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v0, "type: "

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue$a;->a:Ll/vrd0;

    .line 23
    .line 24
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    new-instance p1, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue$RxQueueNullException;

    .line 36
    .line 37
    const/4 v0, 0x0

    .line 38
    invoke-direct {p1, p0, v0}, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue$RxQueueNullException;-><init>(Ljava/lang/String;Ll/zrd0;)V

    .line 39
    .line 40
    .line 41
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 42
    .line 43
    .line 44
    :cond_0
    invoke-virtual {p2, p3}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public final synthetic i(Lrx/subjects/a;Lcom/p1/mobile/putong/live/base/util/RxTaskQueue$a;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p1, p3}, Lrx/subjects/a;->onError(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;->b:Ljava/util/Queue;

    .line 5
    .line 6
    invoke-interface {p1, p2}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;->b:Ljava/util/Queue;

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    iget-boolean p1, p0, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;->c:Z

    .line 18
    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;->b:Ljava/util/Queue;

    .line 22
    .line 23
    invoke-interface {p1}, Ljava/util/Queue;->peek()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue$a;

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;->k(Lcom/p1/mobile/putong/live/base/util/RxTaskQueue$a;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public final synthetic j(Lrx/subjects/a;Lcom/p1/mobile/putong/live/base/util/RxTaskQueue$a;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lrx/subjects/a;->onCompleted()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;->b:Ljava/util/Queue;

    .line 5
    .line 6
    invoke-interface {p1, p2}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;->b:Ljava/util/Queue;

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    iget-boolean p1, p0, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;->c:Z

    .line 18
    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;->b:Ljava/util/Queue;

    .line 22
    .line 23
    invoke-interface {p1}, Ljava/util/Queue;->peek()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue$a;

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;->k(Lcom/p1/mobile/putong/live/base/util/RxTaskQueue$a;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public final k(Lcom/p1/mobile/putong/live/base/util/RxTaskQueue$a;)V
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;->c:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    if-eqz p1, :cond_1

    .line 6
    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue$a;->a:Ll/vrd0;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue$a;->b:Lrx/subjects/a;

    .line 13
    .line 14
    iget-object v0, v0, Ll/vrd0;->b:Lrx/c;

    .line 15
    .line 16
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {v0, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v2, Ll/wrd0;

    .line 25
    .line 26
    invoke-direct {v2, p0, p1, v1}, Ll/wrd0;-><init>(Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;Lcom/p1/mobile/putong/live/base/util/RxTaskQueue$a;Lrx/subjects/a;)V

    .line 27
    .line 28
    .line 29
    new-instance v3, Ll/xrd0;

    .line 30
    .line 31
    invoke-direct {v3, p0, v1, p1}, Ll/xrd0;-><init>(Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;Lrx/subjects/a;Lcom/p1/mobile/putong/live/base/util/RxTaskQueue$a;)V

    .line 32
    .line 33
    .line 34
    new-instance v4, Ll/yrd0;

    .line 35
    .line 36
    invoke-direct {v4, p0, v1, p1}, Ll/yrd0;-><init>(Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;Lrx/subjects/a;Lcom/p1/mobile/putong/live/base/util/RxTaskQueue$a;)V

    .line 37
    .line 38
    .line 39
    invoke-static {v2, v3, v4}, Ll/dhw;->f(Ll/y20;Ll/y20;Ll/x20;)Ll/t9t;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 44
    .line 45
    .line 46
    :cond_1
    :goto_0
    return-void
.end method
