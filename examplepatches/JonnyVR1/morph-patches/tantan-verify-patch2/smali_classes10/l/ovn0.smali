.class public final Ll/ovn0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            ">;"
        }
    .end annotation
.end field

.field public c:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;>;"
        }
    .end annotation
.end field

.field public d:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;Ljava/util/List;Ljava/util/List;ZLjava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;",
            ">;Z",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveStarlightHierarchy;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/ovn0;->b:Ljava/util/HashMap;

    .line 10
    .line 11
    new-instance v0, Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/ovn0;->c:Ljava/util/HashMap;

    .line 17
    .line 18
    new-instance v0, Ljava/util/HashMap;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/ovn0;->d:Ljava/util/HashMap;

    .line 24
    .line 25
    if-nez p1, :cond_0

    .line 26
    .line 27
    new-instance p1, Ljava/util/ArrayList;

    .line 28
    .line 29
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 30
    .line 31
    .line 32
    :cond_0
    iput-object p1, p0, Ll/ovn0;->a:Ljava/util/List;

    .line 33
    .line 34
    new-instance p1, Ll/hvn0;

    .line 35
    .line 36
    invoke-direct {p1}, Ll/hvn0;-><init>()V

    .line 37
    .line 38
    .line 39
    new-instance v0, Ll/ivn0;

    .line 40
    .line 41
    invoke-direct {v0}, Ll/ivn0;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-static {p3, p1, v0}, Ll/jyb;->d(Ljava/util/Collection;Ll/qcj;Ll/qcj;)Ljava/util/HashMap;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    new-instance p3, Ll/jvn0;

    .line 49
    .line 50
    invoke-direct {p3, p0, p1, p4}, Ll/jvn0;-><init>(Ll/ovn0;Ljava/util/Map;Z)V

    .line 51
    .line 52
    .line 53
    invoke-static {p2, p3}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0}, Ll/ovn0;->n()V

    .line 57
    .line 58
    .line 59
    iget-object p1, p0, Ll/ovn0;->a:Ljava/util/List;

    .line 60
    .line 61
    new-instance p2, Ll/kvn0;

    .line 62
    .line 63
    invoke-direct {p2, p0}, Ll/kvn0;-><init>(Ll/ovn0;)V

    .line 64
    .line 65
    .line 66
    invoke-static {p1, p2}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 67
    .line 68
    .line 69
    new-instance p1, Ll/lvn0;

    .line 70
    .line 71
    invoke-direct {p1}, Ll/lvn0;-><init>()V

    .line 72
    .line 73
    .line 74
    new-instance p2, Ll/mvn0;

    .line 75
    .line 76
    invoke-direct {p2}, Ll/mvn0;-><init>()V

    .line 77
    .line 78
    .line 79
    invoke-static {p5, p1, p2}, Ll/jyb;->d(Ljava/util/Collection;Ll/qcj;Ll/qcj;)Ljava/util/HashMap;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    iput-object p1, p0, Ll/ovn0;->d:Ljava/util/HashMap;

    .line 84
    .line 85
    return-void
.end method

.method public static synthetic a(Ll/ovn0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ovn0;->l(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/base/data/BLiveStarlightHierarchy;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStarlightHierarchy;->userId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic d(Ll/ovn0;Ljava/util/Map;ZLcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/ovn0;->k(Ljava/util/Map;ZLcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/base/data/BLiveStarlightHierarchy;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStarlightHierarchy;->imageUrl:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic f(Ll/ovn0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ovn0;->m(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->userId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public h(Ljava/lang/String;)Ll/nsv;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ovn0;->c:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/nsv;

    .line 8
    .line 9
    return-object p0
.end method

.method public i()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ovn0;->a:Ljava/util/List;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/ovn0;->a:Ljava/util/List;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Ll/ovn0;->a:Ljava/util/List;

    .line 13
    .line 14
    return-object p0
.end method

.method public j(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ovn0;->d:Ljava/util/HashMap;

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
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/String;

    .line 13
    .line 14
    return-object p0
.end method

.method public final synthetic k(Ljava/util/Map;ZLcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/ovn0;->c:Ljava/util/HashMap;

    .line 2
    .line 3
    iget-object v0, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p3}, Ll/nsv;->f(Ljava/lang/Object;)Ll/nsv;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object p3, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-interface {p1, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 16
    .line 17
    invoke-virtual {v1, p3, p1, p2}, Ll/nsv;->c(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;Z)Ll/nsv;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p0, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final synthetic l(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ovn0;->b:Ljava/util/HashMap;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic m(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ovn0;->c:Ljava/util/HashMap;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ll/nsv;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/nsv;->a:Ljava/lang/Object;

    .line 14
    .line 15
    move-object v0, p0

    .line 16
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userName:Ljava/lang/String;

    .line 21
    .line 22
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userPicture:Ljava/lang/String;

    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public final n()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ovn0;->a:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/nvn0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/nvn0;-><init>(Ll/ovn0;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
