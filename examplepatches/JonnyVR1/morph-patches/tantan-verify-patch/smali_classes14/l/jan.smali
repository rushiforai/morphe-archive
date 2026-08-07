.class public Ll/jan;
.super Ll/dy6;
.source "SourceFile"


# instance fields
.field public R:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;",
            ">;"
        }
    .end annotation
.end field

.field public S:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/util/Map<",
            "Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end field

.field public T:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/util/Map<",
            "Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public U:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/util/Map<",
            "Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;",
            "Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;",
            ">;>;"
        }
    .end annotation
.end field

.field public final V:Ll/p8i0;

.field public W:Lcom/p1/mobile/putong/core/data/PromotionPrivilegePrices;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/api/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/dy6;-><init>(Lcom/p1/mobile/putong/core/api/c;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Ll/jan;->R:Lrx/subjects/a;

    .line 9
    .line 10
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Ll/jan;->S:Lrx/subjects/a;

    .line 15
    .line 16
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iput-object p1, p0, Ll/jan;->T:Lrx/subjects/a;

    .line 21
    .line 22
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iput-object p1, p0, Ll/jan;->U:Lrx/subjects/a;

    .line 27
    .line 28
    new-instance p1, Ll/p8i0;

    .line 29
    .line 30
    invoke-direct {p1}, Ll/p8i0;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object p1, p0, Ll/jan;->V:Ll/p8i0;

    .line 34
    .line 35
    return-void
.end method

.method private V3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)I
    .locals 1

    .line 1
    iget-object p0, p0, Ll/jan;->S:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/util/Map;

    .line 8
    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Ljava/lang/Integer;

    .line 23
    .line 24
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    return p0

    .line 29
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 30
    return p0
.end method

.method public static synthetic a3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->id:Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b3()Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/fan;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/fan;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/p1/mobile/putong/data/IsCoinerDataEnvelope;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/qi20;->c(Ll/pcj;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    return-object v0
.end method

.method public static synthetic c3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->id:Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->diamondSign:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic e3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic f3(Ll/jan;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jan;->F3()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic g3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->unitPrice:I

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

.method public static synthetic h3()Ll/x1d0;
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
    const-string v1, "/live/wholesaler/diamond/iscoiner"

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

.method public static synthetic i3(Ll/jan;Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jan;->G3(Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;)V

    return-void
.end method

.method public static synthetic j3(Ll/jan;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jan;->H3(Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic k3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->id:Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic l3(Ll/jan;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jan;->J3(Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static synthetic m3(Lcom/p1/mobile/putong/data/IsCoinerDataEnvelope;)Lcom/p1/mobile/putong/data/IsCurrencyMerchantData;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/IsCoinerDataEnvelope;->data:Lcom/p1/mobile/putong/data/IsCurrencyMerchantData;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic n3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->id:Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 2
    .line 3
    const-string v0, "boost"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic o3(Ll/jan;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jan;->I3()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic p3()Ll/x1d0;
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
    invoke-static {v1}, Lcom/p1/mobile/putong/core/api/a;->h0(Ljava/lang/String;)Ljava/lang/String;

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

.method public static synthetic q3(Ll/jan;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jan;->E3(Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic r3()Ll/x1d0;
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
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->k()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    const-string v1, "/summarized-privilege-prices?affiliate=huawei&priceType=diamond"

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const-string v1, "/summarized-privilege-prices?affiliate=googleplay&priceType=diamond"

    .line 17
    .line 18
    :goto_0
    invoke-static {v1}, Lcom/p1/mobile/putong/core/api/a;->J0(Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    return-object v0
.end method


# virtual methods
.method public final A3(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 5

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 8
    .line 9
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->diamond:Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 18
    .line 19
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->diamond:Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;

    .line 20
    .line 21
    iget-wide v1, v1, Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;->available:J

    .line 22
    .line 23
    const-wide/16 v3, 0x0

    .line 24
    .line 25
    cmp-long v1, v1, v3

    .line 26
    .line 27
    if-lez v1, :cond_0

    .line 28
    .line 29
    iget-object v1, p0, Ll/jan;->R:Lrx/subjects/a;

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    check-cast v2, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 36
    .line 37
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/CoreData;->diamond:Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;

    .line 38
    .line 39
    invoke-virtual {v1, v2}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    check-cast v1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 47
    .line 48
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->summarizedPrivilegePrices:Ljava/util/List;

    .line 49
    .line 50
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-nez v1, :cond_2

    .line 55
    .line 56
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    check-cast v1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 61
    .line 62
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->summarizedPrivilegePrices:Ljava/util/List;

    .line 63
    .line 64
    new-instance v2, Ll/t9n;

    .line 65
    .line 66
    invoke-direct {v2}, Ll/t9n;-><init>()V

    .line 67
    .line 68
    .line 69
    invoke-static {v1, v2}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    check-cast v1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;

    .line 74
    .line 75
    if-eqz v1, :cond_1

    .line 76
    .line 77
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->promotionPrivilegePrices:Ljava/util/List;

    .line 78
    .line 79
    if-eqz v2, :cond_1

    .line 80
    .line 81
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    .line 82
    .line 83
    .line 84
    move-result v2

    .line 85
    if-nez v2, :cond_1

    .line 86
    .line 87
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->promotionPrivilegePrices:Ljava/util/List;

    .line 88
    .line 89
    const/4 v2, 0x0

    .line 90
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    check-cast v1, Lcom/p1/mobile/putong/core/data/PromotionPrivilegePrices;

    .line 95
    .line 96
    iput-object v1, p0, Ll/jan;->W:Lcom/p1/mobile/putong/core/data/PromotionPrivilegePrices;

    .line 97
    .line 98
    :cond_1
    iget-object v1, p0, Ll/jan;->S:Lrx/subjects/a;

    .line 99
    .line 100
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    check-cast v2, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 105
    .line 106
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/CoreData;->summarizedPrivilegePrices:Ljava/util/List;

    .line 107
    .line 108
    new-instance v3, Ll/u9n;

    .line 109
    .line 110
    invoke-direct {v3}, Ll/u9n;-><init>()V

    .line 111
    .line 112
    .line 113
    new-instance v4, Ll/v9n;

    .line 114
    .line 115
    invoke-direct {v4}, Ll/v9n;-><init>()V

    .line 116
    .line 117
    .line 118
    invoke-static {v2, v3, v4}, Ll/jyb;->d(Ljava/util/Collection;Ll/qcj;Ll/qcj;)Ljava/util/HashMap;

    .line 119
    .line 120
    .line 121
    move-result-object v2

    .line 122
    invoke-virtual {v1, v2}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 123
    .line 124
    .line 125
    iget-object v1, p0, Ll/jan;->U:Lrx/subjects/a;

    .line 126
    .line 127
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 128
    .line 129
    .line 130
    move-result-object v2

    .line 131
    check-cast v2, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 132
    .line 133
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/CoreData;->summarizedPrivilegePrices:Ljava/util/List;

    .line 134
    .line 135
    new-instance v3, Ll/w9n;

    .line 136
    .line 137
    invoke-direct {v3}, Ll/w9n;-><init>()V

    .line 138
    .line 139
    .line 140
    new-instance v4, Ll/x9n;

    .line 141
    .line 142
    invoke-direct {v4}, Ll/x9n;-><init>()V

    .line 143
    .line 144
    .line 145
    invoke-static {v2, v3, v4}, Ll/jyb;->d(Ljava/util/Collection;Ll/qcj;Ll/qcj;)Ljava/util/HashMap;

    .line 146
    .line 147
    .line 148
    move-result-object v2

    .line 149
    invoke-virtual {v1, v2}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 150
    .line 151
    .line 152
    iget-object p0, p0, Ll/jan;->T:Lrx/subjects/a;

    .line 153
    .line 154
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 155
    .line 156
    .line 157
    move-result-object p1

    .line 158
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 159
    .line 160
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->summarizedPrivilegePrices:Ljava/util/List;

    .line 161
    .line 162
    new-instance v0, Ll/y9n;

    .line 163
    .line 164
    invoke-direct {v0}, Ll/y9n;-><init>()V

    .line 165
    .line 166
    .line 167
    new-instance v1, Ll/z9n;

    .line 168
    .line 169
    invoke-direct {v1}, Ll/z9n;-><init>()V

    .line 170
    .line 171
    .line 172
    invoke-static {p1, v0, v1}, Ll/jyb;->d(Ljava/util/Collection;Ll/qcj;Ll/qcj;)Ljava/util/HashMap;

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 177
    .line 178
    .line 179
    :cond_2
    return-void
.end method

.method public final B3(Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/jan;->R:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;->new_()Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    :cond_0
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;->available:J

    .line 20
    .line 21
    const-wide/16 v3, 0x0

    .line 22
    .line 23
    invoke-static {v3, v4, v1, v2}, Ljava/lang/Math;->max(JJ)J

    .line 24
    .line 25
    .line 26
    move-result-wide v1

    .line 27
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;->available:J

    .line 28
    .line 29
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;->agentAvailable:J

    .line 30
    .line 31
    invoke-static {v3, v4, v1, v2}, Ljava/lang/Math;->max(JJ)J

    .line 32
    .line 33
    .line 34
    move-result-wide v1

    .line 35
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;->agentAvailable:J

    .line 36
    .line 37
    iget-object p0, p0, Ll/jan;->R:Lrx/subjects/a;

    .line 38
    .line 39
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public C3()J
    .locals 3

    .line 1
    iget-object v0, p0, Ll/jan;->V:Ll/p8i0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/jan;->R:Lrx/subjects/a;

    .line 4
    .line 5
    invoke-virtual {v1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    const-wide/16 v1, 0x0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object p0, p0, Ll/jan;->R:Lrx/subjects/a;

    .line 15
    .line 16
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;

    .line 21
    .line 22
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;->agentAvailable:J

    .line 23
    .line 24
    :goto_0
    invoke-virtual {v0, v1, v2}, Ll/p8i0;->c(J)J

    .line 25
    .line 26
    .line 27
    move-result-wide v0

    .line 28
    return-wide v0
.end method

.method public D3()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/IsCurrencyMerchantData;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    new-instance v0, Ll/aan;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/aan;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v1, "isCoiner"

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-virtual {p0, v1, v2, v0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance v0, Ll/ban;

    .line 16
    .line 17
    invoke-direct {v0}, Ll/ban;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public final synthetic E3(Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->diamond:Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/jan;->O3(Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;)V

    .line 12
    .line 13
    .line 14
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 15
    .line 16
    return-object p0
.end method

.method public final synthetic F3()Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/gan;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/gan;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/qi20;->a(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Ll/han;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/han;-><init>(Ll/jan;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public final synthetic G3(Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jan;->B3(Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic H3(Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jan;->Q3(Lcom/p1/mobile/putong/data/Envelope;)V

    .line 2
    .line 3
    .line 4
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 5
    .line 6
    return-object p0
.end method

.method public final synthetic I3()Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/dan;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/dan;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/qi20;->a(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Ll/ean;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/ean;-><init>(Ll/jan;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public final synthetic J3(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jan;->A3(Lcom/p1/mobile/putong/data/Envelope;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public K3()J
    .locals 3

    .line 1
    iget-object v0, p0, Ll/jan;->V:Ll/p8i0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/jan;->R:Lrx/subjects/a;

    .line 4
    .line 5
    invoke-virtual {v1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    const-wide/16 v1, 0x0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object p0, p0, Ll/jan;->R:Lrx/subjects/a;

    .line 15
    .line 16
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;

    .line 21
    .line 22
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;->available:J

    .line 23
    .line 24
    :goto_0
    invoke-virtual {v0, v1, v2}, Ll/p8i0;->c(J)J

    .line 25
    .line 26
    .line 27
    move-result-wide v0

    .line 28
    return-wide v0
.end method

.method public L3()I
    .locals 1

    .line 1
    const-string v0, "minBoost"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-direct {p0, v0}, Ll/jan;->V3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public M3()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/jan;->R:Lrx/subjects/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public N3()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    new-instance v1, Ll/can;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/can;-><init>(Ll/jan;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "refresh_diamond"

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-virtual {v0, p0, v2, v1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final O3(Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;)V
    .locals 1

    .line 1
    new-instance v0, Ll/s9n;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/s9n;-><init>(Ll/jan;Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public P3()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    new-instance v1, Ll/r9n;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/r9n;-><init>(Ll/jan;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "refreshMyDiamonds"

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-virtual {v0, p0, v2, v1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public Q3(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 1

    .line 1
    new-instance v0, Ll/ian;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/ian;-><init>(Ll/jan;Lcom/p1/mobile/putong/data/Envelope;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public declared-synchronized R3(Ljava/lang/Long;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/jan;->V:Ll/p8i0;

    .line 3
    .line 4
    invoke-virtual {v0, p1}, Ll/p8i0;->f(Ljava/lang/Long;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    .line 7
    monitor-exit p0

    .line 8
    return-void

    .line 9
    :catchall_0
    move-exception p1

    .line 10
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 11
    throw p1
.end method

.method public declared-synchronized S3(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Ljava/lang/Long;
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/jan;->V:Ll/p8i0;

    .line 3
    .line 4
    invoke-direct {p0, p2}, Ll/jan;->V3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)I

    .line 5
    .line 6
    .line 7
    move-result p2

    .line 8
    invoke-virtual {v0, p1, p2}, Ll/p8i0;->d(Ljava/lang/String;I)Ljava/lang/Long;

    .line 9
    .line 10
    .line 11
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    monitor-exit p0

    .line 13
    return-object p1

    .line 14
    :catchall_0
    move-exception p1

    .line 15
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 16
    throw p1
.end method

.method public T3()I
    .locals 1

    .line 1
    const-string v0, "spotLight"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-direct {p0, v0}, Ll/jan;->V3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public U3()I
    .locals 1

    .line 1
    const-string v0, "superLike"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-direct {p0, v0}, Ll/jan;->V3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public s3()I
    .locals 1

    .line 1
    const-string v0, "boost"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-direct {p0, v0}, Ll/jan;->V3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public t3()I
    .locals 1

    .line 1
    const-string v0, "buzzMatch"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-direct {p0, v0}, Ll/jan;->V3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public u3()I
    .locals 1

    .line 1
    const-string v0, "buzzMemojiMatch"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-direct {p0, v0}, Ll/jan;->V3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public v3()I
    .locals 1

    .line 1
    const-string v0, "buzzVideoMatch"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-direct {p0, v0}, Ll/jan;->V3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public w3()I
    .locals 1

    .line 1
    const-string v0, "buzzVoiceMatch"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-direct {p0, v0}, Ll/jan;->V3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public x3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jan;->T:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/util/Map;

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const-string p0, ""

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Ljava/lang/String;

    .line 19
    .line 20
    return-object p0
.end method

.method public y3()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jan;->W:Lcom/p1/mobile/putong/core/data/PromotionPrivilegePrices;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, ""

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PromotionPrivilegePrices;->diamondSign:Ljava/lang/String;

    .line 9
    .line 10
    return-object p0
.end method

.method public z3()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jan;->W:Lcom/p1/mobile/putong/core/data/PromotionPrivilegePrices;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget p0, p0, Lcom/p1/mobile/putong/core/data/PromotionPrivilegePrices;->price:I

    .line 8
    .line 9
    return p0
.end method
