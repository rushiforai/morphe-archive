.class public Ll/xf9;
.super Ll/dy6;
.source "SourceFile"


# instance fields
.field public R:Ljava/lang/String;

.field public S:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/core/data/LikedUser;",
            ">;>;"
        }
    .end annotation
.end field

.field public T:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public U:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/core/data/LikedUser;",
            ">;"
        }
    .end annotation
.end field

.field public V:Ll/exd0;

.field public W:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/core/data/LikedUser;",
            ">;>;"
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
    const-string p1, ""

    .line 5
    .line 6
    iput-object p1, p0, Ll/xf9;->R:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Ll/xf9;->S:Lrx/subjects/a;

    .line 13
    .line 14
    new-instance p1, Ljava/util/HashSet;

    .line 15
    .line 16
    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Ll/xf9;->T:Ljava/util/HashSet;

    .line 20
    .line 21
    new-instance p1, Ljava/util/HashMap;

    .line 22
    .line 23
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object p1, p0, Ll/xf9;->U:Ljava/util/HashMap;

    .line 27
    .line 28
    new-instance p1, Ll/exd0;

    .line 29
    .line 30
    new-instance v0, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    const-string v1, "liked_user_filter_settings_"

    .line 33
    .line 34
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    const/4 v1, 0x1

    .line 53
    const-string v2, "putongPref"

    .line 54
    .line 55
    invoke-direct {p1, v0, v1, v2}, Ll/exd0;-><init>(Ljava/lang/String;ZLjava/lang/String;)V

    .line 56
    .line 57
    .line 58
    iput-object p1, p0, Ll/xf9;->V:Ll/exd0;

    .line 59
    .line 60
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    iput-object p1, p0, Ll/xf9;->W:Lrx/subjects/a;

    .line 65
    .line 66
    return-void
.end method

.method public static synthetic a3(Lcom/p1/mobile/putong/core/data/LikedUser;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LikedUser;->id:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b3(ILcom/p1/mobile/putong/data/Envelope;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/data/CommonData;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lcom/p1/mobile/putong/data/CommonData;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    .line 10
    .line 11
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    const/4 v0, 0x1

    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    if-gt p0, v0, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 v0, 0x0

    .line 22
    :cond_1
    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public static synthetic c3(Ll/xf9;Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xf9;->K3(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic d3(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/LikedUser;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/LikedUser;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic e3(Ll/xf9;Lcom/p1/mobile/putong/core/data/LikedUser;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xf9;->L3(Lcom/p1/mobile/putong/core/data/LikedUser;)V

    return-void
.end method

.method public static synthetic f3(Ll/xf9;ZILcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/xf9;->N3(ZILcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic g3(Ljava/lang/String;)Ll/x1d0;
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
    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/a;->z0(Ljava/lang/String;)Ljava/lang/String;

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
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public static synthetic h3(Ll/xf9;Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xf9;->Q3(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic i3(Ll/xf9;Ljava/lang/String;ZI)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/xf9;->O3(Ljava/lang/String;ZI)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic j3(Ll/xf9;ILjava/util/List;Ljava/util/List;Lcom/p1/mobile/putong/core/data/LikedUser;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/xf9;->M3(ILjava/util/List;Ljava/util/List;Lcom/p1/mobile/putong/core/data/LikedUser;)V

    return-void
.end method

.method public static synthetic k3(Lcom/p1/mobile/putong/core/data/LikedUser;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LikedUser;->id:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic l3(Ljava/lang/String;)Ll/x1d0;
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
    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/a;->z0(Ljava/lang/String;)Ljava/lang/String;

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
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public static synthetic m3(Ll/xf9;Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;Ll/uxj0;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/xf9;->P3(Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;Ll/uxj0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic n3(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/LikedUser;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/LikedUser;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic o3(Ll/xf9;Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xf9;->U3(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic p3(Ljava/util/List;ILjava/util/List;Lcom/p1/mobile/putong/core/data/LikedUser;)V
    .locals 2

    .line 1
    new-instance v0, Ll/if9;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/if9;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object v1, p3, Lcom/p1/mobile/putong/core/data/LikedUser;->id:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    if-le p1, v0, :cond_0

    .line 20
    .line 21
    invoke-interface {p0, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-interface {p2, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method

.method public static synthetic q3(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/LikedUser;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/LikedUser;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic r3(Ll/xf9;Ljava/lang/StringBuilder;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xf9;->V3(Ljava/lang/StringBuilder;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic s3(Ll/xf9;ILcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/xf9;->S3(ILcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic t3(Ll/xf9;Ljava/lang/String;I)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/xf9;->T3(Ljava/lang/String;I)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic u3(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/LikedUser;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/LikedUser;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic v3(Ll/xf9;Lcom/p1/mobile/putong/core/data/LikedUser;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xf9;->R3(Lcom/p1/mobile/putong/core/data/LikedUser;)V

    return-void
.end method

.method public static synthetic w3(Ljava/lang/StringBuilder;)Ll/x1d0;
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
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

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
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method


# virtual methods
.method public A3()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/xf9;->W:Lrx/subjects/a;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public B3()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xf9;->R:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public C3(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/LikedUser;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xf9;->U:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/data/LikedUser;

    .line 8
    .line 9
    return-object p0
.end method

.method public D3()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/core/data/LikedUser;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/xf9;->W:Lrx/subjects/a;

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

.method public E3()Ll/vg60;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/core/data/LikedUser;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/xf9;->W:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/vg60;

    .line 8
    .line 9
    return-object p0
.end method

.method public F3(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/LikedUser;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/xf9;->S:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/vg60;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 16
    .line 17
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 24
    .line 25
    new-instance v0, Ll/jf9;

    .line 26
    .line 27
    invoke-direct {v0, p1}, Ll/jf9;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    check-cast p0, Lcom/p1/mobile/putong/core/data/LikedUser;

    .line 35
    .line 36
    return-object p0

    .line 37
    :cond_0
    const/4 p0, 0x0

    .line 38
    return-object p0
.end method

.method public G3(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/LikedUser;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/xf9;->W:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/vg60;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 16
    .line 17
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 24
    .line 25
    new-instance v0, Ll/kf9;

    .line 26
    .line 27
    invoke-direct {v0, p1}, Ll/kf9;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    check-cast p0, Lcom/p1/mobile/putong/core/data/LikedUser;

    .line 35
    .line 36
    return-object p0

    .line 37
    :cond_0
    const/4 p0, 0x0

    .line 38
    return-object p0
.end method

.method public H3()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xf9;->S:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/xf9;->S:Lrx/subjects/a;

    .line 14
    .line 15
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Ll/vg60;

    .line 20
    .line 21
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 22
    .line 23
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-nez p0, :cond_0

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    return p0

    .line 31
    :cond_0
    const/4 p0, 0x0

    .line 32
    return p0
.end method

.method public final I3(IIZ)Ljava/lang/String;
    .locals 6

    .line 1
    const/4 v4, 0x0

    .line 2
    const/4 v5, 0x0

    .line 3
    move-object v0, p0

    .line 4
    move v1, p1

    .line 5
    move v2, p2

    .line 6
    move v3, p3

    .line 7
    invoke-virtual/range {v0 .. v5}, Ll/xf9;->J3(IIZLcom/p1/mobile/putong/core/data/LikedUserFilterSettings;Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final J3(IIZLcom/p1/mobile/putong/core/data/LikedUserFilterSettings;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    const-string v0, "search=count"

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const-string v0, "search=list&with=users"

    .line 9
    .line 10
    :goto_0
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    if-nez p3, :cond_1

    .line 14
    .line 15
    const-string p3, "&cursorIdx="

    .line 16
    .line 17
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    if-lez p1, :cond_1

    .line 24
    .line 25
    const-string p2, "&limit="

    .line 26
    .line 27
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    :cond_1
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-eqz p1, :cond_2

    .line 38
    .line 39
    const-string p1, "&filter="

    .line 40
    .line 41
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    iget-object p1, p4, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;->filter:Lcom/p1/mobile/putong/core/data/LikedUserFilter;

    .line 45
    .line 46
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    const-string p1, "&distance="

    .line 50
    .line 51
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    iget p1, p4, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;->distance:I

    .line 55
    .line 56
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    const-string p1, "&age="

    .line 60
    .line 61
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    iget p1, p4, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;->minAge:I

    .line 65
    .line 66
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    const-string p1, ","

    .line 70
    .line 71
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    iget p1, p4, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;->maxAge:I

    .line 75
    .line 76
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    const-string p1, "&sortBy="

    .line 80
    .line 81
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    iget-object p1, p4, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;->sort:Lcom/p1/mobile/putong/core/data/LikeFilterSortType;

    .line 85
    .line 86
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    :cond_2
    invoke-static {p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    if-nez p1, :cond_3

    .line 94
    .line 95
    invoke-virtual {p0, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    :cond_3
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    return-object p0
.end method

.method public final synthetic K3(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;
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

.method public final synthetic L3(Lcom/p1/mobile/putong/core/data/LikedUser;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/xf9;->U:Ljava/util/HashMap;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/LikedUser;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic M3(ILjava/util/List;Ljava/util/List;Lcom/p1/mobile/putong/core/data/LikedUser;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xf9;->T:Ljava/util/HashSet;

    .line 2
    .line 3
    iget-object v1, p4, Lcom/p1/mobile/putong/core/data/LikedUser;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object p0, p0, Ll/xf9;->T:Ljava/util/HashSet;

    .line 12
    .line 13
    iget-object v0, p4, Lcom/p1/mobile/putong/core/data/LikedUser;->id:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    if-le p1, p0, :cond_0

    .line 20
    .line 21
    invoke-interface {p2, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-interface {p3, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method

.method public final synthetic N3(ZILcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/DbLinks;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/DbLinks;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p3, Lcom/p1/mobile/putong/data/Envelope;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 7
    .line 8
    iget-object v2, v1, Lcom/p1/mobile/putong/data/Pagination;->links:Lcom/p1/mobile/putong/data/Links;

    .line 9
    .line 10
    iput-object v2, v0, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    if-eqz p1, :cond_1

    .line 14
    .line 15
    iget p1, v1, Lcom/p1/mobile/putong/data/Pagination;->total:I

    .line 16
    .line 17
    iput p1, v0, Lcom/p1/mobile/putong/data/DbLinks;->total:I

    .line 18
    .line 19
    iget-object p1, p0, Ll/xf9;->S:Lrx/subjects/a;

    .line 20
    .line 21
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_0

    .line 30
    .line 31
    iget-object p1, p0, Ll/xf9;->S:Lrx/subjects/a;

    .line 32
    .line 33
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    check-cast p1, Ll/vg60;

    .line 38
    .line 39
    iget-object p1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    new-instance p1, Ljava/util/ArrayList;

    .line 43
    .line 44
    invoke-direct {p1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 45
    .line 46
    .line 47
    :goto_0
    new-instance p2, Ll/vg60;

    .line 48
    .line 49
    invoke-direct {p2, p1, v0}, Ll/vg60;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)V

    .line 50
    .line 51
    .line 52
    goto/16 :goto_1

    .line 53
    .line 54
    :cond_1
    const-class p1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 55
    .line 56
    invoke-virtual {p3, p1}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    check-cast v1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 61
    .line 62
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->likedUsers:Ljava/util/List;

    .line 63
    .line 64
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    if-eqz v1, :cond_2

    .line 69
    .line 70
    invoke-virtual {p3, p1}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    check-cast v1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 75
    .line 76
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->likedUsers:Ljava/util/List;

    .line 77
    .line 78
    new-instance v3, Ll/bf9;

    .line 79
    .line 80
    invoke-direct {v3, p0}, Ll/bf9;-><init>(Ll/xf9;)V

    .line 81
    .line 82
    .line 83
    invoke-static {v1, v3}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 84
    .line 85
    .line 86
    :cond_2
    iget-object v1, p0, Ll/xf9;->S:Lrx/subjects/a;

    .line 87
    .line 88
    invoke-virtual {v1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    if-eqz v1, :cond_4

    .line 97
    .line 98
    iget-object v1, p0, Ll/xf9;->T:Ljava/util/HashSet;

    .line 99
    .line 100
    invoke-virtual {v1}, Ljava/util/HashSet;->isEmpty()Z

    .line 101
    .line 102
    .line 103
    move-result v1

    .line 104
    if-nez v1, :cond_4

    .line 105
    .line 106
    invoke-virtual {p3, p1}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    check-cast v1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 111
    .line 112
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->likedUsers:Ljava/util/List;

    .line 113
    .line 114
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 115
    .line 116
    .line 117
    move-result v1

    .line 118
    if-nez v1, :cond_4

    .line 119
    .line 120
    iget-object v1, p0, Ll/xf9;->S:Lrx/subjects/a;

    .line 121
    .line 122
    invoke-virtual {v1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    check-cast v1, Ll/vg60;

    .line 127
    .line 128
    iget-object v1, v1, Ll/vg60;->a:Ljava/util/List;

    .line 129
    .line 130
    iget-object v3, p3, Lcom/p1/mobile/putong/data/Envelope;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 131
    .line 132
    iget v3, v3, Lcom/p1/mobile/putong/data/Pagination;->total:I

    .line 133
    .line 134
    iput v3, v0, Lcom/p1/mobile/putong/data/DbLinks;->total:I

    .line 135
    .line 136
    new-instance v3, Ljava/util/ArrayList;

    .line 137
    .line 138
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 139
    .line 140
    .line 141
    invoke-virtual {p3, p1}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 146
    .line 147
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->likedUsers:Ljava/util/List;

    .line 148
    .line 149
    new-instance p3, Ll/cf9;

    .line 150
    .line 151
    invoke-direct {p3, p0, p2, v1, v3}, Ll/cf9;-><init>(Ll/xf9;ILjava/util/List;Ljava/util/List;)V

    .line 152
    .line 153
    .line 154
    invoke-static {p1, p3}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 155
    .line 156
    .line 157
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 158
    .line 159
    .line 160
    move-result p1

    .line 161
    if-lez p1, :cond_3

    .line 162
    .line 163
    invoke-interface {v1, v2, v3}, Ljava/util/List;->addAll(ILjava/util/Collection;)Z

    .line 164
    .line 165
    .line 166
    :cond_3
    new-instance p2, Ll/vg60;

    .line 167
    .line 168
    invoke-direct {p2, v1, v0}, Ll/vg60;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)V

    .line 169
    .line 170
    .line 171
    goto :goto_1

    .line 172
    :cond_4
    iget-object p2, p0, Ll/xf9;->S:Lrx/subjects/a;

    .line 173
    .line 174
    invoke-virtual {p2}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 175
    .line 176
    .line 177
    move-result-object p2

    .line 178
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 179
    .line 180
    .line 181
    move-result p2

    .line 182
    if-eqz p2, :cond_5

    .line 183
    .line 184
    iget-object p2, p0, Ll/xf9;->T:Ljava/util/HashSet;

    .line 185
    .line 186
    invoke-virtual {p2}, Ljava/util/HashSet;->isEmpty()Z

    .line 187
    .line 188
    .line 189
    move-result p2

    .line 190
    if-nez p2, :cond_5

    .line 191
    .line 192
    const-class p2, Lcom/p1/mobile/putong/data/CommonData;

    .line 193
    .line 194
    invoke-virtual {p3, p2}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 195
    .line 196
    .line 197
    move-result-object p2

    .line 198
    check-cast p2, Lcom/p1/mobile/putong/data/CommonData;

    .line 199
    .line 200
    iget-object p2, p2, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    .line 201
    .line 202
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 203
    .line 204
    .line 205
    move-result p2

    .line 206
    if-eqz p2, :cond_5

    .line 207
    .line 208
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 209
    .line 210
    return-object p0

    .line 211
    :cond_5
    iget-object p2, p0, Ll/xf9;->S:Lrx/subjects/a;

    .line 212
    .line 213
    invoke-virtual {p2}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 214
    .line 215
    .line 216
    move-result-object p2

    .line 217
    if-nez p2, :cond_6

    .line 218
    .line 219
    iget-object p2, p0, Ll/xf9;->T:Ljava/util/HashSet;

    .line 220
    .line 221
    invoke-virtual {p2}, Ljava/util/HashSet;->isEmpty()Z

    .line 222
    .line 223
    .line 224
    move-result p2

    .line 225
    if-eqz p2, :cond_6

    .line 226
    .line 227
    invoke-virtual {p3, p1}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 228
    .line 229
    .line 230
    move-result-object p2

    .line 231
    check-cast p2, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 232
    .line 233
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/CoreData;->likedUsers:Ljava/util/List;

    .line 234
    .line 235
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 236
    .line 237
    .line 238
    move-result p2

    .line 239
    if-eqz p2, :cond_6

    .line 240
    .line 241
    invoke-static {}, Ll/vg60;->b()Ll/vg60;

    .line 242
    .line 243
    .line 244
    move-result-object p2

    .line 245
    goto :goto_1

    .line 246
    :cond_6
    iget-object p2, p3, Lcom/p1/mobile/putong/data/Envelope;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 247
    .line 248
    iget p2, p2, Lcom/p1/mobile/putong/data/Pagination;->total:I

    .line 249
    .line 250
    iput p2, v0, Lcom/p1/mobile/putong/data/DbLinks;->total:I

    .line 251
    .line 252
    iget-object p2, p0, Ll/xf9;->T:Ljava/util/HashSet;

    .line 253
    .line 254
    invoke-virtual {p3, p1}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 255
    .line 256
    .line 257
    move-result-object v1

    .line 258
    check-cast v1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 259
    .line 260
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->likedUsers:Ljava/util/List;

    .line 261
    .line 262
    new-instance v2, Ll/df9;

    .line 263
    .line 264
    invoke-direct {v2}, Ll/df9;-><init>()V

    .line 265
    .line 266
    .line 267
    invoke-static {v1, v2}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 268
    .line 269
    .line 270
    move-result-object v1

    .line 271
    invoke-virtual {p2, v1}, Ljava/util/AbstractCollection;->addAll(Ljava/util/Collection;)Z

    .line 272
    .line 273
    .line 274
    new-instance p2, Ll/vg60;

    .line 275
    .line 276
    invoke-virtual {p3, p1}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 277
    .line 278
    .line 279
    move-result-object p1

    .line 280
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 281
    .line 282
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->likedUsers:Ljava/util/List;

    .line 283
    .line 284
    invoke-direct {p2, p1, v0}, Ll/vg60;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)V

    .line 285
    .line 286
    .line 287
    :goto_1
    iget-object p0, p0, Ll/xf9;->S:Lrx/subjects/a;

    .line 288
    .line 289
    invoke-virtual {p0, p2}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 290
    .line 291
    .line 292
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 293
    .line 294
    return-object p0
.end method

.method public final synthetic O3(Ljava/lang/String;ZI)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/uf9;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/uf9;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/qi20;->e(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    new-instance v0, Ll/vf9;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/vf9;-><init>(Ll/xf9;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {p1, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    new-instance v0, Ll/wf9;

    .line 28
    .line 29
    invoke-direct {v0, p0, p2, p3}, Ll/wf9;-><init>(Ll/xf9;ZI)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method

.method public final synthetic P3(Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;Ll/uxj0;)Lrx/c;
    .locals 6

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Wk()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    const/4 v3, 0x0

    .line 14
    const/4 v5, 0x0

    .line 15
    const/4 v1, 0x1

    .line 16
    move-object v0, p0

    .line 17
    move-object v4, p1

    .line 18
    invoke-virtual/range {v0 .. v5}, Ll/xf9;->Z3(IIZLcom/p1/mobile/putong/core/data/LikedUserFilterSettings;Ljava/lang/String;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public final synthetic Q3(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;
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

.method public final synthetic R3(Lcom/p1/mobile/putong/core/data/LikedUser;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/xf9;->U:Ljava/util/HashMap;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/LikedUser;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic S3(ILcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 4

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 2
    .line 3
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreData;->likedUsers:Ljava/util/List;

    .line 10
    .line 11
    new-instance v1, Lcom/p1/mobile/putong/data/DbLinks;

    .line 12
    .line 13
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/DbLinks;-><init>()V

    .line 14
    .line 15
    .line 16
    iget-object v2, p2, Lcom/p1/mobile/putong/data/Envelope;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 17
    .line 18
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Pagination;->links:Lcom/p1/mobile/putong/data/Links;

    .line 19
    .line 20
    iput-object v2, v1, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 21
    .line 22
    invoke-static {}, Ll/vg60;->b()Ll/vg60;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    if-nez v3, :cond_2

    .line 31
    .line 32
    new-instance v2, Ll/gf9;

    .line 33
    .line 34
    invoke-direct {v2, p0}, Ll/gf9;-><init>(Ll/xf9;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v0, v2}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 38
    .line 39
    .line 40
    iget-object v2, p0, Ll/xf9;->W:Lrx/subjects/a;

    .line 41
    .line 42
    invoke-virtual {v2}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    if-eqz v2, :cond_0

    .line 51
    .line 52
    iget-object v2, p0, Ll/xf9;->W:Lrx/subjects/a;

    .line 53
    .line 54
    invoke-virtual {v2}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    check-cast v2, Ll/vg60;

    .line 59
    .line 60
    iget-object v2, v2, Ll/vg60;->a:Ljava/util/List;

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_0
    new-instance v2, Ljava/util/ArrayList;

    .line 64
    .line 65
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 66
    .line 67
    .line 68
    :goto_0
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Envelope;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 69
    .line 70
    iget p2, p2, Lcom/p1/mobile/putong/data/Pagination;->total:I

    .line 71
    .line 72
    iput p2, v1, Lcom/p1/mobile/putong/data/DbLinks;->total:I

    .line 73
    .line 74
    new-instance p2, Ljava/util/ArrayList;

    .line 75
    .line 76
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 77
    .line 78
    .line 79
    new-instance v3, Ll/hf9;

    .line 80
    .line 81
    invoke-direct {v3, v2, p1, p2}, Ll/hf9;-><init>(Ljava/util/List;ILjava/util/List;)V

    .line 82
    .line 83
    .line 84
    invoke-static {v0, v3}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 85
    .line 86
    .line 87
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 88
    .line 89
    .line 90
    move-result p1

    .line 91
    if-lez p1, :cond_1

    .line 92
    .line 93
    const/4 p1, 0x0

    .line 94
    invoke-interface {v2, p1, p2}, Ljava/util/List;->addAll(ILjava/util/Collection;)Z

    .line 95
    .line 96
    .line 97
    :cond_1
    new-instance p1, Ll/vg60;

    .line 98
    .line 99
    invoke-direct {p1, v2, v1}, Ll/vg60;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)V

    .line 100
    .line 101
    .line 102
    move-object v2, p1

    .line 103
    :cond_2
    iget-object p0, p0, Ll/xf9;->W:Lrx/subjects/a;

    .line 104
    .line 105
    invoke-virtual {p0, v2}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 106
    .line 107
    .line 108
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 109
    .line 110
    return-object p0
.end method

.method public final synthetic T3(Ljava/lang/String;I)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/qf9;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/qf9;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/qi20;->e(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    new-instance v0, Ll/rf9;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/rf9;-><init>(Ll/xf9;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {p1, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    new-instance v0, Ll/sf9;

    .line 28
    .line 29
    invoke-direct {v0, p2}, Ll/sf9;-><init>(I)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    new-instance v0, Ll/tf9;

    .line 37
    .line 38
    invoke-direct {v0, p0, p2}, Ll/tf9;-><init>(Ll/xf9;I)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0
.end method

.method public final synthetic U3(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;
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

.method public final synthetic V3(Ljava/lang/StringBuilder;)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/nf9;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/nf9;-><init>(Ljava/lang/StringBuilder;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/qi20;->e(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    new-instance v0, Ll/of9;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/of9;-><init>(Ll/xf9;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public W3()I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xf9;->S:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    iget-object p0, p0, Ll/xf9;->S:Lrx/subjects/a;

    .line 12
    .line 13
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Ll/vg60;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/vg60;->d()I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0
.end method

.method public X3()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/core/data/LikedUser;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/xf9;->S:Lrx/subjects/a;

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

.method public Y3(IIZ)Lrx/c;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IIZ)",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v4, 0x0

    .line 2
    const/4 v5, 0x0

    .line 3
    move-object v0, p0

    .line 4
    move v1, p1

    .line 5
    move v2, p2

    .line 6
    move v3, p3

    .line 7
    invoke-virtual/range {v0 .. v5}, Ll/xf9;->Z3(IIZLcom/p1/mobile/putong/core/data/LikedUserFilterSettings;Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public Z3(IIZLcom/p1/mobile/putong/core/data/LikedUserFilterSettings;Ljava/lang/String;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IIZ",
            "Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    move v0, p2

    .line 2
    move p2, p1

    .line 3
    move p1, v0

    .line 4
    invoke-virtual/range {p0 .. p5}, Ll/xf9;->J3(IIZLcom/p1/mobile/putong/core/data/LikedUserFilterSettings;Ljava/lang/String;)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iget-object p4, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    new-instance p5, Ll/af9;

    .line 11
    .line 12
    invoke-direct {p5, p0, p1, p3, p2}, Ll/af9;-><init>(Ll/xf9;Ljava/lang/String;ZI)V

    .line 13
    .line 14
    .line 15
    const-string p0, "likedUser"

    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    invoke-virtual {p4, p0, p1, p5}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public a4()Lrx/c;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/xf9;->V:Ll/exd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    move-object v5, v0

    .line 8
    check-cast v5, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;

    .line 9
    .line 10
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Wk()I

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    const/4 v4, 0x1

    .line 23
    const/4 v6, 0x0

    .line 24
    const/4 v2, 0x1

    .line 25
    move-object v1, p0

    .line 26
    invoke-virtual/range {v1 .. v6}, Ll/xf9;->Z3(IIZLcom/p1/mobile/putong/core/data/LikedUserFilterSettings;Ljava/lang/String;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    new-instance v0, Ll/pf9;

    .line 31
    .line 32
    invoke-direct {v0, v1, v5}, Ll/pf9;-><init>(Ll/xf9;Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, v0}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method

.method public b4(II)Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p2, p1, v0}, Ll/xf9;->I3(IIZ)Ljava/lang/String;

    .line 3
    .line 4
    .line 5
    move-result-object p2

    .line 6
    iget-object v1, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 7
    .line 8
    new-instance v2, Ll/lf9;

    .line 9
    .line 10
    invoke-direct {v2, p0, p2, p1}, Ll/lf9;-><init>(Ll/xf9;Ljava/lang/String;I)V

    .line 11
    .line 12
    .line 13
    const-string p0, "likedUserForMyTab"

    .line 14
    .line 15
    invoke-virtual {v1, p0, v0, v2}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public c4(Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "/live-activities?source=live-activities-liked&with=users"

    .line 4
    .line 5
    invoke-static {v1}, Lcom/p1/mobile/putong/core/api/a;->G(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    const-string p1, "&until=0&limit=30"

    .line 19
    .line 20
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const-string v1, "&"

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    :goto_0
    iget-object p1, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 33
    .line 34
    new-instance v1, Ll/mf9;

    .line 35
    .line 36
    invoke-direct {v1, p0, v0}, Ll/mf9;-><init>(Ll/xf9;Ljava/lang/StringBuilder;)V

    .line 37
    .line 38
    .line 39
    const-string p0, "loadLiveActivitiesLiked"

    .line 40
    .line 41
    const/4 v0, 0x0

    .line 42
    invoke-virtual {p1, p0, v0, v1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0
.end method

.method public d4(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xf9;->S:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/xf9;->S:Lrx/subjects/a;

    .line 14
    .line 15
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Ll/vg60;

    .line 20
    .line 21
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 22
    .line 23
    new-instance v1, Ll/ef9;

    .line 24
    .line 25
    invoke-direct {v1, p1}, Ll/ef9;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v0, v1}, Ll/jyb;->e0(Ljava/util/List;Ll/qcj;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    iget-object v0, p0, Ll/xf9;->S:Lrx/subjects/a;

    .line 35
    .line 36
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Ll/vg60;

    .line 41
    .line 42
    iget-object v0, v0, Ll/vg60;->b:Lcom/p1/mobile/putong/data/DbLinks;

    .line 43
    .line 44
    iget v1, v0, Lcom/p1/mobile/putong/data/DbLinks;->total:I

    .line 45
    .line 46
    add-int/lit8 v1, v1, -0x1

    .line 47
    .line 48
    iput v1, v0, Lcom/p1/mobile/putong/data/DbLinks;->total:I

    .line 49
    .line 50
    :cond_0
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 51
    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->u1:Ll/ft9;

    .line 53
    .line 54
    invoke-virtual {p0, p1}, Ll/ft9;->b3(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public e4(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xf9;->W:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/xf9;->W:Lrx/subjects/a;

    .line 14
    .line 15
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Ll/vg60;

    .line 20
    .line 21
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 22
    .line 23
    new-instance v1, Ll/ff9;

    .line 24
    .line 25
    invoke-direct {v1, p1}, Ll/ff9;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v0, v1}, Ll/jyb;->e0(Ljava/util/List;Ll/qcj;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    iget-object v0, p0, Ll/xf9;->W:Lrx/subjects/a;

    .line 35
    .line 36
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Ll/vg60;

    .line 41
    .line 42
    iget-object v0, v0, Ll/vg60;->b:Lcom/p1/mobile/putong/data/DbLinks;

    .line 43
    .line 44
    iget v1, v0, Lcom/p1/mobile/putong/data/DbLinks;->total:I

    .line 45
    .line 46
    add-int/lit8 v1, v1, -0x1

    .line 47
    .line 48
    iput v1, v0, Lcom/p1/mobile/putong/data/DbLinks;->total:I

    .line 49
    .line 50
    :cond_0
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 51
    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->u1:Ll/ft9;

    .line 53
    .line 54
    invoke-virtual {p0, p1}, Ll/ft9;->b3(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public f4(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xf9;->R:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public x3()V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    const-string v0, "likedUserForMyTab"

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {p0, v0, v1}, Lcom/tantanapp/common/network/RunnerProxy;->clearRequests(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public y3()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xf9;->T:Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/HashSet;->clear()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public z3()V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    const-string v0, "likedUser"

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {p0, v0, v1}, Lcom/tantanapp/common/network/RunnerProxy;->clearRequests(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
