.class public Ll/itg;
.super Ll/ptg;
.source "SourceFile"


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/mtg;Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterImageView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/ptg;-><init>(Lcom/p1/mobile/android/app/Act;Ll/mtg;Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterImageView;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Ll/itg;Ll/z20;Lcom/p1/mobile/putong/feed/data/Moment;IILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/itg;->f(Ll/z20;Lcom/p1/mobile/putong/feed/data/Moment;IILandroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ll/itg;Ll/z20;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/itg;->g(Ll/z20;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public c(ILcom/p1/mobile/putong/feed/data/Moment;Ljava/util/HashMap;)V
    .locals 3
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
    iget-object p3, p0, Ll/ptg;->s:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterImageView;

    .line 2
    .line 3
    iget-object p3, p3, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterImageView;->E:Ll/z20;

    .line 4
    .line 5
    iget-object v0, p0, Ll/ptg;->l:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p0, v0, v1}, Ll/ptg;->b(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/ptg;->d:Landroid/widget/LinearLayout;

    .line 12
    .line 13
    invoke-virtual {p0, v0, v1}, Ll/ptg;->b(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/ptg;->k:Lv/VText;

    .line 17
    .line 18
    invoke-virtual {p0, v0, v1}, Ll/ptg;->b(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    invoke-static {}, Ll/j4h;->d()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    iget-object v0, p0, Ll/ptg;->o:Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/immomo/svgaplayer/SVGAImageView;->stopAnimation()V

    .line 30
    .line 31
    .line 32
    :cond_0
    iget-object v0, p0, Ll/ptg;->i:Lv/VText;

    .line 33
    .line 34
    invoke-virtual {p0, v0, v1}, Ll/ptg;->b(Landroid/view/View;Z)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/ptg;->j:Landroid/widget/FrameLayout;

    .line 38
    .line 39
    const/4 v1, 0x1

    .line 40
    invoke-virtual {p0, v0, v1}, Ll/ptg;->b(Landroid/view/View;Z)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p2, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 44
    .line 45
    if-nez p1, :cond_1

    .line 46
    .line 47
    const-string p1, "follow"

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    if-ne p1, v1, :cond_2

    .line 51
    .line 52
    const-string p1, "nearby"

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_2
    const-string p1, ""

    .line 56
    .line 57
    :goto_0
    iget-object v1, p0, Ll/ptg;->j:Landroid/widget/FrameLayout;

    .line 58
    .line 59
    new-instance v2, Ll/gtg;

    .line 60
    .line 61
    invoke-direct {v2, p0, p3, p2}, Ll/gtg;-><init>(Ll/itg;Ll/z20;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 62
    .line 63
    .line 64
    invoke-static {p2, v0, v1, p1, v2}, Ll/qtg;->e(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/util/List;Landroid/widget/FrameLayout;Ljava/lang/String;Ll/a30;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public final synthetic f(Ll/z20;Lcom/p1/mobile/putong/feed/data/Moment;IILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p5

    .line 5
    if-eqz p5, :cond_0

    .line 6
    .line 7
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p1, p2, p0}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object p0, p0, Ll/ptg;->s:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterImageView;

    .line 16
    .line 17
    invoke-virtual {p0, p4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->c0(I)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic g(Ll/z20;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 6

    .line 1
    check-cast p3, Lv/VDraweeView;

    .line 2
    .line 3
    check-cast p4, Ljava/lang/Integer;

    .line 4
    .line 5
    invoke-virtual {p4}, Ljava/lang/Integer;->intValue()I

    .line 6
    .line 7
    .line 8
    move-result v5

    .line 9
    check-cast p5, Ljava/lang/Integer;

    .line 10
    .line 11
    invoke-virtual {p5}, Ljava/lang/Integer;->intValue()I

    .line 12
    .line 13
    .line 14
    move-result v4

    .line 15
    new-instance v0, Ll/htg;

    .line 16
    .line 17
    move-object v1, p0

    .line 18
    move-object v2, p1

    .line 19
    move-object v3, p2

    .line 20
    invoke-direct/range {v0 .. v5}, Ll/htg;-><init>(Ll/itg;Ll/z20;Lcom/p1/mobile/putong/feed/data/Moment;II)V

    .line 21
    .line 22
    .line 23
    invoke-static {p3, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method
