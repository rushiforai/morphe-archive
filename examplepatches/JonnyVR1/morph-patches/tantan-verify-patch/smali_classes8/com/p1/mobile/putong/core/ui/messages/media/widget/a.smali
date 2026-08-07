.class public Lcom/p1/mobile/putong/core/ui/messages/media/widget/a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/messages/media/widget/a$a;
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

.field public i:Lcom/p1/mobile/putong/core/ui/messages/media/widget/a$a;


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
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/a;->a:Z

    .line 6
    .line 7
    const/high16 v0, -0x40800000    # -1.0f

    .line 8
    .line 9
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/a;->e:F

    .line 10
    .line 11
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/a;->f:F

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final a(FF)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/a;->e:F

    .line 2
    .line 3
    sub-float/2addr p1, v0

    .line 4
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/a;->f:F

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
    iget p2, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/a;->c:I

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/a;->i:Lcom/p1/mobile/putong/core/ui/messages/media/widget/a$a;

    .line 27
    .line 28
    if-eqz p0, :cond_1

    .line 29
    .line 30
    const/4 p2, 0x0

    .line 31
    cmpg-float p1, p1, p2

    .line 32
    .line 33
    if-gez p1, :cond_0

    .line 34
    .line 35
    const/4 p1, 0x1

    .line 36
    goto :goto_0

    .line 37
    :cond_0
    const/4 p1, 0x0

    .line 38
    :goto_0
    invoke-interface {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/a$a;->c(ZF)V

    .line 39
    .line 40
    .line 41
    :cond_1
    return-void
.end method

.method public final b(FF)F
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/a;->e:F

    .line 2
    .line 3
    sub-float/2addr p1, v0

    .line 4
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/a;->f:F

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
    iget p2, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/a;->b:I

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
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/a;->a:Z

    .line 28
    .line 29
    :cond_0
    return p1
.end method

.method public c(Landroid/view/MotionEvent;)Z
    .locals 6

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x2

    .line 7
    if-ne v0, v2, :cond_0

    .line 8
    .line 9
    return v1

    .line 10
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    const/4 v4, 0x1

    .line 23
    if-eqz p1, :cond_a

    .line 24
    .line 25
    const/high16 v5, -0x40800000    # -1.0f

    .line 26
    .line 27
    if-eq p1, v4, :cond_3

    .line 28
    .line 29
    if-eq p1, v2, :cond_1

    .line 30
    .line 31
    goto/16 :goto_1

    .line 32
    .line 33
    :cond_1
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/a;->e:F

    .line 34
    .line 35
    cmpl-float p1, p1, v5

    .line 36
    .line 37
    if-nez p1, :cond_2

    .line 38
    .line 39
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/a;->e:F

    .line 40
    .line 41
    iput v3, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/a;->f:F

    .line 42
    .line 43
    :cond_2
    invoke-virtual {p0, v0, v3}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/a;->b(FF)F

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/a;->a:Z

    .line 48
    .line 49
    if-eqz v1, :cond_9

    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/a;->i:Lcom/p1/mobile/putong/core/ui/messages/media/widget/a$a;

    .line 52
    .line 53
    if-eqz v1, :cond_9

    .line 54
    .line 55
    invoke-interface {v1, p1}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/a$a;->a(F)V

    .line 56
    .line 57
    .line 58
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/a;->h:F

    .line 59
    .line 60
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/a;->g:F

    .line 61
    .line 62
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/a;->h:F

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_3
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/a;->a:Z

    .line 66
    .line 67
    if-eqz p1, :cond_4

    .line 68
    .line 69
    invoke-virtual {p0, v0, v3}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/a;->a(FF)V

    .line 70
    .line 71
    .line 72
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/a;->i:Lcom/p1/mobile/putong/core/ui/messages/media/widget/a$a;

    .line 73
    .line 74
    if-eqz p1, :cond_8

    .line 75
    .line 76
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/a;->a:Z

    .line 77
    .line 78
    if-nez p1, :cond_5

    .line 79
    .line 80
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/a;->f:F

    .line 81
    .line 82
    sub-float p1, v3, p1

    .line 83
    .line 84
    const/high16 v2, 0x42a00000    # 80.0f

    .line 85
    .line 86
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 87
    .line 88
    .line 89
    move-result v2

    .line 90
    int-to-float v2, v2

    .line 91
    cmpl-float p1, p1, v2

    .line 92
    .line 93
    if-lez p1, :cond_5

    .line 94
    .line 95
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/a;->f:F

    .line 96
    .line 97
    cmpl-float p1, p1, v5

    .line 98
    .line 99
    if-eqz p1, :cond_5

    .line 100
    .line 101
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/a;->i:Lcom/p1/mobile/putong/core/ui/messages/media/widget/a$a;

    .line 102
    .line 103
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/a$a;->d()V

    .line 104
    .line 105
    .line 106
    :cond_5
    invoke-virtual {p0, v0, v3}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/a;->b(FF)F

    .line 107
    .line 108
    .line 109
    move-result p1

    .line 110
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/a;->d:I

    .line 111
    .line 112
    neg-int v3, v2

    .line 113
    int-to-float v3, v3

    .line 114
    cmpg-float v3, p1, v3

    .line 115
    .line 116
    if-gtz v3, :cond_6

    .line 117
    .line 118
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/a;->g:F

    .line 119
    .line 120
    cmpl-float v3, v3, v0

    .line 121
    .line 122
    if-lez v3, :cond_6

    .line 123
    .line 124
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/a;->i:Lcom/p1/mobile/putong/core/ui/messages/media/widget/a$a;

    .line 125
    .line 126
    invoke-interface {v0, p1}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/a$a;->b(F)V

    .line 127
    .line 128
    .line 129
    goto :goto_0

    .line 130
    :cond_6
    int-to-float v2, v2

    .line 131
    cmpl-float v2, p1, v2

    .line 132
    .line 133
    if-ltz v2, :cond_7

    .line 134
    .line 135
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/a;->g:F

    .line 136
    .line 137
    cmpg-float v0, v2, v0

    .line 138
    .line 139
    if-gez v0, :cond_7

    .line 140
    .line 141
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/a;->i:Lcom/p1/mobile/putong/core/ui/messages/media/widget/a$a;

    .line 142
    .line 143
    invoke-interface {v0, p1}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/a$a;->b(F)V

    .line 144
    .line 145
    .line 146
    goto :goto_0

    .line 147
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/a;->i:Lcom/p1/mobile/putong/core/ui/messages/media/widget/a$a;

    .line 148
    .line 149
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/a$a;->onCancel()V

    .line 150
    .line 151
    .line 152
    :cond_8
    :goto_0
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/a;->a:Z

    .line 153
    .line 154
    iput v5, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/a;->e:F

    .line 155
    .line 156
    iput v5, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/a;->f:F

    .line 157
    .line 158
    :cond_9
    :goto_1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/a;->a:Z

    .line 159
    .line 160
    return p0

    .line 161
    :cond_a
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/a;->a:Z

    .line 162
    .line 163
    return v4
.end method

.method public d(Lcom/p1/mobile/putong/core/ui/messages/media/widget/a$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/a;->i:Lcom/p1/mobile/putong/core/ui/messages/media/widget/a$a;

    .line 2
    .line 3
    return-void
.end method

.method public e(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/a;->c:I

    .line 2
    .line 3
    return-void
.end method

.method public f(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/a;->d:I

    .line 2
    .line 3
    return-void
.end method

.method public g(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/a;->b:I

    .line 2
    .line 3
    return-void
.end method
