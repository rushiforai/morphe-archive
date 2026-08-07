.class public final synthetic Ll/gus;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

.field public final synthetic b:Landroid/animation/ValueAnimator;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gus;->a:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    iput-object p2, p0, Ll/gus;->b:Landroid/animation/ValueAnimator;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gus;->a:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    iget-object p0, p0, Ll/gus;->b:Landroid/animation/ValueAnimator;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;->a(Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;Landroid/animation/ValueAnimator;Landroid/animation/ValueAnimator;)V

    return-void
.end method
