.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;
.super Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;
.source "SourceFile"


# instance fields
.field public B:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;

.field public C:Landroid/widget/LinearLayout;

.field public D:Landroid/widget/RelativeLayout;

.field public E:Lv/VText;

.field public E0:Z

.field public F:Lv/VText;

.field public F0:I

.field public G:Lv/VText;

.field public G0:I

.field public H:Landroid/widget/RelativeLayout;

.field public H0:Ljava/lang/String;

.field public I:Lv/VText;

.field public I0:Ll/fvg;

.field public J:Lv/VText;

.field public J0:Z

.field public K:Lv/VText;

.field public K0:Lcom/p1/mobile/android/app/Act;

.field public L:Landroid/widget/RelativeLayout;

.field public final L0:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;>;"
        }
    .end annotation
.end field

.field public M:Lv/VText;

.field public N:Lv/VText;

.field public O:Lv/VText;

.field public P:Landroid/widget/RelativeLayout;

.field public Q:Lv/VText;

.field public R:Lv/VText;

.field public S:Lv/VText;

.field public T:Lv/VText;

.field public U:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;

.field public V:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/VoteOptions;",
            ">;"
        }
    .end annotation
.end field

.field public W:I

.field public k0:I

.field public p0:Lcom/p1/mobile/putong/feed/data/TopicMoment;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, -0x1

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->k0:I

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->E0:Z

    .line 9
    .line 10
    const/high16 p1, 0x43820000    # 260.0f

    .line 11
    .line 12
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->F0:I

    .line 17
    .line 18
    const/high16 p1, 0x420c0000    # 35.0f

    .line 19
    .line 20
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->G0:I

    .line 25
    .line 26
    const-string p1, ""

    .line 27
    .line 28
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->H0:Ljava/lang/String;

    .line 29
    .line 30
    const/4 p1, 0x1

    .line 31
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->J0:Z

    .line 32
    .line 33
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->L0:Lrx/subjects/b;

    .line 38
    .line 39
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 40
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, -0x1

    .line 41
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->k0:I

    const/4 p1, 0x0

    .line 42
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->E0:Z

    const/high16 p1, 0x43820000    # 260.0f

    .line 43
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->F0:I

    const/high16 p1, 0x420c0000    # 35.0f

    .line 44
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->G0:I

    .line 45
    const-string p1, ""

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->H0:Ljava/lang/String;

    const/4 p1, 0x1

    .line 46
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->J0:Z

    .line 47
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->L0:Lrx/subjects/b;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 48
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, -0x1

    .line 49
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->k0:I

    const/4 p1, 0x0

    .line 50
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->E0:Z

    const/high16 p1, 0x43820000    # 260.0f

    .line 51
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->F0:I

    const/high16 p1, 0x420c0000    # 35.0f

    .line 52
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->G0:I

    .line 53
    const-string p1, ""

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->H0:Ljava/lang/String;

    const/4 p1, 0x1

    .line 54
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->J0:Z

    .line 55
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->L0:Lrx/subjects/b;

    return-void
.end method

.method private I0()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->p0:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string v0, "deleted"

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->status:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method private synthetic R0(Ljava/util/HashMap;Lcom/p1/mobile/putong/feed/data/Moment;Z)V
    .locals 1

    .line 1
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p1, p2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->k0(Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic l0(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->Q0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic m0()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic o0(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;Landroid/widget/RelativeLayout;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->M0(Landroid/widget/RelativeLayout;)V

    return-void
.end method

.method public static synthetic p0(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->L0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic q0(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->U0()V

    return-void
.end method

.method public static synthetic r0(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->N0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic s0(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic t0(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;Ljava/util/HashMap;Lcom/p1/mobile/putong/feed/data/Moment;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->R0(Ljava/util/HashMap;Lcom/p1/mobile/putong/feed/data/Moment;Z)V

    return-void
.end method

.method public static synthetic u0(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->S0(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic v0(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;Landroid/view/View;Landroid/widget/TextView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->K0(Landroid/view/View;Landroid/widget/TextView;Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic w0(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->P0()V

    return-void
.end method

.method public static synthetic x0(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->T0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic y0(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->O0(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final A0(Z)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "window"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Landroid/view/WindowManager;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p1}, Landroid/view/Display;->getWidth()I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    const/high16 v0, 0x42400000    # 48.0f

    .line 30
    .line 31
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    sub-int/2addr p1, v0

    .line 36
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->F0:I

    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p1}, Landroid/view/Display;->getWidth()I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    const/high16 v0, 0x42be0000    # 95.0f

    .line 48
    .line 49
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    sub-int/2addr p1, v0

    .line 54
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->F0:I

    .line 55
    .line 56
    :cond_1
    return-void
.end method

.method public final B0(Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/Moment;->new_()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object p1, v0, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 6
    .line 7
    new-instance p1, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object p1, v0, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 13
    .line 14
    new-instance p1, Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 17
    .line 18
    .line 19
    new-instance v1, Lcom/p1/mobile/putong/data/TopicMomentIdBox;

    .line 20
    .line 21
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/TopicMomentIdBox;-><init>()V

    .line 22
    .line 23
    .line 24
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->p0:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 25
    .line 26
    iget-object v3, v2, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 27
    .line 28
    iput-object v3, v1, Lcom/p1/mobile/putong/data/TopicMomentIdBox;->id:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/TopicMoment;->name:Ljava/lang/String;

    .line 31
    .line 32
    iput-object v2, v1, Lcom/p1/mobile/putong/data/TopicMomentIdBox;->name:Ljava/lang/String;

    .line 33
    .line 34
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    iput-object p1, v0, Lcom/p1/mobile/putong/feed/data/Moment;->topics:Ljava/util/List;

    .line 38
    .line 39
    new-instance p1, Ljava/util/ArrayList;

    .line 40
    .line 41
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->p0:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 45
    .line 46
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    iput-object p1, v0, Lcom/p1/mobile/putong/feed/data/Moment;->mTopicList:Ljava/util/List;

    .line 50
    .line 51
    const/4 p0, 0x1

    .line 52
    invoke-static {v0, p0}, Ll/cn40;->U(Lcom/p1/mobile/putong/feed/data/Moment;Z)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public C()V
    .locals 1

    .line 1
    new-instance v0, Ll/fvg;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/fvg;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->I0:Ll/fvg;

    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ll/fvg;->G(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final D0(II)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->E0(II)D

    .line 2
    .line 3
    .line 4
    move-result-wide p0

    .line 5
    const-wide/16 v0, 0x0

    .line 6
    .line 7
    cmpl-double p2, p0, v0

    .line 8
    .line 9
    if-nez p2, :cond_0

    .line 10
    .line 11
    const-string p0, "0%"

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    new-instance p2, Ljava/text/DecimalFormat;

    .line 15
    .line 16
    const-string v0, "##%"

    .line 17
    .line 18
    invoke-direct {p2, v0}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p2, p0, p1}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public final E0(II)D
    .locals 4

    .line 1
    int-to-double p0, p1

    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    mul-double/2addr p0, v0

    int-to-double v2, p2

    mul-double/2addr v2, v0

    div-double/2addr p0, v2

    return-wide p0
.end method

.method public final G0(II)I
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->F0:I

    .line 2
    .line 3
    int-to-double v0, v0

    .line 4
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->H0(II)D

    .line 5
    .line 6
    .line 7
    move-result-wide p0

    .line 8
    mul-double/2addr v0, p0

    .line 9
    invoke-static {v0, v1}, Ljava/lang/Math;->round(D)J

    .line 10
    .line 11
    .line 12
    move-result-wide p0

    .line 13
    long-to-int p0, p0

    .line 14
    return p0
.end method

.method public final H0(II)D
    .locals 4

    .line 1
    int-to-double p0, p1

    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    mul-double/2addr p0, v0

    int-to-double v2, p2

    mul-double/2addr v2, v0

    div-double/2addr p0, v2

    const-wide v2, 0x3fef5c28f5c28f5cL    # 0.98

    cmpl-double p2, p0, v2

    if-lez p2, :cond_0

    cmpg-double p2, p0, v0

    if-gez p2, :cond_0

    return-wide v2

    :cond_0
    return-wide p0
.end method

.method public J0(Lcom/p1/mobile/putong/feed/data/TopicMoment;)Z
    .locals 2

    .line 1
    const/4 p0, 0x0

    .line 2
    if-eqz p1, :cond_2

    .line 3
    .line 4
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->options:Ljava/util/List;

    .line 5
    .line 6
    if-eqz v0, :cond_2

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    goto :goto_1

    .line 15
    :cond_0
    move v0, p0

    .line 16
    :goto_0
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->options:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-ge v0, v1, :cond_2

    .line 23
    .line 24
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->options:Ljava/util/List;

    .line 25
    .line 26
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Lcom/p1/mobile/putong/feed/data/VoteOptions;

    .line 31
    .line 32
    iget-boolean v1, v1, Lcom/p1/mobile/putong/feed/data/VoteOptions;->haveliked:Z

    .line 33
    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    const/4 p0, 0x1

    .line 37
    return p0

    .line 38
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_2
    :goto_1
    return p0
.end method

.method public final synthetic K0(Landroid/view/View;Landroid/widget/TextView;Landroid/animation/ValueAnimator;)V
    .locals 3

    .line 1
    invoke-virtual {p3}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    check-cast p3, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p3

    .line 11
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->F0:I

    .line 12
    .line 13
    mul-int/2addr v0, p3

    .line 14
    const/16 v1, 0x64

    .line 15
    .line 16
    div-int/2addr v0, v1

    .line 17
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    check-cast v2, Landroid/widget/RelativeLayout$LayoutParams;

    .line 22
    .line 23
    iput v0, v2, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    .line 24
    .line 25
    invoke-virtual {p1, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, p3, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->D0(II)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final synthetic L0(Ll/uxj0;)V
    .locals 3

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->E0:Z

    .line 3
    .line 4
    invoke-virtual {p0, p1, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->h1(ZZ)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/cmg;->n0()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->k:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    const-string p1, "p_user_moment_interactions_details_view"

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->k:Ljava/lang/String;

    .line 25
    .line 26
    const-string v0, "from_album"

    .line 27
    .line 28
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    invoke-static {p1, v0}, Ll/ksg;->K(Ljava/lang/String;Z)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->p0:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 37
    .line 38
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 39
    .line 40
    const-string v1, "topic_id"

    .line 41
    .line 42
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->V:Ljava/util/List;

    .line 47
    .line 48
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->k0:I

    .line 49
    .line 50
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    check-cast v1, Lcom/p1/mobile/putong/feed/data/VoteOptions;

    .line 55
    .line 56
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/VoteOptions;->values:Ljava/lang/String;

    .line 57
    .line 58
    const-string v2, "select_item"

    .line 59
    .line 60
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    filled-new-array {v0, v1}, [Ll/pf60;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    const-string v1, "e_qa_optional"

    .line 69
    .line 70
    invoke-static {v1, p1, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 71
    .line 72
    .line 73
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->V:Ljava/util/List;

    .line 74
    .line 75
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->k0:I

    .line 76
    .line 77
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    check-cast p1, Lcom/p1/mobile/putong/feed/data/VoteOptions;

    .line 82
    .line 83
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/VoteOptions;->values:Ljava/lang/String;

    .line 84
    .line 85
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->Z0(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    :cond_1
    return-void
.end method

.method public final synthetic M0(Landroid/widget/RelativeLayout;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ll/yug;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/yug;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public final synthetic N0(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->p0:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 6
    .line 7
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->J0:Z

    .line 8
    .line 9
    invoke-virtual {p0, p1, v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->a1(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/TopicMoment;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic O0(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ll/cvg;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/cvg;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public final synthetic P0()V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->k0:I

    .line 3
    .line 4
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->U1:I

    .line 5
    .line 6
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic Q0(Landroid/view/View;)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->k0:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-ne v0, v1, :cond_8

    .line 5
    .line 6
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->E0:Z

    .line 7
    .line 8
    if-nez v0, :cond_8

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->D:Landroid/widget/RelativeLayout;

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/4 v2, 0x0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iput v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->k0:I

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->H:Landroid/widget/RelativeLayout;

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    const/4 p1, 0x1

    .line 31
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->k0:I

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->L:Landroid/widget/RelativeLayout;

    .line 35
    .line 36
    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_2

    .line 41
    .line 42
    const/4 p1, 0x2

    .line 43
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->k0:I

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->P:Landroid/widget/RelativeLayout;

    .line 47
    .line 48
    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-eqz p1, :cond_3

    .line 53
    .line 54
    const/4 p1, 0x3

    .line 55
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->k0:I

    .line 56
    .line 57
    :cond_3
    :goto_0
    invoke-static {}, Ll/cmg;->n0()Z

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    if-nez p1, :cond_4

    .line 62
    .line 63
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->J0:Z

    .line 64
    .line 65
    if-nez p1, :cond_7

    .line 66
    .line 67
    :cond_4
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->I0()Z

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    if-eqz p1, :cond_5

    .line 72
    .line 73
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->k0:I

    .line 74
    .line 75
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->E2:I

    .line 76
    .line 77
    invoke-static {p1}, Ll/o1j0;->w(I)V

    .line 78
    .line 79
    .line 80
    goto :goto_1

    .line 81
    :cond_5
    invoke-static {}, Ll/owi;->a()Z

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    if-eqz p1, :cond_6

    .line 86
    .line 87
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->act()Lcom/p1/mobile/android/app/Act;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    new-instance v0, Ll/dvg;

    .line 92
    .line 93
    invoke-direct {v0, p0}, Ll/dvg;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;)V

    .line 94
    .line 95
    .line 96
    new-instance v1, Ll/evg;

    .line 97
    .line 98
    invoke-direct {v1, p0}, Ll/evg;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;)V

    .line 99
    .line 100
    .line 101
    sget-object p0, Ll/l3h;->b:Ljava/lang/String;

    .line 102
    .line 103
    invoke-static {p1, v0, v2, v1, p0}, Ll/k3h;->P0(Lcom/p1/mobile/android/app/Act;Ll/x20;ZLl/x20;Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    return-void

    .line 107
    :cond_6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->U0()V

    .line 108
    .line 109
    .line 110
    :cond_7
    :goto_1
    invoke-static {}, Ll/cmg;->n0()Z

    .line 111
    .line 112
    .line 113
    move-result p1

    .line 114
    if-eqz p1, :cond_8

    .line 115
    .line 116
    return-void

    .line 117
    :cond_8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->act()Lcom/p1/mobile/android/app/Act;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->p0:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 122
    .line 123
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->J0:Z

    .line 124
    .line 125
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->k0:I

    .line 126
    .line 127
    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->d1(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/TopicMoment;ZI)V

    .line 128
    .line 129
    .line 130
    return-void
.end method

.method public final synthetic S0(Ljava/lang/String;Landroid/view/View;)V
    .locals 3

    .line 1
    const-string p2, "posted_source"

    .line 2
    .line 3
    const-string v0, "vote"

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->p0:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 12
    .line 13
    const-string v1, "topic_id"

    .line 14
    .line 15
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 20
    .line 21
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 28
    .line 29
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const-string v1, ""

    .line 33
    .line 34
    :goto_0
    const-string v2, "moment_id"

    .line 35
    .line 36
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    filled-new-array {p2, v0, v1}, [Ll/pf60;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    const-string v0, "e_moment_posted"

    .line 45
    .line 46
    const-string v1, "p_vote_send_pop"

    .line 47
    .line 48
    invoke-static {v0, v1, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 49
    .line 50
    .line 51
    new-instance p2, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    const-string v0, "\u6211\u5728"

    .line 54
    .line 55
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->p0:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 59
    .line 60
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->name:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    const-string v0, "\u6295\u7968\u4e2d\u9009\u62e9\u4e86"

    .line 66
    .line 67
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string p1, "\u4f60\u4e5f\u6765\u8868\u6001\u5427~"

    .line 74
    .line 75
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->B0(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public final synthetic T0(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->p0:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 6
    .line 7
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->J0:Z

    .line 8
    .line 9
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->k0:I

    .line 10
    .line 11
    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->d1(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/TopicMoment;ZI)V

    .line 12
    .line 13
    .line 14
    const-string p0, "e_cancel"

    .line 15
    .line 16
    const-string p1, "p_vote_send_pop"

    .line 17
    .line 18
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final U0()V
    .locals 6

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->k0:I

    .line 8
    .line 9
    const/4 v1, -0x1

    .line 10
    if-ne v0, v1, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->act()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 18
    .line 19
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->p0:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 20
    .line 21
    iget-object v3, v2, Lcom/p1/mobile/putong/feed/data/TopicMoment;->owner:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 22
    .line 23
    iget-object v3, v3, Lcom/p1/mobile/putong/data/IdBoxed;->id:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 26
    .line 27
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->V:Ljava/util/List;

    .line 28
    .line 29
    iget v5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->k0:I

    .line 30
    .line 31
    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    check-cast v4, Lcom/p1/mobile/putong/feed/data/VoteOptions;

    .line 36
    .line 37
    iget-object v4, v4, Lcom/p1/mobile/putong/feed/data/VoteOptions;->id:Ljava/lang/String;

    .line 38
    .line 39
    iget v5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->k0:I

    .line 40
    .line 41
    invoke-virtual {v1, v3, v2, v4, v5}, Ll/jka;->Dc(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    new-instance v1, Ll/xug;

    .line 50
    .line 51
    invoke-direct {v1, p0}, Ll/xug;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;)V

    .line 52
    .line 53
    .line 54
    new-instance p0, Ll/fyh;

    .line 55
    .line 56
    invoke-direct {p0}, Ll/fyh;-><init>()V

    .line 57
    .line 58
    .line 59
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 64
    .line 65
    .line 66
    :cond_1
    :goto_0
    return-void
.end method

.method public final V0(I)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->p0:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto/16 :goto_2

    .line 6
    .line 7
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->C:Landroid/widget/LinearLayout;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->f:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->getTextView()Lv/VText;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->g:Lv/VText;

    .line 16
    .line 17
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->a:Landroid/view/View;

    .line 18
    .line 19
    const/4 v4, 0x4

    .line 20
    new-array v4, v4, [Landroid/view/View;

    .line 21
    .line 22
    const/4 v5, 0x0

    .line 23
    aput-object v0, v4, v5

    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    aput-object v1, v4, v0

    .line 27
    .line 28
    const/4 v1, 0x2

    .line 29
    aput-object v2, v4, v1

    .line 30
    .line 31
    const/4 v1, 0x3

    .line 32
    aput-object v3, v4, v1

    .line 33
    .line 34
    invoke-static {v4}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    new-instance v2, Ll/sug;

    .line 39
    .line 40
    invoke-direct {v2, p0}, Ll/sug;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;)V

    .line 41
    .line 42
    .line 43
    invoke-static {v1, v2}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 44
    .line 45
    .line 46
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->p0:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 47
    .line 48
    iget-object v2, v1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->options:Ljava/util/List;

    .line 49
    .line 50
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->V:Ljava/util/List;

    .line 51
    .line 52
    iget v1, v1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->voteCounter:I

    .line 53
    .line 54
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->W:I

    .line 55
    .line 56
    if-eqz v2, :cond_6

    .line 57
    .line 58
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    if-eqz v1, :cond_6

    .line 63
    .line 64
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->W:I

    .line 65
    .line 66
    if-gez v1, :cond_1

    .line 67
    .line 68
    goto :goto_2

    .line 69
    :cond_1
    move v1, v5

    .line 70
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->V:Ljava/util/List;

    .line 71
    .line 72
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    if-ge v1, v2, :cond_3

    .line 77
    .line 78
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->V:Ljava/util/List;

    .line 79
    .line 80
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    check-cast v2, Lcom/p1/mobile/putong/feed/data/VoteOptions;

    .line 85
    .line 86
    iget-boolean v2, v2, Lcom/p1/mobile/putong/feed/data/VoteOptions;->haveliked:Z

    .line 87
    .line 88
    if-eqz v2, :cond_2

    .line 89
    .line 90
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->E0:Z

    .line 91
    .line 92
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->k0:I

    .line 93
    .line 94
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_3
    const/4 v0, -0x1

    .line 98
    if-eq p1, v0, :cond_5

    .line 99
    .line 100
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->E0:Z

    .line 101
    .line 102
    if-nez v1, :cond_5

    .line 103
    .line 104
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->I0()Z

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    if-eqz v1, :cond_4

    .line 109
    .line 110
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->k0:I

    .line 111
    .line 112
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->E2:I

    .line 113
    .line 114
    invoke-static {p1}, Ll/o1j0;->w(I)V

    .line 115
    .line 116
    .line 117
    goto :goto_1

    .line 118
    :cond_4
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->k0:I

    .line 119
    .line 120
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->U0()V

    .line 121
    .line 122
    .line 123
    :cond_5
    :goto_1
    invoke-virtual {p0, v5, v5}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->h1(ZZ)V

    .line 124
    .line 125
    .line 126
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->D:Landroid/widget/RelativeLayout;

    .line 127
    .line 128
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->H:Landroid/widget/RelativeLayout;

    .line 129
    .line 130
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->L:Landroid/widget/RelativeLayout;

    .line 131
    .line 132
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->P:Landroid/widget/RelativeLayout;

    .line 133
    .line 134
    filled-new-array {p1, v0, v1, v2}, [Landroid/widget/RelativeLayout;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    new-instance v0, Ll/wug;

    .line 143
    .line 144
    invoke-direct {v0, p0}, Ll/wug;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;)V

    .line 145
    .line 146
    .line 147
    invoke-static {p1, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 148
    .line 149
    .line 150
    :cond_6
    :goto_2
    return-void
.end method

.method public W0(Lcom/p1/mobile/putong/feed/data/TopicMoment;ILcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->K0:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iput-object p4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->H0:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->g:Lv/VText;

    .line 6
    .line 7
    const/4 p4, 0x0

    .line 8
    invoke-static {p3, p4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->f:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 12
    .line 13
    invoke-static {p3, p4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->p0:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->C:Landroid/widget/LinearLayout;

    .line 19
    .line 20
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    check-cast p1, Landroid/widget/LinearLayout$LayoutParams;

    .line 25
    .line 26
    const/high16 p3, 0x41400000    # 12.0f

    .line 27
    .line 28
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 29
    .line 30
    .line 31
    move-result p4

    .line 32
    iput p4, p1, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 33
    .line 34
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 35
    .line 36
    .line 37
    move-result p3

    .line 38
    iput p3, p1, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 39
    .line 40
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->C:Landroid/widget/LinearLayout;

    .line 41
    .line 42
    invoke-virtual {p3, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 43
    .line 44
    .line 45
    const/high16 p1, 0x439e0000    # 316.0f

    .line 46
    .line 47
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->F0:I

    .line 52
    .line 53
    const/4 p1, 0x1

    .line 54
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->A0(Z)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->V0(I)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public X0(ILcom/p1/mobile/putong/feed/data/Moment;Ljava/util/HashMap;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;I)V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->e:Landroid/view/View;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 10
    .line 11
    int-to-float p4, p4

    .line 12
    invoke-static {p4}, Ll/qa00;->d(F)I

    .line 13
    .line 14
    .line 15
    move-result p4

    .line 16
    iput p4, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 17
    .line 18
    iget-object p4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->e:Landroid/view/View;

    .line 19
    .line 20
    invoke-virtual {p4, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->Z(ILcom/p1/mobile/putong/feed/data/Moment;Ljava/util/HashMap;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final Y0(Landroid/view/View;II)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 6
    .line 7
    invoke-virtual {p0, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->G0(II)I

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->G0:I

    .line 12
    .line 13
    invoke-static {p2, p0}, Ljava/lang/Math;->max(II)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    iput p0, v0, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public Z(ILcom/p1/mobile/putong/feed/data/Moment;Ljava/util/HashMap;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->Z(ILcom/p1/mobile/putong/feed/data/Moment;Ljava/util/HashMap;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->E0:Z

    .line 6
    .line 7
    const/4 v0, -0x1

    .line 8
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->k0:I

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->g:Lv/VText;

    .line 11
    .line 12
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p2, Lcom/p1/mobile/putong/feed/data/Moment;->momentValue:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->E(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->f:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 22
    .line 23
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    xor-int/lit8 v2, v2, 0x1

    .line 28
    .line 29
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->f:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 33
    .line 34
    iget-object v2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {p3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    if-nez v2, :cond_0

    .line 41
    .line 42
    move v2, p1

    .line 43
    goto :goto_0

    .line 44
    :cond_0
    iget-object v2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {p3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    check-cast v2, Ljava/lang/Boolean;

    .line 51
    .line 52
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    :goto_0
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->L(Z)Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    new-instance v2, Ll/zug;

    .line 61
    .line 62
    invoke-direct {v2, p0, p3, p2}, Ll/zug;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;Ljava/util/HashMap;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->Q(Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer$e;)Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 66
    .line 67
    .line 68
    invoke-virtual {p2}, Lcom/p1/mobile/putong/feed/data/Moment;->getTopicList()Ljava/util/List;

    .line 69
    .line 70
    .line 71
    move-result-object p3

    .line 72
    if-eqz p3, :cond_3

    .line 73
    .line 74
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    if-nez v1, :cond_1

    .line 79
    .line 80
    goto :goto_1

    .line 81
    :cond_1
    invoke-interface {p3, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object p3

    .line 85
    check-cast p3, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 86
    .line 87
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->p0:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 88
    .line 89
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->f:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 90
    .line 91
    new-instance v1, Lcom/p1/mobile/putong/newui/view/HighlightData;

    .line 92
    .line 93
    new-instance v2, Ljava/lang/StringBuilder;

    .line 94
    .line 95
    const-string v3, "#"

    .line 96
    .line 97
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->p0:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 101
    .line 102
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/data/TopicMoment;->name:Ljava/lang/String;

    .line 103
    .line 104
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    new-instance v3, Ll/avg;

    .line 112
    .line 113
    invoke-direct {v3}, Ll/avg;-><init>()V

    .line 114
    .line 115
    .line 116
    invoke-direct {v1, v2, v3}, Lcom/p1/mobile/putong/newui/view/HighlightData;-><init>(Ljava/lang/String;Ll/x20;)V

    .line 117
    .line 118
    .line 119
    filled-new-array {v1}, [Lcom/p1/mobile/putong/newui/view/HighlightData;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    invoke-virtual {p3, v0, v1}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->O(Ljava/lang/CharSequence;[Lcom/p1/mobile/putong/newui/view/HighlightData;)Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 124
    .line 125
    .line 126
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->A0(Z)V

    .line 127
    .line 128
    .line 129
    invoke-static {}, Ll/cmg;->n0()Z

    .line 130
    .line 131
    .line 132
    move-result p1

    .line 133
    if-eqz p1, :cond_2

    .line 134
    .line 135
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->U:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;

    .line 136
    .line 137
    iget-boolean p3, p2, Lcom/p1/mobile/putong/feed/data/Moment;->shareMyVote:Z

    .line 138
    .line 139
    invoke-static {p1, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 140
    .line 141
    .line 142
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->C:Landroid/widget/LinearLayout;

    .line 143
    .line 144
    iget-boolean p3, p2, Lcom/p1/mobile/putong/feed/data/Moment;->shareMyVote:Z

    .line 145
    .line 146
    xor-int/lit8 p3, p3, 0x1

    .line 147
    .line 148
    invoke-static {p1, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 149
    .line 150
    .line 151
    iget-boolean p1, p2, Lcom/p1/mobile/putong/feed/data/Moment;->shareMyVote:Z

    .line 152
    .line 153
    if-eqz p1, :cond_2

    .line 154
    .line 155
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->U:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;

    .line 156
    .line 157
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->k:Ljava/lang/String;

    .line 158
    .line 159
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->setFrom(Ljava/lang/String;)V

    .line 160
    .line 161
    .line 162
    new-instance p1, Ljava/util/HashMap;

    .line 163
    .line 164
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 165
    .line 166
    .line 167
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->p0:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 168
    .line 169
    iget-object p3, p2, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 170
    .line 171
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->J0(Lcom/p1/mobile/putong/feed/data/TopicMoment;)Z

    .line 172
    .line 173
    .line 174
    move-result p2

    .line 175
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 176
    .line 177
    .line 178
    move-result-object p2

    .line 179
    invoke-virtual {p1, p3, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 180
    .line 181
    .line 182
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->U:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;

    .line 183
    .line 184
    iput-object p1, p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->h:Ljava/util/HashMap;

    .line 185
    .line 186
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->p0:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 187
    .line 188
    invoke-virtual {p2, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->s(Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    .line 189
    .line 190
    .line 191
    return-void

    .line 192
    :cond_2
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->k0:I

    .line 193
    .line 194
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->V0(I)V

    .line 195
    .line 196
    .line 197
    return-void

    .line 198
    :cond_3
    :goto_1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->f:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 199
    .line 200
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->M(Ljava/lang/CharSequence;)Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 201
    .line 202
    .line 203
    return-void
.end method

.method public Z0(Ljava/lang/String;)V
    .locals 3

    .line 1
    const-class v0, Landroid/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "p_vote_send_pop"

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/th0$a;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->act()Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-direct {v1, v2}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 20
    .line 21
    .line 22
    const-string v2, "\u5df2\u6295\u7968"

    .line 23
    .line 24
    invoke-virtual {v1, v2}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const/4 v2, 0x0

    .line 29
    invoke-virtual {v1, v2}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    const-string v2, "\u5206\u4eab\u89c2\u70b9\u5230\u52a8\u6001\uff0c\u6536\u83b7\u66f4\u591a\u4e92\u52a8"

    .line 34
    .line 35
    invoke-virtual {v1, v2}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    const-string v2, "\u53d1\u5e03"

    .line 40
    .line 41
    invoke-virtual {v1, v2}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    new-instance v2, Ll/tug;

    .line 46
    .line 47
    invoke-direct {v2, p0, p1}, Ll/tug;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v1, v2}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    const-string v1, "\u53d6\u6d88"

    .line 55
    .line 56
    invoke-virtual {p1, v1}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    new-instance v1, Ll/uug;

    .line 61
    .line 62
    invoke-direct {v1, v0}, Ll/uug;-><init>(Ll/l4g0;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p1, v1}, Ll/th0$a;->m(Landroid/content/DialogInterface$OnDismissListener;)Ll/th0$a;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    new-instance v1, Ll/vug;

    .line 70
    .line 71
    invoke-direct {v1, p0}, Ll/vug;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p1, v1}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 83
    .line 84
    .line 85
    const-string p0, "source_page"

    .line 86
    .line 87
    const-string p1, "vote"

    .line 88
    .line 89
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    filled-new-array {p0}, [Ll/pf60;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-virtual {v0, p0}, Ll/l4g0;->p([Ll/pf60;)V

    .line 98
    .line 99
    .line 100
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public final a1(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/TopicMoment;Z)V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->d1(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/TopicMoment;ZI)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final d1(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/TopicMoment;ZI)V
    .locals 0

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object p3, p2, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 5
    .line 6
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/TopicMoment;->owner:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 7
    .line 8
    iget-object p2, p2, Lcom/p1/mobile/putong/data/IdBoxed;->id:Ljava/lang/String;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {p1, p3, p2, p0, p4}, Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationAct;->Y1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Landroid/content/Intent;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final f1(Lv/VText;Landroid/view/View;Landroid/widget/TextView;ZII)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->E0:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_2

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    invoke-static {p3, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->k0:I

    .line 14
    .line 15
    const/4 v3, 0x0

    .line 16
    if-ne v2, p6, :cond_0

    .line 17
    .line 18
    invoke-virtual {p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 19
    .line 20
    .line 21
    move-result-object p6

    .line 22
    check-cast p6, Landroid/widget/RelativeLayout;

    .line 23
    .line 24
    invoke-virtual {p6, v0}, Landroid/view/View;->setSelected(Z)V

    .line 25
    .line 26
    .line 27
    sget-object p6, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 28
    .line 29
    invoke-virtual {p6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 30
    .line 31
    .line 32
    move-result-object p6

    .line 33
    sget v0, Ll/lbc0;->T5:I

    .line 34
    .line 35
    invoke-virtual {p6, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 36
    .line 37
    .line 38
    move-result-object p6

    .line 39
    invoke-virtual {p2, p6}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 40
    .line 41
    .line 42
    sget-object p6, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 43
    .line 44
    invoke-virtual {p6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 45
    .line 46
    .line 47
    move-result-object p6

    .line 48
    sget v0, Ll/k9c0;->n:I

    .line 49
    .line 50
    invoke-virtual {p6, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 51
    .line 52
    .line 53
    move-result p6

    .line 54
    invoke-virtual {p1, p6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 58
    .line 59
    .line 60
    move-result-object p6

    .line 61
    sget v0, Ll/lbc0;->c4:I

    .line 62
    .line 63
    invoke-virtual {p6, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 64
    .line 65
    .line 66
    move-result-object p6

    .line 67
    invoke-virtual {p6}, Landroid/graphics/drawable/Drawable;->getMinimumWidth()I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    invoke-virtual {p6}, Landroid/graphics/drawable/Drawable;->getMinimumHeight()I

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    invoke-virtual {p6, v1, v1, v0, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p1, p6, v3, v3, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 79
    .line 80
    .line 81
    const/high16 p6, 0x41000000    # 8.0f

    .line 82
    .line 83
    invoke-static {p6}, Ll/qa00;->d(F)I

    .line 84
    .line 85
    .line 86
    move-result p6

    .line 87
    invoke-virtual {p1, p6}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 88
    .line 89
    .line 90
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 91
    .line 92
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    sget p6, Ll/k9c0;->n:I

    .line 97
    .line 98
    invoke-virtual {p1, p6}, Landroid/content/res/Resources;->getColor(I)I

    .line 99
    .line 100
    .line 101
    move-result p1

    .line 102
    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 103
    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_0
    sget-object p6, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 107
    .line 108
    invoke-virtual {p6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 109
    .line 110
    .line 111
    move-result-object p6

    .line 112
    sget v0, Ll/lbc0;->S5:I

    .line 113
    .line 114
    invoke-virtual {p6, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 115
    .line 116
    .line 117
    move-result-object p6

    .line 118
    invoke-virtual {p2, p6}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 119
    .line 120
    .line 121
    sget-object p6, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 122
    .line 123
    invoke-virtual {p6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 124
    .line 125
    .line 126
    move-result-object p6

    .line 127
    sget v0, Ll/k9c0;->P:I

    .line 128
    .line 129
    invoke-virtual {p6, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 130
    .line 131
    .line 132
    move-result p6

    .line 133
    invoke-virtual {p1, p6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 134
    .line 135
    .line 136
    invoke-virtual {p1, v3, v3, v3, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 137
    .line 138
    .line 139
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 140
    .line 141
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    sget p6, Ll/k9c0;->l:I

    .line 146
    .line 147
    invoke-virtual {p1, p6}, Landroid/content/res/Resources;->getColor(I)I

    .line 148
    .line 149
    .line 150
    move-result p1

    .line 151
    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 152
    .line 153
    .line 154
    :goto_0
    if-eqz p4, :cond_1

    .line 155
    .line 156
    invoke-virtual {p0, p2, p3, p5}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->z0(Landroid/view/View;Landroid/widget/TextView;I)V

    .line 157
    .line 158
    .line 159
    return-void

    .line 160
    :cond_1
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->W:I

    .line 161
    .line 162
    invoke-virtual {p0, p5, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->D0(II)Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object p1

    .line 166
    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 167
    .line 168
    .line 169
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->W:I

    .line 170
    .line 171
    invoke-virtual {p0, p2, p5, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->Y0(Landroid/view/View;II)V

    .line 172
    .line 173
    .line 174
    return-void

    .line 175
    :cond_2
    invoke-static {p3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 176
    .line 177
    .line 178
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 179
    .line 180
    .line 181
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 182
    .line 183
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 184
    .line 185
    .line 186
    move-result-object p0

    .line 187
    sget p2, Ll/k9c0;->L:I

    .line 188
    .line 189
    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getColor(I)I

    .line 190
    .line 191
    .line 192
    move-result p0

    .line 193
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 194
    .line 195
    .line 196
    return-void
.end method

.method public h1(ZZ)V
    .locals 10

    .line 1
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->V:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v7

    .line 7
    const/4 v8, 0x1

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    if-eqz p2, :cond_0

    .line 11
    .line 12
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->W:I

    .line 13
    .line 14
    add-int/2addr v1, v8

    .line 15
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->W:I

    .line 16
    .line 17
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->D:Landroid/widget/RelativeLayout;

    .line 18
    .line 19
    const/4 v9, 0x0

    .line 20
    if-lez v7, :cond_2

    .line 21
    .line 22
    invoke-static {v1, v8}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->F:Lv/VText;

    .line 26
    .line 27
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->V:Ljava/util/List;

    .line 28
    .line 29
    invoke-interface {v2, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    check-cast v2, Lcom/p1/mobile/putong/feed/data/VoteOptions;

    .line 34
    .line 35
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/VoteOptions;->values:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 38
    .line 39
    .line 40
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->k0:I

    .line 41
    .line 42
    if-nez v1, :cond_1

    .line 43
    .line 44
    if-eqz p1, :cond_1

    .line 45
    .line 46
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->V:Ljava/util/List;

    .line 47
    .line 48
    invoke-interface {v1, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    check-cast v1, Lcom/p1/mobile/putong/feed/data/VoteOptions;

    .line 53
    .line 54
    iget v1, v1, Lcom/p1/mobile/putong/feed/data/VoteOptions;->counter:I

    .line 55
    .line 56
    add-int/2addr v1, v8

    .line 57
    :goto_0
    move v5, v1

    .line 58
    goto :goto_1

    .line 59
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->V:Ljava/util/List;

    .line 60
    .line 61
    invoke-interface {v1, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    check-cast v1, Lcom/p1/mobile/putong/feed/data/VoteOptions;

    .line 66
    .line 67
    iget v1, v1, Lcom/p1/mobile/putong/feed/data/VoteOptions;->counter:I

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :goto_1
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->F:Lv/VText;

    .line 71
    .line 72
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->E:Lv/VText;

    .line 73
    .line 74
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->G:Lv/VText;

    .line 75
    .line 76
    const/4 v6, 0x0

    .line 77
    move-object v0, p0

    .line 78
    move v4, p2

    .line 79
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->f1(Lv/VText;Landroid/view/View;Landroid/widget/TextView;ZII)V

    .line 80
    .line 81
    .line 82
    goto :goto_2

    .line 83
    :cond_2
    invoke-static {v1, v9}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 84
    .line 85
    .line 86
    :goto_2
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->H:Landroid/widget/RelativeLayout;

    .line 87
    .line 88
    if-le v7, v8, :cond_4

    .line 89
    .line 90
    invoke-static {v1, v8}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 91
    .line 92
    .line 93
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->J:Lv/VText;

    .line 94
    .line 95
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->V:Ljava/util/List;

    .line 96
    .line 97
    invoke-interface {v2, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    check-cast v2, Lcom/p1/mobile/putong/feed/data/VoteOptions;

    .line 102
    .line 103
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/VoteOptions;->values:Ljava/lang/String;

    .line 104
    .line 105
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 106
    .line 107
    .line 108
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->k0:I

    .line 109
    .line 110
    if-ne v1, v8, :cond_3

    .line 111
    .line 112
    if-eqz p1, :cond_3

    .line 113
    .line 114
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->V:Ljava/util/List;

    .line 115
    .line 116
    invoke-interface {v1, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    check-cast v1, Lcom/p1/mobile/putong/feed/data/VoteOptions;

    .line 121
    .line 122
    iget v1, v1, Lcom/p1/mobile/putong/feed/data/VoteOptions;->counter:I

    .line 123
    .line 124
    add-int/2addr v1, v8

    .line 125
    :goto_3
    move v5, v1

    .line 126
    goto :goto_4

    .line 127
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->V:Ljava/util/List;

    .line 128
    .line 129
    invoke-interface {v1, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    check-cast v1, Lcom/p1/mobile/putong/feed/data/VoteOptions;

    .line 134
    .line 135
    iget v1, v1, Lcom/p1/mobile/putong/feed/data/VoteOptions;->counter:I

    .line 136
    .line 137
    goto :goto_3

    .line 138
    :goto_4
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->J:Lv/VText;

    .line 139
    .line 140
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->I:Lv/VText;

    .line 141
    .line 142
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->K:Lv/VText;

    .line 143
    .line 144
    const/4 v6, 0x1

    .line 145
    move-object v0, p0

    .line 146
    move v4, p2

    .line 147
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->f1(Lv/VText;Landroid/view/View;Landroid/widget/TextView;ZII)V

    .line 148
    .line 149
    .line 150
    goto :goto_5

    .line 151
    :cond_4
    invoke-static {v1, v9}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 152
    .line 153
    .line 154
    :goto_5
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->L:Landroid/widget/RelativeLayout;

    .line 155
    .line 156
    const/4 v2, 0x2

    .line 157
    if-le v7, v2, :cond_6

    .line 158
    .line 159
    invoke-static {v1, v8}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 160
    .line 161
    .line 162
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->N:Lv/VText;

    .line 163
    .line 164
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->V:Ljava/util/List;

    .line 165
    .line 166
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 167
    .line 168
    .line 169
    move-result-object v3

    .line 170
    check-cast v3, Lcom/p1/mobile/putong/feed/data/VoteOptions;

    .line 171
    .line 172
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/data/VoteOptions;->values:Ljava/lang/String;

    .line 173
    .line 174
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 175
    .line 176
    .line 177
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->k0:I

    .line 178
    .line 179
    if-ne v1, v2, :cond_5

    .line 180
    .line 181
    if-eqz p1, :cond_5

    .line 182
    .line 183
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->V:Ljava/util/List;

    .line 184
    .line 185
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 186
    .line 187
    .line 188
    move-result-object v1

    .line 189
    check-cast v1, Lcom/p1/mobile/putong/feed/data/VoteOptions;

    .line 190
    .line 191
    iget v1, v1, Lcom/p1/mobile/putong/feed/data/VoteOptions;->counter:I

    .line 192
    .line 193
    add-int/2addr v1, v8

    .line 194
    :goto_6
    move v5, v1

    .line 195
    goto :goto_7

    .line 196
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->V:Ljava/util/List;

    .line 197
    .line 198
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 199
    .line 200
    .line 201
    move-result-object v1

    .line 202
    check-cast v1, Lcom/p1/mobile/putong/feed/data/VoteOptions;

    .line 203
    .line 204
    iget v1, v1, Lcom/p1/mobile/putong/feed/data/VoteOptions;->counter:I

    .line 205
    .line 206
    goto :goto_6

    .line 207
    :goto_7
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->N:Lv/VText;

    .line 208
    .line 209
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->M:Lv/VText;

    .line 210
    .line 211
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->O:Lv/VText;

    .line 212
    .line 213
    const/4 v6, 0x2

    .line 214
    move-object v0, p0

    .line 215
    move v4, p2

    .line 216
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->f1(Lv/VText;Landroid/view/View;Landroid/widget/TextView;ZII)V

    .line 217
    .line 218
    .line 219
    goto :goto_8

    .line 220
    :cond_6
    invoke-static {v1, v9}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 221
    .line 222
    .line 223
    :goto_8
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->P:Landroid/widget/RelativeLayout;

    .line 224
    .line 225
    const/4 v2, 0x3

    .line 226
    if-le v7, v2, :cond_8

    .line 227
    .line 228
    invoke-static {v1, v8}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 229
    .line 230
    .line 231
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->R:Lv/VText;

    .line 232
    .line 233
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->V:Ljava/util/List;

    .line 234
    .line 235
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 236
    .line 237
    .line 238
    move-result-object v3

    .line 239
    check-cast v3, Lcom/p1/mobile/putong/feed/data/VoteOptions;

    .line 240
    .line 241
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/data/VoteOptions;->values:Ljava/lang/String;

    .line 242
    .line 243
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 244
    .line 245
    .line 246
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->k0:I

    .line 247
    .line 248
    if-ne v1, v2, :cond_7

    .line 249
    .line 250
    if-eqz p1, :cond_7

    .line 251
    .line 252
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->V:Ljava/util/List;

    .line 253
    .line 254
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 255
    .line 256
    .line 257
    move-result-object v1

    .line 258
    check-cast v1, Lcom/p1/mobile/putong/feed/data/VoteOptions;

    .line 259
    .line 260
    iget v1, v1, Lcom/p1/mobile/putong/feed/data/VoteOptions;->counter:I

    .line 261
    .line 262
    add-int/2addr v1, v8

    .line 263
    :goto_9
    move v5, v1

    .line 264
    goto :goto_a

    .line 265
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->V:Ljava/util/List;

    .line 266
    .line 267
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 268
    .line 269
    .line 270
    move-result-object v1

    .line 271
    check-cast v1, Lcom/p1/mobile/putong/feed/data/VoteOptions;

    .line 272
    .line 273
    iget v1, v1, Lcom/p1/mobile/putong/feed/data/VoteOptions;->counter:I

    .line 274
    .line 275
    goto :goto_9

    .line 276
    :goto_a
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->R:Lv/VText;

    .line 277
    .line 278
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->Q:Lv/VText;

    .line 279
    .line 280
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->S:Lv/VText;

    .line 281
    .line 282
    const/4 v6, 0x3

    .line 283
    move-object v0, p0

    .line 284
    move v4, p2

    .line 285
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->f1(Lv/VText;Landroid/view/View;Landroid/widget/TextView;ZII)V

    .line 286
    .line 287
    .line 288
    goto :goto_b

    .line 289
    :cond_8
    invoke-static {v1, v9}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 290
    .line 291
    .line 292
    :goto_b
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->T:Lv/VText;

    .line 293
    .line 294
    invoke-static {v1, v8}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 295
    .line 296
    .line 297
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->W:I

    .line 298
    .line 299
    if-ne v1, v8, :cond_9

    .line 300
    .line 301
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->act()Lcom/p1/mobile/android/app/Act;

    .line 302
    .line 303
    .line 304
    move-result-object v1

    .line 305
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->H2:I

    .line 306
    .line 307
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 308
    .line 309
    .line 310
    move-result-object v1

    .line 311
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->W:I

    .line 312
    .line 313
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 314
    .line 315
    .line 316
    move-result-object v2

    .line 317
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 318
    .line 319
    .line 320
    move-result-object v2

    .line 321
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 322
    .line 323
    .line 324
    move-result-object v1

    .line 325
    goto :goto_c

    .line 326
    :cond_9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->act()Lcom/p1/mobile/android/app/Act;

    .line 327
    .line 328
    .line 329
    move-result-object v1

    .line 330
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->I2:I

    .line 331
    .line 332
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 333
    .line 334
    .line 335
    move-result-object v1

    .line 336
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->W:I

    .line 337
    .line 338
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 339
    .line 340
    .line 341
    move-result-object v2

    .line 342
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 343
    .line 344
    .line 345
    move-result-object v2

    .line 346
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 347
    .line 348
    .line 349
    move-result-object v1

    .line 350
    :goto_c
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->T:Lv/VText;

    .line 351
    .line 352
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 353
    .line 354
    .line 355
    return-void
.end method

.method public r()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->I0:Ll/fvg;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/fvg;->h()Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->I0:Ll/fvg;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/fvg;->f()Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->a:Landroid/view/View;

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->I0:Ll/fvg;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/fvg;->i()Lv/VLinear;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->b:Lv/VLinear;

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->I0:Ll/fvg;

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/fvg;->E()Landroid/widget/TextView;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->c:Landroid/widget/TextView;

    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->I0:Ll/fvg;

    .line 34
    .line 35
    invoke-virtual {v0}, Ll/fvg;->F()Lv/VText;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->d:Lv/VText;

    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->I0:Ll/fvg;

    .line 42
    .line 43
    invoke-virtual {v0}, Ll/fvg;->e()Lv/VLinear;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->e:Landroid/view/View;

    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->I0:Ll/fvg;

    .line 50
    .line 51
    invoke-virtual {v0}, Ll/fvg;->j()Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->f:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->I0:Ll/fvg;

    .line 58
    .line 59
    invoke-virtual {v0}, Ll/fvg;->k()Lv/VText;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->g:Lv/VText;

    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->I0:Ll/fvg;

    .line 66
    .line 67
    invoke-virtual {v0}, Ll/fvg;->C()Landroid/widget/LinearLayout;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->C:Landroid/widget/LinearLayout;

    .line 72
    .line 73
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->I0:Ll/fvg;

    .line 74
    .line 75
    invoke-virtual {v0}, Ll/fvg;->q()Landroid/widget/RelativeLayout;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->D:Landroid/widget/RelativeLayout;

    .line 80
    .line 81
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->I0:Ll/fvg;

    .line 82
    .line 83
    invoke-virtual {v0}, Ll/fvg;->t()Lv/VText;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->E:Lv/VText;

    .line 88
    .line 89
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->I0:Ll/fvg;

    .line 90
    .line 91
    invoke-virtual {v0}, Ll/fvg;->s()Lv/VText;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->F:Lv/VText;

    .line 96
    .line 97
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->I0:Ll/fvg;

    .line 98
    .line 99
    invoke-virtual {v0}, Ll/fvg;->r()Lv/VText;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->G:Lv/VText;

    .line 104
    .line 105
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->I0:Ll/fvg;

    .line 106
    .line 107
    invoke-virtual {v0}, Ll/fvg;->y()Landroid/widget/RelativeLayout;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->H:Landroid/widget/RelativeLayout;

    .line 112
    .line 113
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->I0:Ll/fvg;

    .line 114
    .line 115
    invoke-virtual {v0}, Ll/fvg;->B()Lv/VText;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->I:Lv/VText;

    .line 120
    .line 121
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->I0:Ll/fvg;

    .line 122
    .line 123
    invoke-virtual {v0}, Ll/fvg;->A()Lv/VText;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->J:Lv/VText;

    .line 128
    .line 129
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->I0:Ll/fvg;

    .line 130
    .line 131
    invoke-virtual {v0}, Ll/fvg;->z()Lv/VText;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->K:Lv/VText;

    .line 136
    .line 137
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->I0:Ll/fvg;

    .line 138
    .line 139
    invoke-virtual {v0}, Ll/fvg;->u()Landroid/widget/RelativeLayout;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->L:Landroid/widget/RelativeLayout;

    .line 144
    .line 145
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->I0:Ll/fvg;

    .line 146
    .line 147
    invoke-virtual {v0}, Ll/fvg;->x()Lv/VText;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->M:Lv/VText;

    .line 152
    .line 153
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->I0:Ll/fvg;

    .line 154
    .line 155
    invoke-virtual {v0}, Ll/fvg;->w()Lv/VText;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->N:Lv/VText;

    .line 160
    .line 161
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->I0:Ll/fvg;

    .line 162
    .line 163
    invoke-virtual {v0}, Ll/fvg;->v()Lv/VText;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->O:Lv/VText;

    .line 168
    .line 169
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->I0:Ll/fvg;

    .line 170
    .line 171
    invoke-virtual {v0}, Ll/fvg;->m()Landroid/widget/RelativeLayout;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->P:Landroid/widget/RelativeLayout;

    .line 176
    .line 177
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->I0:Ll/fvg;

    .line 178
    .line 179
    invoke-virtual {v0}, Ll/fvg;->p()Lv/VText;

    .line 180
    .line 181
    .line 182
    move-result-object v0

    .line 183
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->Q:Lv/VText;

    .line 184
    .line 185
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->I0:Ll/fvg;

    .line 186
    .line 187
    invoke-virtual {v0}, Ll/fvg;->o()Lv/VText;

    .line 188
    .line 189
    .line 190
    move-result-object v0

    .line 191
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->R:Lv/VText;

    .line 192
    .line 193
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->I0:Ll/fvg;

    .line 194
    .line 195
    invoke-virtual {v0}, Ll/fvg;->n()Lv/VText;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->S:Lv/VText;

    .line 200
    .line 201
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->I0:Ll/fvg;

    .line 202
    .line 203
    invoke-virtual {v0}, Ll/fvg;->D()Lv/VText;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->T:Lv/VText;

    .line 208
    .line 209
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->I0:Ll/fvg;

    .line 210
    .line 211
    invoke-virtual {v0}, Ll/fvg;->g()Landroid/view/View;

    .line 212
    .line 213
    .line 214
    move-result-object v0

    .line 215
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->h:Landroid/view/View;

    .line 216
    .line 217
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->I0:Ll/fvg;

    .line 218
    .line 219
    invoke-virtual {v0}, Ll/fvg;->l()Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;

    .line 220
    .line 221
    .line 222
    move-result-object v0

    .line 223
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->U:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;

    .line 224
    .line 225
    return-void
.end method

.method public setVoteAggregationActClickable(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->J0:Z

    .line 2
    .line 3
    return-void
.end method

.method public final z0(Landroid/view/View;Landroid/widget/TextView;I)V
    .locals 4

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->W:I

    .line 2
    .line 3
    invoke-virtual {p0, p3, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->H0(II)D

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    const-wide/high16 v2, 0x4059000000000000L    # 100.0

    .line 8
    .line 9
    mul-double/2addr v2, v0

    .line 10
    double-to-int p3, v2

    .line 11
    const/4 v2, 0x0

    .line 12
    filled-new-array {v2, p3}, [I

    .line 13
    .line 14
    .line 15
    move-result-object p3

    .line 16
    invoke-static {p3}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 17
    .line 18
    .line 19
    move-result-object p3

    .line 20
    new-instance v2, Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 21
    .line 22
    invoke-direct {v2}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p3, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 26
    .line 27
    .line 28
    const-wide v2, 0x408f400000000000L    # 1000.0

    .line 29
    .line 30
    .line 31
    .line 32
    .line 33
    mul-double/2addr v0, v2

    .line 34
    double-to-int v0, v0

    .line 35
    int-to-long v0, v0

    .line 36
    invoke-virtual {p3, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 37
    .line 38
    .line 39
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView$a;

    .line 40
    .line 41
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView$a;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p3, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 45
    .line 46
    .line 47
    new-instance v0, Ll/bvg;

    .line 48
    .line 49
    invoke-direct {v0, p0, p1, p2}, Ll/bvg;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;Landroid/view/View;Landroid/widget/TextView;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p3, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p3}, Landroid/animation/ValueAnimator;->start()V

    .line 56
    .line 57
    .line 58
    return-void
.end method
