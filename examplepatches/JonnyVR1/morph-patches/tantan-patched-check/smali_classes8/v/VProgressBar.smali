.class public Lv/VProgressBar;
.super Landroid/widget/ProgressBar;
.source "SourceFile"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 189
    invoke-direct {p0, p1, v0}, Lv/VProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 188
    sget v0, Ll/o8c0;->a:I

    invoke-direct {p0, p1, p2, v0}, Lv/VProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 9

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->isInEditMode()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    new-instance p2, Lv/progressbar/ProgressDrawable$i;

    .line 11
    .line 12
    invoke-direct {p2, p1}, Lv/progressbar/ProgressDrawable$i;-><init>(Landroid/content/Context;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p2}, Lv/progressbar/ProgressDrawable$i;->a()Lv/progressbar/ProgressDrawable;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0, p1}, Landroid/widget/ProgressBar;->setIndeterminateDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    sget-object v1, Ll/hhc0;->r4:[I

    .line 28
    .line 29
    const/4 v2, 0x0

    .line 30
    invoke-virtual {p1, p2, v1, p3, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    sget p3, Ll/hhc0;->s4:I

    .line 35
    .line 36
    sget v1, Ll/z8c0;->x:I

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    invoke-virtual {p2, p3, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 43
    .line 44
    .line 45
    move-result p3

    .line 46
    sget v1, Ll/hhc0;->y4:I

    .line 47
    .line 48
    sget v3, Ll/bac0;->f:I

    .line 49
    .line 50
    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDimension(I)F

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    invoke-virtual {p2, v1, v3}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    sget v3, Ll/hhc0;->x4:I

    .line 59
    .line 60
    const/high16 v4, -0x40800000    # -1.0f

    .line 61
    .line 62
    invoke-virtual {p2, v3, v4}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    sget v4, Ll/hhc0;->z4:I

    .line 67
    .line 68
    sget v5, Lcom/p1/mobile/android/R$string;->w8:I

    .line 69
    .line 70
    invoke-virtual {v0, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v5

    .line 74
    invoke-static {v5}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 75
    .line 76
    .line 77
    move-result v5

    .line 78
    invoke-virtual {p2, v4, v5}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 79
    .line 80
    .line 81
    move-result v4

    .line 82
    sget v5, Ll/hhc0;->w4:I

    .line 83
    .line 84
    sget v6, Lcom/p1/mobile/android/R$string;->v8:I

    .line 85
    .line 86
    invoke-virtual {v0, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v6

    .line 90
    invoke-static {v6}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 91
    .line 92
    .line 93
    move-result v6

    .line 94
    invoke-virtual {p2, v5, v6}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 95
    .line 96
    .line 97
    move-result v5

    .line 98
    sget v6, Ll/hhc0;->t4:I

    .line 99
    .line 100
    invoke-virtual {p2, v6, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 101
    .line 102
    .line 103
    move-result v2

    .line 104
    sget v6, Ll/hhc0;->v4:I

    .line 105
    .line 106
    sget v7, Ll/zdc0;->b:I

    .line 107
    .line 108
    invoke-virtual {v0, v7}, Landroid/content/res/Resources;->getInteger(I)I

    .line 109
    .line 110
    .line 111
    move-result v7

    .line 112
    invoke-virtual {p2, v6, v7}, Landroid/content/res/TypedArray;->getInteger(II)I

    .line 113
    .line 114
    .line 115
    move-result v6

    .line 116
    sget v7, Ll/hhc0;->u4:I

    .line 117
    .line 118
    sget v8, Ll/zdc0;->a:I

    .line 119
    .line 120
    invoke-virtual {v0, v8}, Landroid/content/res/Resources;->getInteger(I)I

    .line 121
    .line 122
    .line 123
    move-result v8

    .line 124
    invoke-virtual {p2, v7, v8}, Landroid/content/res/TypedArray;->getInteger(II)I

    .line 125
    .line 126
    .line 127
    move-result v7

    .line 128
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    .line 129
    .line 130
    .line 131
    if-eqz v2, :cond_1

    .line 132
    .line 133
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getIntArray(I)[I

    .line 134
    .line 135
    .line 136
    move-result-object p2

    .line 137
    goto :goto_0

    .line 138
    :cond_1
    const/4 p2, 0x0

    .line 139
    :goto_0
    new-instance v0, Lv/progressbar/ProgressDrawable$i;

    .line 140
    .line 141
    invoke-direct {v0, p1}, Lv/progressbar/ProgressDrawable$i;-><init>(Landroid/content/Context;)V

    .line 142
    .line 143
    .line 144
    invoke-virtual {v0, v4}, Lv/progressbar/ProgressDrawable$i;->j(F)Lv/progressbar/ProgressDrawable$i;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    invoke-virtual {p1, v5}, Lv/progressbar/ProgressDrawable$i;->g(F)Lv/progressbar/ProgressDrawable$i;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    invoke-virtual {p1, v1}, Lv/progressbar/ProgressDrawable$i;->i(F)Lv/progressbar/ProgressDrawable$i;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    invoke-virtual {p1, v3}, Lv/progressbar/ProgressDrawable$i;->h(F)Lv/progressbar/ProgressDrawable$i;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    invoke-virtual {p1, v6}, Lv/progressbar/ProgressDrawable$i;->f(I)Lv/progressbar/ProgressDrawable$i;

    .line 161
    .line 162
    .line 163
    move-result-object p1

    .line 164
    invoke-virtual {p1, v7}, Lv/progressbar/ProgressDrawable$i;->e(I)Lv/progressbar/ProgressDrawable$i;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    if-eqz p2, :cond_2

    .line 169
    .line 170
    array-length v0, p2

    .line 171
    if-lez v0, :cond_2

    .line 172
    .line 173
    invoke-virtual {p1, p2}, Lv/progressbar/ProgressDrawable$i;->c([I)Lv/progressbar/ProgressDrawable$i;

    .line 174
    .line 175
    .line 176
    goto :goto_1

    .line 177
    :cond_2
    invoke-virtual {p1, p3}, Lv/progressbar/ProgressDrawable$i;->b(I)Lv/progressbar/ProgressDrawable$i;

    .line 178
    .line 179
    .line 180
    :goto_1
    invoke-virtual {p1}, Lv/progressbar/ProgressDrawable$i;->a()Lv/progressbar/ProgressDrawable;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    invoke-virtual {p0, p1}, Landroid/widget/ProgressBar;->setIndeterminateDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 185
    .line 186
    .line 187
    return-void
.end method


# virtual methods
.method public final a()Lv/progressbar/ProgressDrawable;
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/widget/ProgressBar;->getIndeterminateDrawable()Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    instance-of v0, p0, Lv/progressbar/ProgressDrawable;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    check-cast p0, Lv/progressbar/ProgressDrawable;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    const-string p0, "The drawable is not a CircularProgressDrawable"

    .line 15
    .line 16
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    return-object p0
.end method

.method public b()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lv/VProgressBar;->a()Lv/progressbar/ProgressDrawable;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lv/progressbar/ProgressDrawable;->w()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public c()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lv/VProgressBar;->a()Lv/progressbar/ProgressDrawable;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lv/progressbar/ProgressDrawable;->start()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public d()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lv/VProgressBar;->a()Lv/progressbar/ProgressDrawable;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lv/progressbar/ProgressDrawable;->stop()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setColor(I)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/widget/ProgressBar;->getIndeterminateDrawable()Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v1, v0, Lv/progressbar/ProgressDrawable;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    check-cast v0, Lv/progressbar/ProgressDrawable;

    .line 10
    .line 11
    filled-new-array {p1}, [I

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {v0, p1}, Lv/progressbar/ProgressDrawable;->v([I)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/widget/ProgressBar;->setIndeterminateDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method
