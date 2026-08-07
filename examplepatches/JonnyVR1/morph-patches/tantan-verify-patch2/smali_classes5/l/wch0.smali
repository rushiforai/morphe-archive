.class public Ll/wch0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/zch0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ll/l4g0;

.field public c:Z

.field public d:Z


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Ll/wch0;->b:Ll/l4g0;

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput-boolean p1, p0, Ll/wch0;->c:Z

    .line 9
    .line 10
    iput-boolean p1, p0, Ll/wch0;->d:Z

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic e0(Ll/wch0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/wch0;->r0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic f0(Ll/wch0;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wch0;->t0(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic g0(Ll/wch0;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/wch0;->p0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic h0(Ll/wch0;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/wch0;->q0(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic i0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/api/api/Network;->isConnected(Landroid/content/Context;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const-string p0, "\u5bf9\u4e0d\u8d77\uff0c\u51fa\u9519\u4e86"

    .line 10
    .line 11
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static synthetic j0(Ll/wch0;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/wch0;->s0(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic k0(Ll/wch0;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wch0;->u0(Ljava/util/List;)V

    return-void
.end method

.method public static bridge synthetic l0(Ll/wch0;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/wch0;->d:Z

    return p0
.end method

.method private synthetic p0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/zch0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/zch0;->r()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic q0(Ljava/util/List;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/zch0;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/zch0;->v(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, 0x1

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    check-cast v2, Lcom/p1/mobile/putong/core/data/Surveys;

    .line 21
    .line 22
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Surveys;->questions:Ljava/util/List;

    .line 23
    .line 24
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    if-eqz v2, :cond_1

    .line 29
    .line 30
    :cond_0
    move v0, v1

    .line 31
    :cond_1
    iput-boolean v0, p0, Ll/wch0;->d:Z

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/wch0;->o0()V

    .line 34
    .line 35
    .line 36
    iget-boolean v0, p0, Ll/wch0;->d:Z

    .line 37
    .line 38
    if-eqz v0, :cond_2

    .line 39
    .line 40
    invoke-virtual {p0, v1}, Ll/wch0;->y0(Z)V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_2
    invoke-virtual {p0, p1, v1}, Ll/wch0;->z0(Ljava/util/List;Z)V

    .line 45
    .line 46
    .line 47
    :goto_0
    iget-object p1, p0, Ll/wch0;->b:Ll/l4g0;

    .line 48
    .line 49
    invoke-virtual {p1}, Ll/l4g0;->i()V

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Ll/wch0;->b:Ll/l4g0;

    .line 53
    .line 54
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method private synthetic r0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/api/api/Network;->isConnected(Landroid/content/Context;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const-string p1, "\u5bf9\u4e0d\u8d77\uff0c\u51fa\u9519\u4e86"

    .line 10
    .line 11
    invoke-static {p1}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private synthetic s0(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wch0;->b:Ll/l4g0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget-boolean v0, p0, Ll/wch0;->c:Z

    .line 10
    .line 11
    if-eqz v0, :cond_2

    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 14
    .line 15
    if-ne p1, v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Ll/wch0;->b:Ll/l4g0;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 24
    .line 25
    if-ne p1, v0, :cond_1

    .line 26
    .line 27
    iget-object p0, p0, Ll/wch0;->b:Ll/l4g0;

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/l4g0;->k()V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    sget-object v0, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 34
    .line 35
    if-ne p1, v0, :cond_2

    .line 36
    .line 37
    iget-object p0, p0, Ll/wch0;->b:Ll/l4g0;

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/l4g0;->j()V

    .line 40
    .line 41
    .line 42
    :cond_2
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/pch0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/pch0;-><init>(Ll/wch0;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->y0:Ll/q7b;

    .line 15
    .line 16
    iget-object v1, p0, Ll/wch0;->a:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ll/q7b;->g3(Ljava/lang/String;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/qch0;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/qch0;-><init>(Ll/wch0;)V

    .line 29
    .line 30
    .line 31
    new-instance v2, Ll/rch0;

    .line 32
    .line 33
    invoke-direct {v2, p0}, Ll/rch0;-><init>(Ll/wch0;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    new-instance v1, Ll/sch0;

    .line 48
    .line 49
    invoke-direct {v1, p0}, Ll/sch0;-><init>(Ll/wch0;)V

    .line 50
    .line 51
    .line 52
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public m0()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wch0;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public n0(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wch0;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public o0()V
    .locals 2

    .line 1
    new-instance v0, Ll/l4g0;

    .line 2
    .line 3
    new-instance v1, Ll/wch0$a;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/wch0$a;-><init>(Ll/wch0;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Ll/l4g0;-><init>(Ll/e6m;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/wch0;->b:Ll/l4g0;

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    iput-boolean v0, p0, Ll/wch0;->c:Z

    .line 15
    .line 16
    return-void
.end method

.method public final synthetic t0(Ljava/util/List;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/zch0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/zch0;->v(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic u0(Ljava/util/List;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/zch0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/zch0;->u()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Ll/vch0;

    .line 13
    .line 14
    invoke-direct {v1, p0, p1}, Ll/vch0;-><init>(Ll/wch0;Ljava/util/List;)V

    .line 15
    .line 16
    .line 17
    iget-object v2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 18
    .line 19
    check-cast v2, Ll/zch0;

    .line 20
    .line 21
    invoke-virtual {v2}, Ll/zch0;->f()I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    int-to-long v2, v2

    .line 26
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 27
    .line 28
    .line 29
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    const/4 v1, 0x0

    .line 34
    if-nez v0, :cond_1

    .line 35
    .line 36
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lcom/p1/mobile/putong/core/data/Surveys;

    .line 41
    .line 42
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Surveys;->questions:Ljava/util/List;

    .line 43
    .line 44
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_0

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    move v0, v1

    .line 52
    goto :goto_1

    .line 53
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 54
    :goto_1
    iput-boolean v0, p0, Ll/wch0;->d:Z

    .line 55
    .line 56
    if-eqz v0, :cond_2

    .line 57
    .line 58
    iget-object p1, p0, Ll/wch0;->b:Ll/l4g0;

    .line 59
    .line 60
    invoke-virtual {p1}, Ll/l4g0;->k()V

    .line 61
    .line 62
    .line 63
    iget-object p1, p0, Ll/wch0;->b:Ll/l4g0;

    .line 64
    .line 65
    invoke-virtual {p1}, Ll/l4g0;->j()V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0}, Ll/wch0;->o0()V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0, v1}, Ll/wch0;->y0(Z)V

    .line 72
    .line 73
    .line 74
    iget-object p1, p0, Ll/wch0;->b:Ll/l4g0;

    .line 75
    .line 76
    invoke-virtual {p1}, Ll/l4g0;->i()V

    .line 77
    .line 78
    .line 79
    iget-object p0, p0, Ll/wch0;->b:Ll/l4g0;

    .line 80
    .line 81
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :cond_2
    invoke-virtual {p0, p1, v1}, Ll/wch0;->z0(Ljava/util/List;Z)V

    .line 86
    .line 87
    .line 88
    iget-object p1, p0, Ll/wch0;->b:Ll/l4g0;

    .line 89
    .line 90
    invoke-virtual {p1}, Ll/l4g0;->k()V

    .line 91
    .line 92
    .line 93
    iget-object p0, p0, Ll/wch0;->b:Ll/l4g0;

    .line 94
    .line 95
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 96
    .line 97
    .line 98
    return-void
.end method

.method public x0(Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->y0:Ll/q7b;

    .line 4
    .line 5
    iget-object v1, p0, Ll/wch0;->a:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, p1, v1}, Ll/q7b;->h3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    new-instance v0, Ll/tch0;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Ll/tch0;-><init>(Ll/wch0;)V

    .line 18
    .line 19
    .line 20
    new-instance p0, Ll/uch0;

    .line 21
    .line 22
    invoke-direct {p0}, Ll/uch0;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public y0(Z)V
    .locals 3

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v1, "tooltips_trigger_mode"

    .line 7
    .line 8
    const-string v2, "active"

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 11
    .line 12
    .line 13
    const-string v1, "tooltips_type"

    .line 14
    .line 15
    const-string v2, "alert"

    .line 16
    .line 17
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 18
    .line 19
    .line 20
    const-string v1, "tooltips_type_ui"

    .line 21
    .line 22
    const-string v2, "alert_self_definition_basic"

    .line 23
    .line 24
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 25
    .line 26
    .line 27
    const-string v1, "tooltips_trigger_reason"

    .line 28
    .line 29
    const-string v2, "click"

    .line 30
    .line 31
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 32
    .line 33
    .line 34
    const-string v1, "tooltips_trigger_module"

    .line 35
    .line 36
    if-eqz p1, :cond_0

    .line 37
    .line 38
    const-string v2, "assistant_message_link"

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    const-string v2, "feedback_question_submit_button"

    .line 42
    .line 43
    :goto_0
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 44
    .line 45
    .line 46
    const-string v1, "tooltips_trigger_page"

    .line 47
    .line 48
    if-eqz p1, :cond_1

    .line 49
    .line 50
    const-string p1, "assistant_page"

    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_1
    const-string p1, "feedback_question_page"

    .line 54
    .line 55
    :goto_1
    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 56
    .line 57
    .line 58
    iget-object p0, p0, Ll/wch0;->b:Ll/l4g0;

    .line 59
    .line 60
    invoke-virtual {p0, v0}, Ll/l4g0;->o(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :catch_0
    move-exception p0

    .line 65
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public z0(Ljava/util/List;Z)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Surveys;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    check-cast v1, Lcom/p1/mobile/putong/core/data/Surveys;

    .line 7
    .line 8
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Surveys;->questions:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    check-cast v1, Lcom/p1/mobile/putong/core/data/Questions;

    .line 15
    .line 16
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Questions;->type:Ljava/lang/String;

    .line 17
    .line 18
    const-string v2, "selection"

    .line 19
    .line 20
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-eqz v2, :cond_0

    .line 25
    .line 26
    const-string v1, "single_choice"

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    const-string v2, "multi_selection"

    .line 30
    .line 31
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-eqz v2, :cond_1

    .line 36
    .line 37
    const-string v1, "multiple_choice"

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    const-string v2, "fill_blank"

    .line 41
    .line 42
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-eqz v1, :cond_2

    .line 47
    .line 48
    const-string v1, "question_answer"

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_2
    const-string v1, ""

    .line 52
    .line 53
    :goto_0
    new-instance v2, Lorg/json/JSONObject;

    .line 54
    .line 55
    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 56
    .line 57
    .line 58
    :try_start_0
    const-string v3, "feedback_question_type"

    .line 59
    .line 60
    invoke-virtual {v2, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 61
    .line 62
    .line 63
    const-string v1, "tooltips_trigger_mode"

    .line 64
    .line 65
    const-string v3, "active"

    .line 66
    .line 67
    invoke-virtual {v2, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 68
    .line 69
    .line 70
    const-string v1, "tooltips_type"

    .line 71
    .line 72
    const-string v3, "alert"

    .line 73
    .line 74
    invoke-virtual {v2, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 75
    .line 76
    .line 77
    const-string v1, "tooltips_type_ui"

    .line 78
    .line 79
    const-string v3, "alert_special"

    .line 80
    .line 81
    invoke-virtual {v2, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 82
    .line 83
    .line 84
    const-string v1, "tooltips_trigger_reason"

    .line 85
    .line 86
    const-string v3, "click"

    .line 87
    .line 88
    invoke-virtual {v2, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 89
    .line 90
    .line 91
    const-string v1, "tooltips_trigger_module"

    .line 92
    .line 93
    if-eqz p2, :cond_3

    .line 94
    .line 95
    const-string v3, "assistant_message_link"

    .line 96
    .line 97
    goto :goto_1

    .line 98
    :cond_3
    const-string v3, "feedback_question_submit_button"

    .line 99
    .line 100
    :goto_1
    invoke-virtual {v2, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 101
    .line 102
    .line 103
    const-string v1, "tooltips_trigger_page"

    .line 104
    .line 105
    if-eqz p2, :cond_4

    .line 106
    .line 107
    const-string p2, "assistant_page"

    .line 108
    .line 109
    goto :goto_2

    .line 110
    :cond_4
    const-string p2, "feedback_question_page"

    .line 111
    .line 112
    :goto_2
    invoke-virtual {v2, v1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 113
    .line 114
    .line 115
    const-string p2, "feedback_question_num"

    .line 116
    .line 117
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    check-cast p1, Lcom/p1/mobile/putong/core/data/Surveys;

    .line 122
    .line 123
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Surveys;->questions:Ljava/util/List;

    .line 124
    .line 125
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    check-cast p1, Lcom/p1/mobile/putong/core/data/Questions;

    .line 130
    .line 131
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Questions;->index:Ljava/lang/String;

    .line 132
    .line 133
    invoke-virtual {v2, p2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 134
    .line 135
    .line 136
    iget-object p0, p0, Ll/wch0;->b:Ll/l4g0;

    .line 137
    .line 138
    invoke-virtual {p0, v2}, Ll/l4g0;->o(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 139
    .line 140
    .line 141
    return-void

    .line 142
    :catch_0
    move-exception p0

    .line 143
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 144
    .line 145
    .line 146
    return-void
.end method
