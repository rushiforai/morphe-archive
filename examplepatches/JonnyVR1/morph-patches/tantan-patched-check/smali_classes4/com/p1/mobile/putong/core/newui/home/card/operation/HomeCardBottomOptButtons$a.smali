.class public Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons;->s(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons$a;->b:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons$a;->a:Z

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0
    .param p1    # Landroid/animation/Animator;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons$a;->b:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons;->f(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1
    .param p1    # Landroid/animation/Animator;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons$a;->b:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons;->f(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons$a;->b:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons;

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons$a;->a:Z

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardBottomOptButtons;->b(Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0
    .param p1    # Landroid/animation/Animator;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0
    .param p1    # Landroid/animation/Animator;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    return-void
.end method
