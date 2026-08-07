.class public final synthetic Ll/mub0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView$j;

.field public final synthetic b:Ll/l1i;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView$j;Ll/l1i;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mub0;->a:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView$j;

    iput-object p2, p0, Ll/mub0;->b:Ll/l1i;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mub0;->a:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView$j;

    iget-object p0, p0, Ll/mub0;->b:Ll/l1i;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView$j;->h(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView$j;Ll/l1i;Landroid/animation/ValueAnimator;)V

    return-void
.end method
