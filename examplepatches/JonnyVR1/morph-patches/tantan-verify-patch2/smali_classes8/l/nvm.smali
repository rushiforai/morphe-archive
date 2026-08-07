.class public Ll/nvm;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static g:Ll/nvm;


# instance fields
.field public a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/vwl;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/ovb0<",
            "Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            "Lcom/p1/mobile/putong/core/data/Message;",
            "Lcom/p1/mobile/putong/data/User;",
            ">;>;"
        }
    .end annotation
.end field

.field public c:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public d:Ll/kcg0;

.field public e:Ljava/util/concurrent/atomic/AtomicInteger;

.field public f:Ll/ovb0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ovb0<",
            "Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            "Lcom/p1/mobile/putong/core/data/Message;",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

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
    iput-object v0, p0, Ll/nvm;->a:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/nvm;->b:Ljava/util/List;

    .line 17
    .line 18
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iput-object v0, p0, Ll/nvm;->c:Lrx/subjects/a;

    .line 23
    .line 24
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Ll/nvm;->e:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/nvm;->o()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Ll/nvm;->A()V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public static synthetic a(Ll/nvm;Ll/uxj0;)Landroid/util/Pair;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nvm;->q(Ll/uxj0;)Landroid/util/Pair;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b(Ljava/util/List;Ll/vwl;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    invoke-interface {p1}, Ll/vwl;->a()Lcom/p1/mobile/putong/core/ui/messages/manager/insert/LocalMsgInsertType;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static synthetic c(Ll/nvm;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nvm;->t(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic d(Ll/nvm;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nvm;->s(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic e(Ll/nvm;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nvm;->p(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic f(Ljava/lang/Boolean;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic g(Ljava/util/List;Ll/vwl;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    invoke-interface {p1}, Ll/vwl;->a()Lcom/p1/mobile/putong/core/ui/messages/manager/insert/LocalMsgInsertType;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static synthetic h(Ll/nvm;Landroid/util/Pair;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nvm;->r(Landroid/util/Pair;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic i(ZLrx/subjects/a;Ljava/util/List;Ll/vwl;Ljava/lang/Boolean;)Lrx/c;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    new-instance p0, Ll/mvm;

    .line 4
    .line 5
    invoke-direct {p0, p2, p3}, Ll/mvm;-><init>(Ljava/util/List;Ll/vwl;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, p0}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0

    .line 13
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 14
    .line 15
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public static n()Ll/nvm;
    .locals 2

    .line 1
    sget-object v0, Ll/nvm;->g:Ll/nvm;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/nvm;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/nvm;->g:Ll/nvm;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/nvm;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/nvm;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/nvm;->g:Ll/nvm;

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
    sget-object v0, Ll/nvm;->g:Ll/nvm;

    .line 27
    .line 28
    return-object v0
.end method

.method public static y()V
    .locals 1

    .line 1
    sget-object v0, Ll/nvm;->g:Ll/nvm;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/nvm;->z()V

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    sput-object v0, Ll/nvm;->g:Ll/nvm;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final A()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/nvm;->c:Lrx/subjects/a;

    .line 2
    .line 3
    new-instance v1, Ll/evm;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/evm;-><init>(Ll/nvm;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/fvm;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/fvm;-><init>(Ll/nvm;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const-wide/16 v1, 0x8

    .line 38
    .line 39
    invoke-virtual {v0, v1, v2}, Lrx/c;->onBackpressureBuffer(J)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    new-instance v1, Ll/gvm;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Ll/gvm;-><init>(Ll/nvm;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, v1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    new-instance v1, Ll/hvm;

    .line 53
    .line 54
    invoke-direct {v1, p0}, Ll/hvm;-><init>(Ll/nvm;)V

    .line 55
    .line 56
    .line 57
    new-instance v2, Ll/ivm;

    .line 58
    .line 59
    invoke-direct {v2, p0}, Ll/ivm;-><init>(Ll/nvm;)V

    .line 60
    .line 61
    .line 62
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    iput-object v0, p0, Ll/nvm;->d:Ll/kcg0;

    .line 71
    .line 72
    return-void
.end method

.method public final j(Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;->PAGE_INIT:Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ll/nvm;->x(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    new-instance v0, Ll/ovb0;

    .line 11
    .line 12
    invoke-direct {v0, p1, p2, p3, p4}, Ll/ovb0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    iget-object p3, v0, Ll/ovb0;->a:Ljava/lang/Object;

    .line 16
    .line 17
    sget-object p4, Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;->CONV_MSG_CHANGE:Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;

    .line 18
    .line 19
    if-ne p3, p4, :cond_2

    .line 20
    .line 21
    iget-object p3, p0, Ll/nvm;->f:Ll/ovb0;

    .line 22
    .line 23
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p3

    .line 27
    if-eqz p3, :cond_1

    .line 28
    .line 29
    if-ne p1, p4, :cond_1

    .line 30
    .line 31
    iget-object p3, p0, Ll/nvm;->f:Ll/ovb0;

    .line 32
    .line 33
    iget-object p4, p3, Ll/ovb0;->a:Ljava/lang/Object;

    .line 34
    .line 35
    if-ne p4, p1, :cond_1

    .line 36
    .line 37
    iget-object p1, p3, Ll/ovb0;->b:Ljava/lang/Object;

    .line 38
    .line 39
    check-cast p1, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 40
    .line 41
    iget p1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->mm:I

    .line 42
    .line 43
    iget p1, p2, Lcom/p1/mobile/putong/core/data/Conversation;->mm:I

    .line 44
    .line 45
    :cond_1
    invoke-virtual {p0}, Ll/nvm;->w()V

    .line 46
    .line 47
    .line 48
    :cond_2
    iget-object p1, v0, Ll/ovb0;->a:Ljava/lang/Object;

    .line 49
    .line 50
    sget-object p3, Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;->PAGE_FINISH:Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;

    .line 51
    .line 52
    if-ne p1, p3, :cond_3

    .line 53
    .line 54
    iget-object p1, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {p0, p1}, Ll/nvm;->x(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    :cond_3
    iget-object p1, p0, Ll/nvm;->b:Ljava/util/List;

    .line 60
    .line 61
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Ll/nvm;->m()V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public k(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;->CONV_MSG_CHANGE:Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1, p2, p3}, Ll/nvm;->j(Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final l(Ll/ovb0;Lcom/p1/mobile/putong/data/User;)Lrx/c;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/ovb0<",
            "Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            "Lcom/p1/mobile/putong/core/data/Message;",
            "Lcom/p1/mobile/putong/data/User;",
            ">;",
            "Lcom/p1/mobile/putong/data/User;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_5

    .line 6
    .line 7
    iget-object v0, p1, Ll/ovb0;->a:Ljava/lang/Object;

    .line 8
    .line 9
    sget-object v1, Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;->PAGE_FINISH:Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;

    .line 10
    .line 11
    if-ne v0, v1, :cond_0

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 v0, 0x0

    .line 16
    :goto_0
    new-instance v1, Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Ll/nvm;->a:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    :cond_1
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-eqz v2, :cond_2

    .line 32
    .line 33
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    check-cast v2, Ll/vwl;

    .line 38
    .line 39
    iget-object v3, p1, Ll/ovb0;->a:Ljava/lang/Object;

    .line 40
    .line 41
    check-cast v3, Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;

    .line 42
    .line 43
    iget-object v4, p1, Ll/ovb0;->b:Ljava/lang/Object;

    .line 44
    .line 45
    check-cast v4, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 46
    .line 47
    iget-object v5, p1, Ll/ovb0;->c:Ljava/lang/Object;

    .line 48
    .line 49
    check-cast v5, Lcom/p1/mobile/putong/core/data/Message;

    .line 50
    .line 51
    invoke-interface {v2, v3, v4, v5, p2}, Ll/vwl;->c(Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;)Z

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    if-eqz v3, :cond_1

    .line 56
    .line 57
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_2
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    if-nez p0, :cond_5

    .line 66
    .line 67
    new-instance v8, Ljava/util/ArrayList;

    .line 68
    .line 69
    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 70
    .line 71
    .line 72
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    const/4 v1, 0x0

    .line 77
    :goto_2
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    if-eqz v2, :cond_4

    .line 82
    .line 83
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    check-cast v2, Ll/vwl;

    .line 88
    .line 89
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 90
    .line 91
    .line 92
    move-result-object v9

    .line 93
    iget-object v3, p1, Ll/ovb0;->b:Ljava/lang/Object;

    .line 94
    .line 95
    check-cast v3, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 96
    .line 97
    iget-object v4, p1, Ll/ovb0;->c:Ljava/lang/Object;

    .line 98
    .line 99
    check-cast v4, Lcom/p1/mobile/putong/core/data/Message;

    .line 100
    .line 101
    iget-object v5, p1, Ll/ovb0;->d:Ljava/lang/Object;

    .line 102
    .line 103
    check-cast v5, Lcom/p1/mobile/putong/data/User;

    .line 104
    .line 105
    iget-object v6, p1, Ll/ovb0;->a:Ljava/lang/Object;

    .line 106
    .line 107
    move-object v7, v6

    .line 108
    check-cast v7, Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;

    .line 109
    .line 110
    move-object v6, p2

    .line 111
    invoke-interface/range {v2 .. v9}, Ll/vwl;->b(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;Ljava/util/List;Lrx/subjects/a;)V

    .line 112
    .line 113
    .line 114
    if-nez v1, :cond_3

    .line 115
    .line 116
    new-instance p2, Ll/jvm;

    .line 117
    .line 118
    invoke-direct {p2, v8, v2}, Ll/jvm;-><init>(Ljava/util/List;Ll/vwl;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {v9, p2}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 122
    .line 123
    .line 124
    move-result-object p2

    .line 125
    :goto_3
    move-object v1, p2

    .line 126
    goto :goto_4

    .line 127
    :cond_3
    new-instance p2, Ll/kvm;

    .line 128
    .line 129
    invoke-direct {p2, v0, v9, v8, v2}, Ll/kvm;-><init>(ZLrx/subjects/a;Ljava/util/List;Ll/vwl;)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {v1, p2}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 133
    .line 134
    .line 135
    move-result-object p2

    .line 136
    goto :goto_3

    .line 137
    :goto_4
    move-object p2, v6

    .line 138
    goto :goto_2

    .line 139
    :cond_4
    new-instance p0, Ll/lvm;

    .line 140
    .line 141
    invoke-direct {p0}, Ll/lvm;-><init>()V

    .line 142
    .line 143
    .line 144
    invoke-virtual {v1, p0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    return-object p0

    .line 149
    :cond_5
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 150
    .line 151
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    return-object p0
.end method

.method public final declared-synchronized m()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/nvm;->b:Ljava/util/List;

    .line 3
    .line 4
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Ll/nvm;->e:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Ll/nvm;->c:Lrx/subjects/a;

    .line 19
    .line 20
    sget-object v1, Ll/uxj0;->a:Ll/uxj0;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :catchall_0
    move-exception v0

    .line 27
    goto :goto_1

    .line 28
    :cond_0
    :goto_0
    monitor-exit p0

    .line 29
    return-void

    .line 30
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 31
    throw v0
.end method

.method public final o()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->k()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    iget-object v1, p0, Ll/nvm;->a:Ljava/util/List;

    .line 16
    .line 17
    new-instance v2, Ll/cwv;

    .line 18
    .line 19
    invoke-direct {v2}, Ll/cwv;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    :cond_0
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->xh()Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_1

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isNewUserIn24H()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_1

    .line 44
    .line 45
    iget-object v0, p0, Ll/nvm;->a:Ljava/util/List;

    .line 46
    .line 47
    new-instance v1, Ll/zvv;

    .line 48
    .line 49
    invoke-direct {v1}, Ll/zvv;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    :cond_1
    invoke-static {}, Ll/h39;->N()Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_2

    .line 60
    .line 61
    iget-object v0, p0, Ll/nvm;->a:Ljava/util/List;

    .line 62
    .line 63
    new-instance v1, Ll/gwv;

    .line 64
    .line 65
    invoke-direct {v1}, Ll/gwv;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    :cond_2
    invoke-static {}, Ll/h39;->h()Lcom/p1/mobile/putong/core/data/ChatInviteToVerifyConfig;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-eqz v0, :cond_3

    .line 80
    .line 81
    invoke-static {}, Ll/h39;->h()Lcom/p1/mobile/putong/core/data/ChatInviteToVerifyConfig;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/ChatInviteToVerifyConfig;->enable:Z

    .line 86
    .line 87
    if-eqz v0, :cond_3

    .line 88
    .line 89
    iget-object p0, p0, Ll/nvm;->a:Ljava/util/List;

    .line 90
    .line 91
    new-instance v0, Ll/dwv;

    .line 92
    .line 93
    invoke-direct {v0}, Ll/dwv;-><init>()V

    .line 94
    .line 95
    .line 96
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    :cond_3
    return-void
.end method

.method public final synthetic p(Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nvm;->e:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    invoke-virtual {p0, p1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic q(Ll/uxj0;)Landroid/util/Pair;
    .locals 1

    .line 1
    iget-object p1, p0, Ll/nvm;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/nvm;->b:Ljava/util/List;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-interface {p1, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Ll/ovb0;

    .line 17
    .line 18
    iput-object p1, p0, Ll/nvm;->f:Ll/ovb0;

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 p1, 0x0

    .line 22
    :goto_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-static {p1, p0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0
.end method

.method public final synthetic r(Landroid/util/Pair;)Lrx/c;
    .locals 1

    .line 1
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ll/ovb0;

    .line 4
    .line 5
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    invoke-virtual {p0, v0, p1}, Ll/nvm;->l(Ll/ovb0;Lcom/p1/mobile/putong/data/User;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic s(Ll/uxj0;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/nvm;->e:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/nvm;->m()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic t(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/nvm;->e:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/nvm;->m()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public u(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;->PAGE_FINISH:Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p0, v0, p1, v1, v1}, Ll/nvm;->j(Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public v(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;->PAGE_INIT:Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1, p2, p3}, Ll/nvm;->j(Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final w()V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/nvm;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/ovb0;

    .line 18
    .line 19
    iget-object v0, v0, Ll/ovb0;->a:Ljava/lang/Object;

    .line 20
    .line 21
    sget-object v1, Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;->CONV_MSG_CHANGE:Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;

    .line 22
    .line 23
    if-ne v0, v1, :cond_0

    .line 24
    .line 25
    invoke-interface {p0}, Ljava/util/Iterator;->remove()V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    return-void
.end method

.method public final x(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object p0, p0, Ll/nvm;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_3

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/ovb0;

    .line 18
    .line 19
    iget-object v1, v0, Ll/ovb0;->a:Ljava/lang/Object;

    .line 20
    .line 21
    sget-object v2, Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;->CONV_MSG_CHANGE:Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;

    .line 22
    .line 23
    if-ne v1, v2, :cond_1

    .line 24
    .line 25
    invoke-interface {p0}, Ljava/util/Iterator;->remove()V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    iget-object v1, v0, Ll/ovb0;->b:Ljava/lang/Object;

    .line 30
    .line 31
    check-cast v1, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 32
    .line 33
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_0

    .line 40
    .line 41
    iget-object v0, v0, Ll/ovb0;->a:Ljava/lang/Object;

    .line 42
    .line 43
    sget-object v1, Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;->PAGE_FINISH:Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;

    .line 44
    .line 45
    if-eq v0, v1, :cond_2

    .line 46
    .line 47
    sget-object v1, Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;->PAGE_INIT:Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;

    .line 48
    .line 49
    if-ne v0, v1, :cond_0

    .line 50
    .line 51
    :cond_2
    invoke-interface {p0}, Ljava/util/Iterator;->remove()V

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_3
    return-void
.end method

.method public final z()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nvm;->d:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
