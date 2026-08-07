.class public Ll/nh60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/eh60;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/navigationbar/VNavigationBar;

.field public b:Landroid/widget/TextView;

.field public c:Landroid/widget/TextView;

.field public d:Lv/VButton_FakeShadowSmall;

.field public e:Lv/VMaterialEdit;

.field public f:Lv/VMaterialEdit;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Lv/VButton_FakeShadow;

.field public j:Ll/eh60;

.field public k:Lcom/p1/mobile/putong/core/ui/account/PasswordChangeAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/account/PasswordChangeAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/nh60;->k:Lcom/p1/mobile/putong/core/ui/account/PasswordChangeAct;

    .line 5
    .line 6
    return-void
.end method

.method private synthetic A(Ljava/lang/CharSequence;)V
    .locals 2

    .line 1
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->N9()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-ge v0, v1, :cond_0

    .line 14
    .line 15
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-lez p1, :cond_0

    .line 20
    .line 21
    iget-object p1, p0, Ll/nh60;->f:Lv/VMaterialEdit;

    .line 22
    .line 23
    iget-object v0, p0, Ll/nh60;->k:Lcom/p1/mobile/putong/core/ui/account/PasswordChangeAct;

    .line 24
    .line 25
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->K3:I

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-static {v0}, Ll/lu6;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {p1, v0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->setError(Ljava/lang/CharSequence;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    invoke-virtual {p0}, Ll/nh60;->u()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method private synthetic B(Ljava/lang/CharSequence;)V
    .locals 2

    .line 1
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->eq()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eq v0, v1, :cond_0

    .line 14
    .line 15
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-lez p1, :cond_0

    .line 20
    .line 21
    iget-object p1, p0, Ll/nh60;->e:Lv/VMaterialEdit;

    .line 22
    .line 23
    iget-object v0, p0, Ll/nh60;->k:Lcom/p1/mobile/putong/core/ui/account/PasswordChangeAct;

    .line 24
    .line 25
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->v3:I

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p1, v0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->setError(Ljava/lang/CharSequence;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    invoke-virtual {p0}, Ll/nh60;->u()V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method private synthetic C(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nh60;->j:Ll/eh60;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/eh60;->j0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/nh60;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/nh60;->z(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/nh60;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nh60;->w(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic c(Ll/nh60;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/nh60;->A(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public static synthetic d(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic e(Ll/nh60;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/nh60;->C(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Ll/nh60;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/nh60;->B(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public static synthetic i(Ll/nh60;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/nh60;->x()V

    return-void
.end method

.method public static synthetic j(Ll/nh60;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/nh60;->y(Landroid/view/View;)V

    return-void
.end method

.method private v()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/nh60;->d:Lv/VButton_FakeShadowSmall;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/nh60;->b:Landroid/widget/TextView;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/nh60;->d:Lv/VButton_FakeShadowSmall;

    .line 14
    .line 15
    iget-object v1, p0, Ll/nh60;->k:Lcom/p1/mobile/putong/core/ui/account/PasswordChangeAct;

    .line 16
    .line 17
    invoke-virtual {v1}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    sget v2, Ll/j9c0;->l:I

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/nh60;->k:Lcom/p1/mobile/putong/core/ui/account/PasswordChangeAct;

    .line 31
    .line 32
    invoke-virtual {v0}, Landroid/app/Activity;->getLocalClassName()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    const/16 v2, 0x3c

    .line 37
    .line 38
    invoke-static {v1, v2}, Ll/l51;->N(Ljava/lang/String;I)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    new-instance v1, Ll/kh60;

    .line 47
    .line 48
    invoke-direct {v1, p0}, Ll/kh60;-><init>(Ll/nh60;)V

    .line 49
    .line 50
    .line 51
    new-instance v2, Ll/lh60;

    .line 52
    .line 53
    invoke-direct {v2}, Ll/lh60;-><init>()V

    .line 54
    .line 55
    .line 56
    new-instance v3, Ll/mh60;

    .line 57
    .line 58
    invoke-direct {v3, p0}, Ll/mh60;-><init>(Ll/nh60;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v1, v2, v3}, Ll/psd0;->I(Ll/y20;Ll/y20;Ll/x20;)Lcom/p1/mobile/android/rx/a;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method private synthetic y(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/nh60;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic z(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nh60;->j:Ll/eh60;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/eh60;->k0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/nh60;->k:Lcom/p1/mobile/putong/core/ui/account/PasswordChangeAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public E()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/nh60;->k:Lcom/p1/mobile/putong/core/ui/account/PasswordChangeAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/nh60;->e:Lv/VMaterialEdit;

    .line 7
    .line 8
    const-string v1, ""

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/nh60;->d:Lv/VButton_FakeShadowSmall;

    .line 14
    .line 15
    iget-object v1, p0, Ll/nh60;->k:Lcom/p1/mobile/putong/core/ui/account/PasswordChangeAct;

    .line 16
    .line 17
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->z3:I

    .line 18
    .line 19
    const/16 v3, 0x3c

    .line 20
    .line 21
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 34
    .line 35
    .line 36
    invoke-direct {p0}, Ll/nh60;->v()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public F(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nh60;->c:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public G()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nh60;->e:Lv/VMaterialEdit;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/nh60;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object p0, p0, Ll/nh60;->e:Lv/VMaterialEdit;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/nh60;->k:Lcom/p1/mobile/putong/core/ui/account/PasswordChangeAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/eh60;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/nh60;->m(Ll/eh60;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/nh60;->k(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public k(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/oh60;->b(Ll/nh60;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public l()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/nh60;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/nh60;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Landroid/app/Activity;->getLocalClassName()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {v0}, Ll/l51;->K(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Ll/nh60;->act()Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ll/nh60;->act()Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 31
    .line 32
    .line 33
    sget p0, Lcom/p1/mobile/putong/core/profile/R$string;->x0:I

    .line 34
    .line 35
    const/4 v0, 0x0

    .line 36
    invoke-static {p0, v0}, Ll/o1j0;->x(IZ)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public m(Ll/eh60;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nh60;->j:Ll/eh60;

    .line 2
    .line 3
    return-void
.end method

.method public n(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/nh60;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public p()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nh60;->e:Lv/VMaterialEdit;

    .line 2
    .line 3
    invoke-static {p0}, Ll/bsj0;->I(Landroid/widget/TextView;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public q(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nh60;->d:Lv/VButton_FakeShadowSmall;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/nh60;->k:Lcom/p1/mobile/putong/core/ui/account/PasswordChangeAct;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 10
    .line 11
    .line 12
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public r()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/nh60;->a:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->p0:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setTitle(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/nh60;->a:Lv/navigationbar/VNavigationBar;

    .line 9
    .line 10
    new-instance v1, Ll/fh60;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/fh60;-><init>(Ll/nh60;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/nh60;->d:Lv/VButton_FakeShadowSmall;

    .line 19
    .line 20
    new-instance v1, Ll/gh60;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/gh60;-><init>(Ll/nh60;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/nh60;->f:Lv/VMaterialEdit;

    .line 29
    .line 30
    const/4 v1, 0x0

    .line 31
    invoke-virtual {v0, v1}, Lv/VMaterialEdit;->I(Z)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    new-instance v2, Ll/hh60;

    .line 36
    .line 37
    invoke-direct {v2, p0}, Ll/hh60;-><init>(Ll/nh60;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Ll/nh60;->e:Lv/VMaterialEdit;

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Lv/VMaterialEdit;->I(Z)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    new-instance v2, Ll/ih60;

    .line 54
    .line 55
    invoke-direct {v2, p0}, Ll/ih60;-><init>(Ll/nh60;)V

    .line 56
    .line 57
    .line 58
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Ll/nh60;->i:Lv/VButton_FakeShadow;

    .line 66
    .line 67
    invoke-static {v0, v1}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Ll/nh60;->k:Lcom/p1/mobile/putong/core/ui/account/PasswordChangeAct;

    .line 71
    .line 72
    invoke-virtual {v0}, Landroid/app/Activity;->getLocalClassName()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-static {v0}, Ll/l51;->B(Ljava/lang/String;)Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    const/4 v2, 0x1

    .line 81
    if-nez v0, :cond_0

    .line 82
    .line 83
    iget-object v0, p0, Ll/nh60;->d:Lv/VButton_FakeShadowSmall;

    .line 84
    .line 85
    invoke-static {v0, v2}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Ll/nh60;->b:Landroid/widget/TextView;

    .line 89
    .line 90
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 91
    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_0
    iget-object v0, p0, Ll/nh60;->j:Ll/eh60;

    .line 95
    .line 96
    iput-boolean v2, v0, Ll/eh60;->c:Z

    .line 97
    .line 98
    invoke-direct {p0}, Ll/nh60;->v()V

    .line 99
    .line 100
    .line 101
    :goto_0
    iget-object v0, p0, Ll/nh60;->i:Lv/VButton_FakeShadow;

    .line 102
    .line 103
    new-instance v1, Ll/jh60;

    .line 104
    .line 105
    invoke-direct {v1, p0}, Ll/jh60;-><init>(Ll/nh60;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 109
    .line 110
    .line 111
    return-void
.end method

.method public s()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nh60;->f:Lv/VMaterialEdit;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final u()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/nh60;->i:Lv/VButton_FakeShadow;

    .line 2
    .line 3
    iget-object v1, p0, Ll/nh60;->j:Ll/eh60;

    .line 4
    .line 5
    iget-boolean v1, v1, Ll/eh60;->c:Z

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-object v1, p0, Ll/nh60;->f:Lv/VMaterialEdit;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/rengwuxian/materialedittext/MaterialEditText;->getError()Ljava/lang/CharSequence;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    iget-object v1, p0, Ll/nh60;->e:Lv/VMaterialEdit;

    .line 18
    .line 19
    invoke-virtual {v1}, Lcom/rengwuxian/materialedittext/MaterialEditText;->getError()Ljava/lang/CharSequence;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    if-nez v1, :cond_0

    .line 24
    .line 25
    iget-object v1, p0, Ll/nh60;->f:Lv/VMaterialEdit;

    .line 26
    .line 27
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-nez v1, :cond_0

    .line 36
    .line 37
    iget-object v1, p0, Ll/nh60;->f:Lv/VMaterialEdit;

    .line 38
    .line 39
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->N9()I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-lt v1, v2, :cond_0

    .line 56
    .line 57
    iget-object v1, p0, Ll/nh60;->e:Lv/VMaterialEdit;

    .line 58
    .line 59
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    if-nez v1, :cond_0

    .line 68
    .line 69
    iget-object p0, p0, Ll/nh60;->e:Lv/VMaterialEdit;

    .line 70
    .line 71
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    .line 76
    .line 77
    .line 78
    move-result p0

    .line 79
    const/4 v1, 0x4

    .line 80
    if-ne p0, v1, :cond_0

    .line 81
    .line 82
    const/4 p0, 0x1

    .line 83
    goto :goto_0

    .line 84
    :cond_0
    const/4 p0, 0x0

    .line 85
    :goto_0
    invoke-static {v0, p0}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public final synthetic w(Ljava/lang/Long;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/nh60;->d:Lv/VButton_FakeShadowSmall;

    .line 2
    .line 3
    iget-object p0, p0, Ll/nh60;->k:Lcom/p1/mobile/putong/core/ui/account/PasswordChangeAct;

    .line 4
    .line 5
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->z3:I

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 8
    .line 9
    .line 10
    move-result-wide v2

    .line 11
    const-wide/16 v4, 0x3b

    .line 12
    .line 13
    sub-long/2addr v4, v2

    .line 14
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p0, v1, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final synthetic x()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/nh60;->d:Lv/VButton_FakeShadowSmall;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/nh60;->b:Landroid/widget/TextView;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/nh60;->d:Lv/VButton_FakeShadowSmall;

    .line 14
    .line 15
    iget-object v1, p0, Ll/nh60;->k:Lcom/p1/mobile/putong/core/ui/account/PasswordChangeAct;

    .line 16
    .line 17
    invoke-virtual {v1}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    sget v2, Ll/j9c0;->o:I

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/nh60;->d:Lv/VButton_FakeShadowSmall;

    .line 31
    .line 32
    iget-object p0, p0, Ll/nh60;->k:Lcom/p1/mobile/putong/core/ui/account/PasswordChangeAct;

    .line 33
    .line 34
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->F3:I

    .line 35
    .line 36
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method
