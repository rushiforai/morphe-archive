.class public Lcom/p1/mobile/putong/core/ui/settings/ChatAndNotifiAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# instance fields
.field public c:Ll/qt4;

.field public d:Ll/zt4;


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


# virtual methods
.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/ChatAndNotifiAct;->d:Ll/zt4;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/zt4;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

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
    new-instance v0, Ll/qt4;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/qt4;-><init>(Ll/ner;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/ChatAndNotifiAct;->c:Ll/qt4;

    .line 10
    .line 11
    new-instance v0, Ll/zt4;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/zt4;-><init>(Lcom/p1/mobile/putong/core/ui/settings/ChatAndNotifiAct;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/ChatAndNotifiAct;->d:Ll/zt4;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/ChatAndNotifiAct;->c:Ll/qt4;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/ChatAndNotifiAct;->c:Ll/qt4;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/qt4;->a0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_notification_and_chat_settings_view"

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/ChatAndNotifiAct;->c:Ll/qt4;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const-string v0, "from"

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p1, p0}, Ll/qt4;->A0(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
