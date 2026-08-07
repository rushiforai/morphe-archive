.class public Lcom/p1/mobile/putong/core/module/CoreProviderImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;


# annotations
.annotation build Lcom/tantanapp/android/injecter/facade/annotation/Route;
    name = "CoreProviderModule"
    path = "/core_global/service"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic F(Ll/x20;Ll/ugy;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/a5i0;->f1()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    xor-int/lit8 p1, p1, 0x1

    .line 10
    .line 11
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const-string v0, "is_shown_next_time"

    .line 16
    .line 17
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    filled-new-array {p1}, [Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    const-string v0, "e_coin_usage_confirm_button"

    .line 26
    .line 27
    const-string v1, "p_alert_coin_usage_confirm"

    .line 28
    .line 29
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 30
    .line 31
    .line 32
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-eqz p1, :cond_0

    .line 37
    .line 38
    invoke-interface {p0}, Ll/x20;->call()V

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method public static synthetic H(Ljava/lang/Runnable;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic J(Ljava/lang/Runnable;Ll/ugy;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic K(Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 1
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/a5i0;->P0(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic L()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic M(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic N(Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic P(Ljava/lang/Runnable;Ll/ugy;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic Q(Ljava/lang/Runnable;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic R(Ll/x20;Ll/ugy;)V
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_SAY_HI_PKG:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    invoke-static {p1}, Ll/a5i0;->M1(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    invoke-interface {p0}, Ll/x20;->call()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public static synthetic S(Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 1
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/a5i0;->R0(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public A(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/qtk;->T0(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public A8(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/aw90;->P(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public Aa(Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ll/ey6;->h(Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Ac(Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/e1b;->H0(Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/CharSequence;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Ae(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ll/yvk;->g(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Aj(Lcom/p1/mobile/putong/core/data/Conversation;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ll/fcp;->l(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public As()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method

.method public B()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/d79;->j0()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public B8()Ll/wyd0;
    .locals 0

    .line 1
    invoke-static {}, Ll/r8n;->f()Ll/r8n;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Ll/r8n;->f:Ll/wyd0;

    .line 6
    .line 7
    return-object p0
.end method

.method public Bf(Ljava/lang/String;Ljava/util/HashMap;Ljava/util/HashMap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/core/data/IPRegion;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/c760;->d()Ll/c760;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2, p3}, Ll/c760;->c(Ljava/lang/String;Ljava/util/HashMap;Ljava/util/HashMap;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public Bm(Lcom/p1/mobile/putong/core/data/AppealInfo;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/yc2;->e()Ll/yc2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/yc2;->h(Lcom/p1/mobile/putong/core/data/AppealInfo;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public Bo(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    new-instance p0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v0, Lcom/p1/mobile/putong/core/ui/settings/privacyandpremisson/PrivacyAndPremissonAct;

    .line 4
    .line 5
    invoke-direct {p0, p1, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public Bt()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->E3()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public C(I)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ll/ln7;->a(I)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Ce(Landroid/app/Activity;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersAct;

    .line 2
    .line 3
    return p0
.end method

.method public Cf(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/UrlTag;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_3

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/p1/mobile/putong/core/data/UrlTag;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/UrlTag;->tags:Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_0

    .line 33
    .line 34
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    check-cast v1, Lcom/p1/mobile/putong/core/data/UserTagData;

    .line 39
    .line 40
    invoke-static {}, Lcom/p1/mobile/putong/core/data/NewTags;->new_()Lcom/p1/mobile/putong/core/data/NewTags;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/UserTagData;->id:Ljava/lang/String;

    .line 45
    .line 46
    iput-object v3, v2, Lcom/p1/mobile/putong/core/data/NewTags;->id:Ljava/lang/String;

    .line 47
    .line 48
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/UserTagData;->title:Ljava/lang/String;

    .line 49
    .line 50
    iput-object v3, v2, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 51
    .line 52
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/UserTagData;->icon:Ljava/lang/String;

    .line 53
    .line 54
    iput-object v3, v2, Lcom/p1/mobile/putong/core/data/NewTags;->icon:Ljava/lang/String;

    .line 55
    .line 56
    iget v3, v1, Lcom/p1/mobile/putong/core/data/UserTagData;->count:I

    .line 57
    .line 58
    if-lez v3, :cond_1

    .line 59
    .line 60
    int-to-long v3, v3

    .line 61
    goto :goto_1

    .line 62
    :cond_1
    const-wide/16 v3, 0x1

    .line 63
    .line 64
    :goto_1
    iput-wide v3, v2, Lcom/p1/mobile/putong/core/data/NewTags;->localTagUserCounts:J

    .line 65
    .line 66
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/UserTagData;->categories:Ljava/util/List;

    .line 67
    .line 68
    iput-object v3, v2, Lcom/p1/mobile/putong/core/data/NewTags;->categories:Ljava/util/List;

    .line 69
    .line 70
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/UserTagData;->status:Ljava/lang/String;

    .line 71
    .line 72
    iput-object v1, v2, Lcom/p1/mobile/putong/core/data/NewTags;->status:Ljava/lang/String;

    .line 73
    .line 74
    invoke-static {}, Ll/gra;->L3()Z

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    if-eqz v1, :cond_2

    .line 79
    .line 80
    const/4 v1, 0x1

    .line 81
    iput-boolean v1, v2, Lcom/p1/mobile/putong/core/data/NewTags;->isPictureTag:Z

    .line 82
    .line 83
    :cond_2
    invoke-interface {p0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_3
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    invoke-virtual {p1, p0}, Ll/gj40;->M(Ljava/util/List;)V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public Cn()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->H3()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Cq()I
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->Q0()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Ct(Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ll/ey6;->f(Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public D()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public Db(Z)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/tmh0;->J0(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Df(Lcom/p1/mobile/putong/data/User;)Z
    .locals 0

    .line 1
    invoke-static {}, Ll/o3z;->g()Ll/o3z;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/o3z;->j(Lcom/p1/mobile/putong/data/User;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public Dg(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/t4j;->g(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Di(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/vx6;->a(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Dt()I
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->k()Lcom/p1/mobile/putong/core/data/CollapsibleConversationConfig;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const p0, 0x7fffffff

    .line 8
    .line 9
    .line 10
    return p0

    .line 11
    :cond_0
    iget p0, p0, Lcom/p1/mobile/putong/core/data/CollapsibleConversationConfig;->ignorable_unread_msg_days:I

    .line 12
    .line 13
    return p0
.end method

.method public E()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->V1()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public E7(Lcom/p1/mobile/putong/data/CounterConversations;)I
    .locals 0

    .line 1
    iget p0, p1, Lcom/p1/mobile/putong/data/CounterConversations;->unseen:I

    .line 2
    .line 3
    return p0
.end method

.method public E8(Ljava/util/HashMap;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget p0, Lcom/p1/mobile/putong/core/R$string;->B1:I

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "CHAT_GROUP_QUNJINGAO"

    .line 8
    .line 9
    invoke-virtual {p1, v0, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    sget p0, Lcom/p1/mobile/putong/core/R$string;->A1:I

    .line 13
    .line 14
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string v0, "CHAT_GROUP_QUNJIESHAN"

    .line 19
    .line 20
    invoke-virtual {p1, v0, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    sget p0, Lcom/p1/mobile/putong/core/R$string;->m1:I

    .line 24
    .line 25
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string v0, "CHAT_GROUP_BEIQUNZUJINYAN"

    .line 30
    .line 31
    invoke-virtual {p1, v0, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    sget p0, Lcom/p1/mobile/putong/core/R$string;->E1:I

    .line 35
    .line 36
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    const-string v0, "CHAT_GROUP_YICHUQUNZU"

    .line 41
    .line 42
    invoke-virtual {p1, v0, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    sget p0, Lcom/p1/mobile/putong/core/R$string;->D1:I

    .line 46
    .line 47
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    const-string v0, "CHAT_GROUP_YAOQINGGRUQUN"

    .line 52
    .line 53
    invoke-virtual {p1, v0, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    sget p0, Lcom/p1/mobile/putong/core/R$string;->u1:I

    .line 57
    .line 58
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    const-string v0, "CHAT_GROUP_NIBEI_YICHUQUN"

    .line 63
    .line 64
    invoke-virtual {p1, v0, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    sget p0, Lcom/p1/mobile/putong/core/R$string;->n1:I

    .line 68
    .line 69
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    const-string v0, "CHAT_GROUP_HUANYINGRUQUN"

    .line 74
    .line 75
    invoke-virtual {p1, v0, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    sget p0, Lcom/p1/mobile/putong/core/R$string;->p1:I

    .line 79
    .line 80
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    const-string v0, "CHAT_GROUP_JIANQUN_CHENGGONG"

    .line 85
    .line 86
    invoke-virtual {p1, v0, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    sget p0, Lcom/p1/mobile/putong/core/R$string;->y1:I

    .line 90
    .line 91
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    const-string v0, "CHAT_GROUP_QUANYUANJINYAN"

    .line 96
    .line 97
    invoke-virtual {p1, v0, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    sget p0, Lcom/p1/mobile/putong/core/R$string;->q1:I

    .line 101
    .line 102
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    const-string v0, "CHAT_GROUP_JIECHUJINYAN"

    .line 107
    .line 108
    invoke-virtual {p1, v0, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    sget p0, Lcom/p1/mobile/putong/core/R$string;->l1:I

    .line 112
    .line 113
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    const-string v0, "CHAT_GROUP_ADMINISTRATOR"

    .line 118
    .line 119
    invoke-virtual {p1, v0, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    return-void
.end method

.method public Eg(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/pq4;->q(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public El(I)Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Ll/baj;->p:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->c()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0}, Ll/baj;->U(Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public Er()Z
    .locals 0

    const/4 p0, 0x1

    return p0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public F4()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public F6()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method

.method public F7()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public Fa(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    new-instance p0, Ll/sxa0;

    .line 2
    .line 3
    invoke-direct {p0, p1, p2}, Ll/sxa0;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x5

    .line 7
    const/4 p2, 0x0

    .line 8
    invoke-virtual {p0, p1, p2}, Ll/sxa0;->K(ILl/x20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public Fk()V
    .locals 0

    .line 1
    invoke-static {}, Ll/t4j;->d()Ll/t4j;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/t4j;->i()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public Fl()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->H2()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public G(Lcom/p1/mobile/putong/app/PutongAct;)Lcom/p1/mobile/putong/app/a;
    .locals 0

    .line 1
    new-instance p0, Ll/szx;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ll/szx;-><init>(Lcom/p1/mobile/putong/app/PutongAct;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public Ga(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->r1()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/n46;->g()Ll/n46;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0, p1}, Ll/n46;->f(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public Ge(Lcom/p1/mobile/android/app/Act;)Landroid/content/Intent;
    .locals 12

    .line 1
    sget v6, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->D:I

    .line 2
    .line 3
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget-object v9, p0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 12
    .line 13
    const-string v10, ""

    .line 14
    .line 15
    const/4 v11, 0x1

    .line 16
    const/4 v1, 0x1

    .line 17
    const/4 v2, 0x0

    .line 18
    const/4 v3, 0x1

    .line 19
    const/4 v4, 0x1

    .line 20
    const/4 v5, 0x0

    .line 21
    const/4 v7, 0x0

    .line 22
    const/4 v8, 0x1

    .line 23
    move-object v0, p1

    .line 24
    invoke-static/range {v0 .. v11}, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->k2(Landroid/content/Context;IZZZLjava/lang/String;IZZLcom/p1/mobile/putong/data/Gender;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public Gh(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NewTags;
    .locals 0

    .line 1
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/gj40;->O(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NewTags;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public Gi()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->x2()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Gp(Lcom/p1/mobile/putong/data/User;)Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/User;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/baj;->r(Lcom/p1/mobile/putong/data/User;)Ljava/util/ArrayList;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public H6(Landroid/app/Activity;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketRecordAct;

    .line 2
    .line 3
    return p0
.end method

.method public Hb(Lcom/p1/mobile/android/app/Act;ZLjava/lang/String;Ll/x20;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/m27;->F3()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-static {p1}, Ll/b83;->k(Lcom/p1/mobile/android/app/Act;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    invoke-static {p1, p2, p4, p0, p3}, Ll/ma3;->h(Lcom/p1/mobile/android/app/Act;ZLl/x20;ZLjava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public Hf()Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/match/a;->w()Lcom/p1/mobile/putong/core/ui/match/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/a;->v()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public Hg()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/d79;->T()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Hq(Ljava/lang/String;Lcom/tantanapp/common/data/ValueObject;Lcom/tantanapp/common/data/ValueObject;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/g6v;->f()Ll/g6v;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2, p3, v0}, Ll/g6v;->e(Ljava/lang/String;Lcom/tantanapp/common/data/ValueObject;Lcom/tantanapp/common/data/ValueObject;Ljava/lang/Boolean;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public I4()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->z()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public I5()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/spl0;->U()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Ih()I
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->E0()Lcom/p1/mobile/putong/core/data/MessageTabRevisionConfig;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/gra;->E0()Lcom/p1/mobile/putong/core/data/MessageTabRevisionConfig;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iget p0, p0, Lcom/p1/mobile/putong/core/data/MessageTabRevisionConfig;->new_tag_exposure_after_max_minutes:I

    .line 16
    .line 17
    return p0

    .line 18
    :cond_0
    const/4 p0, 0x3

    .line 19
    return p0
.end method

.method public Ik(Ljava/lang/String;)Lcom/p1/mobile/putong/data/QualificationType;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/baj;->H(Ljava/lang/String;)Lcom/p1/mobile/putong/data/QualificationType;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Ip(Lcom/p1/mobile/android/app/Act;ZLjava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isBanned()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;->p2(Z)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isProfileJailed()Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-eqz p0, :cond_1

    .line 33
    .line 34
    const/4 p0, 0x0

    .line 35
    invoke-static {p1, p0}, Ll/ey0;->i(Lcom/p1/mobile/android/app/Act;Z)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    invoke-static {}, Ll/a2i0;->b()Ll/a2i0;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 44
    .line 45
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 46
    .line 47
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {p0, v0}, Ll/a2i0;->e(Lcom/p1/mobile/putong/data/User;)V

    .line 56
    .line 57
    .line 58
    invoke-static {p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/profile/TagGuidePicAct;->Z1(Landroid/content/Context;ZLjava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public Is()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->k3()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public J8()I
    .locals 0

    .line 1
    invoke-static {}, Ll/a5i0;->v0()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public J9()I
    .locals 0

    .line 1
    sget p0, Ll/dbc0;->Fq:I

    .line 2
    .line 3
    return p0
.end method

.method public Jc(Lcom/p1/mobile/android/app/Act;)I
    .locals 2

    .line 1
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-virtual {p0, p1, v0, v1}, Ll/aw90;->C(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Z)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0
.end method

.method public Jd()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Ll/m600;->c()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Je()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->e()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Ji(Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ll/ey6;->l(Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Jk(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V
    .locals 13

    .line 1
    new-instance v7, Ll/bta;

    .line 2
    .line 3
    invoke-direct {v7}, Ll/bta;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v8, Ll/cta;

    .line 7
    .line 8
    invoke-direct {v8}, Ll/cta;-><init>()V

    .line 9
    .line 10
    .line 11
    const/4 v11, 0x0

    .line 12
    const/4 v12, 0x0

    .line 13
    const/4 v2, 0x1

    .line 14
    const/4 v3, 0x0

    .line 15
    const/4 v4, 0x0

    .line 16
    const-string v5, "logout_ab"

    .line 17
    .line 18
    const/4 v6, 0x0

    .line 19
    const-string v9, "p_delete_account_chat_block"

    .line 20
    .line 21
    const/4 v10, 0x0

    .line 22
    move-object v0, p1

    .line 23
    move-object v1, p2

    .line 24
    invoke-static/range {v0 .. v12}, Ll/rgr;->n(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZZLjava/lang/String;Ll/rcj;Ll/y20;Ll/y20;Ljava/lang/String;Lcom/p1/mobile/putong/data/LikeExtraData;Ljava/lang/String;Ljava/lang/String;)Z

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public Jo(Lcom/p1/mobile/android/app/Act;Ll/x20;)V
    .locals 6
    .param p2    # Ll/x20;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    new-instance v2, Ll/vsa;

    .line 2
    .line 3
    invoke-direct {v2}, Ll/vsa;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v3, 0x0

    .line 7
    const/4 v4, 0x0

    .line 8
    const-string v1, ""

    .line 9
    .line 10
    move-object v0, p1

    .line 11
    move-object v5, p2

    .line 12
    invoke-static/range {v0 .. v5}, Ll/qtk;->P0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;ZZLl/x20;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public K4()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public Kl()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->c3()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Kq(Lcom/p1/mobile/putong/data/User;)Z
    .locals 0

    .line 1
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/aw90;->h0(Lcom/p1/mobile/putong/data/User;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public Lc()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public Li()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->k()Lcom/p1/mobile/putong/core/data/CollapsibleConversationConfig;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/CollapsibleConversationConfig;->ignore_old_unread_msg:Z

    .line 10
    .line 11
    return p0
.end method

.method public Ln()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public Mg()I
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->C3()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Mk()Lcom/p1/mobile/putong/core/data/CategorySuggestions;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->I4:Lcom/p1/mobile/putong/core/data/CategorySuggestions;

    .line 2
    .line 3
    return-object p0
.end method

.method public Mm(Lcom/p1/mobile/android/app/Act;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/core/ui/profile/EditProfileAct;

    .line 2
    .line 3
    return p0
.end method

.method public Mo()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public N6()Lcom/p1/mobile/putong/core/data/HometownSuggest;
    .locals 0

    .line 1
    invoke-static {}, Ll/gw90;->h()Lcom/p1/mobile/putong/core/data/HometownSuggest;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Na()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/t7a;->c()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Nb(Lcom/p1/mobile/putong/data/Profile;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/dy90;->V(Lcom/p1/mobile/putong/data/Profile;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Nc(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->F(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Nd(Lcom/p1/mobile/putong/core/data/Conversation;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ll/pm6;->a(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Nl(Lcom/p1/mobile/putong/data/User;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ll/ige0;->a(Lcom/p1/mobile/putong/data/User;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Nq(Z)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/ej1;->a(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public O()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public Oc()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/zg6;->f()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Od()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/h39;->K()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Oe(Lcom/p1/mobile/putong/data/Envelope;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3}, Ll/zg6;->b(Lcom/p1/mobile/putong/data/Envelope;Ljava/lang/String;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Oi()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method

.method public Oq()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method

.method public Or()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/d79;->K()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Os(Ljava/lang/String;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/baj;->A(Ljava/lang/String;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Pa(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-static {p1}, Ll/bnl0;->D(Landroid/content/Context;)Landroid/app/Activity;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string p1, "e_advanced_filter_location"

    .line 6
    .line 7
    const-string v0, "p_advanced_filter_page"

    .line 8
    .line 9
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    const-string p1, ""

    .line 13
    .line 14
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/VipLocationHistoryAct;->X1(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public Pi(Ljava/lang/String;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/baj;->F(Ljava/lang/String;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Q6()Lrx/subjects/a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/a<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;>;"
        }
    .end annotation

    .line 1
    sget-object p0, Ll/cjj;->b:Lrx/subjects/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public Qg(Lcom/p1/mobile/android/app/Act;ZLl/x20;)V
    .locals 1

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/p1/mobile/putong/core/module/CoreProviderImpl;->Hb(Lcom/p1/mobile/android/app/Act;ZLjava/lang/String;Ll/x20;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public Qi()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/d79;->b0()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Ql(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ll/d79;->x(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Qq()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/d79;->a0()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public R8()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/d79;->e0()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Rg(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/b;->k(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Rk()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/d79;->U()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Ro()I
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->m()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Rq(Lcom/p1/mobile/android/app/Act;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 2
    .line 3
    return p0
.end method

.method public Si(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/quickaudio/DropDownAct;->a2(Landroid/content/Context;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Lcom/p1/mobile/putong/core/module/CoreProviderImpl$b;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Lcom/p1/mobile/putong/core/module/CoreProviderImpl$b;-><init>(Lcom/p1/mobile/putong/core/module/CoreProviderImpl;Lcom/p1/mobile/android/app/Act;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/android/app/Act;->startActivityForResult(Landroid/content/Intent;Lcom/p1/mobile/android/app/a$a;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final T(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;Z)Landroid/view/View;
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget p1, Ll/kec0;->hb:I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, p1, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/PurchaseCoinConsumeSayHiView;

    .line 13
    .line 14
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/PurchaseCoinConsumeSayHiView;->b(Z)V

    .line 15
    .line 16
    .line 17
    return-object p0
.end method

.method public T8(Ljava/lang/String;)Landroid/util/Pair;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Landroid/util/Pair<",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/baj;->x(Ljava/lang/String;)Landroid/util/Pair;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Te(Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ll/ey6;->j(Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public U()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public U8(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/pq4;->p(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public U9()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public Ua()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->s1()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Uc()Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    return-object p0
.end method

.method public Ud(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    new-instance p0, Ll/fhp;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ll/fhp;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/q27;->show()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public Uj(Lcom/p1/mobile/android/app/Act;Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2}, Ll/aw90;->v0(Lcom/p1/mobile/android/app/Act;Ll/y20;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public Ul()Lrx/subjects/a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/core/data/InsertConversationsList;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/r8n;->f()Ll/r8n;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Ll/r8n;->b:Lrx/subjects/a;

    .line 6
    .line 7
    return-object p0
.end method

.method public Uo(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ll/baj;->R(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public V6()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method

.method public V8(Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ll/ey6;->e(Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Vb()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->l()Lcom/p1/mobile/putong/core/data/CollapsibleConversationConfig;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/CollapsibleConversationConfig;->enabled:Z

    .line 6
    .line 7
    return p0
.end method

.method public Vc()V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;->o2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Vd()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/d79;->V()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Ve()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/d79;->S()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Vi(Lcom/p1/mobile/android/app/Act;ILjava/lang/Runnable;Ljava/lang/Runnable;Ll/x20;)V
    .locals 4

    .line 1
    new-instance v0, Ll/ugy$a;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/ugy$a;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {v0, v1}, Ll/ugy$a;->A(Z)Ll/ugy$a;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "\u62a2\u5148\u544a\u767d"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/ugy$a;->D(Ljava/lang/String;)Ll/ugy$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    filled-new-array {v2, v1}, [Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const-string v2, "\u672c\u6b21\u4f7f\u7528\u5c06\u6263\u9664 %1s \u63a2\u63a2\u5e01\uff0c%2s\u7528\u5b8c\u4e86\uff0c\u53ef\u4ee5\u7528\u63a2\u63a2\u5e01\u8d2d\u4e70\u66f4\u591a"

    .line 26
    .line 27
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    filled-new-array {p2}, [Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    invoke-static {p2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    const-string v2, "#fe7e1d"

    .line 44
    .line 45
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    const/4 v3, 0x3

    .line 50
    invoke-static {v3}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    invoke-static {v1, p2, v2, v3}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    invoke-virtual {v0, p2}, Ll/ugy$a;->C(Ljava/lang/CharSequence;)Ll/ugy$a;

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Xp:I

    .line 63
    .line 64
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    new-instance v1, Ll/dta;

    .line 69
    .line 70
    invoke-direct {v1, p5}, Ll/dta;-><init>(Ll/x20;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p2, v0, v1}, Ll/ugy$a;->x(Ljava/lang/CharSequence;Ll/y20;)Ll/ugy$a;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    sget p5, Lcom/p1/mobile/putong/core/R$string;->c:I

    .line 78
    .line 79
    invoke-virtual {p1, p5}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p5

    .line 83
    new-instance v0, Ll/eta;

    .line 84
    .line 85
    invoke-direct {v0, p4}, Ll/eta;-><init>(Ljava/lang/Runnable;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p2, p5, v0}, Ll/ugy$a;->v(Ljava/lang/CharSequence;Ll/y20;)Ll/ugy$a;

    .line 89
    .line 90
    .line 91
    move-result-object p2

    .line 92
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 93
    .line 94
    .line 95
    move-result-object p4

    .line 96
    invoke-virtual {p4}, Ll/a5i0;->C0()Z

    .line 97
    .line 98
    .line 99
    move-result p4

    .line 100
    invoke-virtual {p2, p4}, Ll/ugy$a;->z(Z)Ll/ugy$a;

    .line 101
    .line 102
    .line 103
    move-result-object p2

    .line 104
    sget p4, Lcom/p1/mobile/putong/core/R$string;->dm:I

    .line 105
    .line 106
    new-instance p5, Ll/fta;

    .line 107
    .line 108
    invoke-direct {p5}, Ll/fta;-><init>()V

    .line 109
    .line 110
    .line 111
    invoke-virtual {p2, p4, p5}, Ll/ugy$a;->w(ILandroid/widget/CompoundButton$OnCheckedChangeListener;)Ll/ugy$a;

    .line 112
    .line 113
    .line 114
    move-result-object p2

    .line 115
    new-instance p4, Ll/wsa;

    .line 116
    .line 117
    invoke-direct {p4, p3}, Ll/wsa;-><init>(Ljava/lang/Runnable;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {p2, p4}, Ll/ugy$a;->B(Landroid/content/DialogInterface$OnDismissListener;)Ll/ugy$a;

    .line 121
    .line 122
    .line 123
    move-result-object p2

    .line 124
    invoke-virtual {p2}, Ll/ugy$a;->t()Ll/ugy;

    .line 125
    .line 126
    .line 127
    move-result-object p2

    .line 128
    invoke-virtual {p2}, Ll/ugy;->g()Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    .line 129
    .line 130
    .line 131
    move-result-object p3

    .line 132
    const/4 p4, 0x1

    .line 133
    invoke-virtual {p0, p1, p3, p4}, Lcom/p1/mobile/putong/core/module/CoreProviderImpl;->T(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;Z)Landroid/view/View;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    invoke-virtual {p2}, Ll/ugy;->g()Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    const/high16 p3, 0x40800000    # 4.0f

    .line 142
    .line 143
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 144
    .line 145
    .line 146
    move-result p3

    .line 147
    invoke-virtual {p1, p3}, Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;->m0(I)Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;->G(Landroid/view/View;)Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    .line 152
    .line 153
    .line 154
    invoke-virtual {p2}, Ll/ugy;->g()Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    const p1, 0x439b8000    # 311.0f

    .line 159
    .line 160
    .line 161
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 162
    .line 163
    .line 164
    move-result p1

    .line 165
    const/high16 p3, 0x437d0000    # 253.0f

    .line 166
    .line 167
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 168
    .line 169
    .line 170
    move-result p3

    .line 171
    const-string p4, "https://static.tancdn.com/pe-webplatform/6Vkj-PyPISwgtkC-5PLdu3Q4.webp"

    .line 172
    .line 173
    invoke-virtual {p0, p4, p1, p3}, Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;->E(Ljava/lang/String;II)Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    .line 174
    .line 175
    .line 176
    invoke-virtual {p2}, Ll/ugy;->n()V

    .line 177
    .line 178
    .line 179
    return-void
.end method

.method public Vj(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinCheckstandAct;->Y1(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Vn(Ll/ner;Ll/x20;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/xzc0;->r()Ll/xzc0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2}, Ll/xzc0;->K(Ll/ner;Ll/x20;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public Vq(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {}, Ll/o3z;->g()Ll/o3z;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/o3z;->e(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public W7()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "group"

    .line 2
    .line 3
    return-object p0
.end method

.method public W8()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->P()Lcom/p1/mobile/putong/core/data/ChatRoundsDisplayedExternallyConfig;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/ChatRoundsDisplayedExternallyConfig;->enabled:Z

    .line 10
    .line 11
    return p0
.end method

.method public Wb(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/core/newui/appeal/AppealProgressAct;->a2(Landroid/content/Context;Z)Landroid/content/Intent;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public Wc(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Z
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->payCardStyle:Ljava/lang/String;

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
    const-string p0, "chat"

    .line 16
    .line 17
    iget-object v0, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->payCardStyle:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-nez p0, :cond_1

    .line 24
    .line 25
    :cond_0
    sget-object p0, Ll/f760;->Companion:Ll/f760$a;

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ll/f760$a;->k(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_2

    .line 32
    .line 33
    :cond_1
    const/4 p0, 0x1

    .line 34
    return p0

    .line 35
    :cond_2
    const/4 p0, 0x0

    .line 36
    return p0
.end method

.method public Wg()I
    .locals 0

    .line 1
    sget-object p0, Ll/baj;->p:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public Wj()Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public Wk()I
    .locals 0

    .line 1
    const/16 p0, 0x14

    return p0
.end method

.method public X5()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->X2()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public X9()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->r3()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Xb(I)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/gp/a;->j()Lcom/p1/mobile/putong/core/ui/gp/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/gp/a;->t(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public Xf(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/nwb;->f(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Xj(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/pza0;->f(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Xk()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->J2()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Xl(I)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ll/ey6;->i(I)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Xs(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;Ll/x20;)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3}, Ll/xc20;->r(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;Ll/x20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Y7(Lcom/p1/mobile/putong/data/Envelope;Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public Ye()I
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->k()Lcom/p1/mobile/putong/core/data/CollapsibleConversationConfig;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget p0, p0, Lcom/p1/mobile/putong/core/data/CollapsibleConversationConfig;->ignore_msg_days:I

    .line 6
    .line 7
    return p0
.end method

.method public Yh()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public Ym(Lcom/p1/mobile/putong/data/Profile;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/dy90;->X(Lcom/p1/mobile/putong/data/Profile;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Z5(Lcom/p1/mobile/putong/data/User;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ll/tje0;->k(Lcom/p1/mobile/putong/data/User;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Zc(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/gs50;->O()Ll/gs50;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2}, Ll/gs50;->H(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public Ze()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public Zg()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/baj;->v()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public ac(Landroid/app/Activity;)Ljava/lang/String;
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/clz;->r3()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    instance-of p0, p1, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 17
    .line 18
    if-eqz p0, :cond_1

    .line 19
    .line 20
    check-cast p1, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->e2()Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/a;->R0()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0

    .line 31
    :cond_1
    const/4 p0, 0x0

    .line 32
    return-object p0
.end method

.method public af()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Ll/jek;->m()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public ag(Landroid/app/Activity;)V
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;

    .line 2
    .line 3
    if-nez p0, :cond_1

    .line 4
    .line 5
    instance-of p0, p1, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 6
    .line 7
    if-nez p0, :cond_1

    .line 8
    .line 9
    instance-of p0, p1, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopFragAct;

    .line 10
    .line 11
    if-nez p0, :cond_1

    .line 12
    .line 13
    instance-of p0, p1, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditAct;

    .line 14
    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    return-void

    .line 19
    :cond_1
    :goto_0
    invoke-virtual {p1}, Landroid/app/Activity;->finish()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public ak()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->G2()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public am()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/o2c;->f()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public aq()Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/match/a;->w()Lcom/p1/mobile/putong/core/ui/match/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/a;->n()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public ar()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/uih0;->m0()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public b()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/vq8;->b()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bh(Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/upm;->b0(Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bm()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/ts9;->d()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bn()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/o2c;->g()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bp(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, p1, p2, p3, v0}, Ll/aw90;->P(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public bq()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public c()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public cp()V
    .locals 0

    .line 1
    invoke-static {}, Ll/uih0;->s0()Ll/uih0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/uih0;->V0()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public ct()Ljava/lang/Integer;
    .locals 0

    .line 1
    sget p0, Ll/xfc0;->b:I

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public d(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/ey6;->b(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public d4()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public d7()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->v1()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public da(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Message;)Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/rum;->c(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Message;)Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public df()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->l3()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public dq()I
    .locals 0

    .line 1
    invoke-static {}, Ll/a5i0;->x0()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public e()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public ed()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/d79;->N()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public ee(Lcom/p1/mobile/android/app/Act;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->I2()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public ep()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/d79;->p()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public er()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/qap;->i()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public f()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public f7()V
    .locals 0

    .line 1
    invoke-static {}, Ll/upm;->i0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public f8()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->D3()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public fa(Ljava/lang/String;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/baj;->q(Ljava/lang/String;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public fd()I
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->G()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public fi()Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Ll/c7d0;->b:Ll/wyd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/String;

    .line 8
    .line 9
    return-object p0
.end method

.method public g()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/rum0;->c()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public g5(Landroid/content/Context;Ljava/util/List;)Lrx/c;
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;)",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;>;"
        }
    .end annotation

    .line 1
    invoke-static {p1, p2}, Ll/cjj;->M(Landroid/content/Context;Ljava/util/List;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public g7(Lcom/p1/mobile/putong/data/User;)Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/User;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/baj;->y(Lcom/p1/mobile/putong/data/User;)Ljava/util/ArrayList;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public g8()Z
    .locals 0

    .line 1
    sget-boolean p0, Ll/b240;->X0:Z

    .line 2
    .line 3
    return p0
.end method

.method public gb()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public getMainActIntent(Landroid/content/Context;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/xwa;->e(Landroid/content/Context;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public gf(Lcom/p1/mobile/putong/data/User;)Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/User;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/baj;->u(Lcom/p1/mobile/putong/data/User;)Ljava/util/ArrayList;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public gm()Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 0

    .line 1
    sget-object p0, Ll/d79;->r:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    return-object p0
.end method

.method public gn()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->F0()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public go()Ljava/lang/Double;
    .locals 0

    .line 1
    invoke-static {}, Ll/rm50;->c()Ljava/lang/Double;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public gq()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/ts9;->c()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public gs()V
    .locals 0

    .line 1
    invoke-static {}, Ll/upm;->h0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public gt(Lcom/p1/mobile/putong/data/User;)Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/User;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/baj;->B(Lcom/p1/mobile/putong/data/User;)Ljava/util/ArrayList;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public h()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Ll/syu;->h()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public h5()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public h6(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/xzm0;->p()Ll/xzm0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/xzm0;->w(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public hf(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ll/baj;->O(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public hh(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/uih0;->s0()Ll/uih0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/uih0;->x0(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public hi(Lcom/p1/mobile/android/app/Act;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 2
    .line 3
    if-nez p0, :cond_1

    .line 4
    .line 5
    instance-of p0, p1, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;

    .line 6
    .line 7
    if-nez p0, :cond_1

    .line 8
    .line 9
    instance-of p0, p1, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;

    .line 10
    .line 11
    if-nez p0, :cond_1

    .line 12
    .line 13
    instance-of p0, p1, Lcom/p1/mobile/putong/core/ui/mediapreview/CommonMediaPreviewAct;

    .line 14
    .line 15
    if-nez p0, :cond_1

    .line 16
    .line 17
    instance-of p0, p1, Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 18
    .line 19
    if-nez p0, :cond_1

    .line 20
    .line 21
    instance-of p0, p1, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPreviewAct;

    .line 22
    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return p0

    .line 28
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 29
    return p0
.end method

.method public hs(Landroid/content/Context;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/operation/OperationCenterAct;->Z1(Landroid/content/Context;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public i()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public ib()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/spl0;->k()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public ic()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method

.method public id(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    const-string p0, "p_home_filter,advanced"

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->advanced_filter:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 4
    .line 5
    invoke-static {p1, p0, v0}, Lcom/p1/mobile/putong/core/ui/purchase/c;->n1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public ig()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/a5i0;->L1()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public init(Landroid/content/Context;)V
    .locals 0

    return-void
.end method

.method public ip(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/purchase/c;->n1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public iq()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/d79;->w()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public ir()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method

.method public is()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public j()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public j3()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public j6(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Landroid/content/Intent;
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    invoke-static {p1, p2, p0}, Lcom/p1/mobile/putong/core/newui/cropiwa/NewCropperAct;->G1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public jd(I)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/gp/a;->j()Lcom/p1/mobile/putong/core/ui/gp/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 p1, 0x1

    .line 6
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/gp/a;->s(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public jf(Lcom/p1/mobile/android/app/Act;ILjava/lang/Runnable;Ljava/lang/Runnable;Ll/x20;)V
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I5()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const-string v0, "\u62a2\u5148\u544a\u767d"

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const-string v0, "\u6253\u62db\u547c"

    .line 17
    .line 18
    :goto_0
    new-instance v1, Ll/ugy$a;

    .line 19
    .line 20
    invoke-direct {v1, p1}, Ll/ugy$a;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 21
    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    invoke-virtual {v1, v2}, Ll/ugy$a;->A(Z)Ll/ugy$a;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v1, v0}, Ll/ugy$a;->D(Ljava/lang/String;)Ll/ugy$a;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    filled-new-array {v3, v0}, [Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    const-string v3, "\u672c\u6b21\u4f7f\u7528\u5c06\u6263\u9664 %1s \u63a2\u63a2\u5e01\uff0c%2s\u7528\u5b8c\u4e86\uff0c\u53ef\u4ee5\u7528\u63a2\u63a2\u5e01\u8d2d\u4e70\u66f4\u591a"

    .line 41
    .line 42
    invoke-static {v3, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    filled-new-array {p2}, [Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    invoke-static {p2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    const-string v3, "#fe7e1d"

    .line 59
    .line 60
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 61
    .line 62
    .line 63
    move-result v3

    .line 64
    const/4 v4, 0x3

    .line 65
    invoke-static {v4}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    invoke-static {v0, p2, v3, v4}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    invoke-virtual {v1, p2}, Ll/ugy$a;->C(Ljava/lang/CharSequence;)Ll/ugy$a;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Xp:I

    .line 78
    .line 79
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    new-instance v1, Ll/xsa;

    .line 84
    .line 85
    invoke-direct {v1, p5}, Ll/xsa;-><init>(Ll/x20;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p2, v0, v1}, Ll/ugy$a;->x(Ljava/lang/CharSequence;Ll/y20;)Ll/ugy$a;

    .line 89
    .line 90
    .line 91
    move-result-object p2

    .line 92
    sget p5, Lcom/p1/mobile/putong/core/R$string;->c:I

    .line 93
    .line 94
    invoke-virtual {p1, p5}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p5

    .line 98
    new-instance v0, Ll/ysa;

    .line 99
    .line 100
    invoke-direct {v0, p4}, Ll/ysa;-><init>(Ljava/lang/Runnable;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {p2, p5, v0}, Ll/ugy$a;->v(Ljava/lang/CharSequence;Ll/y20;)Ll/ugy$a;

    .line 104
    .line 105
    .line 106
    move-result-object p2

    .line 107
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 108
    .line 109
    .line 110
    move-result-object p4

    .line 111
    invoke-virtual {p4}, Ll/a5i0;->I0()Z

    .line 112
    .line 113
    .line 114
    move-result p4

    .line 115
    invoke-virtual {p2, p4}, Ll/ugy$a;->z(Z)Ll/ugy$a;

    .line 116
    .line 117
    .line 118
    move-result-object p2

    .line 119
    sget p4, Lcom/p1/mobile/putong/core/R$string;->dm:I

    .line 120
    .line 121
    new-instance p5, Ll/zsa;

    .line 122
    .line 123
    invoke-direct {p5}, Ll/zsa;-><init>()V

    .line 124
    .line 125
    .line 126
    invoke-virtual {p2, p4, p5}, Ll/ugy$a;->w(ILandroid/widget/CompoundButton$OnCheckedChangeListener;)Ll/ugy$a;

    .line 127
    .line 128
    .line 129
    move-result-object p2

    .line 130
    new-instance p4, Ll/ata;

    .line 131
    .line 132
    invoke-direct {p4, p3}, Ll/ata;-><init>(Ljava/lang/Runnable;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {p2, p4}, Ll/ugy$a;->B(Landroid/content/DialogInterface$OnDismissListener;)Ll/ugy$a;

    .line 136
    .line 137
    .line 138
    move-result-object p2

    .line 139
    invoke-virtual {p2}, Ll/ugy$a;->t()Ll/ugy;

    .line 140
    .line 141
    .line 142
    move-result-object p2

    .line 143
    invoke-virtual {p2}, Ll/ugy;->g()Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    .line 144
    .line 145
    .line 146
    move-result-object p3

    .line 147
    invoke-virtual {p0, p1, p3, v2}, Lcom/p1/mobile/putong/core/module/CoreProviderImpl;->T(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;Z)Landroid/view/View;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    invoke-virtual {p2}, Ll/ugy;->g()Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    .line 152
    .line 153
    .line 154
    move-result-object p1

    .line 155
    const/high16 p3, 0x40800000    # 4.0f

    .line 156
    .line 157
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 158
    .line 159
    .line 160
    move-result p3

    .line 161
    invoke-virtual {p1, p3}, Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;->m0(I)Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;->G(Landroid/view/View;)Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    .line 166
    .line 167
    .line 168
    invoke-static {}, Ll/spl0;->U()Z

    .line 169
    .line 170
    .line 171
    move-result p0

    .line 172
    if-eqz p0, :cond_1

    .line 173
    .line 174
    invoke-virtual {p2}, Ll/ugy;->g()Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    .line 175
    .line 176
    .line 177
    move-result-object p0

    .line 178
    const p1, 0x439b8000    # 311.0f

    .line 179
    .line 180
    .line 181
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 182
    .line 183
    .line 184
    move-result p1

    .line 185
    const/high16 p3, 0x437d0000    # 253.0f

    .line 186
    .line 187
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 188
    .line 189
    .line 190
    move-result p3

    .line 191
    const-string p4, "https://static.tancdn.com/pe-webplatform/6Vkj-PyPISwgtkC-5PLdu3Q4.webp"

    .line 192
    .line 193
    invoke-virtual {p0, p4, p1, p3}, Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;->E(Ljava/lang/String;II)Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    .line 194
    .line 195
    .line 196
    goto :goto_1

    .line 197
    :cond_1
    invoke-virtual {p2}, Ll/ugy;->g()Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    .line 198
    .line 199
    .line 200
    move-result-object p0

    .line 201
    sget p1, Ll/dbc0;->yp:I

    .line 202
    .line 203
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;->B(I)Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    .line 204
    .line 205
    .line 206
    :goto_1
    invoke-virtual {p2}, Ll/ugy;->n()V

    .line 207
    .line 208
    .line 209
    return-void
.end method

.method public jm()I
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/match/a;->w()Lcom/p1/mobile/putong/core/ui/match/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/a;->B()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public jo(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/uih0;->s0()Ll/uih0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/uih0;->e1(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public jq(Z)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/match/a;->w()Lcom/p1/mobile/putong/core/ui/match/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/match/a;->Q(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public js()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/ytk;->b()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public jt(Ljava/lang/Long;)I
    .locals 2

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 6
    .line 7
    .line 8
    move-result-wide p0

    .line 9
    invoke-static {v0, v1, p0, p1}, Ll/iz40;->t(JJ)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public k()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public k6()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public k8()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->H1()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public ka()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/zg6;->e()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public kc()Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/fake/b;->r()Lcom/p1/mobile/putong/core/newui/fake/b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/fake/b;->n()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public kd(Ljava/lang/Throwable;)Ljava/lang/Throwable;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/ey6;->a(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public kf(Ljava/util/List;Ljava/util/List;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    .line 1
    invoke-static {p1, p2}, Ll/baj;->Q(Ljava/util/List;Ljava/util/List;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public kl()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-boolean p0, p0, Ll/aw90;->b:Z

    .line 6
    .line 7
    return p0
.end method

.method public km()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public l()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public l7(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p1, p2, v0, v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->k2(Landroid/content/Context;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 3
    .line 4
    .line 5
    move-result-object p2

    .line 6
    new-instance v0, Lcom/p1/mobile/putong/core/module/CoreProviderImpl$a;

    .line 7
    .line 8
    invoke-direct {v0, p0, p1}, Lcom/p1/mobile/putong/core/module/CoreProviderImpl$a;-><init>(Lcom/p1/mobile/putong/core/module/CoreProviderImpl;Lcom/p1/mobile/android/app/Act;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1, p2, v0}, Lcom/p1/mobile/android/app/Act;->startActivityForResult(Landroid/content/Intent;Lcom/p1/mobile/android/app/a$a;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public lb()V
    .locals 0

    .line 1
    return-void
.end method

.method public lj(J)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/upm;->W(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public lk()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->Z2()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public ll(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/uih0;->s0()Ll/uih0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/uih0;->d1(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public m(Ljava/util/List;Ljava/util/List;)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    invoke-static {p1, p2}, Ll/baj;->M(Ljava/util/List;Ljava/util/List;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public m3()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public md(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZ)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static/range {p1 .. p6}, Ll/xwa;->A(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZ)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public mj()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->r1()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public mk(Ljava/util/List;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/GPTopicCard;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/GPTopicCard;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/ljj;->b(Ljava/util/List;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public newMainActClearStack(Landroid/content/Context;Z)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->S5(Landroid/content/Context;Z)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public nj(Ljava/util/List;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Live;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {p1, p2}, Ll/f4s;->b(Ljava/util/List;Ljava/util/List;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public nn(Ljava/lang/String;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Purpose;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/baj;->E(Ljava/lang/String;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public no(Z)V
    .locals 0

    .line 1
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iput-boolean p1, p0, Ll/aw90;->b:Z

    .line 6
    .line 7
    return-void
.end method

.method public np(Lcom/p1/mobile/android/app/Act;Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2}, Ll/aw90;->u0(Lcom/p1/mobile/android/app/Act;Ll/y20;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public o()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->A1()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public o8(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Message;)Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/rum;->a(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Message;)Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public o9()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public ob(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->bd(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public oe()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/wrf0;->g()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public ol()Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->q2:Ll/ura;

    .line 4
    .line 5
    iget-object p0, p0, Ll/ura;->Z:Ljava/lang/String;

    .line 6
    .line 7
    return-object p0
.end method

.method public oq()Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->m0()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public os()D
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public p()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->a2()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public p0()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->y2()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public pb()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/t450;->h()Ll/t450;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/t450;->g()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public ph(Lcom/p1/mobile/android/app/Act$r;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->s2(Lcom/p1/mobile/android/app/Act$r;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public pn()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method

.method public q()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public q0()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->J3()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public qa(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/o2c;->i(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public qc(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->R(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public qe()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->F3()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_1

    .line 6
    .line 7
    invoke-static {}, Ll/gra;->o2()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method public qf()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/aw90;->S()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public qi()I
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->Q()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public qq()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/d79;->L()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public qr(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {}, Ll/z5h0;->j()Ll/z5h0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Ll/z5h0;->m:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public r(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    new-instance p0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v0, Lcom/p1/mobile/putong/core/ui/settings/log/SelectLogTimeAct;

    .line 4
    .line 5
    invoke-direct {p0, p1, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public r7(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/cl80;->e()Ll/cl80;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ll/gyp;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Ll/gyp;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0}, Ll/al80;->a(Ll/f3m;)Ll/al80;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p0, p1}, Ll/cl80;->q(Ll/al80;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public rf(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinOtherAct;->b2(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public rm(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p2}, Lcom/p1/mobile/putong/data/NavigationIntent;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/NavigationIntent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->M5(Landroid/content/Context;Lcom/p1/mobile/putong/data/NavigationIntent;)Landroid/content/Intent;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public rs()I
    .locals 0

    .line 1
    invoke-static {}, Ll/a5i0;->x0()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public rt()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/tmh0;->z0()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public s()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->h3()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public s3()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public sa()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->S2()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public sn()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public t()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public t8()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/quq;->I()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public t9()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->O()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public tb(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/CoreGiftInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/uie;->b()Ll/uie;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/uie;->e(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public th(Lcom/p1/mobile/android/app/Act;)Landroid/content/Intent;
    .locals 1

    .line 1
    const/4 p0, 0x0

    .line 2
    const/4 v0, 0x1

    .line 3
    invoke-static {p1, p0, v0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->T5(Landroid/content/Context;ZZ)Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public ti(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ll/baj;->P(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public tl()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public tm(Lcom/p1/mobile/putong/data/User;)Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/User;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/baj;->G(Lcom/p1/mobile/putong/data/User;)Ljava/util/ArrayList;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public tp()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public u()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public uc()I
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->A3()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public ui()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->m2()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public uj()Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Ll/pza0;->z:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public v()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public vd(Lcom/p1/mobile/android/app/Frag;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 2
    .line 3
    if-nez p0, :cond_1

    .line 4
    .line 5
    instance-of p0, p1, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0

    .line 12
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 13
    return p0
.end method

.method public ve(Lcom/p1/mobile/putong/data/User;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ll/d79;->W(Lcom/p1/mobile/putong/data/User;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public vi()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public vp()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public w()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->L3()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public wl()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "VirtualCard"

    .line 2
    .line 3
    return-object p0
.end method

.method public x()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public x3()Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->x3()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public xc(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iput-object p1, p0, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    return-void
.end method

.method public xd(Z)V
    .locals 0

    .line 1
    invoke-static {}, Ll/t450;->h()Ll/t450;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/t450;->n(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public xe()V
    .locals 0

    .line 1
    invoke-static {}, Ll/vih0;->c()Ll/vih0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/vih0;->j()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public xh()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->Y1()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public xi()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public xq(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static/range {p1 .. p6}, Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;->Y1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public xr()Ljava/lang/Class;
    .locals 0

    .line 1
    const-class p0, Lcom/p1/mobile/putong/core/ui/account/AccountInactiveTipAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public y()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->P1()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public y6()I
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->j1()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public yg()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public yh()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/uih0;->s0()Ll/uih0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/uih0;->T0()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public ym()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/eu4;->b()Ll/eu4;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/eu4;->h()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public ys()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public yt()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public z(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ll/vb0;->h(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public z1()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public zk()V
    .locals 0

    .line 1
    invoke-static {}, Ll/xzc0;->r()Ll/xzc0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/xzc0;->J()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public zm(Landroid/content/Context;ZZ)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->T5(Landroid/content/Context;ZZ)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public zs(Ljava/util/List;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Voice;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {p1, p2}, Ll/g4n0;->b(Ljava/util/List;Ljava/util/List;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public zt()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Ch:I

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
