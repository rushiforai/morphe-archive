.class public final synthetic Ll/ddd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ddd0;->a:Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ddd0;->a:Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;->a(Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;Landroid/animation/ValueAnimator;)V

    return-void
.end method
