.class public Ll/ffk;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/pfk;",
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
    new-instance p1, Lcom/p1/mobile/putong/core/data/GroupCreate;

    .line 5
    .line 6
    invoke-direct {p1}, Lcom/p1/mobile/putong/core/data/GroupCreate;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/ffk;->a:Lcom/p1/mobile/putong/core/data/GroupCreate;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic e0(Ll/ffk;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ffk;->k0()V

    return-void
.end method

.method public static synthetic f0(Ll/ffk;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ffk;->j0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic g0(Ll/ffk;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ffk;->l0()V

    return-void
.end method

.method private synthetic j0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/pfk;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/pfk;->r()V

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
    iput-object v0, p0, Ll/ffk;->a:Lcom/p1/mobile/putong/core/data/GroupCreate;

    .line 21
    .line 22
    return-void
.end method

.method public a0()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/cfk;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/cfk;-><init>(Ll/ffk;)V

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

.method public h0(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {p1, v0}, Ll/r97;->T2(Lcom/p1/mobile/android/app/Act;)V

    .line 14
    .line 15
    .line 16
    invoke-direct {p0}, Ll/ffk;->pageId()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const/4 p1, 0x0

    .line 21
    new-array p1, p1, [Ll/sfj0$a;

    .line 22
    .line 23
    const-string v0, "e_add_group_photo"

    .line 24
    .line 25
    invoke-static {v0, p0, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public i0()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ffk;->b:Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/ffk;->a:Lcom/p1/mobile/putong/core/data/GroupCreate;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/GroupCreate;->name:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public final synthetic k0()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iget-object v2, p0, Ll/ffk;->a:Lcom/p1/mobile/putong/core/data/GroupCreate;

    .line 17
    .line 18
    iget-object p0, p0, Ll/ffk;->b:Lcom/p1/mobile/putong/data/Picture;

    .line 19
    .line 20
    invoke-static {v1, v2, p0}, Lcom/p1/mobile/putong/core/newui/group/GroupCreateDescriptionAct;->a2(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/GroupCreate;Lcom/p1/mobile/putong/data/Picture;)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const/16 v1, 0x101

    .line 25
    .line 26
    invoke-virtual {v0, p0, v1}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final synthetic l0()V
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

.method public m0(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/ffk;->pageId()Ljava/lang/String;

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
    const-string v0, "e_add_group_name"

    .line 9
    .line 10
    invoke-static {v0, p0, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public n0(Landroid/view/View;)V
    .locals 8

    .line 1
    invoke-direct {p0}, Ll/ffk;->pageId()Ljava/lang/String;

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
    const-string v1, "e_group_next_step_button"

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
    move-result-object v1

    .line 26
    iget-object p1, p0, Ll/ffk;->a:Lcom/p1/mobile/putong/core/data/GroupCreate;

    .line 27
    .line 28
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/GroupCreate;->name:Ljava/lang/String;

    .line 29
    .line 30
    const-string p1, "group_profile"

    .line 31
    .line 32
    invoke-static {p1}, Lcom/p1/mobile/putong/data/DetectCategoryType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/DetectCategoryType;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    invoke-direct {p0}, Ll/ffk;->pageId()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v5

    .line 40
    new-instance v6, Ll/dfk;

    .line 41
    .line 42
    invoke-direct {v6, p0}, Ll/dfk;-><init>(Ll/ffk;)V

    .line 43
    .line 44
    .line 45
    new-instance v7, Ll/efk;

    .line 46
    .line 47
    invoke-direct {v7, p0}, Ll/efk;-><init>(Ll/ffk;)V

    .line 48
    .line 49
    .line 50
    const-string v4, "group_name"

    .line 51
    .line 52
    invoke-static/range {v1 .. v7}, Lcom/p1/mobile/putong/util/AntiSpamHelper;->c(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/DetectCategoryType;Ljava/lang/String;Ljava/lang/String;Ll/x20;Ll/x20;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public o0(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-lez v0, :cond_0

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    instance-of v1, v1, Lcom/p1/mobile/putong/data/Picture;

    .line 19
    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    .line 27
    .line 28
    iput-object p1, p0, Ll/ffk;->b:Lcom/p1/mobile/putong/data/Picture;

    .line 29
    .line 30
    :cond_0
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 31
    .line 32
    check-cast p1, Ll/pfk;

    .line 33
    .line 34
    iget-object p0, p0, Ll/ffk;->b:Lcom/p1/mobile/putong/data/Picture;

    .line 35
    .line 36
    invoke-virtual {p1, p0}, Ll/pfk;->F(Lcom/p1/mobile/putong/data/Picture;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public p0(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ffk;->a:Lcom/p1/mobile/putong/core/data/GroupCreate;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/GroupCreate;->name:Ljava/lang/String;

    .line 8
    .line 9
    return-void
.end method
