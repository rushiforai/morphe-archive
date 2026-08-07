.class public Lcom/p1/mobile/putong/core/newui/partner/ChatPartnerSelectFriendAct;
.super Lcom/p1/mobile/putong/app/PutongMvpAct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/app/PutongMvpAct<",
        "Ll/i15;",
        "Ll/r15;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongMvpAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Z1(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/data/ChatPartnerHistoryData;
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatPartnerHistoryData;->new_()Lcom/p1/mobile/putong/core/data/ChatPartnerHistoryData;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ChatPartnerHistoryData;->id:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 10
    .line 11
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ChatPartnerHistoryData;->name:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/ChatPartnerHistoryData;->avatarUrl:Ljava/lang/String;

    .line 26
    .line 27
    return-object v0
.end method

.method public static a2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/ChatPartners;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/core/newui/partner/ChatPartnerSelectFriendAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    new-instance p0, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ChatPartners;->users:Ljava/util/List;

    .line 14
    .line 15
    new-instance v1, Ll/g15;

    .line 16
    .line 17
    invoke-direct {v1}, Ll/g15;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-static {p1, v1}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 25
    .line 26
    .line 27
    const-string p1, "param_users"

    .line 28
    .line 29
    invoke-virtual {v0, p1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 30
    .line 31
    .line 32
    const-string p0, "param_from"

    .line 33
    .line 34
    invoke-virtual {v0, p0, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 35
    .line 36
    .line 37
    const-string p0, "param_text_id"

    .line 38
    .line 39
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 40
    .line 41
    .line 42
    const-string p0, "from"

    .line 43
    .line 44
    invoke-virtual {v0, p0, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 45
    .line 46
    .line 47
    return-object v0
.end method


# virtual methods
.method public bridge synthetic X1()Ll/ar2;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/partner/ChatPartnerSelectFriendAct;->b2()Ll/i15;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic Y1()Ll/iam;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/partner/ChatPartnerSelectFriendAct;->c2()Ll/r15;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public b2()Ll/i15;
    .locals 1

    .line 1
    new-instance v0, Ll/i15;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/i15;-><init>(Ll/ner;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public c2()Ll/r15;
    .locals 1

    .line 1
    new-instance v0, Ll/r15;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/r15;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public initDataOnCreate()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongMvpAct;->initDataOnCreate()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/app/PutongAct;->pageHelper:Ll/l4g0;

    .line 5
    .line 6
    const-string v1, "p_chatting_partner_signal_result"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ll/l4g0;->q(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/app/PutongAct;->pageHelper:Ll/l4g0;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpAct;->c:Ll/ar2;

    .line 14
    .line 15
    check-cast p0, Ll/i15;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/i15;->f0()Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string v1, "receive_number"

    .line 30
    .line 31
    invoke-static {v1, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    filled-new-array {p0}, [Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {v0, p0}, Ll/l4g0;->p([Ll/pf60;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_chatting_partner_signal_result"

    .line 2
    .line 3
    return-object p0
.end method

.method public setTransparentStatusBar()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->setTransparentStatusBar()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const/16 v0, 0x400

    .line 13
    .line 14
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/app/PutongAct;->setLightStatusBar(Landroid/view/Window;I)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public shouldSwitchToTransparentStatus()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method
