.class public Ll/cb9;
.super Ll/dy6;
.source "SourceFile"


# instance fields
.field public R:Ll/byd0;

.field public S:Ll/byd0;

.field public T:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/SalvagePopUser;",
            ">;"
        }
    .end annotation
.end field

.field public U:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/SalvagePopUser;",
            ">;"
        }
    .end annotation
.end field


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
    const-string v1, "premium_salvage_dlg_last_show_time_"

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
    iput-object p1, p0, Ll/cb9;->R:Ll/byd0;

    .line 38
    .line 39
    new-instance p1, Ll/byd0;

    .line 40
    .line 41
    new-instance v0, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    const-string v2, "ultra1_salvage_dlg_last_show_time_"

    .line 44
    .line 45
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-direct {p1, v0, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 64
    .line 65
    .line 66
    iput-object p1, p0, Ll/cb9;->S:Ll/byd0;

    .line 67
    .line 68
    return-void
.end method

.method public static synthetic a3()Ll/x1d0;
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
    const-string v1, "/purchase/save/pop?popType=ultra"

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

.method public static synthetic b3(Ll/cb9;Lcom/p1/mobile/putong/data/Envelope;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cb9;->o3(Lcom/p1/mobile/putong/data/Envelope;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c3(Ll/cb9;Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cb9;->n3(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic d3(Ll/cb9;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/cb9;->s3()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic e3(Ll/cb9;Lcom/p1/mobile/putong/data/Envelope;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cb9;->r3(Lcom/p1/mobile/putong/data/Envelope;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic f3(Ll/cb9;Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cb9;->q3(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic g3()Ll/x1d0;
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
    const-string v1, "/purchase/save/pop"

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

.method public static synthetic h3(Ll/cb9;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/cb9;->p3()Lrx/c;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public i3()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/va9;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/va9;-><init>(Ll/cb9;)V

    .line 4
    .line 5
    .line 6
    const-string v1, "/purchase/save/pop"

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-virtual {p0, v1, v2, v0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public j3()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/cb9;->i3()Lrx/c;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/cb9;->m3()Lrx/c;

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final k3(Ljava/util/List;Ljava/util/List;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/PurchaseSavePopUserID;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_5

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    goto :goto_2

    .line 6
    :cond_0
    new-instance p0, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    new-instance v0, Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_2

    .line 25
    .line 26
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 31
    .line 32
    if-eqz v1, :cond_1

    .line 33
    .line 34
    iget-object v2, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 35
    .line 36
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    if-nez v2, :cond_1

    .line 41
    .line 42
    iget-object v2, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 43
    .line 44
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    :cond_3
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 53
    .line 54
    .line 55
    move-result p2

    .line 56
    if-eqz p2, :cond_4

    .line 57
    .line 58
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    check-cast p2, Lcom/p1/mobile/putong/core/data/PurchaseSavePopUserID;

    .line 63
    .line 64
    if-eqz p2, :cond_3

    .line 65
    .line 66
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/PurchaseSavePopUserID;->userID:Ljava/lang/String;

    .line 67
    .line 68
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    if-nez v1, :cond_3

    .line 73
    .line 74
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/PurchaseSavePopUserID;->userID:Ljava/lang/String;

    .line 75
    .line 76
    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object p2

    .line 80
    check-cast p2, Lcom/p1/mobile/putong/data/User;

    .line 81
    .line 82
    if-eqz p2, :cond_3

    .line 83
    .line 84
    invoke-interface {p0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_4
    return-object p0

    .line 89
    :cond_5
    :goto_2
    new-instance p0, Ljava/util/ArrayList;

    .line 90
    .line 91
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 92
    .line 93
    .line 94
    return-object p0
.end method

.method public final l3(Ljava/util/List;Ljava/lang/String;)I
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/PurchaseSavePopUserID;",
            ">;",
            "Ljava/lang/String;",
            ")I"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_1

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Lcom/p1/mobile/putong/core/data/PurchaseSavePopUserID;

    .line 16
    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/PurchaseSavePopUserID;->userID:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    iget p0, p1, Lcom/p1/mobile/putong/core/data/PurchaseSavePopUserID;->superLikeCountBy:I

    .line 28
    .line 29
    return p0

    .line 30
    :cond_1
    const/4 p0, 0x0

    .line 31
    return p0
.end method

.method public m3()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/ua9;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ua9;-><init>(Ll/cb9;)V

    .line 4
    .line 5
    .line 6
    const-string v1, "/purchase/save/pop?popType=ultra"

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-virtual {p0, v1, v2, v0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic n3(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/data/CommonData;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/data/CommonData;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    .line 10
    .line 11
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/api/c;->w3(Lcom/p1/mobile/putong/data/Envelope;Ll/x20;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-object p1
.end method

.method public final synthetic o3(Lcom/p1/mobile/putong/data/Envelope;)Lkotlin/Unit;
    .locals 8

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 8
    .line 9
    const-class v1, Lcom/p1/mobile/putong/data/CommonData;

    .line 10
    .line 11
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Lcom/p1/mobile/putong/data/CommonData;

    .line 16
    .line 17
    if-eqz v0, :cond_9

    .line 18
    .line 19
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->purchaseSavePop:Lcom/p1/mobile/putong/core/data/PurchaseSavePop;

    .line 20
    .line 21
    if-nez v1, :cond_0

    .line 22
    .line 23
    goto/16 :goto_5

    .line 24
    .line 25
    :cond_0
    iget-object v2, p1, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    .line 26
    .line 27
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/PurchaseSavePop;->seeList:Ljava/util/List;

    .line 28
    .line 29
    invoke-virtual {p0, v2, v1}, Ll/cb9;->k3(Ljava/util/List;Ljava/util/List;)Ljava/util/List;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    iget-object p1, p1, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreData;->purchaseSavePop:Lcom/p1/mobile/putong/core/data/PurchaseSavePop;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PurchaseSavePop;->rightSwipeList:Ljava/util/List;

    .line 38
    .line 39
    invoke-virtual {p0, p1, v0}, Ll/cb9;->k3(Ljava/util/List;Ljava/util/List;)Ljava/util/List;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-nez v0, :cond_8

    .line 48
    .line 49
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    const/4 v2, 0x4

    .line 54
    if-lt v0, v2, :cond_8

    .line 55
    .line 56
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    const-string v3, "see"

    .line 61
    .line 62
    const-string v4, "rightSwipe"

    .line 63
    .line 64
    const/4 v5, 0x0

    .line 65
    if-nez v0, :cond_3

    .line 66
    .line 67
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    const/4 v6, 0x6

    .line 72
    if-lt v0, v6, :cond_3

    .line 73
    .line 74
    new-instance v0, Ljava/util/ArrayList;

    .line 75
    .line 76
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 77
    .line 78
    .line 79
    iput-object v0, p0, Ll/cb9;->T:Ljava/util/List;

    .line 80
    .line 81
    move v0, v5

    .line 82
    :goto_0
    const/4 v2, 0x3

    .line 83
    if-ge v0, v2, :cond_1

    .line 84
    .line 85
    invoke-static {}, Lcom/p1/mobile/putong/core/data/SalvagePopUser;->new_()Lcom/p1/mobile/putong/core/data/SalvagePopUser;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object v6

    .line 93
    check-cast v6, Lcom/p1/mobile/putong/data/User;

    .line 94
    .line 95
    iput-object v6, v2, Lcom/p1/mobile/putong/core/data/SalvagePopUser;->user:Lcom/p1/mobile/putong/data/User;

    .line 96
    .line 97
    invoke-static {v4}, Lcom/p1/mobile/putong/core/data/SalvagePopUserType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SalvagePopUserType;

    .line 98
    .line 99
    .line 100
    move-result-object v6

    .line 101
    iput-object v6, v2, Lcom/p1/mobile/putong/core/data/SalvagePopUser;->salvagePopUserType:Lcom/p1/mobile/putong/core/data/SalvagePopUserType;

    .line 102
    .line 103
    iget-object v6, p0, Ll/cb9;->T:Ljava/util/List;

    .line 104
    .line 105
    invoke-interface {v6, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    add-int/lit8 v0, v0, 0x1

    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_1
    :goto_1
    if-ge v5, v2, :cond_2

    .line 112
    .line 113
    invoke-static {}, Lcom/p1/mobile/putong/core/data/SalvagePopUser;->new_()Lcom/p1/mobile/putong/core/data/SalvagePopUser;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 122
    .line 123
    iput-object v0, p1, Lcom/p1/mobile/putong/core/data/SalvagePopUser;->user:Lcom/p1/mobile/putong/data/User;

    .line 124
    .line 125
    invoke-static {v3}, Lcom/p1/mobile/putong/core/data/SalvagePopUserType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SalvagePopUserType;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    iput-object v0, p1, Lcom/p1/mobile/putong/core/data/SalvagePopUser;->salvagePopUserType:Lcom/p1/mobile/putong/core/data/SalvagePopUserType;

    .line 130
    .line 131
    iget-object v0, p0, Ll/cb9;->T:Ljava/util/List;

    .line 132
    .line 133
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    add-int/lit8 v5, v5, 0x1

    .line 137
    .line 138
    goto :goto_1

    .line 139
    :cond_2
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 140
    .line 141
    return-object p0

    .line 142
    :cond_3
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 143
    .line 144
    .line 145
    move-result v0

    .line 146
    if-nez v0, :cond_6

    .line 147
    .line 148
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 149
    .line 150
    .line 151
    move-result v0

    .line 152
    const/4 v6, 0x2

    .line 153
    if-lt v0, v6, :cond_6

    .line 154
    .line 155
    new-instance v0, Ljava/util/ArrayList;

    .line 156
    .line 157
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 158
    .line 159
    .line 160
    iput-object v0, p0, Ll/cb9;->T:Ljava/util/List;

    .line 161
    .line 162
    move v0, v5

    .line 163
    :goto_2
    if-ge v0, v6, :cond_4

    .line 164
    .line 165
    invoke-static {}, Lcom/p1/mobile/putong/core/data/SalvagePopUser;->new_()Lcom/p1/mobile/putong/core/data/SalvagePopUser;

    .line 166
    .line 167
    .line 168
    move-result-object v2

    .line 169
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 170
    .line 171
    .line 172
    move-result-object v7

    .line 173
    check-cast v7, Lcom/p1/mobile/putong/data/User;

    .line 174
    .line 175
    iput-object v7, v2, Lcom/p1/mobile/putong/core/data/SalvagePopUser;->user:Lcom/p1/mobile/putong/data/User;

    .line 176
    .line 177
    invoke-static {v4}, Lcom/p1/mobile/putong/core/data/SalvagePopUserType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SalvagePopUserType;

    .line 178
    .line 179
    .line 180
    move-result-object v7

    .line 181
    iput-object v7, v2, Lcom/p1/mobile/putong/core/data/SalvagePopUser;->salvagePopUserType:Lcom/p1/mobile/putong/core/data/SalvagePopUserType;

    .line 182
    .line 183
    iget-object v7, p0, Ll/cb9;->T:Ljava/util/List;

    .line 184
    .line 185
    invoke-interface {v7, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 186
    .line 187
    .line 188
    add-int/lit8 v0, v0, 0x1

    .line 189
    .line 190
    goto :goto_2

    .line 191
    :cond_4
    :goto_3
    if-ge v5, v6, :cond_5

    .line 192
    .line 193
    invoke-static {}, Lcom/p1/mobile/putong/core/data/SalvagePopUser;->new_()Lcom/p1/mobile/putong/core/data/SalvagePopUser;

    .line 194
    .line 195
    .line 196
    move-result-object p1

    .line 197
    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 202
    .line 203
    iput-object v0, p1, Lcom/p1/mobile/putong/core/data/SalvagePopUser;->user:Lcom/p1/mobile/putong/data/User;

    .line 204
    .line 205
    invoke-static {v3}, Lcom/p1/mobile/putong/core/data/SalvagePopUserType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SalvagePopUserType;

    .line 206
    .line 207
    .line 208
    move-result-object v0

    .line 209
    iput-object v0, p1, Lcom/p1/mobile/putong/core/data/SalvagePopUser;->salvagePopUserType:Lcom/p1/mobile/putong/core/data/SalvagePopUserType;

    .line 210
    .line 211
    iget-object v0, p0, Ll/cb9;->T:Ljava/util/List;

    .line 212
    .line 213
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 214
    .line 215
    .line 216
    add-int/lit8 v5, v5, 0x1

    .line 217
    .line 218
    goto :goto_3

    .line 219
    :cond_5
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 220
    .line 221
    return-object p0

    .line 222
    :cond_6
    new-instance v0, Ljava/util/ArrayList;

    .line 223
    .line 224
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 225
    .line 226
    .line 227
    iput-object v0, p0, Ll/cb9;->T:Ljava/util/List;

    .line 228
    .line 229
    :goto_4
    if-ge v5, v2, :cond_7

    .line 230
    .line 231
    invoke-static {}, Lcom/p1/mobile/putong/core/data/SalvagePopUser;->new_()Lcom/p1/mobile/putong/core/data/SalvagePopUser;

    .line 232
    .line 233
    .line 234
    move-result-object v0

    .line 235
    invoke-interface {p1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 236
    .line 237
    .line 238
    move-result-object v1

    .line 239
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 240
    .line 241
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/SalvagePopUser;->user:Lcom/p1/mobile/putong/data/User;

    .line 242
    .line 243
    invoke-static {v4}, Lcom/p1/mobile/putong/core/data/SalvagePopUserType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SalvagePopUserType;

    .line 244
    .line 245
    .line 246
    move-result-object v1

    .line 247
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/SalvagePopUser;->salvagePopUserType:Lcom/p1/mobile/putong/core/data/SalvagePopUserType;

    .line 248
    .line 249
    iget-object v1, p0, Ll/cb9;->T:Ljava/util/List;

    .line 250
    .line 251
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 252
    .line 253
    .line 254
    add-int/lit8 v5, v5, 0x1

    .line 255
    .line 256
    goto :goto_4

    .line 257
    :cond_7
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 258
    .line 259
    return-object p0

    .line 260
    :cond_8
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 261
    .line 262
    return-object p0

    .line 263
    :cond_9
    :goto_5
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 264
    .line 265
    return-object p0
.end method

.method public final synthetic p3()Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/za9;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/za9;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/qi20;->e(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Ll/ab9;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/ab9;-><init>(Ll/cb9;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/bb9;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/bb9;-><init>(Ll/cb9;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method

.method public final synthetic q3(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/data/CommonData;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/data/CommonData;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    .line 10
    .line 11
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/api/c;->w3(Lcom/p1/mobile/putong/data/Envelope;Ll/x20;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-object p1
.end method

.method public final synthetic r3(Lcom/p1/mobile/putong/data/Envelope;)Lkotlin/Unit;
    .locals 7

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 8
    .line 9
    const-class v1, Lcom/p1/mobile/putong/data/CommonData;

    .line 10
    .line 11
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Lcom/p1/mobile/putong/data/CommonData;

    .line 16
    .line 17
    if-eqz v0, :cond_3

    .line 18
    .line 19
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->purchaseSavePop:Lcom/p1/mobile/putong/core/data/PurchaseSavePop;

    .line 20
    .line 21
    if-nez v1, :cond_0

    .line 22
    .line 23
    goto/16 :goto_2

    .line 24
    .line 25
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    .line 26
    .line 27
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/PurchaseSavePop;->ultraList:Ljava/util/List;

    .line 28
    .line 29
    invoke-virtual {p0, p1, v1}, Ll/cb9;->k3(Ljava/util/List;Ljava/util/List;)Ljava/util/List;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    new-instance v1, Ljava/util/ArrayList;

    .line 34
    .line 35
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object v1, p0, Ll/cb9;->U:Ljava/util/List;

    .line 39
    .line 40
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    const-string v2, "ultra"

    .line 45
    .line 46
    const/4 v3, 0x0

    .line 47
    if-nez v1, :cond_1

    .line 48
    .line 49
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    const/4 v4, 0x1

    .line 54
    if-ne v1, v4, :cond_1

    .line 55
    .line 56
    invoke-static {}, Lcom/p1/mobile/putong/core/data/SalvagePopUser;->new_()Lcom/p1/mobile/putong/core/data/SalvagePopUser;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 65
    .line 66
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/SalvagePopUser;->user:Lcom/p1/mobile/putong/data/User;

    .line 67
    .line 68
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreData;->purchaseSavePop:Lcom/p1/mobile/putong/core/data/PurchaseSavePop;

    .line 69
    .line 70
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PurchaseSavePop;->ultraList:Ljava/util/List;

    .line 71
    .line 72
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {p0, v0, p1}, Ll/cb9;->l3(Ljava/util/List;Ljava/lang/String;)I

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    iput p1, v1, Lcom/p1/mobile/putong/core/data/SalvagePopUser;->superLikeCountBy:I

    .line 79
    .line 80
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/SalvagePopUserType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SalvagePopUserType;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/SalvagePopUser;->salvagePopUserType:Lcom/p1/mobile/putong/core/data/SalvagePopUserType;

    .line 85
    .line 86
    iget-object p0, p0, Ll/cb9;->U:Ljava/util/List;

    .line 87
    .line 88
    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    goto :goto_1

    .line 92
    :cond_1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    if-nez v1, :cond_2

    .line 97
    .line 98
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    const/4 v4, 0x4

    .line 103
    if-ne v1, v4, :cond_2

    .line 104
    .line 105
    :goto_0
    if-ge v3, v4, :cond_2

    .line 106
    .line 107
    invoke-static {}, Lcom/p1/mobile/putong/core/data/SalvagePopUser;->new_()Lcom/p1/mobile/putong/core/data/SalvagePopUser;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v5

    .line 115
    check-cast v5, Lcom/p1/mobile/putong/data/User;

    .line 116
    .line 117
    iput-object v5, v1, Lcom/p1/mobile/putong/core/data/SalvagePopUser;->user:Lcom/p1/mobile/putong/data/User;

    .line 118
    .line 119
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/SalvagePopUserType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SalvagePopUserType;

    .line 120
    .line 121
    .line 122
    move-result-object v5

    .line 123
    iput-object v5, v1, Lcom/p1/mobile/putong/core/data/SalvagePopUser;->salvagePopUserType:Lcom/p1/mobile/putong/core/data/SalvagePopUserType;

    .line 124
    .line 125
    iget-object v5, v0, Lcom/p1/mobile/putong/core/data/CoreData;->purchaseSavePop:Lcom/p1/mobile/putong/core/data/PurchaseSavePop;

    .line 126
    .line 127
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/PurchaseSavePop;->ultraList:Ljava/util/List;

    .line 128
    .line 129
    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/SalvagePopUser;->user:Lcom/p1/mobile/putong/data/User;

    .line 130
    .line 131
    iget-object v6, v6, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 132
    .line 133
    invoke-virtual {p0, v5, v6}, Ll/cb9;->l3(Ljava/util/List;Ljava/lang/String;)I

    .line 134
    .line 135
    .line 136
    move-result v5

    .line 137
    iput v5, v1, Lcom/p1/mobile/putong/core/data/SalvagePopUser;->superLikeCountBy:I

    .line 138
    .line 139
    iget-object v5, p0, Ll/cb9;->U:Ljava/util/List;

    .line 140
    .line 141
    invoke-interface {v5, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 142
    .line 143
    .line 144
    add-int/lit8 v3, v3, 0x1

    .line 145
    .line 146
    goto :goto_0

    .line 147
    :cond_2
    :goto_1
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 148
    .line 149
    return-object p0

    .line 150
    :cond_3
    :goto_2
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 151
    .line 152
    return-object p0
.end method

.method public final synthetic s3()Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/wa9;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/wa9;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/qi20;->e(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Ll/xa9;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/xa9;-><init>(Ll/cb9;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/ya9;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/ya9;-><init>(Ll/cb9;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method
