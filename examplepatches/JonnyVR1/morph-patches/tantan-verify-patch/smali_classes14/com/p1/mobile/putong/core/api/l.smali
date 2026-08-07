.class public Lcom/p1/mobile/putong/core/api/l;
.super Ll/dy6;
.source "SourceFile"


# instance fields
.field public final R:Ll/byd0;

.field public final S:Ljava/lang/String;

.field public T:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/api/c;)V
    .locals 3

    .line 1
    invoke-direct {p0, p1}, Ll/dy6;-><init>(Lcom/p1/mobile/putong/core/api/c;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/byd0;

    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v1, "recall_membership_last_show_mills"

    .line 9
    .line 10
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-wide/16 v1, 0x0

    .line 29
    .line 30
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-direct {p1, v0, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 35
    .line 36
    .line 37
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/l;->R:Ll/byd0;

    .line 38
    .line 39
    const-string p1, "CoreInserterHelper"

    .line 40
    .line 41
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/l;->S:Ljava/lang/String;

    .line 42
    .line 43
    const/4 p1, 0x0

    .line 44
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/api/l;->T:Z

    .line 45
    .line 46
    return-void
.end method

.method public static synthetic a3()Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/r49;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/r49;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/data/RecallMembershipEnvelope;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/qi20;->f(Ll/pcj;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    return-object v0
.end method

.method public static synthetic b3(Lcom/p1/mobile/putong/data/Envelope;Ljava/lang/Throwable;)Ll/pf60;
    .locals 0

    .line 1
    new-instance p1, Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static synthetic c3(Lcom/p1/mobile/putong/core/api/l;Lcom/p1/mobile/putong/data/Envelope;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Lcom/p1/mobile/putong/data/Envelope;)Ll/pf60;
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/core/api/l;->A3(Lcom/p1/mobile/putong/data/Envelope;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Lcom/p1/mobile/putong/data/Envelope;)Ll/pf60;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic d3(Lcom/p1/mobile/putong/core/data/RecallMembershipEnvelope;)V
    .locals 3

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/RecallMembershipEnvelope;->data:Lcom/p1/mobile/putong/core/data/RecallMembershipData;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    new-instance v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 16
    .line 17
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;-><init>()V

    .line 18
    .line 19
    .line 20
    const-string v1, "VirtualCard"

    .line 21
    .line 22
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 23
    .line 24
    sget-object v1, Lcom/p1/mobile/putong/core/data/VirtualCardType;->IntlRecallMembershipCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 25
    .line 26
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 27
    .line 28
    invoke-static {}, Lcom/p1/mobile/putong/core/data/IntlInsertCardData;->new_()Lcom/p1/mobile/putong/core/data/IntlInsertCardData;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/RecallMembershipEnvelope;->data:Lcom/p1/mobile/putong/core/data/RecallMembershipData;

    .line 33
    .line 34
    iput-object p0, v1, Lcom/p1/mobile/putong/core/data/IntlInsertCardData;->recallMembership:Lcom/p1/mobile/putong/core/data/RecallMembershipData;

    .line 35
    .line 36
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->intlInsertCardData:Lcom/p1/mobile/putong/core/data/IntlInsertCardData;

    .line 37
    .line 38
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 41
    .line 42
    const/4 v1, 0x0

    .line 43
    const/4 v2, 0x1

    .line 44
    invoke-virtual {p0, v0, v1, v2}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->t6(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;IZ)V

    .line 45
    .line 46
    .line 47
    :cond_0
    return-void
.end method

.method public static synthetic e3(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic f3()Ll/x1d0;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/api/a;->P:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-static {v1}, Lcom/p1/mobile/putong/core/api/a;->B2(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    return-object v0
.end method

.method public static synthetic g3(Lcom/p1/mobile/putong/core/api/l;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/l;->C3(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic h3(Lcom/p1/mobile/putong/core/api/l;Lcom/p1/mobile/putong/data/Envelope;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/api/l;->B3(Lcom/p1/mobile/putong/data/Envelope;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic i3()Ll/x1d0;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/api/a;->P:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "/intl/membership/recall"

    .line 8
    .line 9
    invoke-static {v1}, Lcom/p1/mobile/putong/core/api/a;->G(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    return-object v0
.end method

.method public static synthetic j3(Lcom/p1/mobile/putong/data/CommonData;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    .line 6
    .line 7
    new-instance v1, Ll/n49;

    .line 8
    .line 9
    invoke-direct {v1}, Ll/n49;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-static {p0, v1}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-interface {v0, p0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Rf(Ljava/util/ArrayList;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static synthetic k3(Lcom/p1/mobile/putong/core/data/InsertCard;Lcom/p1/mobile/putong/core/data/InsertCard;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/data/InsertCard;->position:I

    .line 2
    .line 3
    iget p1, p1, Lcom/p1/mobile/putong/core/data/InsertCard;->position:I

    .line 4
    .line 5
    sub-int/2addr p0, p1

    .line 6
    return p0
.end method


# virtual methods
.method public final synthetic A3(Lcom/p1/mobile/putong/data/Envelope;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Lcom/p1/mobile/putong/data/Envelope;)Ll/pf60;
    .locals 16

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v3, p5

    .line 1
    new-instance v8, Landroid/util/SparseArray;

    invoke-direct {v8}, Landroid/util/SparseArray;-><init>()V

    .line 2
    const-class v2, Lcom/p1/mobile/putong/data/CommonData;

    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    move-result-object v4

    check-cast v4, Lcom/p1/mobile/putong/data/CommonData;

    .line 3
    iget-object v4, v4, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    invoke-static {v4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    move-result v4

    const/4 v9, 0x0

    if-eqz v4, :cond_0

    .line 4
    iput-boolean v9, v0, Lcom/p1/mobile/putong/core/api/l;->T:Z

    .line 5
    invoke-static {v1, v8}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    move-result-object v0

    return-object v0

    .line 6
    :cond_0
    const-class v4, Lcom/p1/mobile/putong/core/data/CoreData;

    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    move-result-object v4

    move-object v10, v4

    check-cast v10, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 7
    invoke-virtual {v3, v2}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    move-result-object v2

    move-object v11, v2

    check-cast v11, Lcom/p1/mobile/putong/data/CommonData;

    .line 8
    iget-object v2, v11, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 9
    invoke-static {}, Ll/gta;->e()Ll/gta;

    move-result-object v2

    .line 10
    invoke-virtual {v2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    move-result-object v2

    const-string v4, "recommend merge suggested data start"

    .line 11
    invoke-interface {v2, v4}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Dg(Ljava/lang/String;)V

    .line 12
    iget-object v2, v0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->U:Ll/fy6;

    new-instance v4, Ll/v49;

    invoke-direct {v4, v11}, Ll/v49;-><init>(Lcom/p1/mobile/putong/data/CommonData;)V

    invoke-virtual {v2, v4}, Ll/fy6;->a(Ll/x20;)V

    .line 13
    iget-object v2, v0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    const/4 v6, 0x0

    const/4 v7, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x1

    invoke-virtual/range {v2 .. v7}, Lcom/p1/mobile/putong/core/api/c;->y3(Lcom/p1/mobile/putong/data/Envelope;Ll/x20;ZZZ)V

    .line 14
    invoke-static {}, Ll/gta;->e()Ll/gta;

    move-result-object v2

    .line 15
    invoke-virtual {v2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    move-result-object v2

    const-string v4, "recommend merge suggested data end"

    .line 16
    invoke-interface {v2, v4}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Dg(Ljava/lang/String;)V

    .line 17
    :cond_1
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 18
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    move-result-object v5

    invoke-interface {v5, v3, v4}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->zd(Lcom/p1/mobile/putong/data/Envelope;Ljava/util/HashMap;)V

    .line 20
    invoke-static {}, Ll/gta;->e()Ll/gta;

    move-result-object v5

    .line 21
    invoke-virtual {v5}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    move-result-object v5

    .line 22
    invoke-interface {v5}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->s()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 23
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    move-result-object v5

    invoke-interface {v5, v3, v2}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Ee(Lcom/p1/mobile/putong/data/Envelope;Ljava/util/HashMap;)V

    .line 24
    :cond_2
    iget-object v3, v10, Lcom/p1/mobile/putong/core/data/CoreData;->intlInsertCardSets:Ljava/util/List;

    invoke-static {v3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    move-result v3

    if-nez v3, :cond_17

    .line 25
    iget-object v3, v10, Lcom/p1/mobile/putong/core/data/CoreData;->intlInsertCardSets:Ljava/util/List;

    new-instance v6, Ll/w49;

    invoke-direct {v6}, Ll/w49;-><init>()V

    invoke-static {v3, v6}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 26
    iget-object v3, v10, Lcom/p1/mobile/putong/core/data/CoreData;->intlInsertCardSets:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    move v6, v9

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_16

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/p1/mobile/putong/core/data/InsertCard;

    .line 27
    iget v12, v7, Lcom/p1/mobile/putong/core/data/InsertCard;->position:I

    if-nez v12, :cond_3

    const/4 v6, 0x1

    .line 28
    :cond_3
    iget v12, v7, Lcom/p1/mobile/putong/core/data/InsertCard;->cardType:I

    const/4 v13, 0x0

    const-string v14, "VirtualCard"

    packed-switch v12, :pswitch_data_0

    :cond_4
    :goto_1
    :pswitch_0
    move-object/from16 v15, p2

    move-object/from16 v12, p3

    move-object/from16 v9, p4

    goto/16 :goto_6

    .line 29
    :pswitch_1
    sget v12, Ll/uqb0;->f0:I

    if-nez v12, :cond_5

    goto :goto_1

    .line 30
    :cond_5
    iget-object v12, v7, Lcom/p1/mobile/putong/core/data/InsertCard;->id:Ljava/lang/String;

    iget-object v15, v11, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    invoke-virtual {v0, v12, v15}, Lcom/p1/mobile/putong/core/api/l;->t3(Ljava/lang/String;Ljava/util/List;)Lcom/p1/mobile/putong/data/User;

    move-result-object v12

    .line 31
    iget-object v15, v7, Lcom/p1/mobile/putong/core/data/InsertCard;->id:Ljava/lang/String;

    iget-object v9, v10, Lcom/p1/mobile/putong/core/data/CoreData;->floats:Ljava/util/List;

    invoke-virtual {v0, v15, v9}, Lcom/p1/mobile/putong/core/api/l;->q3(Ljava/lang/String;Ljava/util/List;)Lcom/p1/mobile/putong/core/data/FloatsCardData;

    move-result-object v9

    .line 32
    invoke-static {v12}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_4

    .line 33
    new-instance v15, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    invoke-direct {v15}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;-><init>()V

    .line 34
    sget-object v5, Lcom/p1/mobile/putong/core/data/VirtualCardType;->IntlPartnerActiveCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    iput-object v5, v15, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 35
    iput-object v14, v15, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 36
    new-instance v5, Lcom/p1/mobile/putong/core/data/FloatUserCardData;

    invoke-direct {v5}, Lcom/p1/mobile/putong/core/data/FloatUserCardData;-><init>()V

    .line 37
    iput-object v12, v5, Lcom/p1/mobile/putong/core/data/FloatUserCardData;->user:Lcom/p1/mobile/putong/data/User;

    .line 38
    iput-object v9, v5, Lcom/p1/mobile/putong/core/data/FloatUserCardData;->floatCardData:Lcom/p1/mobile/putong/core/data/FloatsCardData;

    .line 39
    invoke-virtual {v0, v7, v15, v13, v5}, Lcom/p1/mobile/putong/core/api/l;->m3(Lcom/p1/mobile/putong/core/data/InsertCard;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/core/data/BuzzUser;Lcom/p1/mobile/putong/core/data/FloatUserCardData;)V

    .line 40
    iget v5, v7, Lcom/p1/mobile/putong/core/data/InsertCard;->position:I

    invoke-virtual {v8, v5, v15}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_1

    .line 41
    :pswitch_2
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    move-result v5

    if-nez v5, :cond_a

    sget-object v5, Ll/uqb0;->b0:Ll/sre0;

    iget-object v5, v5, Ll/sre0;->c:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 42
    invoke-interface {v5}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->C8()Z

    move-result v5

    if-nez v5, :cond_6

    goto :goto_1

    .line 43
    :cond_6
    sget v5, Ll/uqb0;->f0:I

    if-nez v5, :cond_7

    goto :goto_1

    .line 44
    :cond_7
    iget-object v5, v7, Lcom/p1/mobile/putong/core/data/InsertCard;->id:Ljava/lang/String;

    iget-object v9, v11, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    invoke-virtual {v0, v5, v9}, Lcom/p1/mobile/putong/core/api/l;->t3(Ljava/lang/String;Ljava/util/List;)Lcom/p1/mobile/putong/data/User;

    move-result-object v5

    .line 45
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_a

    .line 46
    new-instance v9, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    invoke-direct {v9}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;-><init>()V

    .line 47
    iget-object v12, v5, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    iput-object v12, v9, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 48
    iget-object v13, v5, Lcom/p1/mobile/putong/data/User;->ussTags:Lcom/p1/mobile/putong/data/UssTags;

    iput-object v13, v9, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->ussTags:Lcom/p1/mobile/putong/data/UssTags;

    .line 49
    iget-object v13, v5, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    iput-object v13, v9, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 50
    invoke-virtual {v4, v12}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v12

    iput-boolean v12, v9, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->hasMoment:Z

    .line 51
    iget-object v5, v5, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-virtual {v2, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    iput-object v5, v9, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->userMedia:Ljava/util/List;

    .line 52
    iget-object v5, v10, Lcom/p1/mobile/putong/core/data/CoreData;->voices:Ljava/util/List;

    invoke-virtual {v0, v9, v5}, Lcom/p1/mobile/putong/core/api/l;->w3(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Ljava/util/List;)V

    .line 53
    invoke-virtual {v0, v7, v9}, Lcom/p1/mobile/putong/core/api/l;->l3(Lcom/p1/mobile/putong/core/data/InsertCard;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V

    .line 54
    iget v5, v7, Lcom/p1/mobile/putong/core/data/InsertCard;->position:I

    invoke-virtual {v8, v5, v9}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 55
    iget-object v5, v9, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    iget v7, v7, Lcom/p1/mobile/putong/core/data/InsertCard;->position:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    move-object/from16 v9, p4

    invoke-interface {v9, v5, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_8
    :goto_2
    move-object/from16 v15, p2

    :cond_9
    move-object/from16 v12, p3

    goto/16 :goto_6

    :cond_a
    move-object/from16 v9, p4

    goto :goto_2

    :pswitch_3
    move-object/from16 v9, p4

    .line 56
    iget-object v5, v7, Lcom/p1/mobile/putong/core/data/InsertCard;->id:Ljava/lang/String;

    iget-object v12, v11, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    invoke-virtual {v0, v5, v12}, Lcom/p1/mobile/putong/core/api/l;->t3(Ljava/lang/String;Ljava/util/List;)Lcom/p1/mobile/putong/data/User;

    move-result-object v5

    .line 57
    iget v12, v7, Lcom/p1/mobile/putong/core/data/InsertCard;->cardType:I

    const/4 v14, 0x5

    if-ne v14, v12, :cond_b

    .line 58
    iget-object v12, v7, Lcom/p1/mobile/putong/core/data/InsertCard;->id:Ljava/lang/String;

    iget-object v13, v10, Lcom/p1/mobile/putong/core/data/CoreData;->sames:Ljava/util/List;

    invoke-virtual {v0, v12, v13}, Lcom/p1/mobile/putong/core/api/l;->s3(Ljava/lang/String;Ljava/util/List;)Lcom/p1/mobile/putong/core/data/SamesCardData;

    move-result-object v13

    goto :goto_3

    :cond_b
    const/16 v14, 0xd

    if-ne v14, v12, :cond_c

    .line 59
    iget-object v12, v7, Lcom/p1/mobile/putong/core/data/InsertCard;->id:Ljava/lang/String;

    iget-object v13, v10, Lcom/p1/mobile/putong/core/data/CoreData;->love520:Ljava/util/List;

    invoke-virtual {v0, v12, v13}, Lcom/p1/mobile/putong/core/api/l;->s3(Ljava/lang/String;Ljava/util/List;)Lcom/p1/mobile/putong/core/data/SamesCardData;

    move-result-object v13

    goto :goto_3

    :cond_c
    const/16 v14, 0xe

    if-ne v14, v12, :cond_d

    .line 60
    iget-object v12, v7, Lcom/p1/mobile/putong/core/data/InsertCard;->id:Ljava/lang/String;

    iget-object v13, v10, Lcom/p1/mobile/putong/core/data/CoreData;->camping:Ljava/util/List;

    invoke-virtual {v0, v12, v13}, Lcom/p1/mobile/putong/core/api/l;->s3(Ljava/lang/String;Ljava/util/List;)Lcom/p1/mobile/putong/core/data/SamesCardData;

    move-result-object v13

    goto :goto_3

    :cond_d
    const/16 v14, 0xf

    if-ne v14, v12, :cond_e

    .line 61
    iget-object v12, v7, Lcom/p1/mobile/putong/core/data/InsertCard;->id:Ljava/lang/String;

    iget-object v13, v10, Lcom/p1/mobile/putong/core/data/CoreData;->mkt_activity_regular:Ljava/util/List;

    invoke-virtual {v0, v12, v13}, Lcom/p1/mobile/putong/core/api/l;->s3(Ljava/lang/String;Ljava/util/List;)Lcom/p1/mobile/putong/core/data/SamesCardData;

    move-result-object v13

    .line 62
    const-string v12, "regular"

    iput-object v12, v13, Lcom/p1/mobile/putong/core/data/SamesCardData;->type:Ljava/lang/String;

    goto :goto_3

    :cond_e
    const/16 v14, 0x10

    if-ne v14, v12, :cond_f

    .line 63
    iget-object v12, v7, Lcom/p1/mobile/putong/core/data/InsertCard;->id:Ljava/lang/String;

    iget-object v13, v10, Lcom/p1/mobile/putong/core/data/CoreData;->mkt_activity_quiz:Ljava/util/List;

    invoke-virtual {v0, v12, v13}, Lcom/p1/mobile/putong/core/api/l;->s3(Ljava/lang/String;Ljava/util/List;)Lcom/p1/mobile/putong/core/data/SamesCardData;

    move-result-object v13

    .line 64
    const-string v12, "quiz"

    iput-object v12, v13, Lcom/p1/mobile/putong/core/data/SamesCardData;->type:Ljava/lang/String;

    goto :goto_3

    :cond_f
    const/16 v14, 0x12

    if-ne v14, v12, :cond_10

    .line 65
    iget-object v12, v7, Lcom/p1/mobile/putong/core/data/InsertCard;->id:Ljava/lang/String;

    iget-object v13, v10, Lcom/p1/mobile/putong/core/data/CoreData;->mkt_activity_flash:Ljava/util/List;

    invoke-virtual {v0, v12, v13}, Lcom/p1/mobile/putong/core/api/l;->s3(Ljava/lang/String;Ljava/util/List;)Lcom/p1/mobile/putong/core/data/SamesCardData;

    move-result-object v13

    .line 66
    const-string v12, "flash"

    iput-object v12, v13, Lcom/p1/mobile/putong/core/data/SamesCardData;->type:Ljava/lang/String;

    .line 67
    :cond_10
    :goto_3
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_8

    invoke-static {v13}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_8

    .line 68
    new-instance v12, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    invoke-direct {v12}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;-><init>()V

    .line 69
    iget-object v14, v5, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    iput-object v14, v12, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 70
    iget-object v15, v5, Lcom/p1/mobile/putong/data/User;->ussTags:Lcom/p1/mobile/putong/data/UssTags;

    iput-object v15, v12, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->ussTags:Lcom/p1/mobile/putong/data/UssTags;

    .line 71
    iget-object v15, v5, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    iput-object v15, v12, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 72
    invoke-virtual {v4, v14}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v14

    iput-boolean v14, v12, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->hasMoment:Z

    .line 73
    iget-object v5, v5, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-virtual {v2, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    iput-object v5, v12, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->userMedia:Ljava/util/List;

    .line 74
    iput-object v13, v12, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->samesCardData:Lcom/p1/mobile/putong/core/data/SamesCardData;

    .line 75
    invoke-virtual {v0, v7, v12}, Lcom/p1/mobile/putong/core/api/l;->l3(Lcom/p1/mobile/putong/core/data/InsertCard;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V

    .line 76
    iget v5, v7, Lcom/p1/mobile/putong/core/data/InsertCard;->position:I

    invoke-virtual {v8, v5, v12}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto/16 :goto_2

    :pswitch_4
    move-object/from16 v9, p4

    .line 77
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->k()Z

    move-result v5

    if-nez v5, :cond_8

    iget v5, v7, Lcom/p1/mobile/putong/core/data/InsertCard;->showType:I

    const/4 v12, 0x1

    if-ne v5, v12, :cond_8

    .line 78
    new-instance v5, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    invoke-direct {v5}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;-><init>()V

    .line 79
    iput-object v14, v5, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 80
    sget-object v12, Lcom/p1/mobile/putong/core/data/VirtualCardType;->NativeAdViewCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    iput-object v12, v5, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 81
    iget v7, v7, Lcom/p1/mobile/putong/core/data/InsertCard;->position:I

    invoke-virtual {v8, v7, v5}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto/16 :goto_2

    :pswitch_5
    move-object/from16 v9, p4

    .line 82
    iget-object v5, v7, Lcom/p1/mobile/putong/core/data/InsertCard;->id:Ljava/lang/String;

    iget-object v12, v10, Lcom/p1/mobile/putong/core/data/CoreData;->actives:Ljava/util/List;

    invoke-virtual {v0, v5, v12}, Lcom/p1/mobile/putong/core/api/l;->o3(Ljava/lang/String;Ljava/util/List;)Lcom/p1/mobile/putong/core/data/Active;

    move-result-object v5

    .line 83
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_8

    .line 84
    new-instance v12, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    invoke-direct {v12}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;-><init>()V

    .line 85
    iget v13, v7, Lcom/p1/mobile/putong/core/data/InsertCard;->showType:I

    packed-switch v13, :pswitch_data_1

    .line 86
    sget-object v13, Lcom/p1/mobile/putong/core/data/VirtualCardType;->Unknown:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    iput-object v13, v12, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    goto :goto_4

    .line 87
    :pswitch_6
    sget-object v13, Lcom/p1/mobile/putong/core/data/VirtualCardType;->IntlVideoBuzzActiveCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    iput-object v13, v12, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    goto :goto_4

    .line 88
    :pswitch_7
    sget-object v13, Lcom/p1/mobile/putong/core/data/VirtualCardType;->IntlVoiceBuzzActiveCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    iput-object v13, v12, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    goto :goto_4

    .line 89
    :pswitch_8
    sget-object v13, Lcom/p1/mobile/putong/core/data/VirtualCardType;->IntlTextBuzzActiveCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    iput-object v13, v12, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    goto :goto_4

    .line 90
    :pswitch_9
    sget-object v13, Lcom/p1/mobile/putong/core/data/VirtualCardType;->IntlFreeSpotlightCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    iput-object v13, v12, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    goto :goto_4

    .line 91
    :pswitch_a
    sget-object v13, Lcom/p1/mobile/putong/core/data/VirtualCardType;->MinBoostCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    iput-object v13, v12, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    goto :goto_4

    .line 92
    :pswitch_b
    sget-object v13, Lcom/p1/mobile/putong/core/data/VirtualCardType;->IntlSeeCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    iput-object v13, v12, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    goto :goto_4

    .line 93
    :pswitch_c
    sget-object v13, Lcom/p1/mobile/putong/core/data/VirtualCardType;->IntlVipCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    iput-object v13, v12, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    goto :goto_4

    .line 94
    :pswitch_d
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    move-result v13

    if-nez v13, :cond_11

    .line 95
    sget-object v13, Lcom/p1/mobile/putong/core/data/VirtualCardType;->LiveActiveCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    iput-object v13, v12, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    goto :goto_4

    .line 96
    :cond_11
    sget-object v13, Lcom/p1/mobile/putong/core/data/VirtualCardType;->Unknown:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    iput-object v13, v12, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 97
    :goto_4
    iget-object v13, v12, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    sget-object v15, Lcom/p1/mobile/putong/core/data/VirtualCardType;->IntlSeeCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    if-ne v13, v15, :cond_12

    .line 98
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->k()Z

    move-result v13

    if-nez v13, :cond_8

    iget-object v13, v5, Lcom/p1/mobile/putong/core/data/Active;->skuId:Ljava/lang/String;

    .line 99
    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v13

    if-eqz v13, :cond_12

    goto/16 :goto_2

    .line 100
    :cond_12
    iget-object v13, v12, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    sget-object v15, Lcom/p1/mobile/putong/core/data/VirtualCardType;->IntlVipCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    if-ne v13, v15, :cond_13

    .line 101
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->k()Z

    move-result v13

    if-eqz v13, :cond_13

    goto/16 :goto_2

    .line 102
    :cond_13
    iget-object v13, v12, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    sget-object v15, Lcom/p1/mobile/putong/core/data/VirtualCardType;->Unknown:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    if-eq v13, v15, :cond_8

    .line 103
    iput-object v14, v12, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 104
    iput-object v5, v12, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->active:Lcom/p1/mobile/putong/core/data/Active;

    .line 105
    iget v5, v7, Lcom/p1/mobile/putong/core/data/InsertCard;->position:I

    invoke-virtual {v8, v5, v12}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto/16 :goto_2

    :pswitch_e
    move-object/from16 v9, p4

    .line 106
    iget-object v5, v7, Lcom/p1/mobile/putong/core/data/InsertCard;->id:Ljava/lang/String;

    iget-object v12, v11, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    invoke-virtual {v0, v5, v12}, Lcom/p1/mobile/putong/core/api/l;->t3(Ljava/lang/String;Ljava/util/List;)Lcom/p1/mobile/putong/data/User;

    move-result-object v5

    .line 107
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_8

    .line 108
    new-instance v12, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    invoke-direct {v12}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;-><init>()V

    .line 109
    iget-object v14, v5, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    iput-object v14, v12, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 110
    iget-object v15, v5, Lcom/p1/mobile/putong/data/User;->ussTags:Lcom/p1/mobile/putong/data/UssTags;

    iput-object v15, v12, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->ussTags:Lcom/p1/mobile/putong/data/UssTags;

    .line 111
    iget-object v15, v5, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    iput-object v15, v12, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 112
    invoke-virtual {v4, v14}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v14

    iput-boolean v14, v12, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->hasMoment:Z

    .line 113
    iget-object v5, v5, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-virtual {v2, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    iput-object v5, v12, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->userMedia:Ljava/util/List;

    .line 114
    iget v5, v7, Lcom/p1/mobile/putong/core/data/InsertCard;->cardType:I

    const/16 v14, 0xa

    if-ne v5, v14, :cond_14

    const/4 v5, 0x1

    .line 115
    iput-boolean v5, v12, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->disableUndo:Z

    .line 116
    iget-object v5, v12, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    iget-object v14, v10, Lcom/p1/mobile/putong/core/data/CoreData;->buzzUsers:Ljava/util/List;

    .line 117
    invoke-virtual {v0, v5, v14}, Lcom/p1/mobile/putong/core/api/l;->p3(Ljava/lang/String;Ljava/util/List;)Lcom/p1/mobile/putong/core/data/BuzzUser;

    move-result-object v5

    .line 118
    invoke-virtual {v0, v7, v12, v5, v13}, Lcom/p1/mobile/putong/core/api/l;->m3(Lcom/p1/mobile/putong/core/data/InsertCard;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/core/data/BuzzUser;Lcom/p1/mobile/putong/core/data/FloatUserCardData;)V

    goto :goto_5

    .line 119
    :cond_14
    invoke-virtual {v0, v7, v12}, Lcom/p1/mobile/putong/core/api/l;->l3(Lcom/p1/mobile/putong/core/data/InsertCard;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V

    .line 120
    :goto_5
    iget v5, v7, Lcom/p1/mobile/putong/core/data/InsertCard;->position:I

    invoke-virtual {v8, v5, v12}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto/16 :goto_2

    :pswitch_f
    move-object/from16 v9, p4

    .line 121
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    move-result v5

    if-nez v5, :cond_8

    sget-object v5, Ll/uqb0;->b0:Ll/sre0;

    iget-object v5, v5, Ll/sre0;->c:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 122
    invoke-interface {v5}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->es()Z

    move-result v5

    if-nez v5, :cond_15

    goto/16 :goto_2

    .line 123
    :cond_15
    iget-object v5, v7, Lcom/p1/mobile/putong/core/data/InsertCard;->id:Ljava/lang/String;

    iget-object v12, v11, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    invoke-virtual {v0, v5, v12}, Lcom/p1/mobile/putong/core/api/l;->r3(Ljava/lang/String;Ljava/util/List;)Lcom/p1/mobile/putong/data/User;

    move-result-object v5

    .line 124
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_8

    .line 125
    new-instance v12, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    invoke-direct {v12}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;-><init>()V

    .line 126
    iget-object v13, v5, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    iput-object v13, v12, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 127
    iget-object v14, v5, Lcom/p1/mobile/putong/data/User;->ussTags:Lcom/p1/mobile/putong/data/UssTags;

    iput-object v14, v12, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->ussTags:Lcom/p1/mobile/putong/data/UssTags;

    .line 128
    iget-object v14, v5, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    iput-object v14, v12, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 129
    invoke-virtual {v4, v13}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v13

    iput-boolean v13, v12, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->hasMoment:Z

    .line 130
    iget-object v13, v5, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-virtual {v2, v13}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/util/List;

    iput-object v13, v12, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->userMedia:Ljava/util/List;

    .line 131
    iget-object v13, v10, Lcom/p1/mobile/putong/core/data/CoreData;->lives:Ljava/util/List;

    invoke-virtual {v0, v12, v13}, Lcom/p1/mobile/putong/core/api/l;->v3(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Ljava/util/List;)V

    .line 132
    iget v13, v7, Lcom/p1/mobile/putong/core/data/InsertCard;->position:I

    invoke-virtual {v8, v13, v12}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 133
    invoke-virtual {v0, v7, v12}, Lcom/p1/mobile/putong/core/api/l;->l3(Lcom/p1/mobile/putong/core/data/InsertCard;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V

    .line 134
    iget-object v13, v12, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    iget v14, v7, Lcom/p1/mobile/putong/core/data/InsertCard;->position:I

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    move-object/from16 v15, p2

    invoke-interface {v15, v13, v14}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 135
    invoke-static {}, Ll/gta;->e()Ll/gta;

    move-result-object v13

    .line 136
    invoke-virtual {v13}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    move-result-object v13

    iget-object v12, v12, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 137
    invoke-interface {v13, v12}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Ql(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_9

    .line 138
    iget-object v5, v5, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    iget v7, v7, Lcom/p1/mobile/putong/core/data/InsertCard;->position:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    move-object/from16 v12, p3

    invoke-interface {v12, v5, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_6
    const/4 v9, 0x0

    goto/16 :goto_0

    .line 139
    :cond_16
    iput-boolean v6, v0, Lcom/p1/mobile/putong/core/api/l;->T:Z

    const/4 v2, 0x0

    goto :goto_7

    :cond_17
    move v2, v9

    .line 140
    iput-boolean v2, v0, Lcom/p1/mobile/putong/core/api/l;->T:Z

    .line 141
    :goto_7
    iget-object v3, v10, Lcom/p1/mobile/putong/core/data/CoreData;->swipeUpperLimit:Ljava/util/List;

    invoke-static {v3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    move-result v3

    if-nez v3, :cond_18

    .line 142
    iget-object v3, v10, Lcom/p1/mobile/putong/core/data/CoreData;->swipeUpperLimit:Ljava/util/List;

    .line 143
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/p1/mobile/putong/core/data/SwipeUpperLimit;

    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/SwipeUpperLimit;->userID:Ljava/lang/String;

    iget-object v3, v11, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    invoke-virtual {v0, v2, v3}, Lcom/p1/mobile/putong/core/api/l;->t3(Ljava/lang/String;Ljava/util/List;)Lcom/p1/mobile/putong/data/User;

    move-result-object v0

    .line 144
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_18

    .line 145
    new-instance v2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    invoke-direct {v2}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;-><init>()V

    .line 146
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    iput-object v0, v2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    const/4 v12, 0x1

    .line 147
    iput-boolean v12, v2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isIntlLikeLimitInsert:Z

    .line 148
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    move-result-object v0

    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->counter_()Lcom/p1/mobile/putong/data/Counter;

    move-result-object v0

    iget-object v0, v0, Lcom/p1/mobile/putong/data/Counter;->likeLimit:Lcom/p1/mobile/putong/data/CounterLikeLimit;

    iget v0, v0, Lcom/p1/mobile/putong/data/CounterLikeLimit;->remaining:I

    invoke-virtual {v8, v0, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 149
    :cond_18
    invoke-static {v1, v8}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    move-result-object v0

    return-object v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_f
        :pswitch_e
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_e
        :pswitch_2
        :pswitch_e
        :pswitch_e
        :pswitch_e
        :pswitch_e
        :pswitch_1
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_0
        :pswitch_3
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
    .end packed-switch
.end method

.method public final synthetic B3(Lcom/p1/mobile/putong/data/Envelope;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;)Lrx/c;
    .locals 7

    .line 1
    new-instance v0, Ll/s49;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/s49;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/p1/mobile/putong/data/Envelope;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/qi20;->c(Ll/pcj;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/t49;

    .line 21
    .line 22
    move-object v2, p0

    .line 23
    move-object v3, p1

    .line 24
    move-object v4, p2

    .line 25
    move-object v5, p3

    .line 26
    move-object v6, p4

    .line 27
    invoke-direct/range {v1 .. v6}, Ll/t49;-><init>(Lcom/p1/mobile/putong/core/api/l;Lcom/p1/mobile/putong/data/Envelope;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    new-instance p1, Ll/u49;

    .line 35
    .line 36
    invoke-direct {p1, v3}, Ll/u49;-><init>(Lcom/p1/mobile/putong/data/Envelope;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, p1}, Lrx/c;->onErrorReturn(Ll/qcj;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0
.end method

.method public final synthetic C3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public D3()Z
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/l;->R:Ll/byd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Long;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    invoke-static {v0, v1}, Ll/pzi0;->D(J)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    xor-int/lit8 p0, p0, 0x1

    .line 18
    .line 19
    return p0
.end method

.method public E3()V
    .locals 4

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->k()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/api/l;->T:Z

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->ar()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->yh()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_2

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/l;->D3()Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-nez v0, :cond_3

    .line 47
    .line 48
    :goto_0
    return-void

    .line 49
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 50
    .line 51
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 52
    .line 53
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-eqz v1, :cond_4

    .line 62
    .line 63
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-nez v0, :cond_6

    .line 68
    .line 69
    :cond_4
    invoke-static {}, Ll/joa;->n4()Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-eqz v0, :cond_6

    .line 74
    .line 75
    invoke-static {}, Ll/joa;->i4()Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-nez v0, :cond_5

    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_5
    iget-object v0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 83
    .line 84
    new-instance v1, Ll/m49;

    .line 85
    .line 86
    invoke-direct {v1}, Ll/m49;-><init>()V

    .line 87
    .line 88
    .line 89
    const-string v2, "recall_members_ship"

    .line 90
    .line 91
    const/4 v3, 0x0

    .line 92
    invoke-virtual {v0, v2, v3, v1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    new-instance v1, Ll/o49;

    .line 105
    .line 106
    invoke-direct {v1}, Ll/o49;-><init>()V

    .line 107
    .line 108
    .line 109
    new-instance v2, Ll/p49;

    .line 110
    .line 111
    invoke-direct {v2, p0}, Ll/p49;-><init>(Lcom/p1/mobile/putong/core/api/l;)V

    .line 112
    .line 113
    .line 114
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 119
    .line 120
    .line 121
    :cond_6
    :goto_1
    return-void
.end method

.method public F3()V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/l;->R:Ll/byd0;

    .line 2
    .line 3
    invoke-static {}, Ll/pzi0;->o()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final l3(Lcom/p1/mobile/putong/core/data/InsertCard;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, v0, v0}, Lcom/p1/mobile/putong/core/api/l;->m3(Lcom/p1/mobile/putong/core/data/InsertCard;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/core/data/BuzzUser;Lcom/p1/mobile/putong/core/data/FloatUserCardData;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final m3(Lcom/p1/mobile/putong/core/data/InsertCard;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/core/data/BuzzUser;Lcom/p1/mobile/putong/core/data/FloatUserCardData;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_3

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
    new-instance p0, Lcom/p1/mobile/putong/core/data/IntlInsertCardData;

    .line 15
    .line 16
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/IntlInsertCardData;-><init>()V

    .line 17
    .line 18
    .line 19
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/InsertCard;->id:Ljava/lang/String;

    .line 20
    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IntlInsertCardData;->id:Ljava/lang/String;

    .line 22
    .line 23
    iget v0, p1, Lcom/p1/mobile/putong/core/data/InsertCard;->cardType:I

    .line 24
    .line 25
    iput v0, p0, Lcom/p1/mobile/putong/core/data/IntlInsertCardData;->cardType:I

    .line 26
    .line 27
    iget p1, p1, Lcom/p1/mobile/putong/core/data/InsertCard;->showType:I

    .line 28
    .line 29
    iput p1, p0, Lcom/p1/mobile/putong/core/data/IntlInsertCardData;->showType:I

    .line 30
    .line 31
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_1

    .line 36
    .line 37
    iput-object p3, p0, Lcom/p1/mobile/putong/core/data/IntlInsertCardData;->buzzUser:Lcom/p1/mobile/putong/core/data/BuzzUser;

    .line 38
    .line 39
    :cond_1
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-eqz p1, :cond_2

    .line 44
    .line 45
    iput-object p4, p0, Lcom/p1/mobile/putong/core/data/IntlInsertCardData;->floatUserCardData:Lcom/p1/mobile/putong/core/data/FloatUserCardData;

    .line 46
    .line 47
    :cond_2
    iput-object p0, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->intlInsertCardData:Lcom/p1/mobile/putong/core/data/IntlInsertCardData;

    .line 48
    .line 49
    :cond_3
    :goto_0
    return-void
.end method

.method public n3(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V
    .locals 2

    .line 1
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/api/l;->x3(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_3

    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-lez p0, :cond_3

    .line 14
    .line 15
    new-instance p0, Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 18
    .line 19
    .line 20
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    :cond_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 37
    .line 38
    instance-of v1, v0, Lcom/p1/mobile/putong/data/Picture;

    .line 39
    .line 40
    if-eqz v1, :cond_0

    .line 41
    .line 42
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    :cond_1
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 46
    .line 47
    .line 48
    move-result p2

    .line 49
    if-eqz p2, :cond_2

    .line 50
    .line 51
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 52
    .line 53
    const/4 v0, 0x0

    .line 54
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    check-cast p2, Lcom/p1/mobile/putong/data/Media;

    .line 59
    .line 60
    instance-of v0, p2, Lcom/p1/mobile/putong/data/Video;

    .line 61
    .line 62
    if-eqz v0, :cond_2

    .line 63
    .line 64
    check-cast p2, Lcom/p1/mobile/putong/data/Video;

    .line 65
    .line 66
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 67
    .line 68
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-eqz v0, :cond_2

    .line 73
    .line 74
    invoke-interface {p0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    :cond_2
    iput-object p0, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 78
    .line 79
    :cond_3
    return-void
.end method

.method public final o3(Ljava/lang/String;Ljava/util/List;)Lcom/p1/mobile/putong/core/data/Active;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Active;",
            ">;)",
            "Lcom/p1/mobile/putong/core/data/Active;"
        }
    .end annotation

    .line 1
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_1

    .line 6
    .line 7
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    if-eqz p2, :cond_1

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    check-cast p2, Lcom/p1/mobile/putong/core/data/Active;

    .line 22
    .line 23
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/Active;->id:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    return-object p2

    .line 32
    :cond_1
    const/4 p0, 0x0

    .line 33
    return-object p0
.end method

.method public final p3(Ljava/lang/String;Ljava/util/List;)Lcom/p1/mobile/putong/core/data/BuzzUser;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/BuzzUser;",
            ">;)",
            "Lcom/p1/mobile/putong/core/data/BuzzUser;"
        }
    .end annotation

    .line 1
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    return-object v0

    .line 9
    :cond_0
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    if-eqz p2, :cond_2

    .line 18
    .line 19
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    check-cast p2, Lcom/p1/mobile/putong/core/data/BuzzUser;

    .line 24
    .line 25
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_1

    .line 30
    .line 31
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/BuzzUser;->userId:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {v1, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_1

    .line 38
    .line 39
    return-object p2

    .line 40
    :cond_2
    return-object v0
.end method

.method public final q3(Ljava/lang/String;Ljava/util/List;)Lcom/p1/mobile/putong/core/data/FloatsCardData;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/FloatsCardData;",
            ">;)",
            "Lcom/p1/mobile/putong/core/data/FloatsCardData;"
        }
    .end annotation

    .line 1
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_1

    .line 6
    .line 7
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    if-eqz p2, :cond_1

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    check-cast p2, Lcom/p1/mobile/putong/core/data/FloatsCardData;

    .line 22
    .line 23
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/FloatsCardData;->id:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    return-object p2

    .line 32
    :cond_1
    const/4 p0, 0x0

    .line 33
    return-object p0
.end method

.method public final r3(Ljava/lang/String;Ljava/util/List;)Lcom/p1/mobile/putong/data/User;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)",
            "Lcom/p1/mobile/putong/data/User;"
        }
    .end annotation

    .line 1
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_2

    .line 6
    .line 7
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    if-eqz p2, :cond_2

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    check-cast p2, Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    iget-object v0, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->b()Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-eqz p0, :cond_1

    .line 44
    .line 45
    iget-object p0, p2, Lcom/p1/mobile/putong/data/User;->liveState:Lcom/p1/mobile/putong/data/UserLiveState;

    .line 46
    .line 47
    const-string p1, "onlive"

    .line 48
    .line 49
    invoke-static {p1}, Lcom/p1/mobile/putong/data/LiveState;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LiveState;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveState;->state:Lcom/p1/mobile/putong/data/LiveState;

    .line 54
    .line 55
    new-instance p0, Ljava/util/ArrayList;

    .line 56
    .line 57
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-interface {p1, p0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->putLiveState(Ljava/util/List;)V

    .line 68
    .line 69
    .line 70
    :cond_1
    return-object p2

    .line 71
    :cond_2
    const/4 p0, 0x0

    .line 72
    return-object p0
.end method

.method public final s3(Ljava/lang/String;Ljava/util/List;)Lcom/p1/mobile/putong/core/data/SamesCardData;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/SamesCardData;",
            ">;)",
            "Lcom/p1/mobile/putong/core/data/SamesCardData;"
        }
    .end annotation

    .line 1
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_1

    .line 6
    .line 7
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    if-eqz p2, :cond_1

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    check-cast p2, Lcom/p1/mobile/putong/core/data/SamesCardData;

    .line 22
    .line 23
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/SamesCardData;->id:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    return-object p2

    .line 32
    :cond_1
    const/4 p0, 0x0

    .line 33
    return-object p0
.end method

.method public final t3(Ljava/lang/String;Ljava/util/List;)Lcom/p1/mobile/putong/data/User;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)",
            "Lcom/p1/mobile/putong/data/User;"
        }
    .end annotation

    .line 1
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_1

    .line 6
    .line 7
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    if-eqz p2, :cond_1

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    check-cast p2, Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    iget-object v0, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    return-object p2

    .line 32
    :cond_1
    const/4 p0, 0x0

    .line 33
    return-object p0
.end method

.method public u3(Lcom/p1/mobile/putong/data/Envelope;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;)Lrx/c;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Envelope;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;)",
            "Lrx/c<",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/Envelope;",
            "Landroid/util/SparseArray<",
            "Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;",
            ">;>;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    new-instance v1, Ll/q49;

    .line 4
    .line 5
    move-object v2, p0

    .line 6
    move-object v3, p1

    .line 7
    move-object v4, p2

    .line 8
    move-object v6, p3

    .line 9
    move-object v5, p4

    .line 10
    invoke-direct/range {v1 .. v6}, Ll/q49;-><init>(Lcom/p1/mobile/putong/core/api/l;Lcom/p1/mobile/putong/data/Envelope;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;)V

    .line 11
    .line 12
    .line 13
    const-string p0, "user-recommend"

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    invoke-virtual {v0, p0, p1, v1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public final v3(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Live;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_4

    .line 6
    .line 7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    goto :goto_1

    .line 14
    :cond_0
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    if-eqz p2, :cond_4

    .line 23
    .line 24
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    check-cast p2, Lcom/p1/mobile/putong/data/Live;

    .line 29
    .line 30
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    iget-object v0, p2, Lcom/p1/mobile/putong/data/Live;->videoCapture:Lcom/p1/mobile/putong/data/Media;

    .line 37
    .line 38
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-nez v0, :cond_2

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 46
    .line 47
    iget-object v1, p2, Lcom/p1/mobile/putong/data/Live;->anchor:Lcom/p1/mobile/putong/data/Owner;

    .line 48
    .line 49
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_1

    .line 56
    .line 57
    new-instance p0, Lcom/p1/mobile/putong/core/data/LiveLivingCardDataWrapper;

    .line 58
    .line 59
    iget-object v0, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 60
    .line 61
    const/4 v1, 0x0

    .line 62
    invoke-direct {p0, v0, p2, v1}, Lcom/p1/mobile/putong/core/data/LiveLivingCardDataWrapper;-><init>(Ljava/lang/String;Lcom/p1/mobile/putong/data/Live;Lcom/p1/mobile/putong/core/data/Voice;)V

    .line 63
    .line 64
    .line 65
    iput-object p0, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->intlLiveCardPartDataWrapper:Lcom/p1/mobile/putong/core/data/LiveLivingCardDataWrapper;

    .line 66
    .line 67
    iget-object p0, p2, Lcom/p1/mobile/putong/data/Live;->coverPicUrl:Lcom/p1/mobile/putong/data/Media;

    .line 68
    .line 69
    instance-of p1, p0, Lcom/p1/mobile/putong/data/Picture;

    .line 70
    .line 71
    if-eqz p1, :cond_3

    .line 72
    .line 73
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 74
    .line 75
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 76
    .line 77
    invoke-virtual {p1, p0}, Ll/fsb0;->A0(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    iget-object p0, p2, Lcom/p1/mobile/putong/data/Live;->videoCapture:Lcom/p1/mobile/putong/data/Media;

    .line 81
    .line 82
    instance-of p1, p0, Lcom/p1/mobile/putong/data/Video;

    .line 83
    .line 84
    if-eqz p1, :cond_3

    .line 85
    .line 86
    check-cast p0, Lcom/p1/mobile/putong/data/Video;

    .line 87
    .line 88
    iget-object p1, p2, Lcom/p1/mobile/putong/data/Live;->coverPicUrl:Lcom/p1/mobile/putong/data/Media;

    .line 89
    .line 90
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    .line 91
    .line 92
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 93
    .line 94
    :cond_3
    iget-object p0, p2, Lcom/p1/mobile/putong/data/Live;->videoCapture:Lcom/p1/mobile/putong/data/Media;

    .line 95
    .line 96
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 97
    .line 98
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 99
    .line 100
    .line 101
    move-result p0

    .line 102
    if-nez p0, :cond_4

    .line 103
    .line 104
    iget-object p0, p2, Lcom/p1/mobile/putong/data/Live;->videoCapture:Lcom/p1/mobile/putong/data/Media;

    .line 105
    .line 106
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 107
    .line 108
    invoke-static {p0}, Ll/uqb0;->U0(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    :cond_4
    :goto_1
    return-void
.end method

.method public final w3(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Voice;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_3

    .line 6
    .line 7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    goto :goto_1

    .line 14
    :cond_0
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    if-eqz p2, :cond_3

    .line 23
    .line 24
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    check-cast p2, Lcom/p1/mobile/putong/core/data/Voice;

    .line 29
    .line 30
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/Voice;->voiceRoomId:Ljava/lang/String;

    .line 37
    .line 38
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_2

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 46
    .line 47
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/Voice;->id:Ljava/lang/String;

    .line 48
    .line 49
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_1

    .line 54
    .line 55
    new-instance p0, Lcom/p1/mobile/putong/core/data/LiveLivingCardDataWrapper;

    .line 56
    .line 57
    iget-object v0, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 58
    .line 59
    const/4 v1, 0x0

    .line 60
    invoke-direct {p0, v0, v1, p2}, Lcom/p1/mobile/putong/core/data/LiveLivingCardDataWrapper;-><init>(Ljava/lang/String;Lcom/p1/mobile/putong/data/Live;Lcom/p1/mobile/putong/core/data/Voice;)V

    .line 61
    .line 62
    .line 63
    iput-object p0, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->intlLiveCardPartDataWrapper:Lcom/p1/mobile/putong/core/data/LiveLivingCardDataWrapper;

    .line 64
    .line 65
    :cond_3
    :goto_1
    return-void
.end method

.method public x3(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Z
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/l;->y3(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->intlInsertCardData:Lcom/p1/mobile/putong/core/data/IntlInsertCardData;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/IntlInsertCardData;->buzzUser:Lcom/p1/mobile/putong/core/data/BuzzUser;

    .line 12
    .line 13
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_1

    .line 18
    .line 19
    return v0

    .line 20
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->intlInsertCardData:Lcom/p1/mobile/putong/core/data/IntlInsertCardData;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/IntlInsertCardData;->buzzUser:Lcom/p1/mobile/putong/core/data/BuzzUser;

    .line 23
    .line 24
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/BuzzUser;->isBlur:Z

    .line 25
    .line 26
    return p0
.end method

.method public y3(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Z
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->intlInsertCardData:Lcom/p1/mobile/putong/core/data/IntlInsertCardData;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_1

    .line 16
    .line 17
    return v0

    .line 18
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->intlInsertCardData:Lcom/p1/mobile/putong/core/data/IntlInsertCardData;

    .line 19
    .line 20
    iget p1, p0, Lcom/p1/mobile/putong/core/data/IntlInsertCardData;->cardType:I

    .line 21
    .line 22
    const/16 v1, 0xa

    .line 23
    .line 24
    if-ne p1, v1, :cond_2

    .line 25
    .line 26
    iget p0, p0, Lcom/p1/mobile/putong/core/data/IntlInsertCardData;->showType:I

    .line 27
    .line 28
    const/4 p1, 0x1

    .line 29
    if-ne p0, p1, :cond_2

    .line 30
    .line 31
    return p1

    .line 32
    :cond_2
    return v0
.end method

.method public z3(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Z
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->intlInsertCardData:Lcom/p1/mobile/putong/core/data/IntlInsertCardData;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_1

    .line 16
    .line 17
    return v0

    .line 18
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->intlInsertCardData:Lcom/p1/mobile/putong/core/data/IntlInsertCardData;

    .line 19
    .line 20
    iget p0, p0, Lcom/p1/mobile/putong/core/data/IntlInsertCardData;->cardType:I

    .line 21
    .line 22
    const/4 p1, 0x6

    .line 23
    if-ne p0, p1, :cond_2

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_2
    return v0
.end method
