.class public Lcom/p1/mobile/putong/core/view/GradientColorTextView;
.super Landroidx/appcompat/widget/AppCompatTextView;
.source "SourceFile"


# instance fields
.field public a:Landroid/graphics/LinearGradient;

.field public b:Landroid/graphics/Paint;

.field public c:I

.field public d:I

.field public e:Landroid/graphics/Rect;

.field public f:I

.field public g:I

.field public h:Z

.field public i:Z

.field public j:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 67
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/view/GradientColorTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 66
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/view/GradientColorTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroidx/appcompat/widget/AppCompatTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p3, 0x0

    .line 5
    iput p3, p0, Lcom/p1/mobile/putong/core/view/GradientColorTextView;->c:I

    .line 6
    .line 7
    iput p3, p0, Lcom/p1/mobile/putong/core/view/GradientColorTextView;->d:I

    .line 8
    .line 9
    new-instance v0, Landroid/graphics/Rect;

    .line 10
    .line 11
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/core/view/GradientColorTextView;->e:Landroid/graphics/Rect;

    .line 15
    .line 16
    sget-object v0, Ll/khc0;->F0:[I

    .line 17
    .line 18
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    sget p2, Ll/khc0;->J0:I

    .line 23
    .line 24
    const v0, -0x42968

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 28
    .line 29
    .line 30
    move-result p2

    .line 31
    sget v0, Ll/khc0;->H0:I

    .line 32
    .line 33
    const v1, -0x1d3c79

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    invoke-virtual {p0, p2, v0}, Lcom/p1/mobile/putong/core/view/GradientColorTextView;->h(II)V

    .line 41
    .line 42
    .line 43
    sget p2, Ll/khc0;->G0:I

    .line 44
    .line 45
    const/4 v0, 0x1

    .line 46
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 47
    .line 48
    .line 49
    move-result p2

    .line 50
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/view/GradientColorTextView;->setEnableGradientColor(Z)V

    .line 51
    .line 52
    .line 53
    sget p2, Ll/khc0;->I0:I

    .line 54
    .line 55
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 56
    .line 57
    .line 58
    move-result p2

    .line 59
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/view/GradientColorTextView;->setGradientOrientation(I)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 63
    .line 64
    .line 65
    return-void
.end method


# virtual methods
.method public h(II)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param
    .param p2    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/view/GradientColorTextView;->f:I

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    iget v0, p0, Lcom/p1/mobile/putong/core/view/GradientColorTextView;->g:I

    .line 6
    .line 7
    if-eq v0, p2, :cond_1

    .line 8
    .line 9
    :cond_0
    const/4 v0, 0x1

    .line 10
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/view/GradientColorTextView;->i:Z

    .line 11
    .line 12
    :cond_1
    iput p1, p0, Lcom/p1/mobile/putong/core/view/GradientColorTextView;->f:I

    .line 13
    .line 14
    iput p2, p0, Lcom/p1/mobile/putong/core/view/GradientColorTextView;->g:I

    .line 15
    .line 16
    return-void
.end method

.method public final i()V
    .locals 11

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/view/GradientColorTextView;->i:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/GradientColorTextView;->b:Landroid/graphics/Paint;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/graphics/Paint;->getShader()Landroid/graphics/Shader;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/GradientColorTextView;->a:Landroid/graphics/LinearGradient;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/GradientColorTextView;->b:Landroid/graphics/Paint;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/graphics/Paint;->getShader()Landroid/graphics/Shader;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/core/view/GradientColorTextView;->a:Landroid/graphics/LinearGradient;

    .line 24
    .line 25
    if-eq v0, v1, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    return-void

    .line 29
    :cond_1
    :goto_0
    iget v0, p0, Lcom/p1/mobile/putong/core/view/GradientColorTextView;->j:I

    .line 30
    .line 31
    if-nez v0, :cond_2

    .line 32
    .line 33
    new-instance v1, Landroid/graphics/LinearGradient;

    .line 34
    .line 35
    iget v0, p0, Lcom/p1/mobile/putong/core/view/GradientColorTextView;->c:I

    .line 36
    .line 37
    int-to-float v4, v0

    .line 38
    iget v0, p0, Lcom/p1/mobile/putong/core/view/GradientColorTextView;->f:I

    .line 39
    .line 40
    iget v2, p0, Lcom/p1/mobile/putong/core/view/GradientColorTextView;->g:I

    .line 41
    .line 42
    filled-new-array {v0, v2}, [I

    .line 43
    .line 44
    .line 45
    move-result-object v6

    .line 46
    const/4 v7, 0x0

    .line 47
    sget-object v8, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 48
    .line 49
    const/4 v2, 0x0

    .line 50
    const/4 v3, 0x0

    .line 51
    const/4 v5, 0x0

    .line 52
    invoke-direct/range {v1 .. v8}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    .line 53
    .line 54
    .line 55
    iput-object v1, p0, Lcom/p1/mobile/putong/core/view/GradientColorTextView;->a:Landroid/graphics/LinearGradient;

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_2
    const/4 v1, 0x1

    .line 59
    if-ne v0, v1, :cond_3

    .line 60
    .line 61
    new-instance v2, Landroid/graphics/LinearGradient;

    .line 62
    .line 63
    iget v0, p0, Lcom/p1/mobile/putong/core/view/GradientColorTextView;->d:I

    .line 64
    .line 65
    int-to-float v6, v0

    .line 66
    iget v0, p0, Lcom/p1/mobile/putong/core/view/GradientColorTextView;->f:I

    .line 67
    .line 68
    iget v1, p0, Lcom/p1/mobile/putong/core/view/GradientColorTextView;->g:I

    .line 69
    .line 70
    filled-new-array {v0, v1}, [I

    .line 71
    .line 72
    .line 73
    move-result-object v7

    .line 74
    const/4 v8, 0x0

    .line 75
    sget-object v9, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 76
    .line 77
    const/4 v3, 0x0

    .line 78
    const/4 v4, 0x0

    .line 79
    const/4 v5, 0x0

    .line 80
    invoke-direct/range {v2 .. v9}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    .line 81
    .line 82
    .line 83
    iput-object v2, p0, Lcom/p1/mobile/putong/core/view/GradientColorTextView;->a:Landroid/graphics/LinearGradient;

    .line 84
    .line 85
    goto :goto_1

    .line 86
    :cond_3
    const/4 v1, 0x2

    .line 87
    if-ne v0, v1, :cond_4

    .line 88
    .line 89
    new-instance v2, Landroid/graphics/LinearGradient;

    .line 90
    .line 91
    iget v0, p0, Lcom/p1/mobile/putong/core/view/GradientColorTextView;->d:I

    .line 92
    .line 93
    int-to-float v4, v0

    .line 94
    iget v0, p0, Lcom/p1/mobile/putong/core/view/GradientColorTextView;->c:I

    .line 95
    .line 96
    int-to-float v5, v0

    .line 97
    iget v0, p0, Lcom/p1/mobile/putong/core/view/GradientColorTextView;->f:I

    .line 98
    .line 99
    iget v1, p0, Lcom/p1/mobile/putong/core/view/GradientColorTextView;->g:I

    .line 100
    .line 101
    filled-new-array {v0, v1}, [I

    .line 102
    .line 103
    .line 104
    move-result-object v7

    .line 105
    const/4 v8, 0x0

    .line 106
    sget-object v9, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 107
    .line 108
    const/4 v3, 0x0

    .line 109
    const/4 v6, 0x0

    .line 110
    invoke-direct/range {v2 .. v9}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    .line 111
    .line 112
    .line 113
    iput-object v2, p0, Lcom/p1/mobile/putong/core/view/GradientColorTextView;->a:Landroid/graphics/LinearGradient;

    .line 114
    .line 115
    goto :goto_1

    .line 116
    :cond_4
    const/4 v1, 0x3

    .line 117
    if-ne v0, v1, :cond_5

    .line 118
    .line 119
    new-instance v2, Landroid/graphics/LinearGradient;

    .line 120
    .line 121
    iget v0, p0, Lcom/p1/mobile/putong/core/view/GradientColorTextView;->c:I

    .line 122
    .line 123
    int-to-float v5, v0

    .line 124
    iget v0, p0, Lcom/p1/mobile/putong/core/view/GradientColorTextView;->d:I

    .line 125
    .line 126
    int-to-float v6, v0

    .line 127
    iget v0, p0, Lcom/p1/mobile/putong/core/view/GradientColorTextView;->f:I

    .line 128
    .line 129
    iget v1, p0, Lcom/p1/mobile/putong/core/view/GradientColorTextView;->g:I

    .line 130
    .line 131
    filled-new-array {v0, v1}, [I

    .line 132
    .line 133
    .line 134
    move-result-object v7

    .line 135
    const/4 v8, 0x0

    .line 136
    sget-object v9, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 137
    .line 138
    const/4 v3, 0x0

    .line 139
    const/4 v4, 0x0

    .line 140
    invoke-direct/range {v2 .. v9}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    .line 141
    .line 142
    .line 143
    iput-object v2, p0, Lcom/p1/mobile/putong/core/view/GradientColorTextView;->a:Landroid/graphics/LinearGradient;

    .line 144
    .line 145
    goto :goto_1

    .line 146
    :cond_5
    new-instance v3, Landroid/graphics/LinearGradient;

    .line 147
    .line 148
    iget v0, p0, Lcom/p1/mobile/putong/core/view/GradientColorTextView;->c:I

    .line 149
    .line 150
    int-to-float v6, v0

    .line 151
    iget v0, p0, Lcom/p1/mobile/putong/core/view/GradientColorTextView;->f:I

    .line 152
    .line 153
    iget v1, p0, Lcom/p1/mobile/putong/core/view/GradientColorTextView;->g:I

    .line 154
    .line 155
    filled-new-array {v0, v1}, [I

    .line 156
    .line 157
    .line 158
    move-result-object v8

    .line 159
    const/4 v9, 0x0

    .line 160
    sget-object v10, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 161
    .line 162
    const/4 v4, 0x0

    .line 163
    const/4 v5, 0x0

    .line 164
    const/4 v7, 0x0

    .line 165
    invoke-direct/range {v3 .. v10}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    .line 166
    .line 167
    .line 168
    iput-object v3, p0, Lcom/p1/mobile/putong/core/view/GradientColorTextView;->a:Landroid/graphics/LinearGradient;

    .line 169
    .line 170
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/GradientColorTextView;->b:Landroid/graphics/Paint;

    .line 171
    .line 172
    iget-object v1, p0, Lcom/p1/mobile/putong/core/view/GradientColorTextView;->a:Landroid/graphics/LinearGradient;

    .line 173
    .line 174
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 175
    .line 176
    .line 177
    const/4 v0, 0x0

    .line 178
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/view/GradientColorTextView;->i:Z

    .line 179
    .line 180
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/view/GradientColorTextView;->h:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iput v0, p0, Lcom/p1/mobile/putong/core/view/GradientColorTextView;->c:I

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iput v0, p0, Lcom/p1/mobile/putong/core/view/GradientColorTextView;->d:I

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/core/view/GradientColorTextView;->b:Landroid/graphics/Paint;

    .line 22
    .line 23
    invoke-virtual {p0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/core/view/GradientColorTextView;->b:Landroid/graphics/Paint;

    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    iget-object v3, p0, Lcom/p1/mobile/putong/core/view/GradientColorTextView;->e:Landroid/graphics/Rect;

    .line 38
    .line 39
    const/4 v4, 0x0

    .line 40
    invoke-virtual {v1, v0, v4, v2, v3}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/view/GradientColorTextView;->i()V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    int-to-float v1, v1

    .line 51
    const/high16 v2, 0x40000000    # 2.0f

    .line 52
    .line 53
    div-float/2addr v1, v2

    .line 54
    iget-object v3, p0, Lcom/p1/mobile/putong/core/view/GradientColorTextView;->e:Landroid/graphics/Rect;

    .line 55
    .line 56
    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    int-to-float v3, v3

    .line 61
    div-float/2addr v3, v2

    .line 62
    sub-float/2addr v1, v3

    .line 63
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    int-to-float v3, v3

    .line 68
    div-float/2addr v3, v2

    .line 69
    iget-object v4, p0, Lcom/p1/mobile/putong/core/view/GradientColorTextView;->e:Landroid/graphics/Rect;

    .line 70
    .line 71
    invoke-virtual {v4}, Landroid/graphics/Rect;->height()I

    .line 72
    .line 73
    .line 74
    move-result v4

    .line 75
    int-to-float v4, v4

    .line 76
    div-float/2addr v4, v2

    .line 77
    add-float/2addr v3, v4

    .line 78
    iget-object p0, p0, Lcom/p1/mobile/putong/core/view/GradientColorTextView;->b:Landroid/graphics/Paint;

    .line 79
    .line 80
    invoke-virtual {p1, v0, v1, v3, p0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_0
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    const/4 v1, 0x0

    .line 89
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 90
    .line 91
    .line 92
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public onSizeChanged(IIII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/view/GradientColorTextView;->i:Z

    .line 6
    .line 7
    return-void
.end method

.method public setEnableGradientColor(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/view/GradientColorTextView;->h:Z

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/view/GradientColorTextView;->i:Z

    .line 7
    .line 8
    :cond_0
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/view/GradientColorTextView;->h:Z

    .line 9
    .line 10
    return-void
.end method

.method public setGradientOrientation(I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/view/GradientColorTextView;->j:I

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/view/GradientColorTextView;->i:Z

    .line 7
    .line 8
    :cond_0
    iput p1, p0, Lcom/p1/mobile/putong/core/view/GradientColorTextView;->j:I

    .line 9
    .line 10
    return-void
.end method
