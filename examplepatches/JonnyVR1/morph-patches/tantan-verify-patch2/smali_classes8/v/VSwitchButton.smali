.class public Lv/VSwitchButton;
.super Landroid/widget/CompoundButton;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lv/VSwitchButton$a;,
        Lv/VSwitchButton$SavedState;
    }
.end annotation


# static fields
.field public static final U:[I

.field public static final V:[I


# instance fields
.field public A:F

.field public B:I

.field public C:I

.field public D:Ljava/lang/CharSequence;

.field public E:Ljava/lang/CharSequence;

.field public F:Landroid/text/TextPaint;

.field public G:Landroid/text/Layout;

.field public H:Landroid/text/Layout;

.field public I:F

.field public J:F

.field public K:I

.field public L:I

.field public M:I

.field public N:Z

.field public O:Z

.field public P:Z

.field public Q:Lv/VSwitchButton$a;

.field public R:Landroid/widget/CompoundButton$OnCheckedChangeListener;

.field public S:I

.field public T:I

.field public final a:I

.field public b:Landroid/graphics/Paint;

.field public c:Landroid/graphics/Paint;

.field public d:Ll/tyf0;

.field public final e:Landroid/animation/ArgbEvaluator;

.field public f:F

.field public g:F

.field public h:Landroid/graphics/RectF;

.field public i:F

.field public j:I

.field public k:F

.field public l:F

.field public m:I

.field public n:I

.field public o:I

.field public p:I

.field public q:Landroid/graphics/RectF;

.field public r:Landroid/graphics/RectF;

.field public s:Landroid/graphics/RectF;

.field public t:Landroid/graphics/RectF;

.field public u:Landroid/graphics/RectF;

.field public v:Landroid/graphics/RectF;

.field public w:F

.field public x:Landroid/graphics/RectF;

.field public y:F

.field public z:F


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    const v0, 0x10100a0

    .line 2
    .line 3
    .line 4
    const v1, 0x101009e

    .line 5
    .line 6
    .line 7
    const v2, 0x10100a7

    .line 8
    .line 9
    .line 10
    filled-new-array {v0, v1, v2}, [I

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sput-object v0, Lv/VSwitchButton;->U:[I

    .line 15
    .line 16
    const v0, -0x10100a0

    .line 17
    .line 18
    .line 19
    filled-new-array {v0, v1, v2}, [I

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sput-object v0, Lv/VSwitchButton;->V:[I

    .line 24
    .line 25
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 68
    invoke-direct {p0, p1, v0}, Lv/VSwitchButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 67
    invoke-direct {p0, p1, p2, v0}, Lv/VSwitchButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/CompoundButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 5
    .line 6
    .line 7
    move-result-object p3

    .line 8
    sget v0, Ll/z8c0;->t:I

    .line 9
    .line 10
    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 11
    .line 12
    .line 13
    move-result p3

    .line 14
    iput p3, p0, Lv/VSwitchButton;->a:I

    .line 15
    .line 16
    new-instance p3, Landroid/animation/ArgbEvaluator;

    .line 17
    .line 18
    invoke-direct {p3}, Landroid/animation/ArgbEvaluator;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object p3, p0, Lv/VSwitchButton;->e:Landroid/animation/ArgbEvaluator;

    .line 22
    .line 23
    const/high16 p3, -0x40800000    # -1.0f

    .line 24
    .line 25
    iput p3, p0, Lv/VSwitchButton;->f:F

    .line 26
    .line 27
    iput p3, p0, Lv/VSwitchButton;->g:F

    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 30
    .line 31
    .line 32
    move-result-object p3

    .line 33
    sget v0, Ll/z8c0;->t:I

    .line 34
    .line 35
    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 36
    .line 37
    .line 38
    move-result p3

    .line 39
    iput p3, p0, Lv/VSwitchButton;->j:I

    .line 40
    .line 41
    const/4 p3, 0x0

    .line 42
    iput-boolean p3, p0, Lv/VSwitchButton;->N:Z

    .line 43
    .line 44
    iput-boolean p3, p0, Lv/VSwitchButton;->O:Z

    .line 45
    .line 46
    iput-boolean p3, p0, Lv/VSwitchButton;->P:Z

    .line 47
    .line 48
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 49
    .line 50
    .line 51
    move-result-object p3

    .line 52
    sget v0, Ll/z8c0;->q:I

    .line 53
    .line 54
    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 55
    .line 56
    .line 57
    move-result p3

    .line 58
    iput p3, p0, Lv/VSwitchButton;->S:I

    .line 59
    .line 60
    const/4 p3, -0x1

    .line 61
    iput p3, p0, Lv/VSwitchButton;->T:I

    .line 62
    .line 63
    invoke-virtual {p0, p1, p2}, Lv/VSwitchButton;->g(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public static synthetic a(Lv/VSwitchButton;Ll/bge;FF)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lv/VSwitchButton;->j(Ll/bge;FF)V

    return-void
.end method

.method private getProgress()F
    .locals 0

    .line 1
    iget p0, p0, Lv/VSwitchButton;->w:F

    .line 2
    .line 3
    return p0
.end method

.method private setProgress(F)V
    .locals 0

    .line 1
    iput p1, p0, Lv/VSwitchButton;->w:F

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final b(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lv/VSwitchButton;->d:Ll/tyf0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Lv/VSwitchButton;->c()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lv/VSwitchButton;->d:Ll/tyf0;

    .line 10
    .line 11
    const/high16 v1, 0x41800000    # 16.0f

    .line 12
    .line 13
    if-eqz p1, :cond_1

    .line 14
    .line 15
    iget p0, p0, Lv/VSwitchButton;->w:F

    .line 16
    .line 17
    mul-float/2addr p0, v1

    .line 18
    invoke-virtual {v0, p0}, Ll/bge;->j(F)Ll/bge;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Ll/tyf0;

    .line 23
    .line 24
    invoke-virtual {p0, v1}, Ll/tyf0;->o(F)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    iget p0, p0, Lv/VSwitchButton;->w:F

    .line 29
    .line 30
    mul-float/2addr p0, v1

    .line 31
    invoke-virtual {v0, p0}, Ll/bge;->j(F)Ll/bge;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    check-cast p0, Ll/tyf0;

    .line 36
    .line 37
    const/4 p1, 0x0

    .line 38
    invoke-virtual {p0, p1}, Ll/tyf0;->o(F)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final c()V
    .locals 1

    .line 1
    iget-object v0, p0, Lv/VSwitchButton;->d:Ll/tyf0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/bge;->g()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lv/VSwitchButton;->d:Ll/tyf0;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/bge;->c()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final d()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-interface {v0, v1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iput-boolean v1, p0, Lv/VSwitchButton;->P:Z

    .line 12
    .line 13
    return-void
.end method

.method public drawableStateChanged()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/widget/CompoundButton;->drawableStateChanged()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/widget/TextView;->getTextColors()Landroid/content/res/ColorStateList;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    sget-object v2, Lv/VSwitchButton;->U:[I

    .line 15
    .line 16
    invoke-virtual {v0, v2, v1}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    iput v2, p0, Lv/VSwitchButton;->o:I

    .line 21
    .line 22
    sget-object v2, Lv/VSwitchButton;->V:[I

    .line 23
    .line 24
    invoke-virtual {v0, v2, v1}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iput v0, p0, Lv/VSwitchButton;->p:I

    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public final e(D)I
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ljava/lang/Math;->ceil(D)D

    .line 2
    .line 3
    .line 4
    move-result-wide p0

    .line 5
    double-to-int p0, p0

    .line 6
    return p0
.end method

.method public final f(F)F
    .locals 1

    .line 1
    const/high16 p0, 0x3f800000    # 1.0f

    cmpl-float v0, p1, p0

    if-lez v0, :cond_0

    return p0

    :cond_0
    const/4 p0, 0x0

    cmpg-float v0, p1, p0

    if-gez v0, :cond_1

    return p0

    :cond_1
    return p1
.end method

.method public final g(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 12

    .line 1
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iput v0, p0, Lv/VSwitchButton;->B:I

    .line 10
    .line 11
    invoke-static {}, Landroid/view/ViewConfiguration;->getPressedStateDuration()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-static {}, Landroid/view/ViewConfiguration;->getTapTimeout()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    add-int/2addr v0, v1

    .line 20
    iput v0, p0, Lv/VSwitchButton;->C:I

    .line 21
    .line 22
    new-instance v0, Landroid/graphics/Paint;

    .line 23
    .line 24
    const/4 v1, 0x1

    .line 25
    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Lv/VSwitchButton;->b:Landroid/graphics/Paint;

    .line 29
    .line 30
    new-instance v0, Landroid/graphics/Paint;

    .line 31
    .line 32
    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Lv/VSwitchButton;->c:Landroid/graphics/Paint;

    .line 36
    .line 37
    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 38
    .line 39
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lv/VSwitchButton;->c:Landroid/graphics/Paint;

    .line 43
    .line 44
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    iget v2, v2, Landroid/util/DisplayMetrics;->density:F

    .line 53
    .line 54
    const/high16 v3, 0x40000000    # 2.0f

    .line 55
    .line 56
    mul-float/2addr v2, v3

    .line 57
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lv/VSwitchButton;->c:Landroid/graphics/Paint;

    .line 61
    .line 62
    sget-object v2, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    .line 63
    .line 64
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    iput-object v0, p0, Lv/VSwitchButton;->F:Landroid/text/TextPaint;

    .line 72
    .line 73
    new-instance v0, Landroid/graphics/RectF;

    .line 74
    .line 75
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 76
    .line 77
    .line 78
    iput-object v0, p0, Lv/VSwitchButton;->q:Landroid/graphics/RectF;

    .line 79
    .line 80
    new-instance v0, Landroid/graphics/RectF;

    .line 81
    .line 82
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 83
    .line 84
    .line 85
    iput-object v0, p0, Lv/VSwitchButton;->r:Landroid/graphics/RectF;

    .line 86
    .line 87
    new-instance v0, Landroid/graphics/RectF;

    .line 88
    .line 89
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 90
    .line 91
    .line 92
    iput-object v0, p0, Lv/VSwitchButton;->v:Landroid/graphics/RectF;

    .line 93
    .line 94
    new-instance v0, Landroid/graphics/RectF;

    .line 95
    .line 96
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 97
    .line 98
    .line 99
    iput-object v0, p0, Lv/VSwitchButton;->s:Landroid/graphics/RectF;

    .line 100
    .line 101
    new-instance v0, Landroid/graphics/RectF;

    .line 102
    .line 103
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 104
    .line 105
    .line 106
    iput-object v0, p0, Lv/VSwitchButton;->h:Landroid/graphics/RectF;

    .line 107
    .line 108
    new-instance v0, Landroid/graphics/RectF;

    .line 109
    .line 110
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 111
    .line 112
    .line 113
    iput-object v0, p0, Lv/VSwitchButton;->t:Landroid/graphics/RectF;

    .line 114
    .line 115
    new-instance v0, Landroid/graphics/RectF;

    .line 116
    .line 117
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 118
    .line 119
    .line 120
    iput-object v0, p0, Lv/VSwitchButton;->u:Landroid/graphics/RectF;

    .line 121
    .line 122
    new-instance v0, Landroid/graphics/RectF;

    .line 123
    .line 124
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 125
    .line 126
    .line 127
    iput-object v0, p0, Lv/VSwitchButton;->x:Landroid/graphics/RectF;

    .line 128
    .line 129
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    .line 138
    .line 139
    const/high16 v2, 0x40800000    # 4.0f

    .line 140
    .line 141
    mul-float/2addr v0, v2

    .line 142
    const/4 v2, 0x0

    .line 143
    if-nez p2, :cond_0

    .line 144
    .line 145
    move-object v3, v2

    .line 146
    goto :goto_0

    .line 147
    :cond_0
    sget-object v3, Ll/hhc0;->H4:[I

    .line 148
    .line 149
    invoke-virtual {p1, p2, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 150
    .line 151
    .line 152
    move-result-object v3

    .line 153
    :goto_0
    const/4 v4, 0x0

    .line 154
    const/4 v5, 0x0

    .line 155
    if-eqz v3, :cond_1

    .line 156
    .line 157
    sget v6, Ll/hhc0;->R4:I

    .line 158
    .line 159
    invoke-virtual {v3, v6, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 160
    .line 161
    .line 162
    move-result v0

    .line 163
    sget v6, Ll/hhc0;->T4:I

    .line 164
    .line 165
    invoke-virtual {v3, v6, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 166
    .line 167
    .line 168
    move-result v6

    .line 169
    sget v7, Ll/hhc0;->U4:I

    .line 170
    .line 171
    invoke-virtual {v3, v7, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 172
    .line 173
    .line 174
    move-result v7

    .line 175
    sget v8, Ll/hhc0;->V4:I

    .line 176
    .line 177
    invoke-virtual {v3, v8, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 178
    .line 179
    .line 180
    move-result v8

    .line 181
    sget v9, Ll/hhc0;->S4:I

    .line 182
    .line 183
    invoke-virtual {v3, v9, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 184
    .line 185
    .line 186
    move-result v0

    .line 187
    sget v9, Ll/hhc0;->Y4:I

    .line 188
    .line 189
    invoke-virtual {v3, v9, v5}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 190
    .line 191
    .line 192
    move-result v9

    .line 193
    iput v9, p0, Lv/VSwitchButton;->k:F

    .line 194
    .line 195
    sget v9, Ll/hhc0;->Q4:I

    .line 196
    .line 197
    invoke-virtual {v3, v9, v5}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 198
    .line 199
    .line 200
    move-result v9

    .line 201
    iput v9, p0, Lv/VSwitchButton;->l:F

    .line 202
    .line 203
    sget v9, Ll/hhc0;->W4:I

    .line 204
    .line 205
    const/high16 v10, -0x40800000    # -1.0f

    .line 206
    .line 207
    invoke-virtual {v3, v9, v10}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 208
    .line 209
    .line 210
    move-result v9

    .line 211
    iput v9, p0, Lv/VSwitchButton;->f:F

    .line 212
    .line 213
    sget v9, Ll/hhc0;->J4:I

    .line 214
    .line 215
    invoke-virtual {v3, v9, v10}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 216
    .line 217
    .line 218
    move-result v9

    .line 219
    iput v9, p0, Lv/VSwitchButton;->g:F

    .line 220
    .line 221
    sget v9, Ll/hhc0;->X4:I

    .line 222
    .line 223
    const v10, 0x3fdd0e56    # 1.727f

    .line 224
    .line 225
    .line 226
    invoke-virtual {v3, v9, v10}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 227
    .line 228
    .line 229
    move-result v9

    .line 230
    iput v9, p0, Lv/VSwitchButton;->i:F

    .line 231
    .line 232
    sget v9, Ll/hhc0;->I4:I

    .line 233
    .line 234
    iget v10, p0, Lv/VSwitchButton;->a:I

    .line 235
    .line 236
    invoke-virtual {v3, v9, v10}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 237
    .line 238
    .line 239
    move-result v9

    .line 240
    iput v9, p0, Lv/VSwitchButton;->j:I

    .line 241
    .line 242
    sget v9, Ll/hhc0;->K4:I

    .line 243
    .line 244
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 245
    .line 246
    .line 247
    move-result-object v10

    .line 248
    sget v11, Ll/z8c0;->q:I

    .line 249
    .line 250
    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getColor(I)I

    .line 251
    .line 252
    .line 253
    move-result v10

    .line 254
    invoke-virtual {v3, v9, v10}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 255
    .line 256
    .line 257
    move-result v9

    .line 258
    iput v9, p0, Lv/VSwitchButton;->S:I

    .line 259
    .line 260
    sget v9, Ll/hhc0;->O4:I

    .line 261
    .line 262
    invoke-virtual {v3, v9}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 263
    .line 264
    .line 265
    move-result-object v9

    .line 266
    iput-object v9, p0, Lv/VSwitchButton;->D:Ljava/lang/CharSequence;

    .line 267
    .line 268
    sget v9, Ll/hhc0;->N4:I

    .line 269
    .line 270
    invoke-virtual {v3, v9}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 271
    .line 272
    .line 273
    move-result-object v9

    .line 274
    iput-object v9, p0, Lv/VSwitchButton;->E:Ljava/lang/CharSequence;

    .line 275
    .line 276
    sget v9, Ll/hhc0;->P4:I

    .line 277
    .line 278
    invoke-virtual {v3, v9, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 279
    .line 280
    .line 281
    move-result v9

    .line 282
    iput v9, p0, Lv/VSwitchButton;->K:I

    .line 283
    .line 284
    sget v9, Ll/hhc0;->M4:I

    .line 285
    .line 286
    invoke-virtual {v3, v9, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 287
    .line 288
    .line 289
    move-result v9

    .line 290
    iput v9, p0, Lv/VSwitchButton;->L:I

    .line 291
    .line 292
    sget v9, Ll/hhc0;->L4:I

    .line 293
    .line 294
    invoke-virtual {v3, v9, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 295
    .line 296
    .line 297
    move-result v9

    .line 298
    iput v9, p0, Lv/VSwitchButton;->M:I

    .line 299
    .line 300
    invoke-virtual {v3}, Landroid/content/res/TypedArray;->recycle()V

    .line 301
    .line 302
    .line 303
    goto :goto_1

    .line 304
    :cond_1
    move v0, v5

    .line 305
    move v6, v0

    .line 306
    move v7, v6

    .line 307
    move v8, v7

    .line 308
    :goto_1
    if-nez p2, :cond_2

    .line 309
    .line 310
    goto :goto_2

    .line 311
    :cond_2
    const v2, 0x10100da

    .line 312
    .line 313
    .line 314
    const v3, 0x10100e5

    .line 315
    .line 316
    .line 317
    filled-new-array {v2, v3}, [I

    .line 318
    .line 319
    .line 320
    move-result-object v2

    .line 321
    invoke-virtual {p1, p2, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 322
    .line 323
    .line 324
    move-result-object v2

    .line 325
    :goto_2
    if-eqz v2, :cond_3

    .line 326
    .line 327
    invoke-virtual {v2, v4, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 328
    .line 329
    .line 330
    move-result p1

    .line 331
    invoke-virtual {v2, v1, p1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 332
    .line 333
    .line 334
    move-result p2

    .line 335
    invoke-virtual {p0, p1}, Landroid/view/View;->setFocusable(Z)V

    .line 336
    .line 337
    .line 338
    invoke-virtual {p0, p2}, Landroid/view/View;->setClickable(Z)V

    .line 339
    .line 340
    .line 341
    invoke-virtual {v2}, Landroid/content/res/TypedArray;->recycle()V

    .line 342
    .line 343
    .line 344
    goto :goto_3

    .line 345
    :cond_3
    invoke-virtual {p0, v1}, Landroid/view/View;->setFocusable(Z)V

    .line 346
    .line 347
    .line 348
    invoke-virtual {p0, v1}, Landroid/view/View;->setClickable(Z)V

    .line 349
    .line 350
    .line 351
    :goto_3
    iget-object p1, p0, Lv/VSwitchButton;->h:Landroid/graphics/RectF;

    .line 352
    .line 353
    invoke-virtual {p1, v6, v8, v7, v0}, Landroid/graphics/RectF;->set(FFFF)V

    .line 354
    .line 355
    .line 356
    iget-object p1, p0, Lv/VSwitchButton;->h:Landroid/graphics/RectF;

    .line 357
    .line 358
    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    .line 359
    .line 360
    .line 361
    move-result p1

    .line 362
    cmpl-float p1, p1, v5

    .line 363
    .line 364
    iget p2, p0, Lv/VSwitchButton;->i:F

    .line 365
    .line 366
    const/high16 v0, 0x3f800000    # 1.0f

    .line 367
    .line 368
    if-ltz p1, :cond_4

    .line 369
    .line 370
    invoke-static {p2, v0}, Ljava/lang/Math;->max(FF)F

    .line 371
    .line 372
    .line 373
    move-result p2

    .line 374
    :cond_4
    iput p2, p0, Lv/VSwitchButton;->i:F

    .line 375
    .line 376
    invoke-virtual {p0}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 377
    .line 378
    .line 379
    move-result p1

    .line 380
    if-eqz p1, :cond_5

    .line 381
    .line 382
    invoke-direct {p0, v0}, Lv/VSwitchButton;->setProgress(F)V

    .line 383
    .line 384
    .line 385
    :cond_5
    invoke-virtual {p0}, Lv/VSwitchButton;->h()V

    .line 386
    .line 387
    .line 388
    return-void
.end method

.method public getBackRadius()F
    .locals 0

    .line 1
    iget p0, p0, Lv/VSwitchButton;->g:F

    .line 2
    .line 3
    return p0
.end method

.method public getBackSizeF()Landroid/graphics/PointF;
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/PointF;

    .line 2
    .line 3
    iget-object v1, p0, Lv/VSwitchButton;->r:Landroid/graphics/RectF;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iget-object p0, p0, Lv/VSwitchButton;->r:Landroid/graphics/RectF;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/graphics/RectF;->height()F

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    invoke-direct {v0, v1, p0}, Landroid/graphics/PointF;-><init>(FF)V

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method public getTextOff()Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VSwitchButton;->E:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTextOn()Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VSwitchButton;->D:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-object p0
.end method

.method public getThumbHeight()F
    .locals 0

    .line 1
    iget p0, p0, Lv/VSwitchButton;->l:F

    .line 2
    .line 3
    return p0
.end method

.method public getThumbMargin()Landroid/graphics/RectF;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VSwitchButton;->h:Landroid/graphics/RectF;

    .line 2
    .line 3
    return-object p0
.end method

.method public getThumbRadius()F
    .locals 0

    .line 1
    iget p0, p0, Lv/VSwitchButton;->f:F

    .line 2
    .line 3
    return p0
.end method

.method public getThumbRangeRatio()F
    .locals 0

    .line 1
    iget p0, p0, Lv/VSwitchButton;->i:F

    .line 2
    .line 3
    return p0
.end method

.method public getThumbWidth()F
    .locals 0

    .line 1
    iget p0, p0, Lv/VSwitchButton;->k:F

    .line 2
    .line 3
    return p0
.end method

.method public final h()V
    .locals 6

    .line 1
    iget-object v0, p0, Lv/VSwitchButton;->d:Ll/tyf0;

    .line 2
    .line 3
    if-nez v0, :cond_2

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    new-instance v1, Ll/zsi;

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    const/high16 v3, 0x41800000    # 16.0f

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    move v4, v3

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    move v4, v2

    .line 19
    :goto_0
    invoke-direct {v1, v4}, Ll/zsi;-><init>(F)V

    .line 20
    .line 21
    .line 22
    new-instance v4, Ll/ezf0;

    .line 23
    .line 24
    invoke-direct {v4}, Ll/ezf0;-><init>()V

    .line 25
    .line 26
    .line 27
    const v5, 0x3f1c28f6    # 0.61f

    .line 28
    .line 29
    .line 30
    invoke-virtual {v4, v5}, Ll/ezf0;->d(F)Ll/ezf0;

    .line 31
    .line 32
    .line 33
    move-result-object v4

    .line 34
    const/high16 v5, 0x44160000    # 600.0f

    .line 35
    .line 36
    invoke-virtual {v4, v5}, Ll/ezf0;->f(F)Ll/ezf0;

    .line 37
    .line 38
    .line 39
    move-result-object v4

    .line 40
    new-instance v5, Ll/tyf0;

    .line 41
    .line 42
    invoke-direct {v5, v1}, Ll/tyf0;-><init>(Ll/zsi;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v5, v4}, Ll/tyf0;->r(Ll/ezf0;)Ll/tyf0;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    if-eqz v0, :cond_1

    .line 50
    .line 51
    move v2, v3

    .line 52
    :cond_1
    invoke-virtual {v1, v2}, Ll/bge;->j(F)Ll/bge;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    check-cast v0, Ll/tyf0;

    .line 57
    .line 58
    iput-object v0, p0, Lv/VSwitchButton;->d:Ll/tyf0;

    .line 59
    .line 60
    new-instance v1, Ll/tzk0;

    .line 61
    .line 62
    invoke-direct {v1, p0}, Ll/tzk0;-><init>(Lv/VSwitchButton;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ll/bge;->b(Ll/bge$r;)Ll/bge;

    .line 66
    .line 67
    .line 68
    :cond_2
    return-void
.end method

.method public final i()Z
    .locals 1

    .line 1
    invoke-direct {p0}, Lv/VSwitchButton;->getProgress()F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/high16 v0, 0x3f000000    # 0.5f

    .line 6
    .line 7
    cmpl-float p0, p0, v0

    .line 8
    .line 9
    if-lez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public final synthetic j(Ll/bge;FF)V
    .locals 0

    .line 1
    const/high16 p1, 0x41800000    # 16.0f

    .line 2
    .line 3
    div-float/2addr p2, p1

    .line 4
    invoke-direct {p0, p2}, Lv/VSwitchButton;->setProgress(F)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final k(Ljava/lang/CharSequence;)Landroid/text/Layout;
    .locals 8

    .line 1
    new-instance v0, Landroid/text/StaticLayout;

    .line 2
    .line 3
    iget-object v2, p0, Lv/VSwitchButton;->F:Landroid/text/TextPaint;

    .line 4
    .line 5
    invoke-static {p1, v2}, Landroid/text/Layout;->getDesiredWidth(Ljava/lang/CharSequence;Landroid/text/TextPaint;)F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    float-to-double v3, p0

    .line 10
    invoke-static {v3, v4}, Ljava/lang/Math;->ceil(D)D

    .line 11
    .line 12
    .line 13
    move-result-wide v3

    .line 14
    double-to-int v3, v3

    .line 15
    sget-object v4, Landroid/text/Layout$Alignment;->ALIGN_CENTER:Landroid/text/Layout$Alignment;

    .line 16
    .line 17
    const/4 v6, 0x0

    .line 18
    const/4 v7, 0x0

    .line 19
    const/high16 v5, 0x3f800000    # 1.0f

    .line 20
    .line 21
    move-object v1, p1

    .line 22
    invoke-direct/range {v0 .. v7}, Landroid/text/StaticLayout;-><init>(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZ)V

    .line 23
    .line 24
    .line 25
    return-object v0
.end method

.method public final l(I)I
    .locals 6

    .line 1
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    iget v1, p0, Lv/VSwitchButton;->l:F

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    const/4 v3, 0x0

    .line 13
    const/high16 v4, 0x40000000    # 2.0f

    .line 14
    .line 15
    if-ne p1, v4, :cond_4

    .line 16
    .line 17
    cmpl-float p1, v1, v3

    .line 18
    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    iget-object p1, p0, Lv/VSwitchButton;->h:Landroid/graphics/RectF;

    .line 22
    .line 23
    iget v4, p1, Landroid/graphics/RectF;->top:F

    .line 24
    .line 25
    add-float/2addr v1, v4

    .line 26
    iget p1, p1, Landroid/graphics/RectF;->bottom:F

    .line 27
    .line 28
    add-float/2addr v1, p1

    .line 29
    float-to-double v4, v1

    .line 30
    invoke-virtual {p0, v4, v5}, Lv/VSwitchButton;->e(D)I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    iput p1, p0, Lv/VSwitchButton;->n:I

    .line 35
    .line 36
    int-to-float p1, p1

    .line 37
    iget v1, p0, Lv/VSwitchButton;->J:F

    .line 38
    .line 39
    invoke-static {p1, v1}, Ljava/lang/Math;->max(FF)F

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    float-to-double v4, p1

    .line 44
    invoke-virtual {p0, v4, v5}, Lv/VSwitchButton;->e(D)I

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    iput p1, p0, Lv/VSwitchButton;->n:I

    .line 49
    .line 50
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    add-int/2addr p1, v1

    .line 55
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    add-int/2addr p1, v1

    .line 60
    int-to-float p1, p1

    .line 61
    iget-object v1, p0, Lv/VSwitchButton;->h:Landroid/graphics/RectF;

    .line 62
    .line 63
    iget v1, v1, Landroid/graphics/RectF;->top:F

    .line 64
    .line 65
    invoke-static {v3, v1}, Ljava/lang/Math;->min(FF)F

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    sub-float/2addr p1, v1

    .line 70
    iget-object v1, p0, Lv/VSwitchButton;->h:Landroid/graphics/RectF;

    .line 71
    .line 72
    iget v1, v1, Landroid/graphics/RectF;->bottom:F

    .line 73
    .line 74
    invoke-static {v3, v1}, Ljava/lang/Math;->min(FF)F

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    sub-float/2addr p1, v1

    .line 79
    int-to-float v1, v0

    .line 80
    cmpl-float p1, p1, v1

    .line 81
    .line 82
    if-lez p1, :cond_0

    .line 83
    .line 84
    iput v3, p0, Lv/VSwitchButton;->l:F

    .line 85
    .line 86
    :cond_0
    iget p1, p0, Lv/VSwitchButton;->l:F

    .line 87
    .line 88
    cmpl-float p1, p1, v3

    .line 89
    .line 90
    if-nez p1, :cond_2

    .line 91
    .line 92
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 93
    .line 94
    .line 95
    move-result p1

    .line 96
    sub-int p1, v0, p1

    .line 97
    .line 98
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    sub-int/2addr p1, v1

    .line 103
    int-to-float p1, p1

    .line 104
    iget-object v1, p0, Lv/VSwitchButton;->h:Landroid/graphics/RectF;

    .line 105
    .line 106
    iget v1, v1, Landroid/graphics/RectF;->top:F

    .line 107
    .line 108
    invoke-static {v3, v1}, Ljava/lang/Math;->min(FF)F

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    add-float/2addr p1, v1

    .line 113
    iget-object v1, p0, Lv/VSwitchButton;->h:Landroid/graphics/RectF;

    .line 114
    .line 115
    iget v1, v1, Landroid/graphics/RectF;->bottom:F

    .line 116
    .line 117
    invoke-static {v3, v1}, Ljava/lang/Math;->min(FF)F

    .line 118
    .line 119
    .line 120
    move-result v1

    .line 121
    add-float/2addr p1, v1

    .line 122
    float-to-double v4, p1

    .line 123
    invoke-virtual {p0, v4, v5}, Lv/VSwitchButton;->e(D)I

    .line 124
    .line 125
    .line 126
    move-result p1

    .line 127
    iput p1, p0, Lv/VSwitchButton;->n:I

    .line 128
    .line 129
    if-gez p1, :cond_1

    .line 130
    .line 131
    iput v2, p0, Lv/VSwitchButton;->n:I

    .line 132
    .line 133
    iput v3, p0, Lv/VSwitchButton;->l:F

    .line 134
    .line 135
    return v0

    .line 136
    :cond_1
    int-to-float p1, p1

    .line 137
    iget-object v1, p0, Lv/VSwitchButton;->h:Landroid/graphics/RectF;

    .line 138
    .line 139
    iget v4, v1, Landroid/graphics/RectF;->top:F

    .line 140
    .line 141
    sub-float/2addr p1, v4

    .line 142
    iget v1, v1, Landroid/graphics/RectF;->bottom:F

    .line 143
    .line 144
    sub-float/2addr p1, v1

    .line 145
    float-to-double v4, p1

    .line 146
    invoke-virtual {p0, v4, v5}, Lv/VSwitchButton;->e(D)I

    .line 147
    .line 148
    .line 149
    move-result p1

    .line 150
    int-to-float p1, p1

    .line 151
    iput p1, p0, Lv/VSwitchButton;->l:F

    .line 152
    .line 153
    :cond_2
    iget p1, p0, Lv/VSwitchButton;->l:F

    .line 154
    .line 155
    cmpg-float p1, p1, v3

    .line 156
    .line 157
    if-gez p1, :cond_3

    .line 158
    .line 159
    iput v2, p0, Lv/VSwitchButton;->n:I

    .line 160
    .line 161
    iput v3, p0, Lv/VSwitchButton;->l:F

    .line 162
    .line 163
    :cond_3
    return v0

    .line 164
    :cond_4
    cmpl-float p1, v1, v3

    .line 165
    .line 166
    if-nez p1, :cond_5

    .line 167
    .line 168
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 169
    .line 170
    .line 171
    move-result-object p1

    .line 172
    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    iget p1, p1, Landroid/util/DisplayMetrics;->density:F

    .line 177
    .line 178
    const/high16 v1, 0x41b00000    # 22.0f

    .line 179
    .line 180
    mul-float/2addr p1, v1

    .line 181
    float-to-double v4, p1

    .line 182
    invoke-virtual {p0, v4, v5}, Lv/VSwitchButton;->e(D)I

    .line 183
    .line 184
    .line 185
    move-result p1

    .line 186
    int-to-float p1, p1

    .line 187
    iput p1, p0, Lv/VSwitchButton;->l:F

    .line 188
    .line 189
    :cond_5
    iget p1, p0, Lv/VSwitchButton;->l:F

    .line 190
    .line 191
    iget-object v1, p0, Lv/VSwitchButton;->h:Landroid/graphics/RectF;

    .line 192
    .line 193
    iget v4, v1, Landroid/graphics/RectF;->top:F

    .line 194
    .line 195
    add-float/2addr p1, v4

    .line 196
    iget v1, v1, Landroid/graphics/RectF;->bottom:F

    .line 197
    .line 198
    add-float/2addr p1, v1

    .line 199
    float-to-double v4, p1

    .line 200
    invoke-virtual {p0, v4, v5}, Lv/VSwitchButton;->e(D)I

    .line 201
    .line 202
    .line 203
    move-result p1

    .line 204
    iput p1, p0, Lv/VSwitchButton;->n:I

    .line 205
    .line 206
    if-gez p1, :cond_6

    .line 207
    .line 208
    iput v2, p0, Lv/VSwitchButton;->n:I

    .line 209
    .line 210
    iput v3, p0, Lv/VSwitchButton;->l:F

    .line 211
    .line 212
    return v0

    .line 213
    :cond_6
    iget v0, p0, Lv/VSwitchButton;->J:F

    .line 214
    .line 215
    int-to-float p1, p1

    .line 216
    sub-float/2addr v0, p1

    .line 217
    float-to-double v0, v0

    .line 218
    invoke-virtual {p0, v0, v1}, Lv/VSwitchButton;->e(D)I

    .line 219
    .line 220
    .line 221
    move-result p1

    .line 222
    if-lez p1, :cond_7

    .line 223
    .line 224
    iget v0, p0, Lv/VSwitchButton;->n:I

    .line 225
    .line 226
    add-int/2addr v0, p1

    .line 227
    iput v0, p0, Lv/VSwitchButton;->n:I

    .line 228
    .line 229
    iget v0, p0, Lv/VSwitchButton;->l:F

    .line 230
    .line 231
    int-to-float p1, p1

    .line 232
    add-float/2addr v0, p1

    .line 233
    iput v0, p0, Lv/VSwitchButton;->l:F

    .line 234
    .line 235
    :cond_7
    iget p1, p0, Lv/VSwitchButton;->l:F

    .line 236
    .line 237
    iget v0, p0, Lv/VSwitchButton;->n:I

    .line 238
    .line 239
    int-to-float v0, v0

    .line 240
    invoke-static {p1, v0}, Ljava/lang/Math;->max(FF)F

    .line 241
    .line 242
    .line 243
    move-result p1

    .line 244
    float-to-int p1, p1

    .line 245
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 246
    .line 247
    .line 248
    move-result v0

    .line 249
    add-int/2addr v0, p1

    .line 250
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 251
    .line 252
    .line 253
    move-result v1

    .line 254
    add-int/2addr v0, v1

    .line 255
    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    .line 256
    .line 257
    .line 258
    move-result p1

    .line 259
    invoke-virtual {p0}, Landroid/view/View;->getSuggestedMinimumHeight()I

    .line 260
    .line 261
    .line 262
    move-result p0

    .line 263
    invoke-static {p1, p0}, Ljava/lang/Math;->max(II)I

    .line 264
    .line 265
    .line 266
    move-result p0

    .line 267
    return p0
.end method

.method public final m(I)I
    .locals 9

    .line 1
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    iget v1, p0, Lv/VSwitchButton;->I:F

    .line 10
    .line 11
    float-to-double v1, v1

    .line 12
    invoke-virtual {p0, v1, v2}, Lv/VSwitchButton;->e(D)I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    iget v2, p0, Lv/VSwitchButton;->i:F

    .line 17
    .line 18
    const/4 v3, 0x0

    .line 19
    cmpl-float v2, v2, v3

    .line 20
    .line 21
    const v4, 0x3fdd0e56    # 1.727f

    .line 22
    .line 23
    .line 24
    if-nez v2, :cond_0

    .line 25
    .line 26
    iput v4, p0, Lv/VSwitchButton;->i:F

    .line 27
    .line 28
    :cond_0
    const/high16 v2, 0x40000000    # 2.0f

    .line 29
    .line 30
    const/4 v5, 0x0

    .line 31
    if-ne p1, v2, :cond_7

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    sub-int p1, v0, p1

    .line 38
    .line 39
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    sub-int/2addr p1, v2

    .line 44
    iget v2, p0, Lv/VSwitchButton;->k:F

    .line 45
    .line 46
    cmpl-float v4, v2, v3

    .line 47
    .line 48
    if-eqz v4, :cond_2

    .line 49
    .line 50
    iget v4, p0, Lv/VSwitchButton;->i:F

    .line 51
    .line 52
    mul-float/2addr v2, v4

    .line 53
    float-to-double v6, v2

    .line 54
    invoke-virtual {p0, v6, v7}, Lv/VSwitchButton;->e(D)I

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    iget v4, p0, Lv/VSwitchButton;->L:I

    .line 59
    .line 60
    add-int/2addr v4, v1

    .line 61
    int-to-float v4, v4

    .line 62
    int-to-float v2, v2

    .line 63
    iget v6, p0, Lv/VSwitchButton;->k:F

    .line 64
    .line 65
    sub-float v6, v2, v6

    .line 66
    .line 67
    iget-object v7, p0, Lv/VSwitchButton;->h:Landroid/graphics/RectF;

    .line 68
    .line 69
    iget v8, v7, Landroid/graphics/RectF;->left:F

    .line 70
    .line 71
    iget v7, v7, Landroid/graphics/RectF;->right:F

    .line 72
    .line 73
    invoke-static {v8, v7}, Ljava/lang/Math;->max(FF)F

    .line 74
    .line 75
    .line 76
    move-result v7

    .line 77
    float-to-double v7, v7

    .line 78
    invoke-virtual {p0, v7, v8}, Lv/VSwitchButton;->e(D)I

    .line 79
    .line 80
    .line 81
    move-result v7

    .line 82
    int-to-float v7, v7

    .line 83
    add-float/2addr v6, v7

    .line 84
    sub-float/2addr v4, v6

    .line 85
    float-to-int v4, v4

    .line 86
    iget-object v6, p0, Lv/VSwitchButton;->h:Landroid/graphics/RectF;

    .line 87
    .line 88
    iget v7, v6, Landroid/graphics/RectF;->left:F

    .line 89
    .line 90
    add-float/2addr v7, v2

    .line 91
    iget v6, v6, Landroid/graphics/RectF;->right:F

    .line 92
    .line 93
    add-float/2addr v7, v6

    .line 94
    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    .line 95
    .line 96
    .line 97
    move-result v6

    .line 98
    int-to-float v6, v6

    .line 99
    add-float/2addr v7, v6

    .line 100
    float-to-double v6, v7

    .line 101
    invoke-virtual {p0, v6, v7}, Lv/VSwitchButton;->e(D)I

    .line 102
    .line 103
    .line 104
    move-result v6

    .line 105
    iput v6, p0, Lv/VSwitchButton;->m:I

    .line 106
    .line 107
    if-gez v6, :cond_1

    .line 108
    .line 109
    iput v3, p0, Lv/VSwitchButton;->k:F

    .line 110
    .line 111
    :cond_1
    iget-object v6, p0, Lv/VSwitchButton;->h:Landroid/graphics/RectF;

    .line 112
    .line 113
    iget v6, v6, Landroid/graphics/RectF;->left:F

    .line 114
    .line 115
    invoke-static {v6, v3}, Ljava/lang/Math;->max(FF)F

    .line 116
    .line 117
    .line 118
    move-result v6

    .line 119
    add-float/2addr v2, v6

    .line 120
    iget-object v6, p0, Lv/VSwitchButton;->h:Landroid/graphics/RectF;

    .line 121
    .line 122
    iget v6, v6, Landroid/graphics/RectF;->right:F

    .line 123
    .line 124
    invoke-static {v6, v3}, Ljava/lang/Math;->max(FF)F

    .line 125
    .line 126
    .line 127
    move-result v6

    .line 128
    add-float/2addr v2, v6

    .line 129
    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    .line 130
    .line 131
    .line 132
    move-result v4

    .line 133
    int-to-float v4, v4

    .line 134
    add-float/2addr v2, v4

    .line 135
    int-to-float p1, p1

    .line 136
    cmpl-float p1, v2, p1

    .line 137
    .line 138
    if-lez p1, :cond_2

    .line 139
    .line 140
    iput v3, p0, Lv/VSwitchButton;->k:F

    .line 141
    .line 142
    :cond_2
    iget p1, p0, Lv/VSwitchButton;->k:F

    .line 143
    .line 144
    cmpl-float p1, p1, v3

    .line 145
    .line 146
    if-nez p1, :cond_6

    .line 147
    .line 148
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 149
    .line 150
    .line 151
    move-result p1

    .line 152
    sub-int p1, v0, p1

    .line 153
    .line 154
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 155
    .line 156
    .line 157
    move-result v2

    .line 158
    sub-int/2addr p1, v2

    .line 159
    int-to-float p1, p1

    .line 160
    iget-object v2, p0, Lv/VSwitchButton;->h:Landroid/graphics/RectF;

    .line 161
    .line 162
    iget v2, v2, Landroid/graphics/RectF;->left:F

    .line 163
    .line 164
    invoke-static {v2, v3}, Ljava/lang/Math;->max(FF)F

    .line 165
    .line 166
    .line 167
    move-result v2

    .line 168
    sub-float/2addr p1, v2

    .line 169
    iget-object v2, p0, Lv/VSwitchButton;->h:Landroid/graphics/RectF;

    .line 170
    .line 171
    iget v2, v2, Landroid/graphics/RectF;->right:F

    .line 172
    .line 173
    invoke-static {v2, v3}, Ljava/lang/Math;->max(FF)F

    .line 174
    .line 175
    .line 176
    move-result v2

    .line 177
    sub-float/2addr p1, v2

    .line 178
    float-to-double v6, p1

    .line 179
    invoke-virtual {p0, v6, v7}, Lv/VSwitchButton;->e(D)I

    .line 180
    .line 181
    .line 182
    move-result p1

    .line 183
    if-gez p1, :cond_3

    .line 184
    .line 185
    iput v3, p0, Lv/VSwitchButton;->k:F

    .line 186
    .line 187
    iput v5, p0, Lv/VSwitchButton;->m:I

    .line 188
    .line 189
    return v0

    .line 190
    :cond_3
    int-to-float p1, p1

    .line 191
    iget v2, p0, Lv/VSwitchButton;->i:F

    .line 192
    .line 193
    div-float v2, p1, v2

    .line 194
    .line 195
    float-to-double v6, v2

    .line 196
    invoke-virtual {p0, v6, v7}, Lv/VSwitchButton;->e(D)I

    .line 197
    .line 198
    .line 199
    move-result v2

    .line 200
    int-to-float v2, v2

    .line 201
    iput v2, p0, Lv/VSwitchButton;->k:F

    .line 202
    .line 203
    iget-object v2, p0, Lv/VSwitchButton;->h:Landroid/graphics/RectF;

    .line 204
    .line 205
    iget v4, v2, Landroid/graphics/RectF;->left:F

    .line 206
    .line 207
    add-float/2addr v4, p1

    .line 208
    iget v2, v2, Landroid/graphics/RectF;->right:F

    .line 209
    .line 210
    add-float/2addr v4, v2

    .line 211
    float-to-double v6, v4

    .line 212
    invoke-virtual {p0, v6, v7}, Lv/VSwitchButton;->e(D)I

    .line 213
    .line 214
    .line 215
    move-result v2

    .line 216
    iput v2, p0, Lv/VSwitchButton;->m:I

    .line 217
    .line 218
    if-gez v2, :cond_4

    .line 219
    .line 220
    iput v3, p0, Lv/VSwitchButton;->k:F

    .line 221
    .line 222
    iput v5, p0, Lv/VSwitchButton;->m:I

    .line 223
    .line 224
    return v0

    .line 225
    :cond_4
    iget v2, p0, Lv/VSwitchButton;->L:I

    .line 226
    .line 227
    add-int/2addr v1, v2

    .line 228
    int-to-float v1, v1

    .line 229
    iget v2, p0, Lv/VSwitchButton;->k:F

    .line 230
    .line 231
    sub-float/2addr p1, v2

    .line 232
    iget-object v2, p0, Lv/VSwitchButton;->h:Landroid/graphics/RectF;

    .line 233
    .line 234
    iget v4, v2, Landroid/graphics/RectF;->left:F

    .line 235
    .line 236
    iget v2, v2, Landroid/graphics/RectF;->right:F

    .line 237
    .line 238
    invoke-static {v4, v2}, Ljava/lang/Math;->max(FF)F

    .line 239
    .line 240
    .line 241
    move-result v2

    .line 242
    float-to-double v6, v2

    .line 243
    invoke-virtual {p0, v6, v7}, Lv/VSwitchButton;->e(D)I

    .line 244
    .line 245
    .line 246
    move-result v2

    .line 247
    int-to-float v2, v2

    .line 248
    add-float/2addr p1, v2

    .line 249
    sub-float/2addr v1, p1

    .line 250
    float-to-int p1, v1

    .line 251
    if-lez p1, :cond_5

    .line 252
    .line 253
    iget v1, p0, Lv/VSwitchButton;->k:F

    .line 254
    .line 255
    int-to-float p1, p1

    .line 256
    sub-float/2addr v1, p1

    .line 257
    iput v1, p0, Lv/VSwitchButton;->k:F

    .line 258
    .line 259
    :cond_5
    iget p1, p0, Lv/VSwitchButton;->k:F

    .line 260
    .line 261
    cmpg-float p1, p1, v3

    .line 262
    .line 263
    if-gez p1, :cond_6

    .line 264
    .line 265
    iput v3, p0, Lv/VSwitchButton;->k:F

    .line 266
    .line 267
    iput v5, p0, Lv/VSwitchButton;->m:I

    .line 268
    .line 269
    :cond_6
    return v0

    .line 270
    :cond_7
    iget p1, p0, Lv/VSwitchButton;->k:F

    .line 271
    .line 272
    cmpl-float p1, p1, v3

    .line 273
    .line 274
    if-nez p1, :cond_8

    .line 275
    .line 276
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 277
    .line 278
    .line 279
    move-result-object p1

    .line 280
    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 281
    .line 282
    .line 283
    move-result-object p1

    .line 284
    iget p1, p1, Landroid/util/DisplayMetrics;->density:F

    .line 285
    .line 286
    const/high16 v2, 0x41b00000    # 22.0f

    .line 287
    .line 288
    mul-float/2addr p1, v2

    .line 289
    float-to-double v6, p1

    .line 290
    invoke-virtual {p0, v6, v7}, Lv/VSwitchButton;->e(D)I

    .line 291
    .line 292
    .line 293
    move-result p1

    .line 294
    int-to-float p1, p1

    .line 295
    iput p1, p0, Lv/VSwitchButton;->k:F

    .line 296
    .line 297
    :cond_8
    iget p1, p0, Lv/VSwitchButton;->i:F

    .line 298
    .line 299
    cmpl-float p1, p1, v3

    .line 300
    .line 301
    if-nez p1, :cond_9

    .line 302
    .line 303
    iput v4, p0, Lv/VSwitchButton;->i:F

    .line 304
    .line 305
    :cond_9
    iget p1, p0, Lv/VSwitchButton;->k:F

    .line 306
    .line 307
    iget v2, p0, Lv/VSwitchButton;->i:F

    .line 308
    .line 309
    mul-float/2addr p1, v2

    .line 310
    float-to-double v6, p1

    .line 311
    invoke-virtual {p0, v6, v7}, Lv/VSwitchButton;->e(D)I

    .line 312
    .line 313
    .line 314
    move-result p1

    .line 315
    iget v2, p0, Lv/VSwitchButton;->L:I

    .line 316
    .line 317
    add-int/2addr v1, v2

    .line 318
    int-to-float v1, v1

    .line 319
    int-to-float p1, p1

    .line 320
    iget v2, p0, Lv/VSwitchButton;->k:F

    .line 321
    .line 322
    sub-float v2, p1, v2

    .line 323
    .line 324
    iget-object v4, p0, Lv/VSwitchButton;->h:Landroid/graphics/RectF;

    .line 325
    .line 326
    iget v6, v4, Landroid/graphics/RectF;->left:F

    .line 327
    .line 328
    iget v4, v4, Landroid/graphics/RectF;->right:F

    .line 329
    .line 330
    invoke-static {v6, v4}, Ljava/lang/Math;->max(FF)F

    .line 331
    .line 332
    .line 333
    move-result v4

    .line 334
    add-float/2addr v2, v4

    .line 335
    iget v4, p0, Lv/VSwitchButton;->K:I

    .line 336
    .line 337
    int-to-float v4, v4

    .line 338
    add-float/2addr v2, v4

    .line 339
    sub-float/2addr v1, v2

    .line 340
    float-to-double v1, v1

    .line 341
    invoke-virtual {p0, v1, v2}, Lv/VSwitchButton;->e(D)I

    .line 342
    .line 343
    .line 344
    move-result v1

    .line 345
    iget-object v2, p0, Lv/VSwitchButton;->h:Landroid/graphics/RectF;

    .line 346
    .line 347
    iget v4, v2, Landroid/graphics/RectF;->left:F

    .line 348
    .line 349
    add-float/2addr v4, p1

    .line 350
    iget v2, v2, Landroid/graphics/RectF;->right:F

    .line 351
    .line 352
    add-float/2addr v4, v2

    .line 353
    invoke-static {v5, v1}, Ljava/lang/Math;->max(II)I

    .line 354
    .line 355
    .line 356
    move-result v2

    .line 357
    int-to-float v2, v2

    .line 358
    add-float/2addr v4, v2

    .line 359
    float-to-double v6, v4

    .line 360
    invoke-virtual {p0, v6, v7}, Lv/VSwitchButton;->e(D)I

    .line 361
    .line 362
    .line 363
    move-result v2

    .line 364
    iput v2, p0, Lv/VSwitchButton;->m:I

    .line 365
    .line 366
    if-gez v2, :cond_a

    .line 367
    .line 368
    iput v3, p0, Lv/VSwitchButton;->k:F

    .line 369
    .line 370
    iput v5, p0, Lv/VSwitchButton;->m:I

    .line 371
    .line 372
    return v0

    .line 373
    :cond_a
    iget-object v0, p0, Lv/VSwitchButton;->h:Landroid/graphics/RectF;

    .line 374
    .line 375
    iget v0, v0, Landroid/graphics/RectF;->left:F

    .line 376
    .line 377
    invoke-static {v3, v0}, Ljava/lang/Math;->max(FF)F

    .line 378
    .line 379
    .line 380
    move-result v0

    .line 381
    add-float/2addr p1, v0

    .line 382
    iget-object v0, p0, Lv/VSwitchButton;->h:Landroid/graphics/RectF;

    .line 383
    .line 384
    iget v0, v0, Landroid/graphics/RectF;->right:F

    .line 385
    .line 386
    invoke-static {v3, v0}, Ljava/lang/Math;->max(FF)F

    .line 387
    .line 388
    .line 389
    move-result v0

    .line 390
    add-float/2addr p1, v0

    .line 391
    invoke-static {v5, v1}, Ljava/lang/Math;->max(II)I

    .line 392
    .line 393
    .line 394
    move-result v0

    .line 395
    int-to-float v0, v0

    .line 396
    add-float/2addr p1, v0

    .line 397
    float-to-double v0, p1

    .line 398
    invoke-virtual {p0, v0, v1}, Lv/VSwitchButton;->e(D)I

    .line 399
    .line 400
    .line 401
    move-result p1

    .line 402
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 403
    .line 404
    .line 405
    move-result v0

    .line 406
    add-int/2addr v0, p1

    .line 407
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 408
    .line 409
    .line 410
    move-result p0

    .line 411
    add-int/2addr v0, p0

    .line 412
    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    .line 413
    .line 414
    .line 415
    move-result p0

    .line 416
    return p0
.end method

.method public n(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv/VSwitchButton;->D:Ljava/lang/CharSequence;

    .line 2
    .line 3
    iput-object p2, p0, Lv/VSwitchButton;->E:Ljava/lang/CharSequence;

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    iput-object p1, p0, Lv/VSwitchButton;->G:Landroid/text/Layout;

    .line 7
    .line 8
    iput-object p1, p0, Lv/VSwitchButton;->H:Landroid/text/Layout;

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    iput-boolean p1, p0, Lv/VSwitchButton;->O:Z

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public o(FFFF)V
    .locals 1

    .line 1
    iget-object v0, p0, Lv/VSwitchButton;->h:Landroid/graphics/RectF;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-boolean p1, p0, Lv/VSwitchButton;->O:Z

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 11

    .line 1
    invoke-super {p0, p1}, Landroid/widget/CompoundButton;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lv/VSwitchButton;->O:Z

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lv/VSwitchButton;->p()V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-boolean v0, p0, Lv/VSwitchButton;->O:Z

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    return-void

    .line 16
    :cond_1
    invoke-direct {p0}, Lv/VSwitchButton;->getProgress()F

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-virtual {p0, v0}, Lv/VSwitchButton;->f(F)F

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    iget-object v1, p0, Lv/VSwitchButton;->e:Landroid/animation/ArgbEvaluator;

    .line 25
    .line 26
    iget v2, p0, Lv/VSwitchButton;->T:I

    .line 27
    .line 28
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    iget v3, p0, Lv/VSwitchButton;->j:I

    .line 33
    .line 34
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    invoke-virtual {v1, v0, v2, v3}, Landroid/animation/ArgbEvaluator;->evaluate(FLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    check-cast v1, Ljava/lang/Integer;

    .line 43
    .line 44
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    iget-object v2, p0, Lv/VSwitchButton;->b:Landroid/graphics/Paint;

    .line 49
    .line 50
    invoke-virtual {v2, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 51
    .line 52
    .line 53
    iget-object v1, p0, Lv/VSwitchButton;->r:Landroid/graphics/RectF;

    .line 54
    .line 55
    iget v2, p0, Lv/VSwitchButton;->g:F

    .line 56
    .line 57
    iget-object v3, p0, Lv/VSwitchButton;->b:Landroid/graphics/Paint;

    .line 58
    .line 59
    invoke-virtual {p1, v1, v2, v2, v3}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 60
    .line 61
    .line 62
    iget-object v1, p0, Lv/VSwitchButton;->e:Landroid/animation/ArgbEvaluator;

    .line 63
    .line 64
    iget v2, p0, Lv/VSwitchButton;->S:I

    .line 65
    .line 66
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    iget v3, p0, Lv/VSwitchButton;->j:I

    .line 71
    .line 72
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    invoke-virtual {v1, v0, v2, v3}, Landroid/animation/ArgbEvaluator;->evaluate(FLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    check-cast v1, Ljava/lang/Integer;

    .line 81
    .line 82
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    iget-object v2, p0, Lv/VSwitchButton;->c:Landroid/graphics/Paint;

    .line 87
    .line 88
    invoke-virtual {v2, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 89
    .line 90
    .line 91
    iget-object v1, p0, Lv/VSwitchButton;->v:Landroid/graphics/RectF;

    .line 92
    .line 93
    iget v2, p0, Lv/VSwitchButton;->g:F

    .line 94
    .line 95
    iget-object v3, p0, Lv/VSwitchButton;->c:Landroid/graphics/Paint;

    .line 96
    .line 97
    invoke-virtual {p1, v1, v2, v2, v3}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 98
    .line 99
    .line 100
    float-to-double v1, v0

    .line 101
    const-wide/high16 v3, 0x3fe0000000000000L    # 0.5

    .line 102
    .line 103
    cmpl-double v3, v1, v3

    .line 104
    .line 105
    if-lez v3, :cond_2

    .line 106
    .line 107
    iget-object v4, p0, Lv/VSwitchButton;->G:Landroid/text/Layout;

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_2
    iget-object v4, p0, Lv/VSwitchButton;->H:Landroid/text/Layout;

    .line 111
    .line 112
    :goto_0
    if-lez v3, :cond_3

    .line 113
    .line 114
    iget-object v5, p0, Lv/VSwitchButton;->t:Landroid/graphics/RectF;

    .line 115
    .line 116
    goto :goto_1

    .line 117
    :cond_3
    iget-object v5, p0, Lv/VSwitchButton;->u:Landroid/graphics/RectF;

    .line 118
    .line 119
    :goto_1
    const/4 v6, 0x0

    .line 120
    if-eqz v4, :cond_7

    .line 121
    .line 122
    if-eqz v5, :cond_7

    .line 123
    .line 124
    const-wide/high16 v7, 0x3fe8000000000000L    # 0.75

    .line 125
    .line 126
    cmpl-double v7, v1, v7

    .line 127
    .line 128
    const/high16 v8, 0x40800000    # 4.0f

    .line 129
    .line 130
    if-ltz v7, :cond_4

    .line 131
    .line 132
    mul-float/2addr v8, v0

    .line 133
    const/high16 v1, 0x40400000    # 3.0f

    .line 134
    .line 135
    sub-float/2addr v8, v1

    .line 136
    goto :goto_2

    .line 137
    :cond_4
    const-wide/high16 v9, 0x3fd0000000000000L    # 0.25

    .line 138
    .line 139
    cmpg-double v1, v1, v9

    .line 140
    .line 141
    if-gez v1, :cond_5

    .line 142
    .line 143
    const/high16 v1, 0x3f800000    # 1.0f

    .line 144
    .line 145
    mul-float/2addr v8, v0

    .line 146
    sub-float v8, v1, v8

    .line 147
    .line 148
    goto :goto_2

    .line 149
    :cond_5
    move v8, v6

    .line 150
    :goto_2
    const/high16 v1, 0x437f0000    # 255.0f

    .line 151
    .line 152
    mul-float/2addr v8, v1

    .line 153
    float-to-int v1, v8

    .line 154
    if-lez v3, :cond_6

    .line 155
    .line 156
    iget v2, p0, Lv/VSwitchButton;->o:I

    .line 157
    .line 158
    goto :goto_3

    .line 159
    :cond_6
    iget v2, p0, Lv/VSwitchButton;->p:I

    .line 160
    .line 161
    :goto_3
    invoke-static {v2}, Landroid/graphics/Color;->alpha(I)I

    .line 162
    .line 163
    .line 164
    move-result v3

    .line 165
    mul-int/2addr v3, v1

    .line 166
    div-int/lit16 v3, v3, 0xff

    .line 167
    .line 168
    invoke-virtual {v4}, Landroid/text/Layout;->getPaint()Landroid/text/TextPaint;

    .line 169
    .line 170
    .line 171
    move-result-object v1

    .line 172
    invoke-static {v2}, Landroid/graphics/Color;->red(I)I

    .line 173
    .line 174
    .line 175
    move-result v7

    .line 176
    invoke-static {v2}, Landroid/graphics/Color;->green(I)I

    .line 177
    .line 178
    .line 179
    move-result v8

    .line 180
    invoke-static {v2}, Landroid/graphics/Color;->blue(I)I

    .line 181
    .line 182
    .line 183
    move-result v2

    .line 184
    invoke-virtual {v1, v3, v7, v8, v2}, Landroid/graphics/Paint;->setARGB(IIII)V

    .line 185
    .line 186
    .line 187
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 188
    .line 189
    .line 190
    iget v1, v5, Landroid/graphics/RectF;->left:F

    .line 191
    .line 192
    iget v2, v5, Landroid/graphics/RectF;->top:F

    .line 193
    .line 194
    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 195
    .line 196
    .line 197
    invoke-virtual {v4, p1}, Landroid/text/Layout;->draw(Landroid/graphics/Canvas;)V

    .line 198
    .line 199
    .line 200
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 201
    .line 202
    .line 203
    :cond_7
    iget-object v1, p0, Lv/VSwitchButton;->x:Landroid/graphics/RectF;

    .line 204
    .line 205
    iget-object v2, p0, Lv/VSwitchButton;->q:Landroid/graphics/RectF;

    .line 206
    .line 207
    invoke-virtual {v1, v2}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 208
    .line 209
    .line 210
    iget-object v1, p0, Lv/VSwitchButton;->x:Landroid/graphics/RectF;

    .line 211
    .line 212
    invoke-direct {p0}, Lv/VSwitchButton;->getProgress()F

    .line 213
    .line 214
    .line 215
    move-result v2

    .line 216
    iget-object v3, p0, Lv/VSwitchButton;->s:Landroid/graphics/RectF;

    .line 217
    .line 218
    invoke-virtual {v3}, Landroid/graphics/RectF;->width()F

    .line 219
    .line 220
    .line 221
    move-result v3

    .line 222
    mul-float/2addr v2, v3

    .line 223
    invoke-virtual {v1, v2, v6}, Landroid/graphics/RectF;->offset(FF)V

    .line 224
    .line 225
    .line 226
    iget-object v1, p0, Lv/VSwitchButton;->e:Landroid/animation/ArgbEvaluator;

    .line 227
    .line 228
    iget v2, p0, Lv/VSwitchButton;->S:I

    .line 229
    .line 230
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 231
    .line 232
    .line 233
    move-result-object v2

    .line 234
    iget v3, p0, Lv/VSwitchButton;->T:I

    .line 235
    .line 236
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 237
    .line 238
    .line 239
    move-result-object v3

    .line 240
    invoke-virtual {v1, v0, v2, v3}, Landroid/animation/ArgbEvaluator;->evaluate(FLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 241
    .line 242
    .line 243
    move-result-object v0

    .line 244
    check-cast v0, Ljava/lang/Integer;

    .line 245
    .line 246
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 247
    .line 248
    .line 249
    move-result v0

    .line 250
    iget-object v1, p0, Lv/VSwitchButton;->b:Landroid/graphics/Paint;

    .line 251
    .line 252
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 253
    .line 254
    .line 255
    iget-object v0, p0, Lv/VSwitchButton;->x:Landroid/graphics/RectF;

    .line 256
    .line 257
    iget v1, p0, Lv/VSwitchButton;->f:F

    .line 258
    .line 259
    iget-object p0, p0, Lv/VSwitchButton;->b:Landroid/graphics/Paint;

    .line 260
    .line 261
    invoke-virtual {p1, v0, v1, v1, p0}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 262
    .line 263
    .line 264
    return-void
.end method

.method public onMeasure(II)V
    .locals 4

    .line 1
    iget-object v0, p0, Lv/VSwitchButton;->G:Landroid/text/Layout;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lv/VSwitchButton;->D:Ljava/lang/CharSequence;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lv/VSwitchButton;->D:Ljava/lang/CharSequence;

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Lv/VSwitchButton;->k(Ljava/lang/CharSequence;)Landroid/text/Layout;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lv/VSwitchButton;->G:Landroid/text/Layout;

    .line 20
    .line 21
    :cond_0
    iget-object v0, p0, Lv/VSwitchButton;->H:Landroid/text/Layout;

    .line 22
    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    iget-object v0, p0, Lv/VSwitchButton;->E:Ljava/lang/CharSequence;

    .line 26
    .line 27
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    iget-object v0, p0, Lv/VSwitchButton;->E:Ljava/lang/CharSequence;

    .line 34
    .line 35
    invoke-virtual {p0, v0}, Lv/VSwitchButton;->k(Ljava/lang/CharSequence;)Landroid/text/Layout;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iput-object v0, p0, Lv/VSwitchButton;->H:Landroid/text/Layout;

    .line 40
    .line 41
    :cond_1
    iget-object v0, p0, Lv/VSwitchButton;->G:Landroid/text/Layout;

    .line 42
    .line 43
    const/4 v1, 0x0

    .line 44
    if-eqz v0, :cond_2

    .line 45
    .line 46
    invoke-virtual {v0}, Landroid/text/Layout;->getWidth()I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    int-to-float v0, v0

    .line 51
    goto :goto_0

    .line 52
    :cond_2
    move v0, v1

    .line 53
    :goto_0
    iget-object v2, p0, Lv/VSwitchButton;->H:Landroid/text/Layout;

    .line 54
    .line 55
    if-eqz v2, :cond_3

    .line 56
    .line 57
    invoke-virtual {v2}, Landroid/text/Layout;->getWidth()I

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    int-to-float v2, v2

    .line 62
    goto :goto_1

    .line 63
    :cond_3
    move v2, v1

    .line 64
    :goto_1
    cmpl-float v3, v0, v1

    .line 65
    .line 66
    if-nez v3, :cond_5

    .line 67
    .line 68
    cmpl-float v3, v2, v1

    .line 69
    .line 70
    if-eqz v3, :cond_4

    .line 71
    .line 72
    goto :goto_2

    .line 73
    :cond_4
    iput v1, p0, Lv/VSwitchButton;->I:F

    .line 74
    .line 75
    goto :goto_3

    .line 76
    :cond_5
    :goto_2
    invoke-static {v0, v2}, Ljava/lang/Math;->max(FF)F

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    iput v0, p0, Lv/VSwitchButton;->I:F

    .line 81
    .line 82
    :goto_3
    iget-object v0, p0, Lv/VSwitchButton;->G:Landroid/text/Layout;

    .line 83
    .line 84
    if-eqz v0, :cond_6

    .line 85
    .line 86
    invoke-virtual {v0}, Landroid/text/Layout;->getHeight()I

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    int-to-float v0, v0

    .line 91
    goto :goto_4

    .line 92
    :cond_6
    move v0, v1

    .line 93
    :goto_4
    iget-object v2, p0, Lv/VSwitchButton;->H:Landroid/text/Layout;

    .line 94
    .line 95
    if-eqz v2, :cond_7

    .line 96
    .line 97
    invoke-virtual {v2}, Landroid/text/Layout;->getHeight()I

    .line 98
    .line 99
    .line 100
    move-result v2

    .line 101
    int-to-float v2, v2

    .line 102
    goto :goto_5

    .line 103
    :cond_7
    move v2, v1

    .line 104
    :goto_5
    cmpl-float v3, v0, v1

    .line 105
    .line 106
    if-nez v3, :cond_9

    .line 107
    .line 108
    cmpl-float v3, v2, v1

    .line 109
    .line 110
    if-eqz v3, :cond_8

    .line 111
    .line 112
    goto :goto_6

    .line 113
    :cond_8
    iput v1, p0, Lv/VSwitchButton;->J:F

    .line 114
    .line 115
    goto :goto_7

    .line 116
    :cond_9
    :goto_6
    invoke-static {v0, v2}, Ljava/lang/Math;->max(FF)F

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    iput v0, p0, Lv/VSwitchButton;->J:F

    .line 121
    .line 122
    :goto_7
    invoke-virtual {p0, p1}, Lv/VSwitchButton;->m(I)I

    .line 123
    .line 124
    .line 125
    move-result p1

    .line 126
    invoke-virtual {p0, p2}, Lv/VSwitchButton;->l(I)I

    .line 127
    .line 128
    .line 129
    move-result p2

    .line 130
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 131
    .line 132
    .line 133
    return-void
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .locals 2

    .line 1
    check-cast p1, Lv/VSwitchButton$SavedState;

    .line 2
    .line 3
    iget-object v0, p1, Lv/VSwitchButton$SavedState;->onText:Ljava/lang/CharSequence;

    .line 4
    .line 5
    iget-object v1, p1, Lv/VSwitchButton$SavedState;->offText:Ljava/lang/CharSequence;

    .line 6
    .line 7
    invoke-virtual {p0, v0, v1}, Lv/VSwitchButton;->n(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    iput-boolean v0, p0, Lv/VSwitchButton;->N:Z

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/view/AbsSavedState;->getSuperState()Landroid/os/Parcelable;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-super {p0, p1}, Landroid/widget/CompoundButton;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 18
    .line 19
    .line 20
    const/4 p1, 0x0

    .line 21
    iput-boolean p1, p0, Lv/VSwitchButton;->N:Z

    .line 22
    .line 23
    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/widget/CompoundButton;->onSaveInstanceState()Landroid/os/Parcelable;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Lv/VSwitchButton$SavedState;

    .line 6
    .line 7
    invoke-direct {v1, v0}, Lv/VSwitchButton$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lv/VSwitchButton;->D:Ljava/lang/CharSequence;

    .line 11
    .line 12
    iput-object v0, v1, Lv/VSwitchButton$SavedState;->onText:Ljava/lang/CharSequence;

    .line 13
    .line 14
    iget-object p0, p0, Lv/VSwitchButton;->E:Ljava/lang/CharSequence;

    .line 15
    .line 16
    iput-object p0, v1, Lv/VSwitchButton$SavedState;->offText:Ljava/lang/CharSequence;

    .line 17
    .line 18
    return-object v1
.end method

.method public onSizeChanged(IIII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    .line 2
    .line 3
    .line 4
    if-ne p1, p3, :cond_1

    .line 5
    .line 6
    if-eq p2, p4, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    return-void

    .line 10
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lv/VSwitchButton;->p()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 9

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->isEnabled()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_b

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->isClickable()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_b

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/View;->isFocusable()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_b

    .line 19
    .line 20
    iget-boolean v0, p0, Lv/VSwitchButton;->O:Z

    .line 21
    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    goto/16 :goto_3

    .line 25
    .line 26
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    iget v3, p0, Lv/VSwitchButton;->y:F

    .line 35
    .line 36
    sub-float/2addr v2, v3

    .line 37
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    iget v4, p0, Lv/VSwitchButton;->z:F

    .line 42
    .line 43
    sub-float/2addr v3, v4

    .line 44
    const/4 v4, 0x1

    .line 45
    if-eqz v0, :cond_9

    .line 46
    .line 47
    if-eq v0, v4, :cond_5

    .line 48
    .line 49
    const/4 v5, 0x2

    .line 50
    if-eq v0, v5, :cond_1

    .line 51
    .line 52
    const/4 v5, 0x3

    .line 53
    if-eq v0, v5, :cond_5

    .line 54
    .line 55
    goto/16 :goto_2

    .line 56
    .line 57
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    invoke-direct {p0}, Lv/VSwitchButton;->getProgress()F

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    iget v5, p0, Lv/VSwitchButton;->A:F

    .line 66
    .line 67
    sub-float v5, p1, v5

    .line 68
    .line 69
    iget-object v6, p0, Lv/VSwitchButton;->s:Landroid/graphics/RectF;

    .line 70
    .line 71
    invoke-virtual {v6}, Landroid/graphics/RectF;->width()F

    .line 72
    .line 73
    .line 74
    move-result v6

    .line 75
    div-float/2addr v5, v6

    .line 76
    add-float/2addr v0, v5

    .line 77
    invoke-virtual {p0, v0}, Lv/VSwitchButton;->f(F)F

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    invoke-direct {p0, v0}, Lv/VSwitchButton;->setProgress(F)V

    .line 82
    .line 83
    .line 84
    iput p1, p0, Lv/VSwitchButton;->A:F

    .line 85
    .line 86
    iget-boolean p1, p0, Lv/VSwitchButton;->P:Z

    .line 87
    .line 88
    if-nez p1, :cond_a

    .line 89
    .line 90
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    iget v0, p0, Lv/VSwitchButton;->B:I

    .line 95
    .line 96
    int-to-float v0, v0

    .line 97
    const/high16 v5, 0x40000000    # 2.0f

    .line 98
    .line 99
    div-float/2addr v0, v5

    .line 100
    cmpl-float p1, p1, v0

    .line 101
    .line 102
    if-gtz p1, :cond_2

    .line 103
    .line 104
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    .line 105
    .line 106
    .line 107
    move-result p1

    .line 108
    iget v0, p0, Lv/VSwitchButton;->B:I

    .line 109
    .line 110
    int-to-float v0, v0

    .line 111
    div-float/2addr v0, v5

    .line 112
    cmpl-float p1, p1, v0

    .line 113
    .line 114
    if-lez p1, :cond_a

    .line 115
    .line 116
    :cond_2
    const/4 p1, 0x0

    .line 117
    cmpl-float p1, v3, p1

    .line 118
    .line 119
    if-eqz p1, :cond_4

    .line 120
    .line 121
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    .line 122
    .line 123
    .line 124
    move-result p1

    .line 125
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    cmpl-float p1, p1, v0

    .line 130
    .line 131
    if-lez p1, :cond_3

    .line 132
    .line 133
    goto :goto_0

    .line 134
    :cond_3
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    .line 135
    .line 136
    .line 137
    move-result p0

    .line 138
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    .line 139
    .line 140
    .line 141
    move-result p1

    .line 142
    cmpl-float p0, p0, p1

    .line 143
    .line 144
    if-lez p0, :cond_a

    .line 145
    .line 146
    return v1

    .line 147
    :cond_4
    :goto_0
    invoke-virtual {p0}, Lv/VSwitchButton;->d()V

    .line 148
    .line 149
    .line 150
    goto/16 :goto_2

    .line 151
    .line 152
    :cond_5
    iput-boolean v1, p0, Lv/VSwitchButton;->P:Z

    .line 153
    .line 154
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    .line 155
    .line 156
    .line 157
    move-result-wide v5

    .line 158
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getDownTime()J

    .line 159
    .line 160
    .line 161
    move-result-wide v7

    .line 162
    sub-long/2addr v5, v7

    .line 163
    long-to-float p1, v5

    .line 164
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    .line 165
    .line 166
    .line 167
    move-result v0

    .line 168
    iget v2, p0, Lv/VSwitchButton;->B:I

    .line 169
    .line 170
    int-to-float v2, v2

    .line 171
    cmpg-float v0, v0, v2

    .line 172
    .line 173
    if-gez v0, :cond_6

    .line 174
    .line 175
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    .line 176
    .line 177
    .line 178
    move-result v0

    .line 179
    iget v2, p0, Lv/VSwitchButton;->B:I

    .line 180
    .line 181
    int-to-float v2, v2

    .line 182
    cmpg-float v0, v0, v2

    .line 183
    .line 184
    if-gez v0, :cond_6

    .line 185
    .line 186
    iget v0, p0, Lv/VSwitchButton;->C:I

    .line 187
    .line 188
    int-to-float v0, v0

    .line 189
    cmpg-float p1, p1, v0

    .line 190
    .line 191
    if-gez p1, :cond_6

    .line 192
    .line 193
    invoke-virtual {p0}, Lv/VSwitchButton;->performClick()Z

    .line 194
    .line 195
    .line 196
    goto :goto_1

    .line 197
    :cond_6
    invoke-virtual {p0}, Lv/VSwitchButton;->i()Z

    .line 198
    .line 199
    .line 200
    move-result p1

    .line 201
    invoke-virtual {p0}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 202
    .line 203
    .line 204
    move-result v0

    .line 205
    if-eq p1, v0, :cond_7

    .line 206
    .line 207
    invoke-virtual {p0, v1}, Landroid/view/View;->playSoundEffect(I)V

    .line 208
    .line 209
    .line 210
    invoke-virtual {p0, p1}, Lv/VSwitchButton;->setChecked(Z)V

    .line 211
    .line 212
    .line 213
    goto :goto_1

    .line 214
    :cond_7
    invoke-virtual {p0, p1}, Lv/VSwitchButton;->b(Z)V

    .line 215
    .line 216
    .line 217
    :goto_1
    invoke-virtual {p0}, Landroid/view/View;->isPressed()Z

    .line 218
    .line 219
    .line 220
    move-result p1

    .line 221
    if-eqz p1, :cond_a

    .line 222
    .line 223
    iget-object p1, p0, Lv/VSwitchButton;->Q:Lv/VSwitchButton$a;

    .line 224
    .line 225
    if-nez p1, :cond_8

    .line 226
    .line 227
    new-instance p1, Lv/VSwitchButton$a;

    .line 228
    .line 229
    const/4 v0, 0x0

    .line 230
    invoke-direct {p1, p0, v0}, Lv/VSwitchButton$a;-><init>(Lv/VSwitchButton;Ll/uzk0;)V

    .line 231
    .line 232
    .line 233
    iput-object p1, p0, Lv/VSwitchButton;->Q:Lv/VSwitchButton$a;

    .line 234
    .line 235
    :cond_8
    iget-object p1, p0, Lv/VSwitchButton;->Q:Lv/VSwitchButton$a;

    .line 236
    .line 237
    invoke-virtual {p0, p1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 238
    .line 239
    .line 240
    move-result p1

    .line 241
    if-nez p1, :cond_a

    .line 242
    .line 243
    iget-object p0, p0, Lv/VSwitchButton;->Q:Lv/VSwitchButton$a;

    .line 244
    .line 245
    invoke-virtual {p0}, Lv/VSwitchButton$a;->run()V

    .line 246
    .line 247
    .line 248
    goto :goto_2

    .line 249
    :cond_9
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 250
    .line 251
    .line 252
    move-result v0

    .line 253
    iput v0, p0, Lv/VSwitchButton;->y:F

    .line 254
    .line 255
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 256
    .line 257
    .line 258
    move-result p1

    .line 259
    iput p1, p0, Lv/VSwitchButton;->z:F

    .line 260
    .line 261
    iget p1, p0, Lv/VSwitchButton;->y:F

    .line 262
    .line 263
    iput p1, p0, Lv/VSwitchButton;->A:F

    .line 264
    .line 265
    invoke-virtual {p0, v4}, Landroid/view/View;->setPressed(Z)V

    .line 266
    .line 267
    .line 268
    :cond_a
    :goto_2
    return v4

    .line 269
    :cond_b
    :goto_3
    return v1
.end method

.method public final p()V
    .locals 11

    .line 1
    iget v0, p0, Lv/VSwitchButton;->k:F

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    cmpl-float v2, v0, v1

    .line 5
    .line 6
    if-eqz v2, :cond_7

    .line 7
    .line 8
    iget v2, p0, Lv/VSwitchButton;->l:F

    .line 9
    .line 10
    cmpl-float v3, v2, v1

    .line 11
    .line 12
    if-eqz v3, :cond_7

    .line 13
    .line 14
    iget v3, p0, Lv/VSwitchButton;->m:I

    .line 15
    .line 16
    if-eqz v3, :cond_7

    .line 17
    .line 18
    iget v3, p0, Lv/VSwitchButton;->n:I

    .line 19
    .line 20
    if-nez v3, :cond_0

    .line 21
    .line 22
    goto/16 :goto_2

    .line 23
    .line 24
    :cond_0
    iget v3, p0, Lv/VSwitchButton;->f:F

    .line 25
    .line 26
    const/high16 v4, -0x40800000    # -1.0f

    .line 27
    .line 28
    cmpl-float v3, v3, v4

    .line 29
    .line 30
    const/high16 v5, 0x40000000    # 2.0f

    .line 31
    .line 32
    if-nez v3, :cond_1

    .line 33
    .line 34
    invoke-static {v0, v2}, Ljava/lang/Math;->min(FF)F

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    div-float/2addr v0, v5

    .line 39
    iput v0, p0, Lv/VSwitchButton;->f:F

    .line 40
    .line 41
    :cond_1
    iget v0, p0, Lv/VSwitchButton;->g:F

    .line 42
    .line 43
    cmpl-float v0, v0, v4

    .line 44
    .line 45
    if-nez v0, :cond_2

    .line 46
    .line 47
    iget v0, p0, Lv/VSwitchButton;->m:I

    .line 48
    .line 49
    iget v2, p0, Lv/VSwitchButton;->n:I

    .line 50
    .line 51
    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    int-to-float v0, v0

    .line 56
    div-float/2addr v0, v5

    .line 57
    iput v0, p0, Lv/VSwitchButton;->g:F

    .line 58
    .line 59
    :cond_2
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    sub-int/2addr v0, v2

    .line 68
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    sub-int/2addr v0, v2

    .line 73
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 78
    .line 79
    .line 80
    move-result v3

    .line 81
    sub-int/2addr v2, v3

    .line 82
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 83
    .line 84
    .line 85
    move-result v3

    .line 86
    sub-int/2addr v2, v3

    .line 87
    iget v3, p0, Lv/VSwitchButton;->m:I

    .line 88
    .line 89
    int-to-float v3, v3

    .line 90
    iget-object v4, p0, Lv/VSwitchButton;->h:Landroid/graphics/RectF;

    .line 91
    .line 92
    iget v4, v4, Landroid/graphics/RectF;->left:F

    .line 93
    .line 94
    invoke-static {v1, v4}, Ljava/lang/Math;->min(FF)F

    .line 95
    .line 96
    .line 97
    move-result v4

    .line 98
    sub-float/2addr v3, v4

    .line 99
    iget-object v4, p0, Lv/VSwitchButton;->h:Landroid/graphics/RectF;

    .line 100
    .line 101
    iget v4, v4, Landroid/graphics/RectF;->right:F

    .line 102
    .line 103
    invoke-static {v1, v4}, Ljava/lang/Math;->min(FF)F

    .line 104
    .line 105
    .line 106
    move-result v4

    .line 107
    sub-float/2addr v3, v4

    .line 108
    float-to-double v3, v3

    .line 109
    invoke-virtual {p0, v3, v4}, Lv/VSwitchButton;->e(D)I

    .line 110
    .line 111
    .line 112
    move-result v3

    .line 113
    iget v4, p0, Lv/VSwitchButton;->n:I

    .line 114
    .line 115
    int-to-float v4, v4

    .line 116
    iget-object v6, p0, Lv/VSwitchButton;->h:Landroid/graphics/RectF;

    .line 117
    .line 118
    iget v6, v6, Landroid/graphics/RectF;->top:F

    .line 119
    .line 120
    invoke-static {v1, v6}, Ljava/lang/Math;->min(FF)F

    .line 121
    .line 122
    .line 123
    move-result v6

    .line 124
    sub-float/2addr v4, v6

    .line 125
    iget-object v6, p0, Lv/VSwitchButton;->h:Landroid/graphics/RectF;

    .line 126
    .line 127
    iget v6, v6, Landroid/graphics/RectF;->bottom:F

    .line 128
    .line 129
    invoke-static {v1, v6}, Ljava/lang/Math;->min(FF)F

    .line 130
    .line 131
    .line 132
    move-result v6

    .line 133
    sub-float/2addr v4, v6

    .line 134
    float-to-double v6, v4

    .line 135
    invoke-virtual {p0, v6, v7}, Lv/VSwitchButton;->e(D)I

    .line 136
    .line 137
    .line 138
    move-result v4

    .line 139
    const/4 v6, 0x1

    .line 140
    if-gt v2, v4, :cond_3

    .line 141
    .line 142
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 143
    .line 144
    .line 145
    move-result v2

    .line 146
    int-to-float v2, v2

    .line 147
    iget-object v4, p0, Lv/VSwitchButton;->h:Landroid/graphics/RectF;

    .line 148
    .line 149
    iget v4, v4, Landroid/graphics/RectF;->top:F

    .line 150
    .line 151
    invoke-static {v1, v4}, Ljava/lang/Math;->max(FF)F

    .line 152
    .line 153
    .line 154
    move-result v4

    .line 155
    add-float/2addr v2, v4

    .line 156
    goto :goto_0

    .line 157
    :cond_3
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 158
    .line 159
    .line 160
    move-result v7

    .line 161
    int-to-float v7, v7

    .line 162
    iget-object v8, p0, Lv/VSwitchButton;->h:Landroid/graphics/RectF;

    .line 163
    .line 164
    iget v8, v8, Landroid/graphics/RectF;->top:F

    .line 165
    .line 166
    invoke-static {v1, v8}, Ljava/lang/Math;->max(FF)F

    .line 167
    .line 168
    .line 169
    move-result v8

    .line 170
    add-float/2addr v7, v8

    .line 171
    sub-int/2addr v2, v4

    .line 172
    add-int/2addr v2, v6

    .line 173
    int-to-float v2, v2

    .line 174
    div-float/2addr v2, v5

    .line 175
    add-float/2addr v2, v7

    .line 176
    :goto_0
    iget v4, p0, Lv/VSwitchButton;->m:I

    .line 177
    .line 178
    if-gt v0, v4, :cond_4

    .line 179
    .line 180
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 181
    .line 182
    .line 183
    move-result v0

    .line 184
    int-to-float v0, v0

    .line 185
    iget-object v3, p0, Lv/VSwitchButton;->h:Landroid/graphics/RectF;

    .line 186
    .line 187
    iget v3, v3, Landroid/graphics/RectF;->left:F

    .line 188
    .line 189
    invoke-static {v1, v3}, Ljava/lang/Math;->max(FF)F

    .line 190
    .line 191
    .line 192
    move-result v3

    .line 193
    add-float/2addr v0, v3

    .line 194
    goto :goto_1

    .line 195
    :cond_4
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 196
    .line 197
    .line 198
    move-result v4

    .line 199
    int-to-float v4, v4

    .line 200
    iget-object v7, p0, Lv/VSwitchButton;->h:Landroid/graphics/RectF;

    .line 201
    .line 202
    iget v7, v7, Landroid/graphics/RectF;->left:F

    .line 203
    .line 204
    invoke-static {v1, v7}, Ljava/lang/Math;->max(FF)F

    .line 205
    .line 206
    .line 207
    move-result v7

    .line 208
    add-float/2addr v4, v7

    .line 209
    sub-int/2addr v0, v3

    .line 210
    add-int/2addr v0, v6

    .line 211
    int-to-float v0, v0

    .line 212
    div-float/2addr v0, v5

    .line 213
    add-float/2addr v0, v4

    .line 214
    :goto_1
    iget-object v3, p0, Lv/VSwitchButton;->q:Landroid/graphics/RectF;

    .line 215
    .line 216
    iget v4, p0, Lv/VSwitchButton;->k:F

    .line 217
    .line 218
    add-float/2addr v4, v0

    .line 219
    iget v7, p0, Lv/VSwitchButton;->l:F

    .line 220
    .line 221
    add-float/2addr v7, v2

    .line 222
    invoke-virtual {v3, v0, v2, v4, v7}, Landroid/graphics/RectF;->set(FFFF)V

    .line 223
    .line 224
    .line 225
    iget-object v0, p0, Lv/VSwitchButton;->q:Landroid/graphics/RectF;

    .line 226
    .line 227
    iget v2, v0, Landroid/graphics/RectF;->left:F

    .line 228
    .line 229
    iget-object v3, p0, Lv/VSwitchButton;->h:Landroid/graphics/RectF;

    .line 230
    .line 231
    iget v4, v3, Landroid/graphics/RectF;->left:F

    .line 232
    .line 233
    sub-float/2addr v2, v4

    .line 234
    iget-object v4, p0, Lv/VSwitchButton;->r:Landroid/graphics/RectF;

    .line 235
    .line 236
    iget v0, v0, Landroid/graphics/RectF;->top:F

    .line 237
    .line 238
    iget v3, v3, Landroid/graphics/RectF;->top:F

    .line 239
    .line 240
    sub-float v7, v0, v3

    .line 241
    .line 242
    iget v8, p0, Lv/VSwitchButton;->m:I

    .line 243
    .line 244
    int-to-float v8, v8

    .line 245
    add-float/2addr v8, v2

    .line 246
    sub-float/2addr v0, v3

    .line 247
    iget v3, p0, Lv/VSwitchButton;->n:I

    .line 248
    .line 249
    int-to-float v3, v3

    .line 250
    add-float/2addr v0, v3

    .line 251
    invoke-virtual {v4, v2, v7, v8, v0}, Landroid/graphics/RectF;->set(FFFF)V

    .line 252
    .line 253
    .line 254
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 255
    .line 256
    .line 257
    move-result-object v0

    .line 258
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 259
    .line 260
    .line 261
    move-result-object v0

    .line 262
    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    .line 263
    .line 264
    mul-float/2addr v0, v5

    .line 265
    div-float/2addr v0, v5

    .line 266
    iget-object v3, p0, Lv/VSwitchButton;->v:Landroid/graphics/RectF;

    .line 267
    .line 268
    add-float v4, v2, v0

    .line 269
    .line 270
    iget-object v7, p0, Lv/VSwitchButton;->q:Landroid/graphics/RectF;

    .line 271
    .line 272
    iget v7, v7, Landroid/graphics/RectF;->top:F

    .line 273
    .line 274
    iget-object v8, p0, Lv/VSwitchButton;->h:Landroid/graphics/RectF;

    .line 275
    .line 276
    iget v8, v8, Landroid/graphics/RectF;->top:F

    .line 277
    .line 278
    sub-float v9, v7, v8

    .line 279
    .line 280
    add-float/2addr v9, v0

    .line 281
    iget v10, p0, Lv/VSwitchButton;->m:I

    .line 282
    .line 283
    int-to-float v10, v10

    .line 284
    add-float/2addr v2, v10

    .line 285
    sub-float/2addr v2, v0

    .line 286
    sub-float/2addr v7, v8

    .line 287
    iget v8, p0, Lv/VSwitchButton;->n:I

    .line 288
    .line 289
    int-to-float v8, v8

    .line 290
    add-float/2addr v7, v8

    .line 291
    sub-float/2addr v7, v0

    .line 292
    invoke-virtual {v3, v4, v9, v2, v7}, Landroid/graphics/RectF;->set(FFFF)V

    .line 293
    .line 294
    .line 295
    iget-object v0, p0, Lv/VSwitchButton;->s:Landroid/graphics/RectF;

    .line 296
    .line 297
    iget-object v2, p0, Lv/VSwitchButton;->q:Landroid/graphics/RectF;

    .line 298
    .line 299
    iget v3, v2, Landroid/graphics/RectF;->left:F

    .line 300
    .line 301
    iget-object v4, p0, Lv/VSwitchButton;->r:Landroid/graphics/RectF;

    .line 302
    .line 303
    iget v4, v4, Landroid/graphics/RectF;->right:F

    .line 304
    .line 305
    iget-object v7, p0, Lv/VSwitchButton;->h:Landroid/graphics/RectF;

    .line 306
    .line 307
    iget v7, v7, Landroid/graphics/RectF;->right:F

    .line 308
    .line 309
    sub-float/2addr v4, v7

    .line 310
    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    .line 311
    .line 312
    .line 313
    move-result v2

    .line 314
    sub-float/2addr v4, v2

    .line 315
    invoke-virtual {v0, v3, v1, v4, v1}, Landroid/graphics/RectF;->set(FFFF)V

    .line 316
    .line 317
    .line 318
    iget-object v0, p0, Lv/VSwitchButton;->r:Landroid/graphics/RectF;

    .line 319
    .line 320
    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    .line 321
    .line 322
    .line 323
    move-result v0

    .line 324
    iget-object v1, p0, Lv/VSwitchButton;->r:Landroid/graphics/RectF;

    .line 325
    .line 326
    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    .line 327
    .line 328
    .line 329
    move-result v1

    .line 330
    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    .line 331
    .line 332
    .line 333
    move-result v0

    .line 334
    div-float/2addr v0, v5

    .line 335
    iget v1, p0, Lv/VSwitchButton;->g:F

    .line 336
    .line 337
    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    .line 338
    .line 339
    .line 340
    move-result v0

    .line 341
    iput v0, p0, Lv/VSwitchButton;->g:F

    .line 342
    .line 343
    iget-object v0, p0, Lv/VSwitchButton;->G:Landroid/text/Layout;

    .line 344
    .line 345
    if-eqz v0, :cond_5

    .line 346
    .line 347
    iget-object v0, p0, Lv/VSwitchButton;->r:Landroid/graphics/RectF;

    .line 348
    .line 349
    iget v1, v0, Landroid/graphics/RectF;->left:F

    .line 350
    .line 351
    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    .line 352
    .line 353
    .line 354
    move-result v0

    .line 355
    iget v2, p0, Lv/VSwitchButton;->K:I

    .line 356
    .line 357
    int-to-float v2, v2

    .line 358
    add-float/2addr v0, v2

    .line 359
    iget v2, p0, Lv/VSwitchButton;->k:F

    .line 360
    .line 361
    sub-float/2addr v0, v2

    .line 362
    iget-object v2, p0, Lv/VSwitchButton;->h:Landroid/graphics/RectF;

    .line 363
    .line 364
    iget v2, v2, Landroid/graphics/RectF;->right:F

    .line 365
    .line 366
    sub-float/2addr v0, v2

    .line 367
    iget-object v2, p0, Lv/VSwitchButton;->G:Landroid/text/Layout;

    .line 368
    .line 369
    invoke-virtual {v2}, Landroid/text/Layout;->getWidth()I

    .line 370
    .line 371
    .line 372
    move-result v2

    .line 373
    int-to-float v2, v2

    .line 374
    sub-float/2addr v0, v2

    .line 375
    div-float/2addr v0, v5

    .line 376
    add-float/2addr v1, v0

    .line 377
    iget v0, p0, Lv/VSwitchButton;->M:I

    .line 378
    .line 379
    int-to-float v0, v0

    .line 380
    sub-float/2addr v1, v0

    .line 381
    iget-object v0, p0, Lv/VSwitchButton;->r:Landroid/graphics/RectF;

    .line 382
    .line 383
    iget v2, v0, Landroid/graphics/RectF;->top:F

    .line 384
    .line 385
    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    .line 386
    .line 387
    .line 388
    move-result v0

    .line 389
    iget-object v3, p0, Lv/VSwitchButton;->G:Landroid/text/Layout;

    .line 390
    .line 391
    invoke-virtual {v3}, Landroid/text/Layout;->getHeight()I

    .line 392
    .line 393
    .line 394
    move-result v3

    .line 395
    int-to-float v3, v3

    .line 396
    sub-float/2addr v0, v3

    .line 397
    div-float/2addr v0, v5

    .line 398
    add-float/2addr v2, v0

    .line 399
    iget-object v0, p0, Lv/VSwitchButton;->t:Landroid/graphics/RectF;

    .line 400
    .line 401
    iget-object v3, p0, Lv/VSwitchButton;->G:Landroid/text/Layout;

    .line 402
    .line 403
    invoke-virtual {v3}, Landroid/text/Layout;->getWidth()I

    .line 404
    .line 405
    .line 406
    move-result v3

    .line 407
    int-to-float v3, v3

    .line 408
    add-float/2addr v3, v1

    .line 409
    iget-object v4, p0, Lv/VSwitchButton;->G:Landroid/text/Layout;

    .line 410
    .line 411
    invoke-virtual {v4}, Landroid/text/Layout;->getHeight()I

    .line 412
    .line 413
    .line 414
    move-result v4

    .line 415
    int-to-float v4, v4

    .line 416
    add-float/2addr v4, v2

    .line 417
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 418
    .line 419
    .line 420
    :cond_5
    iget-object v0, p0, Lv/VSwitchButton;->H:Landroid/text/Layout;

    .line 421
    .line 422
    if-eqz v0, :cond_6

    .line 423
    .line 424
    iget-object v0, p0, Lv/VSwitchButton;->r:Landroid/graphics/RectF;

    .line 425
    .line 426
    iget v1, v0, Landroid/graphics/RectF;->right:F

    .line 427
    .line 428
    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    .line 429
    .line 430
    .line 431
    move-result v0

    .line 432
    iget v2, p0, Lv/VSwitchButton;->K:I

    .line 433
    .line 434
    int-to-float v2, v2

    .line 435
    add-float/2addr v0, v2

    .line 436
    iget v2, p0, Lv/VSwitchButton;->k:F

    .line 437
    .line 438
    sub-float/2addr v0, v2

    .line 439
    iget-object v2, p0, Lv/VSwitchButton;->h:Landroid/graphics/RectF;

    .line 440
    .line 441
    iget v2, v2, Landroid/graphics/RectF;->left:F

    .line 442
    .line 443
    sub-float/2addr v0, v2

    .line 444
    iget-object v2, p0, Lv/VSwitchButton;->H:Landroid/text/Layout;

    .line 445
    .line 446
    invoke-virtual {v2}, Landroid/text/Layout;->getWidth()I

    .line 447
    .line 448
    .line 449
    move-result v2

    .line 450
    int-to-float v2, v2

    .line 451
    sub-float/2addr v0, v2

    .line 452
    div-float/2addr v0, v5

    .line 453
    sub-float/2addr v1, v0

    .line 454
    iget-object v0, p0, Lv/VSwitchButton;->H:Landroid/text/Layout;

    .line 455
    .line 456
    invoke-virtual {v0}, Landroid/text/Layout;->getWidth()I

    .line 457
    .line 458
    .line 459
    move-result v0

    .line 460
    int-to-float v0, v0

    .line 461
    sub-float/2addr v1, v0

    .line 462
    iget v0, p0, Lv/VSwitchButton;->M:I

    .line 463
    .line 464
    int-to-float v0, v0

    .line 465
    add-float/2addr v1, v0

    .line 466
    iget-object v0, p0, Lv/VSwitchButton;->r:Landroid/graphics/RectF;

    .line 467
    .line 468
    iget v2, v0, Landroid/graphics/RectF;->top:F

    .line 469
    .line 470
    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    .line 471
    .line 472
    .line 473
    move-result v0

    .line 474
    iget-object v3, p0, Lv/VSwitchButton;->H:Landroid/text/Layout;

    .line 475
    .line 476
    invoke-virtual {v3}, Landroid/text/Layout;->getHeight()I

    .line 477
    .line 478
    .line 479
    move-result v3

    .line 480
    int-to-float v3, v3

    .line 481
    sub-float/2addr v0, v3

    .line 482
    div-float/2addr v0, v5

    .line 483
    add-float/2addr v2, v0

    .line 484
    iget-object v0, p0, Lv/VSwitchButton;->u:Landroid/graphics/RectF;

    .line 485
    .line 486
    iget-object v3, p0, Lv/VSwitchButton;->H:Landroid/text/Layout;

    .line 487
    .line 488
    invoke-virtual {v3}, Landroid/text/Layout;->getWidth()I

    .line 489
    .line 490
    .line 491
    move-result v3

    .line 492
    int-to-float v3, v3

    .line 493
    add-float/2addr v3, v1

    .line 494
    iget-object v4, p0, Lv/VSwitchButton;->H:Landroid/text/Layout;

    .line 495
    .line 496
    invoke-virtual {v4}, Landroid/text/Layout;->getHeight()I

    .line 497
    .line 498
    .line 499
    move-result v4

    .line 500
    int-to-float v4, v4

    .line 501
    add-float/2addr v4, v2

    .line 502
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 503
    .line 504
    .line 505
    :cond_6
    iput-boolean v6, p0, Lv/VSwitchButton;->O:Z

    .line 506
    .line 507
    :cond_7
    :goto_2
    return-void
.end method

.method public performClick()Z
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/widget/CompoundButton;->performClick()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public setActiveSliderColor(I)V
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 1
    iput p1, p0, Lv/VSwitchButton;->T:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setBackRadius(F)V
    .locals 0

    .line 1
    iput p1, p0, Lv/VSwitchButton;->g:F

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setChecked(Z)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eq v0, p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lv/VSwitchButton;->b(Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-boolean v0, p0, Lv/VSwitchButton;->N:Z

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lv/VSwitchButton;->setCheckedImmediatelyNoEvent(Z)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_1
    invoke-super {p0, p1}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public setCheckedImmediately(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lv/VSwitchButton;->c()V

    .line 5
    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const/high16 p1, 0x3f800000    # 1.0f

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p1, 0x0

    .line 13
    :goto_0
    invoke-direct {p0, p1}, Lv/VSwitchButton;->setProgress(F)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public setCheckedImmediatelyNoEvent(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lv/VSwitchButton;->R:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lv/VSwitchButton;->setCheckedImmediately(Z)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const/4 v0, 0x0

    .line 10
    invoke-super {p0, v0}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lv/VSwitchButton;->setCheckedImmediately(Z)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lv/VSwitchButton;->R:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    .line 17
    .line 18
    invoke-super {p0, p1}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public setCheckedNoEvent(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lv/VSwitchButton;->R:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lv/VSwitchButton;->setChecked(Z)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const/4 v0, 0x0

    .line 10
    invoke-super {p0, v0}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lv/VSwitchButton;->setChecked(Z)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lv/VSwitchButton;->R:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    .line 17
    .line 18
    invoke-super {p0, p1}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lv/VSwitchButton;->R:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    .line 5
    .line 6
    return-void
.end method

.method public setTextAdjust(I)V
    .locals 0

    .line 1
    iput p1, p0, Lv/VSwitchButton;->M:I

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput-boolean p1, p0, Lv/VSwitchButton;->O:Z

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setTextExtra(I)V
    .locals 0

    .line 1
    iput p1, p0, Lv/VSwitchButton;->L:I

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput-boolean p1, p0, Lv/VSwitchButton;->O:Z

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setTextThumbInset(I)V
    .locals 0

    .line 1
    iput p1, p0, Lv/VSwitchButton;->K:I

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput-boolean p1, p0, Lv/VSwitchButton;->O:Z

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setThumbActiveColor(I)V
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 1
    iput p1, p0, Lv/VSwitchButton;->j:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setThumbInActiveColor(I)V
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 1
    iput p1, p0, Lv/VSwitchButton;->S:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setThumbMargin(Landroid/graphics/RectF;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-virtual {p0, p1, p1, p1, p1}, Lv/VSwitchButton;->o(FFFF)V

    .line 5
    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget v0, p1, Landroid/graphics/RectF;->left:F

    .line 9
    .line 10
    iget v1, p1, Landroid/graphics/RectF;->top:F

    .line 11
    .line 12
    iget v2, p1, Landroid/graphics/RectF;->right:F

    .line 13
    .line 14
    iget p1, p1, Landroid/graphics/RectF;->bottom:F

    .line 15
    .line 16
    invoke-virtual {p0, v0, v1, v2, p1}, Lv/VSwitchButton;->o(FFFF)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public setThumbRadius(F)V
    .locals 0

    .line 1
    iput p1, p0, Lv/VSwitchButton;->f:F

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setThumbRangeRatio(F)V
    .locals 0

    .line 1
    iput p1, p0, Lv/VSwitchButton;->i:F

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput-boolean p1, p0, Lv/VSwitchButton;->O:Z

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 7
    .line 8
    .line 9
    return-void
.end method
