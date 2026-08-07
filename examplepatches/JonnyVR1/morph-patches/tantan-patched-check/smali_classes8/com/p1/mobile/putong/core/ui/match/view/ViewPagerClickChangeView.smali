.class public Lcom/p1/mobile/putong/core/ui/match/view/ViewPagerClickChangeView;
.super Landroid/view/View;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/match/view/ViewPagerClickChangeView$a;
    }
.end annotation


# instance fields
.field public a:I

.field public b:I

.field public c:Lcom/p1/mobile/putong/core/ui/match/view/ViewPagerClickChangeView$a;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/ViewPagerClickChangeView;->b:I

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 9
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/ViewPagerClickChangeView;->b:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/ViewPagerClickChangeView;->b:I

    return-void
.end method


# virtual methods
.method public onMeasure(II)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/ViewPagerClickChangeView;->a:I

    .line 9
    .line 10
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    float-to-int v0, v0

    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/ViewPagerClickChangeView;->c:Lcom/p1/mobile/putong/core/ui/match/view/ViewPagerClickChangeView$a;

    .line 7
    .line 8
    if-eqz v1, :cond_4

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    const/4 v1, 0x1

    .line 15
    if-eqz p1, :cond_2

    .line 16
    .line 17
    if-eq p1, v1, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/ViewPagerClickChangeView;->a:I

    .line 21
    .line 22
    div-int/lit8 v2, p1, 0x2

    .line 23
    .line 24
    if-le v0, v2, :cond_1

    .line 25
    .line 26
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/match/view/ViewPagerClickChangeView;->b:I

    .line 27
    .line 28
    div-int/lit8 v3, p1, 0x2

    .line 29
    .line 30
    if-le v2, v3, :cond_1

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/match/view/ViewPagerClickChangeView;->c:Lcom/p1/mobile/putong/core/ui/match/view/ViewPagerClickChangeView$a;

    .line 33
    .line 34
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/ui/match/view/ViewPagerClickChangeView$a;->w()V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    div-int/lit8 v2, p1, 0x2

    .line 39
    .line 40
    if-ge v0, v2, :cond_3

    .line 41
    .line 42
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/ViewPagerClickChangeView;->b:I

    .line 43
    .line 44
    div-int/lit8 p1, p1, 0x2

    .line 45
    .line 46
    if-ge v0, p1, :cond_3

    .line 47
    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/match/view/ViewPagerClickChangeView;->c:Lcom/p1/mobile/putong/core/ui/match/view/ViewPagerClickChangeView$a;

    .line 49
    .line 50
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/ui/match/view/ViewPagerClickChangeView$a;->B()V

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_2
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/ViewPagerClickChangeView;->b:I

    .line 55
    .line 56
    :cond_3
    :goto_0
    return v1

    .line 57
    :cond_4
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    return p0
.end method

.method public setChangeClickListener(Lcom/p1/mobile/putong/core/ui/match/view/ViewPagerClickChangeView$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/ViewPagerClickChangeView;->c:Lcom/p1/mobile/putong/core/ui/match/view/ViewPagerClickChangeView$a;

    .line 2
    .line 3
    return-void
.end method
