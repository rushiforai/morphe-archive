.class public Ll/fu0;
.super Ll/is40;
.source "SourceFile"

# interfaces
.implements Landroid/view/Choreographer$FrameCallback;


# static fields
.field public static f:I = 0x0

.field public static g:I = 0x1

.field public static h:F = 1.08f

.field public static i:I


# instance fields
.field public a:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Ll/c7m;",
            ">;"
        }
    .end annotation
.end field

.field public b:I

.field public c:Z

.field public d:Landroid/graphics/PaintFlagsDrawFilter;

.field public e:Ll/ro0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/high16 v0, 0x3fc00000    # 1.5f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sput v0, Ll/fu0;->i:I

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;ILl/c7m;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p3}, Ll/is40;-><init>(Landroid/content/Context;I)V

    .line 2
    .line 3
    .line 4
    sget p3, Ll/fu0;->f:I

    .line 5
    .line 6
    iput p3, p0, Ll/fu0;->b:I

    .line 7
    .line 8
    const/4 p3, 0x0

    .line 9
    iput-boolean p3, p0, Ll/fu0;->c:Z

    .line 10
    .line 11
    invoke-virtual {p0, p1, p2, p4}, Ll/fu0;->c(Landroid/content/Context;Ljava/lang/String;Ll/c7m;)V

    .line 12
    .line 13
    .line 14
    new-instance p1, Ljava/lang/ref/WeakReference;

    .line 15
    .line 16
    invoke-direct {p1, p4}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Ll/fu0;->a:Ljava/lang/ref/WeakReference;

    .line 20
    .line 21
    const/4 p1, 0x1

    .line 22
    iput-boolean p1, p0, Ll/fu0;->c:Z

    .line 23
    .line 24
    new-instance p1, Landroid/graphics/PaintFlagsDrawFilter;

    .line 25
    .line 26
    const/4 p2, 0x3

    .line 27
    invoke-direct {p1, p3, p2}, Landroid/graphics/PaintFlagsDrawFilter;-><init>(II)V

    .line 28
    .line 29
    .line 30
    iput-object p1, p0, Ll/fu0;->d:Landroid/graphics/PaintFlagsDrawFilter;

    .line 31
    .line 32
    return-void
.end method

.method public constructor <init>(Landroid/graphics/drawable/Drawable;I)V
    .locals 0
    .param p1    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 33
    invoke-direct {p0, p1, p2}, Ll/is40;-><init>(Landroid/graphics/drawable/Drawable;I)V

    .line 34
    sget p1, Ll/fu0;->f:I

    iput p1, p0, Ll/fu0;->b:I

    const/4 p1, 0x0

    .line 35
    iput-boolean p1, p0, Ll/fu0;->c:Z

    return-void
.end method


# virtual methods
.method public a()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/fu0;->e:Ll/ro0;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/ro0;->c()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0, p0}, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 17
    .line 18
    .line 19
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v1, p0, Ll/fu0;->e:Ll/ro0;

    .line 24
    .line 25
    invoke-virtual {v1}, Ll/ro0;->f()J

    .line 26
    .line 27
    .line 28
    move-result-wide v1

    .line 29
    invoke-virtual {v0, p0, v1, v2}, Landroid/view/Choreographer;->postFrameCallbackDelayed(Landroid/view/Choreographer$FrameCallback;J)V

    .line 30
    .line 31
    .line 32
    :cond_1
    :goto_0
    return-void
.end method

.method public final b()Z
    .locals 4

    .line 1
    iget-object v0, p0, Ll/fu0;->a:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_2

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-eqz v0, :cond_2

    .line 11
    .line 12
    iget-object v0, p0, Ll/fu0;->a:Ljava/lang/ref/WeakReference;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Ll/c7m;

    .line 19
    .line 20
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-eqz v2, :cond_2

    .line 25
    .line 26
    instance-of v2, v0, Landroid/view/View;

    .line 27
    .line 28
    if-eqz v2, :cond_1

    .line 29
    .line 30
    move-object v2, v0

    .line 31
    check-cast v2, Landroid/view/View;

    .line 32
    .line 33
    invoke-static {v2}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    if-eqz v3, :cond_0

    .line 42
    .line 43
    invoke-virtual {v2}, Landroid/app/Activity;->isFinishing()Z

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    if-nez v3, :cond_0

    .line 48
    .line 49
    invoke-virtual {v2}, Landroid/app/Activity;->isDestroyed()Z

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    if-eqz v2, :cond_1

    .line 54
    .line 55
    :cond_0
    return v1

    .line 56
    :cond_1
    iget-object v2, p0, Ll/fu0;->e:Ll/ro0;

    .line 57
    .line 58
    invoke-virtual {v2}, Ll/ro0;->a()V

    .line 59
    .line 60
    .line 61
    invoke-interface {v0, v1}, Ll/c7m;->f(I)V

    .line 62
    .line 63
    .line 64
    iget-object p0, p0, Ll/fu0;->e:Ll/ro0;

    .line 65
    .line 66
    invoke-virtual {p0}, Ll/ro0;->d()Z

    .line 67
    .line 68
    .line 69
    const/4 p0, 0x1

    .line 70
    return p0

    .line 71
    :cond_2
    return v1
.end method

.method public final c(Landroid/content/Context;Ljava/lang/String;Ll/c7m;)V
    .locals 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1a

    .line 4
    .line 5
    if-lt v0, v1, :cond_0

    .line 6
    .line 7
    new-instance v0, Ll/du0;

    .line 8
    .line 9
    invoke-direct {v0}, Ll/du0;-><init>()V

    .line 10
    .line 11
    .line 12
    new-instance v1, Ljava/lang/ref/WeakReference;

    .line 13
    .line 14
    invoke-direct {v1, p3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, p1, p2, v1}, Ll/du0;->d(Landroid/content/Context;Ljava/lang/String;Ljava/lang/ref/WeakReference;)Ll/ro0;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iput-object p1, p0, Ll/fu0;->e:Ll/ro0;

    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public d()V
    .locals 1

    .line 1
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public doFrame(J)V
    .locals 0
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "LogUseError"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/fu0;->b()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/fu0;->a()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;Ljava/lang/CharSequence;IIFIIILandroid/graphics/Paint;)V
    .locals 0
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p9    # Landroid/graphics/Paint;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p9}, Landroid/graphics/Paint;->getFontMetricsInt()Landroid/graphics/Paint$FontMetricsInt;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    iget p3, p2, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    .line 6
    .line 7
    iget p2, p2, Landroid/graphics/Paint$FontMetricsInt;->top:I

    .line 8
    .line 9
    sub-int/2addr p3, p2

    .line 10
    float-to-int p2, p5

    .line 11
    div-int/lit8 p4, p3, 0x2

    .line 12
    .line 13
    add-int/2addr p2, p4

    .line 14
    sget p5, Ll/fu0;->i:I

    .line 15
    .line 16
    add-int/2addr p2, p5

    .line 17
    sub-int/2addr p8, p6

    .line 18
    div-int/lit8 p8, p8, 0x2

    .line 19
    .line 20
    add-int/2addr p6, p8

    .line 21
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 22
    .line 23
    .line 24
    move-result p5

    .line 25
    int-to-float p2, p2

    .line 26
    int-to-float p6, p6

    .line 27
    invoke-virtual {p1, p2, p6}, Landroid/graphics/Canvas;->translate(FF)V

    .line 28
    .line 29
    .line 30
    iget-object p2, p0, Ll/fu0;->d:Landroid/graphics/PaintFlagsDrawFilter;

    .line 31
    .line 32
    invoke-virtual {p1, p2}, Landroid/graphics/Canvas;->setDrawFilter(Landroid/graphics/DrawFilter;)V

    .line 33
    .line 34
    .line 35
    iget-boolean p2, p0, Ll/fu0;->c:Z

    .line 36
    .line 37
    if-eqz p2, :cond_1

    .line 38
    .line 39
    iget-object p2, p0, Ll/fu0;->e:Ll/ro0;

    .line 40
    .line 41
    if-eqz p2, :cond_0

    .line 42
    .line 43
    invoke-virtual {p2}, Ll/ro0;->c()Z

    .line 44
    .line 45
    .line 46
    move-result p2

    .line 47
    if-eqz p2, :cond_0

    .line 48
    .line 49
    iget-object p2, p0, Ll/fu0;->e:Ll/ro0;

    .line 50
    .line 51
    invoke-virtual {p2}, Ll/ro0;->e()Ll/qo0;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result p2

    .line 59
    if-eqz p2, :cond_0

    .line 60
    .line 61
    iget-object p2, p0, Ll/fu0;->e:Ll/ro0;

    .line 62
    .line 63
    invoke-virtual {p2}, Ll/ro0;->e()Ll/qo0;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    new-instance p6, Landroid/graphics/RectF;

    .line 68
    .line 69
    neg-int p3, p3

    .line 70
    div-int/lit8 p3, p3, 0x2

    .line 71
    .line 72
    int-to-float p3, p3

    .line 73
    sget p7, Ll/fu0;->h:F

    .line 74
    .line 75
    mul-float p8, p3, p7

    .line 76
    .line 77
    mul-float/2addr p3, p7

    .line 78
    int-to-float p4, p4

    .line 79
    mul-float p9, p4, p7

    .line 80
    .line 81
    mul-float/2addr p4, p7

    .line 82
    invoke-direct {p6, p8, p3, p9, p4}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 83
    .line 84
    .line 85
    iget-object p3, p2, Ll/qo0;->a:Landroid/graphics/Bitmap;

    .line 86
    .line 87
    iget-object p2, p2, Ll/qo0;->b:Landroid/graphics/Rect;

    .line 88
    .line 89
    const/4 p4, 0x0

    .line 90
    invoke-virtual {p1, p3, p2, p6, p4}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 91
    .line 92
    .line 93
    iget p2, p0, Ll/fu0;->b:I

    .line 94
    .line 95
    sget p3, Ll/fu0;->f:I

    .line 96
    .line 97
    if-ne p2, p3, :cond_2

    .line 98
    .line 99
    sget p2, Ll/fu0;->g:I

    .line 100
    .line 101
    iput p2, p0, Ll/fu0;->b:I

    .line 102
    .line 103
    invoke-virtual {p0}, Ll/fu0;->a()V

    .line 104
    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_0
    invoke-virtual {p0}, Ll/is40;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    new-instance p2, Landroid/graphics/Rect;

    .line 112
    .line 113
    neg-int p3, p3

    .line 114
    div-int/lit8 p3, p3, 0x2

    .line 115
    .line 116
    int-to-float p3, p3

    .line 117
    sget p6, Ll/fu0;->h:F

    .line 118
    .line 119
    mul-float p7, p3, p6

    .line 120
    .line 121
    float-to-int p7, p7

    .line 122
    mul-float/2addr p3, p6

    .line 123
    float-to-int p3, p3

    .line 124
    int-to-float p4, p4

    .line 125
    mul-float p8, p4, p6

    .line 126
    .line 127
    float-to-int p8, p8

    .line 128
    mul-float/2addr p4, p6

    .line 129
    float-to-int p4, p4

    .line 130
    invoke-direct {p2, p7, p3, p8, p4}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {p0, p2}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 134
    .line 135
    .line 136
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 137
    .line 138
    .line 139
    goto :goto_0

    .line 140
    :cond_1
    invoke-virtual {p0}, Ll/is40;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    new-instance p2, Landroid/graphics/Rect;

    .line 145
    .line 146
    neg-int p3, p3

    .line 147
    div-int/lit8 p3, p3, 0x2

    .line 148
    .line 149
    int-to-float p3, p3

    .line 150
    sget p6, Ll/fu0;->h:F

    .line 151
    .line 152
    mul-float p7, p3, p6

    .line 153
    .line 154
    float-to-int p7, p7

    .line 155
    mul-float/2addr p3, p6

    .line 156
    float-to-int p3, p3

    .line 157
    int-to-float p4, p4

    .line 158
    mul-float p8, p4, p6

    .line 159
    .line 160
    float-to-int p8, p8

    .line 161
    mul-float/2addr p4, p6

    .line 162
    float-to-int p4, p4

    .line 163
    invoke-direct {p2, p7, p3, p8, p4}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 164
    .line 165
    .line 166
    invoke-virtual {p0, p2}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 167
    .line 168
    .line 169
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 170
    .line 171
    .line 172
    :cond_2
    :goto_0
    invoke-virtual {p1, p5}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 173
    .line 174
    .line 175
    return-void
.end method

.method public getSize(Landroid/graphics/Paint;Ljava/lang/CharSequence;IILandroid/graphics/Paint$FontMetricsInt;)I
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Paint;->getFontMetricsInt()Landroid/graphics/Paint$FontMetricsInt;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p5, :cond_0

    .line 6
    .line 7
    iget p1, p0, Landroid/graphics/Paint$FontMetricsInt;->top:I

    .line 8
    .line 9
    iput p1, p5, Landroid/graphics/Paint$FontMetricsInt;->top:I

    .line 10
    .line 11
    iget p1, p0, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    .line 12
    .line 13
    iput p1, p5, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    .line 14
    .line 15
    iget p1, p0, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    .line 16
    .line 17
    iput p1, p5, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    .line 18
    .line 19
    iget p1, p0, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    .line 20
    .line 21
    iput p1, p5, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    .line 22
    .line 23
    iget p1, p0, Landroid/graphics/Paint$FontMetricsInt;->leading:I

    .line 24
    .line 25
    iput p1, p5, Landroid/graphics/Paint$FontMetricsInt;->leading:I

    .line 26
    .line 27
    :cond_0
    iget p1, p0, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    .line 28
    .line 29
    iget p0, p0, Landroid/graphics/Paint$FontMetricsInt;->top:I

    .line 30
    .line 31
    sub-int/2addr p1, p0

    .line 32
    sget p0, Ll/fu0;->i:I

    .line 33
    .line 34
    mul-int/lit8 p0, p0, 0x2

    .line 35
    .line 36
    add-int/2addr p1, p0

    .line 37
    return p1
.end method
