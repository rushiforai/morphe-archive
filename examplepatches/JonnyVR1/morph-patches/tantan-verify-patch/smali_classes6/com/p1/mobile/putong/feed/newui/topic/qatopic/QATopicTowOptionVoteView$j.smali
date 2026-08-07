.class public Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView$j;
.super Ll/cog;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->T(Ll/l1i;Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;Ll/cog;)Ll/aog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic f:Ll/l1i;

.field public final synthetic g:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;IILl/l1i;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView$j;->g:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;

    .line 2
    .line 3
    iput-object p4, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView$j;->f:Ll/l1i;

    .line 4
    .line 5
    invoke-direct {p0, p2, p3}, Ll/cog;-><init>(II)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView$j;Ll/l1i;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView$j;->i(Ll/l1i;Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method private synthetic i(Ll/l1i;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    check-cast p2, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView$j;->g:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/l1i;->c()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->Z(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    filled-new-array {p0}, [Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {p2, p0}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 26
    .line 27
    .line 28
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
    const-wide/16 v0, 0xc8

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
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView$j;->f:Ll/l1i;

    .line 31
    .line 32
    new-instance v1, Ll/mub0;

    .line 33
    .line 34
    invoke-direct {v1, p0, v0}, Ll/mub0;-><init>(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView$j;Ll/l1i;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    .line 41
    .line 42
    .line 43
    return-void
.end method
