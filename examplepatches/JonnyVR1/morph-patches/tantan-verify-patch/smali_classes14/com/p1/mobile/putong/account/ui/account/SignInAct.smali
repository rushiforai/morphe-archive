.class public Lcom/p1/mobile/putong/account/ui/account/SignInAct;
.super Lcom/p1/mobile/putong/account/ui/account/SignInBaseActMVP;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/account/ui/account/SignInBaseActMVP<",
        "Ll/vcf0;",
        "Ll/jdf0;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/ui/account/SignInBaseActMVP;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public Z1()Ll/vcf0;
    .locals 1

    .line 1
    new-instance v0, Ll/vcf0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/vcf0;-><init>(Ll/ner;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public a2()Ll/jdf0;
    .locals 1

    .line 1
    new-instance v0, Ll/jdf0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/jdf0;-><init>(Lcom/p1/mobile/putong/account/ui/account/SignInAct;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public bridge synthetic generateSignInPresenter()Ll/ibf0;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/account/SignInAct;->Z1()Ll/vcf0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic generateSignInViewModel()Ll/jbf0;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/account/SignInAct;->a2()Ll/jdf0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/account/SignInBaseActMVP;->signInViewModel:Ll/jbf0;

    .line 2
    .line 3
    check-cast p0, Ll/jdf0;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/jdf0;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public initSubscription()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/account/ui/account/SignInBaseActMVP;->initSubscription()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/account/SignInBaseActMVP;->signInPresenter:Ll/ibf0;

    .line 5
    .line 6
    check-cast p0, Ll/vcf0;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/vcf0;->a0()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/account/SignInBaseActMVP;->signInPresenter:Ll/ibf0;

    .line 2
    .line 3
    check-cast v0, Ll/vcf0;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "after_signin"

    .line 10
    .line 11
    const/4 v3, 0x0

    .line 12
    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    iput v1, v0, Ll/ibf0;->a:I

    .line 17
    .line 18
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/account/ui/account/SignInBaseActMVP;->preCreateView(Landroid/os/Bundle;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public trackedArgs()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/account/SignInBaseActMVP;->signInPresenter:Ll/ibf0;

    .line 2
    .line 3
    check-cast p0, Ll/vcf0;

    .line 4
    .line 5
    iget p0, p0, Ll/ibf0;->a:I

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget-object v0, Ll/og3;->b:Ll/og3;

    .line 12
    .line 13
    const-string v1, "after sign in"

    .line 14
    .line 15
    filled-new-array {v1, p0, v0}, [Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method
