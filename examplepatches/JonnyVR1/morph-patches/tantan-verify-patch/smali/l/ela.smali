.class public Ll/ela;
.super Ll/dy6;
.source "SourceFile"


# instance fields
.field public final R:Ll/byd0;

.field public final S:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/core/data/PicksUser;",
            ">;>;"
        }
    .end annotation
.end field

.field public final T:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public final U:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public V:Z

.field public W:Ljava/lang/String;

.field public X:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/core/data/Picks;",
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
    const-string v1, "last_privilege_banner_picks_item_clicked_time_"

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
    iput-object p1, p0, Ll/ela;->R:Ll/byd0;

    .line 38
    .line 39
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iput-object p1, p0, Ll/ela;->S:Lrx/subjects/a;

    .line 44
    .line 45
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    iput-object p1, p0, Ll/ela;->T:Lrx/subjects/b;

    .line 50
    .line 51
    new-instance p1, Ljava/util/HashSet;

    .line 52
    .line 53
    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    .line 54
    .line 55
    .line 56
    iput-object p1, p0, Ll/ela;->U:Ljava/util/HashSet;

    .line 57
    .line 58
    const/4 p1, 0x0

    .line 59
    iput-boolean p1, p0, Ll/ela;->V:Z

    .line 60
    .line 61
    const/4 p1, 0x0

    .line 62
    iput-object p1, p0, Ll/ela;->W:Ljava/lang/String;

    .line 63
    .line 64
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    iput-object p1, p0, Ll/ela;->X:Lrx/subjects/a;

    .line 69
    .line 70
    return-void
.end method

.method public static B3()I
    .locals 3

    const v0, 0x30d40

    return v0

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 4
    .line 5
    const-string v1, "picks"

    .line 6
    .line 7
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ll/joa;->x4(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Lcom/p1/mobile/putong/core/data/UserPrivilege;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {}, Ll/ela;->r3()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-eqz v2, :cond_0

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/UserPrivilege;->content:Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

    .line 26
    .line 27
    iget v0, v0, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->remaining:I

    .line 28
    .line 29
    add-int/2addr v1, v0

    .line 30
    :cond_0
    return v1
.end method

.method public static synthetic a3(Ljava/util/Map$Entry;Lcom/p1/mobile/putong/core/data/PicksUser;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/PicksUser;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/CharSequence;

    .line 8
    .line 9
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static synthetic b3(Ljava/util/Map;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic c3(Ljava/util/List;Ljava/util/Map$Entry;)V
    .locals 2

    .line 1
    new-instance v0, Ll/uka;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/uka;-><init>(Ljava/util/Map$Entry;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/jyb;->d0(Ljava/util/List;Ll/qcj;)I

    .line 7
    .line 8
    .line 9
    new-instance p0, Ljava/lang/Exception;

    .line 10
    .line 11
    new-instance v0, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v1, "picksUser id is not found in users : "

    .line 14
    .line 15
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public static synthetic d3(Ljava/util/Map;Lcom/p1/mobile/putong/core/data/PicksUser;)V
    .locals 1

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/PicksUser;->id:Ljava/lang/String;

    .line 2
    .line 3
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 4
    .line 5
    invoke-interface {p0, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic e3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic f3(Lcom/p1/mobile/putong/core/data/PicksUser;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PicksUser;->id:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic g3(Ll/ela;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ela;->w3(Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic h3(Ll/ela;Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ela;->v3(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic i3(Ll/ela;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ela;->y3(Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic j3(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/PicksUser;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/PicksUser;->id:Ljava/lang/String;

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

.method public static synthetic k3(Ll/ela;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ela;->z3()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic l3(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/PicksUser;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/PicksUser;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

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

.method public static synthetic m3(Ll/ela;Ljava/lang/String;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ela;->x3(Ljava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
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
    invoke-static {}, Lcom/p1/mobile/putong/core/api/a;->t1()Ljava/lang/String;

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

.method public static synthetic o3(Ljava/lang/String;)Ll/x1d0;
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
    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/a;->u1(Ljava/lang/String;)Ljava/lang/String;

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

.method public static r3()I
    .locals 2

    const v0, 0x30d40

    return v0

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 4
    .line 5
    const-string v1, "freePicks"

    .line 6
    .line 7
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ll/joa;->x4(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Lcom/p1/mobile/putong/core/data/UserPrivilege;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/UserPrivilege;->content:Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

    .line 22
    .line 23
    iget v0, v0, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->remaining:I

    .line 24
    .line 25
    return v0

    .line 26
    :cond_0
    const/4 v0, 0x0

    .line 27
    return v0
.end method


# virtual methods
.method public A3()Lrx/c;
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
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    new-instance v2, Ll/vka;

    .line 12
    .line 13
    invoke-direct {v2, p0, v0}, Ll/vka;-><init>(Ll/ela;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string p0, "picksUser"

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    invoke-virtual {v1, p0, v0, v2}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    new-instance v0, Ll/wka;

    .line 24
    .line 25
    invoke-direct {v0}, Ll/wka;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, v0}, Lrx/c;->doOnError(Ll/y20;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method

.method public C3()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ela;->T:Lrx/subjects/b;

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

.method public D3()I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ela;->S:Lrx/subjects/a;

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
    iget-object p0, p0, Ll/ela;->S:Lrx/subjects/a;

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

.method public E3()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/core/data/PicksUser;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ela;->S:Lrx/subjects/a;

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

.method public F3()Ll/vg60;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/core/data/PicksUser;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ela;->S:Lrx/subjects/a;

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

.method public G3()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ela;->S:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/vg60;

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public H3()Lrx/c;
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
    new-instance v1, Ll/pka;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/pka;-><init>(Ll/ela;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "picks_user_info"

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

.method public I3(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ela;->S:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/vg60;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    iget-object v1, v0, Ll/vg60;->a:Ljava/util/List;

    .line 16
    .line 17
    new-instance v2, Ll/zka;

    .line 18
    .line 19
    invoke-direct {v2, p1}, Ll/zka;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-static {v1, v2}, Ll/jyb;->e0(Ljava/util/List;Ll/qcj;)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    iget-object p1, v0, Ll/vg60;->b:Lcom/p1/mobile/putong/data/DbLinks;

    .line 29
    .line 30
    iget v1, p1, Lcom/p1/mobile/putong/data/DbLinks;->total:I

    .line 31
    .line 32
    add-int/lit8 v1, v1, -0x1

    .line 33
    .line 34
    iput v1, p1, Lcom/p1/mobile/putong/data/DbLinks;->total:I

    .line 35
    .line 36
    :cond_0
    iget-object p0, p0, Ll/ela;->S:Lrx/subjects/a;

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    :cond_1
    return-void
.end method

.method public J3(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ela;->W:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public p3(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ela;->W:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public q3()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ela;->U:Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/HashSet;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/ela;->S:Lrx/subjects/a;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public s3()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/core/data/Picks;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ela;->X:Lrx/subjects/a;

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

.method public t3(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ela;->S:Lrx/subjects/a;

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
    new-instance v0, Ll/tka;

    .line 26
    .line 27
    invoke-direct {v0, p1}, Ll/tka;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    check-cast p0, Lcom/p1/mobile/putong/core/data/PicksUser;

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    const/4 p0, 0x0

    .line 38
    :goto_0
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-eqz p1, :cond_1

    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PicksUser;->picksTracker:Ljava/lang/String;

    .line 45
    .line 46
    return-object p0

    .line 47
    :cond_1
    const-string p0, ""

    .line 48
    .line 49
    return-object p0
.end method

.method public u3()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ela;->S:Lrx/subjects/a;

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
    iget-object p0, p0, Ll/ela;->S:Lrx/subjects/a;

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

.method public final synthetic v3(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;
    .locals 6

    .line 1
    const-class v0, Lcom/p1/mobile/putong/data/CommonData;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Lcom/p1/mobile/putong/data/CommonData;

    .line 8
    .line 9
    iget-object v1, v1, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    .line 10
    .line 11
    const-class v2, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 12
    .line 13
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 18
    .line 19
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/CoreData;->picksUsers:Ljava/util/List;

    .line 20
    .line 21
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    if-nez v3, :cond_0

    .line 26
    .line 27
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    if-nez v3, :cond_0

    .line 32
    .line 33
    new-instance v3, Ljava/util/HashMap;

    .line 34
    .line 35
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 40
    .line 41
    .line 42
    move-result v5

    .line 43
    add-int/2addr v4, v5

    .line 44
    invoke-direct {v3, v4}, Ljava/util/HashMap;-><init>(I)V

    .line 45
    .line 46
    .line 47
    new-instance v4, Ll/dla;

    .line 48
    .line 49
    invoke-direct {v4, v3}, Ll/dla;-><init>(Ljava/util/Map;)V

    .line 50
    .line 51
    .line 52
    invoke-static {v2, v4}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 53
    .line 54
    .line 55
    new-instance v4, Ll/qka;

    .line 56
    .line 57
    invoke-direct {v4, v3}, Ll/qka;-><init>(Ljava/util/Map;)V

    .line 58
    .line 59
    .line 60
    invoke-static {v1, v4}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 61
    .line 62
    .line 63
    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    new-instance v3, Ll/rka;

    .line 68
    .line 69
    invoke-direct {v3, v2}, Ll/rka;-><init>(Ljava/util/List;)V

    .line 70
    .line 71
    .line 72
    invoke-static {v1, v3}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 73
    .line 74
    .line 75
    :cond_0
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    check-cast v0, Lcom/p1/mobile/putong/data/CommonData;

    .line 80
    .line 81
    iget-object v0, v0, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    .line 82
    .line 83
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    if-nez v0, :cond_1

    .line 88
    .line 89
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 90
    .line 91
    const/4 v0, 0x0

    .line 92
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/api/c;->w3(Lcom/p1/mobile/putong/data/Envelope;Ll/x20;)V

    .line 93
    .line 94
    .line 95
    :cond_1
    return-object p1
.end method

.method public final synthetic w3(Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 5

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/DbLinks;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/DbLinks;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Envelope;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 7
    .line 8
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Pagination;->links:Lcom/p1/mobile/putong/data/Links;

    .line 9
    .line 10
    iput-object v1, v0, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 11
    .line 12
    const-class v1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 13
    .line 14
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    check-cast v2, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 19
    .line 20
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/CoreData;->picksUsers:Ljava/util/List;

    .line 21
    .line 22
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-eqz v2, :cond_0

    .line 27
    .line 28
    invoke-static {}, Ll/vg60;->b()Ll/vg60;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    goto :goto_0

    .line 33
    :cond_0
    iget-object v2, p0, Ll/ela;->U:Ljava/util/HashSet;

    .line 34
    .line 35
    invoke-virtual {v2}, Ljava/util/HashSet;->clear()V

    .line 36
    .line 37
    .line 38
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Envelope;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 39
    .line 40
    iget v2, v2, Lcom/p1/mobile/putong/data/Pagination;->total:I

    .line 41
    .line 42
    iput v2, v0, Lcom/p1/mobile/putong/data/DbLinks;->total:I

    .line 43
    .line 44
    iget-object v2, p0, Ll/ela;->U:Ljava/util/HashSet;

    .line 45
    .line 46
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    check-cast v3, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 51
    .line 52
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/CoreData;->picksUsers:Ljava/util/List;

    .line 53
    .line 54
    new-instance v4, Ll/ska;

    .line 55
    .line 56
    invoke-direct {v4}, Ll/ska;-><init>()V

    .line 57
    .line 58
    .line 59
    invoke-static {v3, v4}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    invoke-virtual {v2, v3}, Ljava/util/AbstractCollection;->addAll(Ljava/util/Collection;)Z

    .line 64
    .line 65
    .line 66
    new-instance v2, Ll/vg60;

    .line 67
    .line 68
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 73
    .line 74
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->picksUsers:Ljava/util/List;

    .line 75
    .line 76
    invoke-direct {v2, p1, v0}, Ll/vg60;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)V

    .line 77
    .line 78
    .line 79
    move-object p1, v2

    .line 80
    :goto_0
    iget-object p0, p0, Ll/ela;->S:Lrx/subjects/a;

    .line 81
    .line 82
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 83
    .line 84
    .line 85
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 86
    .line 87
    return-object p0
.end method

.method public final synthetic x3(Ljava/lang/String;)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/ala;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/ala;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/qi20;->e(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    new-instance v0, Ll/bla;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/bla;-><init>(Ll/ela;)V

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
    new-instance v0, Ll/cla;

    .line 28
    .line 29
    invoke-direct {v0, p0}, Ll/cla;-><init>(Ll/ela;)V

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

.method public final synthetic y3(Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
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
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->picks:Lcom/p1/mobile/putong/core/data/Picks;

    .line 10
    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Picks;->new_()Lcom/p1/mobile/putong/core/data/Picks;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 23
    .line 24
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->picks:Lcom/p1/mobile/putong/core/data/Picks;

    .line 25
    .line 26
    :goto_0
    iget-object v0, p0, Ll/ela;->X:Lrx/subjects/a;

    .line 27
    .line 28
    invoke-virtual {v0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/Picks;->todayPaidProps:Z

    .line 32
    .line 33
    iput-boolean p1, p0, Ll/ela;->V:Z

    .line 34
    .line 35
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 36
    .line 37
    return-object p0
.end method

.method public final synthetic z3()Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/xka;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/xka;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/qi20;->e(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

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
    new-instance v1, Ll/yka;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/yka;-><init>(Ll/ela;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method
