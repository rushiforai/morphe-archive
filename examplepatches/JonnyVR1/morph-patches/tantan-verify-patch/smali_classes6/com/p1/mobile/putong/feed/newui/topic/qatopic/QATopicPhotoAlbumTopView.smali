.class public Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;
.super Lv/VFrame;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/RelativeLayout;

.field public b:Landroid/widget/FrameLayout;

.field public c:Lv/VDraweeView;

.field public d:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public e:Lv/VDraweeView;

.field public f:Landroid/widget/TextView;

.field public g:Lv/VLinear_FillerMeasure;

.field public h:Lv/VText;

.field public i:Landroid/widget/ImageView;

.field public j:Landroid/widget/ImageView;

.field public k:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/FeedWriterLevelView;

.field public l:Landroid/widget/LinearLayout;

.field public m:Lv/VText;

.field public n:Lv/VText;

.field public o:Ljava/lang/String;

.field public p:Lcom/p1/mobile/putong/feed/data/Moment;

.field public q:Ljava/lang/String;

.field public r:Z

.field public s:Lcom/p1/mobile/putong/data/User;

.field public t:Lcom/p1/mobile/putong/feed/data/TopicMoment;

.field public u:Lcom/p1/mobile/putong/app/PutongFrag;

.field public v:Ll/n570;

.field public w:Ll/ft5;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "photo_album_feed_"

    .line 5
    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->o:Ljava/lang/String;

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->p:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 10
    .line 11
    const-string p1, ""

    .line 12
    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->q:Ljava/lang/String;

    .line 14
    .line 15
    new-instance p1, Ll/ft5;

    .line 16
    .line 17
    invoke-direct {p1}, Ll/ft5;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->w:Ll/ft5;

    .line 21
    .line 22
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 23
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 24
    const-string p1, "photo_album_feed_"

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->o:Ljava/lang/String;

    const/4 p1, 0x0

    .line 25
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->p:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 26
    const-string p1, ""

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->q:Ljava/lang/String;

    .line 27
    new-instance p1, Ll/ft5;

    invoke-direct {p1}, Ll/ft5;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->w:Ll/ft5;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 28
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 29
    const-string p1, "photo_album_feed_"

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->o:Ljava/lang/String;

    const/4 p1, 0x0

    .line 30
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->p:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 31
    const-string p1, ""

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->q:Ljava/lang/String;

    .line 32
    new-instance p1, Ll/ft5;

    invoke-direct {p1}, Ll/ft5;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->w:Ll/ft5;

    return-void
.end method

.method public static synthetic B(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->Y(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic C(ZLcom/p1/mobile/putong/data/Followship;)V
    .locals 0

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->M0:I

    .line 4
    .line 5
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;I[I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->S(I[I)V

    return-void
.end method

.method public static synthetic F(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic G(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;Lcom/p1/mobile/putong/data/FollowshipStatus;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->W(Lcom/p1/mobile/putong/data/FollowshipStatus;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic K(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->Z(Landroid/view/View;)V

    return-void
.end method

.method private getBubbleInfo()Lcom/p1/mobile/putong/data/BubbleInfo;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->p:Lcom/p1/mobile/putong/feed/data/Moment;

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
    if-eqz v0, :cond_1

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->v:Ll/n570;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->v:Ll/n570;

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/n570;->p()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->v:Ll/n570;

    .line 27
    .line 28
    iget-object v0, v0, Ll/n570;->b:Ll/qn00;

    .line 29
    .line 30
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->p:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 31
    .line 32
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {v0, v2}, Ll/qn00;->c(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    if-nez v0, :cond_0

    .line 39
    .line 40
    return-object v1

    .line 41
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/RawFeed;->states:Ljava/util/List;

    .line 42
    .line 43
    new-instance v1, Ll/qtb0;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Ll/qtb0;-><init>(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;)V

    .line 46
    .line 47
    .line 48
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    check-cast p0, Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 53
    .line 54
    return-object p0

    .line 55
    :cond_1
    return-object v1
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->X(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;Lcom/p1/mobile/putong/data/BubbleInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->R(Lcom/p1/mobile/putong/data/BubbleInfo;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic u(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->V(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic v(ZLcom/p1/mobile/putong/data/Followship;)V
    .locals 0

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->b3:I

    .line 4
    .line 5
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static synthetic w(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic z(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->T(Z)V

    return-void
.end method


# virtual methods
.method public final L(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/cub0;->a(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public M()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->k:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/FeedWriterLevelView;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->k:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/FeedWriterLevelView;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/FeedWriterLevelView;->j()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final N()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->f:Landroid/widget/TextView;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->p:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->labels:Ljava/util/List;

    .line 12
    .line 13
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->p:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->labels:Ljava/util/List;

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lcom/p1/mobile/putong/data/MomentLabels;

    .line 29
    .line 30
    iget-object v0, v0, Lcom/p1/mobile/putong/data/MomentLabels;->display:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-nez v0, :cond_0

    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->f:Landroid/widget/TextView;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->f:Landroid/widget/TextView;

    .line 44
    .line 45
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->p:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 46
    .line 47
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/Moment;->labels:Ljava/util/List;

    .line 48
    .line 49
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    check-cast v1, Lcom/p1/mobile/putong/data/MomentLabels;

    .line 54
    .line 55
    iget-object v1, v1, Lcom/p1/mobile/putong/data/MomentLabels;->display:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->f:Landroid/widget/TextView;

    .line 61
    .line 62
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->f:Landroid/widget/TextView;

    .line 67
    .line 68
    invoke-virtual {v1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    check-cast v1, Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    const/high16 v1, 0x41000000    # 8.0f

    .line 79
    .line 80
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    int-to-float v1, v1

    .line 85
    add-float/2addr v0, v1

    .line 86
    float-to-int v0, v0

    .line 87
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->f:Landroid/widget/TextView;

    .line 88
    .line 89
    new-instance v2, Ll/wtb0;

    .line 90
    .line 91
    invoke-direct {v2, p0, v0}, Ll/wtb0;-><init>(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;I)V

    .line 92
    .line 93
    .line 94
    invoke-static {v1, v2}, Ll/bnl0;->Q0(Landroid/view/View;Ll/y20;)V

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->f:Landroid/widget/TextView;

    .line 99
    .line 100
    const/16 v0, 0x8

    .line 101
    .line 102
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public final O(Ljava/lang/String;)Z
    .locals 0

    .line 1
    const-string p0, "qa_latest"

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final P(Lcom/p1/mobile/putong/data/BubbleInfo;)Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_3

    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/BubbleInfo;->checkStateTimeIsValid()Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->act()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    instance-of p1, p1, Lcom/p1/mobile/putong/feed/newui/topic/topicaggregation/TopicAggregationAct;

    .line 16
    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->f:Landroid/widget/TextView;

    .line 20
    .line 21
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->p:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 28
    .line 29
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->labels:Ljava/util/List;

    .line 30
    .line 31
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-nez p1, :cond_1

    .line 36
    .line 37
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->p:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 38
    .line 39
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->labels:Ljava/util/List;

    .line 40
    .line 41
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    check-cast p1, Lcom/p1/mobile/putong/data/MomentLabels;

    .line 46
    .line 47
    iget-object p1, p1, Lcom/p1/mobile/putong/data/MomentLabels;->display:Ljava/lang/String;

    .line 48
    .line 49
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    if-nez p1, :cond_1

    .line 54
    .line 55
    return v0

    .line 56
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->p:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 57
    .line 58
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->hasHeadFrame:Z

    .line 59
    .line 60
    if-eqz p0, :cond_2

    .line 61
    .line 62
    return v0

    .line 63
    :cond_2
    const/4 p0, 0x1

    .line 64
    return p0

    .line 65
    :cond_3
    :goto_0
    return v0
.end method

.method public final Q()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->v:Ll/n570;

    .line 2
    .line 3
    iget-object v0, v0, Ll/n570;->b:Ll/qn00;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->p:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Ll/qn00;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic R(Lcom/p1/mobile/putong/data/BubbleInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->s:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

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

.method public final synthetic S(I[I)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->f:Landroid/widget/TextView;

    .line 2
    .line 3
    new-instance v1, Ll/tmd0;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->p:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->labels:Ljava/util/List;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Lcom/p1/mobile/putong/data/MomentLabels;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/data/MomentLabels;->bgColor:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    const/high16 v3, 0x40a00000    # 5.0f

    .line 23
    .line 24
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    aget v2, p2, v2

    .line 29
    .line 30
    invoke-static {v2, p1}, Ljava/lang/Math;->max(II)I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    const/4 v2, 0x1

    .line 35
    aget p2, p2, v2

    .line 36
    .line 37
    invoke-direct {v1, p0, v3, p1, p2}, Ll/tmd0;-><init>(IIII)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final synthetic T(Z)V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->s:Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    const-string v3, "p_topic_recommend"

    .line 15
    .line 16
    invoke-virtual {v0, v1, p0, v2, v3}, Ll/jka;->m7(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    new-instance v0, Ll/rtb0;

    .line 21
    .line 22
    invoke-direct {v0, p1}, Ll/rtb0;-><init>(Z)V

    .line 23
    .line 24
    .line 25
    new-instance p1, Ll/stb0;

    .line 26
    .line 27
    invoke-direct {p1}, Ll/stb0;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-static {v0, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final synthetic V(Landroid/view/View;)V
    .locals 11

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->s:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    const-string v0, "moments_user_id"

    .line 6
    .line 7
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    filled-new-array {p1}, [Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const-string v0, "e_likeButton"

    .line 16
    .line 17
    const-string v1, "p_topic_recommend"

    .line 18
    .line 19
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 20
    .line 21
    .line 22
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->act()Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->s:Lcom/p1/mobile/putong/data/User;

    .line 31
    .line 32
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->r:Z

    .line 33
    .line 34
    xor-int/lit8 v5, p1, 0x1

    .line 35
    .line 36
    const-string p1, "moment"

    .line 37
    .line 38
    invoke-static {p1}, Lcom/p1/mobile/putong/data/LikeFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LikeFrom;

    .line 39
    .line 40
    .line 41
    move-result-object v7

    .line 42
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->p:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 43
    .line 44
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-eqz p1, :cond_0

    .line 49
    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->p:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 51
    .line 52
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 53
    .line 54
    :goto_0
    move-object v8, p0

    .line 55
    goto :goto_1

    .line 56
    :cond_0
    const/4 p0, 0x0

    .line 57
    goto :goto_0

    .line 58
    :goto_1
    const/4 v9, 0x0

    .line 59
    const/4 v10, 0x0

    .line 60
    const/4 v6, 0x0

    .line 61
    invoke-interface/range {v2 .. v10}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->kn(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;Lcom/p1/mobile/putong/data/LikeFrom;Ljava/lang/String;Ll/y20;Ll/y20;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public final synthetic W(Lcom/p1/mobile/putong/data/FollowshipStatus;Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p2, 0x0

    .line 2
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->a0(Lcom/p1/mobile/putong/data/FollowshipStatus;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic X(Landroid/view/View;)V
    .locals 10

    .line 1
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->p:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->q:Ljava/lang/String;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-static {v1, v2}, Ll/ksg;->K(Ljava/lang/String;Z)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    const/4 v3, 0x1

    .line 15
    invoke-virtual {p1, v0, v1, v3, v2}, Ll/er60;->s(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ZZ)V

    .line 16
    .line 17
    .line 18
    sget-object v4, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->act()Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    .line 23
    move-result-object v5

    .line 24
    iget-object v6, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->s:Lcom/p1/mobile/putong/data/User;

    .line 25
    .line 26
    iget-object v7, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->p:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->q:Ljava/lang/String;

    .line 29
    .line 30
    invoke-static {p0, v2}, Ll/ksg;->K(Ljava/lang/String;Z)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v8

    .line 34
    const/4 v9, 0x0

    .line 35
    invoke-virtual/range {v4 .. v9}, Lcom/p1/mobile/putong/feed/api/b;->f3(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Z)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final synthetic Y(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->p0(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->o0()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic Z(Landroid/view/View;)V
    .locals 1

    .line 1
    new-instance v0, Ll/ytb0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ytb0;-><init>(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final a0(Lcom/p1/mobile/putong/data/FollowshipStatus;Z)V
    .locals 7

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    const-string v0, "following"

    .line 8
    .line 9
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    const-string v0, "matched"

    .line 16
    .line 17
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    :cond_0
    const/4 p1, 0x0

    .line 24
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->j0(Z)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->act()Lcom/p1/mobile/android/app/Act;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->z:I

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v1, Ll/ztb0;

    .line 42
    .line 43
    invoke-direct {v1, p0, p2}, Ll/ztb0;-><init>(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;Z)V

    .line 44
    .line 45
    .line 46
    invoke-static {p1, v0, v1}, Ll/k3h;->v0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_1
    const/4 p1, 0x1

    .line 51
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->j0(Z)V

    .line 52
    .line 53
    .line 54
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->s:Lcom/p1/mobile/putong/data/User;

    .line 55
    .line 56
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 57
    .line 58
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->moments:Lcom/p1/mobile/putong/data/Moments;

    .line 59
    .line 60
    iget-boolean v0, v0, Lcom/p1/mobile/putong/data/Moments;->hidePublicMoments:Z

    .line 61
    .line 62
    if-eqz v0, :cond_2

    .line 63
    .line 64
    invoke-static {p1}, Lcom/p1/mobile/putong/data/User;->isMatched(Lcom/p1/mobile/putong/data/User;)Z

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    if-nez p1, :cond_2

    .line 69
    .line 70
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->q:I

    .line 71
    .line 72
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 77
    .line 78
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->s:Lcom/p1/mobile/putong/data/User;

    .line 87
    .line 88
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->p:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 89
    .line 90
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 91
    .line 92
    iget-object v5, p0, Lcom/p1/mobile/putong/data/Live;->id:Ljava/lang/String;

    .line 93
    .line 94
    const-string v6, "p_topic_recommend"

    .line 95
    .line 96
    const/4 v3, 0x1

    .line 97
    const-string v4, "liveMomentNearby"

    .line 98
    .line 99
    invoke-virtual/range {v0 .. v6}, Ll/jka;->n7(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    new-instance p1, Ll/aub0;

    .line 104
    .line 105
    invoke-direct {p1, p2}, Ll/aub0;-><init>(Z)V

    .line 106
    .line 107
    .line 108
    new-instance p2, Ll/bub0;

    .line 109
    .line 110
    invoke-direct {p2}, Ll/bub0;-><init>()V

    .line 111
    .line 112
    .line 113
    invoke-static {p1, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 118
    .line 119
    .line 120
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method public final b0()V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->s:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->c:Lv/VDraweeView;

    .line 8
    .line 9
    const/16 v2, 0x8

    .line 10
    .line 11
    if-eqz v0, :cond_5

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {v1, v0, v0, v0, v0}, Landroid/view/View;->setPadding(IIII)V

    .line 15
    .line 16
    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->c:Lv/VDraweeView;

    .line 18
    .line 19
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->l0()V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->j:Landroid/widget/ImageView;

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 28
    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->c:Lv/VDraweeView;

    .line 31
    .line 32
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 33
    .line 34
    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->p:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 36
    .line 37
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->c:Lv/VDraweeView;

    .line 38
    .line 39
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->s:Lcom/p1/mobile/putong/data/User;

    .line 40
    .line 41
    invoke-static {v1, v2, v3}, Ll/at0;->e(Lcom/p1/mobile/putong/feed/data/Moment;Lv/VDraweeView;Lcom/p1/mobile/putong/data/User;)V

    .line 42
    .line 43
    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->h:Lv/VText;

    .line 45
    .line 46
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->p:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 47
    .line 48
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->s:Lcom/p1/mobile/putong/data/User;

    .line 49
    .line 50
    iget-object v3, v3, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 51
    .line 52
    invoke-static {v2, v3}, Ll/at0;->a(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 57
    .line 58
    .line 59
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->h:Lv/VText;

    .line 60
    .line 61
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->s:Lcom/p1/mobile/putong/data/User;

    .line 62
    .line 63
    invoke-static {v2}, Ll/cai;->b(Lcom/p1/mobile/putong/data/User;)I

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 68
    .line 69
    .line 70
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->p:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 71
    .line 72
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 73
    .line 74
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    if-nez v1, :cond_0

    .line 79
    .line 80
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->s:Lcom/p1/mobile/putong/data/User;

    .line 81
    .line 82
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 83
    .line 84
    new-instance v2, Ljava/lang/StringBuilder;

    .line 85
    .line 86
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    const-string v3, "\uff1a"

    .line 93
    .line 94
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->p:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 98
    .line 99
    iget-object v4, v4, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 100
    .line 101
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    new-instance v4, Landroid/text/SpannableString;

    .line 109
    .line 110
    invoke-direct {v4, v2}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 111
    .line 112
    .line 113
    new-instance v5, Landroid/text/style/ForegroundColorSpan;

    .line 114
    .line 115
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->act()Lcom/p1/mobile/android/app/Act;

    .line 116
    .line 117
    .line 118
    move-result-object v6

    .line 119
    invoke-virtual {v6}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 120
    .line 121
    .line 122
    move-result-object v6

    .line 123
    sget v7, Ll/k9c0;->e0:I

    .line 124
    .line 125
    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getColor(I)I

    .line 126
    .line 127
    .line 128
    move-result v6

    .line 129
    invoke-direct {v5, v6}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 130
    .line 131
    .line 132
    new-instance v6, Ljava/lang/StringBuilder;

    .line 133
    .line 134
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 135
    .line 136
    .line 137
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v6

    .line 147
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    .line 148
    .line 149
    .line 150
    move-result v6

    .line 151
    const/16 v7, 0x21

    .line 152
    .line 153
    invoke-virtual {v4, v5, v0, v6, v7}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 154
    .line 155
    .line 156
    new-instance v5, Landroid/text/style/ForegroundColorSpan;

    .line 157
    .line 158
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->act()Lcom/p1/mobile/android/app/Act;

    .line 159
    .line 160
    .line 161
    move-result-object v6

    .line 162
    invoke-virtual {v6}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 163
    .line 164
    .line 165
    move-result-object v6

    .line 166
    sget v8, Ll/k9c0;->c0:I

    .line 167
    .line 168
    invoke-virtual {v6, v8}, Landroid/content/res/Resources;->getColor(I)I

    .line 169
    .line 170
    .line 171
    move-result v6

    .line 172
    invoke-direct {v5, v6}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 173
    .line 174
    .line 175
    new-instance v6, Ljava/lang/StringBuilder;

    .line 176
    .line 177
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 178
    .line 179
    .line 180
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 184
    .line 185
    .line 186
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object v1

    .line 190
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 191
    .line 192
    .line 193
    move-result v1

    .line 194
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 195
    .line 196
    .line 197
    move-result v2

    .line 198
    invoke-virtual {v4, v5, v1, v2, v7}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 199
    .line 200
    .line 201
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->act()Lcom/p1/mobile/android/app/Act;

    .line 202
    .line 203
    .line 204
    move-result-object v1

    .line 205
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->s:Lcom/p1/mobile/putong/data/User;

    .line 206
    .line 207
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->i:Landroid/widget/ImageView;

    .line 208
    .line 209
    const/4 v4, 0x1

    .line 210
    invoke-static {v1, v2, v3, v4, v0}, Ll/orb0;->y(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Landroid/widget/ImageView;ZZ)V

    .line 211
    .line 212
    .line 213
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->i:Landroid/widget/ImageView;

    .line 214
    .line 215
    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    .line 216
    .line 217
    .line 218
    move-result v1

    .line 219
    if-nez v1, :cond_1

    .line 220
    .line 221
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->i:Landroid/widget/ImageView;

    .line 222
    .line 223
    invoke-virtual {v1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 224
    .line 225
    .line 226
    move-result-object v2

    .line 227
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->i:Landroid/widget/ImageView;

    .line 228
    .line 229
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 230
    .line 231
    .line 232
    move-result-object v3

    .line 233
    iget v3, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 234
    .line 235
    invoke-static {v1, v2, v3}, Ll/ksg;->D0(Landroid/view/View;Landroid/graphics/drawable/Drawable;I)V

    .line 236
    .line 237
    .line 238
    :cond_1
    invoke-static {}, Ll/cmg;->m0()Z

    .line 239
    .line 240
    .line 241
    move-result v1

    .line 242
    if-eqz v1, :cond_6

    .line 243
    .line 244
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->t:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 245
    .line 246
    if-eqz v1, :cond_6

    .line 247
    .line 248
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->options:Ljava/util/List;

    .line 249
    .line 250
    if-eqz v1, :cond_6

    .line 251
    .line 252
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 253
    .line 254
    .line 255
    move-result v1

    .line 256
    const/4 v2, 0x2

    .line 257
    if-ne v1, v2, :cond_6

    .line 258
    .line 259
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->Q()Ljava/lang/String;

    .line 260
    .line 261
    .line 262
    move-result-object v1

    .line 263
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 264
    .line 265
    .line 266
    move-result v2

    .line 267
    if-nez v2, :cond_6

    .line 268
    .line 269
    move v2, v0

    .line 270
    :goto_0
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->t:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 271
    .line 272
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/data/TopicMoment;->options:Ljava/util/List;

    .line 273
    .line 274
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 275
    .line 276
    .line 277
    move-result v3

    .line 278
    if-ge v2, v3, :cond_3

    .line 279
    .line 280
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->t:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 281
    .line 282
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/data/TopicMoment;->options:Ljava/util/List;

    .line 283
    .line 284
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 285
    .line 286
    .line 287
    move-result-object v3

    .line 288
    check-cast v3, Lcom/p1/mobile/putong/feed/data/VoteOptions;

    .line 289
    .line 290
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/data/VoteOptions;->id:Ljava/lang/String;

    .line 291
    .line 292
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 293
    .line 294
    .line 295
    move-result v3

    .line 296
    if-eqz v3, :cond_2

    .line 297
    .line 298
    goto :goto_1

    .line 299
    :cond_2
    add-int/lit8 v2, v2, 0x1

    .line 300
    .line 301
    goto :goto_0

    .line 302
    :cond_3
    const/4 v2, -0x1

    .line 303
    :goto_1
    if-nez v2, :cond_4

    .line 304
    .line 305
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->j:Landroid/widget/ImageView;

    .line 306
    .line 307
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 308
    .line 309
    .line 310
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->j:Landroid/widget/ImageView;

    .line 311
    .line 312
    sget v1, Ll/lbc0;->d4:I

    .line 313
    .line 314
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 315
    .line 316
    .line 317
    goto :goto_2

    .line 318
    :cond_4
    if-ne v2, v4, :cond_6

    .line 319
    .line 320
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->j:Landroid/widget/ImageView;

    .line 321
    .line 322
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 323
    .line 324
    .line 325
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->j:Landroid/widget/ImageView;

    .line 326
    .line 327
    sget v1, Ll/lbc0;->e4:I

    .line 328
    .line 329
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 330
    .line 331
    .line 332
    goto :goto_2

    .line 333
    :cond_5
    const/4 v0, 0x4

    .line 334
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 335
    .line 336
    .line 337
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->h:Lv/VText;

    .line 338
    .line 339
    const-string v1, ""

    .line 340
    .line 341
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 342
    .line 343
    .line 344
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->j:Landroid/widget/ImageView;

    .line 345
    .line 346
    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 347
    .line 348
    .line 349
    :cond_6
    :goto_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->e0()V

    .line 350
    .line 351
    .line 352
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->h0()V

    .line 353
    .line 354
    .line 355
    return-void
.end method

.method public c0(Ll/n570;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    iput-boolean p4, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->r:Z

    .line 2
    .line 3
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->q:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->p:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->N()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->l0()V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->v:Ll/n570;

    .line 14
    .line 15
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p1, p2}, Ll/n570;->m(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->s:Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->b0()V

    .line 24
    .line 25
    .line 26
    invoke-static {}, Ll/cmg;->k0()Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->g0()V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public e0()V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->p:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    invoke-static {v0}, Ll/at0;->d(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/16 v1, 0x8

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->l:Landroid/widget/LinearLayout;

    .line 12
    .line 13
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-static {}, Ll/cmg;->o()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->f0()V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->n:Lv/VText;

    .line 28
    .line 29
    const/4 v2, 0x0

    .line 30
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    invoke-static {}, Ll/gj70;->a()Ll/gj70;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0}, Ll/gj70;->b()Ljava/util/Map;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->q:Ljava/lang/String;

    .line 42
    .line 43
    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Ll/gj70$a;

    .line 48
    .line 49
    invoke-static {}, Ll/cmg;->K()Z

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    if-eqz v3, :cond_3

    .line 54
    .line 55
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    if-eqz v3, :cond_3

    .line 60
    .line 61
    iget-boolean v3, v0, Ll/gj70$a;->a:Z

    .line 62
    .line 63
    if-eqz v3, :cond_3

    .line 64
    .line 65
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->q:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {p0, v3}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->O(Ljava/lang/String;)Z

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    if-nez v3, :cond_3

    .line 72
    .line 73
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->p:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 74
    .line 75
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 76
    .line 77
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 78
    .line 79
    .line 80
    move-result-object v4

    .line 81
    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v4

    .line 85
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result v3

    .line 89
    if-nez v3, :cond_3

    .line 90
    .line 91
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->s:Lcom/p1/mobile/putong/data/User;

    .line 92
    .line 93
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 94
    .line 95
    .line 96
    move-result v3

    .line 97
    if-nez v3, :cond_3

    .line 98
    .line 99
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->l:Landroid/widget/LinearLayout;

    .line 100
    .line 101
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 102
    .line 103
    .line 104
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->s:Lcom/p1/mobile/putong/data/User;

    .line 105
    .line 106
    invoke-static {v0}, Ll/hyh;->i(Lcom/p1/mobile/putong/data/User;)Z

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->l:Landroid/widget/LinearLayout;

    .line 111
    .line 112
    if-eqz v0, :cond_2

    .line 113
    .line 114
    invoke-virtual {v3, v1}, Landroid/view/View;->setVisibility(I)V

    .line 115
    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_2
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    sget v1, Ll/lbc0;->n4:I

    .line 123
    .line 124
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    invoke-virtual {v3, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 129
    .line 130
    .line 131
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->l:Landroid/widget/LinearLayout;

    .line 132
    .line 133
    invoke-virtual {v0, v2}, Landroid/view/View;->setSelected(Z)V

    .line 134
    .line 135
    .line 136
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->m:Lv/VText;

    .line 137
    .line 138
    const-string v1, "#ffffff"

    .line 139
    .line 140
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 141
    .line 142
    .line 143
    move-result v1

    .line 144
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 145
    .line 146
    .line 147
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->m:Lv/VText;

    .line 148
    .line 149
    const-string v1, "\u559c\u6b22"

    .line 150
    .line 151
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 152
    .line 153
    .line 154
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->l:Landroid/widget/LinearLayout;

    .line 155
    .line 156
    new-instance v1, Ll/utb0;

    .line 157
    .line 158
    invoke-direct {v1, p0}, Ll/utb0;-><init>(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;)V

    .line 159
    .line 160
    .line 161
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 162
    .line 163
    .line 164
    return-void

    .line 165
    :cond_3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 166
    .line 167
    .line 168
    move-result v3

    .line 169
    const/4 v4, 0x0

    .line 170
    if-eqz v3, :cond_9

    .line 171
    .line 172
    iget-boolean v0, v0, Ll/gj70$a;->a:Z

    .line 173
    .line 174
    if-eqz v0, :cond_9

    .line 175
    .line 176
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->q:Ljava/lang/String;

    .line 177
    .line 178
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->O(Ljava/lang/String;)Z

    .line 179
    .line 180
    .line 181
    move-result v0

    .line 182
    if-nez v0, :cond_9

    .line 183
    .line 184
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->p:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 185
    .line 186
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 187
    .line 188
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 189
    .line 190
    .line 191
    move-result-object v3

    .line 192
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object v3

    .line 196
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 197
    .line 198
    .line 199
    move-result v0

    .line 200
    if-nez v0, :cond_8

    .line 201
    .line 202
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->s:Lcom/p1/mobile/putong/data/User;

    .line 203
    .line 204
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 205
    .line 206
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 207
    .line 208
    .line 209
    move-result v0

    .line 210
    const-string v3, "matched"

    .line 211
    .line 212
    if-eqz v0, :cond_4

    .line 213
    .line 214
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->s:Lcom/p1/mobile/putong/data/User;

    .line 215
    .line 216
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 217
    .line 218
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 219
    .line 220
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 221
    .line 222
    .line 223
    move-result v0

    .line 224
    if-eqz v0, :cond_4

    .line 225
    .line 226
    goto/16 :goto_2

    .line 227
    .line 228
    :cond_4
    sget v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->k:I

    .line 229
    .line 230
    sget v1, Ll/lbc0;->n4:I

    .line 231
    .line 232
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->l:Landroid/widget/LinearLayout;

    .line 233
    .line 234
    invoke-virtual {v5, v2}, Landroid/view/View;->setSelected(Z)V

    .line 235
    .line 236
    .line 237
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->s:Lcom/p1/mobile/putong/data/User;

    .line 238
    .line 239
    iget-object v5, v5, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 240
    .line 241
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 242
    .line 243
    .line 244
    move-result v5

    .line 245
    const/4 v6, 0x1

    .line 246
    const-string v7, "#ff3a00"

    .line 247
    .line 248
    if-eqz v5, :cond_7

    .line 249
    .line 250
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->s:Lcom/p1/mobile/putong/data/User;

    .line 251
    .line 252
    iget-object v4, v4, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 253
    .line 254
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 255
    .line 256
    const-string v5, "following"

    .line 257
    .line 258
    invoke-static {v4, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 259
    .line 260
    .line 261
    move-result v5

    .line 262
    const-string v8, "#bfbfbf"

    .line 263
    .line 264
    if-eqz v5, :cond_5

    .line 265
    .line 266
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->l:Landroid/widget/LinearLayout;

    .line 267
    .line 268
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 269
    .line 270
    .line 271
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->m:Lv/VText;

    .line 272
    .line 273
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->P2:I

    .line 274
    .line 275
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 276
    .line 277
    .line 278
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->m:Lv/VText;

    .line 279
    .line 280
    invoke-static {v8}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 281
    .line 282
    .line 283
    move-result v1

    .line 284
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 285
    .line 286
    .line 287
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->l:Landroid/widget/LinearLayout;

    .line 288
    .line 289
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 290
    .line 291
    .line 292
    move-result-object v1

    .line 293
    sget v2, Ll/lbc0;->n4:I

    .line 294
    .line 295
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 296
    .line 297
    .line 298
    move-result-object v1

    .line 299
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 300
    .line 301
    .line 302
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->l:Landroid/widget/LinearLayout;

    .line 303
    .line 304
    invoke-virtual {v0, v6}, Landroid/view/View;->setSelected(Z)V

    .line 305
    .line 306
    .line 307
    goto :goto_1

    .line 308
    :cond_5
    invoke-static {v4, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 309
    .line 310
    .line 311
    move-result v3

    .line 312
    if-eqz v3, :cond_6

    .line 313
    .line 314
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->l:Landroid/widget/LinearLayout;

    .line 315
    .line 316
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 317
    .line 318
    .line 319
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->m:Lv/VText;

    .line 320
    .line 321
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->N2:I

    .line 322
    .line 323
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 324
    .line 325
    .line 326
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->m:Lv/VText;

    .line 327
    .line 328
    invoke-static {v8}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 329
    .line 330
    .line 331
    move-result v1

    .line 332
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 333
    .line 334
    .line 335
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->l:Landroid/widget/LinearLayout;

    .line 336
    .line 337
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 338
    .line 339
    .line 340
    move-result-object v1

    .line 341
    sget v2, Ll/lbc0;->n4:I

    .line 342
    .line 343
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 344
    .line 345
    .line 346
    move-result-object v1

    .line 347
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 348
    .line 349
    .line 350
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->l:Landroid/widget/LinearLayout;

    .line 351
    .line 352
    invoke-virtual {v0, v6}, Landroid/view/View;->setSelected(Z)V

    .line 353
    .line 354
    .line 355
    goto :goto_1

    .line 356
    :cond_6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->k0()V

    .line 357
    .line 358
    .line 359
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->l:Landroid/widget/LinearLayout;

    .line 360
    .line 361
    invoke-virtual {v3, v2}, Landroid/view/View;->setVisibility(I)V

    .line 362
    .line 363
    .line 364
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->m:Lv/VText;

    .line 365
    .line 366
    invoke-static {v7}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 367
    .line 368
    .line 369
    move-result v3

    .line 370
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 371
    .line 372
    .line 373
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->m:Lv/VText;

    .line 374
    .line 375
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(I)V

    .line 376
    .line 377
    .line 378
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->l:Landroid/widget/LinearLayout;

    .line 379
    .line 380
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 381
    .line 382
    .line 383
    move-result-object v2

    .line 384
    invoke-virtual {v2, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 385
    .line 386
    .line 387
    move-result-object v1

    .line 388
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 389
    .line 390
    .line 391
    goto :goto_1

    .line 392
    :cond_7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->k0()V

    .line 393
    .line 394
    .line 395
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->l:Landroid/widget/LinearLayout;

    .line 396
    .line 397
    invoke-virtual {v3, v2}, Landroid/view/View;->setVisibility(I)V

    .line 398
    .line 399
    .line 400
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->m:Lv/VText;

    .line 401
    .line 402
    invoke-static {v7}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 403
    .line 404
    .line 405
    move-result v3

    .line 406
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 407
    .line 408
    .line 409
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->m:Lv/VText;

    .line 410
    .line 411
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(I)V

    .line 412
    .line 413
    .line 414
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->l:Landroid/widget/LinearLayout;

    .line 415
    .line 416
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 417
    .line 418
    .line 419
    move-result-object v2

    .line 420
    invoke-virtual {v2, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 421
    .line 422
    .line 423
    move-result-object v1

    .line 424
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 425
    .line 426
    .line 427
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->m:Lv/VText;

    .line 428
    .line 429
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 430
    .line 431
    .line 432
    move-result-object v0

    .line 433
    invoke-virtual {v0, v6}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 434
    .line 435
    .line 436
    goto :goto_3

    .line 437
    :cond_8
    :goto_2
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->l:Landroid/widget/LinearLayout;

    .line 438
    .line 439
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 440
    .line 441
    .line 442
    goto :goto_3

    .line 443
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->l:Landroid/widget/LinearLayout;

    .line 444
    .line 445
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 446
    .line 447
    .line 448
    :goto_3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->l:Landroid/widget/LinearLayout;

    .line 449
    .line 450
    new-instance v1, Ll/vtb0;

    .line 451
    .line 452
    invoke-direct {v1, p0, v4}, Ll/vtb0;-><init>(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;Lcom/p1/mobile/putong/data/FollowshipStatus;)V

    .line 453
    .line 454
    .line 455
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 456
    .line 457
    .line 458
    return-void
.end method

.method public final f0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->l:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->m:Lv/VText;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->n:Lv/VText;

    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->s:Lcom/p1/mobile/putong/data/User;

    .line 19
    .line 20
    invoke-static {v0}, Lcom/p1/mobile/putong/data/User;->isMatched(Lcom/p1/mobile/putong/data/User;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->n:Lv/VText;

    .line 25
    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    const-string v0, "\u804a\u5929"

    .line 29
    .line 30
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const-string v0, "\u6253\u62db\u547c"

    .line 35
    .line 36
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 37
    .line 38
    .line 39
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->n:Lv/VText;

    .line 40
    .line 41
    const/4 v2, 0x0

    .line 42
    invoke-virtual {v0, v2, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->n:Lv/VText;

    .line 46
    .line 47
    new-instance v1, Ll/xtb0;

    .line 48
    .line 49
    invoke-direct {v1, p0}, Ll/xtb0;-><init>(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;)V

    .line 50
    .line 51
    .line 52
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public final g0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->s:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->getBubbleInfo()Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->P(Lcom/p1/mobile/putong/data/BubbleInfo;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->d:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 23
    .line 24
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    iget-object v1, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 30
    .line 31
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_1

    .line 36
    .line 37
    iget-object v1, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 38
    .line 39
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Emotion;->emojiUrl:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-nez v1, :cond_1

    .line 46
    .line 47
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->e:Lv/VDraweeView;

    .line 50
    .line 51
    iget-object v0, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 52
    .line 53
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Emotion;->emojiUrl:Ljava/lang/String;

    .line 54
    .line 55
    sget v2, Ll/qa00;->m:I

    .line 56
    .line 57
    invoke-virtual {v1, p0, v0, v2, v2}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 58
    .line 59
    .line 60
    :cond_1
    :goto_0
    return-void
.end method

.method public final h0()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->k:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/FeedWriterLevelView;

    .line 2
    .line 3
    const/16 v0, 0x8

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final j0(Z)V
    .locals 2

    .line 1
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Ll/er60;->u(Z)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->p:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->s:Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    invoke-virtual {v0, v1, p0}, Ll/er60;->v(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/User;)[Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string v0, "p_topic_recommend"

    .line 22
    .line 23
    invoke-static {p1, v0, p0}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final k0()V
    .locals 2

    .line 1
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->p:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->s:Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    invoke-virtual {v0, v1, p0}, Ll/er60;->v(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/User;)[Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string v0, "e_follow"

    .line 14
    .line 15
    const-string v1, "p_topic_recommend"

    .line 16
    .line 17
    invoke-static {v0, v1, p0}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final l0()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->a:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->h:Lv/VText;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->c:Lv/VDraweeView;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->b:Landroid/widget/FrameLayout;

    .line 8
    .line 9
    const/4 v4, 0x4

    .line 10
    new-array v4, v4, [Landroid/view/View;

    .line 11
    .line 12
    const/4 v5, 0x0

    .line 13
    aput-object v0, v4, v5

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    aput-object v1, v4, v0

    .line 17
    .line 18
    const/4 v0, 0x2

    .line 19
    aput-object v2, v4, v0

    .line 20
    .line 21
    const/4 v0, 0x3

    .line 22
    aput-object v3, v4, v0

    .line 23
    .line 24
    invoke-static {v4}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/ttb0;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/ttb0;-><init>(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final m0(Ljava/lang/String;)V
    .locals 2

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->p:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->act()Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->act()Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->p:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {v1, p0, p1}, Ll/at0;->c(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->act()Lcom/p1/mobile/android/app/Act;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->p:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {v0, p0, v1, p1}, Ll/at0;->i(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final o0()V
    .locals 1

    .line 1
    const-string v0, "from_topic_aggregation"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->m0(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->w:Ll/ft5;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/ft5;->c()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->L(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final p0(Landroid/view/View;)V
    .locals 2

    .line 1
    instance-of p1, p1, Lv/VDraweeView;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->p:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->q:Ljava/lang/String;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {p1, v0, p0, v1}, Ll/er60;->m(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Z)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public setCurrentFrag(Lcom/p1/mobile/putong/app/PutongFrag;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->u:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 2
    .line 3
    return-void
.end method

.method public setTopicMoment(Lcom/p1/mobile/putong/feed/data/TopicMoment;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->t:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 2
    .line 3
    return-void
.end method
