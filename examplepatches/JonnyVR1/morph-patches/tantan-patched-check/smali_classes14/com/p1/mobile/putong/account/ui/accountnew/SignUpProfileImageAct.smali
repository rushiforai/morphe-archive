.class public Lcom/p1/mobile/putong/account/ui/accountnew/SignUpProfileImageAct;
.super Lcom/p1/mobile/putong/account/AccountBaseAct;
.source "SourceFile"


# instance fields
.field public c:Ll/pmf0;

.field public d:Ll/kmf0;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/AccountBaseAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static X1(Landroid/content/Context;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpProfileImageAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public static Y1(Landroid/content/Context;Lcom/p1/mobile/putong/data/SignUpData;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpProfileImageAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "signup_data"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    return-object v0
.end method


# virtual methods
.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpProfileImageAct;->c:Ll/pmf0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/pmf0;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

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
    invoke-super {p0}, Lcom/p1/mobile/putong/account/AccountBaseAct;->initDataOnCreate()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/pmf0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/pmf0;-><init>(Lcom/p1/mobile/putong/account/ui/accountnew/SignUpProfileImageAct;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpProfileImageAct;->c:Ll/pmf0;

    .line 10
    .line 11
    new-instance v0, Ll/kmf0;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/kmf0;-><init>(Ll/ner;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpProfileImageAct;->d:Ll/kmf0;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpProfileImageAct;->c:Ll/pmf0;

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Ll/ar2;->C(Ll/iam;)V

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
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpProfileImageAct;->d:Ll/kmf0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/kmf0;->a0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onBackPressed()V
    .locals 0

    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpProfileImageAct;->d:Ll/kmf0;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/kmf0;->I0(Landroid/os/Bundle;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onStartLifecycle()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpProfileImageAct;->d:Ll/kmf0;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/app/PutongAct;->pageHelper:Ll/l4g0;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/kmf0;->G0(Ll/l4g0;)V

    .line 6
    .line 7
    .line 8
    invoke-super {p0}, Lcom/p1/mobile/android/app/Act;->onStartLifecycle()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_imagepage_signup_view"

    .line 2
    .line 3
    return-object p0
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->setSwipeBackEnable(Z)V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpProfileImageAct;->d:Ll/kmf0;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Ll/kmf0;->r0(Landroid/os/Bundle;)V

    .line 8
    .line 9
    .line 10
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->preCreateView(Landroid/os/Bundle;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
