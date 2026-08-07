.class public Ll/lqb;
.super Ll/dy6;
.source "SourceFile"


# instance fields
.field public R:I

.field public S:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/core/data/Coin;",
            ">;"
        }
    .end annotation
.end field

.field public T:Lrx/subjects/a;
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

.field public U:Lrx/subjects/a;
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

.field public V:Lrx/subjects/a;
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

.field public W:Ll/jxd0;

.field public X:Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;

.field public Y:Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;

.field public Z:Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;

.field public final a0:Ll/z7i0;

.field public b0:Lcom/p1/mobile/putong/core/data/PromotionPrivilegePrices;

.field public c0:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;",
            ">;"
        }
    .end annotation
.end field

.field public d0:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Lcom/p1/mobile/putong/core/data/Wallet;",
            ">;"
        }
    .end annotation
.end field

.field public e0:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/data/IdentificationInfo;",
            ">;"
        }
    .end annotation
.end field

.field public f0:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Lcom/google/common/base/Optional<",
            "Lcom/p1/mobile/putong/core/data/WalletAccount;",
            ">;>;"
        }
    .end annotation
.end field

.field public g0:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/AccountRecord;",
            ">;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/api/c;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Ll/dy6;-><init>(Lcom/p1/mobile/putong/core/api/c;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Ll/lqb;->R:I

    .line 6
    .line 7
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Ll/lqb;->S:Lrx/subjects/a;

    .line 12
    .line 13
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iput-object p1, p0, Ll/lqb;->T:Lrx/subjects/a;

    .line 18
    .line 19
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iput-object p1, p0, Ll/lqb;->U:Lrx/subjects/a;

    .line 24
    .line 25
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iput-object p1, p0, Ll/lqb;->V:Lrx/subjects/a;

    .line 30
    .line 31
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    iput-object p1, p0, Ll/lqb;->d0:Lrx/subjects/b;

    .line 36
    .line 37
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iput-object p1, p0, Ll/lqb;->e0:Lrx/subjects/a;

    .line 42
    .line 43
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    iput-object p1, p0, Ll/lqb;->f0:Lrx/subjects/b;

    .line 48
    .line 49
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    iput-object p1, p0, Ll/lqb;->g0:Lrx/subjects/b;

    .line 54
    .line 55
    new-instance p1, Ll/jxd0;

    .line 56
    .line 57
    new-instance v0, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    const-string v1, "isAlipayBinded"

    .line 60
    .line 61
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 80
    .line 81
    invoke-direct {p1, v0, v1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 82
    .line 83
    .line 84
    iput-object p1, p0, Ll/lqb;->W:Ll/jxd0;

    .line 85
    .line 86
    new-instance p1, Ll/z7i0;

    .line 87
    .line 88
    invoke-direct {p1}, Ll/z7i0;-><init>()V

    .line 89
    .line 90
    .line 91
    iput-object p1, p0, Ll/lqb;->a0:Ll/z7i0;

    .line 92
    .line 93
    new-instance p1, Ljava/util/HashMap;

    .line 94
    .line 95
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 96
    .line 97
    .line 98
    iput-object p1, p0, Ll/lqb;->c0:Ljava/util/Map;

    .line 99
    .line 100
    return-void
.end method

.method public static synthetic A3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->id:Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 2
    .line 3
    const-string v0, "picksX20"

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

.method public static synthetic B3(Lcom/p1/mobile/putong/data/LuckyTantanSwitchEnableData;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/LuckyTantanSwitchEnableData;->data:Z

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic C3(Ll/lqb;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lqb;->M4(Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static synthetic D3()Lrx/c;
    .locals 3

    .line 1
    new-instance v0, Ll/si20;

    .line 2
    .line 3
    new-instance v1, Ll/uob;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/uob;-><init>()V

    .line 6
    .line 7
    .line 8
    sget-object v2, Lcom/p1/mobile/putong/data/AlipayAuthEnvelop;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 9
    .line 10
    invoke-direct {v0, v1, v2}, Ll/si20;-><init>(Ll/pcj;Lcom/tantanapp/common/data/INetParser;)V

    .line 11
    .line 12
    .line 13
    new-instance v1, Ll/vob;

    .line 14
    .line 15
    invoke-direct {v1}, Ll/vob;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-static {}, Ll/psd0;->Q()Lrx/c$d;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    return-object v0
.end method

.method public static synthetic E3()Lrx/c;
    .locals 3

    .line 1
    new-instance v0, Ll/si20;

    .line 2
    .line 3
    new-instance v1, Ll/yob;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/yob;-><init>()V

    .line 6
    .line 7
    .line 8
    sget-object v2, Lcom/p1/mobile/putong/data/LuckyTantanSwitchEnableData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 9
    .line 10
    invoke-direct {v0, v1, v2}, Ll/si20;-><init>(Ll/pcj;Lcom/tantanapp/common/data/INetParser;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/apb;

    .line 22
    .line 23
    invoke-direct {v1}, Ll/apb;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    return-object v0
.end method

.method public static synthetic F3(Ll/lqb;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lqb;->I4(Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic G3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->id:Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 2
    .line 3
    const-string v0, "picksX10"

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

.method public static synthetic H3(Lorg/json/JSONObject;)Ll/x1d0;
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
    invoke-static {}, Lcom/p1/mobile/putong/core/api/a;->o2()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget-object v1, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 16
    .line 17
    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {v1, p0}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method public static synthetic I3(Lcom/p1/mobile/putong/core/data/NewCoinsEnvelope;)Lcom/p1/mobile/putong/core/data/Coin;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/NewCoinsEnvelope;->data:Lcom/p1/mobile/putong/core/data/NewCoinsData;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/NewCoinsData;->coins:Lcom/p1/mobile/putong/core/data/Coin;

    .line 4
    .line 5
    return-object p0
.end method

.method public static synthetic J3(Lorg/json/JSONObject;)Ll/x1d0;
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
    invoke-static {}, Lcom/p1/mobile/putong/core/api/a;->f0()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget-object v1, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 16
    .line 17
    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {v1, p0}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method public static synthetic K3(Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic L3(Ll/lqb;Ljava/lang/String;Ljava/lang/String;)Ll/x1d0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/lqb;->V4(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic M3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->id:Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 2
    .line 3
    const-string v0, "picksX30"

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

.method public static synthetic N3(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0;
    .locals 3

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
    new-instance v1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v2, "/alipay/certification/initialize?cert_name="

    .line 10
    .line 11
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string p0, "&cert_no="

    .line 18
    .line 19
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string p0, "&src=live"

    .line 26
    .line 27
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/a;->J0(Ljava/lang/String;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0
.end method

.method public static synthetic O3(Ll/lqb;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lqb;->O4(Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic P3()Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/wob;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/wob;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/qi20;->a(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Ll/xob;

    .line 11
    .line 12
    invoke-direct {v1}, Ll/xob;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    return-object v0
.end method

.method public static synthetic Q3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;)Ljava/lang/Integer;
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

.method public static synthetic R3(Ll/lqb;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/lqb;->L4()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic S3(Ll/lqb;Lcom/p1/mobile/putong/data/Envelope;)Ll/pf60;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lqb;->D4(Lcom/p1/mobile/putong/data/Envelope;)Ll/pf60;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic T3()Ll/x1d0;
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
    const-string v1, "/alipay/auth"

    .line 8
    .line 9
    invoke-static {v1}, Lcom/p1/mobile/putong/core/api/a;->J0(Ljava/lang/String;)Ljava/lang/String;

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

.method public static synthetic U3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->coinSign:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic V3(Ll/lqb;Lorg/json/JSONObject;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lqb;->U4(Lorg/json/JSONObject;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic W3(Lcom/p1/mobile/putong/data/AlipayAuthEnvelop;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/AlipayAuthEnvelop;->data:Lcom/p1/mobile/putong/data/AlipayAuthData;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/AlipayAuthData;->alipayAuthRequest:Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method

.method public static synthetic X3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->id:Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic Y3(Ll/lqb;Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/lqb;->S4(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Z3()Ll/x1d0;
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
    invoke-static {}, Lcom/p1/mobile/putong/core/api/a;->g0()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    return-object v0
.end method

.method public static synthetic a3(Ll/lqb;Lcom/alipay/sdk/app/AuthTask;Ljava/lang/String;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/lqb;->E4(Lcom/alipay/sdk/app/AuthTask;Ljava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic a4(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;
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
    new-instance v0, Ll/bpb;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/bpb;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/data/NewCoinsEnvelope;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic b4(Ll/lqb;Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/lqb;->W4(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c3(Ll/lqb;Lcom/p1/mobile/putong/data/Envelope;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lqb;->T4(Lcom/p1/mobile/putong/data/Envelope;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c4()Ll/x1d0;
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
    const-string v1, "/summarized-privilege-prices?affiliate=huawei"

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const-string v1, "/summarized-privilege-prices?affiliate=googleplay"

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

.method public static synthetic d3(Ll/lqb;Lcom/p1/mobile/putong/data/Envelope;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lqb;->H4(Lcom/p1/mobile/putong/data/Envelope;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic d4(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic e3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;)Ljava/lang/Boolean;
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

.method public static synthetic e4(Ll/lqb;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/lqb;->J4()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic f3(Ll/lqb;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lqb;->K4(Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic f4()Ll/x1d0;
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
    const-string v1, "/coins"

    .line 8
    .line 9
    invoke-static {v1}, Lcom/p1/mobile/putong/core/api/a;->J0(Ljava/lang/String;)Ljava/lang/String;

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

.method public static synthetic g3(Ll/lqb;Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/lqb;->R4(Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic g4(Lcom/p1/mobile/putong/core/data/Wallet;)Ll/x1d0;
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
    const-string v1, "/wallet?intent=certificate"

    .line 8
    .line 9
    invoke-static {v1}, Lcom/p1/mobile/putong/core/api/a;->J0(Ljava/lang/String;)Ljava/lang/String;

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
    sget-object v1, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Wallet;->toJson()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {v1, p0}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

.method public static synthetic h3()Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/ti20;

    .line 2
    .line 3
    new-instance v1, Ll/qob;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/qob;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Ll/ti20;-><init>(Ll/pcj;)V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/rob;

    .line 20
    .line 21
    invoke-direct {v1}, Ll/rob;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    return-object v0
.end method

.method public static synthetic h4(Lcom/p1/mobile/putong/core/data/Wallet;)Ll/x1d0;
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
    const-string v1, "/wallet?intent=auth"

    .line 8
    .line 9
    invoke-static {v1}, Lcom/p1/mobile/putong/core/api/a;->J0(Ljava/lang/String;)Ljava/lang/String;

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
    sget-object v1, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Wallet;->toJson()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {v1, p0}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

.method public static synthetic i3(Ll/lqb;Lcom/alipay/sdk/app/AuthTask;Ljava/lang/String;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/lqb;->G4(Lcom/alipay/sdk/app/AuthTask;Ljava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static i4(Z)Ljava/lang/String;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const-string p0, "coin"

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "privilege"

    .line 7
    .line 8
    return-object p0
.end method

.method public static synthetic j3()Ll/x1d0;
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
    invoke-static {}, Lcom/p1/mobile/putong/core/api/a;->v0()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    return-object v0
.end method

.method public static synthetic k3()Ll/x1d0;
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
    invoke-static {}, Lcom/p1/mobile/putong/core/api/a;->M2()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    return-object v0
.end method

.method public static synthetic l3(Ll/lqb;Lcom/p1/mobile/putong/data/Envelope;)Ll/pf60;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lqb;->F4(Lcom/p1/mobile/putong/data/Envelope;)Ll/pf60;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic m3()Ll/x1d0;
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
    invoke-static {}, Lcom/p1/mobile/putong/core/api/a;->w0()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    return-object v0
.end method

.method public static synthetic n3()Ll/x1d0;
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
    invoke-static {v1}, Lcom/p1/mobile/putong/core/api/a;->Y0(Ljava/lang/String;)Ljava/lang/String;

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

.method public static synthetic o3(Ll/lqb;Ljava/lang/String;Ljava/lang/String;)Ll/x1d0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/lqb;->Q4(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic p3()Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/eqb;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/eqb;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/qi20;->a(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Ll/fqb;

    .line 11
    .line 12
    invoke-direct {v1}, Ll/fqb;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    return-object v0
.end method

.method public static synthetic q3(Lorg/json/JSONObject;)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/zpb;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/zpb;-><init>(Lorg/json/JSONObject;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/qi20;->a(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    new-instance v0, Ll/aqb;

    .line 11
    .line 12
    invoke-direct {v0}, Ll/aqb;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public static synthetic r3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->id:Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic s3(Lcom/p1/mobile/putong/data/Envelope;)Lcom/google/common/base/Optional;
    .locals 2

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 8
    .line 9
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->accountRecords:Ljava/util/List;

    .line 10
    .line 11
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->accountRecords:Ljava/util/List;

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    check-cast p0, Lcom/p1/mobile/putong/core/data/AccountRecord;

    .line 31
    .line 32
    invoke-static {p0}, Lcom/google/common/base/Optional;->of(Ljava/lang/Object;)Lcom/google/common/base/Optional;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0

    .line 37
    :cond_0
    invoke-static {}, Lcom/google/common/base/Optional;->absent()Lcom/google/common/base/Optional;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0
.end method

.method public static synthetic t3(Lcom/p1/mobile/putong/data/Envelope;)Ll/pf60;
    .locals 2

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 8
    .line 9
    new-instance v0, Ll/pf60;

    .line 10
    .line 11
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->canChange:Z

    .line 12
    .line 13
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget p0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->ttcToDiamondRate:I

    .line 18
    .line 19
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-direct {v0, v1, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    return-object v0
.end method

.method public static synthetic u3(Ll/lqb;)Ll/x1d0;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/lqb;->N4()Ll/x1d0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic v3(Lcom/p1/mobile/putong/core/data/Wallet;)Ll/x1d0;
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
    const-string v1, "/wallet?intent=auth"

    .line 8
    .line 9
    invoke-static {v1}, Lcom/p1/mobile/putong/core/api/a;->J0(Ljava/lang/String;)Ljava/lang/String;

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
    sget-object v1, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Wallet;->toJson()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {v1, p0}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

.method public static synthetic w3(Ll/lqb;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/lqb;->P4()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic x3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic y3(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/core/data/MonetizationMsg;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->monetizationMsg:Lcom/p1/mobile/putong/core/data/MonetizationMsg;

    .line 10
    .line 11
    return-object p0
.end method

.method public static synthetic z3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/si20;

    .line 2
    .line 3
    new-instance v1, Ll/ppb;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/ppb;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object p0, Lcom/p1/mobile/putong/data/AlipayAuthEnvelop;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 9
    .line 10
    invoke-direct {v0, v1, p0}, Ll/si20;-><init>(Ll/pcj;Lcom/tantanapp/common/data/INetParser;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {v0, p0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method


# virtual methods
.method public A4()I
    .locals 1

    .line 1
    const-string v0, "instantChat"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Ll/lqb;->C5(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public A5(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/google/common/base/Optional<",
            "Lcom/p1/mobile/putong/core/data/AccountRecord;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    new-instance v1, Ll/qpb;

    .line 4
    .line 5
    invoke-direct {v1, p0, p2, p1}, Ll/qpb;-><init>(Ll/lqb;Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "wallet_account_refund"

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    invoke-virtual {v0, p0, p1, v1, p1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;Z)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public B4()I
    .locals 1

    .line 1
    const-string v0, "intlReadMessage"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Ll/lqb;->C5(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public B5()Lrx/c;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v1, "oneId"

    .line 7
    .line 8
    invoke-static {}, Ll/yp50;->d()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    .line 14
    .line 15
    :catch_0
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    new-instance v1, Ll/rpb;

    .line 18
    .line 19
    invoke-direct {v1, v0}, Ll/rpb;-><init>(Lorg/json/JSONObject;)V

    .line 20
    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    const-string v2, "trans_ttb_to_diamond"

    .line 24
    .line 25
    const/4 v3, -0x1

    .line 26
    invoke-virtual {p0, v2, v3, v1, v0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;Z)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public C4()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lqb;->W:Ll/jxd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public final C5(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)I
    .locals 1

    .line 1
    iget-object p0, p0, Ll/lqb;->T:Lrx/subjects/a;

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

.method public final synthetic D4(Lcom/p1/mobile/putong/data/Envelope;)Ll/pf60;
    .locals 2

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
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->wallet:Lcom/p1/mobile/putong/core/data/Wallet;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Wallet;->withdrawAccounts:Ljava/util/List;

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 20
    .line 21
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->wallet:Lcom/p1/mobile/putong/core/data/Wallet;

    .line 22
    .line 23
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Wallet;->withdrawAccounts:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-lez v1, :cond_0

    .line 30
    .line 31
    iget-object p0, p0, Ll/lqb;->W:Ll/jxd0;

    .line 32
    .line 33
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 34
    .line 35
    invoke-virtual {p0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    const/16 p0, 0x2328

    .line 39
    .line 40
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 49
    .line 50
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->wallet:Lcom/p1/mobile/putong/core/data/Wallet;

    .line 51
    .line 52
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Wallet;->withdrawAccounts:Ljava/util/List;

    .line 53
    .line 54
    const/4 v0, 0x0

    .line 55
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    check-cast p1, Lcom/p1/mobile/putong/data/WithdrawAccount;

    .line 60
    .line 61
    iget-object p1, p1, Lcom/p1/mobile/putong/data/WithdrawAccount;->name:Ljava/lang/String;

    .line 62
    .line 63
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    return-object p0

    .line 68
    :cond_0
    const/16 p0, 0x2329

    .line 69
    .line 70
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    const-string p1, "auth failed"

    .line 75
    .line 76
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    return-object p0
.end method

.method public D5()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/core/data/Wallet;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/lqb;->d0:Lrx/subjects/b;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic E4(Lcom/alipay/sdk/app/AuthTask;Ljava/lang/String;)Lrx/c;
    .locals 3

    .line 1
    const/16 v0, 0x2329

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const-string v2, "auth failed"

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-static {v0, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0

    .line 24
    :cond_0
    const/4 v1, 0x0

    .line 25
    invoke-virtual {p1, p2, v1}, Lcom/alipay/sdk/app/AuthTask;->authV2(Ljava/lang/String;Z)Ljava/util/Map;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const-string p2, "resultStatus"

    .line 30
    .line 31
    invoke-interface {p1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    check-cast p2, Ljava/lang/CharSequence;

    .line 36
    .line 37
    const-string v1, "9000"

    .line 38
    .line 39
    invoke-static {p2, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    if-eqz p2, :cond_1

    .line 44
    .line 45
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Wallet;->new_()Lcom/p1/mobile/putong/core/data/Wallet;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    new-instance v0, Lcom/p1/mobile/putong/data/WithdrawAccount;

    .line 50
    .line 51
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/WithdrawAccount;-><init>()V

    .line 52
    .line 53
    .line 54
    const-string v1, "alipay"

    .line 55
    .line 56
    invoke-static {v1}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    iput-object v1, v0, Lcom/p1/mobile/putong/data/WithdrawAccount;->platform:Lcom/p1/mobile/putong/data/PayMethod;

    .line 61
    .line 62
    const-string v1, "result"

    .line 63
    .line 64
    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    check-cast p1, Ljava/lang/String;

    .line 69
    .line 70
    iput-object p1, v0, Lcom/p1/mobile/putong/data/WithdrawAccount;->authInfo:Ljava/lang/String;

    .line 71
    .line 72
    filled-new-array {v0}, [Lcom/p1/mobile/putong/data/WithdrawAccount;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    iput-object p1, p2, Lcom/p1/mobile/putong/core/data/Wallet;->withdrawAccounts:Ljava/util/List;

    .line 81
    .line 82
    new-instance p1, Ll/ti20;

    .line 83
    .line 84
    new-instance v0, Ll/xpb;

    .line 85
    .line 86
    invoke-direct {v0, p2}, Ll/xpb;-><init>(Lcom/p1/mobile/putong/core/data/Wallet;)V

    .line 87
    .line 88
    .line 89
    invoke-direct {p1, v0}, Ll/ti20;-><init>(Ll/pcj;)V

    .line 90
    .line 91
    .line 92
    new-instance p2, Ll/ypb;

    .line 93
    .line 94
    invoke-direct {p2, p0}, Ll/ypb;-><init>(Ll/lqb;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p1, p2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    return-object p0

    .line 102
    :cond_1
    invoke-static {v0, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    return-object p0
.end method

.method public E5()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/google/common/base/Optional<",
            "Lcom/p1/mobile/putong/core/data/WalletAccount;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/lqb;->f0:Lrx/subjects/b;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/c;->asObservable()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic F4(Lcom/p1/mobile/putong/data/Envelope;)Ll/pf60;
    .locals 2

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
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->wallet:Lcom/p1/mobile/putong/core/data/Wallet;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Wallet;->withdrawAccounts:Ljava/util/List;

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 20
    .line 21
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->wallet:Lcom/p1/mobile/putong/core/data/Wallet;

    .line 22
    .line 23
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Wallet;->withdrawAccounts:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-lez v1, :cond_0

    .line 30
    .line 31
    iget-object p0, p0, Ll/lqb;->W:Ll/jxd0;

    .line 32
    .line 33
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 34
    .line 35
    invoke-virtual {p0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    const/16 p0, 0x2328

    .line 39
    .line 40
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 49
    .line 50
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->wallet:Lcom/p1/mobile/putong/core/data/Wallet;

    .line 51
    .line 52
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Wallet;->withdrawAccounts:Ljava/util/List;

    .line 53
    .line 54
    const/4 v0, 0x0

    .line 55
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    check-cast p1, Lcom/p1/mobile/putong/data/WithdrawAccount;

    .line 60
    .line 61
    iget-object p1, p1, Lcom/p1/mobile/putong/data/WithdrawAccount;->name:Ljava/lang/String;

    .line 62
    .line 63
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    return-object p0

    .line 68
    :cond_0
    const/16 p0, 0x2329

    .line 69
    .line 70
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Envelope;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 75
    .line 76
    iget p1, p1, Lcom/p1/mobile/putong/data/Meta;->subCode:I

    .line 77
    .line 78
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    return-object p0
.end method

.method public final synthetic G4(Lcom/alipay/sdk/app/AuthTask;Ljava/lang/String;)Lrx/c;
    .locals 3

    .line 1
    const/16 v0, 0x2329

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const-string v2, "auth failed"

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-static {v0, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0

    .line 24
    :cond_0
    const/4 v1, 0x0

    .line 25
    invoke-virtual {p1, p2, v1}, Lcom/alipay/sdk/app/AuthTask;->authV2(Ljava/lang/String;Z)Ljava/util/Map;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const-string p2, "resultStatus"

    .line 30
    .line 31
    invoke-interface {p1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    check-cast p2, Ljava/lang/CharSequence;

    .line 36
    .line 37
    const-string v1, "9000"

    .line 38
    .line 39
    invoke-static {p2, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    if-eqz p2, :cond_1

    .line 44
    .line 45
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Wallet;->new_()Lcom/p1/mobile/putong/core/data/Wallet;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    new-instance v0, Lcom/p1/mobile/putong/data/WithdrawAccount;

    .line 50
    .line 51
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/WithdrawAccount;-><init>()V

    .line 52
    .line 53
    .line 54
    const-string v1, "alipay"

    .line 55
    .line 56
    invoke-static {v1}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    iput-object v1, v0, Lcom/p1/mobile/putong/data/WithdrawAccount;->platform:Lcom/p1/mobile/putong/data/PayMethod;

    .line 61
    .line 62
    const-string v1, "result"

    .line 63
    .line 64
    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    check-cast p1, Ljava/lang/String;

    .line 69
    .line 70
    iput-object p1, v0, Lcom/p1/mobile/putong/data/WithdrawAccount;->authInfo:Ljava/lang/String;

    .line 71
    .line 72
    filled-new-array {v0}, [Lcom/p1/mobile/putong/data/WithdrawAccount;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    iput-object p1, p2, Lcom/p1/mobile/putong/core/data/Wallet;->withdrawAccounts:Ljava/util/List;

    .line 81
    .line 82
    new-instance p1, Ll/ti20;

    .line 83
    .line 84
    new-instance v0, Ll/iqb;

    .line 85
    .line 86
    invoke-direct {v0, p2}, Ll/iqb;-><init>(Lcom/p1/mobile/putong/core/data/Wallet;)V

    .line 87
    .line 88
    .line 89
    invoke-direct {p1, v0}, Ll/ti20;-><init>(Ll/pcj;)V

    .line 90
    .line 91
    .line 92
    new-instance p2, Ll/jqb;

    .line 93
    .line 94
    invoke-direct {p2, p0}, Ll/jqb;-><init>(Ll/lqb;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p1, p2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    return-object p0

    .line 102
    :cond_1
    invoke-static {v0, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    return-object p0
.end method

.method public final synthetic H4(Lcom/p1/mobile/putong/data/Envelope;)Ljava/lang/Boolean;
    .locals 2

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
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->wallet:Lcom/p1/mobile/putong/core/data/Wallet;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Wallet;->identificationInfo:Lcom/p1/mobile/putong/data/IdentificationInfo;

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreData;->wallet:Lcom/p1/mobile/putong/core/data/Wallet;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Wallet;->identificationInfo:Lcom/p1/mobile/putong/data/IdentificationInfo;

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Ll/lqb;->e5(Lcom/p1/mobile/putong/data/IdentificationInfo;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Envelope;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 29
    .line 30
    iget p0, p0, Lcom/p1/mobile/putong/data/Meta;->code:I

    .line 31
    .line 32
    const/16 p1, 0xc8

    .line 33
    .line 34
    if-ne p0, p1, :cond_1

    .line 35
    .line 36
    const/4 p0, 0x1

    .line 37
    goto :goto_0

    .line 38
    :cond_1
    const/4 p0, 0x0

    .line 39
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0
.end method

.method public final synthetic I4(Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 3

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
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->wallet:Lcom/p1/mobile/putong/core/data/Wallet;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Wallet;->identificationInfo:Lcom/p1/mobile/putong/data/IdentificationInfo;

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 20
    .line 21
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->wallet:Lcom/p1/mobile/putong/core/data/Wallet;

    .line 22
    .line 23
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Wallet;->identificationInfo:Lcom/p1/mobile/putong/data/IdentificationInfo;

    .line 24
    .line 25
    invoke-virtual {p0, v1}, Ll/lqb;->e5(Lcom/p1/mobile/putong/data/IdentificationInfo;)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    new-instance v1, Lcom/p1/mobile/putong/data/IdentificationInfo;

    .line 30
    .line 31
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/IdentificationInfo;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, v1}, Ll/lqb;->e5(Lcom/p1/mobile/putong/data/IdentificationInfo;)V

    .line 35
    .line 36
    .line 37
    :goto_0
    iget-object v1, p0, Ll/lqb;->d0:Lrx/subjects/b;

    .line 38
    .line 39
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    check-cast v2, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 44
    .line 45
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/CoreData;->wallet:Lcom/p1/mobile/putong/core/data/Wallet;

    .line 46
    .line 47
    invoke-virtual {v1, v2}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    iget-object p0, p0, Ll/lqb;->W:Ll/jxd0;

    .line 51
    .line 52
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 57
    .line 58
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->wallet:Lcom/p1/mobile/putong/core/data/Wallet;

    .line 59
    .line 60
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Wallet;->withdrawAccounts:Ljava/util/List;

    .line 61
    .line 62
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    xor-int/lit8 p1, p1, 0x1

    .line 67
    .line 68
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 76
    .line 77
    return-object p0
.end method

.method public final synthetic J4()Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/ti20;

    .line 2
    .line 3
    new-instance v1, Ll/nob;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/nob;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Ll/ti20;-><init>(Ll/pcj;)V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/pob;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/pob;-><init>(Ll/lqb;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public final synthetic K4(Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lqb;->l5(Lcom/p1/mobile/putong/data/Envelope;)V

    .line 2
    .line 3
    .line 4
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 5
    .line 6
    return-object p0
.end method

.method public final synthetic L4()Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/job;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/job;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/qi20;->a(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Ll/kob;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/kob;-><init>(Ll/lqb;)V

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

.method public final synthetic M4(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lqb;->v4(Lcom/p1/mobile/putong/data/Envelope;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic N4()Ll/x1d0;
    .locals 1

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/a;->N2()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public final synthetic O4(Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 2

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
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->walletAccounts:Ljava/util/List;

    .line 10
    .line 11
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    iget-object p0, p0, Ll/lqb;->f0:Lrx/subjects/b;

    .line 16
    .line 17
    if-nez v1, :cond_0

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 24
    .line 25
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->walletAccounts:Ljava/util/List;

    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    check-cast p1, Lcom/p1/mobile/putong/core/data/WalletAccount;

    .line 33
    .line 34
    invoke-static {p1}, Lcom/google/common/base/Optional;->of(Ljava/lang/Object;)Lcom/google/common/base/Optional;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    invoke-static {}, Lcom/google/common/base/Optional;->absent()Lcom/google/common/base/Optional;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    :goto_0
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 50
    .line 51
    return-object p0
.end method

.method public final synthetic P4()Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/eob;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/eob;-><init>(Ll/lqb;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/qi20;->a(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Ll/fob;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/fob;-><init>(Ll/lqb;)V

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

.method public final synthetic Q4(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0;
    .locals 1

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
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/api/a;->O2(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public final synthetic R4(Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/lqb;->g0:Lrx/subjects/b;

    .line 2
    .line 3
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 4
    .line 5
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    check-cast p2, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 10
    .line 11
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/CoreData;->accountRecords:Ljava/util/List;

    .line 12
    .line 13
    invoke-static {p1, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 21
    .line 22
    return-object p0
.end method

.method public final synthetic S4(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/lob;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/lob;-><init>(Ll/lqb;Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/qi20;->a(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    new-instance v0, Ll/mob;

    .line 11
    .line 12
    invoke-direct {v0, p0, p2}, Ll/mob;-><init>(Ll/lqb;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public final synthetic T4(Lcom/p1/mobile/putong/data/Envelope;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/lqb;->k5()Lrx/c;

    .line 6
    .line 7
    .line 8
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Envelope;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 9
    .line 10
    iget p0, p0, Lcom/p1/mobile/putong/data/Meta;->code:I

    .line 11
    .line 12
    const/16 p1, 0xc8

    .line 13
    .line 14
    if-ne p0, p1, :cond_0

    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public final synthetic U4(Lorg/json/JSONObject;)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/bqb;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/bqb;-><init>(Lorg/json/JSONObject;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/qi20;->e(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p1, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    new-instance v0, Ll/cqb;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Ll/cqb;-><init>(Ll/lqb;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public final synthetic V4(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0;
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
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/a;->P2(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    sget-object p1, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 16
    .line 17
    new-instance v0, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    const-string v1, "{\"recordType\": \"withdraw\", \"amount\":\""

    .line 20
    .line 21
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string p2, "\"}"

    .line 28
    .line 29
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    invoke-static {p1, p2}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p0, p1}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0
.end method

.method public final synthetic W4(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/tpb;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/tpb;-><init>(Ll/lqb;Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/qi20;->a(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    new-instance p1, Ll/upb;

    .line 11
    .line 12
    invoke-direct {p1}, Ll/upb;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public X4()I
    .locals 1

    .line 1
    const-string v0, "letter"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Ll/lqb;->C5(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public Y4()J
    .locals 3

    .line 1
    iget-object v0, p0, Ll/lqb;->a0:Ll/z7i0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/lqb;->S:Lrx/subjects/a;

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
    iget-object p0, p0, Ll/lqb;->S:Lrx/subjects/a;

    .line 15
    .line 16
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Lcom/p1/mobile/putong/core/data/Coin;

    .line 21
    .line 22
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/Coin;->available:J

    .line 23
    .line 24
    :goto_0
    invoke-virtual {v0, v1, v2}, Ll/z7i0;->c(J)J

    .line 25
    .line 26
    .line 27
    move-result-wide v0

    .line 28
    return-wide v0
.end method

.method public Z4()I
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
    invoke-virtual {p0, v0}, Ll/lqb;->C5(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public a5()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/core/data/Coin;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/lqb;->S:Lrx/subjects/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public b5()I
    .locals 1

    .line 1
    const-string v0, "preConfession"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Ll/lqb;->C5(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public final c5(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)I
    .locals 1

    .line 1
    iget-object p0, p0, Ll/lqb;->V:Lrx/subjects/a;

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
    check-cast p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;

    .line 23
    .line 24
    iget p0, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->price:I

    .line 25
    .line 26
    return p0

    .line 27
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method public d5()I
    .locals 1

    .line 1
    const-string v0, "profileLike"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Ll/lqb;->C5(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public e5(Lcom/p1/mobile/putong/data/IdentificationInfo;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lqb;->e0:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public f5()I
    .locals 1

    .line 1
    const-string v0, "quickchatNumber"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Ll/lqb;->C5(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public g5()I
    .locals 1

    .line 1
    const-string v0, "quickchatSpeedUpNumX10"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Ll/lqb;->c5(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public h5()I
    .locals 1

    .line 1
    const-string v0, "quickchatSpeedUpNumX1"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Ll/lqb;->c5(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public i5()I
    .locals 1

    .line 1
    const-string v0, "quickchatSpeedUpNumX20"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Ll/lqb;->c5(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public j4(Lcom/alipay/sdk/app/AuthTask;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/alipay/sdk/app/AuthTask;",
            ")",
            "Lrx/c<",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/lqb;->q5()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/spb;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ll/spb;-><init>(Ll/lqb;Lcom/alipay/sdk/app/AuthTask;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public j5()Lrx/c;
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
    new-instance v1, Ll/iob;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/iob;-><init>(Ll/lqb;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "wallet"

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

.method public k4(Lcom/alipay/sdk/app/AuthTask;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/alipay/sdk/app/AuthTask;",
            ")",
            "Lrx/c<",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/lqb;->q5()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/dob;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ll/dob;-><init>(Ll/lqb;Lcom/alipay/sdk/app/AuthTask;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public k5()Lrx/c;
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
    new-instance v1, Ll/oob;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/oob;-><init>(Ll/lqb;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "myCoins"

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

.method public l4()I
    .locals 1

    .line 1
    const-string v0, "voiceQuickchatNum"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Ll/lqb;->C5(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public l5(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/l51;->D()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/lqb;->v4(Lcom/p1/mobile/putong/data/Envelope;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    new-instance v0, Ll/cpb;

    .line 12
    .line 13
    invoke-direct {v0, p0, p1}, Ll/cpb;-><init>(Ll/lqb;Lcom/p1/mobile/putong/data/Envelope;)V

    .line 14
    .line 15
    .line 16
    invoke-static {v0}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public m4()I
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
    invoke-virtual {p0, v0}, Ll/lqb;->C5(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public m5()Lrx/c;
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
    new-instance v1, Ll/zob;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/zob;-><init>(Ll/lqb;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "wallet_account_monetization"

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

.method public n4()I
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
    invoke-virtual {p0, v0}, Ll/lqb;->C5(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public n5(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "wallet_account_records"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    new-instance v2, Ll/gqb;

    .line 18
    .line 19
    invoke-direct {v2, p0, p1, p2}, Ll/gqb;-><init>(Ll/lqb;Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const/4 p0, 0x0

    .line 23
    invoke-virtual {v0, v1, p0, v2}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public o4()I
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
    invoke-virtual {p0, v0}, Ll/lqb;->C5(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public o5()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/AccountRecord;",
            ">;>;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/lqb;->g0:Lrx/subjects/b;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/c;->asObservable()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public p4()I
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
    invoke-virtual {p0, v0}, Ll/lqb;->C5(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public declared-synchronized p5(Ljava/lang/Long;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/lqb;->a0:Ll/z7i0;

    .line 3
    .line 4
    invoke-virtual {v0, p1}, Ll/z7i0;->f(Ljava/lang/Long;)V
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

.method public q4()I
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
    invoke-virtual {p0, v0}, Ll/lqb;->C5(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public final q5()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    new-instance v0, Ll/hqb;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/hqb;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v1, "authUrl"

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-virtual {p0, v1, v2, v0, v2}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;Z)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public r4()I
    .locals 1

    .line 1
    const-string v0, "suggestTopShow"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Ll/lqb;->c5(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public r5(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/AlipayAuthEnvelop;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    new-instance v0, Ll/dpb;

    .line 4
    .line 5
    invoke-direct {v0, p1, p2}, Ll/dpb;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const-string p1, "certificationUrl"

    .line 9
    .line 10
    const/4 p2, 0x0

    .line 11
    invoke-virtual {p0, p1, p2, v0, p2}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;Z)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public s4(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lqb;->U:Lrx/subjects/a;

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

.method public declared-synchronized s5(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Ljava/lang/Long;
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/lqb;->a0:Ll/z7i0;

    .line 3
    .line 4
    invoke-virtual {p0, p2}, Ll/lqb;->C5(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)I

    .line 5
    .line 6
    .line 7
    move-result p2

    .line 8
    invoke-virtual {v0, p1, p2}, Ll/z7i0;->d(Ljava/lang/String;I)Ljava/lang/Long;

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

.method public t4()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lqb;->b0:Lcom/p1/mobile/putong/core/data/PromotionPrivilegePrices;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PromotionPrivilegePrices;->coinSign:Ljava/lang/String;

    .line 9
    .line 10
    return-object p0
.end method

.method public t5()I
    .locals 1

    .line 1
    const-string v0, "greetNumber"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Ll/lqb;->C5(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    const/16 p0, 0x12b

    .line 14
    .line 15
    :cond_0
    return p0
.end method

.method public u4()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lqb;->b0:Lcom/p1/mobile/putong/core/data/PromotionPrivilegePrices;

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

.method public u5()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    new-instance v0, Ll/gob;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/gob;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v1, "show_lucky_tantan"

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
    return-object p0
.end method

.method public final v4(Lcom/p1/mobile/putong/data/Envelope;)V
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
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->coins:Lcom/p1/mobile/putong/core/data/Coin;

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    iget-object v1, p0, Ll/lqb;->S:Lrx/subjects/a;

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    check-cast v2, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 20
    .line 21
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/CoreData;->coins:Lcom/p1/mobile/putong/core/data/Coin;

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 31
    .line 32
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->summarizedPrivilegePrices:Ljava/util/List;

    .line 33
    .line 34
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-nez v1, :cond_4

    .line 39
    .line 40
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    check-cast v1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 45
    .line 46
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->summarizedPrivilegePrices:Ljava/util/List;

    .line 47
    .line 48
    new-instance v2, Ll/epb;

    .line 49
    .line 50
    invoke-direct {v2}, Ll/epb;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-static {v1, v2}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    check-cast v1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;

    .line 58
    .line 59
    iput-object v1, p0, Ll/lqb;->X:Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;

    .line 60
    .line 61
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    check-cast v1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 66
    .line 67
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->summarizedPrivilegePrices:Ljava/util/List;

    .line 68
    .line 69
    new-instance v2, Ll/fpb;

    .line 70
    .line 71
    invoke-direct {v2}, Ll/fpb;-><init>()V

    .line 72
    .line 73
    .line 74
    invoke-static {v1, v2}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    check-cast v1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;

    .line 79
    .line 80
    iput-object v1, p0, Ll/lqb;->Y:Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;

    .line 81
    .line 82
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    check-cast v1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 87
    .line 88
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->summarizedPrivilegePrices:Ljava/util/List;

    .line 89
    .line 90
    new-instance v2, Ll/gpb;

    .line 91
    .line 92
    invoke-direct {v2}, Ll/gpb;-><init>()V

    .line 93
    .line 94
    .line 95
    invoke-static {v1, v2}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    check-cast v1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;

    .line 100
    .line 101
    iput-object v1, p0, Ll/lqb;->Z:Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;

    .line 102
    .line 103
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    check-cast v1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 108
    .line 109
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->summarizedPrivilegePrices:Ljava/util/List;

    .line 110
    .line 111
    new-instance v2, Ll/hpb;

    .line 112
    .line 113
    invoke-direct {v2}, Ll/hpb;-><init>()V

    .line 114
    .line 115
    .line 116
    invoke-static {v1, v2}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    check-cast v1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;

    .line 121
    .line 122
    if-eqz v1, :cond_1

    .line 123
    .line 124
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->promotionPrivilegePrices:Ljava/util/List;

    .line 125
    .line 126
    if-eqz v2, :cond_1

    .line 127
    .line 128
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    .line 129
    .line 130
    .line 131
    move-result v2

    .line 132
    if-nez v2, :cond_1

    .line 133
    .line 134
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->promotionPrivilegePrices:Ljava/util/List;

    .line 135
    .line 136
    const/4 v2, 0x0

    .line 137
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    move-result-object v1

    .line 141
    check-cast v1, Lcom/p1/mobile/putong/core/data/PromotionPrivilegePrices;

    .line 142
    .line 143
    iput-object v1, p0, Ll/lqb;->b0:Lcom/p1/mobile/putong/core/data/PromotionPrivilegePrices;

    .line 144
    .line 145
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    invoke-interface {v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Vo()Z

    .line 150
    .line 151
    .line 152
    move-result v1

    .line 153
    if-eqz v1, :cond_3

    .line 154
    .line 155
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    check-cast v1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 160
    .line 161
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->summarizedPrivilegePrices:Ljava/util/List;

    .line 162
    .line 163
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 164
    .line 165
    .line 166
    move-result v2

    .line 167
    if-nez v2, :cond_3

    .line 168
    .line 169
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 170
    .line 171
    .line 172
    move-result-object v1

    .line 173
    :cond_2
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 174
    .line 175
    .line 176
    move-result v2

    .line 177
    if-eqz v2, :cond_3

    .line 178
    .line 179
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 180
    .line 181
    .line 182
    move-result-object v2

    .line 183
    check-cast v2, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;

    .line 184
    .line 185
    iget-object v3, v2, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->id:Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 186
    .line 187
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 188
    .line 189
    .line 190
    move-result v3

    .line 191
    if-eqz v3, :cond_2

    .line 192
    .line 193
    iget-object v3, v2, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->id:Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 194
    .line 195
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object v3

    .line 199
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 200
    .line 201
    .line 202
    move-result v4

    .line 203
    if-nez v4, :cond_2

    .line 204
    .line 205
    const-string v4, "momentBoostCoin"

    .line 206
    .line 207
    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 208
    .line 209
    .line 210
    move-result v4

    .line 211
    if-eqz v4, :cond_2

    .line 212
    .line 213
    iget-object v4, p0, Ll/lqb;->c0:Ljava/util/Map;

    .line 214
    .line 215
    invoke-interface {v4, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 216
    .line 217
    .line 218
    goto :goto_0

    .line 219
    :cond_3
    iget-object v1, p0, Ll/lqb;->T:Lrx/subjects/a;

    .line 220
    .line 221
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 222
    .line 223
    .line 224
    move-result-object v2

    .line 225
    check-cast v2, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 226
    .line 227
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/CoreData;->summarizedPrivilegePrices:Ljava/util/List;

    .line 228
    .line 229
    new-instance v3, Ll/ipb;

    .line 230
    .line 231
    invoke-direct {v3}, Ll/ipb;-><init>()V

    .line 232
    .line 233
    .line 234
    new-instance v4, Ll/jpb;

    .line 235
    .line 236
    invoke-direct {v4}, Ll/jpb;-><init>()V

    .line 237
    .line 238
    .line 239
    invoke-static {v2, v3, v4}, Ll/jyb;->d(Ljava/util/Collection;Ll/qcj;Ll/qcj;)Ljava/util/HashMap;

    .line 240
    .line 241
    .line 242
    move-result-object v2

    .line 243
    invoke-virtual {v1, v2}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 244
    .line 245
    .line 246
    iget-object v1, p0, Ll/lqb;->U:Lrx/subjects/a;

    .line 247
    .line 248
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 249
    .line 250
    .line 251
    move-result-object v2

    .line 252
    check-cast v2, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 253
    .line 254
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/CoreData;->summarizedPrivilegePrices:Ljava/util/List;

    .line 255
    .line 256
    new-instance v3, Ll/lpb;

    .line 257
    .line 258
    invoke-direct {v3}, Ll/lpb;-><init>()V

    .line 259
    .line 260
    .line 261
    new-instance v4, Ll/mpb;

    .line 262
    .line 263
    invoke-direct {v4}, Ll/mpb;-><init>()V

    .line 264
    .line 265
    .line 266
    invoke-static {v2, v3, v4}, Ll/jyb;->d(Ljava/util/Collection;Ll/qcj;Ll/qcj;)Ljava/util/HashMap;

    .line 267
    .line 268
    .line 269
    move-result-object v2

    .line 270
    invoke-virtual {v1, v2}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 271
    .line 272
    .line 273
    iget-object p0, p0, Ll/lqb;->V:Lrx/subjects/a;

    .line 274
    .line 275
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 276
    .line 277
    .line 278
    move-result-object p1

    .line 279
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 280
    .line 281
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->summarizedPrivilegePrices:Ljava/util/List;

    .line 282
    .line 283
    new-instance v0, Ll/npb;

    .line 284
    .line 285
    invoke-direct {v0}, Ll/npb;-><init>()V

    .line 286
    .line 287
    .line 288
    new-instance v1, Ll/opb;

    .line 289
    .line 290
    invoke-direct {v1}, Ll/opb;-><init>()V

    .line 291
    .line 292
    .line 293
    invoke-static {p1, v0, v1}, Ll/jyb;->d(Ljava/util/Collection;Ll/qcj;Ll/qcj;)Ljava/util/HashMap;

    .line 294
    .line 295
    .line 296
    move-result-object p1

    .line 297
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 298
    .line 299
    .line 300
    :cond_4
    return-void
.end method

.method public v5()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/pf60<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    new-instance v0, Ll/kqb;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/kqb;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v1, "show_trans_diamond_bt"

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
    return-object p0
.end method

.method public w4()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/core/data/MonetizationMsg;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    new-instance v0, Ll/dqb;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/dqb;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v1, "show_lucky_tantan"

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
    return-object p0
.end method

.method public w5()Lrx/c;
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
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    new-instance v0, Ll/hob;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/hob;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v1, "show_liveIncome"

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
    return-object p0
.end method

.method public x4()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/core/data/Coin;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    new-instance v0, Ll/kpb;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/kpb;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v1, "getNewCoins"

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
    new-instance v0, Ll/vpb;

    .line 16
    .line 17
    invoke-direct {v0}, Ll/vpb;-><init>()V

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

.method public x5(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;Ljava/lang/String;I)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;",
            "Ljava/lang/String;",
            "I)",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v1, "coinSign"

    .line 7
    .line 8
    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 9
    .line 10
    .line 11
    const-string p1, "consumeType"

    .line 12
    .line 13
    invoke-virtual {v0, p1, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 14
    .line 15
    .line 16
    const-string p1, "privilegeType"

    .line 17
    .line 18
    invoke-virtual {v0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 19
    .line 20
    .line 21
    const-string p1, "price"

    .line 22
    .line 23
    invoke-virtual {v0, p1, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 24
    .line 25
    .line 26
    :catch_0
    iget-object p1, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 27
    .line 28
    new-instance p2, Ll/wpb;

    .line 29
    .line 30
    invoke-direct {p2, p0, v0}, Ll/wpb;-><init>(Ll/lqb;Lorg/json/JSONObject;)V

    .line 31
    .line 32
    .line 33
    const-string p0, "summarized_privilege_new"

    .line 34
    .line 35
    const/4 p3, -0x1

    .line 36
    invoke-virtual {p1, p0, p3, p2}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0
.end method

.method public y4()I
    .locals 1

    .line 1
    const-string v0, "sayHello"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Ll/lqb;->C5(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public y5()I
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
    invoke-virtual {p0, v0}, Ll/lqb;->C5(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public z4(Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/Wallet;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/Wallet;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Lcom/p1/mobile/putong/data/IdentificationInfo;

    .line 7
    .line 8
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/IdentificationInfo;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Wallet;->identificationInfo:Lcom/p1/mobile/putong/data/IdentificationInfo;

    .line 12
    .line 13
    iput-object p1, v1, Lcom/p1/mobile/putong/data/IdentificationInfo;->zhiMaCertificationResult:Ljava/lang/String;

    .line 14
    .line 15
    new-instance p1, Ll/ti20;

    .line 16
    .line 17
    new-instance v1, Ll/sob;

    .line 18
    .line 19
    invoke-direct {v1, v0}, Ll/sob;-><init>(Lcom/p1/mobile/putong/core/data/Wallet;)V

    .line 20
    .line 21
    .line 22
    invoke-direct {p1, v1}, Ll/ti20;-><init>(Ll/pcj;)V

    .line 23
    .line 24
    .line 25
    new-instance v0, Ll/tob;

    .line 26
    .line 27
    invoke-direct {v0, p0}, Ll/tob;-><init>(Ll/lqb;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0
.end method

.method public z5()I
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
    invoke-virtual {p0, v0}, Ll/lqb;->C5(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method
