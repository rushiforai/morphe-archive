.class public final synthetic Ll/lub0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView$i;

.field public final synthetic b:Ll/l1i;

.field public final synthetic c:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView$i;Ll/l1i;Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lub0;->a:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView$i;

    iput-object p2, p0, Ll/lub0;->b:Ll/l1i;

    iput-object p3, p0, Ll/lub0;->c:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/lub0;->a:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView$i;

    iget-object v1, p0, Ll/lub0;->b:Ll/l1i;

    iget-object p0, p0, Ll/lub0;->c:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView$i;->h(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView$i;Ll/l1i;Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;Landroid/animation/ValueAnimator;)V

    return-void
.end method
