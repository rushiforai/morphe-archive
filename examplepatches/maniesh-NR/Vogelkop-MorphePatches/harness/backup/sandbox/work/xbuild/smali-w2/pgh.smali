.class public final Lpgh;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lrgh;

.field public final b:Lmig;

.field public final c:Landroid/view/View;

.field public final d:Logh;

.field public e:I

.field public f:J

.field public g:Z

.field public h:Z

.field public i:Z

.field public j:Z


# direct methods
.method public constructor <init>(Lrgh;Lmig;Landroid/view/View;Logh;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lpgh;->a:Lrgh;

    iput-object p2, p0, Lpgh;->b:Lmig;

    iput-object p3, p0, Lpgh;->c:Landroid/view/View;

    iput-object p4, p0, Lpgh;->d:Logh;

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/MotionEvent;)Z
    .registers 7

    iget v0, p0, Lpgh;->e:I

    const/4 v1, 0x0

    if-lez v0, :cond_51

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    iget-object v0, p0, Lpgh;->c:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v0

    int-to-float v0, v0

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v0, v2

    cmpg-float p1, p1, v0

    const/4 v0, 0x1

    if-gez p1, :cond_1a

    move p1, v0

    goto :goto_1b

    :cond_1a
    move p1, v1

    :goto_1b
    iget-object v2, p0, Lpgh;->a:Lrgh;

    iget-object v2, v2, Lrgh;->a:Ljava/lang/Object;

    check-cast v2, Lpt1;

    const v3, 0x3dcccccd    # 0.1f

    if-eqz p1, :cond_39

    iget-object v2, v2, Lpt1;->c:Landroid/view/View;

    check-cast v2, Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v4

    if-nez v4, :cond_4f

    invoke-virtual {v2}, Landroid/view/View;->getAlpha()F

    move-result v2

    cmpl-float v2, v2, v3

    if-lez v2, :cond_4f

    goto :goto_4b

    :cond_39
    iget-object v2, v2, Lpt1;->b:Landroid/view/View;

    check-cast v2, Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v4

    if-nez v4, :cond_4f

    invoke-virtual {v2}, Landroid/view/View;->getAlpha()F

    move-result v2

    cmpl-float v2, v2, v3

    if-lez v2, :cond_4f

    :goto_4b
    invoke-virtual {p0, p1}, Lpgh;->b(Z)V

    return v0

    :cond_4f
    iput v1, p0, Lpgh;->e:I

    :cond_51
    return v1
.end method

.method public final b(Z)V
    .registers 14

    iget-object v0, p0, Lpgh;->b:Lmig;

    invoke-virtual {v0}, Lhkg;->c()Lgig;

    move-result-object v1

    invoke-interface {v1}, Lgig;->getCurrentPosition()J

    move-result-wide v1

    iget-boolean v3, p0, Lpgh;->i:Z

    const-wide/16 v4, 0x0

    const/4 v6, 0x0

    const-wide/16 v7, 0x3e8

    const/4 v9, 0x1

    if-eqz v3, :cond_21

    iget-boolean v3, p0, Lpgh;->g:Z

    if-eqz v3, :cond_1a

    move-wide v10, v7

    goto :goto_1b

    :cond_1a
    move-wide v10, v4

    :goto_1b
    cmp-long v3, v1, v10

    if-lez v3, :cond_21

    move v3, v9

    goto :goto_22

    :cond_21
    move v3, v6

    :goto_22
    iget-boolean v10, p0, Lpgh;->j:Z

    if-eqz v10, :cond_37

    iget-boolean v10, p0, Lpgh;->h:Z

    if-nez v10, :cond_35

    iget-wide v10, p0, Lpgh;->f:J

    cmp-long v4, v10, v4

    if-eqz v4, :cond_35

    sub-long/2addr v10, v7

    cmp-long v1, v1, v10

    if-gez v1, :cond_37

    :cond_35
    move v1, v9

    goto :goto_38

    :cond_37
    move v1, v6

    :goto_38
    iget v2, p0, Lpgh;->e:I

    if-eqz v2, :cond_43

    if-eqz p1, :cond_41

    if-nez v3, :cond_43

    goto :goto_47

    :cond_41
    if-eqz v1, :cond_47

    :cond_43
    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lpgh;->e:I

    :cond_47
    :goto_47
    int-to-long v1, v2

    const-wide/16 v3, 0x2710

    mul-long/2addr v1, v3

    xor-int/lit8 v5, p1, 0x1

    iget-object v10, p0, Lpgh;->a:Lrgh;

    invoke-virtual {v10, v6, v5}, Lrgh;->n(IZ)V

    div-long/2addr v1, v7

    long-to-int v1, v1

    iget-object v2, v10, Lrgh;->a:Ljava/lang/Object;

    check-cast v2, Lpt1;

    iget-object v5, v2, Lpt1;->d:Ljava/lang/Object;

    check-cast v5, Landroid/widget/RelativeLayout;

    iget-object v6, v2, Lpt1;->b:Landroid/view/View;

    check-cast v6, Landroid/widget/TextView;

    iget-object v7, v2, Lpt1;->c:Landroid/view/View;

    check-cast v7, Landroid/widget/TextView;

    invoke-virtual {v5}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    filled-new-array {v8}, [Ljava/lang/Object;

    move-result-object v8

    const v11, 0x7f12003d

    invoke-virtual {v5, v11, v1, v8}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    if-eqz p1, :cond_7d

    invoke-virtual {v7, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_80

    :cond_7d
    invoke-virtual {v6, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_80
    invoke-virtual {v10, p1, v9}, Lrgh;->j(ZZ)I

    move-result v1

    if-eqz p1, :cond_91

    invoke-virtual {v10, v1, v7}, Lrgh;->i(ILandroid/view/View;)V

    iget-object v2, v2, Lpt1;->f:Ljava/lang/Object;

    check-cast v2, Landroid/widget/ImageView;

    invoke-virtual {v10, v1, v2}, Lrgh;->i(ILandroid/view/View;)V

    goto :goto_9b

    :cond_91
    invoke-virtual {v10, v1, v6}, Lrgh;->i(ILandroid/view/View;)V

    iget-object v2, v2, Lpt1;->g:Landroid/view/View;

    check-cast v2, Landroid/widget/ImageView;

    invoke-virtual {v10, v1, v2}, Lrgh;->i(ILandroid/view/View;)V

    :goto_9b
    add-int/lit16 v1, v1, 0x12c

    iget-object v2, v10, Lrgh;->b:Ljava/lang/Object;

    check-cast v2, Lgh2;

    if-eqz v2, :cond_a6

    invoke-static {v2}, Lvml;->a(Ljava/lang/Runnable;)V

    :cond_a6
    new-instance v2, Lgh2;

    const/16 v5, 0xa

    invoke-direct {v2, v5, v10, p1}, Lgh2;-><init>(BLjava/lang/Object;Z)V

    iput-object v2, v10, Lrgh;->b:Ljava/lang/Object;

    int-to-long v5, v1

    invoke-static {v2, v5, v6}, Lvml;->d(Ljava/lang/Runnable;J)V

    iget-object p0, p0, Lpgh;->d:Logh;

    invoke-interface {p0, v5, v6}, Logh;->a(J)V

    if-eqz p1, :cond_ce

    invoke-virtual {v0}, Lhkg;->c()Lgig;

    move-result-object p0

    invoke-interface {p0}, Lgig;->isCurrentWindowSeekable()Z

    move-result p0

    if-eqz p0, :cond_ea

    invoke-virtual {v0}, Lhkg;->c()Lgig;

    move-result-object p0

    const-wide/16 v0, -0x2710

    invoke-static {p0, v0, v1}, Lmig;->f(Lgig;J)V

    return-void

    :cond_ce
    invoke-virtual {v0}, Lhkg;->c()Lgig;

    move-result-object p0

    invoke-interface {p0}, Lgig;->getPlaybackState()I

    move-result p0

    const/4 p1, 0x4

    if-eq p0, p1, :cond_ea

    invoke-virtual {v0}, Lhkg;->c()Lgig;

    move-result-object p0

    invoke-interface {p0}, Lgig;->isCurrentWindowSeekable()Z

    move-result p0

    if-eqz p0, :cond_ea

    invoke-virtual {v0}, Lhkg;->c()Lgig;

    move-result-object p0

    invoke-static {p0, v3, v4}, Lmig;->f(Lgig;J)V

    :cond_ea
    return-void
.end method
