.class public Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView$k;
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
.field public final synthetic f:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;

.field public final synthetic g:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;IILcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView$k;->g:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;

    .line 2
    .line 3
    iput-object p4, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView$k;->f:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;

    .line 4
    .line 5
    invoke-direct {p0, p2, p3}, Ll/cog;-><init>(II)V

    .line 6
    .line 7
    .line 8
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
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView$k;->f:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;

    .line 5
    .line 6
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;->b:Landroid/widget/TextView;

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    invoke-virtual {p0, v0}, Ll/aog;->c(Z)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {p0, v1}, Ll/aog;->c(Z)I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    filled-new-array {v0, v1}, [I

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "textColor"

    .line 23
    .line 24
    invoke-static {p1, v1, v0}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    const-wide/16 v0, 0xc8

    .line 29
    .line 30
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1, p0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 34
    .line 35
    .line 36
    new-instance p0, Landroid/animation/ArgbEvaluator;

    .line 37
    .line 38
    invoke-direct {p0}, Landroid/animation/ArgbEvaluator;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1, p0}, Landroid/animation/ValueAnimator;->setEvaluator(Landroid/animation/TypeEvaluator;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    .line 45
    .line 46
    .line 47
    return-void
.end method
