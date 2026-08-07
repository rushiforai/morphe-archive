.class public Lcom/p1/mobile/putong/core/api/b0;
.super Ll/dy6;
.source "SourceFile"


# static fields
.field public static a0:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public R:Lcom/p1/mobile/putong/data/User;

.field public S:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

.field public T:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

.field public final U:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public V:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/core/data/PartialListOpt<",
            "Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;",
            ">;>;"
        }
    .end annotation
.end field

.field public W:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public X:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public Y:I

.field public Z:Ll/xgw;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/xgw<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/api/b0;->a0:Ljava/util/HashMap;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/core/api/c;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/dy6;-><init>(Lcom/p1/mobile/putong/core/api/c;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/b0;->R:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    new-instance p1, Ljava/util/HashSet;

    .line 8
    .line 9
    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/b0;->U:Ljava/util/HashSet;

    .line 13
    .line 14
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/b0;->V:Lrx/subjects/a;

    .line 19
    .line 20
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/b0;->W:Lrx/subjects/b;

    .line 25
    .line 26
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/b0;->X:Lrx/subjects/a;

    .line 31
    .line 32
    const/4 p1, 0x1

    .line 33
    iput p1, p0, Lcom/p1/mobile/putong/core/api/b0;->Y:I

    .line 34
    .line 35
    new-instance p1, Ll/xgw;

    .line 36
    .line 37
    const/16 v0, 0x14

    .line 38
    .line 39
    invoke-direct {p1, v0}, Ll/xgw;-><init>(I)V

    .line 40
    .line 41
    .line 42
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/b0;->Z:Ll/xgw;

    .line 43
    .line 44
    return-void
.end method

.method private synthetic G3(Ll/pf60;)V
    .locals 6

    .line 1
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    move-object v1, p1

    .line 4
    check-cast v1, Lcom/p1/mobile/putong/data/Envelope;

    .line 5
    .line 6
    const-class p1, Lcom/p1/mobile/putong/data/CommonData;

    .line 7
    .line 8
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Lcom/p1/mobile/putong/data/CommonData;

    .line 13
    .line 14
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    const-string v3, "moment suggested data back"

    .line 23
    .line 24
    invoke-interface {v2, v3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Dg(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->i()Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-eqz v2, :cond_1

    .line 32
    .line 33
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    const-string v3, "moment prefetch image to disk"

    .line 42
    .line 43
    invoke-interface {v2, v3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Dg(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, v0, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    .line 47
    .line 48
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-nez v0, :cond_0

    .line 53
    .line 54
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    check-cast p1, Lcom/p1/mobile/putong/data/CommonData;

    .line 59
    .line 60
    iget-object p1, p1, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    .line 61
    .line 62
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/api/b0;->T3(Ljava/util/List;)V

    .line 63
    .line 64
    .line 65
    :cond_0
    iget-object v0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 66
    .line 67
    const/4 v4, 0x0

    .line 68
    const/4 v5, 0x1

    .line 69
    const/4 v2, 0x0

    .line 70
    const/4 v3, 0x1

    .line 71
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/api/c;->y3(Lcom/p1/mobile/putong/data/Envelope;Ll/x20;ZZZ)V

    .line 72
    .line 73
    .line 74
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    const-string p1, "moment database merge suggested data end"

    .line 83
    .line 84
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Dg(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    :cond_1
    return-void
.end method

.method private synthetic H3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget-object p1, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/api/b0;->V:Lrx/subjects/a;

    .line 7
    .line 8
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/core/api/b0;->V:Lrx/subjects/a;

    .line 19
    .line 20
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    check-cast p1, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 25
    .line 26
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 27
    .line 28
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-eqz p1, :cond_0

    .line 33
    .line 34
    iget-object p1, p0, Lcom/p1/mobile/putong/core/api/b0;->V:Lrx/subjects/a;

    .line 35
    .line 36
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    check-cast p1, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 41
    .line 42
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 43
    .line 44
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 45
    .line 46
    .line 47
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/b0;->X:Lrx/subjects/a;

    .line 48
    .line 49
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 50
    .line 51
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method private R3(Lrx/Notification;ZLcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Notification<",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ">;Z",
            "Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;",
            "Lcom/p1/mobile/putong/data/User;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Lrx/Notification;->j()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/b0;->U:Ljava/util/HashSet;

    iget-object p1, p3, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    return-void

    .line 3
    :cond_0
    invoke-virtual {p1}, Lrx/Notification;->k()Z

    move-result v0

    if-eqz v0, :cond_a

    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    iget-object v1, p3, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ll/dkb;->Q9(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    move-result-object v0

    .line 5
    invoke-virtual {p1}, Lrx/Notification;->f()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/p1/mobile/putong/data/Envelope;

    const-class v2, Lcom/p1/mobile/putong/core/data/CoreData;

    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    move-result-object v1

    check-cast v1, Lcom/p1/mobile/putong/core/data/CoreData;

    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->relationships:Ljava/util/List;

    const/4 v3, 0x0

    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/p1/mobile/putong/data/Relationship;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    const-string v4, "matched"

    .line 6
    invoke-static {v1, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 7
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    if-eqz p2, :cond_1

    if-eqz v0, :cond_1

    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->superLikedMe()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 9
    const-string p2, "superLikedEach"

    invoke-static {p2}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    move-result-object p2

    invoke-interface {v1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    if-nez p2, :cond_2

    if-eqz v0, :cond_3

    .line 10
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->superLikedMe()Z

    move-result p2

    if-eqz p2, :cond_3

    .line 11
    :cond_2
    const-string p2, "superLiked"

    invoke-static {p2}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    move-result-object p2

    invoke-interface {v1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_3
    :goto_0
    if-eqz v0, :cond_4

    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->boosted()Z

    move-result p2

    if-eqz p2, :cond_4

    .line 13
    const-string p2, "boosted"

    invoke-static {p2}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    move-result-object p2

    invoke-interface {v1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 14
    :cond_4
    invoke-virtual {p1}, Lrx/Notification;->f()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/p1/mobile/putong/data/Envelope;

    .line 15
    invoke-virtual {p2, v2}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    move-result-object p2

    check-cast p2, Lcom/p1/mobile/putong/core/data/CoreData;

    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/CoreData;->relationships:Ljava/util/List;

    .line 16
    invoke-interface {p2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/p1/mobile/putong/data/Relationship;

    iget-object p2, p2, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 17
    const-string v0, "secretcrush"

    invoke-static {v0}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    move-result-object v4

    invoke-interface {p2, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_5

    .line 18
    invoke-static {v0}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    move-result-object p2

    invoke-interface {v1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 19
    :cond_5
    invoke-virtual {p1}, Lrx/Notification;->f()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/p1/mobile/putong/data/Envelope;

    .line 20
    invoke-virtual {p2, v2}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    move-result-object p2

    check-cast p2, Lcom/p1/mobile/putong/core/data/CoreData;

    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/CoreData;->relationships:Ljava/util/List;

    .line 21
    invoke-interface {p2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/p1/mobile/putong/data/Relationship;

    iget-object p2, p2, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 22
    const-string v0, "online"

    invoke-static {v0}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    move-result-object v4

    invoke-interface {p2, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_6

    .line 23
    invoke-static {v0}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    move-result-object p2

    invoke-interface {v1, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_6

    .line 24
    invoke-static {v0}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    move-result-object p2

    invoke-interface {v1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 25
    :cond_6
    invoke-virtual {p1}, Lrx/Notification;->f()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/p1/mobile/putong/data/Envelope;

    .line 26
    invoke-virtual {p2, v2}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    move-result-object p2

    check-cast p2, Lcom/p1/mobile/putong/core/data/CoreData;

    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/CoreData;->relationships:Ljava/util/List;

    .line 27
    invoke-interface {p2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/p1/mobile/putong/data/Relationship;

    iget-object p2, p2, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 28
    const-string v0, "vipseen"

    invoke-static {v0}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    move-result-object v4

    invoke-interface {p2, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_7

    .line 29
    invoke-static {v0}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    move-result-object p2

    invoke-interface {v1, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_7

    .line 30
    invoke-static {v0}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    move-result-object p2

    invoke-interface {v1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 31
    :cond_7
    invoke-virtual {p1}, Lrx/Notification;->f()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/p1/mobile/putong/data/Envelope;

    invoke-virtual {p2, v2}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    move-result-object p2

    check-cast p2, Lcom/p1/mobile/putong/core/data/CoreData;

    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/CoreData;->relationships:Ljava/util/List;

    invoke-interface {p2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/p1/mobile/putong/data/Relationship;

    iput-object v1, p2, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    if-nez p4, :cond_9

    .line 32
    iget-object p2, p0, Lcom/p1/mobile/putong/core/api/b0;->R:Lcom/p1/mobile/putong/data/User;

    if-eqz p2, :cond_9

    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 33
    invoke-virtual {p1}, Lrx/Notification;->f()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/data/Envelope;

    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreData;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreData;->relationships:Ljava/util/List;

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/data/Relationship;

    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->id:Ljava/lang/String;

    .line 34
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_9

    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/b0;->v3()V

    goto :goto_1

    :cond_8
    if-nez p4, :cond_9

    .line 36
    iget-object p2, p0, Lcom/p1/mobile/putong/core/api/b0;->R:Lcom/p1/mobile/putong/data/User;

    if-eqz p2, :cond_9

    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 37
    invoke-virtual {p1}, Lrx/Notification;->f()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/data/Envelope;

    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreData;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreData;->relationships:Ljava/util/List;

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/data/Relationship;

    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->id:Ljava/lang/String;

    .line 38
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_9

    .line 39
    iget-object p2, p0, Lcom/p1/mobile/putong/core/api/b0;->S:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    const/4 v0, 0x1

    iput-boolean v0, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->canUndo:Z

    .line 40
    :cond_9
    :goto_1
    iget-object p2, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 41
    invoke-virtual {p1}, Lrx/Notification;->f()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/data/Envelope;

    new-instance v1, Ll/dab;

    invoke-direct {v1, p0, p1, p3, p4}, Ll/dab;-><init>(Lcom/p1/mobile/putong/core/api/b0;Lrx/Notification;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;)V

    .line 42
    invoke-virtual {p2, v0, v1}, Lcom/p1/mobile/putong/core/api/c;->w3(Lcom/p1/mobile/putong/data/Envelope;Ll/x20;)V

    .line 43
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    iget-object p1, p3, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreLikers;->B7(Ljava/lang/String;)V

    :cond_a
    return-void
.end method

.method private T3(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->E(Ljava/util/List;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance p1, Ll/bab;

    .line 6
    .line 7
    invoke-direct {p1}, Ll/bab;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {p0, p1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic a3(Lcom/p1/mobile/putong/core/api/b0;ZLcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;Lrx/Notification;)Lrx/Notification;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/api/b0;->E3(ZLcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;Lrx/Notification;)Lrx/Notification;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b3(Lcom/p1/mobile/putong/core/api/b0;ILcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/api/b0;->A3(ILcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic c3(Lcom/p1/mobile/putong/core/api/b0;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/Relationship;Ljava/util/Map;Ljava/lang/Long;ZLcom/p1/mobile/putong/data/User;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/core/api/b0;->D3(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/Relationship;Ljava/util/Map;Ljava/lang/Long;ZLcom/p1/mobile/putong/data/User;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic d3(Lcom/p1/mobile/putong/core/api/b0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/api/b0;->H3(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic e3(Lcom/p1/mobile/putong/core/api/b0;ILcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/api/b0;->B3(ILcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic f3(Lcom/p1/mobile/putong/data/Envelope;)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static synthetic g3(Lcom/p1/mobile/putong/core/api/b0;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Relationship;Ljava/util/Map;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/api/b0;->O3(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Relationship;Ljava/util/Map;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic h3(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Relationship;
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
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->relationships:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    new-instance p0, Lcom/p1/mobile/putong/data/Relationship;

    .line 18
    .line 19
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/Relationship;-><init>()V

    .line 20
    .line 21
    .line 22
    const-string v0, "unknown_"

    .line 23
    .line 24
    invoke-static {v0}, Lcom/p1/mobile/putong/data/RelationshipStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_0
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    check-cast p0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->relationships:Ljava/util/List;

    .line 38
    .line 39
    const/4 v0, 0x0

    .line 40
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    check-cast p0, Lcom/p1/mobile/putong/data/Relationship;

    .line 45
    .line 46
    return-object p0
.end method

.method public static synthetic i3(Lcom/p1/mobile/putong/core/api/b0;Ljava/lang/String;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/b0;->J3(Ljava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic j3(Ljava/lang/String;)Ll/x1d0;
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
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/x1d0$a;->f()Ll/x1d0$a;

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

.method public static synthetic k3(Ljava/lang/String;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

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

.method public static synthetic l3(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->hasPic()Z

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
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/data/User;->media(I)Lcom/p1/mobile/putong/data/Media;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-interface {v0, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Xf(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 26
    .line 27
    invoke-virtual {v0, p0}, Ll/fsb0;->z0(Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public static synthetic m3(Lcom/p1/mobile/putong/core/api/b0;Lrx/Notification;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/api/b0;->F3(Lrx/Notification;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic n3(Lcom/p1/mobile/putong/core/api/b0;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/api/b0;->G3(Ll/pf60;)V

    return-void
.end method

.method public static synthetic o3(Lcom/p1/mobile/putong/core/api/b0;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Relationship;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/api/b0;->N3(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Relationship;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic p3(Lcom/p1/mobile/putong/core/api/b0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/b0;->K3(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic q3(Lcom/p1/mobile/putong/core/api/b0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/b0;->L3(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic r3(Lcom/p1/mobile/putong/core/api/b0;Lcom/p1/mobile/putong/data/Envelope;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/api/b0;->M3(Lcom/p1/mobile/putong/data/Envelope;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V

    return-void
.end method

.method public static synthetic s3(Lcom/p1/mobile/putong/core/api/b0;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/api/b0;->C3(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/Relationship;)V

    return-void
.end method

.method public static synthetic t3(Lcom/p1/mobile/putong/core/api/b0;Ll/pf60;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/b0;->I3(Ll/pf60;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic u3(I)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public final synthetic A3(ILcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Ll/uxj0;)V
    .locals 1

    .line 1
    iget-object p3, p0, Lcom/p1/mobile/putong/core/api/b0;->V:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p3}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    check-cast p3, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 8
    .line 9
    if-nez p3, :cond_0

    .line 10
    .line 11
    new-instance p3, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iget-object p3, p3, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 18
    .line 19
    :goto_0
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-lt v0, p1, :cond_1

    .line 24
    .line 25
    invoke-interface {p3, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    goto :goto_1

    .line 29
    :cond_1
    invoke-interface {p3, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/api/b0;->U:Ljava/util/HashSet;

    .line 33
    .line 34
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {p1, p2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    invoke-static {}, Lcom/p1/mobile/putong/data/DbLinks;->new_()Lcom/p1/mobile/putong/data/DbLinks;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iget-object p2, p1, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 44
    .line 45
    const-string v0, ""

    .line 46
    .line 47
    iput-object v0, p2, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/b0;->V:Lrx/subjects/a;

    .line 50
    .line 51
    new-instance p2, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 52
    .line 53
    invoke-direct {p2, p3, p1}, Lcom/p1/mobile/putong/core/data/PartialListOpt;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0, p2}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public final synthetic B3(ILcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/hab;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/hab;-><init>(I)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lrx/c;->fromCallable(Ljava/util/concurrent/Callable;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {}, Lcom/p1/mobile/putong/core/api/a;->T2()Lrx/c$d;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/iab;

    .line 19
    .line 20
    invoke-direct {v1, p0, p1, p2}, Ll/iab;-><init>(Lcom/p1/mobile/putong/core/api/b0;ILcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public final synthetic C3(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 1

    .line 1
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 2
    .line 3
    const-string v0, "matched"

    .line 4
    .line 5
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreLikers;->C7(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public final synthetic D3(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/Relationship;Ljava/util/Map;Ljava/lang/Long;ZLcom/p1/mobile/putong/data/User;)Lrx/c;
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0, p2, p3}, Lcom/p1/mobile/putong/core/api/y;->m3(Ljava/lang/String;Lcom/p1/mobile/putong/data/Relationship;Ljava/util/Map;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-static {p4}, Ll/z7i0;->e(Ljava/lang/Long;)Lrx/c$d;

    .line 8
    .line 9
    .line 10
    move-result-object p3

    .line 11
    invoke-virtual {p2, p3}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    invoke-virtual {p2}, Lrx/c;->materialize()Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    new-instance p3, Ll/mab;

    .line 20
    .line 21
    invoke-direct {p3, p0, p5, p1, p6}, Ll/mab;-><init>(Lcom/p1/mobile/putong/core/api/b0;ZLcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p2, p3}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    invoke-virtual {p2}, Lrx/c;->dematerialize()Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    const/4 p3, 0x1

    .line 33
    invoke-virtual {p2, p3}, Lrx/c;->take(I)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    invoke-static {}, Lcom/p1/mobile/putong/core/api/a;->T2()Lrx/c$d;

    .line 38
    .line 39
    .line 40
    move-result-object p3

    .line 41
    invoke-virtual {p2, p3}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    new-instance p3, Ll/nab;

    .line 46
    .line 47
    invoke-direct {p3}, Ll/nab;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p2, p3}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    new-instance p3, Ll/oab;

    .line 55
    .line 56
    invoke-direct {p3, p0, p1}, Ll/oab;-><init>(Lcom/p1/mobile/putong/core/api/b0;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p2, p3}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    return-object p0
.end method

.method public final synthetic E3(ZLcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;Lrx/Notification;)Lrx/Notification;
    .locals 0

    .line 1
    invoke-direct {p0, p4, p1, p2, p3}, Lcom/p1/mobile/putong/core/api/b0;->R3(Lrx/Notification;ZLcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;)V

    .line 2
    .line 3
    .line 4
    return-object p4
.end method

.method public final synthetic F3(Lrx/Notification;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lrx/Notification;->f()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    .line 6
    .line 7
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->relationships:Ljava/util/List;

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Lcom/p1/mobile/putong/data/Relationship;

    .line 23
    .line 24
    iget-object v0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 25
    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 27
    .line 28
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v0, p2}, Ll/dkb;->Q9(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    if-nez p2, :cond_1

    .line 35
    .line 36
    if-nez p3, :cond_0

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    move-object p2, p3

    .line 40
    :cond_1
    iput-object p1, p2, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 41
    .line 42
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 43
    .line 44
    const-string v0, "matched"

    .line 45
    .line 46
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    if-eqz p1, :cond_3

    .line 51
    .line 52
    if-eqz p3, :cond_2

    .line 53
    .line 54
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 55
    .line 56
    iput-object p1, p3, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 57
    .line 58
    :cond_2
    sget-object p1, Ll/uqb0;->k0:Ll/vj5;

    .line 59
    .line 60
    iget-object p1, p1, Ll/vj5;->d:Ll/ejk0;

    .line 61
    .line 62
    invoke-virtual {p1, p2}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;)V

    .line 63
    .line 64
    .line 65
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 66
    .line 67
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 68
    .line 69
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/api/g;->vf(Lcom/p1/mobile/putong/data/User;)V

    .line 70
    .line 71
    .line 72
    :cond_3
    :goto_0
    return-void
.end method

.method public final synthetic I3(Ll/pf60;)Ll/uxj0;
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/b0;->V:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 18
    .line 19
    :goto_0
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    .line 22
    .line 23
    new-instance v1, Ljava/util/HashMap;

    .line 24
    .line 25
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 26
    .line 27
    .line 28
    const-class v2, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 29
    .line 30
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    check-cast v3, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 35
    .line 36
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/CoreData;->cardInfos:Ljava/util/List;

    .line 37
    .line 38
    invoke-static {v3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    if-nez v3, :cond_2

    .line 43
    .line 44
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    check-cast v3, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 49
    .line 50
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/CoreData;->cardInfos:Ljava/util/List;

    .line 51
    .line 52
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    :cond_1
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 57
    .line 58
    .line 59
    move-result v4

    .line 60
    if-eqz v4, :cond_2

    .line 61
    .line 62
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v4

    .line 66
    check-cast v4, Lcom/p1/mobile/putong/core/data/CardInfos;

    .line 67
    .line 68
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result v5

    .line 72
    if-eqz v5, :cond_1

    .line 73
    .line 74
    iget-object v5, v4, Lcom/p1/mobile/putong/core/data/CardInfos;->userId:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {v1, v5, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_2
    new-instance v3, Ljava/util/ArrayList;

    .line 81
    .line 82
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 86
    .line 87
    .line 88
    move-result-object v4

    .line 89
    check-cast v4, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 90
    .line 91
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/CoreData;->likedMes:Ljava/util/List;

    .line 92
    .line 93
    invoke-static {v4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 94
    .line 95
    .line 96
    move-result v4

    .line 97
    if-nez v4, :cond_4

    .line 98
    .line 99
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 100
    .line 101
    .line 102
    move-result-object v4

    .line 103
    check-cast v4, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 104
    .line 105
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/CoreData;->likedMes:Ljava/util/List;

    .line 106
    .line 107
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 108
    .line 109
    .line 110
    move-result-object v4

    .line 111
    :cond_3
    :goto_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 112
    .line 113
    .line 114
    move-result v5

    .line 115
    if-eqz v5, :cond_4

    .line 116
    .line 117
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object v5

    .line 121
    check-cast v5, Lcom/p1/mobile/putong/core/data/CardStyle;

    .line 122
    .line 123
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    move-result v6

    .line 127
    if-eqz v6, :cond_3

    .line 128
    .line 129
    iget-object v6, v5, Lcom/p1/mobile/putong/core/data/CardStyle;->label:Ljava/util/List;

    .line 130
    .line 131
    const-string v7, "liked_me"

    .line 132
    .line 133
    invoke-interface {v6, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    move-result v6

    .line 137
    if-eqz v6, :cond_3

    .line 138
    .line 139
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/CardStyle;->userId:Ljava/lang/String;

    .line 140
    .line 141
    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 142
    .line 143
    .line 144
    goto :goto_2

    .line 145
    :cond_4
    const-class v4, Lcom/p1/mobile/putong/data/CommonData;

    .line 146
    .line 147
    invoke-virtual {p1, v4}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 148
    .line 149
    .line 150
    move-result-object v5

    .line 151
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 152
    .line 153
    .line 154
    move-result v5

    .line 155
    const/4 v6, 0x0

    .line 156
    if-eqz v5, :cond_9

    .line 157
    .line 158
    invoke-virtual {p1, v4}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 159
    .line 160
    .line 161
    move-result-object v5

    .line 162
    check-cast v5, Lcom/p1/mobile/putong/data/CommonData;

    .line 163
    .line 164
    iget-object v5, v5, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    .line 165
    .line 166
    invoke-static {v5}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 167
    .line 168
    .line 169
    move-result v5

    .line 170
    if-nez v5, :cond_9

    .line 171
    .line 172
    invoke-virtual {p1, v4}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 173
    .line 174
    .line 175
    move-result-object v4

    .line 176
    check-cast v4, Lcom/p1/mobile/putong/data/CommonData;

    .line 177
    .line 178
    iget-object v4, v4, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    .line 179
    .line 180
    new-instance v5, Ljava/util/ArrayList;

    .line 181
    .line 182
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 183
    .line 184
    .line 185
    new-instance v7, Ljava/util/HashMap;

    .line 186
    .line 187
    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 188
    .line 189
    .line 190
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 191
    .line 192
    .line 193
    move-result-object v8

    .line 194
    check-cast v8, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 195
    .line 196
    iget-object v8, v8, Lcom/p1/mobile/putong/core/data/CoreData;->moments:Ljava/util/List;

    .line 197
    .line 198
    invoke-static {v8}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 199
    .line 200
    .line 201
    move-result v8

    .line 202
    if-nez v8, :cond_6

    .line 203
    .line 204
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 205
    .line 206
    .line 207
    move-result-object p1

    .line 208
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 209
    .line 210
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->moments:Ljava/util/List;

    .line 211
    .line 212
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 213
    .line 214
    .line 215
    move-result-object p1

    .line 216
    :cond_5
    :goto_3
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 217
    .line 218
    .line 219
    move-result v2

    .line 220
    if-eqz v2, :cond_6

    .line 221
    .line 222
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 223
    .line 224
    .line 225
    move-result-object v2

    .line 226
    check-cast v2, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 227
    .line 228
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 229
    .line 230
    .line 231
    move-result v8

    .line 232
    if-eqz v8, :cond_5

    .line 233
    .line 234
    iget-object v8, v2, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 235
    .line 236
    invoke-virtual {v7, v8, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 237
    .line 238
    .line 239
    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 240
    .line 241
    .line 242
    goto :goto_3

    .line 243
    :cond_6
    invoke-static {v4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 244
    .line 245
    .line 246
    move-result p1

    .line 247
    if-nez p1, :cond_9

    .line 248
    .line 249
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 250
    .line 251
    .line 252
    move-result-object p1

    .line 253
    :goto_4
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 254
    .line 255
    .line 256
    move-result v2

    .line 257
    if-eqz v2, :cond_9

    .line 258
    .line 259
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 260
    .line 261
    .line 262
    move-result-object v2

    .line 263
    check-cast v2, Lcom/p1/mobile/putong/data/User;

    .line 264
    .line 265
    iget-object v4, p0, Lcom/p1/mobile/putong/core/api/b0;->U:Ljava/util/HashSet;

    .line 266
    .line 267
    iget-object v5, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 268
    .line 269
    invoke-virtual {v4, v5}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 270
    .line 271
    .line 272
    move-result v4

    .line 273
    if-eqz v4, :cond_7

    .line 274
    .line 275
    goto :goto_4

    .line 276
    :cond_7
    new-instance v4, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 277
    .line 278
    invoke-direct {v4}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;-><init>()V

    .line 279
    .line 280
    .line 281
    iget-object v5, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 282
    .line 283
    iput-object v5, v4, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 284
    .line 285
    invoke-virtual {v1, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 286
    .line 287
    .line 288
    move-result-object v5

    .line 289
    check-cast v5, Lcom/p1/mobile/putong/core/data/CardInfos;

    .line 290
    .line 291
    iput-object v5, v4, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->cardInfos:Lcom/p1/mobile/putong/core/data/CardInfos;

    .line 292
    .line 293
    const/4 v6, 0x1

    .line 294
    iput-boolean v6, v4, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isCoreMomentThemeCard:Z

    .line 295
    .line 296
    iget-object v8, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 297
    .line 298
    invoke-interface {v3, v8}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 299
    .line 300
    .line 301
    move-result v8

    .line 302
    invoke-virtual {v4, v8}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->setUserLikeMe(Z)V

    .line 303
    .line 304
    .line 305
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 306
    .line 307
    .line 308
    move-result v8

    .line 309
    if-eqz v8, :cond_8

    .line 310
    .line 311
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/CardInfos;->momentId:Ljava/lang/String;

    .line 312
    .line 313
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 314
    .line 315
    .line 316
    move-result v5

    .line 317
    if-nez v5, :cond_8

    .line 318
    .line 319
    iget-object v5, v4, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->cardInfos:Lcom/p1/mobile/putong/core/data/CardInfos;

    .line 320
    .line 321
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/CardInfos;->momentId:Ljava/lang/String;

    .line 322
    .line 323
    invoke-virtual {v7, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 324
    .line 325
    .line 326
    move-result-object v5

    .line 327
    check-cast v5, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 328
    .line 329
    iput-object v5, v4, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->coreMomentInfo:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 330
    .line 331
    :cond_8
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 332
    .line 333
    .line 334
    iget-object v4, p0, Lcom/p1/mobile/putong/core/api/b0;->U:Ljava/util/HashSet;

    .line 335
    .line 336
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 337
    .line 338
    invoke-virtual {v4, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 339
    .line 340
    .line 341
    goto :goto_4

    .line 342
    :cond_9
    invoke-static {}, Lcom/p1/mobile/putong/data/DbLinks;->new_()Lcom/p1/mobile/putong/data/DbLinks;

    .line 343
    .line 344
    .line 345
    move-result-object p1

    .line 346
    iget-object v1, p1, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 347
    .line 348
    if-eqz v6, :cond_a

    .line 349
    .line 350
    const-string v2, ""

    .line 351
    .line 352
    goto :goto_5

    .line 353
    :cond_a
    const/4 v2, 0x0

    .line 354
    :goto_5
    iput-object v2, v1, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 355
    .line 356
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 357
    .line 358
    .line 359
    move-result-object v1

    .line 360
    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 361
    .line 362
    .line 363
    move-result-object v1

    .line 364
    const-string v2, "moment suggested data emmit"

    .line 365
    .line 366
    invoke-interface {v1, v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Dg(Ljava/lang/String;)V

    .line 367
    .line 368
    .line 369
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/b0;->V:Lrx/subjects/a;

    .line 370
    .line 371
    new-instance v1, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 372
    .line 373
    invoke-direct {v1, v0, p1}, Lcom/p1/mobile/putong/core/data/PartialListOpt;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)V

    .line 374
    .line 375
    .line 376
    invoke-virtual {p0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 377
    .line 378
    .line 379
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 380
    .line 381
    return-object p0
.end method

.method public final synthetic J3(Ljava/lang/String;)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/pab;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/pab;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/qi20;->e(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    new-instance v0, Ll/qab;

    .line 11
    .line 12
    invoke-direct {v0}, Ll/qab;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    new-instance v0, Ll/w9b;

    .line 20
    .line 21
    invoke-direct {v0, p0}, Ll/w9b;-><init>(Lcom/p1/mobile/putong/core/api/b0;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1, v0}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    new-instance v0, Ll/x9b;

    .line 29
    .line 30
    invoke-direct {v0, p0}, Ll/x9b;-><init>(Lcom/p1/mobile/putong/core/api/b0;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1, v0}, Lrx/c;->doOnError(Ll/y20;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-static {}, Lcom/p1/mobile/putong/core/api/a;->T2()Lrx/c$d;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {p1, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    new-instance v0, Ll/y9b;

    .line 46
    .line 47
    invoke-direct {v0, p0}, Ll/y9b;-><init>(Lcom/p1/mobile/putong/core/api/b0;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    return-object p0
.end method

.method public final synthetic K3(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/b0;->S3(Ljava/lang/String;)Lrx/c;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic L3(Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Ll/aab;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/aab;-><init>(Lcom/p1/mobile/putong/core/api/b0;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic M3(Lcom/p1/mobile/putong/data/Envelope;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V
    .locals 2

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
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->relationships:Ljava/util/List;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Lcom/p1/mobile/putong/data/Relationship;

    .line 17
    .line 18
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 19
    .line 20
    const-string v1, "default"

    .line 21
    .line 22
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    sget-object p1, Ll/uqb0;->k0:Ll/vj5;

    .line 29
    .line 30
    iget-object p1, p1, Ll/vj5;->d:Ll/ejk0;

    .line 31
    .line 32
    invoke-virtual {p1, p2}, Ll/wzh0;->insert(Lcom/tantanapp/common/data/DbObject;)V

    .line 33
    .line 34
    .line 35
    const/4 p1, 0x1

    .line 36
    iput-boolean p1, p3, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isUndo:Z

    .line 37
    .line 38
    invoke-virtual {p0, p3, v0}, Lcom/p1/mobile/putong/core/api/b0;->z3(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;I)Lrx/c;

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/b0;->v3()V

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method

.method public final synthetic N3(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Relationship;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    new-instance v1, Ll/cab;

    .line 4
    .line 5
    invoke-direct {v1, p0, p3, p1, p2}, Ll/cab;-><init>(Lcom/p1/mobile/putong/core/api/b0;Lcom/p1/mobile/putong/data/Envelope;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p3, v1}, Lcom/p1/mobile/putong/core/api/c;->w3(Lcom/p1/mobile/putong/data/Envelope;Ll/x20;)V

    .line 9
    .line 10
    .line 11
    const-class p0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 12
    .line 13
    invoke-virtual {p3, p0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->relationships:Ljava/util/List;

    .line 20
    .line 21
    const/4 p1, 0x0

    .line 22
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    check-cast p0, Lcom/p1/mobile/putong/data/Relationship;

    .line 27
    .line 28
    return-object p0
.end method

.method public final synthetic O3(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Relationship;Ljava/util/Map;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Lrx/c;
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0, p2, p3}, Lcom/p1/mobile/putong/core/api/y;->m3(Ljava/lang/String;Lcom/p1/mobile/putong/data/Relationship;Ljava/util/Map;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    new-instance p3, Ll/z9b;

    .line 8
    .line 9
    invoke-direct {p3, p0, p1, p4}, Ll/z9b;-><init>(Lcom/p1/mobile/putong/core/api/b0;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p2, p3}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-static {}, Lcom/p1/mobile/putong/core/api/a;->T2()Lrx/c$d;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public P3(ZZLjava/util/Map;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/LikeFrom;ZLcom/p1/mobile/putong/data/LikeExtraData;ILcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Lrx/c;
    .locals 8
    .param p3    # Ljava/util/Map;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p7    # Lcom/p1/mobile/putong/data/LikeExtraData;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZ",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/data/LikeFrom;",
            "Z",
            "Lcom/p1/mobile/putong/data/LikeExtraData;",
            "I",
            "Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Relationship;",
            ">;"
        }
    .end annotation

    .line 1
    move-object/from16 v2, p9

    .line 2
    .line 3
    if-nez p3, :cond_0

    .line 4
    .line 5
    new-instance p3, Ljava/util/HashMap;

    .line 6
    .line 7
    invoke-direct {p3}, Ljava/util/HashMap;-><init>()V

    .line 8
    .line 9
    .line 10
    :cond_0
    move-object v4, p3

    .line 11
    if-eqz p7, :cond_1

    .line 12
    .line 13
    iget-object p3, p7, Lcom/p1/mobile/putong/data/LikeExtraData;->matchScData:Lcom/p1/mobile/putong/data/MatchScData;

    .line 14
    .line 15
    iget-object p3, p3, Lcom/p1/mobile/putong/data/MatchScData;->receiverUserId:Ljava/lang/String;

    .line 16
    .line 17
    const-string v0, "receiver_user_id"

    .line 18
    .line 19
    invoke-interface {v4, v0, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    :cond_1
    if-nez v2, :cond_2

    .line 23
    .line 24
    new-instance p0, Ljava/lang/Exception;

    .line 25
    .line 26
    const-string p1, "Like Api Error: Perhaps suggested users were cleared or reset when doing Swipe Card Animation at moment"

    .line 27
    .line 28
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 32
    .line 33
    .line 34
    invoke-static {}, Lcom/p1/mobile/putong/data/Relationship;->new_()Lcom/p1/mobile/putong/data/Relationship;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0

    .line 43
    :cond_2
    move/from16 p3, p8

    .line 44
    .line 45
    iput p3, p0, Lcom/p1/mobile/putong/core/api/b0;->Y:I

    .line 46
    .line 47
    invoke-virtual {p0, p1, p2, v2, p5}, Lcom/p1/mobile/putong/core/api/b0;->w3(ZZLcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/LikeFrom;)Lcom/p1/mobile/putong/data/Relationship;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    invoke-virtual {p0, v3, p5}, Lcom/p1/mobile/putong/core/api/b0;->x3(Lcom/p1/mobile/putong/data/Relationship;Lcom/p1/mobile/putong/data/LikeFrom;)Ljava/lang/Long;

    .line 52
    .line 53
    .line 54
    move-result-object v5

    .line 55
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 56
    .line 57
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 58
    .line 59
    iget-object p3, v2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {p1, p3}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/b0;->R:Lcom/p1/mobile/putong/data/User;

    .line 66
    .line 67
    iput-object v2, p0, Lcom/p1/mobile/putong/core/api/b0;->S:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 68
    .line 69
    iget-object p1, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 70
    .line 71
    new-instance v0, Ll/lab;

    .line 72
    .line 73
    move-object v1, p0

    .line 74
    move v6, p2

    .line 75
    move-object v7, p4

    .line 76
    invoke-direct/range {v0 .. v7}, Ll/lab;-><init>(Lcom/p1/mobile/putong/core/api/b0;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/Relationship;Ljava/util/Map;Ljava/lang/Long;ZLcom/p1/mobile/putong/data/User;)V

    .line 77
    .line 78
    .line 79
    const-string p0, "cardlike_theme_slide"

    .line 80
    .line 81
    const/4 p2, -0x1

    .line 82
    invoke-virtual {p1, p0, p2, v0, p6}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;Z)Lrx/c;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    return-object p0
.end method

.method public Q3()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/b0;->X:Lrx/subjects/a;

    .line 2
    .line 3
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public S3(Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/core/api/a;->k2(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/b0;->W:Lrx/subjects/b;

    .line 6
    .line 7
    sget-object v1, Ll/uxj0;->a:Ll/uxj0;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    new-instance v1, Ll/gab;

    .line 15
    .line 16
    invoke-direct {v1, p0, p1}, Ll/gab;-><init>(Lcom/p1/mobile/putong/core/api/b0;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    const-string p0, "users/suggested/themeSlide"

    .line 20
    .line 21
    const/4 p1, 0x0

    .line 22
    invoke-virtual {v0, p0, p1, v1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public U3(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

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
    new-instance v0, Ll/fab;

    .line 9
    .line 10
    invoke-direct {v0, p1}, Ll/fab;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/b0;->V3(Ll/qcj;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public V3(Ll/qcj;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/qcj<",
            "Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/b0;->V:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/b0;->V:Lrx/subjects/a;

    .line 10
    .line 11
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 18
    .line 19
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/b0;->V:Lrx/subjects/a;

    .line 26
    .line 27
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 34
    .line 35
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-eqz v1, :cond_1

    .line 44
    .line 45
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    check-cast v1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 50
    .line 51
    invoke-interface {p1, v1}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    check-cast v2, Ljava/lang/Boolean;

    .line 56
    .line 57
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    if-eqz v2, :cond_0

    .line 62
    .line 63
    iget-object p1, p0, Lcom/p1/mobile/putong/core/api/b0;->U:Ljava/util/HashSet;

    .line 64
    .line 65
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {p1, v1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 71
    .line 72
    .line 73
    iget-object p1, p0, Lcom/p1/mobile/putong/core/api/b0;->V:Lrx/subjects/a;

    .line 74
    .line 75
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    check-cast p1, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 80
    .line 81
    const/4 v0, 0x1

    .line 82
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/data/PartialListOpt;->setRefreshValue(Z)V

    .line 83
    .line 84
    .line 85
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/b0;->V:Lrx/subjects/a;

    .line 86
    .line 87
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    check-cast p1, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 92
    .line 93
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 94
    .line 95
    .line 96
    :cond_1
    return-void
.end method

.method public W3(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/b0;->V:Lrx/subjects/a;

    .line 11
    .line 12
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/b0;->V:Lrx/subjects/a;

    .line 19
    .line 20
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 25
    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 27
    .line 28
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_2

    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/b0;->V:Lrx/subjects/a;

    .line 35
    .line 36
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 41
    .line 42
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 43
    .line 44
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-eqz v1, :cond_2

    .line 53
    .line 54
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    check-cast v1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 59
    .line 60
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    if-eqz v2, :cond_1

    .line 65
    .line 66
    iget-object v2, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 67
    .line 68
    invoke-interface {p1, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    if-eqz v2, :cond_1

    .line 73
    .line 74
    iget-object v2, p0, Lcom/p1/mobile/putong/core/api/b0;->U:Ljava/util/HashSet;

    .line 75
    .line 76
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 77
    .line 78
    invoke-virtual {v2, v1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 82
    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_2
    :goto_1
    return-void
.end method

.method public X3(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Z
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/b0;->V:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_4

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/b0;->V:Lrx/subjects/a;

    .line 11
    .line 12
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 19
    .line 20
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_4

    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/b0;->V:Lrx/subjects/a;

    .line 27
    .line 28
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 33
    .line 34
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    if-eqz v2, :cond_3

    .line 45
    .line 46
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    check-cast v2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 51
    .line 52
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    if-eqz v3, :cond_0

    .line 57
    .line 58
    invoke-virtual {v2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    if-nez v3, :cond_2

    .line 63
    .line 64
    iget-object v3, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 65
    .line 66
    iget-object v4, v2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 67
    .line 68
    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 69
    .line 70
    .line 71
    move-result v3

    .line 72
    if-eqz v3, :cond_1

    .line 73
    .line 74
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isVirtualCard()Z

    .line 75
    .line 76
    .line 77
    move-result v3

    .line 78
    if-eqz v3, :cond_2

    .line 79
    .line 80
    :cond_1
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isVirtualCard()Z

    .line 81
    .line 82
    .line 83
    move-result v3

    .line 84
    if-eqz v3, :cond_0

    .line 85
    .line 86
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isVirtualCard()Z

    .line 87
    .line 88
    .line 89
    move-result v3

    .line 90
    if-eqz v3, :cond_0

    .line 91
    .line 92
    iget-object v3, v2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 93
    .line 94
    iget-object v4, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 95
    .line 96
    if-ne v3, v4, :cond_0

    .line 97
    .line 98
    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 99
    .line 100
    .line 101
    iget-object p1, p0, Lcom/p1/mobile/putong/core/api/b0;->V:Lrx/subjects/a;

    .line 102
    .line 103
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    check-cast p1, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 108
    .line 109
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 110
    .line 111
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 112
    .line 113
    .line 114
    new-instance p1, Ljava/lang/StringBuilder;

    .line 115
    .line 116
    const-string v0, "moment \u5220\u9664List\u6570\u636e\uff1a"

    .line 117
    .line 118
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    iget-object v0, v2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 122
    .line 123
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    const-string v0, ", "

    .line 127
    .line 128
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/b0;->V:Lrx/subjects/a;

    .line 132
    .line 133
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    check-cast v0, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 138
    .line 139
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 140
    .line 141
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    const-string v0, "BifrostLayout"

    .line 153
    .line 154
    invoke-static {v0, p1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    const/4 v1, 0x1

    .line 158
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/api/b0;->V:Lrx/subjects/a;

    .line 159
    .line 160
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 161
    .line 162
    .line 163
    move-result-object p1

    .line 164
    check-cast p1, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 165
    .line 166
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/b0;->V:Lrx/subjects/a;

    .line 167
    .line 168
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    check-cast v0, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 173
    .line 174
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 175
    .line 176
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 177
    .line 178
    .line 179
    move-result v0

    .line 180
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/data/PartialListOpt;->setRefreshValue(Z)V

    .line 181
    .line 182
    .line 183
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/b0;->V:Lrx/subjects/a;

    .line 184
    .line 185
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 186
    .line 187
    .line 188
    move-result-object p1

    .line 189
    check-cast p1, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 190
    .line 191
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 192
    .line 193
    .line 194
    :cond_4
    return v1
.end method

.method public Y3()Lrx/c;
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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/b0;->W:Lrx/subjects/b;

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

.method public Z3()Lrx/c;
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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/b0;->X:Lrx/subjects/a;

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

.method public a4(Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/core/data/PartialListOpt<",
            "Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/b0;->V:Lrx/subjects/a;

    .line 2
    .line 3
    new-instance v1, Ll/jab;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/jab;-><init>(Lcom/p1/mobile/putong/core/api/b0;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lrx/c;->doOnSubscribe(Ll/x20;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    new-instance p1, Ll/kab;

    .line 13
    .line 14
    invoke-direct {p1}, Ll/kab;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public b4(Ljava/util/Map;)Lrx/c;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Relationship;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/b0;->R:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/b0;->S:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->clone()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 14
    .line 15
    .line 16
    move-result-object v5

    .line 17
    new-instance v3, Lcom/p1/mobile/putong/data/Relationship;

    .line 18
    .line 19
    invoke-direct {v3}, Lcom/p1/mobile/putong/data/Relationship;-><init>()V

    .line 20
    .line 21
    .line 22
    const-string v0, "default"

    .line 23
    .line 24
    invoke-static {v0}, Lcom/p1/mobile/putong/data/RelationshipStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iput-object v0, v3, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 29
    .line 30
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 33
    .line 34
    iget-object v1, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-eqz v1, :cond_1

    .line 45
    .line 46
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->ussTracker:Ljava/lang/String;

    .line 47
    .line 48
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-nez v1, :cond_1

    .line 53
    .line 54
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->ussTracker:Ljava/lang/String;

    .line 55
    .line 56
    iput-object v0, v3, Lcom/p1/mobile/putong/data/Relationship;->ussTracker:Ljava/lang/String;

    .line 57
    .line 58
    :cond_1
    iget-object v6, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 59
    .line 60
    new-instance v0, Ll/v9b;

    .line 61
    .line 62
    move-object v1, p0

    .line 63
    move-object v4, p1

    .line 64
    invoke-direct/range {v0 .. v5}, Ll/v9b;-><init>(Lcom/p1/mobile/putong/core/api/b0;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Relationship;Ljava/util/Map;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V

    .line 65
    .line 66
    .line 67
    const-string p0, "undo_theme_slide"

    .line 68
    .line 69
    const/4 p1, -0x1

    .line 70
    invoke-virtual {v6, p0, p1, v0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    return-object p0
.end method

.method public v3()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/putong/core/api/b0;->R:Lcom/p1/mobile/putong/data/User;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/core/api/b0;->S:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    iput v0, p0, Lcom/p1/mobile/putong/core/api/b0;->Y:I

    .line 8
    .line 9
    return-void
.end method

.method public final w3(ZZLcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/LikeFrom;)Lcom/p1/mobile/putong/data/Relationship;
    .locals 1

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/Relationship;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/Relationship;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Relationship;->localLikeFrom:Ljava/lang/String;

    .line 11
    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    const-string p1, "liked"

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const-string p1, "disliked"

    .line 18
    .line 19
    :goto_0
    invoke-static {p1}, Lcom/p1/mobile/putong/data/RelationshipStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 24
    .line 25
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 28
    .line 29
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {p1, p3}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    new-instance p3, Ljava/util/ArrayList;

    .line 36
    .line 37
    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    .line 38
    .line 39
    .line 40
    if-eqz p2, :cond_2

    .line 41
    .line 42
    const-string p2, "superLiked"

    .line 43
    .line 44
    invoke-static {p2}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    invoke-interface {p3, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    const-string p2, "myLiked"

    .line 52
    .line 53
    invoke-static {p4, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    move-result p4

    .line 57
    if-eqz p4, :cond_1

    .line 58
    .line 59
    invoke-static {p2}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    invoke-interface {p3, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    :cond_1
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 67
    .line 68
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 69
    .line 70
    const-string p4, "superLike"

    .line 71
    .line 72
    invoke-static {p4}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 73
    .line 74
    .line 75
    move-result-object p4

    .line 76
    invoke-virtual {p2, p4}, Ll/lqb;->s4(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p2

    .line 80
    iput-object p2, p0, Lcom/p1/mobile/putong/data/Relationship;->coinSign:Ljava/lang/String;

    .line 81
    .line 82
    :cond_2
    iput-object p3, p0, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 83
    .line 84
    if-eqz p1, :cond_5

    .line 85
    .line 86
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->ussTracker:Ljava/lang/String;

    .line 87
    .line 88
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 89
    .line 90
    .line 91
    move-result p2

    .line 92
    if-nez p2, :cond_3

    .line 93
    .line 94
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->ussTracker:Ljava/lang/String;

    .line 95
    .line 96
    iput-object p2, p0, Lcom/p1/mobile/putong/data/Relationship;->ussTracker:Ljava/lang/String;

    .line 97
    .line 98
    :cond_3
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->ussTags:Lcom/p1/mobile/putong/data/UssTags;

    .line 99
    .line 100
    if-eqz p2, :cond_4

    .line 101
    .line 102
    iget-object p2, p2, Lcom/p1/mobile/putong/data/UssTags;->avatarIdentifier:Ljava/lang/String;

    .line 103
    .line 104
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 105
    .line 106
    .line 107
    move-result p2

    .line 108
    if-nez p2, :cond_4

    .line 109
    .line 110
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->ussTags:Lcom/p1/mobile/putong/data/UssTags;

    .line 111
    .line 112
    iget-object p2, p2, Lcom/p1/mobile/putong/data/UssTags;->avatarIdentifier:Ljava/lang/String;

    .line 113
    .line 114
    iput-object p2, p0, Lcom/p1/mobile/putong/data/Relationship;->avatarIdentifier:Ljava/lang/String;

    .line 115
    .line 116
    :cond_4
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->anonymousLike:Lcom/p1/mobile/putong/data/AnonymousLikeInfo;

    .line 117
    .line 118
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    move-result p2

    .line 122
    if-eqz p2, :cond_5

    .line 123
    .line 124
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->anonymousLike:Lcom/p1/mobile/putong/data/AnonymousLikeInfo;

    .line 125
    .line 126
    iget-object p1, p1, Lcom/p1/mobile/putong/data/AnonymousLikeInfo;->itemId:Ljava/lang/String;

    .line 127
    .line 128
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->anonymousLikeItemId:Ljava/lang/String;

    .line 129
    .line 130
    :cond_5
    return-object p0
.end method

.method public final x3(Lcom/p1/mobile/putong/data/Relationship;Lcom/p1/mobile/putong/data/LikeFrom;)Ljava/lang/Long;
    .locals 2

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/4 p2, 0x0

    .line 8
    const/4 v0, 0x1

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 12
    .line 13
    const-string v1, "superLiked"

    .line 14
    .line 15
    invoke-static {v1}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-interface {p0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    move p0, v0

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    move p0, p2

    .line 28
    :goto_0
    if-eqz p0, :cond_1

    .line 29
    .line 30
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->ig()Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-eqz v1, :cond_1

    .line 43
    .line 44
    move p2, v0

    .line 45
    :cond_1
    invoke-static {p2}, Ll/lqb;->i4(Z)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    iput-object p2, p1, Lcom/p1/mobile/putong/data/Relationship;->consumeType:Ljava/lang/String;

    .line 50
    .line 51
    if-eqz p0, :cond_2

    .line 52
    .line 53
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 54
    .line 55
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 56
    .line 57
    const-string p1, "superLike"

    .line 58
    .line 59
    invoke-static {p1}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-virtual {p0, p2, p1}, Ll/lqb;->s5(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Ljava/lang/Long;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    return-object p0

    .line 68
    :cond_2
    const/4 p0, 0x0

    .line 69
    return-object p0
.end method

.method public final y3()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/api/b0;->Y:I

    .line 2
    .line 3
    return p0
.end method

.method public z3(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;I)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;",
            "I)",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    new-instance v1, Ll/eab;

    .line 4
    .line 5
    invoke-direct {v1, p0, p2, p1}, Ll/eab;-><init>(Lcom/p1/mobile/putong/core/api/b0;ILcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "users/suggested/themeSlide/insert"

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    invoke-virtual {v0, p0, p1, v1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method
