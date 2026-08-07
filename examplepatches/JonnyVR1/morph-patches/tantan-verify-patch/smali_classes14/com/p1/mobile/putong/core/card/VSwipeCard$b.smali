.class public Lcom/p1/mobile/putong/core/card/VSwipeCard$b;
.super Ll/kmj$d;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/card/VSwipeCard;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/card/VSwipeCard;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/card/VSwipeCard;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard$b;->a:Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/kmj$d;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Landroid/view/MotionEvent;Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard$b;->a:Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-virtual {v0, v1}, Landroid/view/View;->setPivotX(F)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard$b;->a:Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    invoke-virtual {v0, v1}, Landroid/view/View;->setPivotY(F)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    sub-float/2addr v0, v1

    .line 28
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    sub-float/2addr v1, p1

    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard$b;->a:Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 38
    .line 39
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    .line 44
    .line 45
    .line 46
    move-result p2

    .line 47
    invoke-static {p0, v0, v1, p1, p2}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->N0(Lcom/p1/mobile/putong/core/card/VSwipeCard;FFFF)V

    .line 48
    .line 49
    .line 50
    const/4 p0, 0x1

    .line 51
    return p0
.end method

.method public final b(Landroid/view/MotionEvent;FF)V
    .locals 4

    .line 1
    const/high16 v0, 0x42c80000    # 100.0f

    .line 2
    .line 3
    div-float v0, p2, v0

    .line 4
    .line 5
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/high16 v2, 0x40a00000    # 5.0f

    .line 10
    .line 11
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    int-to-float v3, v3

    .line 16
    cmpg-float v1, v1, v3

    .line 17
    .line 18
    if-gez v1, :cond_0

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard$b;->a:Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->L0(Lcom/p1/mobile/putong/core/card/VSwipeCard;F)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    const/high16 v3, 0x41400000    # 12.0f

    .line 35
    .line 36
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    int-to-float v3, v3

    .line 41
    cmpg-float v1, v1, v3

    .line 42
    .line 43
    if-gez v1, :cond_1

    .line 44
    .line 45
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    int-to-float v1, v1

    .line 54
    cmpl-float v0, v0, v1

    .line 55
    .line 56
    if-ltz v0, :cond_1

    .line 57
    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard$b;->a:Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 59
    .line 60
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->Q0()V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard$b;->a:Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 65
    .line 66
    const/high16 v0, 0x447a0000    # 1000.0f

    .line 67
    .line 68
    div-float/2addr p2, v0

    .line 69
    div-float/2addr p3, v0

    .line 70
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    invoke-static {p0, p2, p3, p1}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->K0(Lcom/p1/mobile/putong/core/card/VSwipeCard;FFF)V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public onDoubleTap(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard$b;->a:Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->h1()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard$b;->a:Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->performClick()Z

    .line 12
    .line 13
    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public onDown(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard$b;->a:Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 2
    .line 3
    invoke-static {p1}, Ll/gt0;->a(Landroid/view/View;)Landroid/animation/Animator;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard$b;->a:Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 10
    .line 11
    iget p0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->j:I

    .line 12
    .line 13
    sget v0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->F:I

    .line 14
    .line 15
    if-ne p0, v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/animation/Animator;->cancel()V

    .line 18
    .line 19
    .line 20
    :cond_0
    const/4 p0, 0x1

    .line 21
    return p0
.end method

.method public onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 2

    .line 1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    sub-float/2addr v0, v1

    .line 10
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard$b;->a:Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 15
    .line 16
    invoke-static {v1}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->s0(Lcom/p1/mobile/putong/core/card/VSwipeCard;)I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    int-to-float v1, v1

    .line 21
    cmpl-float v0, v0, v1

    .line 22
    .line 23
    const/4 v1, 0x1

    .line 24
    if-gtz v0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    sub-float/2addr p1, v0

    .line 35
    sget v0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->B:I

    .line 36
    .line 37
    int-to-float v0, v0

    .line 38
    cmpl-float p1, p1, v0

    .line 39
    .line 40
    if-lez p1, :cond_0

    .line 41
    .line 42
    iget-object p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard$b;->a:Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 43
    .line 44
    invoke-static {p1}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->E0(Lcom/p1/mobile/putong/core/card/VSwipeCard;)Lcom/p1/mobile/putong/core/card/VSwipeCard$d;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-interface {p1, v1}, Lcom/p1/mobile/putong/core/card/VSwipeCard$d;->c(Z)Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-eqz p1, :cond_0

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard$b;->a:Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 56
    .line 57
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->Q0()V

    .line 58
    .line 59
    .line 60
    goto :goto_2

    .line 61
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard$b;->a:Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 62
    .line 63
    invoke-virtual {p1}, Landroid/view/View;->getTranslationX()F

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    mul-float/2addr p1, p3

    .line 68
    const/4 v0, 0x0

    .line 69
    cmpg-float p1, p1, v0

    .line 70
    .line 71
    if-ltz p1, :cond_3

    .line 72
    .line 73
    iget-object p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard$b;->a:Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 74
    .line 75
    invoke-virtual {p1}, Landroid/view/View;->getTranslationY()F

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    mul-float/2addr p1, p4

    .line 80
    cmpg-float p1, p1, v0

    .line 81
    .line 82
    if-gez p1, :cond_2

    .line 83
    .line 84
    iget-object p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard$b;->a:Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 85
    .line 86
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->Y0()Z

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    if-nez p1, :cond_2

    .line 91
    .line 92
    goto :goto_1

    .line 93
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard$b;->a:Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 94
    .line 95
    const/high16 p1, 0x447a0000    # 1000.0f

    .line 96
    .line 97
    div-float/2addr p3, p1

    .line 98
    div-float/2addr p4, p1

    .line 99
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    .line 100
    .line 101
    .line 102
    move-result p1

    .line 103
    invoke-static {p0, p3, p4, p1}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->K0(Lcom/p1/mobile/putong/core/card/VSwipeCard;FFF)V

    .line 104
    .line 105
    .line 106
    goto :goto_2

    .line 107
    :cond_3
    :goto_1
    invoke-virtual {p0, p2, p3, p4}, Lcom/p1/mobile/putong/core/card/VSwipeCard$b;->b(Landroid/view/MotionEvent;FF)V

    .line 108
    .line 109
    .line 110
    :goto_2
    return v1
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/card/VSwipeCard$b;->a:Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->performClick()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
