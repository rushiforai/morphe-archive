.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVideoView;
.super Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;
.source "SourceFile"

# interfaces
.implements Ll/stl;


# static fields
.field public static H:I = 0x6


# instance fields
.field public B:Lcom/p1/mobile/putong/feed/ui/PlayerView;

.field public C:I

.field public D:I

.field public E:Ll/hug;

.field public F:Ll/mug;

.field public G:Ll/ie80;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    sget p1, Ll/cai;->c:I

    .line 5
    .line 6
    invoke-static {p1}, Ll/cai;->d(I)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVideoView;->C:I

    .line 11
    .line 12
    sget p1, Ll/cai;->c:I

    .line 13
    .line 14
    sget v0, Ll/cai;->d:I

    .line 15
    .line 16
    invoke-static {p1, v0}, Ll/cai;->c(II)I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVideoView;->D:I

    .line 21
    .line 22
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 23
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 24
    sget p1, Ll/cai;->c:I

    invoke-static {p1}, Ll/cai;->d(I)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVideoView;->C:I

    .line 25
    sget p1, Ll/cai;->c:I

    sget p2, Ll/cai;->d:I

    .line 26
    invoke-static {p1, p2}, Ll/cai;->c(II)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVideoView;->D:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 27
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 28
    sget p1, Ll/cai;->c:I

    invoke-static {p1}, Ll/cai;->d(I)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVideoView;->C:I

    .line 29
    sget p1, Ll/cai;->c:I

    sget p2, Ll/cai;->d:I

    .line 30
    invoke-static {p1, p2}, Ll/cai;->c(II)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVideoView;->D:I

    return-void
.end method


# virtual methods
.method public C()V
    .locals 1

    .line 1
    new-instance v0, Ll/hug;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/hug;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVideoView;->E:Ll/hug;

    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ll/hug;->E(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVideoView;)V

    .line 9
    .line 10
    .line 11
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
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVideoView;->E:Ll/hug;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/hug;->m()Lv/VText;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {}, Ll/j4h;->d()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    iget-boolean v1, p2, Lcom/p1/mobile/putong/feed/data/Moment;->isLive:Z

    .line 17
    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    new-instance v0, Ll/gug;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->act()Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVideoView;->E:Ll/hug;

    .line 31
    .line 32
    invoke-direct {v0, v1, v2, p0}, Ll/gug;-><init>(Lcom/p1/mobile/android/app/Act;Ll/hug;Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVideoView;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVideoView;->setFeedCenterImageState(Ll/mug;)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVideoView;->F:Ll/mug;

    .line 39
    .line 40
    invoke-virtual {p0, p1, p2, p3}, Ll/mug;->l(ILcom/p1/mobile/putong/feed/data/Moment;Ljava/util/HashMap;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    iget-object v1, p2, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 45
    .line 46
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-eqz v1, :cond_1

    .line 51
    .line 52
    iget-object v1, p2, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 53
    .line 54
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    if-eqz v1, :cond_1

    .line 59
    .line 60
    new-instance v1, Ll/eug;

    .line 61
    .line 62
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->act()Lcom/p1/mobile/android/app/Act;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVideoView;->E:Ll/hug;

    .line 67
    .line 68
    invoke-direct {v1, v2, v3, p0}, Ll/eug;-><init>(Lcom/p1/mobile/android/app/Act;Ll/hug;Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVideoView;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVideoView;->setFeedCenterImageState(Ll/mug;)V

    .line 72
    .line 73
    .line 74
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVideoView;->F:Ll/mug;

    .line 75
    .line 76
    invoke-virtual {v1, p1, p2, p3}, Ll/mug;->l(ILcom/p1/mobile/putong/feed/data/Moment;Ljava/util/HashMap;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0, v0, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->X(Lv/VText;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->Y(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 83
    .line 84
    .line 85
    :cond_1
    return-void
.end method

.method public getPlayerView()Lcom/p1/mobile/putong/feed/ui/PlayerView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVideoView;->B:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 2
    .line 3
    return-object p0
.end method

.method public l0(ILcom/p1/mobile/putong/feed/data/Moment;Ljava/util/HashMap;I)V
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
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVideoView;->Z(ILcom/p1/mobile/putong/feed/data/Moment;Ljava/util/HashMap;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public mute(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVideoView;->B:Lcom/p1/mobile/putong/feed/ui/PlayerView;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVideoView;->B:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->K(Z)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public pause()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVideoView;->B:Lcom/p1/mobile/putong/feed/ui/PlayerView;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVideoView;->B:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->D()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVideoView;->B:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->M()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public play()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVideoView;->G:Ll/ie80;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/ye80;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/ye80;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVideoView;->G:Ll/ie80;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVideoView;->B:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVideoView;->B:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVideoView;->G:Ll/ie80;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->setPlayer(Ll/ie80;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVideoView;->B:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->N()V

    .line 30
    .line 31
    .line 32
    :cond_1
    return-void
.end method

.method public r()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVideoView;->E:Ll/hug;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/hug;->g()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->a:Landroid/view/View;

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVideoView;->E:Ll/hug;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/hug;->k()Lv/VLinear;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->b:Lv/VLinear;

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVideoView;->E:Ll/hug;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/hug;->C()Landroid/widget/TextView;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->c:Landroid/widget/TextView;

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVideoView;->E:Ll/hug;

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/hug;->D()Lv/VText;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->d:Lv/VText;

    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVideoView;->E:Ll/hug;

    .line 34
    .line 35
    invoke-virtual {v0}, Ll/hug;->e()Lv/VLinear;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->e:Landroid/view/View;

    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVideoView;->E:Ll/hug;

    .line 42
    .line 43
    invoke-virtual {v0}, Ll/hug;->l()Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->f:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVideoView;->E:Ll/hug;

    .line 50
    .line 51
    invoke-virtual {v0}, Ll/hug;->r()Lv/VText;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->g:Lv/VText;

    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVideoView;->E:Ll/hug;

    .line 58
    .line 59
    invoke-virtual {v0}, Ll/hug;->i()Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->h:Landroid/view/View;

    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVideoView;->E:Ll/hug;

    .line 66
    .line 67
    invoke-virtual {v0}, Ll/hug;->B()Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVideoView;->B:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 72
    .line 73
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVideoView;->E:Ll/hug;

    .line 74
    .line 75
    invoke-virtual {v0}, Ll/hug;->h()Landroid/widget/LinearLayout;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->w:Landroid/widget/LinearLayout;

    .line 80
    .line 81
    return-void
.end method

.method public setFeedCenterImageState(Ll/mug;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVideoView;->F:Ll/mug;

    .line 2
    .line 3
    return-void
.end method

.method public stop()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVideoView;->B:Lcom/p1/mobile/putong/feed/ui/PlayerView;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVideoView;->B:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->R()V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVideoView;->B:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->setPlayer(Ll/ie80;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method
