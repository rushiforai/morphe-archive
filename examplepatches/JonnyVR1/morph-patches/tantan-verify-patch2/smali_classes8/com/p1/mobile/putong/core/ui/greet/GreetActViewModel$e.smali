.class public Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel$e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/AbsListView$OnScrollListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->r()V
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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel$e;->a:Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onScroll(Landroid/widget/AbsListView;III)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel$e;->a:Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    iget-object p2, p1, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->A:Ll/tul;

    .line 6
    .line 7
    invoke-interface {p2}, Ll/tul;->getTop()I

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    neg-int p2, p2

    .line 12
    int-to-float p2, p2

    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel$e;->a:Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->g:Lv/VList;

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/View;->getTranslationY()F

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    sub-float/2addr p2, p0

    .line 22
    float-to-int p0, p2

    .line 23
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->U(I)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    sget p0, Ll/qa00;->S:I

    .line 28
    .line 29
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->U(I)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public onScrollStateChanged(Landroid/widget/AbsListView;I)V
    .locals 1

    .line 1
    const/4 p1, 0x1

    .line 2
    if-ne p2, p1, :cond_0

    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel$e;->a:Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    .line 5
    .line 6
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->E:Z

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel$e;->a:Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    .line 16
    .line 17
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->P(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;)Ljava/lang/Runnable;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 22
    .line 23
    .line 24
    if-nez p2, :cond_1

    .line 25
    .line 26
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel$e;->a:Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    .line 27
    .line 28
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->i2()Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-eqz p1, :cond_1

    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel$e;->a:Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    .line 37
    .line 38
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->O(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;)Ljava/lang/Runnable;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void
.end method
