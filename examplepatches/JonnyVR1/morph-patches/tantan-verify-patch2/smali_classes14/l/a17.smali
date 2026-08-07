.class public Ll/a17;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vc2$a;


# static fields
.field public static final k:Ljava/lang/Object;

.field public static l:Ll/a17;


# instance fields
.field public a:I

.field public b:Z

.field public c:Z

.field public d:I

.field public e:I

.field public f:I

.field public g:Z

.field public h:Z

.field public i:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public j:Ll/kcg0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/a17;->k:Ljava/lang/Object;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/a17;->b:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Ll/a17;->c:Z

    .line 8
    .line 9
    iput v0, p0, Ll/a17;->d:I

    .line 10
    .line 11
    iput v0, p0, Ll/a17;->e:I

    .line 12
    .line 13
    iput v0, p0, Ll/a17;->f:I

    .line 14
    .line 15
    iput-boolean v0, p0, Ll/a17;->g:Z

    .line 16
    .line 17
    iput-boolean v0, p0, Ll/a17;->h:Z

    .line 18
    .line 19
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Ll/a17;->i:Lrx/subjects/a;

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    iput-object v1, p0, Ll/a17;->j:Ll/kcg0;

    .line 27
    .line 28
    new-instance v1, Ll/t07;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/t07;-><init>(Ll/a17;)V

    .line 31
    .line 32
    .line 33
    sget-object p0, Lcom/p1/mobile/android/app/Act;->EMPTY_ON_ERROR:Ll/y20;

    .line 34
    .line 35
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public static synthetic a(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b(Ll/a17;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/a17;->p(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic c(Ll/a17;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/a17;->k(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic d(Ll/a17;Lcom/p1/mobile/putong/data/ConversationCounter;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/a17;->l(Lcom/p1/mobile/putong/data/ConversationCounter;)V

    return-void
.end method

.method public static synthetic e(Ll/a17;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/a17;->n(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic f(Ll/a17;Lcom/p1/mobile/putong/data/Counter;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/a17;->m(Lcom/p1/mobile/putong/data/Counter;)V

    return-void
.end method

.method public static synthetic g(Ll/a17;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/a17;->o()V

    return-void
.end method

.method public static h()Ll/a17;
    .locals 2

    .line 1
    sget-object v0, Ll/a17;->l:Ll/a17;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    sget-object v0, Ll/a17;->k:Ljava/lang/Object;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/a17;->l:Ll/a17;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/a17;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/a17;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/a17;->l:Ll/a17;

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
    sget-object v0, Ll/a17;->l:Ll/a17;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public getCount()I
    .locals 0

    .line 1
    iget p0, p0, Ll/a17;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public i(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/a17;->b:Z

    .line 2
    .line 3
    iget-object p0, p0, Ll/a17;->i:Lrx/subjects/a;

    .line 4
    .line 5
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public j()V
    .locals 1

    .line 1
    invoke-static {}, Ll/vc2;->b()Ll/vc2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Ll/vc2;->d(Ll/vc2$a;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic k(Ll/uxj0;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->signedIn_()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-boolean p1, p0, Ll/a17;->g:Z

    .line 12
    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    const/4 p1, 0x1

    .line 16
    iput-boolean p1, p0, Ll/a17;->h:Z

    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget p1, p0, Ll/a17;->e:I

    .line 20
    .line 21
    const-string v0, "vivo"

    .line 22
    .line 23
    sget-object v1, Landroid/os/Build;->BRAND:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    invoke-static {}, Ll/ive0;->m()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_1

    .line 36
    .line 37
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->pe()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_1

    .line 46
    .line 47
    iget v0, p0, Ll/a17;->f:I

    .line 48
    .line 49
    add-int/2addr p1, v0

    .line 50
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->r9()Ll/c8m0;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-interface {v0}, Ll/c8m0;->d()Lrx/subjects/a;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    check-cast v0, Ljava/lang/Integer;

    .line 67
    .line 68
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    add-int/2addr p1, v0

    .line 73
    iput p1, p0, Ll/a17;->a:I

    .line 74
    .line 75
    invoke-static {}, Ll/vc2;->b()Ll/vc2;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-virtual {p0}, Ll/vc2;->e()V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public final synthetic l(Lcom/p1/mobile/putong/data/ConversationCounter;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p1, Lcom/p1/mobile/putong/data/ConversationCounter;->conversations:Lcom/p1/mobile/putong/data/CounterConversations;

    .line 10
    .line 11
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->E7(Lcom/p1/mobile/putong/data/CounterConversations;)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/data/ConversationCounter;->messages:Lcom/p1/mobile/putong/data/CounterMessages;

    .line 16
    .line 17
    iget p1, p1, Lcom/p1/mobile/putong/data/CounterMessages;->unread:I

    .line 18
    .line 19
    add-int/2addr v0, p1

    .line 20
    iput v0, p0, Ll/a17;->e:I

    .line 21
    .line 22
    const/4 p1, 0x1

    .line 23
    iput-boolean p1, p0, Ll/a17;->g:Z

    .line 24
    .line 25
    iget-object p0, p0, Ll/a17;->i:Lrx/subjects/a;

    .line 26
    .line 27
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final synthetic m(Lcom/p1/mobile/putong/data/Counter;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Counter;->activities:Lcom/p1/mobile/putong/data/CounterActivities;

    .line 2
    .line 3
    iget p1, p1, Lcom/p1/mobile/putong/data/CounterActivities;->unread:I

    .line 4
    .line 5
    iput p1, p0, Ll/a17;->f:I

    .line 6
    .line 7
    iget-object p0, p0, Ll/a17;->i:Lrx/subjects/a;

    .line 8
    .line 9
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic n(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-boolean p1, p0, Ll/a17;->h:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    iput-boolean p1, p0, Ll/a17;->h:Z

    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    iput-boolean p1, p0, Ll/a17;->g:Z

    .line 10
    .line 11
    iget-object p0, p0, Ll/a17;->i:Lrx/subjects/a;

    .line 12
    .line 13
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public final synthetic o()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/a17;->e:I

    .line 3
    .line 4
    iput-boolean v0, p0, Ll/a17;->g:Z

    .line 5
    .line 6
    iget-object p0, p0, Ll/a17;->i:Lrx/subjects/a;

    .line 7
    .line 8
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic p(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a17;->i:Lrx/subjects/a;

    .line 2
    .line 3
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public q()Ll/kcg0;
    .locals 6

    .line 1
    iget-object v0, p0, Ll/a17;->j:Ll/kcg0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/kcg0;->isUnsubscribed()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/a17;->j:Ll/kcg0;

    .line 12
    .line 13
    invoke-interface {v0}, Ll/kcg0;->unsubscribe()V

    .line 14
    .line 15
    .line 16
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/g;->Qe()Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/u07;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/u07;-><init>(Ll/a17;)V

    .line 27
    .line 28
    .line 29
    sget-object v2, Lcom/p1/mobile/android/app/Act;->EMPTY_ON_ERROR:Ll/y20;

    .line 30
    .line 31
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 40
    .line 41
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/c;->n3()Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    new-instance v2, Ll/v07;

    .line 46
    .line 47
    invoke-direct {v2, p0}, Ll/v07;-><init>(Ll/a17;)V

    .line 48
    .line 49
    .line 50
    new-instance v3, Ll/w07;

    .line 51
    .line 52
    invoke-direct {v3, p0}, Ll/w07;-><init>(Ll/a17;)V

    .line 53
    .line 54
    .line 55
    invoke-static {v2, v3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    new-instance v2, Ll/x07;

    .line 64
    .line 65
    invoke-direct {v2, p0}, Ll/x07;-><init>(Ll/a17;)V

    .line 66
    .line 67
    .line 68
    invoke-static {v2}, Ll/pcg0;->a(Ll/x20;)Ll/kcg0;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    invoke-interface {v3}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->r9()Ll/c8m0;

    .line 77
    .line 78
    .line 79
    move-result-object v3

    .line 80
    invoke-interface {v3}, Ll/c8m0;->d()Lrx/subjects/a;

    .line 81
    .line 82
    .line 83
    move-result-object v3

    .line 84
    invoke-virtual {v3}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 89
    .line 90
    .line 91
    move-result-object v4

    .line 92
    invoke-virtual {v3, v4}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 93
    .line 94
    .line 95
    move-result-object v3

    .line 96
    new-instance v4, Ll/y07;

    .line 97
    .line 98
    invoke-direct {v4, p0}, Ll/y07;-><init>(Ll/a17;)V

    .line 99
    .line 100
    .line 101
    new-instance v5, Ll/z07;

    .line 102
    .line 103
    invoke-direct {v5}, Ll/z07;-><init>()V

    .line 104
    .line 105
    .line 106
    invoke-static {v4, v5}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 107
    .line 108
    .line 109
    move-result-object v4

    .line 110
    invoke-virtual {v3, v4}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 111
    .line 112
    .line 113
    move-result-object v3

    .line 114
    const/4 v4, 0x4

    .line 115
    new-array v4, v4, [Ll/kcg0;

    .line 116
    .line 117
    const/4 v5, 0x0

    .line 118
    aput-object v0, v4, v5

    .line 119
    .line 120
    const/4 v0, 0x1

    .line 121
    aput-object v1, v4, v0

    .line 122
    .line 123
    const/4 v0, 0x2

    .line 124
    aput-object v2, v4, v0

    .line 125
    .line 126
    const/4 v0, 0x3

    .line 127
    aput-object v3, v4, v0

    .line 128
    .line 129
    invoke-static {v4}, Ll/pcg0;->c([Ll/kcg0;)Ll/ft5;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    iput-object v0, p0, Ll/a17;->j:Ll/kcg0;

    .line 134
    .line 135
    return-object v0
.end method
