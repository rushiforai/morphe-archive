.class public Ll/j1a;
.super Ljava/lang/Object;
.source "SourceFile"


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

.method public static varargs A(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;Lcom/p1/mobile/putong/data/LikeFrom;Ll/y20;Ll/y20;Z[Z)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/data/User;",
            "Z",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/LikeFrom;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/Relationship;",
            ">;",
            "Ll/y20<",
            "Ljava/lang/Throwable;",
            ">;Z[Z)V"
        }
    .end annotation

    .line 1
    const/4 v8, 0x0

    .line 2
    const/4 v9, 0x0

    .line 3
    const/4 v2, 0x0

    .line 4
    move-object v0, p0

    .line 5
    move-object v1, p1

    .line 6
    move v3, p2

    .line 7
    move-object v4, p3

    .line 8
    move-object/from16 v5, p4

    .line 9
    .line 10
    move-object/from16 v6, p5

    .line 11
    .line 12
    move-object/from16 v7, p6

    .line 13
    .line 14
    move/from16 v10, p7

    .line 15
    .line 16
    move-object/from16 v11, p8

    .line 17
    .line 18
    invoke-static/range {v0 .. v11}, Ll/j1a;->B(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZLjava/lang/String;Lcom/p1/mobile/putong/data/LikeFrom;Ll/y20;Ll/y20;Ljava/lang/String;Ljava/lang/String;Z[Z)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static varargs B(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZLjava/lang/String;Lcom/p1/mobile/putong/data/LikeFrom;Ll/y20;Ll/y20;Ljava/lang/String;Ljava/lang/String;Z[Z)V
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/data/User;",
            "ZZ",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/LikeFrom;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/Relationship;",
            ">;",
            "Ll/y20<",
            "Ljava/lang/Throwable;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z[Z)V"
        }
    .end annotation

    .line 1
    invoke-static/range {p9 .. p9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2
    const-string v0, "p_suggest_users_home_view,e_superlike,click"

    move-object v11, v0

    goto :goto_0

    :cond_0
    move-object/from16 v11, p9

    .line 3
    :goto_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    invoke-static {v0}, Lcom/p1/mobile/putong/api/api/Network;->isConnected(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 4
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->B2:I

    invoke-static {v0}, Ll/o1j0;->n(I)V

    return-void

    .line 5
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    move-result-object v0

    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->so()Z

    move-result v0

    if-eqz v0, :cond_7

    if-eqz p2, :cond_7

    .line 6
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/c;->o3()Lcom/p1/mobile/putong/data/Counter;

    move-result-object v0

    if-nez v0, :cond_2

    const/4 v0, 0x0

    :goto_1
    move-object v12, v0

    goto :goto_2

    .line 7
    :cond_2
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Counter;->superLikeLimit:Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    goto :goto_1

    .line 8
    :goto_2
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isJailed()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 10
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    move-result-object v0

    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->startJailedDialogLikeAct()V

    return-void

    .line 11
    :cond_3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isNameFake()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v0

    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object v0

    invoke-interface {v0, p0}, Ll/r97;->A(Lcom/p1/mobile/android/app/Act;)V

    return-void

    .line 13
    :cond_4
    sget-object v2, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_SUPERLIKE_PKG:Lcom/p1/mobile/putong/core/data/PurchaseType;

    invoke-static {v0, v2}, Ll/qj90;->c(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    move-result v0

    if-nez v0, :cond_5

    .line 14
    invoke-static {v12}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v0

    .line 16
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object v0

    .line 17
    invoke-virtual {v12}, Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;->remainToday()I

    move-result v2

    invoke-interface {v0, v2}, Ll/r97;->A3(I)I

    move-result v0

    if-nez v0, :cond_5

    .line 18
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object v0

    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->vip_super_like:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 20
    invoke-interface {v0, p0, v11, v2, p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->L6(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Lcom/p1/mobile/putong/data/User;)V

    return-void

    .line 21
    :cond_5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v0

    .line 22
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object v13

    new-instance v0, Ll/t0a;

    move-object v1, p0

    move-object v2, p1

    move/from16 v3, p3

    move-object/from16 v4, p4

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    move/from16 v9, p10

    move-object/from16 v10, p11

    invoke-direct/range {v0 .. v10}, Ll/t0a;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;Lcom/p1/mobile/putong/data/LikeFrom;Ll/y20;Ll/y20;Ljava/lang/String;Z[Z)V

    .line 23
    invoke-interface {v13, p0, v0}, Ll/r97;->U5(Lcom/p1/mobile/android/app/Act;Ll/x20;)Z

    move-result v0

    if-eqz v0, :cond_6

    return-void

    .line 24
    :cond_6
    invoke-static {v12}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v0

    .line 26
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object v0

    .line 27
    invoke-virtual {v12}, Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;->remainToday()I

    move-result v2

    invoke-interface {v0, v2}, Ll/r97;->A3(I)I

    move-result v0

    if-nez v0, :cond_7

    .line 28
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v0

    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object v0

    invoke-interface {v0, p0, v11}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Uh(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    return-void

    :cond_7
    const/4 v0, 0x0

    const/4 v1, 0x0

    move-object v2, p0

    move-object v3, p1

    move/from16 v4, p2

    move/from16 v5, p3

    move-object/from16 v6, p4

    move-object/from16 v7, p5

    move-object/from16 v8, p6

    move-object/from16 v9, p7

    move-object/from16 v10, p8

    move/from16 v11, p10

    move-object/from16 v12, p11

    .line 29
    invoke-static/range {v0 .. v12}, Ll/j1a;->r(ZZLcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZLjava/lang/String;Lcom/p1/mobile/putong/data/LikeFrom;Ll/y20;Ll/y20;Ljava/lang/String;Z[Z)V

    return-void
.end method

.method public static C()Z
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/c;->o3()Lcom/p1/mobile/putong/data/Counter;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Counter;->likeLimit:Lcom/p1/mobile/putong/data/CounterLikeLimit;

    .line 20
    .line 21
    :goto_0
    if-eqz v1, :cond_1

    .line 22
    .line 23
    iget v2, v1, Lcom/p1/mobile/putong/data/CounterLikeLimit;->remaining:I

    .line 24
    .line 25
    if-nez v2, :cond_1

    .line 26
    .line 27
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/CounterLikeLimit;->resetNowMillis()J

    .line 28
    .line 29
    .line 30
    move-result-wide v1

    .line 31
    const-wide/16 v3, 0x0

    .line 32
    .line 33
    cmp-long v1, v1, v3

    .line 34
    .line 35
    if-lez v1, :cond_1

    .line 36
    .line 37
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_LIKENOLIMIT_PKG:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 38
    .line 39
    invoke-static {v0, v1}, Ll/qj90;->c(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_1

    .line 44
    .line 45
    const/4 v0, 0x1

    .line 46
    return v0

    .line 47
    :cond_1
    const/4 v0, 0x0

    .line 48
    return v0
.end method

.method public static synthetic a(Ljava/lang/String;Ljava/util/List;)Lrx/c;
    .locals 10

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-wide/16 v0, 0x0

    .line 8
    .line 9
    :goto_0
    move-wide v4, v0

    .line 10
    goto :goto_1

    .line 11
    :cond_0
    const/4 v0, 0x0

    .line 12
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Lcom/p1/mobile/putong/core/data/Message;

    .line 17
    .line 18
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :goto_1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    iget-object v2, p1, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 24
    .line 25
    const/4 v8, 0x0

    .line 26
    const/4 v9, 0x0

    .line 27
    const-wide/16 v6, 0x0

    .line 28
    .line 29
    move-object v3, p0

    .line 30
    invoke-virtual/range {v2 .. v9}, Lcom/p1/mobile/putong/core/api/j;->A5(Ljava/lang/String;DJZZ)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0
.end method

.method public static synthetic b(ZLcom/p1/mobile/putong/data/Relationship;Lcom/p1/mobile/putong/data/User;Z)V
    .locals 1

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-interface {p0, p1, p2, v0, p3}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->processMomentLikeStatusChanged(Lcom/p1/mobile/putong/data/Relationship;Lcom/p1/mobile/putong/data/User;ZZ)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;Lcom/p1/mobile/putong/data/LikeFrom;Ll/y20;Ll/y20;Ljava/lang/String;Z[Z)V
    .locals 13

    .line 1
    const/4 v1, 0x0

    .line 2
    const/4 v4, 0x1

    .line 3
    const/4 v0, 0x0

    .line 4
    move-object v2, p0

    .line 5
    move-object v3, p1

    .line 6
    move v5, p2

    .line 7
    move-object/from16 v6, p3

    .line 8
    .line 9
    move-object/from16 v7, p4

    .line 10
    .line 11
    move-object/from16 v8, p5

    .line 12
    .line 13
    move-object/from16 v9, p6

    .line 14
    .line 15
    move-object/from16 v10, p7

    .line 16
    .line 17
    move/from16 v11, p8

    .line 18
    .line 19
    move-object/from16 v12, p9

    .line 20
    .line 21
    invoke-static/range {v0 .. v12}, Ll/j1a;->r(ZZLcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZLjava/lang/String;Lcom/p1/mobile/putong/data/LikeFrom;Ll/y20;Ll/y20;Ljava/lang/String;Z[Z)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Message;->isLocal()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 14
    .line 15
    const-string v1, "text"

    .line 16
    .line 17
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 24
    .line 25
    const-string v0, "state_like"

    .line 26
    .line 27
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_1

    .line 32
    .line 33
    :cond_0
    const/4 p0, 0x1

    .line 34
    goto :goto_0

    .line 35
    :cond_1
    const/4 p0, 0x0

    .line 36
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0
.end method

.method public static synthetic e(Ll/y20;Ljava/lang/String;Lcom/p1/mobile/putong/data/Channel;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-interface {p0, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    instance-of p0, p3, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 7
    .line 8
    if-eqz p0, :cond_2

    .line 9
    .line 10
    check-cast p3, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 11
    .line 12
    iget p0, p3, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 13
    .line 14
    const p2, 0x9c6a

    .line 15
    .line 16
    .line 17
    if-eq p0, p2, :cond_1

    .line 18
    .line 19
    const p2, 0x9c6c

    .line 20
    .line 21
    .line 22
    if-eq p0, p2, :cond_1

    .line 23
    .line 24
    const p2, 0x9c6d

    .line 25
    .line 26
    .line 27
    if-ne p0, p2, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const p2, 0x9c6e

    .line 31
    .line 32
    .line 33
    if-ne p0, p2, :cond_9

    .line 34
    .line 35
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 38
    .line 39
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/g;->ap(Ljava/lang/String;)Lrx/c;

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_1
    :goto_0
    const-string p0, "\u5bf9\u65b9\u8d26\u53f7\u5f02\u5e38"

    .line 44
    .line 45
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_2
    instance-of p0, p3, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 50
    .line 51
    if-eqz p0, :cond_9

    .line 52
    .line 53
    check-cast p3, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 54
    .line 55
    invoke-static {p3}, Ll/g39;->e(Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;)Z

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    if-eqz p0, :cond_8

    .line 60
    .line 61
    const-string p0, "reply_thanks"

    .line 62
    .line 63
    invoke-static {p2, p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    const-string p3, "red_flower"

    .line 68
    .line 69
    if-nez p0, :cond_4

    .line 70
    .line 71
    invoke-static {p2, p3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    if-eqz p0, :cond_3

    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_3
    const-string p0, "\u5bf9\u65b9\u540c\u610f\u914d\u5bf9\u540e\u53ef\u53d1\u9001\u6d88\u606f\uff0c\u8bf7\u8010\u5fc3\u7b49\u5f85"

    .line 79
    .line 80
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_4
    :goto_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-interface {p0, p1}, Ll/qhk0;->getUserById(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    if-nez p0, :cond_5

    .line 93
    .line 94
    const/4 p0, 0x0

    .line 95
    goto :goto_2

    .line 96
    :cond_5
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 97
    .line 98
    :goto_2
    invoke-static {p2, p3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 99
    .line 100
    .line 101
    move-result p1

    .line 102
    if-eqz p1, :cond_6

    .line 103
    .line 104
    const-string p1, "\u5c0f\u7ea2\u82b1"

    .line 105
    .line 106
    goto :goto_3

    .line 107
    :cond_6
    const-string p1, "\u793c\u8c8c\u56de\u8c22"

    .line 108
    .line 109
    :goto_3
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 110
    .line 111
    .line 112
    move-result p2

    .line 113
    if-eqz p2, :cond_7

    .line 114
    .line 115
    const-string p0, "\u4f60\u5df2\u53d1\u9001\u8fc7"

    .line 116
    .line 117
    invoke-virtual {p0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    return-void

    .line 125
    :cond_7
    new-instance p2, Ljava/lang/StringBuilder;

    .line 126
    .line 127
    const-string p3, "\u4f60\u5df2\u5411"

    .line 128
    .line 129
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    const-string p0, "\u53d1\u9001\u8fc7"

    .line 136
    .line 137
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    return-void

    .line 151
    :cond_8
    invoke-static {p3}, Ll/g39;->d(Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;)Z

    .line 152
    .line 153
    .line 154
    move-result p0

    .line 155
    if-eqz p0, :cond_9

    .line 156
    .line 157
    iget-object p0, p3, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->message:Ljava/lang/String;

    .line 158
    .line 159
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 160
    .line 161
    .line 162
    :cond_9
    return-void
.end method

.method public static synthetic f(Ll/y20;Ll/vg60;)V
    .locals 0

    .line 1
    iget-object p1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p1}, Ll/j1a;->s(Ljava/util/List;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1, p0}, Ll/j1a;->q(Ljava/util/List;Ll/y20;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic g(Ll/y20;Ljava/lang/Throwable;)V
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
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public static synthetic h(Ll/y20;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/j;->J6()Lrx/c;

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic i(Ll/y20;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/GreetingHotLevelInfo;)V
    .locals 4

    .line 1
    iget-object v0, p3, Lcom/p1/mobile/putong/core/data/GreetingHotLevelInfo;->greetingPermissions:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/kyb;->a(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    const/4 v2, 0x0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p3, Lcom/p1/mobile/putong/core/data/GreetingHotLevelInfo;->greetingPermissions:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/p1/mobile/putong/core/data/GreetingPermission;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    move-object v0, v2

    .line 21
    :goto_0
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    if-eqz v3, :cond_1

    .line 26
    .line 27
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/GreetingPermission;->enable:Z

    .line 28
    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_6

    .line 36
    .line 37
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 38
    .line 39
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_1
    iget-object v0, p3, Lcom/p1/mobile/putong/core/data/GreetingHotLevelInfo;->greetings:Ljava/util/List;

    .line 44
    .line 45
    invoke-static {v0}, Ll/kyb;->a(Ljava/util/Collection;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-nez v0, :cond_2

    .line 50
    .line 51
    iget-object v0, p3, Lcom/p1/mobile/putong/core/data/GreetingHotLevelInfo;->greetings:Ljava/util/List;

    .line 52
    .line 53
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    move-object v2, v0

    .line 58
    check-cast v2, Lcom/p1/mobile/putong/core/data/Greeting;

    .line 59
    .line 60
    :cond_2
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-eqz v0, :cond_3

    .line 65
    .line 66
    invoke-static {p1, p2, p0}, Ll/j1a;->x(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_3
    iget-object v0, p3, Lcom/p1/mobile/putong/core/data/GreetingHotLevelInfo;->hotLevels:Ljava/util/List;

    .line 71
    .line 72
    invoke-static {v0}, Ll/kyb;->a(Ljava/util/Collection;)Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-nez v0, :cond_5

    .line 77
    .line 78
    iget-object p3, p3, Lcom/p1/mobile/putong/core/data/GreetingHotLevelInfo;->hotLevels:Ljava/util/List;

    .line 79
    .line 80
    invoke-interface {p3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object p3

    .line 84
    check-cast p3, Lcom/p1/mobile/putong/core/data/HotLevel;

    .line 85
    .line 86
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    if-eqz v0, :cond_6

    .line 91
    .line 92
    iget p3, p3, Lcom/p1/mobile/putong/core/data/HotLevel;->level:I

    .line 93
    .line 94
    if-lez p3, :cond_4

    .line 95
    .line 96
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    move-result p1

    .line 100
    if-eqz p1, :cond_6

    .line 101
    .line 102
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 103
    .line 104
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 105
    .line 106
    .line 107
    return-void

    .line 108
    :cond_4
    invoke-static {p1, p2, p0}, Ll/j1a;->x(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;)V

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    :cond_5
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    move-result p1

    .line 116
    if-eqz p1, :cond_6

    .line 117
    .line 118
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 119
    .line 120
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 121
    .line 122
    .line 123
    :cond_6
    return-void
.end method

.method public static synthetic j(Ljava/lang/String;Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 0

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/joa;->H3()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    invoke-static {}, Ll/ela;->r3()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-lez p0, :cond_0

    .line 18
    .line 19
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->d9()V

    .line 24
    .line 25
    .line 26
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/joa;->v4()Lrx/c;

    .line 31
    .line 32
    .line 33
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->k1:Ll/ela;

    .line 36
    .line 37
    invoke-virtual {p0}, Ll/ela;->A3()Lrx/c;

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method

.method public static synthetic k(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0, p0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Zk(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic l(Ljava/lang/String;Ljava/lang/Integer;)Ljava/util/List;
    .locals 1

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 2
    .line 3
    iget-object p1, p1, Ll/il8;->c:Ll/t600;

    .line 4
    .line 5
    const-string v0, ""

    .line 6
    .line 7
    invoke-virtual {p1, p0, v0}, Ll/t600;->O(Ljava/lang/String;Ljava/lang/String;)Ll/wzh0$a;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/wzh0$a;->j()Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    const-string v0, "fake_id_"

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public static synthetic n([ZZLcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;ZLl/y20;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0, p8}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->kq(Lcom/p1/mobile/putong/data/Relationship;)V

    .line 6
    .line 7
    .line 8
    array-length p0, p0

    .line 9
    if-nez p0, :cond_2

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    const-string p0, "\u8d85\u7ea7\u559c\u6b22\u5df2\u53d1\u9001"

    .line 14
    .line 15
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_0
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    const-string p0, "\u5979"

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    const-string p0, "\u4ed6"

    .line 35
    .line 36
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    const-string v1, "\u559c\u6b22\u6210\u529f\uff0c"

    .line 39
    .line 40
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string p0, "\u7684\u52a8\u6001\u66f4\u65b0\u5c06\u4f1a\u51fa\u73b0\u5728\u300c\u559c\u6b22\u7684\u4eba\u300d"

    .line 47
    .line 48
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    :cond_2
    :goto_1
    iget-object p0, p8, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 59
    .line 60
    const-string v0, "liked"

    .line 61
    .line 62
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    if-eqz p0, :cond_3

    .line 67
    .line 68
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 69
    .line 70
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 71
    .line 72
    iget v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->y0:I

    .line 73
    .line 74
    add-int/lit8 v0, v0, 0x1

    .line 75
    .line 76
    iput v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->y0:I

    .line 77
    .line 78
    iget v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->z0:I

    .line 79
    .line 80
    add-int/lit8 v0, v0, 0x1

    .line 81
    .line 82
    iput v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->z0:I

    .line 83
    .line 84
    goto :goto_2

    .line 85
    :cond_3
    iget-object p0, p8, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 86
    .line 87
    const-string v0, "matched"

    .line 88
    .line 89
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 90
    .line 91
    .line 92
    move-result p0

    .line 93
    if-eqz p0, :cond_4

    .line 94
    .line 95
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 96
    .line 97
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 98
    .line 99
    const/4 v0, 0x0

    .line 100
    iput v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->y0:I

    .line 101
    .line 102
    iput v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->z0:I

    .line 103
    .line 104
    invoke-static {p3, p2, p1, p8}, Ll/j1a;->w(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLcom/p1/mobile/putong/data/Relationship;)V

    .line 105
    .line 106
    .line 107
    :cond_4
    :goto_2
    if-eqz p1, :cond_5

    .line 108
    .line 109
    iget-object p0, p8, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 110
    .line 111
    const-string v0, "superLiked"

    .line 112
    .line 113
    invoke-static {v0}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    const-string p0, "superliked"

    .line 121
    .line 122
    invoke-static {p0}, Lcom/p1/mobile/putong/data/RelationshipStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    iput-object p0, p8, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 127
    .line 128
    iput-object p8, p2, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 129
    .line 130
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    iget-object v0, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 135
    .line 136
    invoke-interface {p0, v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->refreshUser(Ljava/lang/String;)Lrx/c;

    .line 137
    .line 138
    .line 139
    :cond_5
    new-instance p0, Ll/g1a;

    .line 140
    .line 141
    invoke-direct {p0, p4, p8, p2, p1}, Ll/g1a;-><init>(ZLcom/p1/mobile/putong/data/Relationship;Lcom/p1/mobile/putong/data/User;Z)V

    .line 142
    .line 143
    .line 144
    invoke-static {p3, p0}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 145
    .line 146
    .line 147
    invoke-static {p5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 148
    .line 149
    .line 150
    move-result p0

    .line 151
    if-eqz p0, :cond_6

    .line 152
    .line 153
    invoke-interface {p5, p8}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 154
    .line 155
    .line 156
    :cond_6
    invoke-static {p6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 157
    .line 158
    .line 159
    move-result p0

    .line 160
    if-nez p0, :cond_8

    .line 161
    .line 162
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 163
    .line 164
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 165
    .line 166
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/j;->h0:Lrx/subjects/b;

    .line 167
    .line 168
    iget-object p1, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 169
    .line 170
    iget-object p3, p8, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 171
    .line 172
    invoke-static {p1, p3}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 177
    .line 178
    .line 179
    invoke-static {p7}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 180
    .line 181
    .line 182
    move-result p0

    .line 183
    if-eqz p0, :cond_7

    .line 184
    .line 185
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 186
    .line 187
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 188
    .line 189
    invoke-virtual {p0, p7}, Lcom/p1/mobile/putong/core/api/g;->ap(Ljava/lang/String;)Lrx/c;

    .line 190
    .line 191
    .line 192
    :cond_7
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 193
    .line 194
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->k1:Ll/ela;

    .line 195
    .line 196
    iget-object p1, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 197
    .line 198
    invoke-virtual {p0, p1}, Ll/ela;->I3(Ljava/lang/String;)V

    .line 199
    .line 200
    .line 201
    :cond_8
    return-void
.end method

.method public static synthetic o(Ll/y20;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static p(ZLcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/y20;Ll/y20;)V
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/data/User;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/Relationship;",
            ">;",
            "Ll/y20<",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    new-array v13, v0, [Z

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    aput-boolean v0, v13, v0

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    const/4 v5, 0x0

    .line 9
    const/4 v6, 0x0

    .line 10
    const/4 v7, 0x0

    .line 11
    const/4 v8, 0x0

    .line 12
    const/4 v11, 0x0

    .line 13
    const/4 v12, 0x0

    .line 14
    move v2, p0

    .line 15
    move-object v3, p1

    .line 16
    move-object/from16 v4, p2

    .line 17
    .line 18
    move-object/from16 v9, p3

    .line 19
    .line 20
    move-object/from16 v10, p4

    .line 21
    .line 22
    invoke-static/range {v1 .. v13}, Ll/j1a;->r(ZZLcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZLjava/lang/String;Lcom/p1/mobile/putong/data/LikeFrom;Ll/y20;Ll/y20;Ljava/lang/String;Z[Z)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static q(Ljava/util/List;Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ll/z0a;

    .line 8
    .line 9
    invoke-direct {v0}, Ll/z0a;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-static {p0, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 29
    .line 30
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public static varargs r(ZZLcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZLjava/lang/String;Lcom/p1/mobile/putong/data/LikeFrom;Ll/y20;Ll/y20;Ljava/lang/String;Z[Z)V
    .locals 22
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZ",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/data/User;",
            "ZZ",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/LikeFrom;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/Relationship;",
            ">;",
            "Ll/y20<",
            "Ljava/lang/Throwable;",
            ">;",
            "Ljava/lang/String;",
            "Z[Z)V"
        }
    .end annotation

    move-object/from16 v4, p2

    move-object/from16 v3, p3

    if-nez p4, :cond_0

    .line 1
    invoke-static {v3}, Ll/j1a;->t(Lcom/p1/mobile/putong/data/User;)Z

    move-result v0

    if-eqz v0, :cond_0

    if-nez p0, :cond_0

    return-void

    :cond_0
    if-nez p4, :cond_1

    .line 2
    const-string v0, "moment"

    move-object/from16 v13, p7

    invoke-static {v13, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {}, Ll/j1a;->C()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v0

    .line 4
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object v0

    const-string v1, "p_home,likelimit"

    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->vip_unlimited_likes:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 5
    invoke-interface {v0, v4, v1, v2, v3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->L6(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Lcom/p1/mobile/putong/data/User;)V

    return-void

    :cond_1
    move-object/from16 v13, p7

    :cond_2
    if-nez p5, :cond_3

    if-nez p0, :cond_3

    .line 6
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    iget-object v1, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/j;->k0:Ljava/lang/String;

    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/j;->i0:Lrx/subjects/b;

    invoke-virtual {v0, v1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 8
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->k1:Ll/ela;

    iget-object v1, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ll/ela;->t3(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v5, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    const/16 v16, 0x0

    const/16 v19, 0x1

    const/4 v8, 0x1

    const/4 v10, 0x0

    const/4 v12, 0x0

    const/4 v14, 0x1

    const/4 v15, 0x0

    move/from16 v6, p0

    move/from16 v9, p4

    move/from16 v18, p5

    move-object/from16 v20, p10

    move/from16 v21, p11

    move-object v11, v3

    move-object/from16 v17, v7

    move/from16 v7, p1

    .line 10
    invoke-virtual/range {v5 .. v21}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->b8(ZZZZLjava/util/Map;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Lcom/p1/mobile/putong/data/LikeFrom;ZLcom/p1/mobile/putong/data/LikeExtraData;ILjava/lang/String;ZILjava/lang/String;Z)Lrx/c;

    move-result-object v0

    move-object/from16 v7, v17

    .line 11
    invoke-virtual {v4, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    move-result-object v0

    .line 12
    new-instance v1, Ll/a1a;

    invoke-direct {v1, v7}, Ll/a1a;-><init>(Ljava/lang/String;)V

    .line 13
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    move-result-object v9

    new-instance v0, Ll/b1a;

    move/from16 v5, p0

    move-object/from16 v3, p3

    move/from16 v2, p4

    move-object/from16 v8, p6

    move-object/from16 v6, p8

    move-object/from16 v1, p12

    invoke-direct/range {v0 .. v8}, Ll/b1a;-><init>([ZZLcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;ZLl/y20;Ljava/lang/String;Ljava/lang/String;)V

    new-instance v1, Ll/c1a;

    move-object/from16 v2, p9

    invoke-direct {v1, v2}, Ll/c1a;-><init>(Ll/y20;)V

    .line 14
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    move-result-object v0

    .line 15
    invoke-virtual {v9, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    return-void
.end method

.method public static s(Ljava/util/List;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/y0a;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/y0a;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-static {p0, v1}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_0
    return-object v0
.end method

.method public static t(Lcom/p1/mobile/putong/data/User;)Z
    .locals 1

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-static {p0}, Ll/j1a;->v(Lcom/p1/mobile/putong/data/User;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    xor-int/lit8 p0, p0, 0x1

    .line 13
    .line 14
    return p0

    .line 15
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public static u(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, p1, v1}, Lcom/p1/mobile/putong/core/api/j;->p5(Ljava/lang/String;Z)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/d1a;

    .line 15
    .line 16
    invoke-direct {v1}, Ll/d1a;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Ll/e1a;

    .line 24
    .line 25
    invoke-direct {v1, p2, p0, p1}, Ll/e1a;-><init>(Ll/y20;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    new-instance p0, Ll/f1a;

    .line 29
    .line 30
    invoke-direct {p0, p2}, Ll/f1a;-><init>(Ll/y20;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public static v(Lcom/p1/mobile/putong/data/User;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 6
    .line 7
    const-string v1, "unknown_"

    .line 8
    .line 9
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_2

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 18
    .line 19
    const-string v1, "default"

    .line 20
    .line 21
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_2

    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 30
    .line 31
    const-string v1, "liked"

    .line 32
    .line 33
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_0

    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->relationshipExtensions:Lcom/p1/mobile/putong/data/RelationshipExtensions;

    .line 42
    .line 43
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_0

    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 50
    .line 51
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->relationshipExtensions:Lcom/p1/mobile/putong/data/RelationshipExtensions;

    .line 52
    .line 53
    iget-object v0, v0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->relationType:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 54
    .line 55
    const-string v1, "DEFAULT"

    .line 56
    .line 57
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-nez v0, :cond_2

    .line 62
    .line 63
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 64
    .line 65
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 66
    .line 67
    const-string v0, "disliked"

    .line 68
    .line 69
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    if-eqz p0, :cond_1

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_1
    const/4 p0, 0x0

    .line 77
    return p0

    .line 78
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 79
    return p0
.end method

.method public static w(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLcom/p1/mobile/putong/data/Relationship;)V
    .locals 0

    .line 1
    iget-object p0, p3, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 2
    .line 3
    const-string p1, "matched"

    .line 4
    .line 5
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_2

    .line 10
    .line 11
    iget-object p0, p3, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 12
    .line 13
    const-string p1, "xmasActivity"

    .line 14
    .line 15
    invoke-static {p1}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-nez p0, :cond_2

    .line 24
    .line 25
    iget-object p0, p3, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    const/4 p1, 0x0

    .line 32
    if-eqz p0, :cond_0

    .line 33
    .line 34
    iget-object p0, p3, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    check-cast p0, Lcom/p1/mobile/putong/data/MatchFrom;

    .line 41
    .line 42
    const-string p2, "superLikedEach"

    .line 43
    .line 44
    invoke-static {p0, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    if-eqz p0, :cond_0

    .line 49
    .line 50
    return-void

    .line 51
    :cond_0
    iget-object p0, p3, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 52
    .line 53
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    if-eqz p0, :cond_1

    .line 58
    .line 59
    iget-object p0, p3, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 60
    .line 61
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    check-cast p0, Lcom/p1/mobile/putong/data/MatchFrom;

    .line 66
    .line 67
    const-string p2, "superLiked"

    .line 68
    .line 69
    invoke-static {p0, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    if-eqz p0, :cond_1

    .line 74
    .line 75
    return-void

    .line 76
    :cond_1
    iget-object p0, p3, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 77
    .line 78
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    if-eqz p0, :cond_2

    .line 83
    .line 84
    iget-object p0, p3, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 85
    .line 86
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    check-cast p0, Lcom/p1/mobile/putong/data/MatchFrom;

    .line 91
    .line 92
    const-string p1, "secretcrush"

    .line 93
    .line 94
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 95
    .line 96
    .line 97
    :cond_2
    return-void
.end method

.method public static x(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/v0a;

    .line 19
    .line 20
    invoke-direct {v1, p1}, Ll/v0a;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/w0a;

    .line 28
    .line 29
    invoke-direct {v1, p1}, Ll/w0a;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p1, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    const/4 p1, 0x1

    .line 49
    invoke-virtual {p0, p1}, Lrx/c;->take(I)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    new-instance p1, Ll/x0a;

    .line 54
    .line 55
    invoke-direct {p1, p2}, Ll/x0a;-><init>(Ll/y20;)V

    .line 56
    .line 57
    .line 58
    invoke-static {p1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public static y(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Channel;Ll/y20;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/Channel;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Message;->new_()Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    .line 4
    move-result-object v3

    .line 5
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const-string v0, "text"

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, v3, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const-string v0, "moment_reference"

    .line 21
    .line 22
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, v3, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 27
    .line 28
    :goto_0
    iput-object p1, v3, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 29
    .line 30
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MessageReference;->new_()Lcom/p1/mobile/putong/core/data/MessageReference;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    const-string v0, "moment"

    .line 35
    .line 36
    iput-object v0, p1, Lcom/p1/mobile/putong/core/data/MessageReference;->type:Ljava/lang/String;

    .line 37
    .line 38
    iput-object p3, p1, Lcom/p1/mobile/putong/core/data/MessageReference;->id:Ljava/lang/String;

    .line 39
    .line 40
    iput-object p1, v3, Lcom/p1/mobile/putong/core/data/Message;->api_only_reference:Lcom/p1/mobile/putong/core/data/MessageReference;

    .line 41
    .line 42
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-nez p1, :cond_1

    .line 47
    .line 48
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-nez p1, :cond_1

    .line 53
    .line 54
    new-instance p1, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    const-string v0, "?source=moment&moment_id="

    .line 57
    .line 58
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    const-string p3, "&moment_owner_id="

    .line 65
    .line 66
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    :goto_1
    move-object v4, p1

    .line 77
    goto :goto_2

    .line 78
    :cond_1
    const/4 p1, 0x0

    .line 79
    goto :goto_1

    .line 80
    :goto_2
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 81
    .line 82
    iget-object v0, p1, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 83
    .line 84
    new-instance v5, Ll/h1a;

    .line 85
    .line 86
    invoke-direct {v5, p2}, Ll/h1a;-><init>(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    move-object v1, p2

    .line 90
    move-object v2, p5

    .line 91
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/api/j;->u6(Ljava/lang/String;Lcom/p1/mobile/putong/data/Channel;Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;Ll/x20;)Lrx/c;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    const/4 p1, 0x1

    .line 100
    invoke-virtual {p0, p1}, Lrx/c;->take(I)Lrx/c;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    new-instance p1, Ll/i1a;

    .line 105
    .line 106
    invoke-direct {p1, p6}, Ll/i1a;-><init>(Ll/y20;)V

    .line 107
    .line 108
    .line 109
    new-instance p2, Ll/u0a;

    .line 110
    .line 111
    invoke-direct {p2, p6, v1, v2}, Ll/u0a;-><init>(Ll/y20;Ljava/lang/String;Lcom/p1/mobile/putong/data/Channel;)V

    .line 112
    .line 113
    .line 114
    invoke-static {p1, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 119
    .line 120
    .line 121
    return-void
.end method

.method public static varargs z(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;Lcom/p1/mobile/putong/data/LikeFrom;Ll/y20;Ll/y20;Ljava/lang/String;[Z)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/data/User;",
            "Z",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/LikeFrom;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/Relationship;",
            ">;",
            "Ll/y20<",
            "Ljava/lang/Throwable;",
            ">;",
            "Ljava/lang/String;",
            "[Z)V"
        }
    .end annotation

    .line 1
    const/4 v9, 0x0

    .line 2
    const/4 v10, 0x0

    .line 3
    const/4 v2, 0x0

    .line 4
    move-object v0, p0

    .line 5
    move-object v1, p1

    .line 6
    move v3, p2

    .line 7
    move-object v4, p3

    .line 8
    move-object/from16 v5, p4

    .line 9
    .line 10
    move-object/from16 v6, p5

    .line 11
    .line 12
    move-object/from16 v7, p6

    .line 13
    .line 14
    move-object/from16 v8, p7

    .line 15
    .line 16
    move-object/from16 v11, p8

    .line 17
    .line 18
    invoke-static/range {v0 .. v11}, Ll/j1a;->B(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZLjava/lang/String;Lcom/p1/mobile/putong/data/LikeFrom;Ll/y20;Ll/y20;Ljava/lang/String;Ljava/lang/String;Z[Z)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
