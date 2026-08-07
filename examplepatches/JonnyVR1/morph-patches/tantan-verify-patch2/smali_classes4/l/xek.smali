.class public Ll/xek;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/bfk;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/data/GroupCreate;

.field public b:Lcom/p1/mobile/putong/data/Picture;


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

.method public static synthetic e0(Ljava/util/List;Lcom/p1/mobile/putong/data/Media;)V
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic f0(Ll/xek;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xek;->r0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic g0(Ll/xek;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/xek;->n0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic h0(Ll/xek;Ll/uxj0;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xek;->o0(Ll/uxj0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic i0(Ll/xek;Ljava/util/List;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xek;->p0(Ljava/util/List;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic j0(Ljava/util/List;)Ljava/util/List;
    .locals 2

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 5
    .line 6
    .line 7
    new-instance v1, Ll/wek;

    .line 8
    .line 9
    invoke-direct {v1, v0}, Ll/wek;-><init>(Ljava/util/List;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 13
    .line 14
    .line 15
    return-object v0
.end method

.method public static synthetic k0(Ll/xek;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xek;->q0(Ll/uxj0;)V

    return-void
.end method

.method private synthetic n0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/bfk;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/bfk;->r()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private pageId()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->pageId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method


# virtual methods
.method public Z()V
    .locals 2

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
    const-string v1, "group_create"

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lcom/p1/mobile/putong/core/data/GroupCreate;

    .line 19
    .line 20
    iput-object v0, p0, Ll/xek;->a:Lcom/p1/mobile/putong/core/data/GroupCreate;

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const-string v1, "picture"

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Lcom/p1/mobile/putong/data/Picture;

    .line 37
    .line 38
    iput-object v0, p0, Ll/xek;->b:Lcom/p1/mobile/putong/data/Picture;

    .line 39
    .line 40
    return-void
.end method

.method public a0()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/qek;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/qek;-><init>(Ll/xek;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public l0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xek;->a:Lcom/p1/mobile/putong/core/data/GroupCreate;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/GroupCreate;->description:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    xor-int/lit8 p0, p0, 0x1

    .line 10
    .line 11
    return p0
.end method

.method public m0(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/xek;->pageId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 p1, 0x0

    .line 6
    new-array p1, p1, [Ll/sfj0$a;

    .line 7
    .line 8
    const-string v0, "e_add_group_state"

    .line 9
    .line 10
    invoke-static {v0, p0, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic o0(Ll/uxj0;)Lrx/c;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/xek;->b:Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    new-array p1, p1, [Lcom/p1/mobile/putong/data/Media;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    aput-object p0, p1, v0

    .line 8
    .line 9
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string p1, "group-create"

    .line 14
    .line 15
    invoke-static {p0, p1}, Ll/yb5;->I(Ljava/util/List;Ljava/lang/String;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    new-instance p1, Ll/vek;

    .line 20
    .line 21
    invoke-direct {p1}, Ll/vek;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method

.method public final synthetic p0(Ljava/util/List;)Lrx/c;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 4
    .line 5
    iget-object p0, p0, Ll/xek;->a:Lcom/p1/mobile/putong/core/data/GroupCreate;

    .line 6
    .line 7
    invoke-virtual {v0, p0, p1}, Lcom/p1/mobile/putong/core/api/e;->P6(Lcom/p1/mobile/putong/core/data/GroupCreate;Ljava/util/List;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final synthetic q0(Ll/uxj0;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    sget p1, Lcom/p1/mobile/putong/core/message/R$string;->E0:I

    .line 9
    .line 10
    invoke-static {p1}, Ll/o1j0;->w(I)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    const/4 v0, -0x1

    .line 18
    invoke-virtual {p1, v0}, Landroid/app/Activity;->setResult(I)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final synthetic r0(Ljava/lang/Throwable;)V
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
    instance-of p0, p1, Lcom/p1/mobile/putong/util/AntiSpamHelper$AntispamException;

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-interface {p0, p1}, Ll/r97;->d(Ljava/lang/Throwable;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public s0(Landroid/view/View;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ll/xek;->pageId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const/4 v0, 0x0

    .line 6
    new-array v0, v0, [Ll/sfj0$a;

    .line 7
    .line 8
    const-string v1, "e_group_complete_button"

    .line 9
    .line 10
    invoke-static {v1, p1, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    const-string v0, ""

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->progress(Ljava/lang/String;)Landroid/app/Dialog;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iget-object v0, p0, Ll/xek;->a:Lcom/p1/mobile/putong/core/data/GroupCreate;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/GroupCreate;->description:Ljava/lang/String;

    .line 29
    .line 30
    const-string v1, "group_profile"

    .line 31
    .line 32
    invoke-static {v1}, Lcom/p1/mobile/putong/data/DetectCategoryType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/DetectCategoryType;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    const-string v2, "group_description"

    .line 37
    .line 38
    invoke-direct {p0}, Ll/xek;->pageId()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    invoke-static {p1, v0, v1, v2, v3}, Lcom/p1/mobile/putong/util/AntiSpamHelper;->b(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/DetectCategoryType;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    new-instance v0, Ll/rek;

    .line 47
    .line 48
    invoke-direct {v0, p0}, Ll/rek;-><init>(Ll/xek;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p1, v0}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    new-instance v0, Ll/sek;

    .line 56
    .line 57
    invoke-direct {v0, p0}, Ll/sek;-><init>(Ll/xek;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p1, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    new-instance v0, Ll/tek;

    .line 69
    .line 70
    invoke-direct {v0, p0}, Ll/tek;-><init>(Ll/xek;)V

    .line 71
    .line 72
    .line 73
    new-instance v1, Ll/uek;

    .line 74
    .line 75
    invoke-direct {v1, p0}, Ll/uek;-><init>(Ll/xek;)V

    .line 76
    .line 77
    .line 78
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public t0(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xek;->a:Lcom/p1/mobile/putong/core/data/GroupCreate;

    .line 2
    .line 3
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/GroupCreate;->description:Ljava/lang/String;

    .line 4
    .line 5
    return-void
.end method
