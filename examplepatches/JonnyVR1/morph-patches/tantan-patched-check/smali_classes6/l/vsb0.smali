.class public final synthetic Ll/vsb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;

.field public final synthetic b:Ll/l1i;

.field public final synthetic c:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;

.field public final synthetic d:D


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;Ll/l1i;Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;D)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vsb0;->a:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;

    iput-object p2, p0, Ll/vsb0;->b:Ll/l1i;

    iput-object p3, p0, Ll/vsb0;->c:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;

    iput-wide p4, p0, Ll/vsb0;->d:D

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/vsb0;->a:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;

    iget-object v1, p0, Ll/vsb0;->b:Ll/l1i;

    iget-object v2, p0, Ll/vsb0;->c:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;

    iget-wide v3, p0, Ll/vsb0;->d:D

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->P(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;Ll/l1i;Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;DLandroid/animation/ValueAnimator;)V

    return-void
.end method
