.class public Ll/w36;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:Ll/vqm;

.field private final b:Ll/bj2;

.field private c:Ll/ou3;

.field private d:Ll/tu3;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field private e:Ll/ew3;

.field private final f:Ll/nw3;

.field private g:Lcom/clevertap/android/sdk/product_config/CTProductConfigController;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field private final h:Ll/ch2;

.field private final i:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

.field private final j:Landroid/content/Context;

.field private final k:Ll/uzd;

.field private l:Lcom/clevertap/android/sdk/inapp/InAppController;

.field private m:Ll/cob0;

.field private n:Ll/ex3;

.field private o:Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/clevertap/android/sdk/CleverTapInstanceConfig;Ll/nw3;Ll/ch2;Ll/uzd;Ll/bj2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/w36;->i:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 5
    .line 6
    iput-object p3, p0, Ll/w36;->f:Ll/nw3;

    .line 7
    .line 8
    iput-object p4, p0, Ll/w36;->h:Ll/ch2;

    .line 9
    .line 10
    iput-object p5, p0, Ll/w36;->k:Ll/uzd;

    .line 11
    .line 12
    iput-object p1, p0, Ll/w36;->j:Landroid/content/Context;

    .line 13
    .line 14
    iput-object p6, p0, Ll/w36;->b:Ll/bj2;

    .line 15
    .line 16
    return-void
.end method

.method private a()V
    .locals 10
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/w36;->f:Ll/nw3;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/nw3;->b()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    monitor-enter v1

    .line 8
    :try_start_0
    invoke-virtual {p0}, Ll/w36;->e()Ll/ew3;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Ll/w36;->h:Ll/ch2;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/ch2;->a()V

    .line 17
    .line 18
    .line 19
    monitor-exit v1

    .line 20
    return-void

    .line 21
    :catchall_0
    move-exception v0

    .line 22
    move-object p0, v0

    .line 23
    goto :goto_1

    .line 24
    :cond_0
    iget-object v0, p0, Ll/w36;->k:Ll/uzd;

    .line 25
    .line 26
    invoke-virtual {v0}, Ll/uzd;->E()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    new-instance v2, Ll/ew3;

    .line 33
    .line 34
    iget-object v3, p0, Ll/w36;->i:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 35
    .line 36
    iget-object v0, p0, Ll/w36;->k:Ll/uzd;

    .line 37
    .line 38
    invoke-virtual {v0}, Ll/uzd;->E()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    iget-object v0, p0, Ll/w36;->b:Ll/bj2;

    .line 43
    .line 44
    iget-object v5, p0, Ll/w36;->j:Landroid/content/Context;

    .line 45
    .line 46
    invoke-interface {v0, v5}, Ll/bj2;->c(Landroid/content/Context;)Ll/h1c;

    .line 47
    .line 48
    .line 49
    move-result-object v5

    .line 50
    iget-object v6, p0, Ll/w36;->f:Ll/nw3;

    .line 51
    .line 52
    iget-object v7, p0, Ll/w36;->h:Ll/ch2;

    .line 53
    .line 54
    sget-boolean v8, Ll/xel0;->c:Z

    .line 55
    .line 56
    iget-object v9, p0, Ll/w36;->o:Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;

    .line 57
    .line 58
    invoke-direct/range {v2 .. v9}, Ll/ew3;-><init>(Lcom/clevertap/android/sdk/CleverTapInstanceConfig;Ljava/lang/String;Ll/h1c;Ll/nw3;Ll/ch2;ZLcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0, v2}, Ll/w36;->q(Ll/ew3;)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Ll/w36;->h:Ll/ch2;

    .line 65
    .line 66
    invoke-virtual {v0}, Ll/ch2;->a()V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Ll/w36;->o:Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;

    .line 70
    .line 71
    if-eqz v0, :cond_2

    .line 72
    .line 73
    iget-object p0, p0, Ll/w36;->k:Ll/uzd;

    .line 74
    .line 75
    invoke-virtual {p0}, Ll/uzd;->E()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-virtual {v0, p0}, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;->e(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_1
    iget-object p0, p0, Ll/w36;->i:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 84
    .line 85
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getLogger()Lcom/clevertap/android/sdk/Logger;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    const-string v0, "CRITICAL : No device ID found!"

    .line 90
    .line 91
    invoke-virtual {p0, v0}, Lcom/clevertap/android/sdk/Logger;->info(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    :cond_2
    :goto_0
    monitor-exit v1

    .line 95
    return-void

    .line 96
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 97
    throw p0
.end method

.method public static synthetic b(Ll/w36;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/w36;->a()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public c()Ll/ou3;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w36;->c:Ll/ou3;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Ll/tu3;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/w36;->d:Ll/tu3;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ll/ew3;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w36;->e:Ll/ew3;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()Lcom/clevertap/android/sdk/product_config/CTProductConfigController;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/w36;->g:Lcom/clevertap/android/sdk/product_config/CTProductConfigController;

    .line 2
    .line 3
    return-object p0
.end method

.method public g()Ll/ex3;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w36;->n:Ll/ex3;

    .line 2
    .line 3
    return-object p0
.end method

.method public h()Lcom/clevertap/android/sdk/inapp/InAppController;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w36;->l:Lcom/clevertap/android/sdk/inapp/InAppController;

    .line 2
    .line 3
    return-object p0
.end method

.method public i()Ll/vqm;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w36;->a:Ll/vqm;

    .line 2
    .line 3
    return-object p0
.end method

.method public j()Ll/cob0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w36;->m:Ll/cob0;

    .line 2
    .line 3
    return-object p0
.end method

.method public k()V
    .locals 2
    .annotation build Landroidx/annotation/AnyThread;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/w36;->i:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->isAnalyticsOnly()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Ll/w36;->i:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getLogger()Lcom/clevertap/android/sdk/Logger;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object p0, p0, Ll/w36;->i:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string v1, "Instance is analytics only, not initializing Notification Inbox"

    .line 22
    .line 23
    invoke-virtual {v0, p0, v1}, Lcom/clevertap/android/sdk/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    invoke-static {v1}, Ll/ru3;->c(Lcom/clevertap/android/sdk/CleverTapInstanceConfig;)Ll/su3;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Ll/su3;->d()Lcom/clevertap/android/sdk/task/Task;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    new-instance v1, Ll/w36$a;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Ll/w36$a;-><init>(Ll/w36;)V

    .line 38
    .line 39
    .line 40
    const-string p0, "initializeInbox"

    .line 41
    .line 42
    invoke-virtual {v0, p0, v1}, Lcom/clevertap/android/sdk/task/Task;->g(Ljava/lang/String;Ljava/util/concurrent/Callable;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public l()V
    .locals 2
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/w36;->i:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->isAnalyticsOnly()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/w36;->i:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getLogger()Lcom/clevertap/android/sdk/Logger;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object p0, p0, Ll/w36;->i:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string v1, "Instance is analytics only, not initializing Notification Inbox"

    .line 22
    .line 23
    invoke-virtual {v0, p0, v1}, Lcom/clevertap/android/sdk/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    invoke-direct {p0}, Ll/w36;->a()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public m(Lorg/json/JSONArray;Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w36;->h:Ll/ch2;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ch2;->e()Ll/ut2;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-interface {p0, p1, p2}, Ll/ut2;->a(Lorg/json/JSONArray;Z)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public n()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/w36;->n:Ll/ex3;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/w36;->h:Ll/ch2;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/ch2;->j()Ll/xhi;

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/w36;->h:Ll/ch2;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {v0, v1}, Ll/ch2;->x(Ll/xhi;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/w36;->n:Ll/ex3;

    .line 17
    .line 18
    invoke-virtual {p0, v1}, Ll/ex3;->i(Ll/xhi;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public o(Ll/ou3;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/w36;->c:Ll/ou3;

    .line 2
    .line 3
    return-void
.end method

.method public p(Ll/tu3;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iput-object p1, p0, Ll/w36;->d:Ll/tu3;

    .line 2
    .line 3
    return-void
.end method

.method public q(Ll/ew3;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/w36;->e:Ll/ew3;

    .line 2
    .line 3
    return-void
.end method

.method public r(Lcom/clevertap/android/sdk/product_config/CTProductConfigController;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iput-object p1, p0, Ll/w36;->g:Lcom/clevertap/android/sdk/product_config/CTProductConfigController;

    .line 2
    .line 3
    return-void
.end method

.method public s(Ll/ex3;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/w36;->n:Ll/ex3;

    .line 2
    .line 3
    return-void
.end method

.method public t(Lcom/clevertap/android/sdk/inapp/InAppController;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/w36;->l:Lcom/clevertap/android/sdk/inapp/InAppController;

    .line 2
    .line 3
    return-void
.end method

.method public u(Ll/vqm;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/w36;->a:Ll/vqm;

    .line 2
    .line 3
    return-void
.end method

.method public v(Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/w36;->o:Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;

    .line 2
    .line 3
    return-void
.end method

.method public w(Ll/cob0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/w36;->m:Ll/cob0;

    .line 2
    .line 3
    return-void
.end method
