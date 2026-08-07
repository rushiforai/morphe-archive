.class public final synthetic Ll/kub0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kub0;->a:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kub0;->a:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView$e;->h(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;Landroid/animation/ValueAnimator;)V

    return-void
.end method
