.class public Ll/v670;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/y670;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

.field public b:Ll/n570;

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;

.field public e:Z

.field public f:I

.field public g:Ljava/lang/String;

.field public h:I

.field public i:Z

.field public j:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;"
        }
    .end annotation
.end field

.field public k:Lcom/p1/mobile/putong/data/Links;

.field public l:Ll/x20;

.field public m:Ll/bkj0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/bkj0<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicOperations;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;>;"
        }
    .end annotation
.end field

.field public n:Ll/wyd0;

.field public o:I

.field public p:I

.field public q:Z


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 3

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "-1"

    .line 5
    .line 6
    iput-object v0, p0, Ll/v670;->g:Ljava/lang/String;

    .line 7
    .line 8
    new-instance v0, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Ll/v670;->j:Ljava/util/List;

    .line 14
    .line 15
    new-instance v0, Ll/wyd0;

    .line 16
    .line 17
    new-instance v1, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    const-string v2, "history_city_guide_"

    .line 20
    .line 21
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    const-string v2, ""

    .line 40
    .line 41
    invoke-direct {v0, v1, v2}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Ll/v670;->n:Ll/wyd0;

    .line 45
    .line 46
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 47
    .line 48
    iput-object p1, p0, Ll/v670;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 49
    .line 50
    return-void
.end method

.method public static synthetic A0(Lcom/p1/mobile/putong/feed/data/TopicOperations;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->operationType:Lcom/p1/mobile/putong/feed/data/OperationType;

    .line 2
    .line 3
    const-string v0, "recommend_user"

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

.method public static synthetic C0(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->voiceLiveApiInfo:Ll/ftn0$a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic D0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic E0(Lcom/p1/mobile/putong/feed/data/TopicOperations;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->operationType:Lcom/p1/mobile/putong/feed/data/OperationType;

    .line 2
    .line 3
    const-string v0, "single_topic"

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

.method public static synthetic F0(Lcom/p1/mobile/putong/feed/data/TopicOperations;Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->singleTopic:Lcom/p1/mobile/putong/feed/data/SingleTopic;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/SingleTopic;->momentId:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic G0(Lcom/p1/mobile/putong/feed/data/TopicOperations;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->operationType:Lcom/p1/mobile/putong/feed/data/OperationType;

    .line 2
    .line 3
    const-string v0, "category_topic"

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

.method public static synthetic H0(Ll/v670;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/v670;->p1()V

    return-void
.end method

.method public static synthetic I0(Ll/v670;Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/v670;->u1(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic J0(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

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

.method public static synthetic L0(Ll/pf60;Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    xor-int/lit8 p0, p0, 0x1

    .line 14
    .line 15
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public static synthetic N0(Ll/v670;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/v670;->n1(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic O0(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic P0(Ll/v670;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/v670;->q1(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic e0(Ll/v670;Ljava/util/List;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/v670;->m1(Ljava/util/List;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic f0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic g0(Ll/v670;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/v670;->o1(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic h0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic i0(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic j0(Ll/v670;Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/v670;->t1(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method private j1()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

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
    iget-object p0, p0, Ll/v670;->c:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public static synthetic k0(Lcom/p1/mobile/putong/feed/data/TopicOperations;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->operationType:Lcom/p1/mobile/putong/feed/data/OperationType;

    .line 2
    .line 3
    const-string v0, "recommend_topic"

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

.method public static synthetic l0(Ll/v670;Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/v670;->s1(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic m0(Ll/v670;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/v670;->r1(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic n0(Ll/v670;Ljava/util/List;ZLcom/p1/mobile/putong/data/User;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/v670;->x1(Ljava/util/List;ZLcom/p1/mobile/putong/data/User;Ljava/util/List;)V

    return-void
.end method

.method public static synthetic o0(Lcom/p1/mobile/putong/feed/data/TopicOperations;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->operationType:Lcom/p1/mobile/putong/feed/data/OperationType;

    .line 2
    .line 3
    const-string v1, "group"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    invoke-static {}, Ll/cmg;->O()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->operationType:Lcom/p1/mobile/putong/feed/data/OperationType;

    .line 18
    .line 19
    const-string v0, "single_group"

    .line 20
    .line 21
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    goto :goto_1

    .line 30
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 31
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

.method private synthetic o1(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/y670;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/y670;->l()V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/v670;->l:Ll/x20;

    .line 9
    .line 10
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    iget-object p1, p0, Ll/v670;->l:Ll/x20;

    .line 17
    .line 18
    invoke-interface {p1}, Ll/x20;->call()V

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Ll/v670;->b:Ll/n570;

    .line 22
    .line 23
    instance-of p1, p1, Ll/hv00;

    .line 24
    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    invoke-static {}, Ll/mrb0;->j()Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    new-instance v0, Ll/q670;

    .line 36
    .line 37
    invoke-direct {v0}, Ll/q670;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    new-instance v0, Ll/r670;

    .line 49
    .line 50
    invoke-direct {v0, p0}, Ll/r670;-><init>(Ll/v670;)V

    .line 51
    .line 52
    .line 53
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 58
    .line 59
    .line 60
    :cond_1
    return-void
.end method

.method public static synthetic p0(Ll/v670;Ljava/util/List;IZLcom/p1/mobile/putong/data/User;Ll/ftn0$a;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/v670;->z1(Ljava/util/List;IZLcom/p1/mobile/putong/data/User;Ll/ftn0$a;)V

    return-void
.end method

.method private synthetic p1()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/y670;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/y670;->m()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic q0(Lcom/p1/mobile/putong/data/Counter;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Counter;->moments:Lcom/p1/mobile/putong/data/CouterMoments;

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/data/CouterMoments;->unreadFeeds:I

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method private synthetic q1(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    move-object v0, p1

    .line 4
    check-cast v0, Ll/y670;

    .line 5
    .line 6
    iget-boolean v0, v0, Ll/y670;->f:Z

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    check-cast p1, Ll/y670;

    .line 11
    .line 12
    invoke-virtual {p1}, Ll/y670;->B()Z

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object p1, p0, Ll/v670;->b:Ll/n570;

    .line 16
    .line 17
    instance-of p1, p1, Ll/vpc0;

    .line 18
    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    iget-object p1, p0, Ll/v670;->j:Ljava/util/List;

    .line 22
    .line 23
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-nez p1, :cond_1

    .line 28
    .line 29
    iget-object p0, p0, Ll/v670;->b:Ll/n570;

    .line 30
    .line 31
    check-cast p0, Ll/vpc0;

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/vpc0;->S()V

    .line 34
    .line 35
    .line 36
    :cond_1
    return-void
.end method

.method public static synthetic r0(Lcom/p1/mobile/putong/feed/data/TopicOperations;Lcom/p1/mobile/putong/feed/data/TopicMoment;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->singleTopic:Lcom/p1/mobile/putong/feed/data/SingleTopic;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/SingleTopic;->topicId:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method private synthetic r1(Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    move-object p1, p0

    .line 4
    check-cast p1, Ll/y670;

    .line 5
    .line 6
    iget-boolean p1, p1, Ll/y670;->f:Z

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    check-cast p0, Ll/y670;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/y670;->B()Z

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public static synthetic s0(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->feedVoiceUserEntryInfo:Ll/pbi;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic t0(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic u0(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

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

.method public static synthetic x0(Ll/v670;Ljava/util/List;IZLcom/p1/mobile/putong/data/User;Ll/pbi;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/v670;->v1(Ljava/util/List;IZLcom/p1/mobile/putong/data/User;Ll/pbi;)V

    return-void
.end method

.method public static synthetic y0(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public static synthetic z0(Lcom/p1/mobile/putong/feed/data/TopicOperations;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->operationType:Lcom/p1/mobile/putong/feed/data/OperationType;

    .line 2
    .line 3
    const-string v0, "moment_viewer"

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


# virtual methods
.method public final B1(Ljava/util/List;ZLcom/p1/mobile/putong/data/User;)V
    .locals 32
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;Z",
            "Lcom/p1/mobile/putong/data/User;",
            ")V"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    new-instance v4, Ll/w570;

    .line 6
    .line 7
    invoke-direct {v4, v0}, Ll/w570;-><init>(Ll/v670;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v1, v4}, Ll/jyb;->d0(Ljava/util/List;Ll/qcj;)I

    .line 11
    .line 12
    .line 13
    iget-object v4, v0, Ll/v670;->b:Ll/n570;

    .line 14
    .line 15
    instance-of v5, v4, Ll/hu60;

    .line 16
    .line 17
    const-wide/16 v6, 0x0

    .line 18
    .line 19
    const-string v8, ""

    .line 20
    .line 21
    const/4 v9, 0x1

    .line 22
    if-nez v5, :cond_0

    .line 23
    .line 24
    instance-of v4, v4, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/a;

    .line 25
    .line 26
    if-eqz v4, :cond_4

    .line 27
    .line 28
    :cond_0
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 29
    .line 30
    .line 31
    move-result-object v4

    .line 32
    move-object v5, v8

    .line 33
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 34
    .line 35
    .line 36
    move-result v10

    .line 37
    if-eqz v10, :cond_4

    .line 38
    .line 39
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v10

    .line 43
    check-cast v10, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 44
    .line 45
    iget-wide v11, v10, Lcom/p1/mobile/putong/feed/data/Moment;->createdTime:D

    .line 46
    .line 47
    double-to-long v11, v11

    .line 48
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 49
    .line 50
    .line 51
    move-result-wide v13

    .line 52
    invoke-static {v11, v12, v13, v14}, Ll/p6i;->l(JJ)Z

    .line 53
    .line 54
    .line 55
    move-result v11

    .line 56
    if-nez v11, :cond_2

    .line 57
    .line 58
    iget-wide v11, v10, Lcom/p1/mobile/putong/feed/data/Moment;->createdTime:D

    .line 59
    .line 60
    cmpl-double v11, v11, v6

    .line 61
    .line 62
    if-nez v11, :cond_1

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_1
    new-instance v11, Ljava/lang/StringBuilder;

    .line 66
    .line 67
    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    .line 68
    .line 69
    .line 70
    iget-wide v12, v10, Lcom/p1/mobile/putong/feed/data/Moment;->createdTime:D

    .line 71
    .line 72
    double-to-long v12, v12

    .line 73
    invoke-static {v12, v13}, Ll/p6i;->c(J)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v12

    .line 77
    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    const-string v12, "/"

    .line 81
    .line 82
    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    iget-wide v12, v10, Lcom/p1/mobile/putong/feed/data/Moment;->createdTime:D

    .line 86
    .line 87
    double-to-long v12, v12

    .line 88
    invoke-static {v12, v13}, Ll/p6i;->d(J)I

    .line 89
    .line 90
    .line 91
    move-result v12

    .line 92
    add-int/2addr v12, v9

    .line 93
    invoke-static {v12, v9}, Ll/ksg;->m(IZ)Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v12

    .line 97
    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v11

    .line 104
    goto :goto_2

    .line 105
    :cond_2
    :goto_1
    invoke-virtual {v0}, Ll/v670;->a1()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v11

    .line 109
    :goto_2
    invoke-virtual {v11, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    move-result v12

    .line 113
    if-nez v12, :cond_3

    .line 114
    .line 115
    iput-object v11, v10, Lcom/p1/mobile/putong/feed/data/Moment;->feedTime:Ljava/lang/String;

    .line 116
    .line 117
    move-object v5, v11

    .line 118
    goto :goto_0

    .line 119
    :cond_3
    iput-object v8, v10, Lcom/p1/mobile/putong/feed/data/Moment;->feedTime:Ljava/lang/String;

    .line 120
    .line 121
    goto :goto_0

    .line 122
    :cond_4
    new-instance v4, Ljava/util/ArrayList;

    .line 123
    .line 124
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 125
    .line 126
    .line 127
    new-instance v5, Ljava/util/HashMap;

    .line 128
    .line 129
    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 130
    .line 131
    .line 132
    iget-object v10, v0, Ll/v670;->m:Ll/bkj0;

    .line 133
    .line 134
    invoke-static {v10}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 135
    .line 136
    .line 137
    move-result v10

    .line 138
    const/4 v11, -0x1

    .line 139
    if-eqz v10, :cond_7

    .line 140
    .line 141
    iget-object v10, v0, Ll/v670;->m:Ll/bkj0;

    .line 142
    .line 143
    iget-object v10, v10, Ll/bkj0;->a:Ljava/lang/Object;

    .line 144
    .line 145
    check-cast v10, Ljava/util/Collection;

    .line 146
    .line 147
    invoke-static {v10}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 148
    .line 149
    .line 150
    move-result v10

    .line 151
    if-nez v10, :cond_7

    .line 152
    .line 153
    move v13, v11

    .line 154
    const/4 v10, 0x0

    .line 155
    :goto_3
    iget-object v14, v0, Ll/v670;->m:Ll/bkj0;

    .line 156
    .line 157
    iget-object v14, v14, Ll/bkj0;->a:Ljava/lang/Object;

    .line 158
    .line 159
    check-cast v14, Ljava/util/List;

    .line 160
    .line 161
    invoke-interface {v14}, Ljava/util/List;->size()I

    .line 162
    .line 163
    .line 164
    move-result v14

    .line 165
    if-ge v10, v14, :cond_7

    .line 166
    .line 167
    iget-object v14, v0, Ll/v670;->m:Ll/bkj0;

    .line 168
    .line 169
    iget-object v14, v14, Ll/bkj0;->a:Ljava/lang/Object;

    .line 170
    .line 171
    check-cast v14, Ljava/util/List;

    .line 172
    .line 173
    invoke-interface {v14, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 174
    .line 175
    .line 176
    move-result-object v14

    .line 177
    check-cast v14, Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 178
    .line 179
    iget-object v15, v14, Lcom/p1/mobile/putong/feed/data/TopicOperations;->operationType:Lcom/p1/mobile/putong/feed/data/OperationType;

    .line 180
    .line 181
    move-wide/from16 v16, v6

    .line 182
    .line 183
    const-string v6, "change_city"

    .line 184
    .line 185
    invoke-static {v15, v6}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 186
    .line 187
    .line 188
    move-result v6

    .line 189
    if-nez v6, :cond_5

    .line 190
    .line 191
    iget-object v6, v14, Lcom/p1/mobile/putong/feed/data/TopicOperations;->operationType:Lcom/p1/mobile/putong/feed/data/OperationType;

    .line 192
    .line 193
    const-string v7, "new_user"

    .line 194
    .line 195
    invoke-static {v6, v7}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 196
    .line 197
    .line 198
    move-result v6

    .line 199
    if-nez v6, :cond_5

    .line 200
    .line 201
    iget-object v6, v14, Lcom/p1/mobile/putong/feed/data/TopicOperations;->operationType:Lcom/p1/mobile/putong/feed/data/OperationType;

    .line 202
    .line 203
    const-string v7, "man_made"

    .line 204
    .line 205
    invoke-static {v6, v7}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 206
    .line 207
    .line 208
    move-result v6

    .line 209
    if-nez v6, :cond_5

    .line 210
    .line 211
    iget-object v6, v14, Lcom/p1/mobile/putong/feed/data/TopicOperations;->operationType:Lcom/p1/mobile/putong/feed/data/OperationType;

    .line 212
    .line 213
    const-string v7, "album_num_inc"

    .line 214
    .line 215
    invoke-static {v6, v7}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 216
    .line 217
    .line 218
    move-result v6

    .line 219
    if-eqz v6, :cond_6

    .line 220
    .line 221
    :cond_5
    iget v6, v14, Lcom/p1/mobile/putong/feed/data/TopicOperations;->position:I

    .line 222
    .line 223
    if-eq v6, v13, :cond_6

    .line 224
    .line 225
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 226
    .line 227
    .line 228
    move-result-object v7

    .line 229
    invoke-interface {v5, v7, v14}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 230
    .line 231
    .line 232
    move v13, v6

    .line 233
    :cond_6
    add-int/lit8 v10, v10, 0x1

    .line 234
    .line 235
    move-wide/from16 v6, v16

    .line 236
    .line 237
    goto :goto_3

    .line 238
    :cond_7
    move-wide/from16 v16, v6

    .line 239
    .line 240
    new-instance v6, Ljava/util/HashMap;

    .line 241
    .line 242
    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 243
    .line 244
    .line 245
    iget-object v7, v0, Ll/v670;->m:Ll/bkj0;

    .line 246
    .line 247
    invoke-static {v7}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 248
    .line 249
    .line 250
    move-result v7

    .line 251
    if-eqz v7, :cond_9

    .line 252
    .line 253
    iget-object v7, v0, Ll/v670;->m:Ll/bkj0;

    .line 254
    .line 255
    iget-object v7, v7, Ll/bkj0;->a:Ljava/lang/Object;

    .line 256
    .line 257
    check-cast v7, Ljava/util/Collection;

    .line 258
    .line 259
    invoke-static {v7}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 260
    .line 261
    .line 262
    move-result v7

    .line 263
    if-nez v7, :cond_9

    .line 264
    .line 265
    move v10, v11

    .line 266
    const/4 v7, 0x0

    .line 267
    :goto_4
    iget-object v13, v0, Ll/v670;->m:Ll/bkj0;

    .line 268
    .line 269
    iget-object v13, v13, Ll/bkj0;->a:Ljava/lang/Object;

    .line 270
    .line 271
    check-cast v13, Ljava/util/List;

    .line 272
    .line 273
    invoke-interface {v13}, Ljava/util/List;->size()I

    .line 274
    .line 275
    .line 276
    move-result v13

    .line 277
    if-ge v7, v13, :cond_9

    .line 278
    .line 279
    iget-object v13, v0, Ll/v670;->m:Ll/bkj0;

    .line 280
    .line 281
    iget-object v13, v13, Ll/bkj0;->a:Ljava/lang/Object;

    .line 282
    .line 283
    check-cast v13, Ljava/util/List;

    .line 284
    .line 285
    invoke-interface {v13, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 286
    .line 287
    .line 288
    move-result-object v13

    .line 289
    check-cast v13, Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 290
    .line 291
    iget-object v14, v13, Lcom/p1/mobile/putong/feed/data/TopicOperations;->operationType:Lcom/p1/mobile/putong/feed/data/OperationType;

    .line 292
    .line 293
    const-string v15, "nearby_online"

    .line 294
    .line 295
    invoke-static {v14, v15}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 296
    .line 297
    .line 298
    move-result v14

    .line 299
    if-eqz v14, :cond_8

    .line 300
    .line 301
    iget v14, v13, Lcom/p1/mobile/putong/feed/data/TopicOperations;->position:I

    .line 302
    .line 303
    if-eq v14, v10, :cond_8

    .line 304
    .line 305
    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 306
    .line 307
    .line 308
    move-result-object v10

    .line 309
    invoke-interface {v6, v10, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 310
    .line 311
    .line 312
    move v10, v14

    .line 313
    :cond_8
    add-int/lit8 v7, v7, 0x1

    .line 314
    .line 315
    goto :goto_4

    .line 316
    :cond_9
    new-instance v7, Ljava/util/HashMap;

    .line 317
    .line 318
    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 319
    .line 320
    .line 321
    invoke-static {}, Ll/cmg;->E()Z

    .line 322
    .line 323
    .line 324
    move-result v10

    .line 325
    if-eqz v10, :cond_b

    .line 326
    .line 327
    iget-object v10, v0, Ll/v670;->m:Ll/bkj0;

    .line 328
    .line 329
    invoke-static {v10}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 330
    .line 331
    .line 332
    move-result v10

    .line 333
    if-eqz v10, :cond_b

    .line 334
    .line 335
    iget-object v10, v0, Ll/v670;->m:Ll/bkj0;

    .line 336
    .line 337
    iget-object v10, v10, Ll/bkj0;->a:Ljava/lang/Object;

    .line 338
    .line 339
    check-cast v10, Ljava/util/Collection;

    .line 340
    .line 341
    invoke-static {v10}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 342
    .line 343
    .line 344
    move-result v10

    .line 345
    if-nez v10, :cond_b

    .line 346
    .line 347
    const/4 v10, 0x0

    .line 348
    :goto_5
    iget-object v13, v0, Ll/v670;->m:Ll/bkj0;

    .line 349
    .line 350
    iget-object v13, v13, Ll/bkj0;->a:Ljava/lang/Object;

    .line 351
    .line 352
    check-cast v13, Ljava/util/List;

    .line 353
    .line 354
    invoke-interface {v13}, Ljava/util/List;->size()I

    .line 355
    .line 356
    .line 357
    move-result v13

    .line 358
    if-ge v10, v13, :cond_b

    .line 359
    .line 360
    iget-object v13, v0, Ll/v670;->m:Ll/bkj0;

    .line 361
    .line 362
    iget-object v13, v13, Ll/bkj0;->a:Ljava/lang/Object;

    .line 363
    .line 364
    check-cast v13, Ljava/util/List;

    .line 365
    .line 366
    invoke-interface {v13, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 367
    .line 368
    .line 369
    move-result-object v13

    .line 370
    check-cast v13, Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 371
    .line 372
    iget-object v14, v13, Lcom/p1/mobile/putong/feed/data/TopicOperations;->operationType:Lcom/p1/mobile/putong/feed/data/OperationType;

    .line 373
    .line 374
    const-string v15, "state_square_entrance"

    .line 375
    .line 376
    invoke-static {v14, v15}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 377
    .line 378
    .line 379
    move-result v14

    .line 380
    if-eqz v14, :cond_a

    .line 381
    .line 382
    iget v14, v13, Lcom/p1/mobile/putong/feed/data/TopicOperations;->position:I

    .line 383
    .line 384
    if-eq v14, v11, :cond_a

    .line 385
    .line 386
    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 387
    .line 388
    .line 389
    move-result-object v11

    .line 390
    invoke-interface {v7, v11, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 391
    .line 392
    .line 393
    move v11, v14

    .line 394
    :cond_a
    add-int/lit8 v10, v10, 0x1

    .line 395
    .line 396
    goto :goto_5

    .line 397
    :cond_b
    iget-object v10, v0, Ll/v670;->m:Ll/bkj0;

    .line 398
    .line 399
    invoke-static {v10}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 400
    .line 401
    .line 402
    move-result v10

    .line 403
    if-eqz v10, :cond_e

    .line 404
    .line 405
    iget-object v10, v0, Ll/v670;->m:Ll/bkj0;

    .line 406
    .line 407
    iget-object v10, v10, Ll/bkj0;->a:Ljava/lang/Object;

    .line 408
    .line 409
    check-cast v10, Ljava/util/Collection;

    .line 410
    .line 411
    invoke-static {v10}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 412
    .line 413
    .line 414
    move-result v10

    .line 415
    if-nez v10, :cond_e

    .line 416
    .line 417
    iget-object v10, v0, Ll/v670;->m:Ll/bkj0;

    .line 418
    .line 419
    iget-object v10, v10, Ll/bkj0;->a:Ljava/lang/Object;

    .line 420
    .line 421
    check-cast v10, Ljava/util/Collection;

    .line 422
    .line 423
    new-instance v13, Ll/x570;

    .line 424
    .line 425
    invoke-direct {v13}, Ll/x570;-><init>()V

    .line 426
    .line 427
    .line 428
    invoke-static {v10, v13}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 429
    .line 430
    .line 431
    move-result-object v10

    .line 432
    check-cast v10, Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 433
    .line 434
    iget-object v13, v0, Ll/v670;->m:Ll/bkj0;

    .line 435
    .line 436
    iget-object v13, v13, Ll/bkj0;->a:Ljava/lang/Object;

    .line 437
    .line 438
    check-cast v13, Ljava/util/Collection;

    .line 439
    .line 440
    new-instance v14, Ll/y570;

    .line 441
    .line 442
    invoke-direct {v14}, Ll/y570;-><init>()V

    .line 443
    .line 444
    .line 445
    invoke-static {v13, v14}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 446
    .line 447
    .line 448
    move-result-object v13

    .line 449
    check-cast v13, Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 450
    .line 451
    iget-object v14, v0, Ll/v670;->m:Ll/bkj0;

    .line 452
    .line 453
    iget-object v14, v14, Ll/bkj0;->a:Ljava/lang/Object;

    .line 454
    .line 455
    check-cast v14, Ljava/util/Collection;

    .line 456
    .line 457
    new-instance v15, Ll/a670;

    .line 458
    .line 459
    invoke-direct {v15}, Ll/a670;-><init>()V

    .line 460
    .line 461
    .line 462
    invoke-static {v14, v15}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 463
    .line 464
    .line 465
    move-result-object v14

    .line 466
    check-cast v14, Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 467
    .line 468
    iget-object v15, v0, Ll/v670;->m:Ll/bkj0;

    .line 469
    .line 470
    iget-object v15, v15, Ll/bkj0;->a:Ljava/lang/Object;

    .line 471
    .line 472
    check-cast v15, Ljava/util/Collection;

    .line 473
    .line 474
    const/16 v18, 0x0

    .line 475
    .line 476
    new-instance v11, Ll/b670;

    .line 477
    .line 478
    invoke-direct {v11}, Ll/b670;-><init>()V

    .line 479
    .line 480
    .line 481
    invoke-static {v15, v11}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 482
    .line 483
    .line 484
    move-result-object v11

    .line 485
    check-cast v11, Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 486
    .line 487
    invoke-static {}, Ll/cmg;->N()Z

    .line 488
    .line 489
    .line 490
    move-result v15

    .line 491
    if-eqz v15, :cond_c

    .line 492
    .line 493
    iget-object v15, v0, Ll/v670;->m:Ll/bkj0;

    .line 494
    .line 495
    iget-object v15, v15, Ll/bkj0;->a:Ljava/lang/Object;

    .line 496
    .line 497
    check-cast v15, Ljava/util/Collection;

    .line 498
    .line 499
    new-instance v12, Ll/c670;

    .line 500
    .line 501
    invoke-direct {v12}, Ll/c670;-><init>()V

    .line 502
    .line 503
    .line 504
    invoke-static {v15, v12}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 505
    .line 506
    .line 507
    move-result-object v12

    .line 508
    check-cast v12, Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 509
    .line 510
    goto :goto_6

    .line 511
    :cond_c
    move-object/from16 v12, v18

    .line 512
    .line 513
    :goto_6
    invoke-static {}, Ll/cmg;->T()Z

    .line 514
    .line 515
    .line 516
    move-result v15

    .line 517
    if-eqz v15, :cond_d

    .line 518
    .line 519
    iget-object v15, v0, Ll/v670;->m:Ll/bkj0;

    .line 520
    .line 521
    iget-object v15, v15, Ll/bkj0;->a:Ljava/lang/Object;

    .line 522
    .line 523
    check-cast v15, Ljava/util/Collection;

    .line 524
    .line 525
    move/from16 v19, v9

    .line 526
    .line 527
    new-instance v9, Ll/d670;

    .line 528
    .line 529
    invoke-direct {v9}, Ll/d670;-><init>()V

    .line 530
    .line 531
    .line 532
    invoke-static {v15, v9}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 533
    .line 534
    .line 535
    move-result-object v9

    .line 536
    check-cast v9, Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 537
    .line 538
    goto :goto_7

    .line 539
    :cond_d
    move/from16 v19, v9

    .line 540
    .line 541
    move-object/from16 v9, v18

    .line 542
    .line 543
    goto :goto_7

    .line 544
    :cond_e
    move/from16 v19, v9

    .line 545
    .line 546
    const/16 v18, 0x0

    .line 547
    .line 548
    move-object/from16 v9, v18

    .line 549
    .line 550
    move-object v10, v9

    .line 551
    move-object v11, v10

    .line 552
    move-object v12, v11

    .line 553
    move-object v13, v12

    .line 554
    move-object v14, v13

    .line 555
    :goto_7
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 556
    .line 557
    .line 558
    move-result v15

    .line 559
    move-object v2, v8

    .line 560
    move-object/from16 v26, v2

    .line 561
    .line 562
    const/4 v8, 0x0

    .line 563
    const/16 v27, 0x0

    .line 564
    .line 565
    :goto_8
    if-ge v8, v15, :cond_2f

    .line 566
    .line 567
    invoke-static {}, Ll/cch;->b()Z

    .line 568
    .line 569
    .line 570
    move-result v20

    .line 571
    move/from16 v28, v15

    .line 572
    .line 573
    if-eqz v20, :cond_f

    .line 574
    .line 575
    iget v15, v0, Ll/v670;->h:I

    .line 576
    .line 577
    const/16 v3, 0xc

    .line 578
    .line 579
    if-ne v15, v3, :cond_f

    .line 580
    .line 581
    invoke-static {}, Ll/cch;->a()I

    .line 582
    .line 583
    .line 584
    move-result v3

    .line 585
    if-ne v8, v3, :cond_f

    .line 586
    .line 587
    new-instance v2, Ll/to00;

    .line 588
    .line 589
    invoke-interface {v1, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 590
    .line 591
    .line 592
    move-result-object v1

    .line 593
    check-cast v1, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 594
    .line 595
    invoke-direct {v2, v1, v8}, Ll/to00;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;I)V

    .line 596
    .line 597
    .line 598
    invoke-interface {v4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 599
    .line 600
    .line 601
    goto/16 :goto_18

    .line 602
    .line 603
    :cond_f
    iget-object v3, v0, Ll/v670;->m:Ll/bkj0;

    .line 604
    .line 605
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 606
    .line 607
    .line 608
    move-result v3

    .line 609
    if-eqz v3, :cond_19

    .line 610
    .line 611
    iget-object v3, v0, Ll/v670;->m:Ll/bkj0;

    .line 612
    .line 613
    iget-object v3, v3, Ll/bkj0;->a:Ljava/lang/Object;

    .line 614
    .line 615
    check-cast v3, Ljava/util/Collection;

    .line 616
    .line 617
    invoke-static {v3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 618
    .line 619
    .line 620
    move-result v3

    .line 621
    if-nez v3, :cond_19

    .line 622
    .line 623
    invoke-static {v9}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 624
    .line 625
    .line 626
    move-result v3

    .line 627
    if-eqz v3, :cond_10

    .line 628
    .line 629
    iget v3, v9, Lcom/p1/mobile/putong/feed/data/TopicOperations;->position:I

    .line 630
    .line 631
    add-int/lit8 v3, v3, -0x1

    .line 632
    .line 633
    if-ne v8, v3, :cond_10

    .line 634
    .line 635
    new-instance v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;

    .line 636
    .line 637
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/Moment;->new_()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 638
    .line 639
    .line 640
    move-result-object v15

    .line 641
    move-object/from16 v21, v2

    .line 642
    .line 643
    iget-object v2, v9, Lcom/p1/mobile/putong/feed/data/TopicOperations;->momentViewer:Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 644
    .line 645
    invoke-direct {v3, v15, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentViewerBox;)V

    .line 646
    .line 647
    .line 648
    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 649
    .line 650
    .line 651
    goto :goto_9

    .line 652
    :cond_10
    move-object/from16 v21, v2

    .line 653
    .line 654
    :goto_9
    invoke-static {v12}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 655
    .line 656
    .line 657
    move-result v2

    .line 658
    if-eqz v2, :cond_12

    .line 659
    .line 660
    iget v2, v12, Lcom/p1/mobile/putong/feed/data/TopicOperations;->position:I

    .line 661
    .line 662
    add-int/lit8 v2, v2, -0x1

    .line 663
    .line 664
    if-ne v8, v2, :cond_12

    .line 665
    .line 666
    iget-object v2, v12, Lcom/p1/mobile/putong/feed/data/TopicOperations;->group:Lcom/p1/mobile/putong/feed/data/TopicOperationsGroup;

    .line 667
    .line 668
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/TopicOperationsGroup;->momentId:Ljava/lang/String;

    .line 669
    .line 670
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 671
    .line 672
    .line 673
    move-result v2

    .line 674
    if-eqz v2, :cond_11

    .line 675
    .line 676
    iget-object v2, v12, Lcom/p1/mobile/putong/feed/data/TopicOperations;->singleGroup:Lcom/p1/mobile/putong/feed/data/TopicOperationsGroup;

    .line 677
    .line 678
    iget-object v3, v2, Lcom/p1/mobile/putong/feed/data/TopicOperationsGroup;->momentId:Ljava/lang/String;

    .line 679
    .line 680
    new-instance v15, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;

    .line 681
    .line 682
    move-object/from16 v29, v9

    .line 683
    .line 684
    new-instance v9, Ll/pf60;

    .line 685
    .line 686
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 687
    .line 688
    move-object/from16 v30, v11

    .line 689
    .line 690
    iget-object v11, v2, Lcom/p1/mobile/putong/feed/data/TopicOperationsGroup;->groupId:Ljava/lang/String;

    .line 691
    .line 692
    invoke-virtual {v1, v11}, Ll/jka;->u7(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/Group;

    .line 693
    .line 694
    .line 695
    move-result-object v1

    .line 696
    invoke-direct {v9, v2, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 697
    .line 698
    .line 699
    iget-object v1, v0, Ll/v670;->m:Ll/bkj0;

    .line 700
    .line 701
    iget-object v1, v1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 702
    .line 703
    check-cast v1, Ljava/util/Collection;

    .line 704
    .line 705
    new-instance v2, Ll/e670;

    .line 706
    .line 707
    invoke-direct {v2, v3}, Ll/e670;-><init>(Ljava/lang/String;)V

    .line 708
    .line 709
    .line 710
    invoke-static {v1, v2}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 711
    .line 712
    .line 713
    move-result-object v1

    .line 714
    check-cast v1, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 715
    .line 716
    invoke-direct {v15, v9, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;-><init>(Ll/pf60;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 717
    .line 718
    .line 719
    invoke-interface {v4, v15}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 720
    .line 721
    .line 722
    goto :goto_a

    .line 723
    :cond_11
    move-object/from16 v29, v9

    .line 724
    .line 725
    move-object/from16 v30, v11

    .line 726
    .line 727
    iget-object v1, v12, Lcom/p1/mobile/putong/feed/data/TopicOperations;->group:Lcom/p1/mobile/putong/feed/data/TopicOperationsGroup;

    .line 728
    .line 729
    iget-object v2, v1, Lcom/p1/mobile/putong/feed/data/TopicOperationsGroup;->momentId:Ljava/lang/String;

    .line 730
    .line 731
    new-instance v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;

    .line 732
    .line 733
    new-instance v9, Ll/pf60;

    .line 734
    .line 735
    sget-object v11, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 736
    .line 737
    iget-object v15, v1, Lcom/p1/mobile/putong/feed/data/TopicOperationsGroup;->groupId:Ljava/lang/String;

    .line 738
    .line 739
    invoke-virtual {v11, v15}, Ll/jka;->u7(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/Group;

    .line 740
    .line 741
    .line 742
    move-result-object v11

    .line 743
    invoke-direct {v9, v1, v11}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 744
    .line 745
    .line 746
    iget-object v1, v0, Ll/v670;->m:Ll/bkj0;

    .line 747
    .line 748
    iget-object v1, v1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 749
    .line 750
    check-cast v1, Ljava/util/Collection;

    .line 751
    .line 752
    new-instance v11, Ll/f670;

    .line 753
    .line 754
    invoke-direct {v11, v2}, Ll/f670;-><init>(Ljava/lang/String;)V

    .line 755
    .line 756
    .line 757
    invoke-static {v1, v11}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 758
    .line 759
    .line 760
    move-result-object v1

    .line 761
    check-cast v1, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 762
    .line 763
    invoke-direct {v3, v9, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;-><init>(Ll/pf60;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 764
    .line 765
    .line 766
    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 767
    .line 768
    .line 769
    goto :goto_a

    .line 770
    :cond_12
    move-object/from16 v29, v9

    .line 771
    .line 772
    move-object/from16 v30, v11

    .line 773
    .line 774
    :goto_a
    invoke-virtual {v0, v8, v10, v13, v14}, Ll/v670;->V0(ILcom/p1/mobile/putong/feed/data/TopicOperations;Lcom/p1/mobile/putong/feed/data/TopicOperations;Lcom/p1/mobile/putong/feed/data/TopicOperations;)Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;

    .line 775
    .line 776
    .line 777
    move-result-object v1

    .line 778
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 779
    .line 780
    .line 781
    move-result v2

    .line 782
    if-eqz v2, :cond_13

    .line 783
    .line 784
    invoke-interface {v4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 785
    .line 786
    .line 787
    :cond_13
    add-int/lit8 v1, v8, 0x1

    .line 788
    .line 789
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 790
    .line 791
    .line 792
    move-result-object v2

    .line 793
    invoke-interface {v5, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 794
    .line 795
    .line 796
    move-result-object v2

    .line 797
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 798
    .line 799
    .line 800
    move-result v2

    .line 801
    if-eqz v2, :cond_14

    .line 802
    .line 803
    new-instance v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;

    .line 804
    .line 805
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/Moment;->new_()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 806
    .line 807
    .line 808
    move-result-object v3

    .line 809
    new-instance v9, Ll/pf60;

    .line 810
    .line 811
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 812
    .line 813
    .line 814
    move-result-object v11

    .line 815
    invoke-interface {v5, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 816
    .line 817
    .line 818
    move-result-object v11

    .line 819
    check-cast v11, Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 820
    .line 821
    iget-object v15, v0, Ll/v670;->m:Ll/bkj0;

    .line 822
    .line 823
    iget-object v15, v15, Ll/bkj0;->b:Ljava/lang/Object;

    .line 824
    .line 825
    check-cast v15, Ljava/util/List;

    .line 826
    .line 827
    invoke-direct {v9, v11, v15}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 828
    .line 829
    .line 830
    invoke-direct {v2, v3, v9}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;Ll/pf60;)V

    .line 831
    .line 832
    .line 833
    invoke-interface {v4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 834
    .line 835
    .line 836
    :cond_14
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 837
    .line 838
    .line 839
    move-result-object v2

    .line 840
    invoke-interface {v6, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 841
    .line 842
    .line 843
    move-result-object v2

    .line 844
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 845
    .line 846
    .line 847
    move-result v2

    .line 848
    if-eqz v2, :cond_15

    .line 849
    .line 850
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 851
    .line 852
    .line 853
    move-result-object v2

    .line 854
    invoke-interface {v6, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 855
    .line 856
    .line 857
    move-result-object v2

    .line 858
    check-cast v2, Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 859
    .line 860
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/TopicOperations;->nearbyOnline:Lcom/p1/mobile/putong/feed/data/NearbyOnline;

    .line 861
    .line 862
    iget v2, v2, Lcom/p1/mobile/putong/feed/data/NearbyOnline;->userCount:I

    .line 863
    .line 864
    const/4 v3, 0x3

    .line 865
    if-lt v2, v3, :cond_15

    .line 866
    .line 867
    new-instance v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;

    .line 868
    .line 869
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/Moment;->new_()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 870
    .line 871
    .line 872
    move-result-object v3

    .line 873
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 874
    .line 875
    .line 876
    move-result-object v9

    .line 877
    invoke-interface {v6, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 878
    .line 879
    .line 880
    move-result-object v9

    .line 881
    check-cast v9, Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 882
    .line 883
    iget-object v9, v9, Lcom/p1/mobile/putong/feed/data/TopicOperations;->nearbyOnline:Lcom/p1/mobile/putong/feed/data/NearbyOnline;

    .line 884
    .line 885
    invoke-direct {v2, v3, v9}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/NearbyOnline;)V

    .line 886
    .line 887
    .line 888
    invoke-interface {v4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 889
    .line 890
    .line 891
    :cond_15
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 892
    .line 893
    .line 894
    move-result-object v2

    .line 895
    invoke-interface {v7, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 896
    .line 897
    .line 898
    move-result-object v2

    .line 899
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 900
    .line 901
    .line 902
    move-result v2

    .line 903
    if-eqz v2, :cond_16

    .line 904
    .line 905
    new-instance v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;

    .line 906
    .line 907
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/Moment;->new_()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 908
    .line 909
    .line 910
    move-result-object v3

    .line 911
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 912
    .line 913
    .line 914
    move-result-object v1

    .line 915
    invoke-interface {v7, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 916
    .line 917
    .line 918
    move-result-object v1

    .line 919
    check-cast v1, Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 920
    .line 921
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 922
    .line 923
    .line 924
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->stateSquareEntrance:Lcom/p1/mobile/putong/feed/data/StateSquareEntrance;

    .line 925
    .line 926
    invoke-direct {v2, v3, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/StateSquareEntrance;)V

    .line 927
    .line 928
    .line 929
    invoke-interface {v4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 930
    .line 931
    .line 932
    :cond_16
    invoke-static/range {v30 .. v30}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 933
    .line 934
    .line 935
    move-result v1

    .line 936
    move-object/from16 v11, v30

    .line 937
    .line 938
    if-eqz v1, :cond_17

    .line 939
    .line 940
    iget v1, v11, Lcom/p1/mobile/putong/feed/data/TopicOperations;->position:I

    .line 941
    .line 942
    add-int/lit8 v1, v1, -0x1

    .line 943
    .line 944
    if-ne v8, v1, :cond_17

    .line 945
    .line 946
    new-instance v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;

    .line 947
    .line 948
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/Moment;->new_()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 949
    .line 950
    .line 951
    move-result-object v2

    .line 952
    new-instance v3, Ll/pf60;

    .line 953
    .line 954
    iget-object v9, v0, Ll/v670;->m:Ll/bkj0;

    .line 955
    .line 956
    iget-object v9, v9, Ll/bkj0;->b:Ljava/lang/Object;

    .line 957
    .line 958
    check-cast v9, Ljava/util/List;

    .line 959
    .line 960
    invoke-direct {v3, v11, v9}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 961
    .line 962
    .line 963
    const/4 v9, 0x3

    .line 964
    invoke-direct {v1, v2, v3, v9}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;Ll/pf60;I)V

    .line 965
    .line 966
    .line 967
    invoke-interface {v4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 968
    .line 969
    .line 970
    :cond_17
    invoke-static/range {v18 .. v18}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 971
    .line 972
    .line 973
    move-result v1

    .line 974
    if-nez v1, :cond_18

    .line 975
    .line 976
    :goto_b
    move-object/from16 v1, p1

    .line 977
    .line 978
    goto :goto_c

    .line 979
    :cond_18
    throw v18

    .line 980
    :cond_19
    move-object/from16 v21, v2

    .line 981
    .line 982
    move-object/from16 v29, v9

    .line 983
    .line 984
    goto :goto_b

    .line 985
    :goto_c
    invoke-interface {v1, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 986
    .line 987
    .line 988
    move-result-object v2

    .line 989
    check-cast v2, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 990
    .line 991
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 992
    .line 993
    .line 994
    move-result v3

    .line 995
    if-eqz v3, :cond_2d

    .line 996
    .line 997
    iget-boolean v3, v0, Ll/v670;->e:Z

    .line 998
    .line 999
    if-eqz v3, :cond_1d

    .line 1000
    .line 1001
    move-object v3, v5

    .line 1002
    move-object v9, v6

    .line 1003
    iget-wide v5, v2, Lcom/p1/mobile/putong/feed/data/Moment;->createdTime:D

    .line 1004
    .line 1005
    cmpl-double v5, v5, v16

    .line 1006
    .line 1007
    if-lez v5, :cond_1c

    .line 1008
    .line 1009
    new-instance v5, Ljava/lang/StringBuilder;

    .line 1010
    .line 1011
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 1012
    .line 1013
    .line 1014
    move-object v15, v7

    .line 1015
    iget-wide v6, v2, Lcom/p1/mobile/putong/feed/data/Moment;->createdTime:D

    .line 1016
    .line 1017
    double-to-long v6, v6

    .line 1018
    invoke-static {v6, v7}, Ll/p6i;->e(J)I

    .line 1019
    .line 1020
    .line 1021
    move-result v6

    .line 1022
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1023
    .line 1024
    .line 1025
    sget-object v6, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 1026
    .line 1027
    sget v7, Lcom/p1/mobile/putong/feed/R$string;->M:I

    .line 1028
    .line 1029
    invoke-virtual {v6, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 1030
    .line 1031
    .line 1032
    move-result-object v6

    .line 1033
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1034
    .line 1035
    .line 1036
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1037
    .line 1038
    .line 1039
    move-result-object v5

    .line 1040
    move-object/from16 v6, v21

    .line 1041
    .line 1042
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1043
    .line 1044
    .line 1045
    move-result v7

    .line 1046
    if-nez v7, :cond_1a

    .line 1047
    .line 1048
    move-object v7, v5

    .line 1049
    move-object/from16 v21, v6

    .line 1050
    .line 1051
    iget-wide v5, v2, Lcom/p1/mobile/putong/feed/data/Moment;->createdTime:D

    .line 1052
    .line 1053
    double-to-long v5, v5

    .line 1054
    move-object/from16 v31, v9

    .line 1055
    .line 1056
    move-object/from16 v30, v10

    .line 1057
    .line 1058
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 1059
    .line 1060
    .line 1061
    move-result-wide v9

    .line 1062
    invoke-static {v5, v6, v9, v10}, Ll/p6i;->j(JJ)Z

    .line 1063
    .line 1064
    .line 1065
    move-result v5

    .line 1066
    if-nez v5, :cond_1b

    .line 1067
    .line 1068
    move-object v5, v7

    .line 1069
    goto :goto_d

    .line 1070
    :cond_1a
    move-object v7, v5

    .line 1071
    move-object/from16 v21, v6

    .line 1072
    .line 1073
    move-object/from16 v31, v9

    .line 1074
    .line 1075
    move-object/from16 v30, v10

    .line 1076
    .line 1077
    :cond_1b
    move-object/from16 v5, v26

    .line 1078
    .line 1079
    :goto_d
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 1080
    .line 1081
    .line 1082
    move-result v6

    .line 1083
    if-nez v6, :cond_1e

    .line 1084
    .line 1085
    new-instance v6, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;

    .line 1086
    .line 1087
    invoke-direct {v6, v2, v5}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;)V

    .line 1088
    .line 1089
    .line 1090
    invoke-interface {v4, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1091
    .line 1092
    .line 1093
    goto :goto_10

    .line 1094
    :cond_1c
    move-object v15, v7

    .line 1095
    move-object/from16 v31, v9

    .line 1096
    .line 1097
    :goto_e
    move-object/from16 v30, v10

    .line 1098
    .line 1099
    goto :goto_f

    .line 1100
    :cond_1d
    move-object v3, v5

    .line 1101
    move-object/from16 v31, v6

    .line 1102
    .line 1103
    move-object v15, v7

    .line 1104
    goto :goto_e

    .line 1105
    :cond_1e
    :goto_f
    move-object/from16 v7, v21

    .line 1106
    .line 1107
    :goto_10
    iget-object v5, v2, Lcom/p1/mobile/putong/feed/data/Moment;->momentType:Lcom/p1/mobile/putong/data/MomentType;

    .line 1108
    .line 1109
    const-string v6, "seeAd"

    .line 1110
    .line 1111
    invoke-static {v5, v6}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 1112
    .line 1113
    .line 1114
    move-result v5

    .line 1115
    if-eqz v5, :cond_1f

    .line 1116
    .line 1117
    goto/16 :goto_11

    .line 1118
    .line 1119
    :cond_1f
    iget-object v5, v2, Lcom/p1/mobile/putong/feed/data/Moment;->liveRecommendCard:Lcom/p1/mobile/putong/feed/data/LiveRecommendCard;

    .line 1120
    .line 1121
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 1122
    .line 1123
    .line 1124
    move-result v5

    .line 1125
    if-eqz v5, :cond_20

    .line 1126
    .line 1127
    new-instance v5, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;

    .line 1128
    .line 1129
    iget-object v6, v2, Lcom/p1/mobile/putong/feed/data/Moment;->liveRecommendCard:Lcom/p1/mobile/putong/feed/data/LiveRecommendCard;

    .line 1130
    .line 1131
    invoke-direct {v5, v2, v6}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/LiveRecommendCard;)V

    .line 1132
    .line 1133
    .line 1134
    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1135
    .line 1136
    .line 1137
    goto/16 :goto_11

    .line 1138
    .line 1139
    :cond_20
    iget-object v5, v2, Lcom/p1/mobile/putong/feed/data/Moment;->voiceLiveApiInfo:Ll/ftn0$a;

    .line 1140
    .line 1141
    if-eqz v5, :cond_21

    .line 1142
    .line 1143
    new-instance v5, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;

    .line 1144
    .line 1145
    sget-object v6, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem$VoiceType;->card:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem$VoiceType;

    .line 1146
    .line 1147
    invoke-direct {v5, v2, v6}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem$VoiceType;)V

    .line 1148
    .line 1149
    .line 1150
    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1151
    .line 1152
    .line 1153
    goto :goto_11

    .line 1154
    :cond_21
    iget-object v5, v2, Lcom/p1/mobile/putong/feed/data/Moment;->feedVoiceUserEntryInfo:Ll/pbi;

    .line 1155
    .line 1156
    if-eqz v5, :cond_22

    .line 1157
    .line 1158
    new-instance v5, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;

    .line 1159
    .line 1160
    sget-object v6, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem$VoiceType;->profile:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem$VoiceType;

    .line 1161
    .line 1162
    invoke-direct {v5, v2, v6}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem$VoiceType;)V

    .line 1163
    .line 1164
    .line 1165
    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1166
    .line 1167
    .line 1168
    goto :goto_11

    .line 1169
    :cond_22
    iget-object v5, v2, Lcom/p1/mobile/putong/feed/data/Moment;->mFeedSeeMoreFollowingMomentInfo:Lcom/p1/mobile/putong/feed/data/FeedSeeMoreFollowingMomentInfo;

    .line 1170
    .line 1171
    if-eqz v5, :cond_23

    .line 1172
    .line 1173
    new-instance v5, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;

    .line 1174
    .line 1175
    invoke-direct {v5, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 1176
    .line 1177
    .line 1178
    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1179
    .line 1180
    .line 1181
    goto :goto_11

    .line 1182
    :cond_23
    iget-object v5, v2, Lcom/p1/mobile/putong/feed/data/Moment;->liveCircleBanner:Lcom/p1/mobile/putong/feed/data/LiveCircleBanner;

    .line 1183
    .line 1184
    if-eqz v5, :cond_24

    .line 1185
    .line 1186
    new-instance v5, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;

    .line 1187
    .line 1188
    invoke-direct {v5, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 1189
    .line 1190
    .line 1191
    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1192
    .line 1193
    .line 1194
    goto :goto_11

    .line 1195
    :cond_24
    invoke-static {}, Ll/cmg;->J()Z

    .line 1196
    .line 1197
    .line 1198
    move-result v5

    .line 1199
    if-eqz v5, :cond_25

    .line 1200
    .line 1201
    iget v5, v0, Ll/v670;->h:I

    .line 1202
    .line 1203
    const/16 v6, 0xe

    .line 1204
    .line 1205
    if-ne v5, v6, :cond_25

    .line 1206
    .line 1207
    iget-object v5, v0, Ll/v670;->b:Ll/n570;

    .line 1208
    .line 1209
    invoke-virtual {v5}, Ll/n570;->p()Z

    .line 1210
    .line 1211
    .line 1212
    move-result v5

    .line 1213
    if-eqz v5, :cond_25

    .line 1214
    .line 1215
    iget-object v5, v0, Ll/v670;->b:Ll/n570;

    .line 1216
    .line 1217
    iget-object v5, v5, Ll/n570;->b:Ll/qn00;

    .line 1218
    .line 1219
    invoke-interface {v1, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1220
    .line 1221
    .line 1222
    move-result-object v6

    .line 1223
    check-cast v6, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 1224
    .line 1225
    iget-object v6, v6, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 1226
    .line 1227
    invoke-virtual {v5, v6}, Ll/qn00;->c(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 1228
    .line 1229
    .line 1230
    move-result-object v5

    .line 1231
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 1232
    .line 1233
    .line 1234
    move-result v6

    .line 1235
    if-eqz v6, :cond_25

    .line 1236
    .line 1237
    iget-boolean v6, v5, Lcom/p1/mobile/putong/feed/data/RawFeed;->isRoamHighlight:Z

    .line 1238
    .line 1239
    if-eqz v6, :cond_25

    .line 1240
    .line 1241
    new-instance v6, Ll/so00;

    .line 1242
    .line 1243
    invoke-direct {v6, v2, v5, v8}, Ll/so00;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/RawFeed;I)V

    .line 1244
    .line 1245
    .line 1246
    invoke-interface {v4, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1247
    .line 1248
    .line 1249
    :goto_11
    move v2, v8

    .line 1250
    move/from16 v8, v19

    .line 1251
    .line 1252
    goto/16 :goto_17

    .line 1253
    .line 1254
    :cond_25
    iget-object v5, v0, Ll/v670;->b:Ll/n570;

    .line 1255
    .line 1256
    invoke-virtual {v5, v2}, Ll/n570;->j(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/util/List;

    .line 1257
    .line 1258
    .line 1259
    move-result-object v5

    .line 1260
    iget-object v6, v2, Lcom/p1/mobile/putong/feed/data/Moment;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 1261
    .line 1262
    if-nez v6, :cond_26

    .line 1263
    .line 1264
    const/16 v23, 0x0

    .line 1265
    .line 1266
    goto :goto_12

    .line 1267
    :cond_26
    iget v6, v6, Lcom/p1/mobile/putong/data/PartialIdList;->count:I

    .line 1268
    .line 1269
    move/from16 v23, v6

    .line 1270
    .line 1271
    :goto_12
    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    .line 1272
    .line 1273
    .line 1274
    move-result v6

    .line 1275
    if-nez v6, :cond_28

    .line 1276
    .line 1277
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 1278
    .line 1279
    .line 1280
    move-result v6

    .line 1281
    const/4 v9, 0x3

    .line 1282
    if-lt v6, v9, :cond_27

    .line 1283
    .line 1284
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 1285
    .line 1286
    .line 1287
    move-result v6

    .line 1288
    sub-int/2addr v6, v9

    .line 1289
    goto :goto_13

    .line 1290
    :cond_27
    const/4 v6, 0x0

    .line 1291
    :goto_13
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 1292
    .line 1293
    .line 1294
    move-result v9

    .line 1295
    invoke-interface {v5, v6, v9}, Ljava/util/List;->subList(II)Ljava/util/List;

    .line 1296
    .line 1297
    .line 1298
    move-result-object v5

    .line 1299
    :cond_28
    iget-object v6, v0, Ll/v670;->b:Ll/n570;

    .line 1300
    .line 1301
    instance-of v9, v6, Ll/hu60;

    .line 1302
    .line 1303
    if-nez v9, :cond_29

    .line 1304
    .line 1305
    instance-of v6, v6, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/a;

    .line 1306
    .line 1307
    if-nez v6, :cond_29

    .line 1308
    .line 1309
    new-instance v20, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;

    .line 1310
    .line 1311
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 1312
    .line 1313
    .line 1314
    move-result v22

    .line 1315
    const/16 v24, 0x0

    .line 1316
    .line 1317
    move-object/from16 v21, v2

    .line 1318
    .line 1319
    move/from16 v25, v8

    .line 1320
    .line 1321
    invoke-direct/range {v20 .. v25}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;IIII)V

    .line 1322
    .line 1323
    .line 1324
    move-object/from16 v2, v20

    .line 1325
    .line 1326
    invoke-interface {v4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1327
    .line 1328
    .line 1329
    goto :goto_14

    .line 1330
    :cond_29
    move-object/from16 v21, v2

    .line 1331
    .line 1332
    move/from16 v25, v8

    .line 1333
    .line 1334
    :goto_14
    new-instance v20, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;

    .line 1335
    .line 1336
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 1337
    .line 1338
    .line 1339
    move-result v22

    .line 1340
    const/16 v24, 0x1

    .line 1341
    .line 1342
    invoke-direct/range {v20 .. v25}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;IIII)V

    .line 1343
    .line 1344
    .line 1345
    move-object/from16 v6, v20

    .line 1346
    .line 1347
    move-object/from16 v2, v21

    .line 1348
    .line 1349
    invoke-interface {v4, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1350
    .line 1351
    .line 1352
    iget v6, v0, Ll/v670;->h:I

    .line 1353
    .line 1354
    move/from16 v8, v19

    .line 1355
    .line 1356
    if-ne v6, v8, :cond_2b

    .line 1357
    .line 1358
    iget-boolean v6, v2, Lcom/p1/mobile/putong/feed/data/Moment;->isVoiceLive:Z

    .line 1359
    .line 1360
    if-nez v6, :cond_2a

    .line 1361
    .line 1362
    goto :goto_15

    .line 1363
    :cond_2a
    move-object v5, v2

    .line 1364
    move/from16 v2, v25

    .line 1365
    .line 1366
    goto :goto_16

    .line 1367
    :cond_2b
    :goto_15
    new-instance v20, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;

    .line 1368
    .line 1369
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 1370
    .line 1371
    .line 1372
    move-result v22

    .line 1373
    const/16 v24, 0x2

    .line 1374
    .line 1375
    move-object/from16 v21, v2

    .line 1376
    .line 1377
    invoke-direct/range {v20 .. v25}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;IIII)V

    .line 1378
    .line 1379
    .line 1380
    move-object/from16 v6, v20

    .line 1381
    .line 1382
    move-object/from16 v5, v21

    .line 1383
    .line 1384
    move/from16 v2, v25

    .line 1385
    .line 1386
    invoke-interface {v4, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1387
    .line 1388
    .line 1389
    :goto_16
    iget v6, v0, Ll/v670;->f:I

    .line 1390
    .line 1391
    if-ge v2, v6, :cond_2c

    .line 1392
    .line 1393
    add-int/lit8 v6, v27, 0x3

    .line 1394
    .line 1395
    move/from16 v27, v6

    .line 1396
    .line 1397
    :cond_2c
    invoke-static {}, Ll/t8c;->e()Ll/t8c;

    .line 1398
    .line 1399
    .line 1400
    move-result-object v6

    .line 1401
    iget-boolean v6, v6, Ll/t8c;->a:Z

    .line 1402
    .line 1403
    if-eqz v6, :cond_2e

    .line 1404
    .line 1405
    iget v6, v0, Ll/v670;->h:I

    .line 1406
    .line 1407
    if-nez v6, :cond_2e

    .line 1408
    .line 1409
    iget-object v5, v5, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 1410
    .line 1411
    invoke-static {}, Ll/t8c;->e()Ll/t8c;

    .line 1412
    .line 1413
    .line 1414
    move-result-object v6

    .line 1415
    iget-object v6, v6, Ll/t8c;->b:Ljava/lang/String;

    .line 1416
    .line 1417
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1418
    .line 1419
    .line 1420
    move-result v5

    .line 1421
    if-eqz v5, :cond_2e

    .line 1422
    .line 1423
    invoke-static {}, Ll/t8c;->e()Ll/t8c;

    .line 1424
    .line 1425
    .line 1426
    move-result-object v5

    .line 1427
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 1428
    .line 1429
    .line 1430
    move-result v6

    .line 1431
    add-int/lit8 v6, v6, 0x6

    .line 1432
    .line 1433
    iput v6, v5, Ll/t8c;->c:I

    .line 1434
    .line 1435
    goto :goto_17

    .line 1436
    :cond_2d
    move-object v3, v5

    .line 1437
    move-object/from16 v31, v6

    .line 1438
    .line 1439
    move-object v15, v7

    .line 1440
    move v2, v8

    .line 1441
    move-object/from16 v30, v10

    .line 1442
    .line 1443
    move/from16 v8, v19

    .line 1444
    .line 1445
    move-object/from16 v7, v21

    .line 1446
    .line 1447
    :cond_2e
    :goto_17
    add-int/lit8 v2, v2, 0x1

    .line 1448
    .line 1449
    move-object v5, v3

    .line 1450
    move/from16 v19, v8

    .line 1451
    .line 1452
    move-object/from16 v9, v29

    .line 1453
    .line 1454
    move-object/from16 v10, v30

    .line 1455
    .line 1456
    move-object/from16 v6, v31

    .line 1457
    .line 1458
    move v8, v2

    .line 1459
    move-object v2, v7

    .line 1460
    move-object v7, v15

    .line 1461
    move/from16 v15, v28

    .line 1462
    .line 1463
    goto/16 :goto_8

    .line 1464
    .line 1465
    :cond_2f
    :goto_18
    iget-object v1, v0, Ll/v670;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 1466
    .line 1467
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->C:Ll/s2m;

    .line 1468
    .line 1469
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 1470
    .line 1471
    .line 1472
    move-result v1

    .line 1473
    if-eqz v1, :cond_30

    .line 1474
    .line 1475
    iget-object v1, v0, Ll/v670;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 1476
    .line 1477
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->C:Ll/s2m;

    .line 1478
    .line 1479
    move/from16 v2, p2

    .line 1480
    .line 1481
    move-object/from16 v3, p3

    .line 1482
    .line 1483
    move/from16 v5, v27

    .line 1484
    .line 1485
    invoke-interface {v1, v4, v2, v3, v5}, Ll/s2m;->n1(Ljava/util/List;ZLcom/p1/mobile/putong/data/User;I)Z

    .line 1486
    .line 1487
    .line 1488
    move-result v1

    .line 1489
    if-eqz v1, :cond_31

    .line 1490
    .line 1491
    return-void

    .line 1492
    :cond_30
    move/from16 v2, p2

    .line 1493
    .line 1494
    move-object/from16 v3, p3

    .line 1495
    .line 1496
    move/from16 v5, v27

    .line 1497
    .line 1498
    :cond_31
    iget-object v0, v0, Ll/ar2;->viewModel:Ll/iam;

    .line 1499
    .line 1500
    check-cast v0, Ll/y670;

    .line 1501
    .line 1502
    invoke-virtual {v0, v4, v2, v3, v5}, Ll/y670;->E(Ljava/util/List;ZLcom/p1/mobile/putong/data/User;I)V

    .line 1503
    .line 1504
    .line 1505
    return-void
.end method

.method public C1(Ljava/util/Map;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/v670;->j:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/ListIterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 18
    .line 19
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-eqz v2, :cond_0

    .line 24
    .line 25
    iget-object v2, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 26
    .line 27
    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-eqz v2, :cond_0

    .line 36
    .line 37
    iget-object v2, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 38
    .line 39
    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/feed/data/Moment;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    if-nez v2, :cond_0

    .line 48
    .line 49
    iget-object v2, p0, Ll/v670;->j:Ljava/util/List;

    .line 50
    .line 51
    invoke-interface {v2, v1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    iget-object v3, p0, Ll/v670;->j:Ljava/util/List;

    .line 56
    .line 57
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 58
    .line 59
    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    check-cast v1, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 64
    .line 65
    invoke-interface {v3, v2, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 74
    .line 75
    .line 76
    iget-object p1, p0, Ll/v670;->j:Ljava/util/List;

    .line 77
    .line 78
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    if-nez p1, :cond_2

    .line 83
    .line 84
    iget-object p1, p0, Ll/v670;->j:Ljava/util/List;

    .line 85
    .line 86
    const/4 v0, 0x0

    .line 87
    invoke-virtual {p0, p1, v0}, Ll/v670;->P1(Ljava/util/List;Z)V

    .line 88
    .line 89
    .line 90
    :cond_2
    return-void
.end method

.method public D1(Ljava/lang/String;Z)V
    .locals 1

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iget-object p2, p0, Ll/v670;->j:Ljava/util/List;

    .line 4
    .line 5
    new-instance v0, Ll/j670;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Ll/j670;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p2, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Ll/v670;->j:Ljava/util/List;

    .line 15
    .line 16
    :cond_0
    iget-object p1, p0, Ll/v670;->j:Ljava/util/List;

    .line 17
    .line 18
    const/4 p2, 0x0

    .line 19
    invoke-virtual {p0, p1, p2}, Ll/v670;->P1(Ljava/util/List;Z)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public E1()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/y670;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {v0, v1}, Ll/y670;->G(Z)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/v670;->j:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/v670;->j:Ljava/util/List;

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-virtual {p0, v0, v1}, Ll/v670;->P1(Ljava/util/List;Z)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public F1()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/v670;->b:Ll/n570;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {v0}, Ll/n570;->A()V

    .line 7
    .line 8
    .line 9
    invoke-static {}, Ll/qvm;->d()Ll/qvm;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object p0, p0, Ll/v670;->d:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Ll/qvm;->c(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public H1(II)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/v670;->b1()Ll/pf60;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 14
    .line 15
    check-cast p1, Ll/y670;

    .line 16
    .line 17
    invoke-virtual {p1}, Ll/y670;->B()Z

    .line 18
    .line 19
    .line 20
    iget-object p1, p2, Ll/pf60;->a:Ljava/lang/Object;

    .line 21
    .line 22
    check-cast p1, Ljava/lang/Integer;

    .line 23
    .line 24
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    iget-object p2, p2, Ll/pf60;->b:Ljava/lang/Object;

    .line 29
    .line 30
    check-cast p2, Ljava/lang/Integer;

    .line 31
    .line 32
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 33
    .line 34
    .line 35
    move-result p2

    .line 36
    invoke-virtual {p0, p1, p2}, Ll/v670;->I1(II)V

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method

.method public I1(II)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/y670;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/y670;->f()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    :goto_0
    if-gt p1, p2, :cond_2

    .line 18
    .line 19
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 20
    .line 21
    check-cast v1, Ll/y670;

    .line 22
    .line 23
    invoke-virtual {v1, p1}, Ll/y670;->q(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-nez v2, :cond_1

    .line 32
    .line 33
    const-string v2, "http"

    .line 34
    .line 35
    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-eqz v2, :cond_1

    .line 40
    .line 41
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    const/4 v3, 0x5

    .line 46
    if-ge v2, v3, :cond_1

    .line 47
    .line 48
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    :cond_1
    add-int/lit8 p1, p1, 0x1

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_2
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    if-lez p0, :cond_3

    .line 59
    .line 60
    invoke-static {v0}, Ll/uqb0;->T0(Ljava/util/List;)V

    .line 61
    .line 62
    .line 63
    :cond_3
    :goto_1
    return-void
.end method

.method public J1(Ll/pf60;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/Links;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/data/Links;

    .line 4
    .line 5
    iput-object v0, p0, Ll/v670;->k:Lcom/p1/mobile/putong/data/Links;

    .line 6
    .line 7
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

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
    iget-object v0, p0, Ll/v670;->j:Ljava/util/List;

    .line 16
    .line 17
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast p1, Ljava/util/Collection;

    .line 20
    .line 21
    new-instance v1, Ll/v570;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/v570;-><init>(Ll/v670;)V

    .line 24
    .line 25
    .line 26
    invoke-static {p1, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Ll/v670;->j:Ljava/util/List;

    .line 34
    .line 35
    const/4 v0, 0x0

    .line 36
    invoke-virtual {p0, p1, v0}, Ll/v670;->P1(Ljava/util/List;Z)V

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method

.method public L1(Ll/pf60;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/Links;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    const-string v0, "from_nearby_falls_feed"

    .line 2
    .line 3
    iget-object v1, p0, Ll/v670;->d:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 12
    .line 13
    iget-object v0, v0, Ll/jka;->Y0:Lrx/subjects/a;

    .line 14
    .line 15
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 21
    .line 22
    check-cast v0, Lcom/p1/mobile/putong/data/Links;

    .line 23
    .line 24
    iput-object v0, p0, Ll/v670;->k:Lcom/p1/mobile/putong/data/Links;

    .line 25
    .line 26
    iget-object v0, p0, Ll/v670;->b:Ll/n570;

    .line 27
    .line 28
    instance-of v0, v0, Ll/bg20;

    .line 29
    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 33
    .line 34
    check-cast v0, Ljava/util/Collection;

    .line 35
    .line 36
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    iget-object v0, p0, Ll/v670;->j:Ljava/util/List;

    .line 43
    .line 44
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-nez v0, :cond_1

    .line 49
    .line 50
    return-void

    .line 51
    :cond_1
    iget-object v0, p0, Ll/v670;->j:Ljava/util/List;

    .line 52
    .line 53
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Ll/v670;->b:Ll/n570;

    .line 57
    .line 58
    instance-of v1, v0, Ll/hu60;

    .line 59
    .line 60
    const/4 v2, 0x0

    .line 61
    if-nez v1, :cond_3

    .line 62
    .line 63
    instance-of v1, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/a;

    .line 64
    .line 65
    if-eqz v1, :cond_2

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_2
    iget-object v0, p0, Ll/v670;->j:Ljava/util/List;

    .line 69
    .line 70
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 71
    .line 72
    check-cast p1, Ljava/util/Collection;

    .line 73
    .line 74
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 75
    .line 76
    .line 77
    iget-object p1, p0, Ll/v670;->j:Ljava/util/List;

    .line 78
    .line 79
    invoke-virtual {p0, p1, v2}, Ll/v670;->P1(Ljava/util/List;Z)V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :cond_3
    :goto_0
    iget-object v1, p0, Ll/v670;->c:Ljava/lang/String;

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Ll/n570;->m(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    if-eqz v1, :cond_4

    .line 94
    .line 95
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    iget-object v3, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 104
    .line 105
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    if-nez v1, :cond_4

    .line 110
    .line 111
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 112
    .line 113
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->moments:Lcom/p1/mobile/putong/data/Moments;

    .line 114
    .line 115
    iget-boolean v1, v1, Lcom/p1/mobile/putong/data/Moments;->hidePublicMoments:Z

    .line 116
    .line 117
    if-eqz v1, :cond_4

    .line 118
    .line 119
    invoke-static {v0}, Lcom/p1/mobile/putong/data/User;->isMatched(Lcom/p1/mobile/putong/data/User;)Z

    .line 120
    .line 121
    .line 122
    move-result v1

    .line 123
    if-nez v1, :cond_4

    .line 124
    .line 125
    sget-object p1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 126
    .line 127
    const/4 v0, 0x1

    .line 128
    invoke-virtual {p0, p1, v0}, Ll/v670;->P1(Ljava/util/List;Z)V

    .line 129
    .line 130
    .line 131
    return-void

    .line 132
    :cond_4
    if-nez v0, :cond_5

    .line 133
    .line 134
    iget-object v0, p0, Ll/v670;->c:Ljava/lang/String;

    .line 135
    .line 136
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/helper/MomentUserNullException;->reportNullUserMoment(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    :cond_5
    iget-object v0, p0, Ll/v670;->j:Ljava/util/List;

    .line 140
    .line 141
    iget-object v1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 142
    .line 143
    check-cast v1, Ljava/util/Collection;

    .line 144
    .line 145
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 146
    .line 147
    .line 148
    const-string v0, "from_activities_moment"

    .line 149
    .line 150
    iget-object v1, p0, Ll/v670;->d:Ljava/lang/String;

    .line 151
    .line 152
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 153
    .line 154
    .line 155
    move-result v0

    .line 156
    if-eqz v0, :cond_6

    .line 157
    .line 158
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 159
    .line 160
    check-cast p1, Ljava/util/Collection;

    .line 161
    .line 162
    new-instance v0, Ll/u570;

    .line 163
    .line 164
    invoke-direct {v0, p0}, Ll/u570;-><init>(Ll/v670;)V

    .line 165
    .line 166
    .line 167
    invoke-static {p1, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 168
    .line 169
    .line 170
    move-result-object p1

    .line 171
    iput-object p1, p0, Ll/v670;->j:Ljava/util/List;

    .line 172
    .line 173
    :cond_6
    iget-object p1, p0, Ll/v670;->j:Ljava/util/List;

    .line 174
    .line 175
    invoke-virtual {p0, p1, v2}, Ll/v670;->P1(Ljava/util/List;Z)V

    .line 176
    .line 177
    .line 178
    return-void
.end method

.method public N1(Ll/bkj0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/bkj0<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicOperations;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/v670;->m:Ll/bkj0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/v670;->O1()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final O1()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/v670;->m:Ll/bkj0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_8

    .line 9
    .line 10
    iget-object v0, p0, Ll/v670;->m:Ll/bkj0;

    .line 11
    .line 12
    iget-object v0, v0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast v0, Ljava/util/Collection;

    .line 15
    .line 16
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_8

    .line 21
    .line 22
    new-instance v0, Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 25
    .line 26
    .line 27
    move v2, v1

    .line 28
    :goto_0
    iget-object v3, p0, Ll/v670;->m:Ll/bkj0;

    .line 29
    .line 30
    iget-object v3, v3, Ll/bkj0;->a:Ljava/lang/Object;

    .line 31
    .line 32
    check-cast v3, Ljava/util/List;

    .line 33
    .line 34
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    if-ge v2, v3, :cond_6

    .line 39
    .line 40
    iget-object v3, p0, Ll/v670;->m:Ll/bkj0;

    .line 41
    .line 42
    iget-object v3, v3, Ll/bkj0;->a:Ljava/lang/Object;

    .line 43
    .line 44
    check-cast v3, Ljava/util/List;

    .line 45
    .line 46
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    check-cast v3, Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 51
    .line 52
    iget-object v4, v3, Lcom/p1/mobile/putong/feed/data/TopicOperations;->operationType:Lcom/p1/mobile/putong/feed/data/OperationType;

    .line 53
    .line 54
    const-string v5, "change_city"

    .line 55
    .line 56
    invoke-static {v4, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 57
    .line 58
    .line 59
    move-result v4

    .line 60
    if-eqz v4, :cond_1

    .line 61
    .line 62
    invoke-virtual {p0}, Ll/v670;->R1()Z

    .line 63
    .line 64
    .line 65
    move-result v4

    .line 66
    if-eqz v4, :cond_0

    .line 67
    .line 68
    iget-object v4, v3, Lcom/p1/mobile/putong/feed/data/TopicOperations;->operationType:Lcom/p1/mobile/putong/feed/data/OperationType;

    .line 69
    .line 70
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v4

    .line 74
    invoke-virtual {p0, v4}, Ll/v670;->l1(Ljava/lang/String;)Z

    .line 75
    .line 76
    .line 77
    move-result v4

    .line 78
    if-nez v4, :cond_1

    .line 79
    .line 80
    :cond_0
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_1
    iget-object v4, v3, Lcom/p1/mobile/putong/feed/data/TopicOperations;->operationType:Lcom/p1/mobile/putong/feed/data/OperationType;

    .line 85
    .line 86
    const-string v5, "new_user"

    .line 87
    .line 88
    invoke-static {v4, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 89
    .line 90
    .line 91
    move-result v4

    .line 92
    if-eqz v4, :cond_3

    .line 93
    .line 94
    invoke-virtual {p0}, Ll/v670;->T1()Z

    .line 95
    .line 96
    .line 97
    move-result v4

    .line 98
    if-eqz v4, :cond_2

    .line 99
    .line 100
    iget-object v4, v3, Lcom/p1/mobile/putong/feed/data/TopicOperations;->operationType:Lcom/p1/mobile/putong/feed/data/OperationType;

    .line 101
    .line 102
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v4

    .line 106
    invoke-virtual {p0, v4}, Ll/v670;->l1(Ljava/lang/String;)Z

    .line 107
    .line 108
    .line 109
    move-result v4

    .line 110
    if-nez v4, :cond_3

    .line 111
    .line 112
    :cond_2
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    goto :goto_1

    .line 116
    :cond_3
    iget-object v4, v3, Lcom/p1/mobile/putong/feed/data/TopicOperations;->operationType:Lcom/p1/mobile/putong/feed/data/OperationType;

    .line 117
    .line 118
    const-string v5, "album_num_inc"

    .line 119
    .line 120
    invoke-static {v4, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 121
    .line 122
    .line 123
    move-result v4

    .line 124
    if-eqz v4, :cond_4

    .line 125
    .line 126
    invoke-virtual {p0, v0, v3}, Ll/v670;->S1(Ljava/util/ArrayList;Lcom/p1/mobile/putong/feed/data/TopicOperations;)V

    .line 127
    .line 128
    .line 129
    goto :goto_1

    .line 130
    :cond_4
    iget-object v4, v3, Lcom/p1/mobile/putong/feed/data/TopicOperations;->operationType:Lcom/p1/mobile/putong/feed/data/OperationType;

    .line 131
    .line 132
    const-string v5, "man_made"

    .line 133
    .line 134
    invoke-static {v4, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 135
    .line 136
    .line 137
    move-result v4

    .line 138
    if-eqz v4, :cond_5

    .line 139
    .line 140
    iget-object v4, v3, Lcom/p1/mobile/putong/feed/data/TopicOperations;->operationType:Lcom/p1/mobile/putong/feed/data/OperationType;

    .line 141
    .line 142
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v4

    .line 146
    invoke-virtual {p0, v4}, Ll/v670;->i1(Ljava/lang/String;)Z

    .line 147
    .line 148
    .line 149
    move-result v4

    .line 150
    if-nez v4, :cond_5

    .line 151
    .line 152
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 153
    .line 154
    .line 155
    :cond_5
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 156
    .line 157
    goto/16 :goto_0

    .line 158
    .line 159
    :cond_6
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 164
    .line 165
    .line 166
    move-result v2

    .line 167
    if-eqz v2, :cond_7

    .line 168
    .line 169
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 170
    .line 171
    .line 172
    move-result-object v2

    .line 173
    check-cast v2, Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 174
    .line 175
    iget-object v3, p0, Ll/v670;->m:Ll/bkj0;

    .line 176
    .line 177
    iget-object v3, v3, Ll/bkj0;->a:Ljava/lang/Object;

    .line 178
    .line 179
    check-cast v3, Ljava/util/List;

    .line 180
    .line 181
    invoke-interface {v3, v2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 182
    .line 183
    .line 184
    goto :goto_2

    .line 185
    :cond_7
    iget-object v0, p0, Ll/v670;->j:Ljava/util/List;

    .line 186
    .line 187
    invoke-virtual {p0, v0, v1}, Ll/v670;->P1(Ljava/util/List;Z)V

    .line 188
    .line 189
    .line 190
    return-void

    .line 191
    :cond_8
    iget-object v0, p0, Ll/v670;->m:Ll/bkj0;

    .line 192
    .line 193
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 194
    .line 195
    .line 196
    move-result v0

    .line 197
    if-eqz v0, :cond_9

    .line 198
    .line 199
    iget-object v0, p0, Ll/v670;->j:Ljava/util/List;

    .line 200
    .line 201
    invoke-virtual {p0, v0, v1}, Ll/v670;->P1(Ljava/util/List;Z)V

    .line 202
    .line 203
    .line 204
    :cond_9
    return-void
.end method

.method public P1(Ljava/util/List;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Ll/v670;->Q1(Ljava/util/List;ZLcom/p1/mobile/putong/data/User;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public Q0(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/v670;->j:Ljava/util/List;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-interface {v0, v1, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/v670;->j:Ljava/util/List;

    .line 8
    .line 9
    invoke-virtual {p0, p1, v1}, Ll/v670;->P1(Ljava/util/List;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final Q1(Ljava/util/List;ZLcom/p1/mobile/putong/data/User;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;Z",
            "Lcom/p1/mobile/putong/data/User;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/v670;->B1(Ljava/util/List;ZLcom/p1/mobile/putong/data/User;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/j4h;->d()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_6

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    instance-of v0, v0, Lcom/p1/mobile/putong/feed/newui/topic/topicaggregation/TopicAggregationAct;

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    goto/16 :goto_1

    .line 19
    .line 20
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->M()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->feedEntry()Ll/e4h;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-interface {v0}, Ll/e4h;->e()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->M()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-interface {v1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->feedEntry()Ll/e4h;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-interface {v1}, Ll/e4h;->c()I

    .line 41
    .line 42
    .line 43
    move-result v5

    .line 44
    const-string v1, "from_nearby_falls_feed"

    .line 45
    .line 46
    iget-object v2, p0, Ll/v670;->d:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-eqz v1, :cond_2

    .line 53
    .line 54
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    if-nez v1, :cond_2

    .line 59
    .line 60
    const/4 v1, -0x1

    .line 61
    if-eq v5, v1, :cond_2

    .line 62
    .line 63
    const-string v1, "room"

    .line 64
    .line 65
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    if-eqz v1, :cond_1

    .line 70
    .line 71
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->M()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->feedEntry()Ll/e4h;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-interface {v0}, Ll/e4h;->h()Lrx/c;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    new-instance v2, Ll/t670;

    .line 88
    .line 89
    move-object v3, p0

    .line 90
    move-object v4, p1

    .line 91
    move v6, p2

    .line 92
    move-object v7, p3

    .line 93
    invoke-direct/range {v2 .. v7}, Ll/t670;-><init>(Ll/v670;Ljava/util/List;IZLcom/p1/mobile/putong/data/User;)V

    .line 94
    .line 95
    .line 96
    new-instance p0, Ll/u670;

    .line 97
    .line 98
    invoke-direct {p0}, Ll/u670;-><init>()V

    .line 99
    .line 100
    .line 101
    invoke-static {v2, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 106
    .line 107
    .line 108
    goto :goto_0

    .line 109
    :cond_1
    move-object v3, p0

    .line 110
    move-object v4, p1

    .line 111
    move v6, p2

    .line 112
    move-object v7, p3

    .line 113
    const-string p0, "user"

    .line 114
    .line 115
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    move-result p0

    .line 119
    if-eqz p0, :cond_3

    .line 120
    .line 121
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->M()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    invoke-interface {p0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->feedEntry()Ll/e4h;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    invoke-interface {p0}, Ll/e4h;->g()Lrx/c;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    invoke-virtual {v3, p0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    new-instance v2, Ll/p570;

    .line 138
    .line 139
    invoke-direct/range {v2 .. v7}, Ll/p570;-><init>(Ll/v670;Ljava/util/List;IZLcom/p1/mobile/putong/data/User;)V

    .line 140
    .line 141
    .line 142
    new-instance p1, Ll/q570;

    .line 143
    .line 144
    invoke-direct {p1}, Ll/q570;-><init>()V

    .line 145
    .line 146
    .line 147
    invoke-static {v2, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 152
    .line 153
    .line 154
    goto :goto_0

    .line 155
    :cond_2
    move-object v3, p0

    .line 156
    move-object v4, p1

    .line 157
    move v6, p2

    .line 158
    move-object v7, p3

    .line 159
    :cond_3
    :goto_0
    new-instance p0, Ljava/util/HashSet;

    .line 160
    .line 161
    invoke-direct {p0}, Ljava/util/HashSet;-><init>()V

    .line 162
    .line 163
    .line 164
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    :cond_4
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 169
    .line 170
    .line 171
    move-result p2

    .line 172
    if-eqz p2, :cond_5

    .line 173
    .line 174
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 175
    .line 176
    .line 177
    move-result-object p2

    .line 178
    check-cast p2, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 179
    .line 180
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 181
    .line 182
    invoke-virtual {p0, p2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 183
    .line 184
    .line 185
    invoke-virtual {p0}, Ljava/util/HashSet;->size()I

    .line 186
    .line 187
    .line 188
    move-result p2

    .line 189
    const/16 p3, 0x28

    .line 190
    .line 191
    if-le p2, p3, :cond_4

    .line 192
    .line 193
    :cond_5
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 194
    .line 195
    invoke-virtual {v3}, Ll/v670;->Y0()Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object p2

    .line 199
    invoke-virtual {p1, p2, p0}, Ll/jka;->e7(Ljava/lang/String;Ljava/util/HashSet;)Lrx/c;

    .line 200
    .line 201
    .line 202
    move-result-object p0

    .line 203
    invoke-virtual {v3, p0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 204
    .line 205
    .line 206
    move-result-object p0

    .line 207
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 208
    .line 209
    .line 210
    move-result-object p1

    .line 211
    invoke-virtual {p0, p1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 212
    .line 213
    .line 214
    move-result-object p0

    .line 215
    new-instance p1, Ll/r570;

    .line 216
    .line 217
    invoke-direct {p1, v3, v4, v6, v7}, Ll/r570;-><init>(Ll/v670;Ljava/util/List;ZLcom/p1/mobile/putong/data/User;)V

    .line 218
    .line 219
    .line 220
    new-instance p2, Ll/s570;

    .line 221
    .line 222
    invoke-direct {p2}, Ll/s570;-><init>()V

    .line 223
    .line 224
    .line 225
    invoke-static {p1, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 226
    .line 227
    .line 228
    move-result-object p1

    .line 229
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 230
    .line 231
    .line 232
    :cond_6
    :goto_1
    return-void
.end method

.method public R0(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget-object v2, p0, Ll/v670;->j:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-ge v1, v2, :cond_1

    .line 10
    .line 11
    iget-object v2, p0, Ll/v670;->j:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 18
    .line 19
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 20
    .line 21
    iget-object v3, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-eqz v2, :cond_0

    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    move v1, v0

    .line 34
    :goto_1
    iget-object v2, p0, Ll/v670;->j:Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    if-ge v1, v2, :cond_3

    .line 41
    .line 42
    iget-object v2, p0, Ll/v670;->j:Ljava/util/List;

    .line 43
    .line 44
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    check-cast v2, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 49
    .line 50
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 51
    .line 52
    invoke-static {v2, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    if-eqz v2, :cond_2

    .line 57
    .line 58
    goto :goto_2

    .line 59
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_3
    const/4 v1, -0x1

    .line 63
    :goto_2
    iget-object p2, p0, Ll/v670;->j:Ljava/util/List;

    .line 64
    .line 65
    add-int/lit8 v1, v1, 0x1

    .line 66
    .line 67
    invoke-interface {p2, v1, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Ll/v670;->j:Ljava/util/List;

    .line 71
    .line 72
    invoke-virtual {p0, p1, v0}, Ll/v670;->P1(Ljava/util/List;Z)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public final R1()Z
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v1, p0, Ll/v670;->n:Ll/wyd0;

    .line 16
    .line 17
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-nez v2, :cond_0

    .line 28
    .line 29
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-nez v1, :cond_0

    .line 34
    .line 35
    const/4 p0, 0x1

    .line 36
    return p0

    .line 37
    :cond_0
    iget-object p0, p0, Ll/v670;->n:Ll/wyd0;

    .line 38
    .line 39
    invoke-virtual {p0, v0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    const/4 p0, 0x0

    .line 43
    return p0
.end method

.method public S0(Ljava/util/List;Ljava/lang/String;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;",
            "Ljava/lang/String;",
            ")V"
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
    const/4 v1, 0x0

    .line 7
    move v2, v1

    .line 8
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result v3

    .line 12
    if-ge v2, v3, :cond_2

    .line 13
    .line 14
    move v3, v1

    .line 15
    :goto_1
    iget-object v4, p0, Ll/v670;->j:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    if-ge v3, v4, :cond_1

    .line 22
    .line 23
    iget-object v4, p0, Ll/v670;->j:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v4

    .line 29
    check-cast v4, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 30
    .line 31
    iget-object v4, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 32
    .line 33
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v5

    .line 37
    check-cast v5, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 38
    .line 39
    iget-object v5, v5, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {v4, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    if-eqz v4, :cond_0

    .line 46
    .line 47
    goto :goto_2

    .line 48
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_1
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    check-cast v3, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 56
    .line 57
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    :goto_2
    add-int/lit8 v2, v2, 0x1

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_2
    move p1, v1

    .line 64
    :goto_3
    iget-object v2, p0, Ll/v670;->j:Ljava/util/List;

    .line 65
    .line 66
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    if-ge p1, v2, :cond_4

    .line 71
    .line 72
    iget-object v2, p0, Ll/v670;->j:Ljava/util/List;

    .line 73
    .line 74
    invoke-interface {v2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    check-cast v2, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 79
    .line 80
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 81
    .line 82
    invoke-static {v2, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    if-eqz v2, :cond_3

    .line 87
    .line 88
    goto :goto_4

    .line 89
    :cond_3
    add-int/lit8 p1, p1, 0x1

    .line 90
    .line 91
    goto :goto_3

    .line 92
    :cond_4
    const/4 p1, -0x1

    .line 93
    :goto_4
    iget-object p2, p0, Ll/v670;->j:Ljava/util/List;

    .line 94
    .line 95
    add-int/lit8 p1, p1, 0x1

    .line 96
    .line 97
    invoke-interface {p2, p1, v0}, Ljava/util/List;->addAll(ILjava/util/Collection;)Z

    .line 98
    .line 99
    .line 100
    iget-object p1, p0, Ll/v670;->j:Ljava/util/List;

    .line 101
    .line 102
    invoke-virtual {p0, p1, v1}, Ll/v670;->P1(Ljava/util/List;Z)V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public final S1(Ljava/util/ArrayList;Lcom/p1/mobile/putong/feed/data/TopicOperations;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/feed/data/TopicOperations;",
            ">;",
            "Lcom/p1/mobile/putong/feed/data/TopicOperations;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/feed/data/TopicOperations;->operationType:Lcom/p1/mobile/putong/feed/data/OperationType;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Ll/v670;->l1(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    const-string v0, "android.permission.READ_EXTERNAL_STORAGE"

    .line 18
    .line 19
    const-string v1, "android.permission.WRITE_EXTERNAL_STORAGE"

    .line 20
    .line 21
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->b([Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    iget v0, p0, Ll/v670;->p:I

    .line 36
    .line 37
    if-eqz v0, :cond_2

    .line 38
    .line 39
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->h:Ll/cu9;

    .line 40
    .line 41
    iget-object v1, v1, Ll/cu9;->H:Ll/vxd0;

    .line 42
    .line 43
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    check-cast v1, Ljava/lang/Integer;

    .line 48
    .line 49
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-le v0, v1, :cond_2

    .line 54
    .line 55
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->h:Ll/cu9;

    .line 56
    .line 57
    iget-object v0, v0, Ll/cu9;->H:Ll/vxd0;

    .line 58
    .line 59
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    check-cast v0, Ljava/lang/Integer;

    .line 64
    .line 65
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-nez v0, :cond_3

    .line 70
    .line 71
    :cond_2
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    :cond_3
    invoke-static {}, Ll/cmg;->V()Z

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    if-eqz p1, :cond_4

    .line 79
    .line 80
    iget-object p1, p0, Ll/v670;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 81
    .line 82
    invoke-virtual {p0}, Ll/v670;->d1()Lrx/c;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    new-instance p1, Ll/i670;

    .line 91
    .line 92
    invoke-direct {p1}, Ll/i670;-><init>()V

    .line 93
    .line 94
    .line 95
    invoke-static {p1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 100
    .line 101
    .line 102
    :cond_4
    return-void
.end method

.method public final T1()Z
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-wide v0, p0, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 10
    .line 11
    double-to-long v0, v0

    .line 12
    invoke-static {v0, v1}, Ll/p6i;->g(J)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0
.end method

.method public U0(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p0, Ll/v670;->c:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget v0, p0, Ll/v670;->h:I

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const/4 v1, 0x2

    .line 16
    if-ne v0, v1, :cond_1

    .line 17
    .line 18
    :cond_0
    invoke-virtual {p0, p1}, Ll/v670;->Q0(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 22
    .line 23
    const-string v0, "fake_id_"

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-nez p1, :cond_1

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/v670;->F1()V

    .line 32
    .line 33
    .line 34
    :cond_1
    return-void
.end method

.method public U1(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/v670;->l:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public final V0(ILcom/p1/mobile/putong/feed/data/TopicOperations;Lcom/p1/mobile/putong/feed/data/TopicOperations;Lcom/p1/mobile/putong/feed/data/TopicOperations;)Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/v670;->m:Ll/bkj0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/bkj0;->b:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v0, Ljava/util/Collection;

    .line 6
    .line 7
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    if-eqz p2, :cond_1

    .line 14
    .line 15
    iget-object v0, p2, Lcom/p1/mobile/putong/feed/data/TopicOperations;->categoryTopic:Ljava/util/List;

    .line 16
    .line 17
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    iget v0, p2, Lcom/p1/mobile/putong/feed/data/TopicOperations;->position:I

    .line 25
    .line 26
    add-int/lit8 v0, v0, -0x1

    .line 27
    .line 28
    if-ne p1, v0, :cond_1

    .line 29
    .line 30
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;

    .line 31
    .line 32
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/Moment;->new_()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 33
    .line 34
    .line 35
    move-result-object p3

    .line 36
    new-instance p4, Ll/pf60;

    .line 37
    .line 38
    iget-object v0, p2, Lcom/p1/mobile/putong/feed/data/TopicOperations;->categoryTopic:Ljava/util/List;

    .line 39
    .line 40
    iget-object p0, p0, Ll/v670;->m:Ll/bkj0;

    .line 41
    .line 42
    iget-object p0, p0, Ll/bkj0;->b:Ljava/lang/Object;

    .line 43
    .line 44
    check-cast p0, Ljava/util/List;

    .line 45
    .line 46
    invoke-direct {p4, v0, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p2, Lcom/p1/mobile/putong/feed/data/TopicOperations;->name:Ljava/lang/String;

    .line 50
    .line 51
    iget p2, p2, Lcom/p1/mobile/putong/feed/data/TopicOperations;->position:I

    .line 52
    .line 53
    invoke-direct {p1, p3, p4, p0, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;Ll/pf60;Ljava/lang/String;I)V

    .line 54
    .line 55
    .line 56
    return-object p1

    .line 57
    :cond_1
    :goto_0
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result p2

    .line 61
    if-eqz p2, :cond_2

    .line 62
    .line 63
    iget p2, p3, Lcom/p1/mobile/putong/feed/data/TopicOperations;->position:I

    .line 64
    .line 65
    add-int/lit8 p2, p2, -0x1

    .line 66
    .line 67
    if-ne p1, p2, :cond_2

    .line 68
    .line 69
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;

    .line 70
    .line 71
    iget-object p2, p0, Ll/v670;->m:Ll/bkj0;

    .line 72
    .line 73
    iget-object p2, p2, Ll/bkj0;->c:Ljava/lang/Object;

    .line 74
    .line 75
    check-cast p2, Ljava/util/Collection;

    .line 76
    .line 77
    new-instance p4, Ll/m670;

    .line 78
    .line 79
    invoke-direct {p4, p3}, Ll/m670;-><init>(Lcom/p1/mobile/putong/feed/data/TopicOperations;)V

    .line 80
    .line 81
    .line 82
    invoke-static {p2, p4}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object p2

    .line 86
    check-cast p2, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 87
    .line 88
    iget-object p0, p0, Ll/v670;->m:Ll/bkj0;

    .line 89
    .line 90
    iget-object p0, p0, Ll/bkj0;->b:Ljava/lang/Object;

    .line 91
    .line 92
    check-cast p0, Ljava/util/Collection;

    .line 93
    .line 94
    new-instance p4, Ll/n670;

    .line 95
    .line 96
    invoke-direct {p4, p3}, Ll/n670;-><init>(Lcom/p1/mobile/putong/feed/data/TopicOperations;)V

    .line 97
    .line 98
    .line 99
    invoke-static {p0, p4}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    check-cast p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 104
    .line 105
    iget-object p3, p3, Lcom/p1/mobile/putong/feed/data/TopicOperations;->singleTopic:Lcom/p1/mobile/putong/feed/data/SingleTopic;

    .line 106
    .line 107
    invoke-direct {p1, p2, p0, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/TopicMoment;Lcom/p1/mobile/putong/feed/data/SingleTopic;)V

    .line 108
    .line 109
    .line 110
    return-object p1

    .line 111
    :cond_2
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    move-result p2

    .line 115
    if-eqz p2, :cond_3

    .line 116
    .line 117
    iget-object p2, p4, Lcom/p1/mobile/putong/feed/data/TopicOperations;->recommendUsers:Ljava/util/List;

    .line 118
    .line 119
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 120
    .line 121
    .line 122
    move-result p2

    .line 123
    if-nez p2, :cond_3

    .line 124
    .line 125
    iget p2, p4, Lcom/p1/mobile/putong/feed/data/TopicOperations;->position:I

    .line 126
    .line 127
    add-int/lit8 p2, p2, -0x1

    .line 128
    .line 129
    if-ne p1, p2, :cond_3

    .line 130
    .line 131
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;

    .line 132
    .line 133
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/Moment;->new_()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 134
    .line 135
    .line 136
    move-result-object p2

    .line 137
    iget-object p3, p4, Lcom/p1/mobile/putong/feed/data/TopicOperations;->name:Ljava/lang/String;

    .line 138
    .line 139
    new-instance v0, Ll/pf60;

    .line 140
    .line 141
    iget-object p4, p4, Lcom/p1/mobile/putong/feed/data/TopicOperations;->recommendUsers:Ljava/util/List;

    .line 142
    .line 143
    iget-object p0, p0, Ll/v670;->m:Ll/bkj0;

    .line 144
    .line 145
    iget-object p0, p0, Ll/bkj0;->c:Ljava/lang/Object;

    .line 146
    .line 147
    check-cast p0, Ljava/util/List;

    .line 148
    .line 149
    invoke-direct {v0, p4, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 150
    .line 151
    .line 152
    const/4 p0, 0x4

    .line 153
    invoke-direct {p1, p2, p3, p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ILl/pf60;)V

    .line 154
    .line 155
    .line 156
    return-object p1

    .line 157
    :cond_3
    const/4 p0, 0x0

    .line 158
    return-object p0
.end method

.method public final V1(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget-object p0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    iget-object p0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {}, Ll/lpg;->v()Ll/lpg;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p1}, Ll/lpg;->u()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    invoke-static {}, Ll/lpg;->v()Ll/lpg;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0}, Ll/lpg;->j0()V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public W0(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/v670;->j:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/s670;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Ll/s670;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, -0x1

    .line 13
    if-eq v0, v1, :cond_0

    .line 14
    .line 15
    iget-object v1, p0, Ll/v670;->j:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {v1, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/v670;->j:Ljava/util/List;

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-virtual {p0, v0, v1}, Ll/v670;->P1(Ljava/util/List;Z)V

    .line 24
    .line 25
    .line 26
    :cond_0
    invoke-virtual {p0, p1}, Ll/v670;->V1(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public W1(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p1, p0, Ll/v670;->j:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_1

    .line 8
    .line 9
    const-string p1, "from_nearby_falls_feed"

    .line 10
    .line 11
    iget-object v0, p0, Ll/v670;->d:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    const-string p1, "recommend_multiple"

    .line 20
    .line 21
    iget-object v0, p0, Ll/v670;->d:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    const-string p1, "recommend_only_video"

    .line 30
    .line 31
    iget-object v0, p0, Ll/v670;->d:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-nez p1, :cond_1

    .line 38
    .line 39
    :cond_0
    iget-object p1, p0, Ll/v670;->j:Ljava/util/List;

    .line 40
    .line 41
    const/4 v0, 0x0

    .line 42
    invoke-virtual {p0, p1, v0}, Ll/v670;->P1(Ljava/util/List;Z)V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void
.end method

.method public X0(Ll/pf60;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/lang/Boolean;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p2, :cond_0

    .line 3
    .line 4
    iget-object p2, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 5
    .line 6
    check-cast p2, Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    if-nez p2, :cond_0

    .line 13
    .line 14
    iget-object p2, p0, Ll/v670;->j:Ljava/util/List;

    .line 15
    .line 16
    new-instance v1, Ll/t570;

    .line 17
    .line 18
    invoke-direct {v1, p1}, Ll/t570;-><init>(Ll/pf60;)V

    .line 19
    .line 20
    .line 21
    invoke-static {p2, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iput-object p1, p0, Ll/v670;->j:Ljava/util/List;

    .line 26
    .line 27
    invoke-virtual {p0, p1, v0}, Ll/v670;->P1(Ljava/util/List;Z)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    iget-object p2, p0, Ll/v670;->j:Ljava/util/List;

    .line 32
    .line 33
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 34
    .line 35
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 36
    .line 37
    invoke-virtual {p0, p2, v0, p1}, Ll/v670;->Q1(Ljava/util/List;ZLcom/p1/mobile/putong/data/User;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public Y0()Ljava/lang/String;
    .locals 2

    .line 1
    const-string v0, "from_nearby_focus"

    .line 2
    .line 3
    iget-object v1, p0, Ll/v670;->d:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const-string p0, "momentFollow"

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    const-string v0, "from_like"

    .line 15
    .line 16
    iget-object v1, p0, Ll/v670;->d:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    const-string p0, "momentLike"

    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_1
    const-string v0, "from_nearby_falls_feed"

    .line 28
    .line 29
    iget-object v1, p0, Ll/v670;->d:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    const-string v1, "momentNearby"

    .line 36
    .line 37
    if-eqz v0, :cond_2

    .line 38
    .line 39
    return-object v1

    .line 40
    :cond_2
    const-string v0, "from_nearby_online"

    .line 41
    .line 42
    iget-object p0, p0, Ll/v670;->d:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    if-eqz p0, :cond_3

    .line 49
    .line 50
    const-string p0, "momentNearbyOnline"

    .line 51
    .line 52
    return-object p0

    .line 53
    :cond_3
    return-object v1
.end method

.method public a0()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/o570;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/o570;-><init>(Ll/v670;)V

    .line 7
    .line 8
    .line 9
    new-instance v1, Ll/z570;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/z570;-><init>(Ll/v670;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0, v1}, Ll/ar2;->creates(Ll/y20;Ll/x20;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/k670;

    .line 22
    .line 23
    invoke-direct {v1}, Ll/k670;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Ll/o670;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/o670;-><init>(Ll/v670;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 40
    .line 41
    .line 42
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->getAutoPlayVideoBs()Lrx/subjects/a;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    new-instance v1, Ll/p670;

    .line 55
    .line 56
    invoke-direct {v1, p0}, Ll/p670;-><init>(Ll/v670;)V

    .line 57
    .line 58
    .line 59
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public final a1()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/v670;->b:Ll/n570;

    .line 2
    .line 3
    instance-of v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/a;

    .line 4
    .line 5
    const-string v1, ""

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-direct {p0}, Ll/v670;->j1()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-boolean v0, p0, Ll/v670;->e:Z

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    return-object v1

    .line 20
    :cond_0
    iget-object v0, p0, Ll/v670;->b:Ll/n570;

    .line 21
    .line 22
    instance-of v0, v0, Ll/hu60;

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    invoke-static {}, Ll/cmg;->W()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_1

    .line 31
    .line 32
    invoke-direct {p0}, Ll/v670;->j1()Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-eqz p0, :cond_1

    .line 37
    .line 38
    return-object v1

    .line 39
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 40
    .line 41
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->i2:I

    .line 42
    .line 43
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0
.end method

.method public b1()Ll/pf60;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/y670;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/y670;->f()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    return-object v1

    .line 13
    :cond_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 14
    .line 15
    check-cast p0, Ll/y670;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/y670;->p()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    instance-of v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 22
    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    check-cast p0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 26
    .line 27
    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->findLastVisibleItemPosition()I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-lez p0, :cond_1

    .line 36
    .line 37
    new-instance v1, Ll/pf60;

    .line 38
    .line 39
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-direct {v1, v0, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    :cond_1
    return-object v1
.end method

.method public c1()Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/v670;->b:Ll/n570;

    .line 2
    .line 3
    iget-object v1, p0, Ll/v670;->k:Lcom/p1/mobile/putong/data/Links;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/n570;->n(Lcom/p1/mobile/putong/data/Links;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const-string v0, "from_activities_moment"

    .line 12
    .line 13
    iget-object p0, p0, Ll/v670;->d:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public final d1()Lrx/c;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/avx;

    .line 2
    .line 3
    iget-object v1, p0, Ll/v670;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-direct {v0, v1, v2, v2}, Ll/avx;-><init>(Landroid/content/Context;ZZ)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Ll/v670;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1}, Landroidx/fragment/app/FragmentActivity;->getSupportLoaderManager()Landroidx/loader/app/a;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    const/4 v2, 0x0

    .line 24
    const/4 v3, 0x0

    .line 25
    invoke-virtual {v1, v2, v3, v0}, Landroidx/loader/app/a;->e(ILandroid/os/Bundle;Landroidx/loader/app/a$a;)Ll/utv;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ll/avx;->t()Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Ll/l670;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Ll/l670;-><init>(Ll/v670;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e1()V
    .locals 3

    .line 1
    const-string v0, "recommend_only_video"

    .line 2
    .line 3
    iget-object v1, p0, Ll/v670;->d:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Ll/vpc0;

    .line 12
    .line 13
    iget-object v1, p0, Ll/v670;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 14
    .line 15
    check-cast v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 16
    .line 17
    const/4 v2, 0x1

    .line 18
    invoke-direct {v0, v1, v2}, Ll/vpc0;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;Z)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Ll/v670;->b:Ll/n570;

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const-string v0, "recommend_multiple"

    .line 25
    .line 26
    iget-object v1, p0, Ll/v670;->d:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    new-instance v0, Ll/vpc0;

    .line 35
    .line 36
    iget-object v1, p0, Ll/v670;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 37
    .line 38
    check-cast v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 39
    .line 40
    const/4 v2, 0x0

    .line 41
    invoke-direct {v0, v1, v2}, Ll/vpc0;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;Z)V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Ll/v670;->b:Ll/n570;

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    invoke-virtual {p0}, Ll/v670;->g1()V

    .line 48
    .line 49
    .line 50
    :goto_0
    iget-object v0, p0, Ll/v670;->b:Ll/n570;

    .line 51
    .line 52
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-eqz v0, :cond_2

    .line 57
    .line 58
    iget-object p0, p0, Ll/v670;->b:Ll/n570;

    .line 59
    .line 60
    invoke-virtual {p0}, Ll/n570;->o()V

    .line 61
    .line 62
    .line 63
    :cond_2
    return-void
.end method

.method public f1()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/v670;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "start_home_card"

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iput-boolean v0, p0, Ll/v670;->q:Z

    .line 14
    .line 15
    iget-object v0, p0, Ll/v670;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "from"

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Ll/v670;->d:Ljava/lang/String;

    .line 28
    .line 29
    iget-object v0, p0, Ll/v670;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 30
    .line 31
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v1, "from_feed_act"

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    iput-boolean v0, p0, Ll/v670;->e:Z

    .line 42
    .line 43
    iget-object v0, p0, Ll/v670;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 44
    .line 45
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    const-string v1, "user_id"

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iput-object v0, p0, Ll/v670;->c:Ljava/lang/String;

    .line 56
    .line 57
    iget-object v0, p0, Ll/v670;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 58
    .line 59
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    const-string v1, "selected_item_position"

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    iput v0, p0, Ll/v670;->f:I

    .line 70
    .line 71
    iget-object v0, p0, Ll/v670;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 72
    .line 73
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    const-string v1, "target_moment_id"

    .line 78
    .line 79
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    iput-object v0, p0, Ll/v670;->g:Ljava/lang/String;

    .line 84
    .line 85
    iget-object v0, p0, Ll/v670;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 86
    .line 87
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    const-string v1, "page_type"

    .line 92
    .line 93
    const/4 v2, -0x1

    .line 94
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    iput v0, p0, Ll/v670;->h:I

    .line 99
    .line 100
    iget-object v0, p0, Ll/v670;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 101
    .line 102
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    const-string v1, "is_auto_refresh"

    .line 107
    .line 108
    const/4 v2, 0x1

    .line 109
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    iput-boolean v0, p0, Ll/v670;->i:Z

    .line 114
    .line 115
    return-void
.end method

.method public g1()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/v670;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->C:Ll/s2m;

    .line 4
    .line 5
    invoke-interface {v0}, Ll/s2m;->L0()Ll/n570;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Ll/v670;->b:Ll/n570;

    .line 10
    .line 11
    return-void
.end method

.method public h1(ILjava/util/List;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;)Z"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/v670;->j:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-le v0, p1, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Ll/v670;->j:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v0, p1, p2}, Ljava/util/List;->addAll(ILjava/util/Collection;)Z

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Ll/v670;->j:Ljava/util/List;

    .line 16
    .line 17
    invoke-virtual {p0, p1, v1}, Ll/v670;->P1(Ljava/util/List;Z)V

    .line 18
    .line 19
    .line 20
    const/4 p0, 0x1

    .line 21
    return p0

    .line 22
    :cond_0
    return v1
.end method

.method public final i1(Ljava/lang/String;)Z
    .locals 6

    .line 1
    new-instance v0, Ll/byd0;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "show_guide_time_"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    iget v2, p0, Ll/v670;->h:I

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    const-wide/16 v2, 0x0

    .line 34
    .line 35
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    invoke-direct {v0, v1, v4}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 40
    .line 41
    .line 42
    new-instance v1, Ll/vxd0;

    .line 43
    .line 44
    new-instance v4, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    const-string v5, "show_man_made_guide_count_"

    .line 47
    .line 48
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    iget p0, p0, Ll/v670;->h:I

    .line 66
    .line 67
    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    const/4 p1, 0x0

    .line 75
    invoke-direct {v1, p0, p1}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    check-cast p0, Ljava/lang/Long;

    .line 83
    .line 84
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 85
    .line 86
    .line 87
    move-result-wide v4

    .line 88
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    check-cast p0, Ljava/lang/Integer;

    .line 93
    .line 94
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 95
    .line 96
    .line 97
    move-result p0

    .line 98
    cmp-long v0, v4, v2

    .line 99
    .line 100
    const/4 v1, 0x1

    .line 101
    if-gtz v0, :cond_0

    .line 102
    .line 103
    return v1

    .line 104
    :cond_0
    invoke-static {}, Ll/pzi0;->o()J

    .line 105
    .line 106
    .line 107
    move-result-wide v2

    .line 108
    invoke-static {v4, v5, v2, v3}, Ll/p6i;->l(JJ)Z

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    if-nez v0, :cond_1

    .line 113
    .line 114
    return v1

    .line 115
    :cond_1
    invoke-static {}, Ll/pu20;->n()I

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    if-ge p0, v0, :cond_2

    .line 120
    .line 121
    return v1

    .line 122
    :cond_2
    return p1
.end method

.method public k1()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public final l1(Ljava/lang/String;)Z
    .locals 3

    .line 1
    new-instance v0, Ll/byd0;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "show_guide_time_"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    iget p0, p0, Ll/v670;->h:I

    .line 25
    .line 26
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const-wide/16 v1, 0x0

    .line 34
    .line 35
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-direct {v0, p0, p1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    check-cast p0, Ljava/lang/Long;

    .line 47
    .line 48
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 49
    .line 50
    .line 51
    move-result-wide p0

    .line 52
    invoke-static {}, Ll/pzi0;->o()J

    .line 53
    .line 54
    .line 55
    move-result-wide v0

    .line 56
    invoke-static {p0, p1, v0, v1}, Ll/p6i;->l(JJ)Z

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    if-eqz p0, :cond_0

    .line 61
    .line 62
    const/4 p0, 0x0

    .line 63
    return p0

    .line 64
    :cond_0
    const/4 p0, 0x1

    .line 65
    return p0
.end method

.method public final synthetic m1(Ljava/util/List;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->h:Ll/cu9;

    .line 6
    .line 7
    iget-object v1, v1, Ll/cu9;->H:Ll/vxd0;

    .line 8
    .line 9
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Ljava/lang/Integer;

    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-le v0, v1, :cond_0

    .line 20
    .line 21
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->h:Ll/cu9;

    .line 22
    .line 23
    iget-object v0, v0, Ll/cu9;->H:Ll/vxd0;

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Ljava/lang/Integer;

    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-lez v0, :cond_0

    .line 36
    .line 37
    const/4 v0, 0x1

    .line 38
    goto :goto_0

    .line 39
    :cond_0
    const/4 v0, 0x0

    .line 40
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    iput v1, p0, Ll/v670;->p:I

    .line 45
    .line 46
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    iput p1, p0, Ll/v670;->o:I

    .line 51
    .line 52
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->h:Ll/cu9;

    .line 53
    .line 54
    iget-object p1, p1, Ll/cu9;->H:Ll/vxd0;

    .line 55
    .line 56
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    check-cast p1, Ljava/lang/Integer;

    .line 61
    .line 62
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    if-nez p1, :cond_1

    .line 67
    .line 68
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->h:Ll/cu9;

    .line 69
    .line 70
    iget-object p1, p1, Ll/cu9;->H:Ll/vxd0;

    .line 71
    .line 72
    iget p0, p0, Ll/v670;->p:I

    .line 73
    .line 74
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {p1, p0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    :cond_1
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    return-object p0
.end method

.method public final synthetic n1(Ljava/lang/Integer;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/orb0;->t(Landroid/app/Activity;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-lez p1, :cond_0

    .line 20
    .line 21
    const/4 p1, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 p1, 0x0

    .line 24
    :goto_0
    invoke-static {p0, p1}, Ll/orb0;->A(Lcom/p1/mobile/android/app/Act;Z)V

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void
.end method

.method public final synthetic s1(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Ll/v670;->c:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    iget-object p0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    const-string p1, "fake_id_"

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public final synthetic t1(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v670;->j:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic u1(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Ll/v670;->g:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

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

.method public final synthetic v1(Ljava/util/List;IZLcom/p1/mobile/putong/data/User;Ll/pbi;)V
    .locals 1

    .line 1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    add-int/lit8 p2, p2, -0x1

    .line 6
    .line 7
    if-lt v0, p2, :cond_2

    .line 8
    .line 9
    new-instance v0, Ll/h670;

    .line 10
    .line 11
    invoke-direct {v0}, Ll/h670;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-static {p1, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iput-object p5, v0, Lcom/p1/mobile/putong/feed/data/Moment;->feedVoiceUserEntryInfo:Ll/pbi;

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iget-object v0, p5, Ll/pbi;->b:Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 34
    .line 35
    invoke-virtual {v0, p5}, Ll/jka;->G6(Ll/pbi;)Lcom/p1/mobile/putong/feed/data/Moment;

    .line 36
    .line 37
    .line 38
    move-result-object p5

    .line 39
    invoke-interface {p1, p2, p5}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    :cond_1
    :goto_0
    invoke-virtual {p0, p1, p3, p4}, Ll/v670;->B1(Ljava/util/List;ZLcom/p1/mobile/putong/data/User;)V

    .line 43
    .line 44
    .line 45
    :cond_2
    return-void
.end method

.method public final synthetic x1(Ljava/util/List;ZLcom/p1/mobile/putong/data/User;Ljava/util/List;)V
    .locals 5

    .line 1
    invoke-interface {p4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p4

    .line 5
    :cond_0
    invoke-interface {p4}, Ljava/util/Iterator;->hasNext()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_3

    .line 10
    .line 11
    invoke-interface {p4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lcom/p1/mobile/putong/feed/data/FeedUserLiveLabel;

    .line 16
    .line 17
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-eqz v2, :cond_0

    .line 26
    .line 27
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    check-cast v2, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 32
    .line 33
    iget-object v3, v0, Lcom/p1/mobile/putong/feed/data/FeedUserLiveLabel;->userId:Ljava/lang/String;

    .line 34
    .line 35
    iget-object v4, v2, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    if-eqz v3, :cond_1

    .line 42
    .line 43
    iget-object v3, v0, Lcom/p1/mobile/putong/feed/data/FeedUserLiveLabel;->liveState:Ljava/lang/String;

    .line 44
    .line 45
    iput-object v3, v2, Lcom/p1/mobile/putong/feed/data/Moment;->liveState:Ljava/lang/String;

    .line 46
    .line 47
    iget-object v3, v2, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 48
    .line 49
    invoke-static {v3}, Lcom/p1/mobile/putong/feed/data/LiveExtraInFeed;->getFromLive(Lcom/p1/mobile/putong/data/Live;)Lcom/p1/mobile/putong/feed/data/LiveExtraInFeed;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    if-eqz v3, :cond_2

    .line 54
    .line 55
    invoke-virtual {v3}, Lcom/p1/mobile/putong/feed/data/LiveExtraInFeed;->isMultiCallType()Z

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    if-eqz v3, :cond_2

    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_2
    iget-object v3, v2, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 63
    .line 64
    iget-object v4, v0, Lcom/p1/mobile/putong/feed/data/FeedUserLiveLabel;->liveId:Ljava/lang/String;

    .line 65
    .line 66
    iput-object v4, v3, Lcom/p1/mobile/putong/data/Live;->id:Ljava/lang/String;

    .line 67
    .line 68
    :goto_1
    iget-object v3, v0, Lcom/p1/mobile/putong/feed/data/FeedUserLiveLabel;->iconTitle:Ljava/lang/String;

    .line 69
    .line 70
    iput-object v3, v2, Lcom/p1/mobile/putong/feed/data/Moment;->iconTitle:Ljava/lang/String;

    .line 71
    .line 72
    iget-object v3, v0, Lcom/p1/mobile/putong/feed/data/FeedUserLiveLabel;->multiCallInfo:Lcom/p1/mobile/putong/feed/data/LiveMultiCallInfo;

    .line 73
    .line 74
    iput-object v3, v2, Lcom/p1/mobile/putong/feed/data/Moment;->multiCallInfo:Lcom/p1/mobile/putong/feed/data/LiveMultiCallInfo;

    .line 75
    .line 76
    const/4 v3, 0x1

    .line 77
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/feed/data/Moment;->setLiveDataChange(Z)V

    .line 78
    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_3
    invoke-virtual {p0, p1, p2, p3}, Ll/v670;->B1(Ljava/util/List;ZLcom/p1/mobile/putong/data/User;)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public final synthetic z1(Ljava/util/List;IZLcom/p1/mobile/putong/data/User;Ll/ftn0$a;)V
    .locals 1

    .line 1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    add-int/lit8 p2, p2, -0x1

    .line 6
    .line 7
    if-lt v0, p2, :cond_2

    .line 8
    .line 9
    new-instance v0, Ll/g670;

    .line 10
    .line 11
    invoke-direct {v0}, Ll/g670;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-static {p1, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iput-object p5, v0, Lcom/p1/mobile/putong/feed/data/Moment;->voiceLiveApiInfo:Ll/ftn0$a;

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iget v0, p5, Ll/ftn0$a;->a:I

    .line 26
    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 30
    .line 31
    invoke-virtual {v0, p5}, Ll/jka;->H6(Ll/ftn0$a;)Lcom/p1/mobile/putong/feed/data/Moment;

    .line 32
    .line 33
    .line 34
    move-result-object p5

    .line 35
    invoke-interface {p1, p2, p5}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    :cond_1
    :goto_0
    invoke-virtual {p0, p1, p3, p4}, Ll/v670;->B1(Ljava/util/List;ZLcom/p1/mobile/putong/data/User;)V

    .line 39
    .line 40
    .line 41
    :cond_2
    return-void
.end method
