.class public Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel$c;
.super Ll/gt0$j;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->T0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel$c;->a:Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/gt0$j;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/gt0$j;->onAnimationCancel(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel$c;->a:Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->Q(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;Z)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel$c;->a:Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    .line 11
    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->i2()Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel$c;->a:Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    .line 21
    .line 22
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->O(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;)Ljava/lang/Runnable;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/gt0$j;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel$c;->a:Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->Q(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;Z)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel$c;->a:Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    .line 11
    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->i2()Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel$c;->a:Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    .line 21
    .line 22
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->O(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;)Ljava/lang/Runnable;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method
