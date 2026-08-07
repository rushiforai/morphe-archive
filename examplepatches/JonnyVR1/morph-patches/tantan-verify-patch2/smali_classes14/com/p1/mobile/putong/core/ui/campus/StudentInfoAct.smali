.class public Lcom/p1/mobile/putong/core/ui/campus/StudentInfoAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"

# interfaces
.implements Ll/crl;


# instance fields
.field public c:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;

.field public d:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static X1(Landroid/content/Context;Ljava/lang/String;Z)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/core/ui/campus/StudentInfoAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "from_channel"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    if-eqz p2, :cond_0

    .line 14
    .line 15
    const/high16 p0, 0x10000000

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    const/high16 p0, 0x80000

    .line 21
    .line 22
    invoke-virtual {v0, p0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 23
    .line 24
    .line 25
    :cond_0
    return-object v0
.end method


# virtual methods
.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/campus/StudentInfoAct;->d:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public initDataOnCreate()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initDataOnCreate()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;-><init>(Lcom/p1/mobile/putong/core/ui/campus/StudentInfoAct;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/StudentInfoAct;->c:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;

    .line 10
    .line 11
    new-instance v0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;-><init>(Lcom/p1/mobile/putong/core/ui/campus/StudentInfoAct;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/StudentInfoAct;->d:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/campus/StudentInfoAct;->c:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/ar2;->C(Ll/iam;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public initSubscription()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/campus/StudentInfoAct;->c:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->a0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public isAnonymousMode()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public needRefreshUser()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    if-ne p2, v0, :cond_1

    .line 3
    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/campus/StudentInfoAct;->c:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;

    .line 7
    .line 8
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->p0(Landroid/content/Intent;)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/putong/app/PutongAct;->onActivityResult(IILandroid/content/Intent;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_1
    const/4 v0, 0x1

    .line 17
    if-ne p2, v0, :cond_2

    .line 18
    .line 19
    if-ne p1, v0, :cond_2

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/StudentInfoAct;->c:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->o0()V

    .line 24
    .line 25
    .line 26
    :cond_2
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/putong/app/PutongAct;->onActivityResult(IILandroid/content/Intent;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public onBackPressed()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/StudentInfoAct;->c:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->q0()V

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onPickImagesResult(Ljava/util/List;)V
    .locals 1
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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/StudentInfoAct;->c:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->R0()V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/campus/StudentInfoAct;->c:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->P0(Ljava/util/List;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public onTakePictureResult(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/StudentInfoAct;->c:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->R0()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/campus/StudentInfoAct;->c:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->S0(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_student_verification_view"

    .line 2
    .line 3
    return-object p0
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->preCreateView(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/campus/StudentInfoAct;->c:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const-string v0, "from_channel"

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->Q0(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
