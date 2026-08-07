.class public final Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView$b;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->n()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0017\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0005\u0010\u0006\u00a8\u0006\u0007"
    }
    d2 = {
        "com/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView$b",
        "Landroid/animation/AnimatorListenerAdapter;",
        "Landroid/animation/Animator;",
        "animation",
        "",
        "onAnimationEnd",
        "(Landroid/animation/Animator;)V",
        "b_core_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView$b;->a:Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView$b;->a:Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView$b;->a:Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->g(Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;)Ljava/lang/Runnable;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView$b;->a:Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;

    .line 20
    .line 21
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->h(Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;)J

    .line 22
    .line 23
    .line 24
    move-result-wide v1

    .line 25
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 26
    .line 27
    .line 28
    return-void
.end method
