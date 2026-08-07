.class public Lcom/p1/mobile/putong/core/ui/tarot/TarotListView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/tarot/TarotListView$a;
    }
.end annotation


# instance fields
.field public a:Landroid/view/VelocityTracker;

.field public b:F

.field public c:Lcom/p1/mobile/putong/core/ui/tarot/TarotListView$a;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEdgeFlags()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return p0

    .line 15
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/tarot/TarotListView;->a:Landroid/view/VelocityTracker;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/tarot/TarotListView;->a:Landroid/view/VelocityTracker;

    .line 28
    .line 29
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/tarot/TarotListView;->a:Landroid/view/VelocityTracker;

    .line 30
    .line 31
    invoke-virtual {v0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    const/4 v1, 0x1

    .line 39
    if-eqz v0, :cond_4

    .line 40
    .line 41
    if-eq v0, v1, :cond_3

    .line 42
    .line 43
    const/4 v2, 0x2

    .line 44
    if-eq v0, v2, :cond_2

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/tarot/TarotListView;->b:F

    .line 52
    .line 53
    sub-float/2addr v0, v2

    .line 54
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/tarot/TarotListView;->b:F

    .line 59
    .line 60
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/tarot/TarotListView;->c:Lcom/p1/mobile/putong/core/ui/tarot/TarotListView$a;

    .line 61
    .line 62
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    if-eqz p1, :cond_5

    .line 67
    .line 68
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/tarot/TarotListView;->c:Lcom/p1/mobile/putong/core/ui/tarot/TarotListView$a;

    .line 69
    .line 70
    invoke-interface {p0, v0}, Lcom/p1/mobile/putong/core/ui/tarot/TarotListView$a;->a(F)V

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/tarot/TarotListView;->a:Landroid/view/VelocityTracker;

    .line 75
    .line 76
    const/16 v0, 0xc8

    .line 77
    .line 78
    invoke-virtual {p1, v0}, Landroid/view/VelocityTracker;->computeCurrentVelocity(I)V

    .line 79
    .line 80
    .line 81
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/tarot/TarotListView;->c:Lcom/p1/mobile/putong/core/ui/tarot/TarotListView$a;

    .line 82
    .line 83
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    if-eqz p1, :cond_5

    .line 88
    .line 89
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/tarot/TarotListView;->c:Lcom/p1/mobile/putong/core/ui/tarot/TarotListView$a;

    .line 90
    .line 91
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/tarot/TarotListView;->a:Landroid/view/VelocityTracker;

    .line 92
    .line 93
    invoke-virtual {p0}, Landroid/view/VelocityTracker;->getXVelocity()F

    .line 94
    .line 95
    .line 96
    move-result p0

    .line 97
    invoke-interface {p1, p0}, Lcom/p1/mobile/putong/core/ui/tarot/TarotListView$a;->b(F)V

    .line 98
    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_4
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/tarot/TarotListView;->b:F

    .line 106
    .line 107
    :cond_5
    :goto_0
    return v1
.end method

.method public setOnScrollListener(Lcom/p1/mobile/putong/core/ui/tarot/TarotListView$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/tarot/TarotListView;->c:Lcom/p1/mobile/putong/core/ui/tarot/TarotListView$a;

    .line 2
    .line 3
    return-void
.end method
