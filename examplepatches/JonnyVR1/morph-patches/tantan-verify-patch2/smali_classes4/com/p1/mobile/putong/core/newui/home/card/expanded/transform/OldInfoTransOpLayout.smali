.class public Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/OldInfoTransOpLayout;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/OldInfoTransOpLayout$a;
    }
.end annotation


# instance fields
.field public a:Z

.field public b:Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/OldInfoTransOpLayout$a;

.field public c:I

.field public d:Z

.field public e:I

.field public f:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/OldInfoTransOpLayout;->a:Z

    .line 6
    .line 7
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/OldInfoTransOpLayout;->d:Z

    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/OldInfoTransOpLayout;->f:Z

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/OldInfoTransOpLayout;->a()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 16
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 17
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/OldInfoTransOpLayout;->a:Z

    .line 18
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/OldInfoTransOpLayout;->d:Z

    const/4 p1, 0x1

    .line 19
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/OldInfoTransOpLayout;->f:Z

    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/OldInfoTransOpLayout;->a()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 21
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 22
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/OldInfoTransOpLayout;->a:Z

    .line 23
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/OldInfoTransOpLayout;->d:Z

    const/4 p1, 0x1

    .line 24
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/OldInfoTransOpLayout;->f:Z

    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/OldInfoTransOpLayout;->a()V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/OldInfoTransOpLayout;->c:I

    .line 14
    .line 15
    return-void
.end method

.method public final b(Landroid/view/MotionEvent;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    float-to-int v0, v0

    .line 6
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    const/4 v1, 0x0

    .line 11
    if-eqz p1, :cond_4

    .line 12
    .line 13
    const/4 v2, 0x1

    .line 14
    if-eq p1, v2, :cond_2

    .line 15
    .line 16
    const/4 v3, 0x2

    .line 17
    if-eq p1, v3, :cond_0

    .line 18
    .line 19
    const/4 v0, 0x3

    .line 20
    if-eq p1, v0, :cond_2

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/OldInfoTransOpLayout;->e:I

    .line 24
    .line 25
    sub-int v3, p1, v0

    .line 26
    .line 27
    iget v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/OldInfoTransOpLayout;->c:I

    .line 28
    .line 29
    if-le v3, v4, :cond_1

    .line 30
    .line 31
    iget-boolean v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/OldInfoTransOpLayout;->d:Z

    .line 32
    .line 33
    if-nez v3, :cond_1

    .line 34
    .line 35
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/OldInfoTransOpLayout;->d:Z

    .line 36
    .line 37
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/OldInfoTransOpLayout;->e:I

    .line 38
    .line 39
    return-void

    .line 40
    :cond_1
    iget-boolean v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/OldInfoTransOpLayout;->d:Z

    .line 41
    .line 42
    if-eqz v2, :cond_3

    .line 43
    .line 44
    sub-int/2addr p1, v0

    .line 45
    invoke-static {v1, p1}, Ljava/lang/Math;->max(II)I

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/OldInfoTransOpLayout;->b:Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/OldInfoTransOpLayout$a;

    .line 50
    .line 51
    if-eqz p0, :cond_3

    .line 52
    .line 53
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/OldInfoTransOpLayout$a;->b(I)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_2
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/OldInfoTransOpLayout;->d:Z

    .line 58
    .line 59
    if-eqz p1, :cond_3

    .line 60
    .line 61
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/OldInfoTransOpLayout;->b:Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/OldInfoTransOpLayout$a;

    .line 62
    .line 63
    if-eqz p1, :cond_3

    .line 64
    .line 65
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/OldInfoTransOpLayout;->a:Z

    .line 66
    .line 67
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/OldInfoTransOpLayout$a;->a()V

    .line 68
    .line 69
    .line 70
    :cond_3
    :goto_0
    return-void

    .line 71
    :cond_4
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/OldInfoTransOpLayout;->d:Z

    .line 72
    .line 73
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/OldInfoTransOpLayout;->e:I

    .line 74
    .line 75
    return-void
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/OldInfoTransOpLayout;->f:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/OldInfoTransOpLayout;->a:Z

    .line 8
    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/OldInfoTransOpLayout;->b(Landroid/view/MotionEvent;)V

    .line 12
    .line 13
    .line 14
    return v1

    .line 15
    :cond_1
    invoke-super {p0, p1}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0
.end method

.method public setInterceptMove(Z)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/OldInfoTransOpLayout;->f:Z

    .line 3
    .line 4
    return-void
.end method

.method public setTransListener(Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/OldInfoTransOpLayout$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/OldInfoTransOpLayout;->b:Lcom/p1/mobile/putong/core/newui/home/card/expanded/transform/OldInfoTransOpLayout$a;

    .line 2
    .line 3
    return-void
.end method
