.class public Ll/rwu;
.super Ll/cyr;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/cyr<",
        "Ll/ywu;",
        ">;"
    }
.end annotation


# static fields
.field public static final TAG:Ljava/lang/String; = "VoiceInternalPage"


# instance fields
.field private cardContext:Ll/hk4;

.field private cardList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/r6s;",
            ">;"
        }
    .end annotation
.end field

.field private final frag:Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatFrag;

.field private hasCheckDialog:Z

.field private final info:Ll/nus;

.field private loadingNext:Z

.field private pagination:Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;

.field private timerSubs:Ll/kcg0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatFrag;Ll/nus;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/cyr;-><init>(Ll/ner;)V

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
    iput-object v0, p0, Ll/rwu;->cardList:Ljava/util/List;

    .line 10
    .line 11
    iput-object p2, p0, Ll/rwu;->info:Ll/nus;

    .line 12
    .line 13
    iput-object p1, p0, Ll/rwu;->frag:Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatFrag;

    .line 14
    .line 15
    new-instance p2, Ll/hk4;

    .line 16
    .line 17
    invoke-direct {p2, p1}, Ll/hk4;-><init>(Ll/ner;)V

    .line 18
    .line 19
    .line 20
    iput-object p2, p0, Ll/rwu;->cardContext:Ll/hk4;

    .line 21
    .line 22
    return-void
.end method

.method private E2()V
    .locals 3

    .line 1
    invoke-static {}, Ll/jwu;->R()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/owu;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/owu;-><init>(Ll/rwu;)V

    .line 12
    .line 13
    .line 14
    new-instance v2, Ll/pwu;

    .line 15
    .line 16
    invoke-direct {v2, p0}, Ll/pwu;-><init>(Ll/rwu;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    iget-boolean v0, p0, Ll/rwu;->hasCheckDialog:Z

    .line 27
    .line 28
    if-nez v0, :cond_0

    .line 29
    .line 30
    const/4 v0, 0x1

    .line 31
    iput-boolean v0, p0, Ll/rwu;->hasCheckDialog:Z

    .line 32
    .line 33
    iget-object v0, p0, Ll/rwu;->frag:Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatFrag;

    .line 34
    .line 35
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iget-object p0, p0, Ll/rwu;->frag:Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatFrag;

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatFrag;->k5()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-static {v0, p0}, Ll/cwk0;->c(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    :cond_0
    return-void
.end method

.method public static synthetic q2(Ll/rwu;Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatSquareBean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rwu;->v2(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatSquareBean;)V

    return-void
.end method

.method public static synthetic r2(Ll/rwu;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rwu;->A2(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic s2(Ll/rwu;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rwu;->z2(Ljava/lang/Throwable;)V

    return-void
.end method


# virtual methods
.method public final synthetic A2(Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/rwu;->E2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public B2()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rwu;->pagination:Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;->hasNextPage(Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-boolean v0, p0, Ll/rwu;->loadingNext:Z

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 v0, 0x1

    .line 15
    iput-boolean v0, p0, Ll/rwu;->loadingNext:Z

    .line 16
    .line 17
    :cond_1
    :goto_0
    return-void
.end method

.method public C2(ZIJ)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    if-ne p2, v0, :cond_0

    .line 5
    .line 6
    iget-object p2, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 7
    .line 8
    check-cast p2, Ll/ywu;

    .line 9
    .line 10
    sget-object v0, Ll/itd0;->c:Ll/itd0;

    .line 11
    .line 12
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ll/gm3;

    .line 17
    .line 18
    iget-boolean v0, v0, Ll/gm3;->h:Z

    .line 19
    .line 20
    iget-object v1, p0, Ll/rwu;->frag:Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatFrag;

    .line 21
    .line 22
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatFrag;->b5()Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    invoke-virtual {p2, v0, v1}, Ll/ywu;->z(ZZ)V

    .line 27
    .line 28
    .line 29
    :cond_0
    if-eqz p1, :cond_1

    .line 30
    .line 31
    sget-object p2, Ll/itd0;->c:Ll/itd0;

    .line 32
    .line 33
    invoke-static {p2}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    check-cast p2, Ll/gm3;

    .line 38
    .line 39
    iget-object p2, p2, Ll/gm3;->i:Lrx/subjects/a;

    .line 40
    .line 41
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 42
    .line 43
    invoke-virtual {p2, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    :cond_1
    if-eqz p1, :cond_2

    .line 47
    .line 48
    iget-boolean p2, p0, Ll/rwu;->hasCheckDialog:Z

    .line 49
    .line 50
    if-eqz p2, :cond_2

    .line 51
    .line 52
    iget-object p2, p0, Ll/rwu;->frag:Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatFrag;

    .line 53
    .line 54
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatFrag;->b5()Z

    .line 55
    .line 56
    .line 57
    move-result p2

    .line 58
    if-eqz p2, :cond_2

    .line 59
    .line 60
    iget-object p2, p0, Ll/rwu;->frag:Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatFrag;

    .line 61
    .line 62
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    iget-object v0, p0, Ll/rwu;->frag:Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatFrag;

    .line 67
    .line 68
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatFrag;->k5()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-static {p2, v0}, Ll/cwk0;->c(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    :cond_2
    invoke-virtual {p0, p1, p3, p4}, Ll/rwu;->u2(ZJ)V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public D2()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/rwu;->E2()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/rwu;->frag:Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatFrag;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->Z4()Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    iget-object p0, p0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->LiveVideoChatEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveVideoChatEvent;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveVideoChatEvent;->refreshVideoChat()Ll/v3f$c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public F2()V
    .locals 3

    .line 1
    const-string v0, "e_live_video_quickchat_random_button"

    .line 2
    .line 3
    const-string v1, "p_live_video_quickchat"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/rwu;->info:Ll/nus;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/nus;->a()Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sget v1, Ll/xec0;->X0:I

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    invoke-static {v0, v1, v2}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/dialog/LiveVideoChatRandomDialog;

    .line 22
    .line 23
    iget-object p0, p0, Ll/rwu;->info:Ll/nus;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/nus;->a()Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/dialog/LiveVideoChatRandomDialog;->k(Lcom/p1/mobile/android/app/Act;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public H2()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/rwu;->timerSubs:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    const-wide/16 v0, 0x1

    .line 7
    .line 8
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    .line 9
    .line 10
    invoke-static {v0, v1, v2}, Lrx/c;->interval(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/qwu;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/qwu;-><init>(Ll/rwu;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iput-object v0, p0, Ll/rwu;->timerSubs:Ll/kcg0;

    .line 32
    .line 33
    return-void
.end method

.method public I2()V
    .locals 2

    .line 1
    const-string v0, "e_live_video_quickchat_start"

    .line 2
    .line 3
    const-string v1, "p_live_video_quickchat"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/rwu;->frag:Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatFrag;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {p0}, Ll/jwk0;->a(Lcom/p1/mobile/android/app/Act;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final u2(ZJ)V
    .locals 4

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p1, Ll/ywu;

    .line 7
    .line 8
    invoke-virtual {p1}, Ll/ywu;->v()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_1

    .line 13
    .line 14
    invoke-direct {p0}, Ll/rwu;->E2()V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_1
    const-wide/16 v0, 0x0

    .line 19
    .line 20
    cmp-long p1, p2, v0

    .line 21
    .line 22
    if-ltz p1, :cond_3

    .line 23
    .line 24
    sget-object p1, Ll/tbs;->b:Ll/vwt;

    .line 25
    .line 26
    invoke-virtual {p1}, Ll/vwt;->sb()I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    int-to-long v0, p1

    .line 31
    const-wide/16 v2, 0x3e8

    .line 32
    .line 33
    mul-long/2addr v0, v2

    .line 34
    cmp-long p1, p2, v0

    .line 35
    .line 36
    if-lez p1, :cond_2

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_2
    :goto_0
    return-void

    .line 40
    :cond_3
    :goto_1
    invoke-direct {p0}, Ll/rwu;->E2()V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final v2(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatSquareBean;)V
    .locals 3

    .line 1
    invoke-virtual {p0, p1}, Ll/rwu;->w2(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatSquareBean;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;->getPagination()Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/rwu;->pagination:Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;->hasNextPage()Z

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatSquareBean;->getCardList()Ljava/util/List;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    new-instance v0, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatSquareBean;->setCardList(Ljava/util/List;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    iget-object v0, p0, Ll/rwu;->cardList:Ljava/util/List;

    .line 28
    .line 29
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/rwu;->cardList:Ljava/util/List;

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatSquareBean;->getCardList()Ljava/util/List;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/rwu;->cardContext:Ll/hk4;

    .line 42
    .line 43
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatSquareBean;->getCardList()Ljava/util/List;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-static {v0, v1}, Ll/e4s;->b(Ll/hk4;Ljava/util/List;)Ljava/util/List;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 52
    .line 53
    check-cast v1, Ll/ywu;

    .line 54
    .line 55
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;->hasNextPage()Z

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    const/4 v2, 0x1

    .line 60
    invoke-virtual {v1, v0, p1, v2}, Ll/ywu;->x(Ljava/util/List;ZZ)V

    .line 61
    .line 62
    .line 63
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 64
    .line 65
    check-cast p0, Ll/ywu;

    .line 66
    .line 67
    invoke-virtual {p0}, Ll/ywu;->l()V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public final w2(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatSquareBean;)V
    .locals 5

    .line 1
    const/4 p0, 0x0

    .line 2
    move v0, p0

    .line 3
    :goto_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatSquareBean;->getCardList()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-ge p0, v1, :cond_1

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatSquareBean;->getCardList()Ljava/util/List;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-interface {v1, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Ll/r6s;

    .line 22
    .line 23
    invoke-virtual {v1}, Ll/r6s;->d()I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    const/16 v3, 0xb

    .line 28
    .line 29
    if-ne v2, v3, :cond_0

    .line 30
    .line 31
    invoke-virtual {v1}, Ll/r6s;->o()Ll/lwu;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    new-instance v2, Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

    .line 36
    .line 37
    invoke-direct {v2}, Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;-><init>()V

    .line 38
    .line 39
    .line 40
    sub-int v3, p0, v0

    .line 41
    .line 42
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    const-string v4, "index"

    .line 47
    .line 48
    invoke-virtual {v2, v4, v3}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    const-string v3, "anchorId"

    .line 52
    .line 53
    invoke-virtual {v1}, Ll/lwu;->a()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    invoke-virtual {v2, v3, v4}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    const-string v3, "p_live_video_quickchat"

    .line 61
    .line 62
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;->setPageId(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    const-string v3, "e_live_video_quickchat_room_enter"

    .line 66
    .line 67
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;->setModuleId(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v1, v2}, Ll/lwu;->m(Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;)V

    .line 71
    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 75
    .line 76
    :goto_1
    add-int/lit8 p0, p0, 0x1

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_1
    return-void
.end method

.method public y2()V
    .locals 1

    .line 1
    sget-object p0, Ll/tbs;->f:Ll/j6t;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Ll/j6t;->v(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic z2(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p1, Ll/ywu;

    .line 7
    .line 8
    invoke-virtual {p1}, Ll/ywu;->y()V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast p0, Ll/ywu;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/ywu;->l()V

    .line 16
    .line 17
    .line 18
    return-void
.end method
