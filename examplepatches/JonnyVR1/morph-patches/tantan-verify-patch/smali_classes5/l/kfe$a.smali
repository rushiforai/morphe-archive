.class public final Ll/kfe$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/kfe;->r()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000)\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0007\n\u0002\u0008\n\n\u0002\u0010\u000b\n\u0002\u0008\u0006*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u000f\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0003\u0010\u0004J3\u0010\u000b\u001a\u00020\u00022\u0008\u0010\u0006\u001a\u0004\u0018\u00010\u00052\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u00052\u0006\u0010\t\u001a\u00020\u00082\u0006\u0010\n\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u0019\u0010\u000e\u001a\u00020\u00022\u0008\u0010\r\u001a\u0004\u0018\u00010\u0005H\u0016\u00a2\u0006\u0004\u0008\u000e\u0010\u000fJ\u0017\u0010\u0011\u001a\u00020\u00082\u0006\u0010\u0010\u001a\u00020\u0008H\u0002\u00a2\u0006\u0004\u0008\u0011\u0010\u0012R\"\u0010\u0015\u001a\u00020\u00138\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u0003\u0010\u0014\u001a\u0004\u0008\u0015\u0010\u0016\"\u0004\u0008\u0017\u0010\u0018\u00a8\u0006\u0019"
    }
    d2 = {
        "l/kfe$a",
        "Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout$b;",
        "",
        "a",
        "()V",
        "Landroid/view/MotionEvent;",
        "e1",
        "e2",
        "",
        "distanceX",
        "distanceY",
        "onScroll",
        "(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)V",
        "e",
        "b",
        "(Landroid/view/MotionEvent;)V",
        "height",
        "d",
        "(F)F",
        "",
        "Z",
        "isFling",
        "()Z",
        "setFling",
        "(Z)V",
        "b_core_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public a:Z

.field public final synthetic b:Ll/kfe;


# direct methods
.method public constructor <init>(Ll/kfe;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/kfe$a;->b:Ll/kfe;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic c(Ll/kfe;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/kfe$a;->e(Ll/kfe;Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static final e(Ll/kfe;Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    check-cast p1, Ljava/lang/Integer;

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    invoke-virtual {p0}, Ll/kfe;->h0()Lv/VLinear;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/kfe;->h0()Lv/VLinear;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/kfe$a;->a:Z

    .line 3
    .line 4
    iget-object p0, p0, Ll/kfe$a;->b:Ll/kfe;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/kfe;->V()Lcom/p1/mobile/putong/core/ui/quickaudio/DropDownAct;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public b(Landroid/view/MotionEvent;)V
    .locals 2

    .line 1
    iget-boolean p1, p0, Ll/kfe$a;->a:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object p1, p0, Ll/kfe$a;->b:Ll/kfe;

    .line 7
    .line 8
    invoke-static {p1}, Ll/kfe;->Q(Ll/kfe;)Landroid/animation/ValueAnimator;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    if-eqz p1, :cond_1

    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    const/4 v0, 0x1

    .line 19
    if-ne p1, v0, :cond_1

    .line 20
    .line 21
    iget-object p1, p0, Ll/kfe$a;->b:Ll/kfe;

    .line 22
    .line 23
    invoke-static {p1}, Ll/kfe;->Q(Ll/kfe;)Landroid/animation/ValueAnimator;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    if-eqz p1, :cond_1

    .line 28
    .line 29
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->end()V

    .line 30
    .line 31
    .line 32
    :cond_1
    iget-object p1, p0, Ll/kfe$a;->b:Ll/kfe;

    .line 33
    .line 34
    invoke-virtual {p1}, Ll/kfe;->h0()Lv/VLinear;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iget v0, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 43
    .line 44
    iget-object v1, p0, Ll/kfe$a;->b:Ll/kfe;

    .line 45
    .line 46
    invoke-static {v1}, Ll/kfe;->S(Ll/kfe;)I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    filled-new-array {v0, v1}, [I

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-static {p1, v0}, Ll/kfe;->T(Ll/kfe;Landroid/animation/ValueAnimator;)V

    .line 59
    .line 60
    .line 61
    iget-object p1, p0, Ll/kfe$a;->b:Ll/kfe;

    .line 62
    .line 63
    invoke-static {p1}, Ll/kfe;->Q(Ll/kfe;)Landroid/animation/ValueAnimator;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    if-eqz p1, :cond_2

    .line 68
    .line 69
    iget-object p0, p0, Ll/kfe$a;->b:Ll/kfe;

    .line 70
    .line 71
    const-wide/16 v0, 0x12c

    .line 72
    .line 73
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 74
    .line 75
    .line 76
    new-instance v0, Ll/jfe;

    .line 77
    .line 78
    invoke-direct {v0, p0}, Ll/jfe;-><init>(Ll/kfe;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    .line 85
    .line 86
    .line 87
    :cond_2
    :goto_0
    return-void
.end method

.method public final d(F)F
    .locals 2

    .line 1
    iget-object v0, p0, Ll/kfe$a;->b:Ll/kfe;

    .line 2
    .line 3
    invoke-static {v0}, Ll/kfe;->P(Ll/kfe;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    int-to-float v0, v0

    .line 8
    add-float/2addr v0, p1

    .line 9
    iget-object p1, p0, Ll/kfe$a;->b:Ll/kfe;

    .line 10
    .line 11
    invoke-static {p1}, Ll/kfe;->P(Ll/kfe;)I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    int-to-float p1, p1

    .line 16
    sub-float/2addr v0, p1

    .line 17
    iget-object p1, p0, Ll/kfe$a;->b:Ll/kfe;

    .line 18
    .line 19
    invoke-static {p1}, Ll/kfe;->N(Ll/kfe;)I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    int-to-float p1, p1

    .line 24
    iget-object v1, p0, Ll/kfe$a;->b:Ll/kfe;

    .line 25
    .line 26
    invoke-static {v1}, Ll/kfe;->O(Ll/kfe;)F

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    mul-float/2addr p1, v1

    .line 31
    sub-float/2addr v0, p1

    .line 32
    iget-object p1, p0, Ll/kfe$a;->b:Ll/kfe;

    .line 33
    .line 34
    invoke-static {p1}, Ll/kfe;->N(Ll/kfe;)I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    int-to-float p1, p1

    .line 39
    div-float/2addr v0, p1

    .line 40
    iget-object p0, p0, Ll/kfe$a;->b:Ll/kfe;

    .line 41
    .line 42
    invoke-static {p0}, Ll/kfe;->O(Ll/kfe;)F

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    add-float/2addr v0, p0

    .line 47
    return v0
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    cmpg-float p1, p4, p1

    .line 3
    .line 4
    if-gez p1, :cond_0

    .line 5
    .line 6
    iget-object p1, p0, Ll/kfe$a;->b:Ll/kfe;

    .line 7
    .line 8
    invoke-virtual {p1}, Ll/kfe;->h0()Lv/VLinear;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iget p1, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 17
    .line 18
    int-to-float p1, p1

    .line 19
    add-float/2addr p1, p4

    .line 20
    iget-object p2, p0, Ll/kfe$a;->b:Ll/kfe;

    .line 21
    .line 22
    invoke-static {p2}, Ll/kfe;->S(Ll/kfe;)I

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    int-to-float p2, p2

    .line 27
    cmpg-float p1, p1, p2

    .line 28
    .line 29
    if-gez p1, :cond_0

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iget-object p1, p0, Ll/kfe$a;->b:Ll/kfe;

    .line 33
    .line 34
    invoke-virtual {p1}, Ll/kfe;->h0()Lv/VLinear;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iget p1, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 43
    .line 44
    int-to-float p1, p1

    .line 45
    iget-object p2, p0, Ll/kfe$a;->b:Ll/kfe;

    .line 46
    .line 47
    invoke-static {p2}, Ll/kfe;->R(Ll/kfe;)I

    .line 48
    .line 49
    .line 50
    move-result p2

    .line 51
    int-to-float p2, p2

    .line 52
    div-float/2addr p1, p2

    .line 53
    const/high16 p2, 0x3f800000    # 1.0f

    .line 54
    .line 55
    sub-float/2addr p2, p1

    .line 56
    iget-object p1, p0, Ll/kfe$a;->b:Ll/kfe;

    .line 57
    .line 58
    invoke-virtual {p1}, Ll/kfe;->h0()Lv/VLinear;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    iget p1, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 67
    .line 68
    int-to-float p1, p1

    .line 69
    mul-float/2addr p4, p2

    .line 70
    add-float/2addr p1, p4

    .line 71
    iget-object p2, p0, Ll/kfe$a;->b:Ll/kfe;

    .line 72
    .line 73
    invoke-static {p2}, Ll/kfe;->R(Ll/kfe;)I

    .line 74
    .line 75
    .line 76
    move-result p2

    .line 77
    int-to-float p2, p2

    .line 78
    cmpl-float p2, p1, p2

    .line 79
    .line 80
    if-lez p2, :cond_1

    .line 81
    .line 82
    iget-object p1, p0, Ll/kfe$a;->b:Ll/kfe;

    .line 83
    .line 84
    invoke-static {p1}, Ll/kfe;->R(Ll/kfe;)I

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    int-to-float p1, p1

    .line 89
    :cond_1
    iget-object p2, p0, Ll/kfe$a;->b:Ll/kfe;

    .line 90
    .line 91
    invoke-virtual {p2}, Ll/kfe;->h0()Lv/VLinear;

    .line 92
    .line 93
    .line 94
    move-result-object p2

    .line 95
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 96
    .line 97
    .line 98
    move-result-object p2

    .line 99
    float-to-int p3, p1

    .line 100
    iput p3, p2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 101
    .line 102
    iget-object p3, p0, Ll/kfe$a;->b:Ll/kfe;

    .line 103
    .line 104
    invoke-virtual {p3}, Ll/kfe;->h0()Lv/VLinear;

    .line 105
    .line 106
    .line 107
    move-result-object p3

    .line 108
    invoke-virtual {p3, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 109
    .line 110
    .line 111
    iget-object p2, p0, Ll/kfe$a;->b:Ll/kfe;

    .line 112
    .line 113
    invoke-virtual {p2}, Ll/kfe;->h0()Lv/VLinear;

    .line 114
    .line 115
    .line 116
    move-result-object p2

    .line 117
    invoke-virtual {p0, p1}, Ll/kfe$a;->d(F)F

    .line 118
    .line 119
    .line 120
    move-result p0

    .line 121
    invoke-virtual {p2, p0}, Landroid/view/View;->setAlpha(F)V

    .line 122
    .line 123
    .line 124
    return-void
.end method
