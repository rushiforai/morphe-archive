.class public Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDotButton;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDot;


# instance fields
.field public a:Landroid/widget/FrameLayout;

.field public b:Lv/VDraweeView;

.field public c:Lcom/tantan/library/svga/SVGAnimationView;

.field public d:Landroid/view/View;

.field public e:Landroid/os/CountDownTimer;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDotButton;JLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDotButton;->d(JLjava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/asc0;->a(Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDotButton;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDotButton;->e:Landroid/os/CountDownTimer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/os/CountDownTimer;->cancel()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->animation:Lcom/p1/mobile/putong/live/base/data/BLiveButtonAnimation;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveButtonAnimation;->url:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->animation:Lcom/p1/mobile/putong/live/base/data/BLiveButtonAnimation;

    .line 19
    .line 20
    iget-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveButtonAnimation;->enterPlayOffsetSeconds:J

    .line 21
    .line 22
    const-wide/16 v3, 0x0

    .line 23
    .line 24
    cmp-long v1, v1, v3

    .line 25
    .line 26
    if-ltz v1, :cond_1

    .line 27
    .line 28
    iget-wide v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveButtonAnimation;->playGapSeconds:J

    .line 29
    .line 30
    cmp-long v0, v0, v3

    .line 31
    .line 32
    if-ltz v0, :cond_1

    .line 33
    .line 34
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDotButton$a;

    .line 35
    .line 36
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->animation:Lcom/p1/mobile/putong/live/base/data/BLiveButtonAnimation;

    .line 37
    .line 38
    iget-wide v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveButtonAnimation;->enterPlayOffsetSeconds:J

    .line 39
    .line 40
    const-wide/16 v4, 0x3e8

    .line 41
    .line 42
    mul-long v3, v2, v4

    .line 43
    .line 44
    const-wide/16 v5, 0x3e8

    .line 45
    .line 46
    move-object v2, p0

    .line 47
    move-object v7, p1

    .line 48
    invoke-direct/range {v1 .. v7}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDotButton$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDotButton;JJLcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V

    .line 49
    .line 50
    .line 51
    iput-object v1, v2, Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDotButton;->e:Landroid/os/CountDownTimer;

    .line 52
    .line 53
    invoke-virtual {v1}, Landroid/os/CountDownTimer;->start()Landroid/os/CountDownTimer;

    .line 54
    .line 55
    .line 56
    :cond_1
    return-void
.end method

.method public final d(JLjava/lang/String;)V
    .locals 7

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDotButton$b;

    .line 2
    .line 3
    const-wide/16 v1, 0x3e8

    .line 4
    .line 5
    mul-long v4, p1, v1

    .line 6
    .line 7
    const-wide v2, 0x7fffffffffffffffL

    .line 8
    .line 9
    .line 10
    .line 11
    .line 12
    move-object v1, p0

    .line 13
    move-object v6, p3

    .line 14
    invoke-direct/range {v0 .. v6}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDotButton$b;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDotButton;JJLjava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, v1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDotButton;->e:Landroid/os/CountDownTimer;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/os/CountDownTimer;->start()Landroid/os/CountDownTimer;

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public e()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDotButton;->a:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    sget v0, Ll/obc0;->y0:I

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public g0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDotButton;->d:Landroid/view/View;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDotButton;->e:Landroid/os/CountDownTimer;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/os/CountDownTimer;->cancel()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDotButton;->b(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setLocalIcon(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDotButton;->b:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setRemoteIcon(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDotButton;->b:Lv/VDraweeView;

    .line 2
    .line 3
    const/high16 v0, 0x42300000    # 44.0f

    .line 4
    .line 5
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/high16 v1, 0x42180000    # 38.0f

    .line 10
    .line 11
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const-string v2, "context_single_room"

    .line 16
    .line 17
    invoke-static {v2, p0, p1, v0, v1}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
