.class public Ll/q0w;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/RestrictTo;
    value = {
        .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY:Landroidx/annotation/RestrictTo$Scope;
    }
.end annotation


# instance fields
.field private a:Ljava/lang/String;

.field private final b:Ll/sk0;

.field private final c:Ll/ik2;

.field private final d:Ll/nw3;

.field private final e:Ll/ch2;

.field private final f:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

.field private final g:Landroid/content/Context;

.field private final h:Ll/w36;

.field private final i:Ll/bu9;

.field private final j:Ll/bj2;

.field private final k:Ll/uzd;

.field private final l:Ll/duv;

.field private final m:Ll/cob0;

.field private final n:Ll/xse0;

.field private final o:Ll/u0l0;

.field private final p:Ll/u0w;

.field private final q:Lcom/clevertap/android/sdk/network/ContentFetchManager;

.field private final r:Lcom/clevertap/android/sdk/inbox/InboxV2Bridge;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/clevertap/android/sdk/CleverTapInstanceConfig;Ll/uzd;Ll/u0l0;Ll/ik2;Ll/sk0;Ll/bu9;Ll/w36;Ll/xse0;Ll/duv;Ll/ch2;Ll/n1c;Ll/nw3;Ll/u0w;Lcom/clevertap/android/sdk/network/ContentFetchManager;Lcom/clevertap/android/sdk/inbox/InboxV2Bridge;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/q0w;->a:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p2, p0, Ll/q0w;->f:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 8
    .line 9
    iput-object p1, p0, Ll/q0w;->g:Landroid/content/Context;

    .line 10
    .line 11
    iput-object p3, p0, Ll/q0w;->k:Ll/uzd;

    .line 12
    .line 13
    iput-object p4, p0, Ll/q0w;->o:Ll/u0l0;

    .line 14
    .line 15
    iput-object p5, p0, Ll/q0w;->c:Ll/ik2;

    .line 16
    .line 17
    iput-object p6, p0, Ll/q0w;->b:Ll/sk0;

    .line 18
    .line 19
    iput-object p7, p0, Ll/q0w;->i:Ll/bu9;

    .line 20
    .line 21
    invoke-virtual {p8}, Ll/w36;->j()Ll/cob0;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iput-object p1, p0, Ll/q0w;->m:Ll/cob0;

    .line 26
    .line 27
    iput-object p9, p0, Ll/q0w;->n:Ll/xse0;

    .line 28
    .line 29
    iput-object p10, p0, Ll/q0w;->l:Ll/duv;

    .line 30
    .line 31
    iput-object p11, p0, Ll/q0w;->e:Ll/ch2;

    .line 32
    .line 33
    iput-object p12, p0, Ll/q0w;->j:Ll/bj2;

    .line 34
    .line 35
    iput-object p8, p0, Ll/q0w;->h:Ll/w36;

    .line 36
    .line 37
    iput-object p13, p0, Ll/q0w;->d:Ll/nw3;

    .line 38
    .line 39
    iput-object p14, p0, Ll/q0w;->p:Ll/u0w;

    .line 40
    .line 41
    move-object/from16 p1, p15

    .line 42
    .line 43
    iput-object p1, p0, Ll/q0w;->q:Lcom/clevertap/android/sdk/network/ContentFetchManager;

    .line 44
    .line 45
    move-object/from16 p1, p16

    .line 46
    .line 47
    iput-object p1, p0, Ll/q0w;->r:Lcom/clevertap/android/sdk/inbox/InboxV2Bridge;

    .line 48
    .line 49
    return-void
.end method

.method private D()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/q0w;->h:Ll/w36;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/w36;->c()Ll/ou3;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/q0w;->h:Ll/w36;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/w36;->c()Ll/ou3;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/ou3;->a()V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-object v0, p0, Ll/q0w;->f:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getLogger()Lcom/clevertap/android/sdk/Logger;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object p0, p0, Ll/q0w;->f:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const-string v1, "DisplayUnit : Can\'t reset Display Units, DisplayUnitcontroller is null"

    .line 32
    .line 33
    invoke-virtual {v0, p0, v1}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method private E()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/q0w;->h:Ll/w36;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/w36;->d()Ll/tu3;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/tu3;->m()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/q0w;->k:Ll/uzd;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/uzd;->E()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {v0, p0}, Ll/tu3;->o(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ll/tu3;->e()V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    iget-object v0, p0, Ll/q0w;->f:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getLogger()Lcom/clevertap/android/sdk/Logger;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iget-object p0, p0, Ll/q0w;->f:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    const-string v1, "DisplayUnit : Can\'t reset Display Units, CTFeatureFlagsController is null"

    .line 41
    .line 42
    invoke-virtual {v0, p0, v1}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method private F()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/q0w;->d:Ll/nw3;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/nw3;->b()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    iget-object v1, p0, Ll/q0w;->h:Ll/w36;

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-virtual {v1, v2}, Ll/w36;->q(Ll/ew3;)V

    .line 12
    .line 13
    .line 14
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    iget-object v0, p0, Ll/q0w;->h:Ll/w36;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/w36;->k()V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/q0w;->r:Lcom/clevertap/android/sdk/inbox/InboxV2Bridge;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inbox/InboxV2Bridge;->c()V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :catchall_0
    move-exception p0

    .line 27
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 28
    throw p0
.end method

.method private G()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/q0w;->f:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

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
    iget-object v0, p0, Ll/q0w;->f:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getLogger()Lcom/clevertap/android/sdk/Logger;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object p0, p0, Ll/q0w;->f:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string v1, "Product Config is not enabled for this instance"

    .line 22
    .line 23
    invoke-virtual {v0, p0, v1}, Lcom/clevertap/android/sdk/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    iget-object v0, p0, Ll/q0w;->h:Ll/w36;

    .line 28
    .line 29
    invoke-virtual {v0}, Ll/w36;->f()Lcom/clevertap/android/sdk/product_config/CTProductConfigController;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    iget-object v0, p0, Ll/q0w;->h:Ll/w36;

    .line 36
    .line 37
    invoke-virtual {v0}, Ll/w36;->f()Lcom/clevertap/android/sdk/product_config/CTProductConfigController;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/product_config/CTProductConfigController;->t()V

    .line 42
    .line 43
    .line 44
    :cond_1
    iget-object v1, p0, Ll/q0w;->g:Landroid/content/Context;

    .line 45
    .line 46
    iget-object v2, p0, Ll/q0w;->k:Ll/uzd;

    .line 47
    .line 48
    iget-object v3, p0, Ll/q0w;->f:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 49
    .line 50
    iget-object v4, p0, Ll/q0w;->b:Ll/sk0;

    .line 51
    .line 52
    iget-object v5, p0, Ll/q0w;->i:Ll/bu9;

    .line 53
    .line 54
    iget-object v6, p0, Ll/q0w;->e:Ll/ch2;

    .line 55
    .line 56
    invoke-static/range {v1 .. v6}, Ll/tw3;->a(Landroid/content/Context;Ll/uzd;Lcom/clevertap/android/sdk/CleverTapInstanceConfig;Ll/xe2;Ll/bu9;Ll/ch2;)Lcom/clevertap/android/sdk/product_config/CTProductConfigController;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iget-object v1, p0, Ll/q0w;->h:Ll/w36;

    .line 61
    .line 62
    invoke-virtual {v1, v0}, Ll/w36;->r(Lcom/clevertap/android/sdk/product_config/CTProductConfigController;)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Ll/q0w;->f:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 66
    .line 67
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getLogger()Lcom/clevertap/android/sdk/Logger;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    iget-object p0, p0, Ll/q0w;->f:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 72
    .line 73
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    const-string v1, "Product Config reset"

    .line 78
    .line 79
    invoke-virtual {v0, p0, v1}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method private H()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/q0w;->h:Ll/w36;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/w36;->g()Ll/ex3;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/q0w;->h:Ll/w36;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/w36;->g()Ll/ex3;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/ex3;->e()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method private I()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/q0w;->f:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 2
    .line 3
    invoke-static {v0}, Ll/ru3;->c(Lcom/clevertap/android/sdk/CleverTapInstanceConfig;)Ll/su3;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/su3;->d()Lcom/clevertap/android/sdk/task/Task;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/p0w;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/p0w;-><init>(Ll/q0w;)V

    .line 14
    .line 15
    .line 16
    const-string p0, "postSwitchInboxFetch"

    .line 17
    .line 18
    invoke-virtual {v0, p0, v1}, Lcom/clevertap/android/sdk/task/Task;->g(Ljava/lang/String;Ljava/util/concurrent/Callable;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static synthetic a(Ll/q0w;)Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/q0w;->c:Ll/ik2;

    .line 2
    .line 3
    iget-object v1, p0, Ll/q0w;->g:Landroid/content/Context;

    .line 4
    .line 5
    sget-object v2, Lcom/clevertap/android/sdk/events/EventGroup;->REGULAR:Lcom/clevertap/android/sdk/events/EventGroup;

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Ll/ik2;->b(Landroid/content/Context;Lcom/clevertap/android/sdk/events/EventGroup;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/q0w;->r:Lcom/clevertap/android/sdk/inbox/InboxV2Bridge;

    .line 11
    .line 12
    sget-object v0, Lcom/clevertap/android/sdk/network/fetch/FetchTrigger;->SYSTEM:Lcom/clevertap/android/sdk/network/fetch/FetchTrigger;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-virtual {p0, v0, v1}, Lcom/clevertap/android/sdk/inbox/InboxV2Bridge;->d(Lcom/clevertap/android/sdk/network/fetch/FetchTrigger;Ll/uhi;)V

    .line 16
    .line 17
    .line 18
    return-object v1
.end method

.method private b(Ljava/util/Map;Ljava/lang/String;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto/16 :goto_4

    .line 4
    .line 5
    :cond_0
    :try_start_0
    iget-object v0, p0, Ll/q0w;->k:Ll/uzd;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/uzd;->E()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    goto/16 :goto_4

    .line 14
    .line 15
    :cond_1
    iget-object v1, p0, Ll/q0w;->g:Landroid/content/Context;

    .line 16
    .line 17
    iget-object v2, p0, Ll/q0w;->f:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 18
    .line 19
    iget-object v3, p0, Ll/q0w;->o:Ll/u0l0;

    .line 20
    .line 21
    invoke-static {v1, v2, v3}, Ll/nfm;->a(Landroid/content/Context;Lcom/clevertap/android/sdk/CleverTapInstanceConfig;Ll/u0l0;)Ll/mfm;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    const/4 v3, 0x0

    .line 34
    :catchall_0
    :cond_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    if-eqz v4, :cond_5

    .line 39
    .line 40
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    check-cast v4, Ljava/lang/String;

    .line 45
    .line 46
    invoke-interface {p1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v5

    .line 50
    invoke-interface {v1, v4}, Ll/mfm;->b(Ljava/lang/String;)Z

    .line 51
    .line 52
    .line 53
    move-result v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 54
    if-eqz v6, :cond_2

    .line 55
    .line 56
    :try_start_1
    instance-of v6, v5, Ljava/lang/Number;

    .line 57
    .line 58
    if-nez v6, :cond_4

    .line 59
    .line 60
    instance-of v6, v5, Ljava/lang/String;

    .line 61
    .line 62
    if-nez v6, :cond_4

    .line 63
    .line 64
    instance-of v6, v5, Ljava/lang/Boolean;

    .line 65
    .line 66
    if-eqz v6, :cond_3

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_3
    iget-object v5, p0, Ll/q0w;->f:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 70
    .line 71
    invoke-virtual {v5}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getLogger()Lcom/clevertap/android/sdk/Logger;

    .line 72
    .line 73
    .line 74
    move-result-object v5

    .line 75
    iget-object v6, p0, Ll/q0w;->f:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 76
    .line 77
    invoke-virtual {v6}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v6

    .line 81
    new-instance v7, Ljava/lang/StringBuilder;

    .line 82
    .line 83
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 84
    .line 85
    .line 86
    const-string v8, "onUserLogin: Aborting the operation. Non-primitive value for the identifier key = "

    .line 87
    .line 88
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v4

    .line 98
    invoke-virtual {v5, v6, v4}, Lcom/clevertap/android/sdk/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    goto/16 :goto_4

    .line 102
    .line 103
    :cond_4
    :goto_0
    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v5

    .line 107
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    .line 108
    .line 109
    .line 110
    move-result v6

    .line 111
    if-nez v6, :cond_2

    .line 112
    .line 113
    const/4 v3, 0x1

    .line 114
    iget-object v6, p0, Ll/q0w;->p:Ll/u0w;

    .line 115
    .line 116
    invoke-virtual {v6, v4, v5}, Ll/u0w;->g(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v4

    .line 120
    iput-object v4, p0, Ll/q0w;->a:Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 121
    .line 122
    if-eqz v4, :cond_2

    .line 123
    .line 124
    goto :goto_1

    .line 125
    :catchall_1
    move-exception p1

    .line 126
    goto/16 :goto_3

    .line 127
    .line 128
    :cond_5
    :goto_1
    :try_start_2
    iget-object v1, p0, Ll/q0w;->k:Ll/uzd;

    .line 129
    .line 130
    invoke-virtual {v1}, Ll/uzd;->d0()Z

    .line 131
    .line 132
    .line 133
    move-result v1

    .line 134
    if-nez v1, :cond_7

    .line 135
    .line 136
    if-eqz v3, :cond_6

    .line 137
    .line 138
    iget-object v1, p0, Ll/q0w;->p:Ll/u0w;

    .line 139
    .line 140
    invoke-virtual {v1}, Ll/u0w;->h()Z

    .line 141
    .line 142
    .line 143
    move-result v1

    .line 144
    if-eqz v1, :cond_7

    .line 145
    .line 146
    :cond_6
    iget-object p2, p0, Ll/q0w;->f:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 147
    .line 148
    invoke-virtual {p2}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getLogger()Lcom/clevertap/android/sdk/Logger;

    .line 149
    .line 150
    .line 151
    move-result-object p2

    .line 152
    iget-object v0, p0, Ll/q0w;->f:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 153
    .line 154
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    const-string v1, "onUserLogin: no identifier provided or device is anonymous, pushing on current user profile"

    .line 159
    .line 160
    invoke-virtual {p2, v0, v1}, Lcom/clevertap/android/sdk/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 161
    .line 162
    .line 163
    iget-object p2, p0, Ll/q0w;->b:Ll/sk0;

    .line 164
    .line 165
    invoke-virtual {p2, p1}, Ll/sk0;->N(Ljava/util/Map;)V

    .line 166
    .line 167
    .line 168
    goto/16 :goto_4

    .line 169
    .line 170
    :cond_7
    iget-object v1, p0, Ll/q0w;->a:Ljava/lang/String;

    .line 171
    .line 172
    if-eqz v1, :cond_8

    .line 173
    .line 174
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 175
    .line 176
    .line 177
    move-result v1

    .line 178
    if-eqz v1, :cond_8

    .line 179
    .line 180
    iget-object p2, p0, Ll/q0w;->f:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 181
    .line 182
    invoke-virtual {p2}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getLogger()Lcom/clevertap/android/sdk/Logger;

    .line 183
    .line 184
    .line 185
    move-result-object p2

    .line 186
    iget-object v1, p0, Ll/q0w;->f:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 187
    .line 188
    invoke-virtual {v1}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object v1

    .line 192
    new-instance v2, Ljava/lang/StringBuilder;

    .line 193
    .line 194
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 195
    .line 196
    .line 197
    const-string v3, "onUserLogin: "

    .line 198
    .line 199
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 200
    .line 201
    .line 202
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 203
    .line 204
    .line 205
    const-string v3, " maps to current device id "

    .line 206
    .line 207
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 208
    .line 209
    .line 210
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 211
    .line 212
    .line 213
    const-string v0, " pushing on current profile"

    .line 214
    .line 215
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 216
    .line 217
    .line 218
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 219
    .line 220
    .line 221
    move-result-object v0

    .line 222
    invoke-virtual {p2, v1, v0}, Lcom/clevertap/android/sdk/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 223
    .line 224
    .line 225
    iget-object p2, p0, Ll/q0w;->b:Ll/sk0;

    .line 226
    .line 227
    invoke-virtual {p2, p1}, Ll/sk0;->N(Ljava/util/Map;)V

    .line 228
    .line 229
    .line 230
    goto :goto_4

    .line 231
    :cond_8
    iget-object v0, p0, Ll/q0w;->f:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 232
    .line 233
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getLogger()Lcom/clevertap/android/sdk/Logger;

    .line 234
    .line 235
    .line 236
    move-result-object v0

    .line 237
    iget-object v1, p0, Ll/q0w;->f:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 238
    .line 239
    invoke-virtual {v1}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 240
    .line 241
    .line 242
    move-result-object v1

    .line 243
    new-instance v2, Ljava/lang/StringBuilder;

    .line 244
    .line 245
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 246
    .line 247
    .line 248
    const-string v3, "onUserLogin: queuing reset profile for "

    .line 249
    .line 250
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 251
    .line 252
    .line 253
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 254
    .line 255
    .line 256
    const-string v3, " with Cached GUID "

    .line 257
    .line 258
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 259
    .line 260
    .line 261
    iget-object v3, p0, Ll/q0w;->a:Ljava/lang/String;

    .line 262
    .line 263
    if-eqz v3, :cond_9

    .line 264
    .line 265
    goto :goto_2

    .line 266
    :cond_9
    const-string v3, "NULL"

    .line 267
    .line 268
    :goto_2
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 269
    .line 270
    .line 271
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 272
    .line 273
    .line 274
    move-result-object v2

    .line 275
    invoke-virtual {v0, v1, v2}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 276
    .line 277
    .line 278
    iget-object v0, p0, Ll/q0w;->a:Ljava/lang/String;

    .line 279
    .line 280
    invoke-virtual {p0, p1, v0, p2}, Ll/q0w;->y(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 281
    .line 282
    .line 283
    goto :goto_4

    .line 284
    :goto_3
    iget-object p2, p0, Ll/q0w;->f:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 285
    .line 286
    invoke-virtual {p2}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getLogger()Lcom/clevertap/android/sdk/Logger;

    .line 287
    .line 288
    .line 289
    move-result-object p2

    .line 290
    iget-object p0, p0, Ll/q0w;->f:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 291
    .line 292
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 293
    .line 294
    .line 295
    move-result-object p0

    .line 296
    const-string v0, "onUserLogin failed"

    .line 297
    .line 298
    invoke-virtual {p2, p0, v0, p1}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 299
    .line 300
    .line 301
    :goto_4
    return-void
.end method

.method public static synthetic c(Ll/q0w;)Lcom/clevertap/android/sdk/CleverTapInstanceConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q0w;->f:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d(Ll/q0w;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q0w;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic e(Ll/q0w;)Ll/uzd;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q0w;->k:Ll/uzd;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic f(Ll/q0w;)Ll/ch2;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q0w;->e:Ll/ch2;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic g(Ll/q0w;)Ll/duv;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q0w;->l:Ll/duv;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic h(Ll/q0w;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/q0w;->H()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i(Ll/q0w;)Ll/sk0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q0w;->b:Ll/sk0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic j(Ll/q0w;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/q0w;->F()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic k(Ll/q0w;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/q0w;->I()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic l(Ll/q0w;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/q0w;->E()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic m(Ll/q0w;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/q0w;->G()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic n(Ll/q0w;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/q0w;->D()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic o(Ll/q0w;)Ll/bu9;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q0w;->i:Ll/bu9;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic p(Ll/q0w;)Ll/w36;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q0w;->h:Ll/w36;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic q(Ll/q0w;Ljava/util/Map;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/q0w;->b(Ljava/util/Map;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic r(Ll/q0w;)Ll/cob0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q0w;->m:Ll/cob0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic s(Ll/q0w;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q0w;->g:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic t(Ll/q0w;)Ll/ik2;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q0w;->c:Ll/ik2;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic u(Ll/q0w;)Lcom/clevertap/android/sdk/network/ContentFetchManager;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q0w;->q:Lcom/clevertap/android/sdk/network/ContentFetchManager;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic v(Ll/q0w;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/q0w;->z()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic w(Ll/q0w;)Ll/bj2;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q0w;->j:Ll/bj2;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic x(Ll/q0w;)Ll/xse0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q0w;->n:Ll/xse0;

    .line 2
    .line 3
    return-object p0
.end method

.method private z()V
    .locals 2
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/q0w;->h:Ll/w36;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/w36;->h()Lcom/clevertap/android/sdk/inapp/InAppController;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/q0w;->h:Ll/w36;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/w36;->h()Lcom/clevertap/android/sdk/inapp/InAppController;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/inapp/InAppController;->x()V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/q0w;->f:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getLogger()Lcom/clevertap/android/sdk/Logger;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object p0, p0, Ll/q0w;->f:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const-string v1, "Cancelled all scheduled in-apps for user change"

    .line 31
    .line 32
    invoke-virtual {v0, p0, v1}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method


# virtual methods
.method public A()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/q0w;->e:Ll/ch2;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ch2;->f()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-eqz v2, :cond_1

    .line 17
    .line 18
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    check-cast v2, Ll/es4;

    .line 23
    .line 24
    if-eqz v2, :cond_0

    .line 25
    .line 26
    iget-object v3, p0, Ll/q0w;->k:Ll/uzd;

    .line 27
    .line 28
    invoke-virtual {v3}, Ll/uzd;->E()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    iget-object v4, p0, Ll/q0w;->f:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 33
    .line 34
    invoke-virtual {v4}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v4

    .line 38
    invoke-interface {v2, v3, v4}, Ll/es4;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :catchall_0
    move-exception p0

    .line 43
    goto :goto_1

    .line 44
    :cond_1
    monitor-exit v0

    .line 45
    return-void

    .line 46
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 47
    throw p0
.end method

.method public B(Ljava/util/Map;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/q0w;->f:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getEnableCustomCleverTapId()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    if-nez p2, :cond_1

    .line 10
    .line 11
    const-string v0, "CLEVERTAP_USE_CUSTOM_ID has been specified in the AndroidManifest.xml Please call onUserlogin() and pass a custom CleverTap ID"

    .line 12
    .line 13
    invoke-static {v0}, Lcom/clevertap/android/sdk/Logger;->i(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    if-eqz p2, :cond_1

    .line 18
    .line 19
    const-string v0, "CLEVERTAP_USE_CUSTOM_ID has not been specified in the AndroidManifest.xml Please call CleverTapAPI.defaultInstance() without a custom CleverTap ID"

    .line 20
    .line 21
    invoke-static {v0}, Lcom/clevertap/android/sdk/Logger;->i(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    :cond_1
    :goto_0
    iget-object v0, p0, Ll/q0w;->f:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 25
    .line 26
    invoke-static {v0}, Ll/ru3;->c(Lcom/clevertap/android/sdk/CleverTapInstanceConfig;)Ll/su3;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Ll/su3;->d()Lcom/clevertap/android/sdk/task/Task;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v1, Ll/q0w$b;

    .line 35
    .line 36
    invoke-direct {v1, p0, p1, p2}, Ll/q0w$b;-><init>(Ll/q0w;Ljava/util/Map;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    const-string p0, "_onUserLogin"

    .line 40
    .line 41
    invoke-virtual {v0, p0, v1}, Lcom/clevertap/android/sdk/task/Task;->g(Ljava/lang/String;Ljava/util/concurrent/Callable;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public C()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/q0w;->k:Ll/uzd;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/uzd;->W()Ljava/util/ArrayList;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Ll/s0l0;

    .line 22
    .line 23
    iget-object v2, p0, Ll/q0w;->o:Ll/u0l0;

    .line 24
    .line 25
    invoke-virtual {v2, v1}, Ll/u0l0;->c(Ll/s0l0;)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    return-void
.end method

.method public y(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/q0w;->f:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 2
    .line 3
    invoke-static {v0}, Ll/ru3;->c(Lcom/clevertap/android/sdk/CleverTapInstanceConfig;)Ll/su3;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/su3;->d()Lcom/clevertap/android/sdk/task/Task;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/q0w$a;

    .line 12
    .line 13
    invoke-direct {v1, p0, p1, p2, p3}, Ll/q0w$a;-><init>(Ll/q0w;Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string p0, "resetProfile"

    .line 17
    .line 18
    invoke-virtual {v0, p0, v1}, Lcom/clevertap/android/sdk/task/Task;->g(Ljava/lang/String;Ljava/util/concurrent/Callable;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
