.class public Lcom/p1/mobile/putong/core/ui/account/PasswordResetAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# instance fields
.field public c:Ll/ii60;

.field public d:Ll/li60;


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

.method public static X1(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/VerifyData;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/core/ui/account/PasswordResetAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "verify_data"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    return-object v0
.end method


# virtual methods
.method public finish()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/account/PasswordResetAct;->d:Ll/li60;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/li60;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public initDataOnCreate()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initDataOnCreate()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ii60;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/ii60;-><init>(Ll/ner;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/PasswordResetAct;->c:Ll/ii60;

    .line 10
    .line 11
    new-instance v0, Ll/li60;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/li60;-><init>(Lcom/p1/mobile/putong/app/PutongAct;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/PasswordResetAct;->d:Ll/li60;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/account/PasswordResetAct;->c:Ll/ii60;

    .line 19
    .line 20
    invoke-virtual {v1, v0}, Ll/ar2;->C(Ll/iam;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/PasswordResetAct;->c:Ll/ii60;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string v1, "verify_data"

    .line 30
    .line 31
    invoke-virtual {p0, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    check-cast p0, Lcom/p1/mobile/putong/data/VerifyData;

    .line 36
    .line 37
    invoke-virtual {v0, p0}, Ll/ii60;->j0(Lcom/p1/mobile/putong/data/VerifyData;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public initSubscription()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/account/PasswordResetAct;->c:Ll/ii60;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/ii60;->a0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->preCreateView(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
