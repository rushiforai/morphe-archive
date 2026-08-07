.class public Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->G(FZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Z

.field public final synthetic c:Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;ZZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$a;->c:Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$a;->a:Z

    .line 4
    .line 5
    iput-boolean p3, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$a;->b:Z

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$a;ZZ)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$a;->b(ZZ)V

    return-void
.end method


# virtual methods
.method public final synthetic b(ZZ)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$a;->c:Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;

    .line 2
    .line 3
    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->s(Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;ZZ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$a;->c:Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$a;->a:Z

    .line 8
    .line 9
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$a;->b:Z

    .line 10
    .line 11
    new-instance v2, Ll/kkt;

    .line 12
    .line 13
    invoke-direct {v2, p0, v0, v1}, Ll/kkt;-><init>(Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$a;ZZ)V

    .line 14
    .line 15
    .line 16
    invoke-static {p1, v2}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method
