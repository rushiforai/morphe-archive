.class public final Lcom/opera/android/tabui2/TabUiRootFrameLayout;
.super Lcom/opera/android/tabui2/ConfigurationProvidingFrameLayout;
.source "SourceFile"

# interfaces
.implements Lmle;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0008\u0007\u0018\u00002\u00020\u00012\u00020\u0002:\u0001\tB\u001b\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\n\u0008\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u00a2\u0006\u0004\u0008\u0007\u0010\u0008\u00a8\u0006\n"
    }
    d2 = {
        "Lcom/opera/android/tabui2/TabUiRootFrameLayout;",
        "Lcom/opera/android/tabui2/ConfigurationProvidingFrameLayout;",
        "Lmle;",
        "Landroid/content/Context;",
        "context",
        "Landroid/util/AttributeSet;",
        "attrs",
        "<init>",
        "(Landroid/content/Context;Landroid/util/AttributeSet;)V",
        "dal",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public f:Ldal;

.field public final g:Ljava/util/ArrayList;

.field public h:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Lcom/opera/android/tabui2/ConfigurationProvidingFrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/opera/android/tabui2/TabUiRootFrameLayout;->g:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final b(ILandroid/view/View;)V
    .registers 5

    iget p1, p0, Lcom/opera/android/tabui2/TabUiRootFrameLayout;->h:I

    if-lez p1, :cond_2c

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/opera/android/tabui2/TabUiRootFrameLayout;->h:I

    if-nez p1, :cond_2c

    iget-object p0, p0, Lcom/opera/android/tabui2/TabUiRootFrameLayout;->f:Ldal;

    if-eqz p0, :cond_2c

    iget-object p1, p0, Ldal;->c:Lgal;

    iget-boolean p2, p0, Ldal;->a:Z

    if-eqz p2, :cond_2c

    const/4 p2, 0x0

    iput-boolean p2, p0, Ldal;->a:Z

    iget p0, p1, Lgal;->f:F

    const/high16 p2, 0x3f000000    # 0.5f

    cmpl-float p0, p0, p2

    if-lez p0, :cond_22

    sget-object p0, Lp6l;->b:Lp6l;

    goto :goto_24

    :cond_22
    sget-object p0, Lp6l;->a:Lp6l;

    :goto_24
    invoke-virtual {p1, p0}, Lgal;->g(Lp6l;)V

    const-wide/16 v0, 0xc8

    invoke-virtual {p1, v0, v1}, Lgal;->b(J)V

    :cond_2c
    return-void
.end method

.method public final d(Landroid/view/View;Landroid/view/View;II)V
    .registers 5

    return-void
.end method

.method public final dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 6

    iget-object v0, p0, Lcom/opera/android/tabui2/TabUiRootFrameLayout;->g:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :cond_7
    if-ge v2, v1, :cond_1f

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lkotlin/jvm/functions/Function1;

    invoke-interface {v3, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_7

    const/4 p0, 0x1

    return p0

    :cond_1f
    invoke-super {p0, p1}, Lcom/opera/android/tabui2/ConfigurationProvidingFrameLayout;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public final e(Landroid/view/View;II[II)V
    .registers 6

    iget p1, p0, Lcom/opera/android/tabui2/TabUiRootFrameLayout;->h:I

    if-lez p1, :cond_11

    iget-object p0, p0, Lcom/opera/android/tabui2/TabUiRootFrameLayout;->f:Ldal;

    if-eqz p0, :cond_11

    invoke-virtual {p0}, Ldal;->a()Z

    move-result p1

    if-eqz p1, :cond_11

    invoke-virtual {p0, p2, p4}, Ldal;->b(I[I)V

    :cond_11
    return-void
.end method

.method public final g(Landroid/view/View;IIIII[I)V
    .registers 8

    iget p1, p0, Lcom/opera/android/tabui2/TabUiRootFrameLayout;->h:I

    if-lez p1, :cond_d

    iget-object p0, p0, Lcom/opera/android/tabui2/TabUiRootFrameLayout;->f:Ldal;

    if-eqz p0, :cond_d

    if-eqz p4, :cond_d

    invoke-virtual {p0, p4, p7}, Ldal;->b(I[I)V

    :cond_d
    return-void
.end method

.method public final getNestedScrollAxes()I
    .registers 2

    iget-object v0, p0, Lcom/opera/android/tabui2/TabUiRootFrameLayout;->f:Ldal;

    if-eqz v0, :cond_6

    const/4 p0, 0x1

    return p0

    :cond_6
    invoke-super {p0}, Landroid/view/ViewGroup;->getNestedScrollAxes()I

    move-result p0

    return p0
.end method

.method public final i(Landroid/view/View;IIIII)V
    .registers 7

    return-void
.end method

.method public final k(Landroid/view/View;Landroid/view/View;II)Z
    .registers 6

    iget p1, p0, Lcom/opera/android/tabui2/TabUiRootFrameLayout;->h:I

    const/4 p2, 0x1

    if-lez p1, :cond_9

    add-int/2addr p1, p2

    iput p1, p0, Lcom/opera/android/tabui2/TabUiRootFrameLayout;->h:I

    return p2

    :cond_9
    iget-object v0, p0, Lcom/opera/android/tabui2/TabUiRootFrameLayout;->f:Ldal;

    if-eqz v0, :cond_15

    if-ne p3, p2, :cond_15

    if-nez p4, :cond_15

    add-int/2addr p1, p2

    iput p1, p0, Lcom/opera/android/tabui2/TabUiRootFrameLayout;->h:I

    return p2

    :cond_15
    const/4 p0, 0x0

    return p0
.end method

.method public final onNestedPreFling(Landroid/view/View;FF)Z
    .registers 9

    iget v0, p0, Lcom/opera/android/tabui2/TabUiRootFrameLayout;->h:I

    if-lez v0, :cond_4a

    iget-object v0, p0, Lcom/opera/android/tabui2/TabUiRootFrameLayout;->f:Ldal;

    if-eqz v0, :cond_4a

    iget-object v1, v0, Ldal;->c:Lgal;

    invoke-virtual {v0}, Ldal;->a()Z

    move-result v2

    if-eqz v2, :cond_4a

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    move-result p0

    int-to-float p0, p0

    const/high16 p1, 0x40800000    # 4.0f

    mul-float/2addr p0, p1

    invoke-virtual {v1}, Lgal;->f()Z

    move-result p1

    if-eqz p1, :cond_27

    neg-float p2, p2

    :cond_27
    neg-float p1, p0

    cmpg-float p1, p2, p1

    const-wide/16 v2, 0xc8

    const/4 p3, 0x1

    const/4 v4, 0x0

    if-gez p1, :cond_3b

    iput-boolean v4, v0, Ldal;->a:Z

    sget-object p0, Lp6l;->a:Lp6l;

    invoke-virtual {v1, p0}, Lgal;->g(Lp6l;)V

    invoke-virtual {v1, v2, v3}, Lgal;->b(J)V

    return p3

    :cond_3b
    cmpl-float p0, p2, p0

    if-lez p0, :cond_49

    iput-boolean v4, v0, Ldal;->a:Z

    sget-object p0, Lp6l;->b:Lp6l;

    invoke-virtual {v1, p0}, Lgal;->g(Lp6l;)V

    invoke-virtual {v1, v2, v3}, Lgal;->b(J)V

    :cond_49
    return p3

    :cond_4a
    invoke-super {p0, p1, p2, p3}, Landroid/view/ViewGroup;->onNestedPreFling(Landroid/view/View;FF)Z

    move-result p0

    return p0
.end method

.method public final onStartNestedScroll(Landroid/view/View;Landroid/view/View;I)Z
    .registers 4

    const/4 p0, 0x0

    return p0
.end method
