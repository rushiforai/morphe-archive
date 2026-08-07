.class public final synthetic Ll/wsb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wsb0;->a:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;

    iput-object p2, p0, Ll/wsb0;->b:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wsb0;->a:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;

    iget-object p0, p0, Ll/wsb0;->b:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->Q(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;Landroid/animation/ValueAnimator;)V

    return-void
.end method
