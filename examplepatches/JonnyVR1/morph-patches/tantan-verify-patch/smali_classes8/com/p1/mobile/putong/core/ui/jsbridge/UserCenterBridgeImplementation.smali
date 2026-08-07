.class public Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;
.super Ll/lf2;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/lf2;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic A(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;Ll/xc00;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->N0(Ll/xc00;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic B(ZLcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/data/EditTagsData;
    .locals 1

    .line 1
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1, p0}, Ll/gj40;->n(Lcom/p1/mobile/putong/data/User;Z)Lcom/p1/mobile/putong/core/data/EditTagsData;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic C(Lcom/p1/mobile/putong/core/data/EditTagsData;Lcom/p1/mobile/putong/core/data/UserTagData;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/UserTagData;->status:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "offline"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/EditTagsData;->selectedTags:Ljava/util/List;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/UserTagData;->id:Ljava/lang/String;

    .line 14
    .line 15
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public static synthetic D(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;Ll/xc00;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->i1(Ll/xc00;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;Ll/xc00;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->K0(Ll/xc00;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static synthetic F(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;Ll/xc00;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->c1(Ll/xc00;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic G(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;Ll/xc00;Ljava/lang/String;ZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->V0(Ll/xc00;Ljava/lang/String;ZLjava/lang/String;)V

    return-void
.end method

.method public static synthetic H(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;Ll/xc00;Ljava/lang/String;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->f1(Ll/xc00;Ljava/lang/String;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic I(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;Ll/xc00;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->a1(Ll/xc00;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic J(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;Ll/xc00;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->P0(Ll/xc00;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic K(Ll/xc00;Ljava/lang/String;Ll/uxj0;)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p0}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v6, 0x0

    .line 10
    const/16 v7, 0x26

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    const/4 v3, 0x0

    .line 14
    const/4 v4, 0x0

    .line 15
    const/4 v5, 0x0

    .line 16
    move-object v1, p1

    .line 17
    invoke-static/range {v0 .. v7}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->p2(Landroid/content/Context;Ljava/lang/String;ZZZZLandroid/content/Intent;I)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p2, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 22
    .line 23
    .line 24
    const/4 p1, 0x0

    .line 25
    invoke-static {p1}, Ll/upm;->Z(Z)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public static synthetic L(Ll/xc00;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xc00;->d()Ll/hqq;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "likeResultsFromProfile"

    .line 6
    .line 7
    filled-new-array {p1}, [Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-interface {p0, v0, p1}, Ll/hqq;->b(Ljava/lang/String;[Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic M(Lcom/p1/mobile/putong/core/data/EditTagsData;Lcom/p1/mobile/putong/core/data/UserTagData;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/UserTagData;->gender:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "male"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/EditTagsData;->selectedTags:Ljava/util/List;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/UserTagData;->id:Ljava/lang/String;

    .line 14
    .line 15
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public static synthetic N(Ll/xc00;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xc00;->d()Ll/hqq;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "dislikeFromProfile"

    .line 6
    .line 7
    filled-new-array {p1}, [Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-interface {p0, v0, p1}, Ll/hqq;->b(Ljava/lang/String;[Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic O(Lcom/p1/mobile/putong/data/User;)Lrx/c;
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 8
    .line 9
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Ll/dkb;->u9(Lcom/p1/mobile/putong/data/User;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;Ll/xc00;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/EditTagsData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->O0(Ll/xc00;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/EditTagsData;)V

    return-void
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;Ll/xc00;Ljava/lang/String;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->Z0(Ll/xc00;Ljava/lang/String;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic R(ZLl/xc00;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-static {}, Ll/joa;->M3()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    const-string p2, "p_suggest_user_profile_info_view,e_profile_comment_button,click"

    .line 22
    .line 23
    sget-object p3, Lcom/p1/mobile/putong/core/data/Privilege;->see_who_likes_me:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 24
    .line 25
    invoke-interface {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->pr(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const/4 v1, 0x0

    .line 38
    invoke-interface {p0, v0, p2, p3, v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Ar(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    const-string p3, "profile_like_id"

    .line 43
    .line 44
    invoke-virtual {p0, p3, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 48
    .line 49
    .line 50
    move-result-object p3

    .line 51
    new-instance p4, Ll/rdk0;

    .line 52
    .line 53
    invoke-direct {p4, p2, p1}, Ll/rdk0;-><init>(Ljava/lang/String;Ll/xc00;)V

    .line 54
    .line 55
    .line 56
    const/16 p1, 0x3e7

    .line 57
    .line 58
    invoke-virtual {p3, p1, p0, p4}, Lcom/p1/mobile/android/app/Act;->startActivityForResult(ILandroid/content/Intent;Lcom/p1/mobile/android/app/a$a;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public static synthetic S(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;Ll/xc00;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->S0(Ll/xc00;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic T(Lcom/p1/mobile/putong/core/data/EditTagsData;Lcom/p1/mobile/putong/core/data/UserTagData;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/UserTagData;->gender:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "male"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/EditTagsData;->selectedTags:Ljava/util/List;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/UserTagData;->id:Ljava/lang/String;

    .line 14
    .line 15
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public static synthetic U(Lcom/p1/mobile/putong/core/data/EditTagsData;Lcom/p1/mobile/putong/core/data/UserTagData;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/UserTagData;->gender:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "female"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/EditTagsData;->selectedTags:Ljava/util/List;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/UserTagData;->id:Ljava/lang/String;

    .line 14
    .line 15
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public static synthetic V(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;Ll/xc00;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->U0(Ll/xc00;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic W(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;Ll/xc00;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/EditTagsData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->M0(Ll/xc00;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/EditTagsData;)V

    return-void
.end method

.method public static synthetic X(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;Ll/xc00;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->b1(Ll/xc00;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static synthetic Y(Lcom/p1/mobile/putong/data/User;)Ljava/util/ArrayList;
    .locals 4

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Lcom/p1/mobile/putong/data/Media;

    .line 23
    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    iget-object v2, v1, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 27
    .line 28
    const-string v3, "image/"

    .line 29
    .line 30
    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-eqz v2, :cond_0

    .line 35
    .line 36
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    return-object v0
.end method

.method public static synthetic Z(Lcom/p1/mobile/putong/data/User;)Lrx/c;
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 8
    .line 9
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Ll/dkb;->u9(Lcom/p1/mobile/putong/data/User;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public static synthetic a0(Ll/xc00;ZLcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/data/UserTagsData;
    .locals 1

    .line 1
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {v0, p0, p2, p1}, Ll/gj40;->A(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Z)Lcom/p1/mobile/putong/core/data/UserTagsData;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic b0(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;Ll/xc00;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->R0(Ll/xc00;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;Ll/xc00;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->J0(Ll/xc00;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic c0(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;Ll/xc00;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/UserTagsData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->T0(Ll/xc00;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/UserTagsData;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;Ll/xc00;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->L0(Ll/xc00;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic d0(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;
    .locals 4

    .line 1
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 8
    .line 9
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Interest;->tags:Ljava/util/List;

    .line 12
    .line 13
    const-string v2, "add"

    .line 14
    .line 15
    invoke-static {p0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    const/4 v3, 0x0

    .line 20
    if-eqz v2, :cond_0

    .line 21
    .line 22
    invoke-interface {v1, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-nez p0, :cond_1

    .line 27
    .line 28
    invoke-interface {v1, v3, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Interest;->tags:Ljava/util/List;

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    const-string v2, "delete"

    .line 41
    .line 42
    invoke-static {p0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    if-eqz p0, :cond_1

    .line 47
    .line 48
    invoke-interface {v1, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    if-eqz p0, :cond_1

    .line 53
    .line 54
    invoke-interface {v1, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 60
    .line 61
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 62
    .line 63
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Interest;->tags:Ljava/util/List;

    .line 64
    .line 65
    :cond_1
    :goto_0
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    if-eqz p0, :cond_2

    .line 70
    .line 71
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 72
    .line 73
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 74
    .line 75
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 76
    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_2
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-virtual {p0, v1}, Ll/gj40;->P(Ljava/util/List;)Ll/gj40$h;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result p1

    .line 91
    if-eqz p1, :cond_3

    .line 92
    .line 93
    iget-boolean p1, p0, Ll/gj40$h;->a:Z

    .line 94
    .line 95
    if-eqz p1, :cond_3

    .line 96
    .line 97
    invoke-virtual {p0}, Ll/gj40$h;->b()Ljava/util/List;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    const/16 v1, 0xa

    .line 106
    .line 107
    invoke-static {p1, v1}, Ljava/lang/Math;->min(II)I

    .line 108
    .line 109
    .line 110
    move-result p1

    .line 111
    invoke-interface {p0, v3, p1}, Ljava/util/List;->subList(II)Ljava/util/List;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    iget-object p1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 116
    .line 117
    new-instance v1, Ll/kck0;

    .line 118
    .line 119
    invoke-direct {v1}, Ll/kck0;-><init>()V

    .line 120
    .line 121
    .line 122
    invoke-static {p0, v1}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 127
    .line 128
    :cond_3
    :goto_1
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/data/User;->subtract(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    return-object p0
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;Ll/xc00;Ljava/lang/String;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->Q0(Ll/xc00;Ljava/lang/String;Ljava/util/ArrayList;)V

    return-void
.end method

.method public static synthetic e0(Lcom/p1/mobile/putong/core/data/EditTagsData;)Lcom/p1/mobile/putong/core/data/EditTagsData;
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_2

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/EditTagsData;->tags:Ljava/util/List;

    .line 16
    .line 17
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_2

    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/EditTagsData;->tags:Ljava/util/List;

    .line 24
    .line 25
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 28
    .line 29
    invoke-virtual {v1}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 34
    .line 35
    const-string v2, "female"

    .line 36
    .line 37
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-eqz v2, :cond_0

    .line 42
    .line 43
    new-instance v2, Ll/pdk0;

    .line 44
    .line 45
    invoke-direct {v2, p0}, Ll/pdk0;-><init>(Lcom/p1/mobile/putong/core/data/EditTagsData;)V

    .line 46
    .line 47
    .line 48
    invoke-static {v0, v2}, Ll/jyb;->d0(Ljava/util/List;Ll/qcj;)I

    .line 49
    .line 50
    .line 51
    :cond_0
    const-string v2, "male"

    .line 52
    .line 53
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-eqz v1, :cond_1

    .line 58
    .line 59
    new-instance v1, Ll/qdk0;

    .line 60
    .line 61
    invoke-direct {v1, p0}, Ll/qdk0;-><init>(Lcom/p1/mobile/putong/core/data/EditTagsData;)V

    .line 62
    .line 63
    .line 64
    invoke-static {v0, v1}, Ll/jyb;->d0(Ljava/util/List;Ll/qcj;)I

    .line 65
    .line 66
    .line 67
    :cond_1
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/EditTagsData;->tags:Ljava/util/List;

    .line 68
    .line 69
    :cond_2
    return-object p0
.end method

.method public static synthetic f(Ll/xc00;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/xc00;->d()Ll/hqq;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    filled-new-array {p2}, [Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-interface {p0, p1, p2}, Ll/hqq;->b(Ljava/lang/String;[Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public static synthetic f0(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    new-instance v1, Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-interface {v1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 28
    .line 29
    iput-object v1, p0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->facialFeature:Ljava/util/List;

    .line 30
    .line 31
    :cond_0
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/data/User;->subtract(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;Ll/xc00;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->e1(Ll/xc00;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic g0(Ljava/lang/String;Ll/xc00;IILandroid/content/Intent;)Z
    .locals 7

    .line 1
    const/16 v0, 0x3e7

    .line 2
    .line 3
    if-ne p2, v0, :cond_7

    .line 4
    .line 5
    sget-object p2, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 6
    .line 7
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    const-wide/16 v0, 0x64

    .line 12
    .line 13
    const-string v2, ""

    .line 14
    .line 15
    const-string v3, "state"

    .line 16
    .line 17
    const-string v4, "otherId"

    .line 18
    .line 19
    const/4 v5, 0x1

    .line 20
    if-ne p3, p2, :cond_2

    .line 21
    .line 22
    const-string p2, "userId"

    .line 23
    .line 24
    invoke-virtual {p4, p2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    const-string p3, "action"

    .line 29
    .line 30
    invoke-virtual {p4, p3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p3

    .line 34
    const-string p4, "report"

    .line 35
    .line 36
    invoke-static {p3, p4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result p3

    .line 40
    if-eqz p3, :cond_0

    .line 41
    .line 42
    const-string v2, "reported"

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 46
    .line 47
    .line 48
    move-result-object p3

    .line 49
    invoke-interface {p3, p0}, Ll/qhk0;->getUserById(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    if-eqz p0, :cond_1

    .line 54
    .line 55
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 56
    .line 57
    if-eqz p0, :cond_1

    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    :cond_1
    :goto_0
    new-instance p0, Lorg/json/JSONObject;

    .line 66
    .line 67
    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    .line 68
    .line 69
    .line 70
    :try_start_0
    invoke-virtual {p0, v4, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 74
    .line 75
    .line 76
    :catch_0
    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-static {p0}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 85
    .line 86
    .line 87
    move-result p2

    .line 88
    sub-int/2addr p2, v5

    .line 89
    invoke-virtual {p0, v5, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 94
    .line 95
    .line 96
    move-result-object p2

    .line 97
    new-instance p3, Ll/sdk0;

    .line 98
    .line 99
    invoke-direct {p3, p1, p0}, Ll/sdk0;-><init>(Ll/xc00;Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    invoke-static {p2, p3, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 103
    .line 104
    .line 105
    goto/16 :goto_3

    .line 106
    .line 107
    :cond_2
    sget-object p2, Lcom/p1/mobile/putong/core/data/SwipeDirection;->REMOVE:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 108
    .line 109
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 110
    .line 111
    .line 112
    move-result p2

    .line 113
    const-string v6, "currentUserId"

    .line 114
    .line 115
    if-ne p3, p2, :cond_3

    .line 116
    .line 117
    invoke-virtual {p4, v6}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    new-instance p2, Lorg/json/JSONObject;

    .line 122
    .line 123
    invoke-direct {p2}, Lorg/json/JSONObject;-><init>()V

    .line 124
    .line 125
    .line 126
    :try_start_1
    invoke-virtual {p2, v4, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 127
    .line 128
    .line 129
    const-string p0, "matched"

    .line 130
    .line 131
    invoke-virtual {p2, v3, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 132
    .line 133
    .line 134
    :catch_1
    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    invoke-static {p0}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 143
    .line 144
    .line 145
    move-result p2

    .line 146
    sub-int/2addr p2, v5

    .line 147
    invoke-virtual {p0, v5, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 152
    .line 153
    .line 154
    move-result-object p2

    .line 155
    new-instance p3, Ll/tdk0;

    .line 156
    .line 157
    invoke-direct {p3, p1, p0}, Ll/tdk0;-><init>(Ll/xc00;Ljava/lang/String;)V

    .line 158
    .line 159
    .line 160
    invoke-static {p2, p3, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 161
    .line 162
    .line 163
    goto/16 :goto_3

    .line 164
    .line 165
    :cond_3
    sget-object p2, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 166
    .line 167
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 168
    .line 169
    .line 170
    move-result p2

    .line 171
    const-string v0, "datingProfileAction"

    .line 172
    .line 173
    if-eq p3, p2, :cond_6

    .line 174
    .line 175
    sget-object p2, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 176
    .line 177
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 178
    .line 179
    .line 180
    move-result p2

    .line 181
    if-ne p3, p2, :cond_4

    .line 182
    .line 183
    goto :goto_1

    .line 184
    :cond_4
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 185
    .line 186
    .line 187
    move-result-object p2

    .line 188
    invoke-interface {p2, p0}, Ll/qhk0;->getUserById(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 189
    .line 190
    .line 191
    move-result-object p2

    .line 192
    if-eqz p2, :cond_5

    .line 193
    .line 194
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 195
    .line 196
    if-eqz p2, :cond_5

    .line 197
    .line 198
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 199
    .line 200
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object v2

    .line 204
    :cond_5
    new-instance p2, Lorg/json/JSONObject;

    .line 205
    .line 206
    invoke-direct {p2}, Lorg/json/JSONObject;-><init>()V

    .line 207
    .line 208
    .line 209
    :try_start_2
    invoke-virtual {p2, v4, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 210
    .line 211
    .line 212
    invoke-virtual {p2, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_2

    .line 213
    .line 214
    .line 215
    :catch_2
    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object p0

    .line 219
    invoke-static {p0}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    .line 220
    .line 221
    .line 222
    move-result-object p0

    .line 223
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 224
    .line 225
    .line 226
    move-result p2

    .line 227
    sub-int/2addr p2, v5

    .line 228
    invoke-virtual {p0, v5, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object p0

    .line 232
    invoke-virtual {p1}, Ll/xc00;->d()Ll/hqq;

    .line 233
    .line 234
    .line 235
    move-result-object p1

    .line 236
    filled-new-array {p0}, [Ljava/lang/String;

    .line 237
    .line 238
    .line 239
    move-result-object p0

    .line 240
    invoke-interface {p1, v0, p0}, Ll/hqq;->b(Ljava/lang/String;[Ljava/lang/String;)V

    .line 241
    .line 242
    .line 243
    goto :goto_2

    .line 244
    :cond_6
    :goto_1
    invoke-virtual {p4, v6}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 245
    .line 246
    .line 247
    move-result-object p0

    .line 248
    const-string p2, "relationship_result"

    .line 249
    .line 250
    invoke-virtual {p4, p2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 251
    .line 252
    .line 253
    move-result-object p2

    .line 254
    new-instance p3, Lorg/json/JSONObject;

    .line 255
    .line 256
    invoke-direct {p3}, Lorg/json/JSONObject;-><init>()V

    .line 257
    .line 258
    .line 259
    :try_start_3
    invoke-virtual {p3, v4, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 260
    .line 261
    .line 262
    invoke-virtual {p3, v3, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_3

    .line 263
    .line 264
    .line 265
    :catch_3
    invoke-virtual {p3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 266
    .line 267
    .line 268
    move-result-object p0

    .line 269
    invoke-static {p0}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    .line 270
    .line 271
    .line 272
    move-result-object p0

    .line 273
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 274
    .line 275
    .line 276
    move-result p2

    .line 277
    sub-int/2addr p2, v5

    .line 278
    invoke-virtual {p0, v5, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 279
    .line 280
    .line 281
    move-result-object p0

    .line 282
    invoke-virtual {p1}, Ll/xc00;->d()Ll/hqq;

    .line 283
    .line 284
    .line 285
    move-result-object p1

    .line 286
    filled-new-array {p0}, [Ljava/lang/String;

    .line 287
    .line 288
    .line 289
    move-result-object p0

    .line 290
    invoke-interface {p1, v0, p0}, Ll/hqq;->b(Ljava/lang/String;[Ljava/lang/String;)V

    .line 291
    .line 292
    .line 293
    goto :goto_3

    .line 294
    :cond_7
    :goto_2
    const/4 v5, 0x0

    .line 295
    :goto_3
    return v5
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;Ll/xc00;Ljava/lang/String;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->X0(Ll/xc00;Ljava/lang/String;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic h0(Ll/xc00;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-interface {v0, p0, p1, p2, v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Ar(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p3, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;Ll/xc00;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->g1(Ll/xc00;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic i0(Ll/xc00;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {p0}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    const/4 v3, 0x0

    .line 14
    invoke-interface {v1, v2, p1, p2, v3}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Ar(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    new-instance p2, Ll/jck0;

    .line 19
    .line 20
    invoke-direct {p2, p0}, Ll/jck0;-><init>(Ll/xc00;)V

    .line 21
    .line 22
    .line 23
    const/16 p0, 0x3e7

    .line 24
    .line 25
    invoke-virtual {v0, p0, p1, p2}, Lcom/p1/mobile/android/app/Act;->startActivityForResult(ILandroid/content/Intent;Lcom/p1/mobile/android/app/a$a;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;Ljava/lang/String;Ll/xc00;Ljava/lang/String;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->h1(Ljava/lang/String;Ll/xc00;Ljava/lang/String;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/core/data/NewTags;)Lcom/p1/mobile/putong/data/Tag;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Tag;

    .line 2
    .line 3
    const-string v1, "personality"

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {v0, v1, p0}, Lcom/p1/mobile/putong/data/Tag;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/data/User;)Lrx/c;
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 8
    .line 9
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Ll/dkb;->u9(Lcom/p1/mobile/putong/data/User;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public static synthetic k0(Ll/xc00;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xc00;->d()Ll/hqq;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "datingProfileAction"

    .line 6
    .line 7
    filled-new-array {p1}, [Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-interface {p0, v0, p1}, Ll/hqq;->b(Ljava/lang/String;[Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/core/data/EditTagsData;)Lcom/p1/mobile/putong/core/data/EditTagsData;
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_2

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/EditTagsData;->tags:Ljava/util/List;

    .line 16
    .line 17
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_2

    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/EditTagsData;->tags:Ljava/util/List;

    .line 24
    .line 25
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 28
    .line 29
    invoke-virtual {v1}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 34
    .line 35
    const-string v2, "female"

    .line 36
    .line 37
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-eqz v2, :cond_0

    .line 42
    .line 43
    new-instance v2, Ll/cck0;

    .line 44
    .line 45
    invoke-direct {v2, p0}, Ll/cck0;-><init>(Lcom/p1/mobile/putong/core/data/EditTagsData;)V

    .line 46
    .line 47
    .line 48
    invoke-static {v0, v2}, Ll/jyb;->d0(Ljava/util/List;Ll/qcj;)I

    .line 49
    .line 50
    .line 51
    :cond_0
    const-string v2, "male"

    .line 52
    .line 53
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-eqz v1, :cond_1

    .line 58
    .line 59
    new-instance v1, Ll/eck0;

    .line 60
    .line 61
    invoke-direct {v1, p0}, Ll/eck0;-><init>(Lcom/p1/mobile/putong/core/data/EditTagsData;)V

    .line 62
    .line 63
    .line 64
    invoke-static {v0, v1}, Ll/jyb;->d0(Ljava/util/List;Ll/qcj;)I

    .line 65
    .line 66
    .line 67
    :cond_1
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/EditTagsData;->tags:Ljava/util/List;

    .line 68
    .line 69
    :cond_2
    return-object p0
.end method

.method public static synthetic l0(Ljava/util/List;Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 8
    .line 9
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 10
    .line 11
    iput-object p0, v1, Lcom/p1/mobile/putong/data/Interest;->tags:Ljava/util/List;

    .line 12
    .line 13
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v1, p0}, Ll/gj40;->P(Ljava/util/List;)Ll/gj40$h;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_1

    .line 40
    .line 41
    iget-boolean v1, p0, Ll/gj40$h;->a:Z

    .line 42
    .line 43
    if-eqz v1, :cond_1

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/gj40$h;->b()Ljava/util/List;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    const/16 v2, 0xa

    .line 54
    .line 55
    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    const/4 v2, 0x0

    .line 60
    invoke-interface {p0, v2, v1}, Ljava/util/List;->subList(II)Ljava/util/List;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 65
    .line 66
    new-instance v2, Ll/fck0;

    .line 67
    .line 68
    invoke-direct {v2}, Ll/fck0;-><init>()V

    .line 69
    .line 70
    .line 71
    invoke-static {p0, v2}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    iput-object p0, v1, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 76
    .line 77
    :cond_1
    :goto_0
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/data/User;->subtract(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    return-object p0
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/core/newui/profile/TagChooseMkAct;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/TagChooseMkAct;->j:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic m0(Lcom/p1/mobile/putong/data/User;)Lrx/c;
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 8
    .line 9
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Ll/dkb;->u9(Lcom/p1/mobile/putong/data/User;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public static synthetic n(Lcom/p1/mobile/putong/core/data/NewTags;)Lcom/p1/mobile/putong/data/Tag;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Tag;

    .line 2
    .line 3
    const-string v1, "personality"

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {v0, v1, p0}, Lcom/p1/mobile/putong/data/Tag;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public static synthetic n0(Ll/xc00;Ll/uxj0;)Lcom/p1/mobile/putong/core/data/EditTagsData;
    .locals 0

    .line 1
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p1, p0}, Ll/gj40;->m(Lcom/p1/mobile/android/app/Act;)Lcom/p1/mobile/putong/core/data/EditTagsData;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic o(Ll/xc00;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xc00;->d()Ll/hqq;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "datingProfileAction"

    .line 6
    .line 7
    filled-new-array {p1}, [Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-interface {p0, v0, p1}, Ll/hqq;->b(Ljava/lang/String;[Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic o0(Lcom/p1/mobile/putong/data/User;)Lrx/c;
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 8
    .line 9
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Ll/dkb;->u9(Lcom/p1/mobile/putong/data/User;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/data/EditTagsData;Lcom/p1/mobile/putong/core/data/UserTagData;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/UserTagData;->gender:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "female"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/EditTagsData;->selectedTags:Ljava/util/List;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/UserTagData;->id:Ljava/lang/String;

    .line 14
    .line 15
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public static synthetic p0(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;Lorg/json/JSONObject;Ll/xc00;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->W0(Lorg/json/JSONObject;Ll/xc00;)V

    return-void
.end method

.method public static synthetic q(Ljava/lang/String;Ljava/util/List;Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;
    .locals 2

    .line 1
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "food"

    .line 6
    .line 7
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 18
    .line 19
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Interest;->taste:Ljava/util/List;

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const-string v1, "game"

    .line 23
    .line 24
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_1

    .line 29
    .line 30
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 35
    .line 36
    iput-object p1, p0, Lcom/p1/mobile/putong/data/ExtensionGame;->together:Ljava/util/List;

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    const-string v1, "game_name"

    .line 40
    .line 41
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-eqz p0, :cond_2

    .line 46
    .line 47
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 52
    .line 53
    iput-object p1, p0, Lcom/p1/mobile/putong/data/ExtensionGame;->name:Ljava/util/List;

    .line 54
    .line 55
    :cond_2
    :goto_0
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/data/User;->subtract(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    return-object p0
.end method

.method public static synthetic r(Lcom/p1/mobile/putong/core/data/EditTagsData;)Lcom/p1/mobile/putong/core/data/EditTagsData;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/EditTagsData;->tags:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/gck0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/gck0;-><init>(Lcom/p1/mobile/putong/core/data/EditTagsData;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->d0(Ljava/util/List;Ll/qcj;)I

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/EditTagsData;->tags:Ljava/util/List;

    .line 12
    .line 13
    return-object p0
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/core/data/NewTags;)Lcom/p1/mobile/putong/data/Tag;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Tag;

    .line 2
    .line 3
    const-string v1, "personality"

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {v0, v1, p0}, Lcom/p1/mobile/putong/data/Tag;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public static synthetic t(Ll/xc00;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xc00;->d()Ll/hqq;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "likeResultsFromProfile"

    .line 6
    .line 7
    filled-new-array {p1}, [Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-interface {p0, v0, p1}, Ll/hqq;->b(Ljava/lang/String;[Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic u(Ll/xc00;IILandroid/content/Intent;)Z
    .locals 5

    .line 1
    const/16 v0, 0x3e7

    .line 2
    .line 3
    if-ne p1, v0, :cond_3

    .line 4
    .line 5
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    const-wide/16 v0, 0x64

    .line 12
    .line 13
    const-string v2, "otherId"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    if-ne p2, p1, :cond_0

    .line 17
    .line 18
    const-string p1, "userId"

    .line 19
    .line 20
    invoke-virtual {p3, p1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    new-instance p2, Lorg/json/JSONObject;

    .line 25
    .line 26
    invoke-direct {p2}, Lorg/json/JSONObject;-><init>()V

    .line 27
    .line 28
    .line 29
    :try_start_0
    invoke-virtual {p2, v2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 30
    .line 31
    .line 32
    :catch_0
    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-static {p1}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 41
    .line 42
    .line 43
    move-result p2

    .line 44
    sub-int/2addr p2, v3

    .line 45
    invoke-virtual {p1, v3, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {p0}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    new-instance p3, Ll/qck0;

    .line 54
    .line 55
    invoke-direct {p3, p0, p1}, Ll/qck0;-><init>(Ll/xc00;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    invoke-static {p2, p3, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->REMOVE:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 63
    .line 64
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    const-string v4, "currentUserId"

    .line 69
    .line 70
    if-ne p2, p1, :cond_1

    .line 71
    .line 72
    invoke-virtual {p3, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    new-instance p2, Lorg/json/JSONObject;

    .line 77
    .line 78
    invoke-direct {p2}, Lorg/json/JSONObject;-><init>()V

    .line 79
    .line 80
    .line 81
    :try_start_1
    invoke-virtual {p2, v2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 82
    .line 83
    .line 84
    :catch_1
    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-static {p1}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 93
    .line 94
    .line 95
    move-result p2

    .line 96
    sub-int/2addr p2, v3

    .line 97
    invoke-virtual {p1, v3, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    invoke-virtual {p0}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 102
    .line 103
    .line 104
    move-result-object p2

    .line 105
    new-instance p3, Ll/rck0;

    .line 106
    .line 107
    invoke-direct {p3, p0, p1}, Ll/rck0;-><init>(Ll/xc00;Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    invoke-static {p2, p3, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 111
    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_1
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 115
    .line 116
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 117
    .line 118
    .line 119
    move-result p1

    .line 120
    if-eq p2, p1, :cond_2

    .line 121
    .line 122
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 123
    .line 124
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 125
    .line 126
    .line 127
    move-result p1

    .line 128
    if-ne p2, p1, :cond_3

    .line 129
    .line 130
    :cond_2
    invoke-virtual {p3, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    new-instance p2, Lorg/json/JSONObject;

    .line 135
    .line 136
    invoke-direct {p2}, Lorg/json/JSONObject;-><init>()V

    .line 137
    .line 138
    .line 139
    :try_start_2
    invoke-virtual {p2, v2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_2

    .line 140
    .line 141
    .line 142
    :catch_2
    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    invoke-static {p1}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 151
    .line 152
    .line 153
    move-result p2

    .line 154
    sub-int/2addr p2, v3

    .line 155
    invoke-virtual {p1, v3, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object p1

    .line 159
    invoke-virtual {p0}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 160
    .line 161
    .line 162
    move-result-object p2

    .line 163
    new-instance p3, Ll/sck0;

    .line 164
    .line 165
    invoke-direct {p3, p0, p1}, Ll/sck0;-><init>(Ll/xc00;Ljava/lang/String;)V

    .line 166
    .line 167
    .line 168
    invoke-static {p2, p3, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 169
    .line 170
    .line 171
    :goto_0
    return v3

    .line 172
    :cond_3
    const/4 p0, 0x0

    .line 173
    return p0
.end method

.method public static synthetic v(Ljava/lang/String;Ll/xc00;Ljava/lang/String;Ll/uxj0;)V
    .locals 4

    .line 1
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p3, p0}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 23
    .line 24
    .line 25
    move-result-object p3

    .line 26
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-interface {v0, p1, p0, p2, v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Ar(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p3, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    const/4 v2, 0x1

    .line 47
    if-eqz v0, :cond_3

    .line 48
    .line 49
    iget-object v0, p3, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 50
    .line 51
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_3

    .line 56
    .line 57
    iget-object v0, p3, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 58
    .line 59
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 60
    .line 61
    const-string v3, "liked"

    .line 62
    .line 63
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-nez v0, :cond_1

    .line 68
    .line 69
    iget-object p3, p3, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 70
    .line 71
    iget-object p3, p3, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 72
    .line 73
    const-string v0, "matched"

    .line 74
    .line 75
    invoke-static {p3, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 76
    .line 77
    .line 78
    move-result p3

    .line 79
    if-eqz p3, :cond_2

    .line 80
    .line 81
    :cond_1
    move v1, v2

    .line 82
    :cond_2
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 83
    .line 84
    .line 85
    move-result-object p3

    .line 86
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    xor-int/2addr v1, v2

    .line 95
    invoke-interface {v0, p1, p0, p2, v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Ar(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-virtual {p3, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_3
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 104
    .line 105
    .line 106
    move-result-object p3

    .line 107
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    invoke-interface {v0, p1, p0, p2, v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Ar(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    invoke-virtual {p3, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 120
    .line 121
    .line 122
    return-void
.end method

.method public static synthetic w(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;Ljava/lang/String;Ll/xc00;Ljava/lang/String;Ljava/lang/String;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->d1(Ljava/lang/String;Ll/xc00;Ljava/lang/String;Ljava/lang/String;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic x(Ll/xc00;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;->d2(Z)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public static synthetic y(Ljava/util/List;Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;
    .locals 3

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {v0, p0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 7
    .line 8
    .line 9
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 12
    .line 13
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 14
    .line 15
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Interest;->tags:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iget-object v2, v1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 25
    .line 26
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 27
    .line 28
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 29
    .line 30
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Interest;->tags:Ljava/util/List;

    .line 31
    .line 32
    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 33
    .line 34
    .line 35
    iget-object v2, v1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 36
    .line 37
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 38
    .line 39
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 40
    .line 41
    iput-object v0, v2, Lcom/p1/mobile/putong/data/Interest;->tags:Ljava/util/List;

    .line 42
    .line 43
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-nez p0, :cond_0

    .line 48
    .line 49
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p0, v0}, Ll/gj40;->P(Ljava/util/List;)Ll/gj40$h;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_0

    .line 62
    .line 63
    iget-boolean v0, p0, Ll/gj40$h;->a:Z

    .line 64
    .line 65
    if-eqz v0, :cond_0

    .line 66
    .line 67
    invoke-virtual {p0}, Ll/gj40$h;->b()Ljava/util/List;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-nez v0, :cond_0

    .line 76
    .line 77
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    const/16 v2, 0xa

    .line 82
    .line 83
    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    const/4 v2, 0x0

    .line 88
    invoke-interface {p0, v2, v0}, Ljava/util/List;->subList(II)Ljava/util/List;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    iget-object v0, v1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 93
    .line 94
    new-instance v2, Ll/bck0;

    .line 95
    .line 96
    invoke-direct {v2}, Ll/bck0;-><init>()V

    .line 97
    .line 98
    .line 99
    invoke-static {p0, v2}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    iput-object p0, v0, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 104
    .line 105
    :cond_0
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/data/User;->subtract(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    return-object p0
.end method

.method public static synthetic z(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;Ll/xc00;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->Y0(Ll/xc00;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method


# virtual methods
.method public A0(Ll/xc00;Ljava/lang/String;)V
    .locals 3
    .param p1    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ll/uxj0;->a:Ll/uxj0;

    .line 6
    .line 7
    invoke-static {v1}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {v1, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    new-instance v2, Ll/hdk0;

    .line 20
    .line 21
    invoke-direct {v2, p1}, Ll/hdk0;-><init>(Ll/xc00;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    new-instance v2, Ll/rbk0;

    .line 29
    .line 30
    invoke-direct {v2}, Ll/rbk0;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    new-instance v2, Ll/idk0;

    .line 38
    .line 39
    invoke-direct {v2}, Ll/idk0;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    new-instance v1, Ll/jdk0;

    .line 59
    .line 60
    invoke-direct {v1, p0, p1, p2}, Ll/jdk0;-><init>(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;Ll/xc00;Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    new-instance v2, Ll/ldk0;

    .line 64
    .line 65
    invoke-direct {v2, p0, p1, p2}, Ll/ldk0;-><init>(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;Ll/xc00;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public B0(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 1
    .param p1    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const-string v0, "callback"

    .line 2
    .line 3
    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->A0(Ll/xc00;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public C0(Ll/xc00;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    new-instance v0, Ll/bdk0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Ll/bdk0;-><init>(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;Ll/xc00;Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public D0(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 2
    .param p1    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const-string v0, "userId"

    .line 2
    .line 3
    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "callback"

    .line 8
    .line 9
    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-virtual {p0, p1, v0, p2}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->C0(Ll/xc00;Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public E0(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 3
    .param p1    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const-string v0, "userID"

    .line 2
    .line 3
    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "preview"

    .line 8
    .line 9
    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const-string v2, "callback"

    .line 14
    .line 15
    invoke-virtual {p2, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-virtual {p0, p1, v0, v1, p2}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->F0(Ll/xc00;Ljava/lang/String;ZLjava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public F0(Ll/xc00;Ljava/lang/String;ZLjava/lang/String;)V
    .locals 7
    .param p1    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance v1, Ll/hbk0;

    .line 9
    .line 10
    move-object v2, p0

    .line 11
    move-object v3, p1

    .line 12
    move-object v4, p2

    .line 13
    move v5, p3

    .line 14
    move-object v6, p4

    .line 15
    invoke-direct/range {v1 .. v6}, Ll/hbk0;-><init>(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;Ll/xc00;Ljava/lang/String;ZLjava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v1}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public G0(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 2
    .param p1    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/adk0;

    .line 6
    .line 7
    invoke-direct {v1, p0, p2, p1}, Ll/adk0;-><init>(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;Lorg/json/JSONObject;Ll/xc00;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public H0(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 3
    .param p1    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const-string v0, "from"

    .line 2
    .line 3
    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "from_portrait_like_list"

    .line 8
    .line 9
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const-string v2, "userId"

    .line 14
    .line 15
    if-nez v1, :cond_1

    .line 16
    .line 17
    const-string v1, "from_find_partner"

    .line 18
    .line 19
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-nez v1, :cond_1

    .line 24
    .line 25
    const-string v1, "p_picks_profile"

    .line 26
    .line 27
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    invoke-virtual {p2, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    const-string v0, "from_mew_tags"

    .line 39
    .line 40
    invoke-virtual {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->I0(Ll/xc00;Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_1
    :goto_0
    invoke-virtual {p2, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    invoke-virtual {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->I0(Ll/xc00;Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public I0(Ll/xc00;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const-string p0, "from_find_partner"

    .line 2
    .line 3
    invoke-static {p3, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 16
    .line 17
    invoke-virtual {v0, p2}, Ll/dkb;->t9(Ljava/lang/String;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    new-instance v0, Ll/jbk0;

    .line 26
    .line 27
    invoke-direct {v0, p2, p1, p3}, Ll/jbk0;-><init>(Ljava/lang/String;Ll/xc00;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    const-string p0, "p_picks_profile"

    .line 39
    .line 40
    invoke-static {p3, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    if-eqz p0, :cond_1

    .line 45
    .line 46
    new-instance p0, Ll/kbk0;

    .line 47
    .line 48
    invoke-direct {p0, p1, p2, p3}, Ll/kbk0;-><init>(Ll/xc00;Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-static {p0}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_1
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-interface {v0, p2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->userObsById(Ljava/lang/String;)Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    const/4 v0, 0x1

    .line 72
    invoke-virtual {p0, v0}, Lrx/c;->take(I)Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    new-instance v0, Ll/lbk0;

    .line 77
    .line 78
    invoke-direct {v0, p1, p2, p3}, Ll/lbk0;-><init>(Ll/xc00;Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public final synthetic J0(Ll/xc00;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->x0(Ll/xc00;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic K0(Ll/xc00;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 2
    .line 3
    invoke-virtual {p4, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object p4

    .line 7
    check-cast p4, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 8
    .line 9
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p4, p4, Lcom/p1/mobile/putong/core/data/CoreData;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartBeatMatched;

    .line 16
    .line 17
    iget-boolean p4, p4, Lcom/p1/mobile/putong/core/data/HeartBeatMatched;->matched:Z

    .line 18
    .line 19
    if-eqz p4, :cond_0

    .line 20
    .line 21
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 22
    .line 23
    .line 24
    move-result-object p4

    .line 25
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 28
    .line 29
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/api/g;->ap(Ljava/lang/String;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p4, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object p4

    .line 37
    new-instance v0, Ll/vck0;

    .line 38
    .line 39
    invoke-direct {v0, p1, p2}, Ll/vck0;-><init>(Ll/xc00;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    new-instance p2, Ll/wck0;

    .line 43
    .line 44
    invoke-direct {p2, p0, p1, p3}, Ll/wck0;-><init>(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;Ll/xc00;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-static {v0, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p4, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_0
    invoke-virtual {p0, p1, p3}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->x0(Ll/xc00;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public final synthetic L0(Ll/xc00;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->x0(Ll/xc00;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic M0(Ll/xc00;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/EditTagsData;)V
    .locals 0

    .line 1
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/data/EditTagsData;->toJson()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->n1(Ll/xc00;Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic N0(Ll/xc00;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->x0(Ll/xc00;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic O0(Ll/xc00;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/EditTagsData;)V
    .locals 0

    .line 1
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/data/EditTagsData;->toJson()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->n1(Ll/xc00;Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic P0(Ll/xc00;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->x0(Ll/xc00;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic Q0(Ll/xc00;Ljava/lang/String;Ljava/util/ArrayList;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/google/gson/Gson;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/gson/Gson;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p3}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p3

    .line 10
    const/4 v0, 0x1

    .line 11
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->o1(Ll/xc00;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic R0(Ll/xc00;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->x0(Ll/xc00;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic S0(Ll/xc00;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-interface {v1, p2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->userObsById(Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-virtual {v0, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    const/4 v0, 0x1

    .line 18
    invoke-virtual {p2, v0}, Lrx/c;->take(I)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    new-instance v0, Ll/mdk0;

    .line 23
    .line 24
    invoke-direct {v0}, Ll/mdk0;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p2, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    new-instance v0, Ll/ndk0;

    .line 32
    .line 33
    invoke-direct {v0, p0, p1, p3}, Ll/ndk0;-><init>(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;Ll/xc00;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    new-instance v1, Ll/odk0;

    .line 37
    .line 38
    invoke-direct {v1, p0, p1, p3}, Ll/odk0;-><init>(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;Ll/xc00;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final synthetic T0(Ll/xc00;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/UserTagsData;)V
    .locals 0

    .line 1
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/data/UserTagsData;->toJson()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->n1(Ll/xc00;Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic U0(Ll/xc00;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->x0(Ll/xc00;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic V0(Ll/xc00;Ljava/lang/String;ZLjava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-interface {v1, p2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->userObsById(Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-virtual {v0, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    const/4 v0, 0x1

    .line 18
    invoke-virtual {p2, v0}, Lrx/c;->take(I)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    new-instance v0, Ll/lck0;

    .line 23
    .line 24
    invoke-direct {v0, p1, p3}, Ll/lck0;-><init>(Ll/xc00;Z)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p2, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    new-instance p3, Ll/mck0;

    .line 32
    .line 33
    invoke-direct {p3}, Ll/mck0;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p2, p3}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    new-instance p3, Ll/nck0;

    .line 41
    .line 42
    invoke-direct {p3, p0, p1, p4}, Ll/nck0;-><init>(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;Ll/xc00;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    new-instance v0, Ll/pck0;

    .line 46
    .line 47
    invoke-direct {v0, p0, p1, p4}, Ll/pck0;-><init>(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;Ll/xc00;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    invoke-static {p3, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public final synthetic W0(Lorg/json/JSONObject;Ll/xc00;)V
    .locals 3

    .line 1
    const-string v0, "callback"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    new-instance v0, Lorg/json/JSONObject;

    .line 8
    .line 9
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p2}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    instance-of v1, v1, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 17
    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    invoke-virtual {p2}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 25
    .line 26
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;->c2()Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    :try_start_0
    const-string v2, "success"

    .line 31
    .line 32
    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 33
    .line 34
    .line 35
    :catch_0
    invoke-virtual {p0, p2, p1, v0}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->t0(Ll/xc00;Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public final synthetic X0(Ll/xc00;Ljava/lang/String;Ll/uxj0;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    new-instance v0, Landroid/content/Intent;

    .line 6
    .line 7
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 8
    .line 9
    .line 10
    const/4 v1, -0x1

    .line 11
    invoke-virtual {p3, v1, v0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 12
    .line 13
    .line 14
    const/4 p3, 0x0

    .line 15
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->n1(Ll/xc00;Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic Y0(Ll/xc00;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p3}, Ll/bsj0;->H(Ljava/lang/Throwable;)Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->x0(Ll/xc00;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic Z0(Ll/xc00;Ljava/lang/String;Ll/uxj0;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    new-instance v0, Landroid/content/Intent;

    .line 6
    .line 7
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 8
    .line 9
    .line 10
    const/4 v1, -0x1

    .line 11
    invoke-virtual {p3, v1, v0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 12
    .line 13
    .line 14
    const/4 p3, 0x0

    .line 15
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->n1(Ll/xc00;Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic a1(Ll/xc00;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p3}, Ll/bsj0;->H(Ljava/lang/Throwable;)Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->x0(Ll/xc00;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public action(Ll/xc00;Ljava/lang/String;)V
    .locals 0
    .param p1    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ll/lkq;
        key = "action"
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->s0(Ll/xc00;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic b1(Ll/xc00;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-static {p2}, Lcom/p1/mobile/putong/newui/main/base/TabName;->transform(Ljava/lang/String;)Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->q0(Ll/xc00;Lcom/p1/mobile/putong/newui/main/base/TabName;Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic c1(Ll/xc00;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->x0(Ll/xc00;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public createUserTag(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 0
    .param p1    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ll/lkq;
        key = "createUserTag"
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->u0(Ll/xc00;Lorg/json/JSONObject;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic d1(Ljava/lang/String;Ll/xc00;Ljava/lang/String;Ljava/lang/String;Ll/uxj0;)V
    .locals 6

    .line 1
    const-string p5, "from_heartbeat"

    .line 2
    .line 3
    invoke-static {p1, p5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p5

    .line 7
    if-eqz p5, :cond_1

    .line 8
    .line 9
    invoke-static {}, Ll/upm;->O()Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;

    .line 10
    .line 11
    .line 12
    move-result-object p5

    .line 13
    invoke-static {p5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p5, Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;->pushMessage:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 20
    .line 21
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    iget-object v0, p5, Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;->pushMessage:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tracker:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    invoke-virtual {p2}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 42
    .line 43
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->H1:Ll/f49;

    .line 44
    .line 45
    iget-object p5, p5, Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;->pushMessage:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 46
    .line 47
    iget-object p5, p5, Lcom/p1/mobile/putong/data/PushMessageCustom;->tracker:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {v1, p5}, Ll/f49;->v3(Ljava/lang/String;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object p5

    .line 53
    invoke-virtual {v0, p5}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object p5

    .line 57
    new-instance v0, Ll/hck0;

    .line 58
    .line 59
    move-object v1, p0

    .line 60
    move-object v5, p1

    .line 61
    move-object v2, p2

    .line 62
    move-object v3, p3

    .line 63
    move-object v4, p4

    .line 64
    invoke-direct/range {v0 .. v5}, Ll/hck0;-><init>(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;Ll/xc00;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    new-instance p0, Ll/ick0;

    .line 68
    .line 69
    invoke-direct {p0, v1, v2, v4}, Ll/ick0;-><init>(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;Ll/xc00;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {p5, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 77
    .line 78
    .line 79
    :cond_0
    return-void

    .line 80
    :cond_1
    move-object v1, p0

    .line 81
    move-object v5, p1

    .line 82
    move-object v2, p2

    .line 83
    move-object v4, p4

    .line 84
    const-string p0, "from_message_tag_guide"

    .line 85
    .line 86
    invoke-static {v5, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 87
    .line 88
    .line 89
    move-result p0

    .line 90
    if-eqz p0, :cond_2

    .line 91
    .line 92
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 93
    .line 94
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 95
    .line 96
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/g;->f2:Lrx/subjects/b;

    .line 97
    .line 98
    invoke-virtual {p0, v5}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {v2}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 106
    .line 107
    .line 108
    return-void

    .line 109
    :cond_2
    const-string p0, "from_card_tag_guide"

    .line 110
    .line 111
    invoke-static {v5, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 112
    .line 113
    .line 114
    move-result p0

    .line 115
    if-eqz p0, :cond_3

    .line 116
    .line 117
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 118
    .line 119
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 120
    .line 121
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/g;->e2:Lrx/subjects/b;

    .line 122
    .line 123
    invoke-virtual {p0, v5}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v2}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    new-instance p1, Landroid/content/Intent;

    .line 131
    .line 132
    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    .line 133
    .line 134
    .line 135
    const/4 p2, -0x1

    .line 136
    invoke-virtual {p0, p2, p1}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {v2}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 144
    .line 145
    .line 146
    return-void

    .line 147
    :cond_3
    invoke-virtual {v1, v2, v4}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->x0(Ll/xc00;Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    return-void
.end method

.method public final synthetic e1(Ll/xc00;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p3}, Ll/bsj0;->H(Ljava/lang/Throwable;)Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->x0(Ll/xc00;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic f1(Ll/xc00;Ljava/lang/String;Ll/uxj0;)V
    .locals 0

    .line 1
    const/4 p3, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->n1(Ll/xc00;Ljava/lang/String;Ljava/lang/String;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic g1(Ll/xc00;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->x0(Ll/xc00;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public getEditTagData(Ll/xc00;ZLjava/lang/String;)V
    .locals 0
    .param p1    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ll/lkq;
        key = "getEditTagData"
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->z0(Ll/xc00;ZLjava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public getUserTagData(Ll/xc00;Ljava/lang/String;ZLjava/lang/String;)V
    .locals 0
    .param p1    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ll/lkq;
        key = "getUserTagData"
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->F0(Ll/xc00;Ljava/lang/String;ZLjava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic h1(Ljava/lang/String;Ll/xc00;Ljava/lang/String;Ll/uxj0;)V
    .locals 1

    .line 1
    sget-object p4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p4, p4, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object p4, p4, Ll/dkb;->S6:Ljava/util/concurrent/ConcurrentHashMap;

    .line 6
    .line 7
    invoke-virtual {p4, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 12
    .line 13
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p4

    .line 17
    if-eqz p4, :cond_0

    .line 18
    .line 19
    new-instance p4, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-direct {p4}, Ljava/util/ArrayList;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p4, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p1, p4}, Ll/gj40;->M(Ljava/util/List;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    invoke-virtual {p2}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    new-instance p4, Landroid/content/Intent;

    .line 39
    .line 40
    invoke-direct {p4}, Landroid/content/Intent;-><init>()V

    .line 41
    .line 42
    .line 43
    const/4 v0, -0x1

    .line 44
    invoke-virtual {p1, v0, p4}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 45
    .line 46
    .line 47
    const/4 p1, 0x0

    .line 48
    invoke-virtual {p0, p2, p3, p1}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->n1(Ll/xc00;Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final synthetic i1(Ll/xc00;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p3}, Ll/bsj0;->H(Ljava/lang/Throwable;)Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->x0(Ll/xc00;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public j1(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 0
    .param p1    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance p2, Ll/xck0;

    .line 6
    .line 7
    invoke-direct {p2, p1}, Ll/xck0;-><init>(Ll/xc00;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p0, p2}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public jumpToProfileAct(Ll/xc00;Ljava/lang/String;)V
    .locals 1
    .param p1    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ll/lkq;
        key = "jumpToProfileAct"
    .end annotation

    .line 1
    const-string v0, "from_mew_tags"

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->I0(Ll/xc00;Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public k1(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 6
    .param p1    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const-string v0, "callback"

    .line 2
    .line 3
    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "type"

    .line 8
    .line 9
    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    new-instance v2, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 16
    .line 17
    .line 18
    const-string v3, "tags"

    .line 19
    .line 20
    invoke-virtual {p2, v3}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    if-eqz p2, :cond_4

    .line 25
    .line 26
    const/4 v3, 0x0

    .line 27
    :goto_0
    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    .line 28
    .line 29
    .line 30
    move-result v4

    .line 31
    if-ge v3, v4, :cond_4

    .line 32
    .line 33
    const-string v4, "food"

    .line 34
    .line 35
    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    if-eqz v4, :cond_0

    .line 40
    .line 41
    invoke-virtual {p2, v3}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    invoke-static {v4}, Ll/pu90;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    goto :goto_1

    .line 50
    :cond_0
    const-string v4, "game"

    .line 51
    .line 52
    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v4

    .line 56
    if-eqz v4, :cond_1

    .line 57
    .line 58
    invoke-virtual {p2, v3}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v4

    .line 62
    goto :goto_1

    .line 63
    :cond_1
    const-string v4, "game_name"

    .line 64
    .line 65
    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v4

    .line 69
    if-eqz v4, :cond_2

    .line 70
    .line 71
    invoke-virtual {p2, v3}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v4

    .line 75
    goto :goto_1

    .line 76
    :cond_2
    const/4 v4, 0x0

    .line 77
    :goto_1
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 78
    .line 79
    .line 80
    move-result v5

    .line 81
    if-nez v5, :cond_3

    .line 82
    .line 83
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    :cond_3
    add-int/lit8 v3, v3, 0x1

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_4
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 90
    .line 91
    .line 92
    move-result-object p2

    .line 93
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 94
    .line 95
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 96
    .line 97
    invoke-virtual {v3}, Ll/dkb;->o9()Lrx/c;

    .line 98
    .line 99
    .line 100
    move-result-object v3

    .line 101
    invoke-virtual {p2, v3}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 102
    .line 103
    .line 104
    move-result-object p2

    .line 105
    const/4 v3, 0x1

    .line 106
    invoke-virtual {p2, v3}, Lrx/c;->take(I)Lrx/c;

    .line 107
    .line 108
    .line 109
    move-result-object p2

    .line 110
    new-instance v3, Ll/mbk0;

    .line 111
    .line 112
    invoke-direct {v3, v1, v2}, Ll/mbk0;-><init>(Ljava/lang/String;Ljava/util/List;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p2, v3}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 116
    .line 117
    .line 118
    move-result-object p2

    .line 119
    new-instance v1, Ll/nbk0;

    .line 120
    .line 121
    invoke-direct {v1}, Ll/nbk0;-><init>()V

    .line 122
    .line 123
    .line 124
    invoke-virtual {p2, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 125
    .line 126
    .line 127
    move-result-object p2

    .line 128
    new-instance v1, Ll/obk0;

    .line 129
    .line 130
    invoke-direct {v1, p0, p1, v0}, Ll/obk0;-><init>(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;Ll/xc00;Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    new-instance v2, Ll/pbk0;

    .line 134
    .line 135
    invoke-direct {v2, p0, p1, v0}, Ll/pbk0;-><init>(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;Ll/xc00;Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 143
    .line 144
    .line 145
    return-void
.end method

.method public l1(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 5
    .param p1    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const-string v0, "preview"

    .line 2
    .line 3
    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-string v1, "callback"

    .line 8
    .line 9
    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    new-instance v2, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 16
    .line 17
    .line 18
    const-string v3, "selectedTags"

    .line 19
    .line 20
    invoke-virtual {p2, v3}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    if-eqz p2, :cond_0

    .line 25
    .line 26
    const/4 v3, 0x0

    .line 27
    :goto_0
    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    .line 28
    .line 29
    .line 30
    move-result v4

    .line 31
    if-ge v3, v4, :cond_0

    .line 32
    .line 33
    invoke-virtual {p2, v3}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    add-int/lit8 v3, v3, 0x1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    if-eqz v0, :cond_2

    .line 44
    .line 45
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    invoke-virtual {p2}, Ll/gj40;->z()Ljava/util/List;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    new-instance v0, Ll/sbk0;

    .line 54
    .line 55
    invoke-direct {v0}, Ll/sbk0;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-static {v2, p2, v0}, Ll/jyb;->l(Ljava/util/Collection;Ljava/util/Collection;Ll/rcj;)Z

    .line 59
    .line 60
    .line 61
    move-result p2

    .line 62
    if-nez p2, :cond_1

    .line 63
    .line 64
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 65
    .line 66
    .line 67
    move-result-object p2

    .line 68
    invoke-virtual {p2, v2}, Ll/gj40;->T(Ljava/util/List;)V

    .line 69
    .line 70
    .line 71
    :cond_1
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 72
    .line 73
    .line 74
    move-result-object p2

    .line 75
    new-instance v0, Landroid/content/Intent;

    .line 76
    .line 77
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 78
    .line 79
    .line 80
    const/4 v2, -0x1

    .line 81
    invoke-virtual {p2, v2, v0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 82
    .line 83
    .line 84
    const/4 p2, 0x0

    .line 85
    invoke-virtual {p0, p1, v1, p2}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->n1(Ll/xc00;Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_2
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 90
    .line 91
    .line 92
    move-result-object p2

    .line 93
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 94
    .line 95
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 96
    .line 97
    invoke-virtual {v0}, Ll/dkb;->o9()Lrx/c;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 102
    .line 103
    .line 104
    move-result-object p2

    .line 105
    const/4 v0, 0x1

    .line 106
    invoke-virtual {p2, v0}, Lrx/c;->take(I)Lrx/c;

    .line 107
    .line 108
    .line 109
    move-result-object p2

    .line 110
    new-instance v0, Ll/dck0;

    .line 111
    .line 112
    invoke-direct {v0, v2}, Ll/dck0;-><init>(Ljava/util/List;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p2, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 116
    .line 117
    .line 118
    move-result-object p2

    .line 119
    new-instance v0, Ll/ock0;

    .line 120
    .line 121
    invoke-direct {v0}, Ll/ock0;-><init>()V

    .line 122
    .line 123
    .line 124
    invoke-virtual {p2, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 125
    .line 126
    .line 127
    move-result-object p2

    .line 128
    new-instance v0, Ll/zck0;

    .line 129
    .line 130
    invoke-direct {v0, p0, p1, v1}, Ll/zck0;-><init>(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;Ll/xc00;Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    new-instance v2, Ll/kdk0;

    .line 134
    .line 135
    invoke-direct {v2, p0, p1, v1}, Ll/kdk0;-><init>(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;Ll/xc00;Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    invoke-static {v0, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 143
    .line 144
    .line 145
    return-void
.end method

.method public m1(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 7
    .param p1    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const-string v0, "callback"

    .line 9
    .line 10
    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v6

    .line 14
    const-string v0, "tabName"

    .line 15
    .line 16
    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v5

    .line 20
    const-string v0, "from"

    .line 21
    .line 22
    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    const-string v0, "selectedTags"

    .line 27
    .line 28
    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    new-instance v0, Ljava/util/ArrayList;

    .line 33
    .line 34
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_1

    .line 42
    .line 43
    const/4 v1, 0x0

    .line 44
    move v2, v1

    .line 45
    :goto_0
    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    if-ge v2, v4, :cond_1

    .line 50
    .line 51
    invoke-virtual {p2, v2}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    invoke-interface {v0, v1, v4}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    add-int/lit8 v2, v2, 0x1

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 62
    .line 63
    .line 64
    move-result-object p2

    .line 65
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 66
    .line 67
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 68
    .line 69
    invoke-virtual {v1}, Ll/dkb;->o9()Lrx/c;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-virtual {p2, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    invoke-virtual {p2}, Lrx/c;->first()Lrx/c;

    .line 78
    .line 79
    .line 80
    move-result-object p2

    .line 81
    new-instance v1, Ll/udk0;

    .line 82
    .line 83
    invoke-direct {v1, v0}, Ll/udk0;-><init>(Ljava/util/List;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p2, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 87
    .line 88
    .line 89
    move-result-object p2

    .line 90
    new-instance v0, Ll/vdk0;

    .line 91
    .line 92
    invoke-direct {v0}, Ll/vdk0;-><init>()V

    .line 93
    .line 94
    .line 95
    invoke-virtual {p2, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 96
    .line 97
    .line 98
    move-result-object p2

    .line 99
    new-instance v1, Ll/wdk0;

    .line 100
    .line 101
    move-object v2, p0

    .line 102
    move-object v4, p1

    .line 103
    invoke-direct/range {v1 .. v6}, Ll/wdk0;-><init>(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;Ljava/lang/String;Ll/xc00;Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    new-instance p0, Ll/xdk0;

    .line 107
    .line 108
    invoke-direct {p0, v2, v4, v6}, Ll/xdk0;-><init>(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;Ll/xc00;Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 116
    .line 117
    .line 118
    return-void
.end method

.method public final n1(Ll/xc00;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->o1(Ll/xc00;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final o1(Ll/xc00;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 3

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v1, "success"

    .line 7
    .line 8
    const-string v2, "true"

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 11
    .line 12
    .line 13
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v1
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    if-nez v1, :cond_1

    .line 18
    .line 19
    const-string v1, "data"

    .line 20
    .line 21
    if-eqz p4, :cond_0

    .line 22
    .line 23
    :try_start_1
    new-instance p4, Lorg/json/JSONArray;

    .line 24
    .line 25
    invoke-direct {p4, p3}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 29
    .line 30
    .line 31
    goto :goto_1

    .line 32
    :catch_0
    move-exception p3

    .line 33
    goto :goto_0

    .line 34
    :cond_0
    new-instance p4, Lorg/json/JSONObject;

    .line 35
    .line 36
    invoke-direct {p4, p3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v1, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 40
    .line 41
    .line 42
    goto :goto_1

    .line 43
    :goto_0
    invoke-static {p3}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 44
    .line 45
    .line 46
    :cond_1
    :goto_1
    invoke-virtual {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->t0(Ll/xc00;Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public p1(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 3
    .param p1    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const-string v0, "callback"

    .line 2
    .line 3
    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "facialFeature"

    .line 8
    .line 9
    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->x0(Ll/xc00;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 28
    .line 29
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 30
    .line 31
    invoke-virtual {v2}, Ll/dkb;->o9()Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    const/4 v2, 0x1

    .line 40
    invoke-virtual {v1, v2}, Lrx/c;->take(I)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    new-instance v2, Ll/ddk0;

    .line 45
    .line 46
    invoke-direct {v2, p2}, Ll/ddk0;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    new-instance v1, Ll/edk0;

    .line 54
    .line 55
    invoke-direct {v1}, Ll/edk0;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p2, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    new-instance v1, Ll/fdk0;

    .line 63
    .line 64
    invoke-direct {v1, p0, p1, v0}, Ll/fdk0;-><init>(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;Ll/xc00;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    new-instance v2, Ll/gdk0;

    .line 68
    .line 69
    invoke-direct {v2, p0, p1, v0}, Ll/gdk0;-><init>(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;Ll/xc00;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public final q0(Ll/xc00;Lcom/p1/mobile/putong/newui/main/base/TabName;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/upm;->O()Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p4

    .line 5
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p4

    .line 9
    if-nez p4, :cond_0

    .line 10
    .line 11
    invoke-static {p2}, Ll/upm;->I(Lcom/p1/mobile/putong/newui/main/base/TabName;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-static {}, Ll/upm;->O()Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;

    .line 16
    .line 17
    .line 18
    move-result-object p4

    .line 19
    iget-object p4, p4, Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;->pushMessage:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 20
    .line 21
    iget-object p4, p4, Lcom/p1/mobile/putong/data/PushMessageCustom;->tracker:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {}, Ll/upm;->O()Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;->pushMessage:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->userId:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {p2}, Ll/upm;->I(Lcom/p1/mobile/putong/newui/main/base/TabName;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 39
    .line 40
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->H1:Ll/f49;

    .line 41
    .line 42
    invoke-virtual {v1, p4}, Ll/f49;->v3(Ljava/lang/String;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object p4

    .line 46
    const/4 v1, 0x1

    .line 47
    invoke-virtual {p4, v1}, Lrx/c;->take(I)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object p4

    .line 51
    invoke-virtual {p2, p4}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    new-instance p4, Ll/tck0;

    .line 56
    .line 57
    invoke-direct {p4, p0, p1, v0, p3}, Ll/tck0;-><init>(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;Ll/xc00;Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    new-instance v0, Ll/uck0;

    .line 61
    .line 62
    invoke-direct {v0, p0, p1, p3}, Ll/uck0;-><init>(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;Ll/xc00;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    invoke-static {p4, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public q1(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 7
    .param p1    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const-string v0, "tagID"

    .line 2
    .line 3
    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v3

    .line 7
    const-string v0, "action"

    .line 8
    .line 9
    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v4

    .line 13
    const-string v0, "preview"

    .line 14
    .line 15
    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result v5

    .line 19
    const-string v0, "callback"

    .line 20
    .line 21
    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v6

    .line 25
    move-object v1, p0

    .line 26
    move-object v2, p1

    .line 27
    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->r1(Ll/xc00;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public r0(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 1
    .param p1    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const-string v0, "url"

    .line 2
    .line 3
    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->s0(Ll/xc00;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public r1(Ll/xc00;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V
    .locals 3
    .param p1    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    if-eqz p4, :cond_3

    .line 2
    .line 3
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 4
    .line 5
    .line 6
    move-result-object p4

    .line 7
    invoke-virtual {p4}, Ll/gj40;->z()Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object p4

    .line 11
    invoke-static {p4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    const-string v0, "add"

    .line 19
    .line 20
    invoke-static {p3, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    const/4 v1, 0x0

    .line 25
    const/4 v2, -0x1

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    invoke-interface {p4, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result p3

    .line 32
    if-nez p3, :cond_2

    .line 33
    .line 34
    const/4 p3, 0x0

    .line 35
    invoke-interface {p4, p3, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    invoke-virtual {p2, p4}, Ll/gj40;->T(Ljava/util/List;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    new-instance p3, Landroid/content/Intent;

    .line 50
    .line 51
    invoke-direct {p3}, Landroid/content/Intent;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p2, v2, p3}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0, p1, p5, v1}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->n1(Ll/xc00;Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_1
    const-string v0, "delete"

    .line 62
    .line 63
    invoke-static {p3, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 64
    .line 65
    .line 66
    move-result p3

    .line 67
    if-eqz p3, :cond_2

    .line 68
    .line 69
    invoke-interface {p4, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result p3

    .line 73
    if-eqz p3, :cond_2

    .line 74
    .line 75
    invoke-interface {p4, p2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 79
    .line 80
    .line 81
    move-result-object p2

    .line 82
    invoke-virtual {p2, p4}, Ll/gj40;->T(Ljava/util/List;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 86
    .line 87
    .line 88
    move-result-object p2

    .line 89
    new-instance p3, Landroid/content/Intent;

    .line 90
    .line 91
    invoke-direct {p3}, Landroid/content/Intent;-><init>()V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p2, v2, p3}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p0, p1, p5, v1}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->n1(Ll/xc00;Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    return-void

    .line 101
    :cond_2
    invoke-virtual {p0, p1, p5}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->x0(Ll/xc00;Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    return-void

    .line 105
    :cond_3
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 106
    .line 107
    .line 108
    move-result-object p4

    .line 109
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 110
    .line 111
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 112
    .line 113
    invoke-virtual {v0}, Ll/dkb;->o9()Lrx/c;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-virtual {p4, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 118
    .line 119
    .line 120
    move-result-object p4

    .line 121
    const/4 v0, 0x1

    .line 122
    invoke-virtual {p4, v0}, Lrx/c;->take(I)Lrx/c;

    .line 123
    .line 124
    .line 125
    move-result-object p4

    .line 126
    new-instance v0, Ll/xbk0;

    .line 127
    .line 128
    invoke-direct {v0, p3, p2}, Ll/xbk0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {p4, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 132
    .line 133
    .line 134
    move-result-object p3

    .line 135
    new-instance p4, Ll/ybk0;

    .line 136
    .line 137
    invoke-direct {p4}, Ll/ybk0;-><init>()V

    .line 138
    .line 139
    .line 140
    invoke-virtual {p3, p4}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 141
    .line 142
    .line 143
    move-result-object p3

    .line 144
    new-instance p4, Ll/zbk0;

    .line 145
    .line 146
    invoke-direct {p4, p0, p2, p1, p5}, Ll/zbk0;-><init>(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;Ljava/lang/String;Ll/xc00;Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    new-instance p2, Ll/ack0;

    .line 150
    .line 151
    invoke-direct {p2, p0, p1, p5}, Ll/ack0;-><init>(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;Ll/xc00;Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    invoke-static {p4, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    invoke-virtual {p3, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 159
    .line 160
    .line 161
    return-void
.end method

.method public s0(Ll/xc00;Ljava/lang/String;)V
    .locals 1
    .param p1    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    new-instance v0, Ll/ibk0;

    .line 10
    .line 11
    invoke-direct {v0, p1}, Ll/ibk0;-><init>(Ll/xc00;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p0, p2, v0}, Ll/nae0;->n(Landroid/app/Activity;Landroid/net/Uri;Ll/z20;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public safeQuitH5(Ll/xc00;)V
    .locals 0
    .param p1    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ll/lkq;
        key = "safeQuitH5"
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-static {p0}, Ll/upm;->Z(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public saveExploreTagData(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 0
    .param p1    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ll/lkq;
        key = "saveExploreTagData"
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->k1(Ll/xc00;Lorg/json/JSONObject;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public saveSelectedTagData(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 0
    .param p1    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ll/lkq;
        key = "saveSelectedTagData"
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->l1(Ll/xc00;Lorg/json/JSONObject;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public saveTagData(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 0
    .param p1    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ll/lkq;
        key = "saveTagData"
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->m1(Ll/xc00;Lorg/json/JSONObject;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final t0(Ll/xc00;Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 1

    .line 1
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_2

    .line 6
    .line 7
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {p3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {p0}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 23
    .line 24
    .line 25
    move-result p3

    .line 26
    const/4 v0, 0x1

    .line 27
    if-ge p3, v0, :cond_1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 31
    .line 32
    .line 33
    move-result p3

    .line 34
    sub-int/2addr p3, v0

    .line 35
    invoke-virtual {p0, v0, p3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p1}, Ll/xc00;->d()Ll/hqq;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    filled-new-array {p0}, [Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-interface {p1, p2, p0}, Ll/hqq;->b(Ljava/lang/String;[Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    :cond_2
    :goto_0
    return-void
.end method

.method public u0(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 13
    .param p1    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_4

    .line 8
    .line 9
    :cond_0
    const-string v0, "tagData"

    .line 10
    .line 11
    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "callback"

    .line 16
    .line 17
    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    new-instance v1, Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 24
    .line 25
    .line 26
    const/4 v2, 0x0

    .line 27
    move v3, v2

    .line 28
    :goto_0
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v4

    .line 32
    if-eqz v4, :cond_1

    .line 33
    .line 34
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    if-ge v3, v4, :cond_1

    .line 39
    .line 40
    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    add-int/lit8 v3, v3, 0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    .line 51
    .line 52
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    :cond_2
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    if-eqz v3, :cond_7

    .line 64
    .line 65
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    check-cast v3, Lorg/json/JSONObject;

    .line 70
    .line 71
    const-string v4, "id"

    .line 72
    .line 73
    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v4

    .line 77
    const-string v5, "name"

    .line 78
    .line 79
    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v5

    .line 83
    const-string v6, "icon"

    .line 84
    .line 85
    invoke-virtual {v3, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v6

    .line 89
    const-string v7, "count"

    .line 90
    .line 91
    invoke-virtual {v3, v7}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    .line 92
    .line 93
    .line 94
    move-result-wide v7

    .line 95
    const-string v9, "status"

    .line 96
    .line 97
    invoke-virtual {v3, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v9

    .line 101
    const-string v10, "categories"

    .line 102
    .line 103
    invoke-virtual {v3, v10}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 104
    .line 105
    .line 106
    move-result-object v3

    .line 107
    new-instance v10, Ljava/util/ArrayList;

    .line 108
    .line 109
    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 110
    .line 111
    .line 112
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    move-result v11

    .line 116
    if-eqz v11, :cond_3

    .line 117
    .line 118
    move v11, v2

    .line 119
    :goto_2
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    .line 120
    .line 121
    .line 122
    move-result v12

    .line 123
    if-ge v11, v12, :cond_3

    .line 124
    .line 125
    invoke-virtual {v3, v11}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v12

    .line 129
    invoke-interface {v10, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    add-int/lit8 v11, v11, 0x1

    .line 133
    .line 134
    goto :goto_2

    .line 135
    :cond_3
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 136
    .line 137
    .line 138
    move-result v3

    .line 139
    if-nez v3, :cond_2

    .line 140
    .line 141
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 142
    .line 143
    .line 144
    move-result v3

    .line 145
    if-nez v3, :cond_2

    .line 146
    .line 147
    invoke-static {v10}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 148
    .line 149
    .line 150
    move-result v3

    .line 151
    if-nez v3, :cond_2

    .line 152
    .line 153
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 154
    .line 155
    .line 156
    move-result v3

    .line 157
    if-nez v3, :cond_2

    .line 158
    .line 159
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 160
    .line 161
    .line 162
    move-result v3

    .line 163
    if-eqz v3, :cond_4

    .line 164
    .line 165
    goto :goto_1

    .line 166
    :cond_4
    invoke-static {}, Lcom/p1/mobile/putong/core/data/NewTags;->new_()Lcom/p1/mobile/putong/core/data/NewTags;

    .line 167
    .line 168
    .line 169
    move-result-object v3

    .line 170
    iput-object v4, v3, Lcom/p1/mobile/putong/core/data/NewTags;->id:Ljava/lang/String;

    .line 171
    .line 172
    iput-object v5, v3, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 173
    .line 174
    iput-object v6, v3, Lcom/p1/mobile/putong/core/data/NewTags;->icon:Ljava/lang/String;

    .line 175
    .line 176
    const-wide/16 v4, 0x0

    .line 177
    .line 178
    cmp-long v4, v7, v4

    .line 179
    .line 180
    if-lez v4, :cond_5

    .line 181
    .line 182
    goto :goto_3

    .line 183
    :cond_5
    const-wide/16 v7, 0x1

    .line 184
    .line 185
    :goto_3
    iput-wide v7, v3, Lcom/p1/mobile/putong/core/data/NewTags;->localTagUserCounts:J

    .line 186
    .line 187
    iput-object v10, v3, Lcom/p1/mobile/putong/core/data/NewTags;->categories:Ljava/util/List;

    .line 188
    .line 189
    iput-object v9, v3, Lcom/p1/mobile/putong/core/data/NewTags;->status:Ljava/lang/String;

    .line 190
    .line 191
    invoke-static {}, Ll/gra;->L3()Z

    .line 192
    .line 193
    .line 194
    move-result v4

    .line 195
    if-eqz v4, :cond_6

    .line 196
    .line 197
    const/4 v4, 0x1

    .line 198
    iput-boolean v4, v3, Lcom/p1/mobile/putong/core/data/NewTags;->isPictureTag:Z

    .line 199
    .line 200
    :cond_6
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 201
    .line 202
    .line 203
    goto/16 :goto_1

    .line 204
    .line 205
    :cond_7
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 206
    .line 207
    .line 208
    move-result v1

    .line 209
    if-nez v1, :cond_8

    .line 210
    .line 211
    const/4 v1, 0x0

    .line 212
    invoke-virtual {p0, p1, p2, v1}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->n1(Ll/xc00;Ljava/lang/String;Ljava/lang/String;)V

    .line 213
    .line 214
    .line 215
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 216
    .line 217
    .line 218
    move-result-object p0

    .line 219
    invoke-virtual {p0, v0}, Ll/gj40;->M(Ljava/util/List;)V

    .line 220
    .line 221
    .line 222
    :cond_8
    :goto_4
    return-void
.end method

.method public updateTagState(Ll/xc00;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V
    .locals 0
    .param p1    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ll/lkq;
        key = "updateTagState"
    .end annotation

    .line 1
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->r1(Ll/xc00;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public v0(Ll/xc00;Lorg/json/JSONObject;Z)V
    .locals 6

    .line 1
    const-string p0, "otherId"

    .line 2
    .line 3
    invoke-virtual {p2, p0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v3

    .line 7
    const-string p0, "from"

    .line 8
    .line 9
    invoke-virtual {p2, p0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v4

    .line 13
    const-string p0, "likeProfileId"

    .line 14
    .line 15
    invoke-virtual {p2, p0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v5

    .line 19
    new-instance v0, Ll/cdk0;

    .line 20
    .line 21
    move-object v2, p1

    .line 22
    move v1, p3

    .line 23
    invoke-direct/range {v0 .. v5}, Ll/cdk0;-><init>(ZLl/xc00;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v0}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public w0(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 6
    .param p1    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const-string v0, "tagParams"

    .line 2
    .line 3
    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "callback"

    .line 8
    .line 9
    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    instance-of p2, p2, Lcom/p1/mobile/putong/core/newui/profile/TagChooseMkAct;

    .line 24
    .line 25
    if-eqz p2, :cond_2

    .line 26
    .line 27
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    check-cast p2, Lcom/p1/mobile/putong/core/newui/profile/TagChooseMkAct;

    .line 32
    .line 33
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/profile/TagChooseMkAct;->r2()Ljava/util/ArrayList;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 38
    .line 39
    .line 40
    const/4 v3, 0x0

    .line 41
    :goto_0
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    if-ge v3, v4, :cond_1

    .line 46
    .line 47
    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    const-string v5, "tagID"

    .line 52
    .line 53
    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    add-int/lit8 v3, v3, 0x1

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_1
    new-instance v0, Ll/yck0;

    .line 64
    .line 65
    invoke-direct {v0, p2, v2}, Ll/yck0;-><init>(Lcom/p1/mobile/putong/core/newui/profile/TagChooseMkAct;Ljava/util/ArrayList;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p2, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 69
    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_2
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 73
    .line 74
    .line 75
    move-result-object p2

    .line 76
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 77
    .line 78
    .line 79
    :goto_1
    const/4 p2, 0x0

    .line 80
    invoke-virtual {p0, p1, v1, p2}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->n1(Ll/xc00;Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public final x0(Ll/xc00;Ljava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v1, "success"

    .line 7
    .line 8
    const-string v2, "false"

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :catch_0
    move-exception v1

    .line 15
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 16
    .line 17
    .line 18
    :goto_0
    invoke-virtual {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->t0(Ll/xc00;Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public y0(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 2
    .param p1    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const-string v0, "preview"

    .line 2
    .line 3
    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-string v1, "callback"

    .line 8
    .line 9
    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-virtual {p0, p1, v0, p2}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->z0(Ll/xc00;ZLjava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public z0(Ll/xc00;ZLjava/lang/String;)V
    .locals 3
    .param p1    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ll/uxj0;->a:Ll/uxj0;

    .line 6
    .line 7
    invoke-static {v1}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {v1, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    new-instance v2, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation$a;

    .line 20
    .line 21
    invoke-direct {v2, p0}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation$a;-><init>(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-virtual {v1, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    new-instance v2, Ll/qbk0;

    .line 37
    .line 38
    invoke-direct {v2, p2}, Ll/qbk0;-><init>(Z)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    new-instance v1, Ll/rbk0;

    .line 46
    .line 47
    invoke-direct {v1}, Ll/rbk0;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p2, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    new-instance v1, Ll/tbk0;

    .line 55
    .line 56
    invoke-direct {v1}, Ll/tbk0;-><init>()V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p2, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    new-instance v1, Ll/ubk0;

    .line 64
    .line 65
    invoke-direct {v1}, Ll/ubk0;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p2, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object p2

    .line 72
    invoke-virtual {v0, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object p2

    .line 76
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {p2, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 81
    .line 82
    .line 83
    move-result-object p2

    .line 84
    new-instance v0, Ll/vbk0;

    .line 85
    .line 86
    invoke-direct {v0, p0, p1, p3}, Ll/vbk0;-><init>(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;Ll/xc00;Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    new-instance v1, Ll/wbk0;

    .line 90
    .line 91
    invoke-direct {v1, p0, p1, p3}, Ll/wbk0;-><init>(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;Ll/xc00;Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 99
    .line 100
    .line 101
    return-void
.end method
