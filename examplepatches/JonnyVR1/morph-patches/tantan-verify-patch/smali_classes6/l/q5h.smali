.class public final synthetic Ll/q5h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q5h;->a:Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;

    iput p2, p0, Ll/q5h;->b:I

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/q5h;->a:Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;

    iget p0, p0, Ll/q5h;->b:I

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;->f(Lcom/p1/mobile/putong/feed/newui/view/FeedGlobalPlayerView;ILandroid/animation/ValueAnimator;)V

    return-void
.end method
