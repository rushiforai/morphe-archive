.class public Lcom/p1/mobile/putong/core/ui/messages/AudioView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/messages/AudioView;->j(IF)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/AudioView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/AudioView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView$a;->a:Lcom/p1/mobile/putong/core/ui/messages/AudioView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView$a;->a:Lcom/p1/mobile/putong/core/ui/messages/AudioView;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->e(Lcom/p1/mobile/putong/core/ui/messages/AudioView;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView$a;->a:Lcom/p1/mobile/putong/core/ui/messages/AudioView;

    .line 8
    .line 9
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->b(Lcom/p1/mobile/putong/core/ui/messages/AudioView;)Lcom/p1/mobile/putong/core/ui/messages/AudioView$b;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView$a;->a:Lcom/p1/mobile/putong/core/ui/messages/AudioView;

    .line 16
    .line 17
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->b(Lcom/p1/mobile/putong/core/ui/messages/AudioView;)Lcom/p1/mobile/putong/core/ui/messages/AudioView$b;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView$a;->a:Lcom/p1/mobile/putong/core/ui/messages/AudioView;

    .line 22
    .line 23
    invoke-static {v1}, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->c(Lcom/p1/mobile/putong/core/ui/messages/AudioView;)I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-interface {p1, v1}, Lcom/p1/mobile/putong/core/ui/messages/AudioView$b;->onAnimationEnd(I)V

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView$a;->a:Lcom/p1/mobile/putong/core/ui/messages/AudioView;

    .line 31
    .line 32
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->d(Lcom/p1/mobile/putong/core/ui/messages/AudioView;I)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView$a;->a:Lcom/p1/mobile/putong/core/ui/messages/AudioView;

    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView$a;->a:Lcom/p1/mobile/putong/core/ui/messages/AudioView;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->e(Lcom/p1/mobile/putong/core/ui/messages/AudioView;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView$a;->a:Lcom/p1/mobile/putong/core/ui/messages/AudioView;

    .line 8
    .line 9
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->b(Lcom/p1/mobile/putong/core/ui/messages/AudioView;)Lcom/p1/mobile/putong/core/ui/messages/AudioView$b;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView$a;->a:Lcom/p1/mobile/putong/core/ui/messages/AudioView;

    .line 16
    .line 17
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->b(Lcom/p1/mobile/putong/core/ui/messages/AudioView;)Lcom/p1/mobile/putong/core/ui/messages/AudioView$b;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView$a;->a:Lcom/p1/mobile/putong/core/ui/messages/AudioView;

    .line 22
    .line 23
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->c(Lcom/p1/mobile/putong/core/ui/messages/AudioView;)I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    invoke-interface {p1, p0}, Lcom/p1/mobile/putong/core/ui/messages/AudioView$b;->onAnimationStart(I)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method
