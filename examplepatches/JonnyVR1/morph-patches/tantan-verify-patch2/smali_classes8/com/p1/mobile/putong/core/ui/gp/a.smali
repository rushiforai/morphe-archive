.class public Lcom/p1/mobile/putong/core/ui/gp/a;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static volatile p:Lcom/p1/mobile/putong/core/ui/gp/a;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public final e:Ljava/lang/String;

.field public final f:I

.field public final g:I

.field public final h:I

.field public final i:I

.field public j:Ll/byd0;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SV_USE_DUP_ID"
        }
    .end annotation
.end field

.field public k:Ll/vxd0;

.field public l:Ll/vxd0;

.field public m:Ll/vxd0;

.field public n:Ljava/lang/String;

.field public o:Ll/gcg0;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "message_count_"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/gp/a;->a:Ljava/lang/String;

    .line 7
    .line 8
    const-string v0, "_"

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/gp/a;->b:Ljava/lang/String;

    .line 11
    .line 12
    const-string v0, "_receive"

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/gp/a;->c:Ljava/lang/String;

    .line 15
    .line 16
    const-string v0, "_send"

    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/gp/a;->d:Ljava/lang/String;

    .line 19
    .line 20
    const-string v0, "_match"

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/gp/a;->e:Ljava/lang/String;

    .line 23
    .line 24
    const/4 v0, 0x3

    .line 25
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/gp/a;->f:I

    .line 26
    .line 27
    const/16 v0, 0xa

    .line 28
    .line 29
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/gp/a;->g:I

    .line 30
    .line 31
    const/4 v0, 0x5

    .line 32
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/gp/a;->h:I

    .line 33
    .line 34
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/gp/a;->i:I

    .line 35
    .line 36
    new-instance v0, Ll/byd0;

    .line 37
    .line 38
    const-wide/16 v1, 0x0

    .line 39
    .line 40
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    const-string v2, "rate_popup_last_shown_new"

    .line 45
    .line 46
    invoke-direct {v0, v2, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 47
    .line 48
    .line 49
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/gp/a;->j:Ll/byd0;

    .line 50
    .line 51
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/gp/a;->n()V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/gp/a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/gp/a;->m()V

    return-void
.end method

.method public static synthetic b(Ll/jl80;Ljava/lang/Runnable;Landroid/view/View;Z)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    new-instance p0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    const-string p2, "no"

    .line 10
    .line 11
    const-string v0, "neverask"

    .line 12
    .line 13
    invoke-interface {p0, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    if-eqz p3, :cond_0

    .line 17
    .line 18
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 19
    .line 20
    .line 21
    const-string p1, "yes"

    .line 22
    .line 23
    invoke-interface {p0, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    :cond_0
    const-string p1, "e_intl_5star_dialog_cancel_butto"

    .line 27
    .line 28
    const-string p2, "p_intl_5star_dialog_view"

    .line 29
    .line 30
    invoke-static {p1, p2, p0}, Ll/i4g0;->s(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/android/app/Act;Ll/jl80;Ljava/lang/Runnable;Landroid/view/View;Z)V
    .locals 0

    .line 1
    :try_start_0
    invoke-static {p0}, Ll/uxw;->d(Landroid/app/Activity;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    goto :goto_0

    .line 6
    :catch_0
    move-exception p0

    .line 7
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 8
    .line 9
    .line 10
    :goto_0
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    sget p0, Lcom/p1/mobile/putong/core/R$string;->fm:I

    .line 17
    .line 18
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 19
    .line 20
    .line 21
    :cond_0
    invoke-virtual {p1}, Ll/g1e;->dismiss()V

    .line 22
    .line 23
    .line 24
    new-instance p0, Ljava/util/HashMap;

    .line 25
    .line 26
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 27
    .line 28
    .line 29
    const-string p1, "no"

    .line 30
    .line 31
    const-string p3, "neverask"

    .line 32
    .line 33
    invoke-interface {p0, p3, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    if-eqz p4, :cond_1

    .line 37
    .line 38
    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    .line 39
    .line 40
    .line 41
    const-string p1, "yes"

    .line 42
    .line 43
    invoke-interface {p0, p3, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    :cond_1
    const-string p1, "e_intl_5star_dialog_rating_button"

    .line 47
    .line 48
    const-string p2, "p_intl_5star_dialog_view"

    .line 49
    .line 50
    invoke-static {p1, p2, p0}, Ll/i4g0;->s(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public static synthetic d(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/ui/gp/a;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/gp/a;->k(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/core/ui/gp/a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/gp/a;->l()V

    return-void
.end method

.method public static j()Lcom/p1/mobile/putong/core/ui/gp/a;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/gp/a;->p:Lcom/p1/mobile/putong/core/ui/gp/a;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Lcom/p1/mobile/putong/core/ui/gp/a;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Lcom/p1/mobile/putong/core/ui/gp/a;->p:Lcom/p1/mobile/putong/core/ui/gp/a;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Lcom/p1/mobile/putong/core/ui/gp/a;

    .line 13
    .line 14
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/ui/gp/a;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Lcom/p1/mobile/putong/core/ui/gp/a;->p:Lcom/p1/mobile/putong/core/ui/gp/a;

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
    sget-object v0, Lcom/p1/mobile/putong/core/ui/gp/a;->p:Lcom/p1/mobile/putong/core/ui/gp/a;

    .line 27
    .line 28
    return-object v0
.end method

.method public static q(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;Ljava/lang/Runnable;)V
    .locals 8

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/gp/GpRateGuideDialog;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/gp/GpRateGuideDialog;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->newDialog()Ll/jl80$a;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1, v0}, Ll/jl80$a;->R(Landroid/view/View;)Ll/jl80$a;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    const/4 v2, 0x1

    .line 15
    invoke-virtual {v1, v2}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1}, Ll/jl80$a;->r0()Ll/jl80;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    const-string v3, "p_intl_5star_dialog_view"

    .line 32
    .line 33
    invoke-static {v3, v2}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-virtual {v3}, Ll/pk50;->f()Ll/rj50;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    sget-object v4, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_intl_5star_dialog_view:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 46
    .line 47
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    new-instance v5, Ll/pf60;

    .line 52
    .line 53
    const-string v6, "tooltips_trigger_mode"

    .line 54
    .line 55
    const-string v7, "passive"

    .line 56
    .line 57
    invoke-direct {v5, v6, v7}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 58
    .line 59
    .line 60
    filled-new-array {v5}, [Ll/pf60;

    .line 61
    .line 62
    .line 63
    move-result-object v5

    .line 64
    invoke-virtual {v3, v4, v5}, Ll/rj50;->V(Ljava/lang/String;[Ll/pf60;)[Ll/pf60;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    invoke-virtual {v2, v3}, Ll/l4g0;->p([Ll/pf60;)V

    .line 69
    .line 70
    .line 71
    invoke-static {v2}, Ll/w1e;->f(Ll/l4g0;)V

    .line 72
    .line 73
    .line 74
    new-instance v3, Ll/elc0;

    .line 75
    .line 76
    invoke-direct {v3, v2}, Ll/elc0;-><init>(Ll/l4g0;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v1, v3}, Ll/g1e;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 80
    .line 81
    .line 82
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    if-eqz v2, :cond_0

    .line 87
    .line 88
    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    .line 89
    .line 90
    .line 91
    :cond_0
    new-instance p2, Ll/flc0;

    .line 92
    .line 93
    invoke-direct {p2, p0, v1, p1}, Ll/flc0;-><init>(Lcom/p1/mobile/android/app/Act;Ll/jl80;Ljava/lang/Runnable;)V

    .line 94
    .line 95
    .line 96
    new-instance p0, Ll/glc0;

    .line 97
    .line 98
    invoke-direct {p0, v1, p1}, Ll/glc0;-><init>(Ll/jl80;Ljava/lang/Runnable;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {v0, p2, p0}, Lcom/p1/mobile/putong/core/ui/gp/GpRateGuideDialog;->g(Lcom/p1/mobile/putong/core/ui/gp/GpRateGuideDialog$a;Lcom/p1/mobile/putong/core/ui/gp/GpRateGuideDialog$a;)V

    .line 102
    .line 103
    .line 104
    return-void
.end method


# virtual methods
.method public g()V
    .locals 3

    .line 1
    invoke-static {}, Ll/icg0;->a()Ll/gcg0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/gp/a;->o:Ll/gcg0;

    .line 6
    .line 7
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/g;->qn()Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    new-instance v2, Ll/hlc0;

    .line 16
    .line 17
    invoke-direct {v2, p0}, Ll/hlc0;-><init>(Lcom/p1/mobile/putong/core/ui/gp/a;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {v1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {v0, p0}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public declared-synchronized h()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/gp/a;->i()V

    .line 3
    .line 4
    .line 5
    const-string v0, ""

    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/gp/a;->n:Ljava/lang/String;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/gp/a;->k:Ll/vxd0;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/gp/a;->l:Ll/vxd0;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/gp/a;->m:Ll/vxd0;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    .line 16
    monitor-exit p0

    .line 17
    return-void

    .line 18
    :catchall_0
    move-exception v0

    .line 19
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 20
    throw v0
.end method

.method public final i()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gp/a;->k:Ll/vxd0;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gp/a;->k:Ll/vxd0;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/vxd0;->clear()Z

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gp/a;->k:Ll/vxd0;

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0, v0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public final synthetic k(Ljava/util/List;)V
    .locals 2

    .line 1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const/4 v0, 0x0

    .line 6
    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_1

    .line 11
    .line 12
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 17
    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {v1}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-nez v1, :cond_0

    .line 27
    .line 28
    add-int/lit8 v0, v0, 0x1

    .line 29
    .line 30
    const/4 v1, 0x5

    .line 31
    if-lt v0, v1, :cond_0

    .line 32
    .line 33
    :cond_1
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/gp/a;->r(I)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final synthetic l()V
    .locals 4

    .line 1
    invoke-static {}, Ll/spl0;->F()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-wide v1, 0x7fffffffffffffffL

    .line 6
    .line 7
    .line 8
    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Ll/pk50;->f()Ll/rj50;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sget-object v3, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_intl_5star_dialog_view:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 21
    .line 22
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    invoke-virtual {v0, v3, v1, v2}, Ll/rj50;->v0(Ljava/lang/String;J)V

    .line 27
    .line 28
    .line 29
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gp/a;->j:Ll/byd0;

    .line 30
    .line 31
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {p0, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final synthetic m()V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gp/a;->j:Ll/byd0;

    .line 2
    .line 3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public n()V
    .locals 8

    .line 1
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v2, "message_count_"

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    const/4 v2, 0x1

    .line 13
    invoke-virtual {v0, v2}, Ljava/util/Calendar;->get(I)I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const/4 v3, 0x2

    .line 21
    invoke-virtual {v0, v3}, Ljava/util/Calendar;->get(I)I

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const/4 v3, 0x5

    .line 29
    invoke-virtual {v0, v3}, Ljava/util/Calendar;->get(I)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/gp/a;->n:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-nez v1, :cond_2

    .line 47
    .line 48
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/gp/a;->n:Ljava/lang/String;

    .line 49
    .line 50
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/gp/a;->l:Ll/vxd0;

    .line 51
    .line 52
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    if-eqz v3, :cond_0

    .line 57
    .line 58
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/gp/a;->l:Ll/vxd0;

    .line 59
    .line 60
    invoke-virtual {v3}, Ll/vxd0;->clear()Z

    .line 61
    .line 62
    .line 63
    :cond_0
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/gp/a;->k:Ll/vxd0;

    .line 64
    .line 65
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    if-eqz v3, :cond_1

    .line 70
    .line 71
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/gp/a;->k:Ll/vxd0;

    .line 72
    .line 73
    invoke-virtual {v3}, Ll/vxd0;->clear()Z

    .line 74
    .line 75
    .line 76
    :cond_1
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/gp/a;->m:Ll/vxd0;

    .line 77
    .line 78
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result v3

    .line 82
    if-eqz v3, :cond_2

    .line 83
    .line 84
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/gp/a;->m:Ll/vxd0;

    .line 85
    .line 86
    invoke-virtual {v3}, Ll/vxd0;->clear()Z

    .line 87
    .line 88
    .line 89
    :cond_2
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/gp/a;->k:Ll/vxd0;

    .line 90
    .line 91
    if-eqz v3, :cond_4

    .line 92
    .line 93
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/gp/a;->l:Ll/vxd0;

    .line 94
    .line 95
    if-eqz v3, :cond_4

    .line 96
    .line 97
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/gp/a;->m:Ll/vxd0;

    .line 98
    .line 99
    if-eqz v3, :cond_4

    .line 100
    .line 101
    if-nez v1, :cond_3

    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_3
    return-void

    .line 105
    :cond_4
    :goto_0
    new-instance v1, Ll/vxd0;

    .line 106
    .line 107
    new-instance v3, Ljava/lang/StringBuilder;

    .line 108
    .line 109
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 110
    .line 111
    .line 112
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    const-string v4, "_"

    .line 116
    .line 117
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 121
    .line 122
    .line 123
    move-result-object v5

    .line 124
    invoke-interface {v5}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v5

    .line 128
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    const-string v5, "_receive"

    .line 132
    .line 133
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v3

    .line 140
    const/4 v5, 0x0

    .line 141
    const-string v6, "MessageCountToday"

    .line 142
    .line 143
    invoke-direct {v1, v3, v5, v2, v6}, Ll/vxd0;-><init>(Ljava/lang/String;IZLjava/lang/String;)V

    .line 144
    .line 145
    .line 146
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/gp/a;->k:Ll/vxd0;

    .line 147
    .line 148
    new-instance v1, Ll/vxd0;

    .line 149
    .line 150
    new-instance v3, Ljava/lang/StringBuilder;

    .line 151
    .line 152
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 153
    .line 154
    .line 155
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 162
    .line 163
    .line 164
    move-result-object v7

    .line 165
    invoke-interface {v7}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object v7

    .line 169
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    const-string v7, "_send"

    .line 173
    .line 174
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 175
    .line 176
    .line 177
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object v3

    .line 181
    invoke-direct {v1, v3, v5, v2, v6}, Ll/vxd0;-><init>(Ljava/lang/String;IZLjava/lang/String;)V

    .line 182
    .line 183
    .line 184
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/gp/a;->l:Ll/vxd0;

    .line 185
    .line 186
    new-instance v1, Ll/vxd0;

    .line 187
    .line 188
    new-instance v3, Ljava/lang/StringBuilder;

    .line 189
    .line 190
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 191
    .line 192
    .line 193
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 194
    .line 195
    .line 196
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 197
    .line 198
    .line 199
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 208
    .line 209
    .line 210
    const-string v0, "_match"

    .line 211
    .line 212
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 213
    .line 214
    .line 215
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object v0

    .line 219
    invoke-direct {v1, v0, v5, v2, v6}, Ll/vxd0;-><init>(Ljava/lang/String;IZLjava/lang/String;)V

    .line 220
    .line 221
    .line 222
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/gp/a;->m:Ll/vxd0;

    .line 223
    .line 224
    return-void
.end method

.method public declared-synchronized o(Lcom/p1/mobile/android/app/Act;)V
    .locals 5

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/gp/a;->n()V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gp/a;->j:Ll/byd0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Long;

    .line 12
    .line 13
    invoke-static {}, Ll/spl0;->F()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    const/4 v2, 0x1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Ll/pk50;->f()Ll/rj50;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    sget-object v1, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_intl_5star_dialog_view:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 29
    .line 30
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v0, v1, v2}, Ll/rj50;->M(Ljava/lang/String;Z)Z

    .line 35
    .line 36
    .line 37
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 38
    if-nez v0, :cond_1

    .line 39
    .line 40
    monitor-exit p0

    .line 41
    return-void

    .line 42
    :catchall_0
    move-exception p1

    .line 43
    goto :goto_0

    .line 44
    :cond_0
    :try_start_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 45
    .line 46
    .line 47
    move-result-wide v3

    .line 48
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 49
    .line 50
    .line 51
    move-result-wide v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 52
    sub-long/2addr v3, v0

    .line 53
    const-wide/32 v0, 0xf731400

    .line 54
    .line 55
    .line 56
    cmp-long v0, v3, v0

    .line 57
    .line 58
    if-gez v0, :cond_1

    .line 59
    .line 60
    monitor-exit p0

    .line 61
    return-void

    .line 62
    :cond_1
    :try_start_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gp/a;->k:Ll/vxd0;

    .line 63
    .line 64
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    check-cast v0, Ljava/lang/Integer;

    .line 69
    .line 70
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    const/4 v1, 0x5

    .line 75
    if-lt v0, v1, :cond_2

    .line 76
    .line 77
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gp/a;->l:Ll/vxd0;

    .line 78
    .line 79
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    check-cast v0, Ljava/lang/Integer;

    .line 84
    .line 85
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    if-ge v0, v1, :cond_3

    .line 90
    .line 91
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gp/a;->m:Ll/vxd0;

    .line 92
    .line 93
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    check-cast v0, Ljava/lang/Integer;

    .line 98
    .line 99
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-lt v0, v1, :cond_5

    .line 104
    .line 105
    :cond_3
    invoke-static {}, Ll/spl0;->F()Z

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    if-eqz v0, :cond_4

    .line 110
    .line 111
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-virtual {v0}, Ll/pk50;->f()Ll/rj50;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    sget-object v1, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_intl_5star_dialog_view:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 120
    .line 121
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    const/4 v3, 0x0

    .line 126
    invoke-virtual {v0, v1, v3, v2}, Ll/rj50;->b0(Ljava/lang/String;IZ)Z

    .line 127
    .line 128
    .line 129
    :cond_4
    new-instance v0, Ll/clc0;

    .line 130
    .line 131
    invoke-direct {v0, p0}, Ll/clc0;-><init>(Lcom/p1/mobile/putong/core/ui/gp/a;)V

    .line 132
    .line 133
    .line 134
    new-instance v1, Ll/dlc0;

    .line 135
    .line 136
    invoke-direct {v1, p0}, Ll/dlc0;-><init>(Lcom/p1/mobile/putong/core/ui/gp/a;)V

    .line 137
    .line 138
    .line 139
    invoke-static {p1, v0, v1}, Lcom/p1/mobile/putong/core/ui/gp/a;->q(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;Ljava/lang/Runnable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 140
    .line 141
    .line 142
    :cond_5
    monitor-exit p0

    .line 143
    return-void

    .line 144
    :goto_0
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 145
    throw p1
.end method

.method public p()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gp/a;->o:Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/gcg0;->unsubscribe()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/icg0;->a()Ll/gcg0;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/gp/a;->o:Ll/gcg0;

    .line 11
    .line 12
    return-void
.end method

.method public final declared-synchronized r(I)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/gp/a;->n()V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gp/a;->m:Ll/vxd0;

    .line 6
    .line 7
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {v0, p1}, Ll/vxd0;->put(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    .line 13
    .line 14
    monitor-exit p0

    .line 15
    return-void

    .line 16
    :catchall_0
    move-exception p1

    .line 17
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 18
    throw p1
.end method

.method public declared-synchronized s(I)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/gp/a;->n()V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gp/a;->k:Ll/vxd0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Integer;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/gp/a;->k:Ll/vxd0;

    .line 18
    .line 19
    add-int/2addr v0, p1

    .line 20
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {v1, p1}, Ll/vxd0;->put(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    .line 26
    .line 27
    monitor-exit p0

    .line 28
    return-void

    .line 29
    :catchall_0
    move-exception p1

    .line 30
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 31
    throw p1
.end method

.method public declared-synchronized t(I)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/gp/a;->n()V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gp/a;->l:Ll/vxd0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Integer;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/gp/a;->l:Ll/vxd0;

    .line 18
    .line 19
    add-int/2addr v0, p1

    .line 20
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {v1, p1}, Ll/vxd0;->put(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    .line 26
    .line 27
    monitor-exit p0

    .line 28
    return-void

    .line 29
    :catchall_0
    move-exception p1

    .line 30
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 31
    throw p1
.end method
