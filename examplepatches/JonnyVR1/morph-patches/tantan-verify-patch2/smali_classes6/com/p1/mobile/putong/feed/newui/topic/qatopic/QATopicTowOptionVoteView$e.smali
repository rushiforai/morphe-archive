.class public Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView$e;
.super Ll/cog;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->S(Ll/l1i;Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;Ll/aog;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic f:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;

.field public final synthetic g:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;IILcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView$e;->g:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;

    .line 2
    .line 3
    iput-object p4, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView$e;->f:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;

    .line 4
    .line 5
    invoke-direct {p0, p2, p3}, Ll/cog;-><init>(II)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;->c:Landroid/widget/TextView;

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    new-array v0, v0, [Landroid/view/View;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    aput-object p0, v0, v1

    .line 18
    .line 19
    invoke-static {p1, v0}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public a(Z)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/aog;->a(Z)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    invoke-virtual {p0, p1}, Ll/aog;->c(Z)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, v0}, Ll/aog;->c(Z)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    filled-new-array {p1, v0}, [I

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const-wide/16 v0, 0x78

    .line 23
    .line 24
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1, p0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView$e;->f:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;

    .line 31
    .line 32
    new-instance v0, Ll/kub0;

    .line 33
    .line 34
    invoke-direct {v0, p0}, Ll/kub0;-><init>(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ll/cog;->onAnimationStart(Landroid/animation/Animator;Z)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    invoke-virtual {p0, p1}, Ll/aog;->c(Z)I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-ne p2, p1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView$e;->f:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;->c:Landroid/widget/TextView;

    .line 14
    .line 15
    const/high16 p1, 0x41c00000    # 24.0f

    .line 16
    .line 17
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    int-to-float p1, p1

    .line 22
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method
