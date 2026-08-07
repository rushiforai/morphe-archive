.class public Lcom/p1/mobile/putong/feed/ui/moments/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/ui/moments/a$b;
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

.field public b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/ui/moments/a$b;",
            ">;"
        }
    .end annotation
.end field

.field public c:Landroid/view/ViewGroup;

.field public d:Ll/zzk;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/a;->b:Ljava/util/List;

    .line 10
    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/a;->a:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic k(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic l(Ll/y20;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/feed/data/Moment;JLl/uxj0;)V
    .locals 2

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sub-long/2addr v0, p1

    .line 6
    const-string p1, "moments"

    .line 7
    .line 8
    invoke-static {p1, p0, v0, v1}, Ll/g9i;->j0(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;J)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic n(Lcom/p1/mobile/putong/feed/ui/moments/a;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/a;->r(Landroid/util/Pair;)V

    return-void
.end method

.method public static synthetic o(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic p(JLl/uxj0;)V
    .locals 2

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sub-long/2addr v0, p0

    .line 6
    const-string p0, "moments"

    .line 7
    .line 8
    invoke-static {p0, v0, v1}, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil;->b0(Ljava/lang/String;J)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/api/b;->m4(Z)Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public b()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/a;->a:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->d:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;->c:Ll/vg60;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/vg60;->c()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public c()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/a;->c:Landroid/view/ViewGroup;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/a;->c:Landroid/view/ViewGroup;

    .line 10
    .line 11
    check-cast p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;->A(I)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public d(Lcom/p1/mobile/putong/feed/data/Moment;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    iget-boolean p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->haveLiked:Z

    .line 8
    .line 9
    xor-int/lit8 p1, p1, 0x1

    .line 10
    .line 11
    invoke-virtual {p0, v0, v1, p1}, Lcom/p1/mobile/putong/feed/api/b;->R3(Ljava/lang/String;Ljava/lang/String;Z)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public e(Ljava/lang/String;Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/a;->a:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->d:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->M()Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p1}, Ll/mrb0;->W(Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {v0, p0, p1}, Ll/jic0;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    new-instance p1, Ll/cv00;

    .line 18
    .line 19
    invoke-direct {p1, p2}, Ll/cv00;-><init>(Ll/y20;)V

    .line 20
    .line 21
    .line 22
    invoke-static {p1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public f(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 2

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 2
    .line 3
    iget-wide v0, p1, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/feed/api/b;->h3(J)Lrx/c;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public g()V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 2
    .line 3
    const-string v0, "moments"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/api/b;->c4(Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public h(Z)V
    .locals 3

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/a;->t()V

    .line 4
    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/a;->a:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 8
    .line 9
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->d:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 12
    .line 13
    .line 14
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/a;->a:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->M()Lcom/p1/mobile/putong/app/PutongAct;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->i9()Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 29
    .line 30
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/api/b;->Y3()Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    new-instance v2, Ll/wu00;

    .line 35
    .line 36
    invoke-direct {v2}, Ll/wu00;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-static {v0, v1, v2}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    new-instance v0, Ll/xu00;

    .line 48
    .line 49
    invoke-direct {v0, p0}, Ll/xu00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/a;)V

    .line 50
    .line 51
    .line 52
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 57
    .line 58
    .line 59
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 60
    .line 61
    .line 62
    move-result-wide v0

    .line 63
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/a;->a:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 64
    .line 65
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->M()Lcom/p1/mobile/putong/app/PutongAct;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 70
    .line 71
    const/4 v2, 0x1

    .line 72
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/feed/api/b;->m4(Z)Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    new-instance p1, Ll/yu00;

    .line 81
    .line 82
    invoke-direct {p1, v0, v1}, Ll/yu00;-><init>(J)V

    .line 83
    .line 84
    .line 85
    new-instance v0, Ll/zu00;

    .line 86
    .line 87
    invoke-direct {v0}, Ll/zu00;-><init>()V

    .line 88
    .line 89
    .line 90
    invoke-static {p1, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 95
    .line 96
    .line 97
    return-void
.end method

.method public i(Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/a;->a:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->M()Lcom/p1/mobile/putong/app/PutongAct;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/a;->a:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->M()Lcom/p1/mobile/putong/app/PutongAct;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/CaptionAct;->Y1(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;)Landroid/content/Intent;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const/16 p1, 0x32

    .line 18
    .line 19
    invoke-virtual {v0, p0, p1}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public j(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 3

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/api/b;->j4(Lcom/p1/mobile/putong/feed/data/Moment;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v2, Ll/av00;

    .line 12
    .line 13
    invoke-direct {v2, p1, v0, v1}, Ll/av00;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;J)V

    .line 14
    .line 15
    .line 16
    new-instance p1, Ll/bv00;

    .line 17
    .line 18
    invoke-direct {p1}, Ll/bv00;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-static {v2, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public q(Lcom/p1/mobile/putong/feed/ui/moments/a$b;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/a;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic r(Landroid/util/Pair;)V
    .locals 0

    .line 1
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p1, Ll/vg60;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/a;->s(Ll/vg60;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final s(Ll/vg60;)V
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;)V"
        }
    .end annotation

    .line 1
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    iget-object v1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 6
    .line 7
    .line 8
    goto :goto_0

    .line 9
    :catchall_0
    move-exception v0

    .line 10
    new-instance v1, Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 16
    .line 17
    .line 18
    move-object v0, v1

    .line 19
    :goto_0
    new-instance v1, Ll/vg60;

    .line 20
    .line 21
    iget-object p1, p1, Ll/vg60;->b:Lcom/p1/mobile/putong/data/DbLinks;

    .line 22
    .line 23
    invoke-direct {v1, v0, p1}, Ll/vg60;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)V

    .line 24
    .line 25
    .line 26
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-interface {p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->vq()Lcom/p1/mobile/putong/data/IntlOperationArticles;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    new-instance v2, Ljava/util/ArrayList;

    .line 39
    .line 40
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 41
    .line 42
    .line 43
    iget-object v3, v1, Ll/vg60;->a:Ljava/util/List;

    .line 44
    .line 45
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    const/4 v4, 0x0

    .line 50
    move v5, v4

    .line 51
    move v6, v5

    .line 52
    :goto_1
    if-ge v5, v3, :cond_3

    .line 53
    .line 54
    iget-object v7, v1, Ll/vg60;->a:Ljava/util/List;

    .line 55
    .line 56
    invoke-interface {v7, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v7

    .line 60
    move-object v9, v7

    .line 61
    check-cast v9, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 62
    .line 63
    if-eqz v0, :cond_0

    .line 64
    .line 65
    const/4 v7, 0x3

    .line 66
    if-ne v6, v7, :cond_0

    .line 67
    .line 68
    invoke-static {p1}, Ll/qo00;->a(Lcom/p1/mobile/putong/data/IntlOperationArticles;)Ll/qo00;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move v0, v4

    .line 76
    :cond_0
    invoke-static {v9}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result v7

    .line 80
    if-eqz v7, :cond_2

    .line 81
    .line 82
    sget-object v7, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 83
    .line 84
    invoke-virtual {v7, v9}, Lcom/p1/mobile/putong/feed/api/b;->d3(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/util/List;

    .line 85
    .line 86
    .line 87
    move-result-object v7

    .line 88
    iget-object v8, v9, Lcom/p1/mobile/putong/feed/data/Moment;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 89
    .line 90
    if-nez v8, :cond_1

    .line 91
    .line 92
    move v8, v4

    .line 93
    goto :goto_2

    .line 94
    :cond_1
    iget v8, v8, Lcom/p1/mobile/putong/data/PartialIdList;->count:I

    .line 95
    .line 96
    :goto_2
    new-instance v10, Ll/qo00;

    .line 97
    .line 98
    invoke-interface {v7}, Ljava/util/List;->size()I

    .line 99
    .line 100
    .line 101
    move-result v11

    .line 102
    invoke-direct {v10, v9, v11, v8, v5}, Ll/qo00;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;III)V

    .line 103
    .line 104
    .line 105
    invoke-interface {v2, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    add-int/lit8 v6, v6, 0x1

    .line 109
    .line 110
    invoke-interface {v7}, Ljava/util/List;->size()I

    .line 111
    .line 112
    .line 113
    move-result v13

    .line 114
    move v12, v4

    .line 115
    :goto_3
    if-ge v12, v13, :cond_2

    .line 116
    .line 117
    invoke-interface {v7, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object v8

    .line 121
    move-object v10, v8

    .line 122
    check-cast v10, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 123
    .line 124
    new-instance v8, Ll/qo00;

    .line 125
    .line 126
    iget-object v11, v9, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 127
    .line 128
    invoke-static {v11}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 129
    .line 130
    .line 131
    move-result v11

    .line 132
    invoke-direct/range {v8 .. v13}, Ll/qo00;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentMessage;ZII)V

    .line 133
    .line 134
    .line 135
    invoke-interface {v2, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 136
    .line 137
    .line 138
    add-int/lit8 v12, v12, 0x1

    .line 139
    .line 140
    goto :goto_3

    .line 141
    :cond_2
    add-int/lit8 v5, v5, 0x1

    .line 142
    .line 143
    goto :goto_1

    .line 144
    :cond_3
    if-eqz v0, :cond_4

    .line 145
    .line 146
    invoke-static {p1}, Ll/qo00;->a(Lcom/p1/mobile/putong/data/IntlOperationArticles;)Ll/qo00;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    invoke-interface {v2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 151
    .line 152
    .line 153
    :cond_4
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 154
    .line 155
    .line 156
    move-result-object p1

    .line 157
    invoke-interface {p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Pg()Ljava/util/List;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 162
    .line 163
    .line 164
    move-result v0

    .line 165
    if-nez v0, :cond_5

    .line 166
    .line 167
    invoke-static {p1}, Ll/qo00;->b(Ljava/util/List;)Ll/qo00;

    .line 168
    .line 169
    .line 170
    move-result-object p1

    .line 171
    invoke-interface {v2, v4, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 172
    .line 173
    .line 174
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/a;->a:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 175
    .line 176
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->d:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;

    .line 177
    .line 178
    new-instance v0, Ll/vg60;

    .line 179
    .line 180
    iget-object v1, v1, Ll/vg60;->b:Lcom/p1/mobile/putong/data/DbLinks;

    .line 181
    .line 182
    invoke-direct {v0, v2, v1}, Ll/vg60;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)V

    .line 183
    .line 184
    .line 185
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;->K(Ll/vg60;)V

    .line 186
    .line 187
    .line 188
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/a;->a:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 189
    .line 190
    iget-boolean v0, p1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->k:Z

    .line 191
    .line 192
    if-eqz v0, :cond_6

    .line 193
    .line 194
    invoke-virtual {p1, v4}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 195
    .line 196
    .line 197
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/a;->a:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 198
    .line 199
    iput-boolean v4, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->k:Z

    .line 200
    .line 201
    :cond_6
    return-void
.end method

.method public final t()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/a;->a:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->M()Lcom/p1/mobile/putong/app/PutongAct;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget v1, Ll/tec0;->v4:I

    .line 12
    .line 13
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/moments/a;->a:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 14
    .line 15
    const/4 v3, 0x0

    .line 16
    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/a;->c:Landroid/view/ViewGroup;

    .line 23
    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/a;->a:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 25
    .line 26
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->l:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;->p(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/a;->a:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 32
    .line 33
    new-instance v1, Lcom/p1/mobile/putong/feed/ui/moments/a$a;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/feed/ui/moments/a$a;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/a;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 39
    .line 40
    .line 41
    new-instance v0, Ll/zzk;

    .line 42
    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/a;->a:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 44
    .line 45
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->d:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;

    .line 46
    .line 47
    invoke-direct {v0, v1}, Ll/zzk;-><init>(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 48
    .line 49
    .line 50
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/a;->d:Ll/zzk;

    .line 51
    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/a;->c:Landroid/view/ViewGroup;

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Ll/zzk;->H(Landroid/view/View;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/a;->a:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/a;->d:Ll/zzk;

    .line 60
    .line 61
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method
