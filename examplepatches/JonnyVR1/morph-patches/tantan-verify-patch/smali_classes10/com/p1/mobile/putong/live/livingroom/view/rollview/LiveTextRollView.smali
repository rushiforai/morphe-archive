.class public Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;
.super Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView<",
        "Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;",
        ">;"
    }
.end annotation


# instance fields
.field public i:I

.field public j:I

.field public k:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/16 p1, 0x4b0

    .line 5
    .line 6
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;->i:I

    .line 7
    .line 8
    const/16 p1, 0x1f4

    .line 9
    .line 10
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;->j:I

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/16 p1, 0x4b0

    .line 14
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;->i:I

    const/16 p1, 0x1f4

    .line 15
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;->j:I

    return-void
.end method

.method public static synthetic y(Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;->B(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static synthetic z(Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;Ljava/lang/Runnable;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;->A(Ljava/lang/Runnable;Ljava/lang/Integer;)V

    return-void
.end method


# virtual methods
.method public final synthetic A(Ljava/lang/Runnable;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;->I(Ljava/lang/Runnable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic B(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;->F(Ljava/lang/Runnable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public C(Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView;->j(Z)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;

    .line 6
    .line 7
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->setMarqueeText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public D(Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;->C(Ljava/lang/String;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public E(IZ)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView;->j(Z)Landroid/view/View;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->setGravity(I)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, p2}, Landroid/widget/HorizontalScrollView;->setFillViewport(Z)V

    .line 18
    .line 19
    .line 20
    :cond_0
    const/4 v0, 0x0

    .line 21
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView;->j(Z)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;

    .line 26
    .line 27
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->setGravity(I)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0, p2}, Landroid/widget/HorizontalScrollView;->setFillViewport(Z)V

    .line 37
    .line 38
    .line 39
    :cond_1
    return-void
.end method

.method public final F(Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView;->j(Z)Landroid/view/View;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView;->i(Landroid/view/View;)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    int-to-float v0, v0

    .line 11
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView;->c:F

    .line 12
    .line 13
    cmpl-float v0, v0, v1

    .line 14
    .line 15
    if-lez v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-lez v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;->I(Ljava/lang/Runnable;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    invoke-static {p0}, Ll/bnl0;->K(Landroid/view/View;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Lrx/c;->first()Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    new-instance v1, Ll/gdu;

    .line 36
    .line 37
    invoke-direct {v1, p0, p1}, Ll/gdu;-><init>(Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;Ljava/lang/Runnable;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_1
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public G(Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;->C(Ljava/lang/String;Z)V

    .line 3
    .line 4
    .line 5
    new-instance p1, Ll/fdu;

    .line 6
    .line 7
    invoke-direct {p1, p0, p2}, Ll/fdu;-><init>(Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;Ljava/lang/Runnable;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView;->w(Ll/x20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public H(I)V
    .locals 2

    .line 1
    int-to-long v0, p1

    .line 2
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView;->setPreAnim(J)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/widget/ViewAnimator;->showNext()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final I(Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView;->j(Z)Landroid/view/View;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;->i:I

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->setAnimDuration(I)V

    .line 17
    .line 18
    .line 19
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;->j:I

    .line 20
    .line 21
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;->k:I

    .line 22
    .line 23
    invoke-virtual {v0, v1, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->c(ILjava/lang/Runnable;I)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public makeView()Landroid/view/View;
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 11
    .line 12
    sget v2, Ll/bnl0;->e:I

    .line 13
    .line 14
    invoke-direct {v1, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 15
    .line 16
    .line 17
    const v2, 0x800013

    .line 18
    .line 19
    .line 20
    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 21
    .line 22
    iget v3, p0, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView;->b:I

    .line 23
    .line 24
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->setTextColor(I)V

    .line 25
    .line 26
    .line 27
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView;->a:F

    .line 28
    .line 29
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->setTextSize(F)V

    .line 30
    .line 31
    .line 32
    const/4 p0, 0x1

    .line 33
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->setMaxLines(I)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->setSingleLine(Z)V

    .line 37
    .line 38
    .line 39
    sget-object p0, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    .line 40
    .line 41
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->setGravity(I)V

    .line 48
    .line 49
    .line 50
    return-object v0
.end method

.method public setGap(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;->k:I

    .line 2
    .line 3
    return-void
.end method

.method public setMarqueeDelayTime(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;->j:I

    .line 2
    .line 3
    return-void
.end method

.method public setMarqueeTime(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;->i:I

    .line 2
    .line 3
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView;->j(Z)Landroid/view/View;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->b()V

    .line 15
    .line 16
    .line 17
    :cond_0
    const/4 v0, 0x0

    .line 18
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView;->j(Z)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;

    .line 23
    .line 24
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->b()V

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void
.end method
