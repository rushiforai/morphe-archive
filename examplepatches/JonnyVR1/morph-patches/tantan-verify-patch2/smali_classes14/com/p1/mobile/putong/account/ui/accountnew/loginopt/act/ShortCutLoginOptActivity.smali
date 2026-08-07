.class public Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/ShortCutLoginOptActivity;
.super Lcom/p1/mobile/putong/account/AccountBaseAct;
.source "SourceFile"


# static fields
.field public static e:Ljava/lang/String; = "phone_number"


# instance fields
.field public c:Ll/z6f0;

.field public d:Ll/u6f0;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/AccountBaseAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/ShortCutLoginOptActivity;->c:Ll/z6f0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/z6f0;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

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
    new-instance v0, Ll/u6f0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/u6f0;-><init>(Ll/ner;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/ShortCutLoginOptActivity;->d:Ll/u6f0;

    .line 10
    .line 11
    new-instance v0, Ll/z6f0;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/z6f0;-><init>(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/ShortCutLoginOptActivity;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/ShortCutLoginOptActivity;->c:Ll/z6f0;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/ShortCutLoginOptActivity;->d:Ll/u6f0;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/ShortCutLoginOptActivity;->d:Ll/u6f0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/u6f0;->a0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onStartLifecycle()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/ShortCutLoginOptActivity;->d:Ll/u6f0;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/app/PutongAct;->pageHelper:Ll/l4g0;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/u6f0;->z1(Ll/l4g0;)V

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
    const-string p0, "p_quick_sign_in_view"

    .line 2
    .line 3
    return-object p0
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-static {p0}, Ll/plm;->a(Lcom/p1/mobile/putong/app/PutongAct;)V

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->preCreateView(Landroid/os/Bundle;)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/ShortCutLoginOptActivity;->d:Ll/u6f0;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    sget-object v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/ShortCutLoginOptActivity;->e:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p1, p0}, Ll/u6f0;->u1(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public shouldShowGradientActionBar()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public shouldShowGradientStatusBar()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method
