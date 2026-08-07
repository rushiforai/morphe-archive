.class public Ll/gai;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/feed/data/Moment;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;"
        }
    .end annotation
.end field

.field public d:Lcom/p1/mobile/android/app/Act;

.field public e:Z

.field public f:Z

.field public g:Z

.field public h:I

.field public i:Ljava/lang/String;

.field public j:Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;

.field public k:Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;

.field public l:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public m:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;",
            ">;"
        }
    .end annotation
.end field

.field public n:Ll/msv;

.field public o:Lcom/p1/mobile/putong/feed/data/Moment;

.field public p:Ljava/lang/String;

.field public q:Ll/x20;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZZZ)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/jic0;-><init>()V

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
    iput-object v0, p0, Ll/gai;->c:Ljava/util/List;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Ll/gai;->l:Ll/y20;

    .line 13
    .line 14
    new-instance v0, Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/gai;->m:Ljava/util/List;

    .line 20
    .line 21
    new-instance v0, Ll/msv;

    .line 22
    .line 23
    invoke-direct {v0}, Ll/msv;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Ll/gai;->n:Ll/msv;

    .line 27
    .line 28
    iput-object p1, p0, Ll/gai;->d:Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    iput-object p2, p0, Ll/gai;->p:Ljava/lang/String;

    .line 31
    .line 32
    iput-boolean p3, p0, Ll/gai;->e:Z

    .line 33
    .line 34
    iput-boolean p4, p0, Ll/gai;->f:Z

    .line 35
    .line 36
    iput-boolean p5, p0, Ll/gai;->g:Z

    .line 37
    .line 38
    instance-of p2, p1, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;

    .line 39
    .line 40
    if-eqz p2, :cond_0

    .line 41
    .line 42
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    const-string p3, "VIDEO_FLOW_MOMENT_ID"

    .line 47
    .line 48
    invoke-virtual {p2, p3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    invoke-virtual {p0, p2}, Ll/gai;->X(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    :cond_0
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    const-string p3, "VIDEO_LIVE_AUTHOR_ID"

    .line 60
    .line 61
    invoke-virtual {p2, p3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p2

    .line 65
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    const-string p3, "VIDEO_LIVE_ROOM_ID"

    .line 70
    .line 71
    invoke-virtual {p1, p3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 76
    .line 77
    .line 78
    move-result p3

    .line 79
    if-nez p3, :cond_1

    .line 80
    .line 81
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 82
    .line 83
    .line 84
    move-result p3

    .line 85
    if-nez p3, :cond_1

    .line 86
    .line 87
    iget-object p0, p0, Ll/gai;->n:Ll/msv;

    .line 88
    .line 89
    invoke-virtual {p0, p2, p1}, Ll/msv;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    :cond_1
    return-void
.end method

.method public static synthetic E(Ll/gai;Lcom/p1/mobile/putong/data/Live;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gai;->R(Lcom/p1/mobile/putong/data/Live;)V

    return-void
.end method

.method private O()Ll/qai;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/gai;->d:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    instance-of v0, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;->a2()Ll/qai;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    new-instance p0, Ll/qai;

    .line 15
    .line 16
    invoke-direct {p0}, Ll/qai;-><init>()V

    .line 17
    .line 18
    .line 19
    return-object p0
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/gai;->F(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/Moment;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gai;->c:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 7

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;

    .line 2
    .line 3
    iget-object v1, p0, Ll/gai;->d:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    iget-object v2, p0, Ll/gai;->p:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    iget-boolean v4, p0, Ll/gai;->e:Z

    .line 12
    .line 13
    iget-boolean v5, p0, Ll/gai;->f:Z

    .line 14
    .line 15
    iget-boolean v6, p0, Ll/gai;->g:Z

    .line 16
    .line 17
    invoke-direct/range {v0 .. v6}, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;-><init>(Landroid/content/Context;Ljava/lang/String;IZZZ)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Ll/gai;->q:Ll/x20;

    .line 21
    .line 22
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->setAutoNextVideo(Ll/x20;)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Ll/gai;->n:Ll/msv;

    .line 26
    .line 27
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->setLivingStore(Ll/msv;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Ll/gai;->m:Ljava/util/List;

    .line 31
    .line 32
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    const/4 p0, 0x0

    .line 36
    invoke-virtual {v0, p0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 37
    .line 38
    .line 39
    return-object v0
.end method

.method public F(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/Moment;II)V
    .locals 0

    .line 1
    instance-of p3, p1, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;

    .line 2
    .line 3
    if-eqz p3, :cond_2

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;

    .line 6
    .line 7
    if-nez p4, :cond_0

    .line 8
    .line 9
    iput-object p1, p0, Ll/gai;->j:Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;

    .line 10
    .line 11
    iput-object p1, p0, Ll/gai;->k:Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;

    .line 12
    .line 13
    :cond_0
    invoke-virtual {p1, p4}, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->setShowInVideoFlowPosition(I)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p2}, Ll/gai;->N(Lcom/p1/mobile/putong/feed/data/Moment;)Lcom/p1/mobile/putong/feed/data/Moment;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    invoke-virtual {p1, p2, p4}, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->f(Lcom/p1/mobile/putong/feed/data/Moment;I)V

    .line 21
    .line 22
    .line 23
    iget p2, p0, Ll/gai;->h:I

    .line 24
    .line 25
    if-ne p4, p2, :cond_1

    .line 26
    .line 27
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->e()V

    .line 28
    .line 29
    .line 30
    :cond_1
    invoke-direct {p0}, Ll/gai;->O()Ll/qai;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const/4 p1, 0x0

    .line 35
    invoke-virtual {p0, p1}, Ll/qai;->j(I)V

    .line 36
    .line 37
    .line 38
    :cond_2
    return-void
.end method

.method public G(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/gai;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Ll/gai;->c:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Ll/gai;->c:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v1, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 15
    .line 16
    .line 17
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    sub-int/2addr p1, v0

    .line 22
    invoke-virtual {p0, v0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemRangeInserted(II)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final H(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/gai;->m:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_3

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;

    .line 18
    .line 19
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-eqz v2, :cond_0

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->getShowInVideoFlowPosition()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-ne p1, v2, :cond_1

    .line 30
    .line 31
    iget v2, p0, Ll/gai;->h:I

    .line 32
    .line 33
    if-eq p1, v2, :cond_1

    .line 34
    .line 35
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->e()V

    .line 36
    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_1
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->i()V

    .line 40
    .line 41
    .line 42
    :goto_1
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->getShowInVideoFlowPosition()I

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    if-ne p1, v2, :cond_2

    .line 47
    .line 48
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->g()V

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->h()V

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_3
    return-void
.end method

.method public final I(I)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput-object p1, p0, Ll/gai;->k:Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    iget-object p1, p0, Ll/gai;->j:Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;

    .line 8
    .line 9
    iput-object p1, p0, Ll/gai;->k:Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;

    .line 10
    .line 11
    return-void
.end method

.method public J()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ll/gai;->O()Ll/qai;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/gai;->i:Ljava/lang/String;

    .line 6
    .line 7
    const/4 v2, 0x2

    .line 8
    invoke-virtual {v0, v1, v2}, Ll/qai;->a(Ljava/lang/String;I)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Ll/gai;->O()Ll/qai;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Ll/gai;->o:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 16
    .line 17
    iget p0, p0, Ll/gai;->h:I

    .line 18
    .line 19
    invoke-virtual {v0, v1, p0}, Ll/qai;->k(Lcom/p1/mobile/putong/feed/data/Moment;I)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public K(I)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/gai;->O()Ll/qai;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/gai;->c:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-le v1, p1, :cond_0

    .line 12
    .line 13
    iget-object v1, p0, Ll/gai;->c:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 v1, 0x0

    .line 23
    :goto_0
    invoke-virtual {v0, v1, p1}, Ll/qai;->l(Lcom/p1/mobile/putong/feed/data/Moment;I)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ll/gai;->J()V

    .line 27
    .line 28
    .line 29
    invoke-direct {p0}, Ll/gai;->O()Ll/qai;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0, p1}, Ll/qai;->j(I)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final L(Lcom/p1/mobile/putong/feed/data/Moment;)Lcom/p1/mobile/putong/data/Media;
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 4
    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-gtz p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Lcom/p1/mobile/putong/data/Media;

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 25
    return-object p0
.end method

.method public M(I)Lcom/p1/mobile/putong/feed/data/Moment;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gai;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 8
    .line 9
    return-object p0
.end method

.method public final N(Lcom/p1/mobile/putong/feed/data/Moment;)Lcom/p1/mobile/putong/feed/data/Moment;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/jka;->w7(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/Moment;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, p1}, Ll/gai;->L(Lcom/p1/mobile/putong/feed/data/Moment;)Lcom/p1/mobile/putong/data/Media;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    if-ne p1, v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_1

    .line 21
    .line 22
    instance-of p1, v1, Lcom/p1/mobile/putong/data/Video;

    .line 23
    .line 24
    if-eqz p1, :cond_1

    .line 25
    .line 26
    check-cast v1, Lcom/p1/mobile/putong/data/Video;

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Ll/gai;->L(Lcom/p1/mobile/putong/feed/data/Moment;)Lcom/p1/mobile/putong/data/Media;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-eqz p1, :cond_1

    .line 37
    .line 38
    instance-of p1, p0, Lcom/p1/mobile/putong/data/Video;

    .line 39
    .line 40
    if-eqz p1, :cond_1

    .line 41
    .line 42
    check-cast p0, Lcom/p1/mobile/putong/data/Video;

    .line 43
    .line 44
    iget-object p1, v1, Lcom/p1/mobile/putong/data/Video;->music:Lcom/p1/mobile/putong/data/Music;

    .line 45
    .line 46
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Video;->music:Lcom/p1/mobile/putong/data/Music;

    .line 47
    .line 48
    :cond_1
    :goto_0
    return-object v0
.end method

.method public P()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gai;->i:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public Q()I
    .locals 0

    .line 1
    iget p0, p0, Ll/gai;->h:I

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic R(Lcom/p1/mobile/putong/data/Live;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/gai;->n:Ll/msv;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Live;->anchor:Lcom/p1/mobile/putong/data/Owner;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Live;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p0, v0, p1}, Ll/msv;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public S(I)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Ll/gai;->I(I)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/gai;->K(I)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/gai;->H(I)V

    .line 8
    .line 9
    .line 10
    iput p1, p0, Ll/gai;->h:I

    .line 11
    .line 12
    iget-object v0, p0, Ll/gai;->c:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Ll/gai;->X(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/gai;->c:Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    check-cast p1, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 32
    .line 33
    iput-object p1, p0, Ll/gai;->o:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 34
    .line 35
    return-void
.end method

.method public T()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/gai;->m:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;

    .line 18
    .line 19
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-eqz v2, :cond_0

    .line 24
    .line 25
    iget v2, p0, Ll/gai;->h:I

    .line 26
    .line 27
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->getShowInVideoFlowPosition()I

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    if-ne v2, v3, :cond_0

    .line 32
    .line 33
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->g()V

    .line 34
    .line 35
    .line 36
    :cond_1
    return-void
.end method

.method public U(Lcom/p1/mobile/putong/data/Music;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/gai;->m:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;

    .line 18
    .line 19
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->getShowInVideoFlowPosition()I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-nez p1, :cond_0

    .line 30
    .line 31
    :cond_1
    return-void
.end method

.method public V(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/gai;->q:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public W(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/gai;->l:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public final X(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/gai;->i:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public Y(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Live;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ll/fai;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/fai;-><init>(Ll/gai;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p1, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public e(I)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/jic0;->e(I)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/gai;->l:Ll/y20;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Ll/gai;->l:Ll/y20;

    .line 13
    .line 14
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gai;->M(I)Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
