.class public Ll/hai;
.super Ll/jbi;
.source "SourceFile"


# instance fields
.field public o1:Z

.field public p1:Z

.field public q1:Z

.field public r1:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/mxh;)V
    .locals 6

    .line 1
    const/4 v2, 0x0

    .line 2
    const/4 v3, 0x0

    .line 3
    const/4 v1, 0x0

    .line 4
    move-object v0, p0

    .line 5
    move-object v4, p1

    .line 6
    move-object v5, p2

    .line 7
    invoke-direct/range {v0 .. v5}, Ll/jbi;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;ZZLcom/p1/mobile/android/app/Act;Ll/mxh;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    iput-boolean p0, v0, Ll/hai;->q1:Z

    .line 12
    .line 13
    iput-boolean p0, v0, Ll/hai;->r1:Z

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public A1()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yqg;->G:Ll/f0r;

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
    iget-object p0, p0, Ll/yqg;->G:Ll/f0r;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/f0r;->b()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public O(Ll/ixh;)Ll/ogh;
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/yqg;->O(Ll/ixh;)Ll/ogh;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-boolean v0, p0, Ll/hai;->o1:Z

    .line 6
    .line 7
    iput-boolean v0, p1, Ll/ogh;->g:Z

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-boolean v0, p0, Ll/hai;->q1:Z

    .line 11
    .line 12
    return-object p1
.end method

.method public b(Ll/cf60;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/jbi;->b(Ll/cf60;)V

    .line 2
    .line 3
    .line 4
    instance-of v0, p1, Ll/wf70;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    check-cast p1, Ll/wf70;

    .line 9
    .line 10
    iget-boolean p0, p0, Ll/hai;->p1:Z

    .line 11
    .line 12
    invoke-virtual {p1, p0}, Ll/wf70;->f0(Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public e0()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/yqg;->e0()V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x1

    .line 5
    invoke-static {p0}, Ll/wf70;->l0(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public h(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ll/yqg;->h(II)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    :goto_0
    invoke-static {p0}, Ll/wf70;->l0(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public i0(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 6

    .line 1
    invoke-super {p0, p1}, Ll/jbi;->i0(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_2

    .line 9
    .line 10
    invoke-static {}, Ll/cmg;->R()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_2

    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/Moment;->getRecommendReason()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    iget-object p1, p0, Ll/jbi;->Z:Landroid/widget/LinearLayout;

    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Ll/jbi;->k0:Lv/VText;

    .line 33
    .line 34
    const-string v1, ""

    .line 35
    .line 36
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 37
    .line 38
    .line 39
    iput-boolean v0, p0, Ll/hai;->q1:Z

    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    iget-boolean v1, p0, Ll/hai;->q1:Z

    .line 43
    .line 44
    const/4 v2, 0x1

    .line 45
    if-nez v1, :cond_1

    .line 46
    .line 47
    iput-boolean v2, p0, Ll/hai;->q1:Z

    .line 48
    .line 49
    iget-object v1, p0, Ll/yqg;->H:Ll/ogh;

    .line 50
    .line 51
    iget-object v1, v1, Ll/ogh;->h:Ljava/lang/String;

    .line 52
    .line 53
    new-instance v3, Ll/pf60;

    .line 54
    .line 55
    const-string v4, "moment_id"

    .line 56
    .line 57
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 58
    .line 59
    invoke-direct {v3, v4, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    new-instance p1, Ll/pf60;

    .line 63
    .line 64
    iget-object v4, p0, Ll/yqg;->H:Ll/ogh;

    .line 65
    .line 66
    iget-object v4, v4, Ll/ogh;->l:Ljava/lang/String;

    .line 67
    .line 68
    invoke-static {v4}, Ll/er60;->D(Ljava/lang/String;)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v4

    .line 72
    const-string v5, "video_moment_preview_showfrom"

    .line 73
    .line 74
    invoke-direct {p1, v5, v4}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 75
    .line 76
    .line 77
    filled-new-array {v3, p1}, [Ll/pf60;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    const-string v3, "e_video_recommend_reasons"

    .line 82
    .line 83
    invoke-static {v3, v1, p1}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 84
    .line 85
    .line 86
    :cond_1
    iget-object p1, p0, Ll/jbi;->Z:Landroid/widget/LinearLayout;

    .line 87
    .line 88
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 89
    .line 90
    .line 91
    iget-object p0, p0, Ll/jbi;->k0:Lv/VText;

    .line 92
    .line 93
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 94
    .line 95
    .line 96
    :cond_2
    return-void
.end method

.method public j(ILcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ll/jbi;->j(ILcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2}, Ll/hai;->x1(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;)V

    .line 5
    .line 6
    .line 7
    iget-boolean p1, p0, Ll/hai;->r1:Z

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p2}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;->F()V

    .line 12
    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    iput-boolean p1, p0, Ll/hai;->r1:Z

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public j0()V
    .locals 0

    .line 1
    return-void
.end method

.method public w1()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/hai;->r1:Z

    .line 3
    .line 4
    return-void
.end method

.method public x1(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hai;->y1(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public y1(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;)V
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;->h:Lv/VFrame_ColorFilter;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;->j:Lv/VProgressBar;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public z1()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/yqg;->G:Ll/f0r;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/f0r;

    .line 6
    .line 7
    iget-object v1, p0, Ll/yqg;->C:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ll/f0r;-><init>(Landroid/app/Activity;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/yqg;->G:Ll/f0r;

    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Ll/yqg;->G:Ll/f0r;

    .line 15
    .line 16
    invoke-virtual {v0, p0}, Ll/f0r;->g(Ll/d0r;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/yqg;->C:Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object p0, p0, Ll/yqg;->G:Ll/f0r;

    .line 30
    .line 31
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    new-instance v1, Ll/kqg;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Ll/kqg;-><init>(Ll/f0r;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 40
    .line 41
    .line 42
    return-void
.end method
