.class public Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$a;
.super Ll/ykl0$c;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/ykl0$c;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public clampViewPositionHorizontal(Landroid/view/View;II)I
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public clampViewPositionVertical(Landroid/view/View;II)I
    .locals 0

    .line 1
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;

    .line 2
    .line 3
    invoke-static {p3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->b(Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;)Z

    .line 4
    .line 5
    .line 6
    move-result p3

    .line 7
    if-eqz p3, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    neg-int p1, p1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;

    .line 16
    .line 17
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->d(Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;)I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;

    .line 22
    .line 23
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->c(Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;)I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    invoke-static {p2, p1, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->m(III)I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0
.end method

.method public getViewVerticalDragRange(Landroid/view/View;)I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->b(Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;

    .line 15
    .line 16
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->c(Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;)I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;

    .line 21
    .line 22
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->d(Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;)I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    sub-int/2addr p1, p0

    .line 27
    return p1
.end method

.method public onViewDragStateChanged(I)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, v0, :cond_0

    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;

    .line 5
    .line 6
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->k(Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;I)V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public onViewPositionChanged(Landroid/view/View;IIII)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;

    .line 2
    .line 3
    invoke-static {p0, p3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->j(Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onViewReleased(Landroid/view/View;FF)V
    .locals 3

    .line 1
    const/4 p2, 0x0

    .line 2
    cmpl-float p2, p3, p2

    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;

    .line 5
    .line 6
    const/4 v1, 0x3

    .line 7
    if-lez p2, :cond_0

    .line 8
    .line 9
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->c(Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;)I

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    goto :goto_1

    .line 14
    :cond_0
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->b(Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;

    .line 21
    .line 22
    invoke-static {v0, p1, p3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->l(Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;Landroid/view/View;F)Z

    .line 23
    .line 24
    .line 25
    move-result p3

    .line 26
    if-eqz p3, :cond_1

    .line 27
    .line 28
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;

    .line 29
    .line 30
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->i(Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;)Ljava/lang/ref/WeakReference;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    invoke-virtual {p2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    check-cast p2, Landroid/view/View;

    .line 39
    .line 40
    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    .line 41
    .line 42
    .line 43
    move-result p2

    .line 44
    neg-int p2, p2

    .line 45
    const/4 v1, 0x5

    .line 46
    goto :goto_1

    .line 47
    :cond_1
    const/4 p3, 0x4

    .line 48
    if-nez p2, :cond_3

    .line 49
    .line 50
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    .line 51
    .line 52
    .line 53
    move-result p2

    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;

    .line 55
    .line 56
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->d(Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;)I

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    sub-int v0, p2, v0

    .line 61
    .line 62
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;

    .line 67
    .line 68
    invoke-static {v2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->c(Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;)I

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    sub-int/2addr p2, v2

    .line 73
    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    .line 74
    .line 75
    .line 76
    move-result p2

    .line 77
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;

    .line 78
    .line 79
    if-le v0, p2, :cond_2

    .line 80
    .line 81
    invoke-static {v2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->c(Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;)I

    .line 82
    .line 83
    .line 84
    move-result p2

    .line 85
    goto :goto_1

    .line 86
    :cond_2
    invoke-static {v2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->d(Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;)I

    .line 87
    .line 88
    .line 89
    move-result p2

    .line 90
    goto :goto_0

    .line 91
    :cond_3
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;

    .line 92
    .line 93
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->d(Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;)I

    .line 94
    .line 95
    .line 96
    move-result p2

    .line 97
    :goto_0
    move v1, p3

    .line 98
    :goto_1
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;

    .line 99
    .line 100
    invoke-static {p3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->h(Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;)Ll/ykl0;

    .line 101
    .line 102
    .line 103
    move-result-object p3

    .line 104
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    invoke-virtual {p3, v0, p2}, Ll/ykl0;->O(II)Z

    .line 109
    .line 110
    .line 111
    move-result p2

    .line 112
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;

    .line 113
    .line 114
    if-eqz p2, :cond_4

    .line 115
    .line 116
    const/4 p2, 0x2

    .line 117
    invoke-static {p3, p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->k(Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;I)V

    .line 118
    .line 119
    .line 120
    new-instance p2, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$b;

    .line 121
    .line 122
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;

    .line 123
    .line 124
    invoke-direct {p2, p0, p1, v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$b;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;Landroid/view/View;I)V

    .line 125
    .line 126
    .line 127
    invoke-static {p1, p2}, Ll/kkl0;->b0(Landroid/view/View;Ljava/lang/Runnable;)V

    .line 128
    .line 129
    .line 130
    return-void

    .line 131
    :cond_4
    invoke-static {p3, v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->k(Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;I)V

    .line 132
    .line 133
    .line 134
    return-void
.end method

.method public tryCaptureView(Landroid/view/View;I)Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->f(Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    const/4 v2, 0x1

    .line 9
    if-ne v0, v2, :cond_0

    .line 10
    .line 11
    return v1

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->g(Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    return v1

    .line 21
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;

    .line 22
    .line 23
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->f(Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    const/4 v3, 0x3

    .line 28
    if-ne v0, v3, :cond_2

    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;

    .line 31
    .line 32
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->a(Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;)I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-ne v0, p2, :cond_2

    .line 37
    .line 38
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;

    .line 39
    .line 40
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->e(Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;)Ljava/lang/ref/WeakReference;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    invoke-virtual {p2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    check-cast p2, Landroid/view/View;

    .line 49
    .line 50
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-eqz v0, :cond_2

    .line 55
    .line 56
    const/4 v0, -0x1

    .line 57
    invoke-static {p2, v0}, Ll/kkl0;->d(Landroid/view/View;I)Z

    .line 58
    .line 59
    .line 60
    move-result p2

    .line 61
    if-eqz p2, :cond_2

    .line 62
    .line 63
    return v1

    .line 64
    :cond_2
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;

    .line 65
    .line 66
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->i(Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;)Ljava/lang/ref/WeakReference;

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    if-eqz p2, :cond_3

    .line 71
    .line 72
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;

    .line 73
    .line 74
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->i(Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;)Ljava/lang/ref/WeakReference;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    if-ne p0, p1, :cond_3

    .line 83
    .line 84
    return v2

    .line 85
    :cond_3
    return v1
.end method
