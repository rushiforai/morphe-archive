.class public Lcom/p1/mobile/putong/account/ui/account/EmailVerifyDeviceIntroAct;
.super Lcom/p1/mobile/putong/account/AccountBaseAct;
.source "SourceFile"


# instance fields
.field public c:Ll/xxe;

.field public d:Ll/zxe;


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

.method public static X1(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/SignInData;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/account/ui/account/EmailVerifyDeviceIntroAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "signindata"

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
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/account/EmailVerifyDeviceIntroAct;->d:Ll/zxe;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/zxe;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

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
    new-instance v0, Ll/xxe;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/xxe;-><init>(Ll/ner;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/account/EmailVerifyDeviceIntroAct;->c:Ll/xxe;

    .line 10
    .line 11
    new-instance v0, Ll/zxe;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/zxe;-><init>(Lcom/p1/mobile/putong/app/PutongAct;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/account/EmailVerifyDeviceIntroAct;->d:Ll/zxe;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/account/EmailVerifyDeviceIntroAct;->c:Ll/xxe;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/account/EmailVerifyDeviceIntroAct;->c:Ll/xxe;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/xxe;->a0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onBackPressed()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/account/EmailVerifyDeviceIntroAct;->d:Ll/zxe;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/zxe;->f()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onHomePressed()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/account/EmailVerifyDeviceIntroAct;->onBackPressed()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_new_device_passwordlogin_verify_view"

    .line 2
    .line 3
    return-object p0
.end method
