.class public Ll/qhk;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/thk;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:Z


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e0(Ll/qhk;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qhk;->k0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic f0(Ll/qhk;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/qhk;->p0()V

    return-void
.end method

.method public static synthetic g0(Ll/qhk;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qhk;->o0(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic h0(Ll/qhk;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qhk;->m0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic i0(Ll/qhk;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qhk;->n0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic j0(Ll/qhk;Lcom/p1/mobile/putong/core/data/ChatGroup;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qhk;->l0(Lcom/p1/mobile/putong/core/data/ChatGroup;)V

    return-void
.end method

.method private synthetic k0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/thk;

    .line 4
    .line 5
    iget-object p0, p0, Ll/qhk;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Ll/thk;->A3(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private synthetic l0(Lcom/p1/mobile/putong/core/data/ChatGroup;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/thk;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/thk;->w(Lcom/p1/mobile/putong/core/data/ChatGroup;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic m0(Ll/uxj0;)V
    .locals 0

    .line 1
    const-string p1, "\u5df2\u63d0\u4ea4\uff0c\u5f85\u5ba1\u6838\u901a\u8fc7\u540e\u751f\u6548\u3002"

    .line 2
    .line 3
    invoke-static {p1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method private synthetic n0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-interface {p0, p1}, Ll/r97;->d(Ljava/lang/Throwable;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private synthetic o0(Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 4
    .line 5
    iget-object v1, p0, Ll/qhk;->a:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1, p1}, Lcom/p1/mobile/putong/core/api/e;->M8(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

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
    new-instance v0, Ll/ohk;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Ll/ohk;-><init>(Ll/qhk;)V

    .line 18
    .line 19
    .line 20
    new-instance v1, Ll/phk;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/phk;-><init>(Ll/qhk;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

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

.method private synthetic p0()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public Z()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/ar2;->Z()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    const-string v1, "group_Id"

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iput-object v1, p0, Ll/qhk;->a:Ljava/lang/String;

    .line 25
    .line 26
    const-string v1, "group_name"

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    iput-object v1, p0, Ll/qhk;->b:Ljava/lang/String;

    .line 33
    .line 34
    const-string v1, "anonymous"

    .line 35
    .line 36
    const/4 v2, 0x0

    .line 37
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    iput-boolean v0, p0, Ll/qhk;->c:Z

    .line 42
    .line 43
    :cond_0
    return-void
.end method

.method public a0()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/khk;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/khk;-><init>(Ll/qhk;)V

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
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 15
    .line 16
    iget-object v1, p0, Ll/qhk;->a:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/e;->o6(Ljava/lang/String;)Lrx/c;

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
    new-instance v1, Ll/ui7;

    .line 27
    .line 28
    invoke-direct {v1}, Ll/ui7;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const/4 v1, 0x1

    .line 36
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v1, Ll/lhk;

    .line 41
    .line 42
    invoke-direct {v1, p0}, Ll/lhk;-><init>(Ll/qhk;)V

    .line 43
    .line 44
    .line 45
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_alter_group_name"

    .line 2
    .line 3
    return-object p0
.end method

.method public q0(Ljava/lang/String;)V
    .locals 9

    .line 1
    invoke-virtual {p0}, Ll/qhk;->pageId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "groupchat_id"

    .line 6
    .line 7
    iget-object v2, p0, Ll/qhk;->a:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v1, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const-string v2, "is_anonymou_group"

    .line 14
    .line 15
    iget-boolean v3, p0, Ll/qhk;->c:Z

    .line 16
    .line 17
    invoke-static {v2, v3}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    filled-new-array {v1, v2}, [Ll/sfj0$a;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const-string v2, "e_group_name_finish_button"

    .line 26
    .line 27
    invoke-static {v2, v0, v1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const-string v1, ""

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(Ljava/lang/String;)Landroid/app/Dialog;

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    const-string v0, "group_profile"

    .line 44
    .line 45
    invoke-static {v0}, Lcom/p1/mobile/putong/data/DetectCategoryType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/DetectCategoryType;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    invoke-virtual {p0}, Ll/qhk;->pageId()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v6

    .line 53
    new-instance v7, Ll/mhk;

    .line 54
    .line 55
    invoke-direct {v7, p0, p1}, Ll/mhk;-><init>(Ll/qhk;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    new-instance v8, Ll/nhk;

    .line 59
    .line 60
    invoke-direct {v8, p0}, Ll/nhk;-><init>(Ll/qhk;)V

    .line 61
    .line 62
    .line 63
    const-string v5, "group_name"

    .line 64
    .line 65
    move-object v3, p1

    .line 66
    invoke-static/range {v2 .. v8}, Lcom/p1/mobile/putong/util/AntiSpamHelper;->c(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/DetectCategoryType;Ljava/lang/String;Ljava/lang/String;Ll/x20;Ll/x20;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method
