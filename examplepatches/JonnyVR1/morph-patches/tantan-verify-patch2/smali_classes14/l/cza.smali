.class public Ll/cza;
.super Ll/dy6;
.source "SourceFile"


# instance fields
.field public R:I

.field public S:F

.field public T:Lcom/p1/mobile/putong/core/data/StartSpotLightData;

.field public U:Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;

.field public V:Ll/byd0;

.field public W:Ll/byd0;

.field public final X:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/google/common/base/Optional<",
            "Ll/uxj0;",
            ">;>;"
        }
    .end annotation
.end field

.field public final Y:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Landroid/util/Pair<",
            "Ljava/lang/Integer;",
            "Landroid/util/Pair<",
            "Ljava/lang/Float;",
            "Ljava/lang/Integer;",
            ">;>;>;"
        }
    .end annotation
.end field

.field public Z:Ll/kcg0;

.field public a0:Z

.field public b0:I


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/api/c;)V
    .locals 4

    .line 1
    invoke-direct {p0, p1}, Ll/dy6;-><init>(Lcom/p1/mobile/putong/core/api/c;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Ll/cza;->R:I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput v0, p0, Ll/cza;->S:F

    .line 9
    .line 10
    invoke-static {}, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->new_()Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Ll/cza;->U:Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;

    .line 15
    .line 16
    new-instance v0, Ll/byd0;

    .line 17
    .line 18
    const-wide/16 v1, 0x0

    .line 19
    .line 20
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    const-string v2, "spot_last_time"

    .line 25
    .line 26
    invoke-direct {v0, v2, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Ll/cza;->V:Ll/byd0;

    .line 30
    .line 31
    new-instance v0, Ll/byd0;

    .line 32
    .line 33
    new-instance v2, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    const-string v3, "last_spotlight_anim_show_time_"

    .line 36
    .line 37
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-direct {v0, v2, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 56
    .line 57
    .line 58
    iput-object v0, p0, Ll/cza;->W:Ll/byd0;

    .line 59
    .line 60
    invoke-static {}, Lcom/google/common/base/Optional;->absent()Lcom/google/common/base/Optional;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-static {v0}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    iput-object v0, p0, Ll/cza;->X:Lrx/subjects/a;

    .line 69
    .line 70
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    iput-object v0, p0, Ll/cza;->Y:Lrx/subjects/a;

    .line 75
    .line 76
    iput p1, p0, Ll/cza;->b0:I

    .line 77
    .line 78
    return-void
.end method

.method public static synthetic a3(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Conversation;->clone()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->read:Ljava/lang/Boolean;

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/g;->mq(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic b3()Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/aza;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/aza;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/data/HasSpotLightEnvelope;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/qi20;->c(Ll/pcj;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

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
    new-instance v1, Ll/bza;

    .line 21
    .line 22
    invoke-direct {v1}, Ll/bza;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    return-object v0
.end method

.method public static synthetic c3(Ljava/lang/String;)Ll/x1d0;
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
    invoke-static {}, Lcom/p1/mobile/putong/core/api/a;->f2()Ljava/lang/String;

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
    invoke-static {v1, p0}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {v0, p0}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public static synthetic d3(Ll/cza;Ljava/lang/String;Ll/z20;Lrx/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/cza;->K3(Ljava/lang/String;Ll/z20;Lrx/c;)V

    return-void
.end method

.method public static synthetic e3(Ll/cza;ZLl/x20;Lcom/p1/mobile/putong/core/data/StartSpotLightEnvelope;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/cza;->E3(ZLl/x20;Lcom/p1/mobile/putong/core/data/StartSpotLightEnvelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic f3(Ll/cza;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Ll/uxj0;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/cza;->I3(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Ll/uxj0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic g3(Ll/cza;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cza;->L3(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic h3(Ljava/lang/String;)Ll/x1d0;
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
    invoke-static {v1}, Lcom/p1/mobile/putong/core/api/a;->g2(Ljava/lang/String;)Ljava/lang/String;

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
    sget-object v1, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 24
    .line 25
    invoke-static {v1, p0}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v0, p0}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0
.end method

.method public static synthetic i3(Ll/cza;Ljava/lang/String;Ljava/lang/String;Ll/z20;Lcom/p1/mobile/putong/core/data/SpotLightForceMatchEnvelope;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/cza;->B3(Ljava/lang/String;Ljava/lang/String;Ll/z20;Lcom/p1/mobile/putong/core/data/SpotLightForceMatchEnvelope;)Ll/uxj0;

    move-result-object p0

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
    invoke-static {v1}, Lcom/p1/mobile/putong/core/api/a;->i2(Ljava/lang/String;)Ljava/lang/String;

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

.method public static synthetic k3(Ll/cza;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/cza;->P3()V

    return-void
.end method

.method public static synthetic l3()Ll/x1d0;
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
    invoke-static {v1}, Lcom/p1/mobile/putong/core/api/a;->T(Ljava/lang/String;)Ljava/lang/String;

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

.method public static synthetic m3(Ll/z20;Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-interface {p0, p2, p1}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic n3(Ll/cza;Lcom/p1/mobile/putong/core/data/StartSpotLightEnvelope;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cza;->G3(Lcom/p1/mobile/putong/core/data/StartSpotLightEnvelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic o3(Ll/cza;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/z20;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/cza;->C3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/z20;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic p3(Ll/cza;Ll/x20;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/cza;->M3(Ll/x20;Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic q3(Ll/cza;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/cza;->D3()V

    return-void
.end method

.method public static synthetic r3(Ll/cza;Ljava/lang/String;ZLl/x20;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/cza;->F3(Ljava/lang/String;ZLl/x20;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic s3(Lcom/p1/mobile/putong/core/data/HasSpotLightEnvelope;)Lcom/p1/mobile/putong/core/data/HasSpotLightData;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/HasSpotLightEnvelope;->data:Lcom/p1/mobile/putong/core/data/HasSpotLightData;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic t3(Ll/cza;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cza;->J3(Lcom/p1/mobile/putong/core/data/Conversation;)V

    return-void
.end method

.method public static synthetic u3(Ll/cza;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/cza;->H3()Lrx/c;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public A3()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/core/data/HasSpotLightData;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    new-instance v0, Ll/zya;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/zya;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v1, "giving_spot_light"

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

.method public final synthetic B3(Ljava/lang/String;Ljava/lang/String;Ll/z20;Lcom/p1/mobile/putong/core/data/SpotLightForceMatchEnvelope;)Ll/uxj0;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/cza;->x3()Lrx/subjects/a;

    .line 2
    .line 3
    .line 4
    move-result-object p4

    .line 5
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/google/common/base/Optional;->of(Ljava/lang/Object;)Lcom/google/common/base/Optional;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {p4, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1, p2, p3}, Ll/cza;->T3(Ljava/lang/String;Ljava/lang/String;Ll/z20;)V

    .line 15
    .line 16
    .line 17
    return-object v0
.end method

.method public final synthetic C3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/z20;)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/xya;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/xya;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object p1, Lcom/p1/mobile/putong/core/data/SpotLightForceMatchEnvelope;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 7
    .line 8
    invoke-static {v0, p1}, Ll/qi20;->c(Ll/pcj;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p1, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    new-instance v0, Ll/yya;

    .line 21
    .line 22
    invoke-direct {v0, p0, p2, p3, p4}, Ll/yya;-><init>(Ll/cza;Ljava/lang/String;Ljava/lang/String;Ll/z20;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public final synthetic D3()V
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 7
    .line 8
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const-string v2, "spotlight_message_suggestions.json"

    .line 17
    .line 18
    invoke-virtual {v1, v2}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    new-instance v2, Ljava/io/InputStreamReader;

    .line 23
    .line 24
    invoke-direct {v2, v1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 25
    .line 26
    .line 27
    new-instance v3, Ljava/io/BufferedReader;

    .line 28
    .line 29
    invoke-direct {v3, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 30
    .line 31
    .line 32
    :goto_0
    invoke-virtual {v3}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    if-eqz v4, :cond_0

    .line 37
    .line 38
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v2}, Ljava/io/InputStreamReader;->close()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    sget-object v1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 56
    .line 57
    invoke-virtual {v1, v0}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;

    .line 62
    .line 63
    iput-object v0, p0, Ll/cza;->U:Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 64
    .line 65
    :catch_0
    return-void
.end method

.method public final synthetic E3(ZLl/x20;Lcom/p1/mobile/putong/core/data/StartSpotLightEnvelope;)Ll/uxj0;
    .locals 0

    .line 1
    iget-object p3, p3, Lcom/p1/mobile/putong/core/data/StartSpotLightEnvelope;->data:Lcom/p1/mobile/putong/core/data/StartSpotLightData;

    .line 2
    .line 3
    iput-object p3, p0, Ll/cza;->T:Lcom/p1/mobile/putong/core/data/StartSpotLightData;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/cza;->P3()V

    .line 6
    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    iget-object p1, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/lqb;->k5()Lrx/c;

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/joa;->y4()Lrx/c;

    .line 22
    .line 23
    .line 24
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    if-eqz p0, :cond_1

    .line 29
    .line 30
    invoke-interface {p2}, Ll/x20;->call()V

    .line 31
    .line 32
    .line 33
    :cond_1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 34
    .line 35
    return-object p0
.end method

.method public final synthetic F3(Ljava/lang/String;ZLl/x20;)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/vya;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/vya;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object p1, Lcom/p1/mobile/putong/core/data/StartSpotLightEnvelope;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 7
    .line 8
    invoke-static {v0, p1}, Ll/qi20;->c(Ll/pcj;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p1, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    new-instance v0, Ll/wya;

    .line 21
    .line 22
    invoke-direct {v0, p0, p2, p3}, Ll/wya;-><init>(Ll/cza;ZLl/x20;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public final synthetic G3(Lcom/p1/mobile/putong/core/data/StartSpotLightEnvelope;)Ll/uxj0;
    .locals 1

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/StartSpotLightEnvelope;->data:Lcom/p1/mobile/putong/core/data/StartSpotLightData;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    iput-boolean v0, p0, Ll/cza;->a0:Z

    .line 5
    .line 6
    iput-object p1, p0, Ll/cza;->T:Lcom/p1/mobile/putong/core/data/StartSpotLightData;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/cza;->P3()V

    .line 9
    .line 10
    .line 11
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 12
    .line 13
    return-object p0
.end method

.method public final synthetic H3()Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/qya;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/qya;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/data/StartSpotLightEnvelope;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/qi20;->c(Ll/pcj;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

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
    new-instance v1, Ll/rya;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/rya;-><init>(Ll/cza;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public final synthetic I3(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Ll/uxj0;)Lrx/c;
    .locals 6

    .line 1
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    const/4 v4, 0x0

    .line 6
    const/4 v5, 0x0

    .line 7
    const/4 v3, 0x0

    .line 8
    move-object v1, p1

    .line 9
    move-object v2, p2

    .line 10
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/api/g;->Fn(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Sticker;ZZ)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public final synthetic J3(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->U:Ll/fy6;

    .line 4
    .line 5
    new-instance v0, Ll/tya;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Ll/tya;-><init>(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ll/fy6;->a(Ll/x20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic K3(Ljava/lang/String;Ll/z20;Lrx/c;)V
    .locals 0

    .line 1
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p3, p1}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p3

    .line 13
    if-eqz p3, :cond_0

    .line 14
    .line 15
    new-instance p3, Ll/pya;

    .line 16
    .line 17
    invoke-direct {p3, p0, p1}, Ll/pya;-><init>(Ll/cza;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 18
    .line 19
    .line 20
    invoke-static {p3}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    const-string p1, ""

    .line 25
    .line 26
    invoke-interface {p2, p0, p1}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final synthetic L3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/cza;->S3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic M3(Ll/x20;Ljava/lang/Long;)V
    .locals 0

    .line 1
    iget p2, p0, Ll/cza;->b0:I

    .line 2
    .line 3
    add-int/lit16 p2, p2, 0x1f4

    .line 4
    .line 5
    iput p2, p0, Ll/cza;->b0:I

    .line 6
    .line 7
    invoke-interface {p1}, Ll/x20;->call()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final N3(ILjava/lang/Float;Ljava/lang/Integer;)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iput v0, p0, Ll/cza;->S:F

    .line 6
    .line 7
    iget-object p0, p0, Ll/cza;->Y:Lrx/subjects/a;

    .line 8
    .line 9
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-static {p2, p3}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-static {p1, p2}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public O3(Ll/x20;ZZ)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 4
    .line 5
    const-string v1, "spotLight"

    .line 6
    .line 7
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ll/lqb;->s4(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const-string v2, "{\"active\": true, \"privilegeType\": \"spotLight\", \"consumeType\": \""

    .line 18
    .line 19
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-static {p3}, Ll/lqb;->i4(Z)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p3

    .line 26
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string p3, "\",\"mcc\": \""

    .line 30
    .line 31
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    sget p3, Ll/uqb0;->f0:I

    .line 35
    .line 36
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string p3, "\", \"reginTag\":\""

    .line 40
    .line 41
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    sget-object p3, Ll/uqb0;->h0:Lcom/p1/mobile/putong/data/LiveRegionTag;

    .line 45
    .line 46
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    const-string p3, "\", \"CoinSign\":\""

    .line 50
    .line 51
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    const-string p3, "\"}"

    .line 58
    .line 59
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p3

    .line 66
    iget-object v0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 67
    .line 68
    new-instance v1, Ll/uya;

    .line 69
    .line 70
    invoke-direct {v1, p0, p3, p2, p1}, Ll/uya;-><init>(Ll/cza;Ljava/lang/String;ZLl/x20;)V

    .line 71
    .line 72
    .line 73
    const-string p0, "patch_super_boost_start"

    .line 74
    .line 75
    const/4 p1, -0x1

    .line 76
    invoke-virtual {v0, p0, p1, v1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public final P3()V
    .locals 10

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    iget-boolean v3, p0, Ll/cza;->a0:Z

    .line 12
    .line 13
    if-eqz v3, :cond_0

    .line 14
    .line 15
    iput v1, p0, Ll/cza;->b0:I

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/cza;->S3()V

    .line 18
    .line 19
    .line 20
    iput-boolean v1, p0, Ll/cza;->a0:Z

    .line 21
    .line 22
    :cond_0
    iget-object v3, p0, Ll/cza;->T:Lcom/p1/mobile/putong/core/data/StartSpotLightData;

    .line 23
    .line 24
    iget-boolean v4, v3, Lcom/p1/mobile/putong/core/data/StartSpotLightData;->active:Z

    .line 25
    .line 26
    if-nez v4, :cond_1

    .line 27
    .line 28
    iput v1, p0, Ll/cza;->R:I

    .line 29
    .line 30
    invoke-virtual {p0, v1, v0, v2}, Ll/cza;->N3(ILjava/lang/Float;Ljava/lang/Integer;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    iget v3, v3, Lcom/p1/mobile/putong/core/data/StartSpotLightData;->remain:I

    .line 35
    .line 36
    iget v4, p0, Ll/cza;->b0:I

    .line 37
    .line 38
    sub-int v4, v3, v4

    .line 39
    .line 40
    if-gtz v4, :cond_2

    .line 41
    .line 42
    iput v1, p0, Ll/cza;->R:I

    .line 43
    .line 44
    invoke-virtual {p0, v1, v0, v2}, Ll/cza;->N3(ILjava/lang/Float;Ljava/lang/Integer;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0}, Ll/cza;->Q3()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Ll/cza;->S3()V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_2
    new-instance v0, Ll/lya;

    .line 55
    .line 56
    invoke-direct {v0, p0}, Ll/lya;-><init>(Ll/cza;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0, v0}, Ll/cza;->U3(Ll/x20;)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Ll/cza;->T:Lcom/p1/mobile/putong/core/data/StartSpotLightData;

    .line 63
    .line 64
    iget-wide v4, v0, Lcom/p1/mobile/putong/core/data/StartSpotLightData;->duration:J

    .line 65
    .line 66
    int-to-long v6, v3

    .line 67
    sub-long v6, v4, v6

    .line 68
    .line 69
    iget v0, p0, Ll/cza;->b0:I

    .line 70
    .line 71
    int-to-long v8, v0

    .line 72
    add-long/2addr v6, v8

    .line 73
    long-to-int v0, v6

    .line 74
    if-gtz v0, :cond_3

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_3
    move v1, v0

    .line 78
    :goto_0
    const/4 v0, 0x1

    .line 79
    iput v0, p0, Ll/cza;->R:I

    .line 80
    .line 81
    int-to-float v1, v1

    .line 82
    const/high16 v2, 0x43b40000    # 360.0f

    .line 83
    .line 84
    mul-float/2addr v1, v2

    .line 85
    long-to-float v2, v4

    .line 86
    div-float/2addr v1, v2

    .line 87
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    iget v2, p0, Ll/cza;->b0:I

    .line 92
    .line 93
    sub-int/2addr v3, v2

    .line 94
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    invoke-virtual {p0, v0, v1, v2}, Ll/cza;->N3(ILjava/lang/Float;Ljava/lang/Integer;)V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method public Q3()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    new-instance v1, Ll/oya;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/oya;-><init>(Ll/cza;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "patch_super_boost_status"

    .line 9
    .line 10
    const/4 v2, -0x1

    .line 11
    invoke-virtual {v0, p0, v2, v1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public R3()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/cza;->S3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final S3()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cza;->Z:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/cza;->Z:Ll/kcg0;

    .line 10
    .line 11
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-object v0, p0, Ll/cza;->Z:Ll/kcg0;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public T3(Ljava/lang/String;Ljava/lang/String;Ll/z20;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ll/z20<",
            "Ljava/lang/Throwable;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/Message;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, v0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 7
    .line 8
    const-string p2, "text"

    .line 9
    .line 10
    invoke-static {p2}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    iput-object p2, v0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 15
    .line 16
    iget-object p2, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 19
    .line 20
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/api/g;->Fo()Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    new-instance v1, Ll/iya;

    .line 25
    .line 26
    invoke-direct {v1, p0, p1, v0}, Ll/iya;-><init>(Ll/cza;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p2, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    new-instance v1, Ll/jya;

    .line 34
    .line 35
    invoke-direct {v1, p0, p1, p3}, Ll/jya;-><init>(Ll/cza;Ljava/lang/String;Ll/z20;)V

    .line 36
    .line 37
    .line 38
    new-instance p0, Ll/kya;

    .line 39
    .line 40
    invoke-direct {p0, p3, v0}, Ll/kya;-><init>(Ll/z20;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 41
    .line 42
    .line 43
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final U3(Ll/x20;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/cza;->Z:Ll/kcg0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-wide/16 v0, 0x1f4

    .line 6
    .line 7
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 8
    .line 9
    const-wide/16 v3, 0x0

    .line 10
    .line 11
    invoke-static {v3, v4, v0, v1, v2}, Lrx/c;->interval(JJLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

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
    new-instance v1, Ll/mya;

    .line 28
    .line 29
    invoke-direct {v1, p0, p1}, Ll/mya;-><init>(Ll/cza;Ll/x20;)V

    .line 30
    .line 31
    .line 32
    new-instance p1, Ll/nya;

    .line 33
    .line 34
    invoke-direct {p1, p0}, Ll/nya;-><init>(Ll/cza;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v1, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {v0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iput-object p1, p0, Ll/cza;->Z:Ll/kcg0;

    .line 46
    .line 47
    :cond_0
    return-void
.end method

.method public v3(Ljava/lang/String;Ljava/lang/String;Ll/z20;)Lrx/c;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ll/z20<",
            "Ljava/lang/Throwable;",
            "Ljava/lang/String;",
            ">;)",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "{\"bizType\": \"spotLight\", \"other\": \""

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, "\", \"me\":\""

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 19
    .line 20
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v1, "\"}"

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v4

    .line 38
    iget-object v0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 39
    .line 40
    new-instance v2, Ll/sya;

    .line 41
    .line 42
    move-object v3, p0

    .line 43
    move-object v5, p1

    .line 44
    move-object v6, p2

    .line 45
    move-object v7, p3

    .line 46
    invoke-direct/range {v2 .. v7}, Ll/sya;-><init>(Ll/cza;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/z20;)V

    .line 47
    .line 48
    .line 49
    const-string p0, "spotForceLike"

    .line 50
    .line 51
    const/4 p1, -0x1

    .line 52
    invoke-virtual {v0, p0, p1, v2}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    return-object p0
.end method

.method public w3(Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;)V
    .locals 13

    .line 1
    iget-object v0, p0, Ll/cza;->W:Ll/byd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Long;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    invoke-static {}, Ll/pzi0;->o()J

    .line 14
    .line 15
    .line 16
    move-result-wide v2

    .line 17
    const-wide/16 v4, 0x0

    .line 18
    .line 19
    cmp-long v4, v0, v4

    .line 20
    .line 21
    const/4 v5, 0x0

    .line 22
    const/4 v6, 0x1

    .line 23
    const/16 v7, 0x8

    .line 24
    .line 25
    if-nez v4, :cond_0

    .line 26
    .line 27
    iget-object p0, p0, Ll/cza;->W:Ll/byd0;

    .line 28
    .line 29
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p0, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    goto :goto_2

    .line 37
    :cond_0
    invoke-static {v2, v3, v0, v1}, Ll/pzi0;->C(JJ)Z

    .line 38
    .line 39
    .line 40
    move-result v4

    .line 41
    xor-int/lit8 v8, v4, 0x1

    .line 42
    .line 43
    sub-long v0, v2, v0

    .line 44
    .line 45
    invoke-static {v0, v1}, Ljava/lang/Math;->abs(J)J

    .line 46
    .line 47
    .line 48
    move-result-wide v9

    .line 49
    const-wide/16 v11, 0x2710

    .line 50
    .line 51
    cmp-long v9, v9, v11

    .line 52
    .line 53
    if-gez v9, :cond_1

    .line 54
    .line 55
    move v9, v6

    .line 56
    goto :goto_0

    .line 57
    :cond_1
    move v9, v5

    .line 58
    :goto_0
    if-nez v4, :cond_2

    .line 59
    .line 60
    iget-object p0, p0, Ll/cza;->W:Ll/byd0;

    .line 61
    .line 62
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-virtual {p0, v2}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    :cond_2
    if-eqz v9, :cond_3

    .line 70
    .line 71
    invoke-virtual {p1}, Lcom/immomo/svgaplayer/SVGAImageView;->isAnimating()Z

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
    if-eqz v9, :cond_4

    .line 79
    .line 80
    invoke-virtual {p1}, Lcom/immomo/svgaplayer/SVGAImageView;->isAnimating()Z

    .line 81
    .line 82
    .line 83
    move-result p0

    .line 84
    if-nez p0, :cond_4

    .line 85
    .line 86
    invoke-static {v0, v1}, Ljava/lang/Math;->abs(J)J

    .line 87
    .line 88
    .line 89
    move-result-wide v0

    .line 90
    const-wide/16 v2, 0x3e8

    .line 91
    .line 92
    div-long/2addr v0, v2

    .line 93
    long-to-int p0, v0

    .line 94
    rsub-int/lit8 v7, p0, 0xa

    .line 95
    .line 96
    if-ge v7, v6, :cond_5

    .line 97
    .line 98
    :goto_1
    return-void

    .line 99
    :cond_4
    move v6, v8

    .line 100
    :cond_5
    :goto_2
    invoke-virtual {p1, v5}, Landroid/view/View;->setVisibility(I)V

    .line 101
    .line 102
    .line 103
    new-instance p0, Lcom/tantanapp/media/ttmediaeffect/anim/AnimListener;

    .line 104
    .line 105
    invoke-direct {p0}, Lcom/tantanapp/media/ttmediaeffect/anim/AnimListener;-><init>()V

    .line 106
    .line 107
    .line 108
    const-string v0, "core_intl_conversation_header_spotlight.svga"

    .line 109
    .line 110
    invoke-virtual {p1, v0, v7, p0, v6}, Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;->loadAnimWithListener(Ljava/lang/String;ILcom/tantanapp/media/ttmediaeffect/anim/AnimListener;Z)V

    .line 111
    .line 112
    .line 113
    return-void
.end method

.method public x3()Lrx/subjects/a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/a<",
            "Lcom/google/common/base/Optional<",
            "Ll/uxj0;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/cza;->X:Lrx/subjects/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public y3()Lrx/subjects/a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/a<",
            "Landroid/util/Pair<",
            "Ljava/lang/Integer;",
            "Landroid/util/Pair<",
            "Ljava/lang/Float;",
            "Ljava/lang/Integer;",
            ">;>;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/cza;->Y:Lrx/subjects/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public z3()V
    .locals 1

    .line 1
    new-instance v0, Ll/hya;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/hya;-><init>(Ll/cza;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
