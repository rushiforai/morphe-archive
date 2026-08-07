.class public Lcom/p1/mobile/putong/feed/newui/camera/widget/g;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/newui/camera/widget/g$a;
    }
.end annotation


# instance fields
.field public a:Z

.field public b:I

.field public c:I

.field public d:I

.field public e:F

.field public f:F

.field public g:F

.field public h:F

.field public i:Lcom/p1/mobile/putong/feed/newui/camera/widget/g$a;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/g;->a:Z

    .line 6
    .line 7
    const/high16 v0, -0x40800000    # -1.0f

    .line 8
    .line 9
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/g;->e:F

    .line 10
    .line 11
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/g;->f:F

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final a(FF)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/g;->e:F

    .line 2
    .line 3
    sub-float/2addr p1, v0

    .line 4
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/g;->f:F

    .line 5
    .line 6
    sub-float/2addr p2, v0

    .line 7
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    cmpl-float p2, v0, p2

    .line 16
    .line 17
    if-lez p2, :cond_1

    .line 18
    .line 19
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/g;->c:I

    .line 20
    .line 21
    int-to-float p2, p2

    .line 22
    cmpl-float p2, v0, p2

    .line 23
    .line 24
    if-lez p2, :cond_1

    .line 25
    .line 26
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/g;->i:Lcom/p1/mobile/putong/feed/newui/camera/widget/g$a;

    .line 27
    .line 28
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result p2

    .line 32
    if-eqz p2, :cond_1

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/g;->i:Lcom/p1/mobile/putong/feed/newui/camera/widget/g$a;

    .line 35
    .line 36
    const/4 p2, 0x0

    .line 37
    cmpg-float p1, p1, p2

    .line 38
    .line 39
    if-gez p1, :cond_0

    .line 40
    .line 41
    const/4 p1, 0x1

    .line 42
    goto :goto_0

    .line 43
    :cond_0
    const/4 p1, 0x0

    .line 44
    :goto_0
    invoke-interface {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/g$a;->c(ZF)V

    .line 45
    .line 46
    .line 47
    :cond_1
    return-void
.end method

.method public final b(FF)F
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/g;->e:F

    .line 2
    .line 3
    sub-float/2addr p1, v0

    .line 4
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/g;->f:F

    .line 5
    .line 6
    sub-float/2addr p2, v0

    .line 7
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    cmpl-float p2, v0, p2

    .line 16
    .line 17
    if-lez p2, :cond_0

    .line 18
    .line 19
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/g;->b:I

    .line 20
    .line 21
    int-to-float p2, p2

    .line 22
    cmpl-float p2, v0, p2

    .line 23
    .line 24
    if-lez p2, :cond_0

    .line 25
    .line 26
    const/4 p2, 0x1

    .line 27
    iput-boolean p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/g;->a:Z

    .line 28
    .line 29
    :cond_0
    return p1
.end method

.method public c(Landroid/view/MotionEvent;)Z
    .locals 5

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    const/4 v2, 0x0

    .line 14
    const/4 v3, 0x1

    .line 15
    if-eqz p1, :cond_8

    .line 16
    .line 17
    const/high16 v4, -0x40800000    # -1.0f

    .line 18
    .line 19
    if-eq p1, v3, :cond_2

    .line 20
    .line 21
    const/4 v2, 0x2

    .line 22
    if-eq p1, v2, :cond_0

    .line 23
    .line 24
    goto :goto_1

    .line 25
    :cond_0
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/g;->e:F

    .line 26
    .line 27
    cmpl-float p1, p1, v4

    .line 28
    .line 29
    if-nez p1, :cond_1

    .line 30
    .line 31
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/g;->e:F

    .line 32
    .line 33
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/g;->f:F

    .line 34
    .line 35
    :cond_1
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/g;->b(FF)F

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/g;->a:Z

    .line 40
    .line 41
    if-eqz v1, :cond_7

    .line 42
    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/g;->i:Lcom/p1/mobile/putong/feed/newui/camera/widget/g$a;

    .line 44
    .line 45
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-eqz v1, :cond_7

    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/g;->i:Lcom/p1/mobile/putong/feed/newui/camera/widget/g$a;

    .line 52
    .line 53
    invoke-interface {v1, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/g$a;->a(F)V

    .line 54
    .line 55
    .line 56
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/g;->h:F

    .line 57
    .line 58
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/g;->g:F

    .line 59
    .line 60
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/g;->h:F

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_2
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/g;->a:Z

    .line 64
    .line 65
    if-eqz p1, :cond_3

    .line 66
    .line 67
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/g;->a(FF)V

    .line 68
    .line 69
    .line 70
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/g;->i:Lcom/p1/mobile/putong/feed/newui/camera/widget/g$a;

    .line 71
    .line 72
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    if-eqz p1, :cond_6

    .line 77
    .line 78
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/g;->b(FF)F

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/g;->d:I

    .line 83
    .line 84
    neg-int v3, v1

    .line 85
    int-to-float v3, v3

    .line 86
    cmpg-float v3, p1, v3

    .line 87
    .line 88
    if-gtz v3, :cond_4

    .line 89
    .line 90
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/g;->g:F

    .line 91
    .line 92
    cmpl-float v3, v3, v0

    .line 93
    .line 94
    if-lez v3, :cond_4

    .line 95
    .line 96
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/g;->i:Lcom/p1/mobile/putong/feed/newui/camera/widget/g$a;

    .line 97
    .line 98
    invoke-interface {v0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/g$a;->b(F)V

    .line 99
    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_4
    int-to-float v1, v1

    .line 103
    cmpl-float v1, p1, v1

    .line 104
    .line 105
    if-ltz v1, :cond_5

    .line 106
    .line 107
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/g;->g:F

    .line 108
    .line 109
    cmpg-float v0, v1, v0

    .line 110
    .line 111
    if-gez v0, :cond_5

    .line 112
    .line 113
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/g;->i:Lcom/p1/mobile/putong/feed/newui/camera/widget/g$a;

    .line 114
    .line 115
    invoke-interface {v0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/g$a;->b(F)V

    .line 116
    .line 117
    .line 118
    goto :goto_0

    .line 119
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/g;->i:Lcom/p1/mobile/putong/feed/newui/camera/widget/g$a;

    .line 120
    .line 121
    invoke-interface {p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/g$a;->onCancel()V

    .line 122
    .line 123
    .line 124
    :cond_6
    :goto_0
    iput-boolean v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/g;->a:Z

    .line 125
    .line 126
    iput v4, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/g;->e:F

    .line 127
    .line 128
    iput v4, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/g;->f:F

    .line 129
    .line 130
    :cond_7
    :goto_1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/g;->a:Z

    .line 131
    .line 132
    return p0

    .line 133
    :cond_8
    iput-boolean v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/g;->a:Z

    .line 134
    .line 135
    return v3
.end method

.method public d(Lcom/p1/mobile/putong/feed/newui/camera/widget/g$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/g;->i:Lcom/p1/mobile/putong/feed/newui/camera/widget/g$a;

    .line 2
    .line 3
    return-void
.end method

.method public e(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/g;->c:I

    .line 2
    .line 3
    return-void
.end method

.method public f(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/g;->d:I

    .line 2
    .line 3
    return-void
.end method

.method public g(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/g;->b:I

    .line 2
    .line 3
    return-void
.end method
