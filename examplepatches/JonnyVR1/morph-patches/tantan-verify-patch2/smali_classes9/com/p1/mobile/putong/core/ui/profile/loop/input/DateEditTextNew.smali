.class public Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;
.super Landroidx/appcompat/widget/AppCompatEditText;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;
    }
.end annotation


# static fields
.field public static H:I = -0x1

.field public static I:I = -0x1

.field public static J:I = -0x1


# instance fields
.field public A:Lcom/p1/mobile/putong/core/ui/profile/loop/input/a;

.field public B:I

.field public C:Ljava/util/Date;

.field public D:Ljava/util/Date;

.field public E:Ljava/lang/CharSequence;

.field public F:Z

.field public G:F

.field public a:Landroid/graphics/Paint;

.field public b:Landroid/graphics/Paint;

.field public c:Landroid/graphics/Paint;

.field public d:Landroid/graphics/RectF;

.field public e:I

.field public f:I

.field public g:I

.field public h:I

.field public i:I

.field public j:Z

.field public k:I

.field public l:I

.field public m:I

.field public n:I

.field public o:I

.field public p:I

.field public q:I

.field public r:Z

.field public s:Ljava/lang/CharSequence;

.field public t:Ljava/lang/CharSequence;

.field public u:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;

.field public v:Ljava/util/Timer;

.field public w:Z

.field public x:I

.field public y:I

.field public z:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 249
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 248
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 4

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroidx/appcompat/widget/AppCompatEditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const-string p3, ""

    .line 5
    .line 6
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->s:Ljava/lang/CharSequence;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->t:Ljava/lang/CharSequence;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->w:Z

    .line 12
    .line 13
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->x:I

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    iput v2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->z:I

    .line 21
    .line 22
    const/4 v2, -0x1

    .line 23
    iput v2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->B:I

    .line 24
    .line 25
    const/16 v2, 0x12

    .line 26
    .line 27
    invoke-static {v2}, Ll/bsj0;->m(I)Ljava/util/Date;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->C:Ljava/util/Date;

    .line 32
    .line 33
    const/16 v2, 0x64

    .line 34
    .line 35
    invoke-static {v2}, Ll/bsj0;->m(I)Ljava/util/Date;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->D:Ljava/util/Date;

    .line 40
    .line 41
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->E:Ljava/lang/CharSequence;

    .line 42
    .line 43
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->F:Z

    .line 44
    .line 45
    new-instance p3, Lcom/p1/mobile/putong/core/ui/profile/loop/input/a;

    .line 46
    .line 47
    const/4 v2, 0x0

    .line 48
    const/4 v3, 0x1

    .line 49
    invoke-direct {p3, v2, v3}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/a;-><init>(Landroid/view/inputmethod/InputConnection;Z)V

    .line 50
    .line 51
    .line 52
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->A:Lcom/p1/mobile/putong/core/ui/profile/loop/input/a;

    .line 53
    .line 54
    invoke-virtual {p0, v0}, Landroid/view/View;->setLongClickable(Z)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextIsSelectable(Z)V

    .line 58
    .line 59
    .line 60
    new-instance p3, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$a;

    .line 61
    .line 62
    invoke-direct {p3, p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$a;-><init>(Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0, p3}, Landroidx/appcompat/widget/AppCompatEditText;->setCustomSelectionActionModeCallback(Landroid/view/ActionMode$Callback;)V

    .line 66
    .line 67
    .line 68
    sget-object p3, Ll/rhc0;->c:[I

    .line 69
    .line 70
    invoke-virtual {p1, p2, p3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    sget p2, Ll/rhc0;->m:I

    .line 75
    .line 76
    invoke-virtual {p1, p2, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 77
    .line 78
    .line 79
    move-result p2

    .line 80
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->j:Z

    .line 81
    .line 82
    sget p2, Ll/rhc0;->f:I

    .line 83
    .line 84
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 85
    .line 86
    .line 87
    move-result-object p3

    .line 88
    sget v0, Ll/j9c0;->c:I

    .line 89
    .line 90
    invoke-static {p3, v0}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 91
    .line 92
    .line 93
    move-result p3

    .line 94
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 95
    .line 96
    .line 97
    move-result p2

    .line 98
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->n:I

    .line 99
    .line 100
    sget p2, Ll/rhc0;->d:I

    .line 101
    .line 102
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 103
    .line 104
    .line 105
    move-result-object p3

    .line 106
    sget v0, Ll/j9c0;->a:I

    .line 107
    .line 108
    invoke-static {p3, v0}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 109
    .line 110
    .line 111
    move-result p3

    .line 112
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 113
    .line 114
    .line 115
    move-result p2

    .line 116
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->o:I

    .line 117
    .line 118
    sget p2, Ll/rhc0;->n:I

    .line 119
    .line 120
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 121
    .line 122
    .line 123
    move-result-object p3

    .line 124
    sget v0, Ll/j9c0;->c:I

    .line 125
    .line 126
    invoke-static {p3, v0}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 127
    .line 128
    .line 129
    move-result p3

    .line 130
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 131
    .line 132
    .line 133
    move-result p2

    .line 134
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->p:I

    .line 135
    .line 136
    sget p2, Ll/rhc0;->k:I

    .line 137
    .line 138
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 139
    .line 140
    .line 141
    move-result-object p3

    .line 142
    sget v0, Ll/j9c0;->d:I

    .line 143
    .line 144
    invoke-static {p3, v0}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 145
    .line 146
    .line 147
    move-result p3

    .line 148
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 149
    .line 150
    .line 151
    move-result p2

    .line 152
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->q:I

    .line 153
    .line 154
    sget p2, Ll/rhc0;->h:I

    .line 155
    .line 156
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 157
    .line 158
    .line 159
    move-result-object p3

    .line 160
    sget v0, Ll/j9c0;->c:I

    .line 161
    .line 162
    invoke-static {p3, v0}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 163
    .line 164
    .line 165
    move-result p3

    .line 166
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 167
    .line 168
    .line 169
    move-result p2

    .line 170
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->m:I

    .line 171
    .line 172
    sget p2, Ll/rhc0;->e:I

    .line 173
    .line 174
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 175
    .line 176
    .line 177
    move-result p2

    .line 178
    float-to-int p2, p2

    .line 179
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->f:I

    .line 180
    .line 181
    sget p2, Ll/rhc0;->l:I

    .line 182
    .line 183
    const/4 p3, 0x6

    .line 184
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 185
    .line 186
    .line 187
    move-result p2

    .line 188
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->g:I

    .line 189
    .line 190
    sget p2, Ll/rhc0;->p:I

    .line 191
    .line 192
    invoke-virtual {p1, p2, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 193
    .line 194
    .line 195
    move-result p2

    .line 196
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->y:I

    .line 197
    .line 198
    sget p2, Ll/rhc0;->i:I

    .line 199
    .line 200
    const/16 p3, 0x1f4

    .line 201
    .line 202
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 203
    .line 204
    .line 205
    move-result p2

    .line 206
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->k:I

    .line 207
    .line 208
    sget p2, Ll/rhc0;->j:I

    .line 209
    .line 210
    const/high16 p3, 0x40000000    # 2.0f

    .line 211
    .line 212
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 213
    .line 214
    .line 215
    move-result p2

    .line 216
    float-to-int p2, p2

    .line 217
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->l:I

    .line 218
    .line 219
    sget p2, Ll/rhc0;->g:I

    .line 220
    .line 221
    const/high16 p3, 0x40a00000    # 5.0f

    .line 222
    .line 223
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 224
    .line 225
    .line 226
    move-result p2

    .line 227
    float-to-int p2, p2

    .line 228
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->h:I

    .line 229
    .line 230
    sget p2, Ll/rhc0;->o:I

    .line 231
    .line 232
    const/high16 p3, 0x41e00000    # 28.0f

    .line 233
    .line 234
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 235
    .line 236
    .line 237
    move-result p2

    .line 238
    float-to-int p2, p2

    .line 239
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->i:I

    .line 240
    .line 241
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 242
    .line 243
    .line 244
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->n()V

    .line 245
    .line 246
    .line 247
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->s(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;)Z
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->r()Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->r:Z

    return p0
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->w:Z

    return p0
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->r:Z

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->w:Z

    return-void
.end method

.method private g()Ljava/util/TimerTask;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$c;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$c;-><init>(Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method private h(ILjava/lang/CharSequence;)Z
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Ll/bsj0;->m(I)Ljava/util/Date;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->u:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;

    .line 7
    .line 8
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    const/4 v3, 0x1

    .line 13
    if-eqz v2, :cond_7

    .line 14
    .line 15
    sget v2, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->H:I

    .line 16
    .line 17
    sget v4, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->I:I

    .line 18
    .line 19
    add-int/2addr v4, v3

    .line 20
    invoke-static {v2, v4}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->l(II)I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    .line 25
    .line 26
    .line 27
    move-result v4

    .line 28
    const/4 v5, 0x2

    .line 29
    if-ne v4, v5, :cond_0

    .line 30
    .line 31
    if-gt p1, v2, :cond_1

    .line 32
    .line 33
    :cond_0
    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    const/4 v6, 0x3

    .line 38
    if-ne v4, v3, :cond_2

    .line 39
    .line 40
    if-gt p1, v6, :cond_2

    .line 41
    .line 42
    div-int/lit8 v2, v2, 0xa

    .line 43
    .line 44
    if-le p1, v2, :cond_2

    .line 45
    .line 46
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->u:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;

    .line 47
    .line 48
    const/4 p1, 0x5

    .line 49
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;->d(I)V

    .line 50
    .line 51
    .line 52
    return v0

    .line 53
    :cond_2
    sget v2, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->H:I

    .line 54
    .line 55
    const/16 v4, 0x76c

    .line 56
    .line 57
    if-le v2, v4, :cond_6

    .line 58
    .line 59
    sget v2, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->I:I

    .line 60
    .line 61
    if-ltz v2, :cond_6

    .line 62
    .line 63
    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    if-eq v2, v5, :cond_3

    .line 68
    .line 69
    if-le p1, v6, :cond_6

    .line 70
    .line 71
    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    if-ne v2, v3, :cond_6

    .line 76
    .line 77
    :cond_3
    sget v2, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->H:I

    .line 78
    .line 79
    sub-int/2addr v2, v4

    .line 80
    invoke-virtual {v1, v2}, Ljava/util/Date;->setYear(I)V

    .line 81
    .line 82
    .line 83
    sget v2, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->I:I

    .line 84
    .line 85
    invoke-virtual {v1, v2}, Ljava/util/Date;->setMonth(I)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v1, p1}, Ljava/util/Date;->setDate(I)V

    .line 89
    .line 90
    .line 91
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->C:Ljava/util/Date;

    .line 92
    .line 93
    invoke-virtual {v1, v2}, Ljava/util/Date;->after(Ljava/util/Date;)Z

    .line 94
    .line 95
    .line 96
    move-result v2

    .line 97
    if-eqz v2, :cond_5

    .line 98
    .line 99
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->u:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;

    .line 100
    .line 101
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->F:Z

    .line 102
    .line 103
    if-eqz p0, :cond_4

    .line 104
    .line 105
    const/4 v3, 0x6

    .line 106
    :cond_4
    invoke-interface {p1, v3}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;->d(I)V

    .line 107
    .line 108
    .line 109
    return v0

    .line 110
    :cond_5
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->D:Ljava/util/Date;

    .line 111
    .line 112
    invoke-virtual {v1, v2}, Ljava/util/Date;->before(Ljava/util/Date;)Z

    .line 113
    .line 114
    .line 115
    move-result v1

    .line 116
    if-eqz v1, :cond_6

    .line 117
    .line 118
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->u:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;

    .line 119
    .line 120
    const/4 p1, 0x4

    .line 121
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;->d(I)V

    .line 122
    .line 123
    .line 124
    return v0

    .line 125
    :cond_6
    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    .line 126
    .line 127
    .line 128
    move-result p2

    .line 129
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->g:I

    .line 130
    .line 131
    if-ne p2, p0, :cond_7

    .line 132
    .line 133
    sput p1, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->J:I

    .line 134
    .line 135
    :cond_7
    return v3
.end method

.method private i(Landroid/graphics/Canvas;)V
    .locals 11

    .line 1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->s:Ljava/lang/CharSequence;

    .line 2
    .line 3
    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    add-int/lit8 v1, v1, 0x1

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    move v3, v2

    .line 11
    :goto_0
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->s:Ljava/lang/CharSequence;

    .line 12
    .line 13
    invoke-interface {v4}, Ljava/lang/CharSequence;->length()I

    .line 14
    .line 15
    .line 16
    move-result v4

    .line 17
    if-ge v3, v4, :cond_1

    .line 18
    .line 19
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->s:Ljava/lang/CharSequence;

    .line 20
    .line 21
    invoke-interface {v4, v3}, Ljava/lang/CharSequence;->charAt(I)C

    .line 22
    .line 23
    .line 24
    move-result v4

    .line 25
    invoke-direct {p0, v4}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->q(C)Z

    .line 26
    .line 27
    .line 28
    move-result v4

    .line 29
    if-eqz v4, :cond_0

    .line 30
    .line 31
    move v1, v3

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    :goto_1
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->g:I

    .line 37
    .line 38
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->f:I

    .line 39
    .line 40
    if-le v1, v3, :cond_2

    .line 41
    .line 42
    mul-int/2addr v4, v1

    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->b:Landroid/graphics/Paint;

    .line 44
    .line 45
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->s:Ljava/lang/CharSequence;

    .line 46
    .line 47
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    float-to-int v1, v1

    .line 56
    add-int/2addr v4, v1

    .line 57
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->G:F

    .line 58
    .line 59
    :goto_2
    float-to-int v1, v1

    .line 60
    add-int/2addr v4, v1

    .line 61
    goto :goto_3

    .line 62
    :cond_2
    mul-int/2addr v4, v1

    .line 63
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->b:Landroid/graphics/Paint;

    .line 64
    .line 65
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->s:Ljava/lang/CharSequence;

    .line 66
    .line 67
    invoke-interface {v5, v2, v1}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-virtual {v3, v1}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    float-to-int v1, v1

    .line 80
    add-int/2addr v4, v1

    .line 81
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->G:F

    .line 82
    .line 83
    goto :goto_2

    .line 84
    :goto_3
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->e:I

    .line 85
    .line 86
    div-int/lit8 v2, v1, 0x2

    .line 87
    .line 88
    sget v3, Ll/qa00;->i:I

    .line 89
    .line 90
    sub-int/2addr v2, v3

    .line 91
    div-int/lit8 v1, v1, 0x2

    .line 92
    .line 93
    add-int/2addr v1, v3

    .line 94
    iget-boolean v3, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->w:Z

    .line 95
    .line 96
    if-eqz v3, :cond_3

    .line 97
    .line 98
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->x:I

    .line 99
    .line 100
    if-eqz v3, :cond_4

    .line 101
    .line 102
    add-int/2addr v4, v3

    .line 103
    int-to-float v6, v4

    .line 104
    int-to-float v7, v2

    .line 105
    int-to-float v9, v1

    .line 106
    iget-object v10, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->c:Landroid/graphics/Paint;

    .line 107
    .line 108
    move v8, v6

    .line 109
    move-object v5, p1

    .line 110
    invoke-virtual/range {v5 .. v10}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 111
    .line 112
    .line 113
    return-void

    .line 114
    :cond_3
    iget-boolean v3, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->r:Z

    .line 115
    .line 116
    if-nez v3, :cond_4

    .line 117
    .line 118
    iget-boolean v3, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->j:Z

    .line 119
    .line 120
    if-eqz v3, :cond_4

    .line 121
    .line 122
    invoke-virtual {p0}, Landroid/view/View;->hasFocus()Z

    .line 123
    .line 124
    .line 125
    move-result v3

    .line 126
    if-eqz v3, :cond_4

    .line 127
    .line 128
    int-to-float v3, v4

    .line 129
    int-to-float v2, v2

    .line 130
    int-to-float v4, v1

    .line 131
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->c:Landroid/graphics/Paint;

    .line 132
    .line 133
    move v1, v3

    .line 134
    move-object v0, p1

    .line 135
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 136
    .line 137
    .line 138
    :cond_4
    return-void
.end method

.method private j(Landroid/graphics/Canvas;Ljava/lang/CharSequence;)V
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    .line 4
    .line 5
    .line 6
    move-result v2

    .line 7
    if-ge v1, v2, :cond_1

    .line 8
    .line 9
    invoke-interface {p2, v1}, Ljava/lang/CharSequence;->charAt(I)C

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    invoke-direct {p0, v2}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->q(C)Z

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->b:Landroid/graphics/Paint;

    .line 18
    .line 19
    if-eqz v3, :cond_0

    .line 20
    .line 21
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->q:I

    .line 22
    .line 23
    invoke-virtual {v4, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 24
    .line 25
    .line 26
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->b:Landroid/graphics/Paint;

    .line 27
    .line 28
    sget-object v4, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 29
    .line 30
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 31
    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_0
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->p:I

    .line 35
    .line 36
    invoke-virtual {v4, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 37
    .line 38
    .line 39
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->b:Landroid/graphics/Paint;

    .line 40
    .line 41
    sget-object v4, Landroid/graphics/Paint$Style;->FILL_AND_STROKE:Landroid/graphics/Paint$Style;

    .line 42
    .line 43
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 44
    .line 45
    .line 46
    :goto_1
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->f:I

    .line 47
    .line 48
    add-int/lit8 v4, v1, 0x1

    .line 49
    .line 50
    mul-int/2addr v3, v4

    .line 51
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->b:Landroid/graphics/Paint;

    .line 52
    .line 53
    invoke-interface {p2, v0, v1}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v5, v1}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    float-to-int v1, v1

    .line 66
    add-int/2addr v3, v1

    .line 67
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->G:F

    .line 68
    .line 69
    float-to-int v1, v1

    .line 70
    add-int/2addr v3, v1

    .line 71
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->e:I

    .line 72
    .line 73
    div-int/lit8 v1, v1, 0x2

    .line 74
    .line 75
    int-to-float v1, v1

    .line 76
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->b:Landroid/graphics/Paint;

    .line 77
    .line 78
    invoke-virtual {v5}, Landroid/graphics/Paint;->descent()F

    .line 79
    .line 80
    .line 81
    move-result v5

    .line 82
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->b:Landroid/graphics/Paint;

    .line 83
    .line 84
    invoke-virtual {v6}, Landroid/graphics/Paint;->ascent()F

    .line 85
    .line 86
    .line 87
    move-result v6

    .line 88
    add-float/2addr v5, v6

    .line 89
    const/high16 v6, 0x40000000    # 2.0f

    .line 90
    .line 91
    div-float/2addr v5, v6

    .line 92
    sub-float/2addr v1, v5

    .line 93
    float-to-int v1, v1

    .line 94
    invoke-static {v2}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    int-to-float v3, v3

    .line 99
    int-to-float v1, v1

    .line 100
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->b:Landroid/graphics/Paint;

    .line 101
    .line 102
    invoke-virtual {p1, v2, v3, v1, v5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 103
    .line 104
    .line 105
    move v1, v4

    .line 106
    goto :goto_0

    .line 107
    :cond_1
    return-void
.end method

.method private k(ILjava/lang/CharSequence;)Z
    .locals 3

    .line 1
    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->E:Ljava/lang/CharSequence;

    .line 6
    .line 7
    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const/4 v2, 0x1

    .line 12
    if-lt v0, v1, :cond_0

    .line 13
    .line 14
    move v0, v2

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v0, 0x0

    .line 17
    :goto_0
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->E:Ljava/lang/CharSequence;

    .line 18
    .line 19
    if-eqz v0, :cond_3

    .line 20
    .line 21
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->y:I

    .line 22
    .line 23
    if-ne v0, v2, :cond_1

    .line 24
    .line 25
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->x(ILjava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    return p0

    .line 30
    :cond_1
    const/4 v1, 0x2

    .line 31
    if-ne v0, v1, :cond_2

    .line 32
    .line 33
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->t(ILjava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    return p0

    .line 38
    :cond_2
    const/4 v1, 0x3

    .line 39
    if-ne v0, v1, :cond_4

    .line 40
    .line 41
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->h(ILjava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    return p0

    .line 46
    :cond_3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->v()V

    .line 47
    .line 48
    .line 49
    :cond_4
    return v2
.end method

.method public static l(II)I
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    if-ne p1, v0, :cond_0

    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    if-ne p0, v0, :cond_1

    .line 6
    .line 7
    const/16 p0, 0x1d

    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    if-nez p1, :cond_1

    .line 11
    .line 12
    const/16 p0, 0x1f

    .line 13
    .line 14
    return p0

    .line 15
    :cond_1
    invoke-static {p0, p1}, Ll/pzi0;->r(II)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0
.end method

.method private m(Ljava/lang/CharSequence;)Ljava/lang/String;
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    move v2, v1

    .line 8
    :goto_0
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->g:I

    .line 9
    .line 10
    if-ge v1, v3, :cond_4

    .line 11
    .line 12
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    if-ge v2, v3, :cond_0

    .line 17
    .line 18
    invoke-interface {p1, v2}, Ljava/lang/CharSequence;->charAt(I)C

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    add-int/lit8 v2, v2, 0x1

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_0
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->y:I

    .line 29
    .line 30
    const/4 v4, 0x1

    .line 31
    if-ne v3, v4, :cond_1

    .line 32
    .line 33
    const-string v3, "Y"

    .line 34
    .line 35
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_1
    const/4 v4, 0x2

    .line 40
    if-ne v3, v4, :cond_2

    .line 41
    .line 42
    const-string v3, "M"

    .line 43
    .line 44
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_2
    const/4 v4, 0x3

    .line 49
    if-ne v3, v4, :cond_3

    .line 50
    .line 51
    const-string v3, "D"

    .line 52
    .line 53
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    :cond_3
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_4
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    return-object p0
.end method

.method private n()V
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/view/View;->setFocusable(Z)V

    .line 6
    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setCursorVisible(Z)V

    .line 10
    .line 11
    .line 12
    new-instance v2, Landroid/text/InputFilter$LengthFilter;

    .line 13
    .line 14
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->g:I

    .line 15
    .line 16
    invoke-direct {v2, v3}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    .line 17
    .line 18
    .line 19
    new-array v3, v0, [Landroid/text/InputFilter;

    .line 20
    .line 21
    aput-object v2, v3, v1

    .line 22
    .line 23
    invoke-virtual {p0, v3}, Landroid/widget/TextView;->setFilters([Landroid/text/InputFilter;)V

    .line 24
    .line 25
    .line 26
    new-instance v1, Landroid/graphics/Paint;

    .line 27
    .line 28
    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 32
    .line 33
    .line 34
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->o:I

    .line 35
    .line 36
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 37
    .line 38
    .line 39
    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 40
    .line 41
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 42
    .line 43
    .line 44
    const/high16 v2, 0x3f800000    # 1.0f

    .line 45
    .line 46
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 47
    .line 48
    .line 49
    new-instance v1, Landroid/graphics/Paint;

    .line 50
    .line 51
    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    .line 52
    .line 53
    .line 54
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->b:Landroid/graphics/Paint;

    .line 55
    .line 56
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 57
    .line 58
    .line 59
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->b:Landroid/graphics/Paint;

    .line 60
    .line 61
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 62
    .line 63
    .line 64
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->b:Landroid/graphics/Paint;

    .line 65
    .line 66
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->i:I

    .line 67
    .line 68
    int-to-float v2, v2

    .line 69
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 70
    .line 71
    .line 72
    new-instance v1, Landroid/graphics/Paint;

    .line 73
    .line 74
    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    .line 75
    .line 76
    .line 77
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->a:Landroid/graphics/Paint;

    .line 78
    .line 79
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 80
    .line 81
    .line 82
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->a:Landroid/graphics/Paint;

    .line 83
    .line 84
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->n:I

    .line 85
    .line 86
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 87
    .line 88
    .line 89
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->a:Landroid/graphics/Paint;

    .line 90
    .line 91
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->h:I

    .line 92
    .line 93
    int-to-float v2, v2

    .line 94
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 95
    .line 96
    .line 97
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->a:Landroid/graphics/Paint;

    .line 98
    .line 99
    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 100
    .line 101
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 102
    .line 103
    .line 104
    new-instance v1, Landroid/graphics/Paint;

    .line 105
    .line 106
    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    .line 107
    .line 108
    .line 109
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->c:Landroid/graphics/Paint;

    .line 110
    .line 111
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 112
    .line 113
    .line 114
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->c:Landroid/graphics/Paint;

    .line 115
    .line 116
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->m:I

    .line 117
    .line 118
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 119
    .line 120
    .line 121
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->c:Landroid/graphics/Paint;

    .line 122
    .line 123
    sget-object v1, Landroid/graphics/Paint$Style;->FILL_AND_STROKE:Landroid/graphics/Paint$Style;

    .line 124
    .line 125
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 126
    .line 127
    .line 128
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->c:Landroid/graphics/Paint;

    .line 129
    .line 130
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->l:I

    .line 131
    .line 132
    int-to-float v1, v1

    .line 133
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 134
    .line 135
    .line 136
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->c:Landroid/graphics/Paint;

    .line 137
    .line 138
    sget-object v1, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    .line 139
    .line 140
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 141
    .line 142
    .line 143
    new-instance v0, Landroid/graphics/RectF;

    .line 144
    .line 145
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 146
    .line 147
    .line 148
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->d:Landroid/graphics/RectF;

    .line 149
    .line 150
    const-string v0, ""

    .line 151
    .line 152
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->m(Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->s:Ljava/lang/CharSequence;

    .line 157
    .line 158
    return-void
.end method

.method public static o(III)V
    .locals 0

    .line 1
    sput p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->H:I

    .line 2
    .line 3
    add-int/lit8 p1, p1, -0x1

    .line 4
    .line 5
    sput p1, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->I:I

    .line 6
    .line 7
    sput p2, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->J:I

    .line 8
    .line 9
    return-void
.end method

.method private q(C)Z
    .locals 0

    .line 1
    const/16 p0, 0x4d

    if-eq p0, p1, :cond_1

    const/16 p0, 0x44

    if-eq p0, p1, :cond_1

    const/16 p0, 0x59

    if-ne p0, p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method private synthetic r()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->u:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/appcompat/widget/AppCompatEditText;->getText()Landroid/text/Editable;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Landroidx/appcompat/widget/AppCompatEditText;->getText()Landroid/text/Editable;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->u:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;

    .line 22
    .line 23
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;->c()V

    .line 24
    .line 25
    .line 26
    const/4 p0, 0x1

    .line 27
    return p0

    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    return p0
.end method

.method private synthetic s(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->x:I

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private t(ILjava/lang/CharSequence;)Z
    .locals 9

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Ll/bsj0;->m(I)Ljava/util/Date;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->u:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;

    .line 7
    .line 8
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    const/4 v3, 0x1

    .line 13
    if-eqz v2, :cond_c

    .line 14
    .line 15
    const/16 v2, 0xc

    .line 16
    .line 17
    const/4 v4, 0x5

    .line 18
    if-le p1, v2, :cond_0

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->u:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;

    .line 21
    .line 22
    invoke-interface {p0, v4}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;->d(I)V

    .line 23
    .line 24
    .line 25
    return v0

    .line 26
    :cond_0
    const/4 v2, 0x4

    .line 27
    const/4 v5, 0x6

    .line 28
    const/4 v6, 0x2

    .line 29
    if-gt p1, v3, :cond_1

    .line 30
    .line 31
    if-ne p1, v3, :cond_5

    .line 32
    .line 33
    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    .line 34
    .line 35
    .line 36
    move-result v7

    .line 37
    if-ne v7, v6, :cond_5

    .line 38
    .line 39
    :cond_1
    sget v7, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->J:I

    .line 40
    .line 41
    if-lez v7, :cond_2

    .line 42
    .line 43
    sget v7, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->H:I

    .line 44
    .line 45
    invoke-static {v7, p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->l(II)I

    .line 46
    .line 47
    .line 48
    move-result v7

    .line 49
    sget v8, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->J:I

    .line 50
    .line 51
    if-ge v7, v8, :cond_2

    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->u:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;

    .line 54
    .line 55
    invoke-interface {p0, v4}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;->d(I)V

    .line 56
    .line 57
    .line 58
    return v0

    .line 59
    :cond_2
    sget v4, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->H:I

    .line 60
    .line 61
    iget-object v7, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->C:Ljava/util/Date;

    .line 62
    .line 63
    invoke-virtual {v7}, Ljava/util/Date;->getYear()I

    .line 64
    .line 65
    .line 66
    move-result v7

    .line 67
    add-int/lit16 v7, v7, 0x76c

    .line 68
    .line 69
    if-ne v4, v7, :cond_4

    .line 70
    .line 71
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->C:Ljava/util/Date;

    .line 72
    .line 73
    invoke-virtual {v4}, Ljava/util/Date;->getMonth()I

    .line 74
    .line 75
    .line 76
    move-result v4

    .line 77
    add-int/2addr v4, v3

    .line 78
    if-le p1, v4, :cond_4

    .line 79
    .line 80
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->u:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;

    .line 81
    .line 82
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->F:Z

    .line 83
    .line 84
    if-eqz p0, :cond_3

    .line 85
    .line 86
    move v3, v5

    .line 87
    :cond_3
    invoke-interface {p1, v3}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;->d(I)V

    .line 88
    .line 89
    .line 90
    return v0

    .line 91
    :cond_4
    sget v4, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->H:I

    .line 92
    .line 93
    iget-object v7, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->D:Ljava/util/Date;

    .line 94
    .line 95
    invoke-virtual {v7}, Ljava/util/Date;->getYear()I

    .line 96
    .line 97
    .line 98
    move-result v7

    .line 99
    add-int/lit16 v7, v7, 0x76c

    .line 100
    .line 101
    if-ne v4, v7, :cond_5

    .line 102
    .line 103
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->D:Ljava/util/Date;

    .line 104
    .line 105
    invoke-virtual {v4}, Ljava/util/Date;->getMonth()I

    .line 106
    .line 107
    .line 108
    move-result v4

    .line 109
    add-int/2addr v4, v3

    .line 110
    if-ge p1, v4, :cond_5

    .line 111
    .line 112
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->u:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;

    .line 113
    .line 114
    invoke-interface {p0, v2}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;->d(I)V

    .line 115
    .line 116
    .line 117
    return v0

    .line 118
    :cond_5
    sget v4, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->J:I

    .line 119
    .line 120
    if-lez v4, :cond_a

    .line 121
    .line 122
    sget v4, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->H:I

    .line 123
    .line 124
    if-lez v4, :cond_a

    .line 125
    .line 126
    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    .line 127
    .line 128
    .line 129
    move-result v4

    .line 130
    if-eq v4, v6, :cond_6

    .line 131
    .line 132
    if-le p1, v3, :cond_a

    .line 133
    .line 134
    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    .line 135
    .line 136
    .line 137
    move-result v4

    .line 138
    if-ne v4, v3, :cond_a

    .line 139
    .line 140
    :cond_6
    sget v4, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->H:I

    .line 141
    .line 142
    add-int/lit16 v4, v4, -0x76c

    .line 143
    .line 144
    invoke-virtual {v1, v4}, Ljava/util/Date;->setYear(I)V

    .line 145
    .line 146
    .line 147
    if-nez p1, :cond_7

    .line 148
    .line 149
    move v4, v0

    .line 150
    goto :goto_0

    .line 151
    :cond_7
    add-int/lit8 v4, p1, -0x1

    .line 152
    .line 153
    :goto_0
    invoke-virtual {v1, v4}, Ljava/util/Date;->setMonth(I)V

    .line 154
    .line 155
    .line 156
    sget v4, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->J:I

    .line 157
    .line 158
    invoke-virtual {v1, v4}, Ljava/util/Date;->setDate(I)V

    .line 159
    .line 160
    .line 161
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->C:Ljava/util/Date;

    .line 162
    .line 163
    invoke-virtual {v1, v4}, Ljava/util/Date;->after(Ljava/util/Date;)Z

    .line 164
    .line 165
    .line 166
    move-result v4

    .line 167
    if-eqz v4, :cond_9

    .line 168
    .line 169
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->u:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;

    .line 170
    .line 171
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->F:Z

    .line 172
    .line 173
    if-eqz p0, :cond_8

    .line 174
    .line 175
    move v3, v5

    .line 176
    :cond_8
    invoke-interface {p1, v3}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;->d(I)V

    .line 177
    .line 178
    .line 179
    return v0

    .line 180
    :cond_9
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->D:Ljava/util/Date;

    .line 181
    .line 182
    invoke-virtual {v1, v4}, Ljava/util/Date;->before(Ljava/util/Date;)Z

    .line 183
    .line 184
    .line 185
    move-result v1

    .line 186
    if-eqz v1, :cond_a

    .line 187
    .line 188
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->u:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;

    .line 189
    .line 190
    invoke-interface {p0, v2}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;->d(I)V

    .line 191
    .line 192
    .line 193
    return v0

    .line 194
    :cond_a
    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    .line 195
    .line 196
    .line 197
    move-result p2

    .line 198
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->g:I

    .line 199
    .line 200
    if-ne p2, p0, :cond_c

    .line 201
    .line 202
    if-nez p1, :cond_b

    .line 203
    .line 204
    goto :goto_1

    .line 205
    :cond_b
    add-int/lit8 v0, p1, -0x1

    .line 206
    .line 207
    :goto_1
    sput v0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->I:I

    .line 208
    .line 209
    :cond_c
    return v3
.end method

.method private u(III)Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    if-ge p1, p2, :cond_0

    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->u:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;

    .line 5
    .line 6
    const/4 p1, 0x4

    .line 7
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;->d(I)V

    .line 8
    .line 9
    .line 10
    return v0

    .line 11
    :cond_0
    const/4 p2, 0x1

    .line 12
    if-le p1, p3, :cond_2

    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->u:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;

    .line 15
    .line 16
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->F:Z

    .line 17
    .line 18
    if-eqz p0, :cond_1

    .line 19
    .line 20
    const/4 p2, 0x6

    .line 21
    :cond_1
    invoke-interface {p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;->d(I)V

    .line 22
    .line 23
    .line 24
    return v0

    .line 25
    :cond_2
    return p2
.end method

.method private v()V
    .locals 2

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->y:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    const/4 v1, -0x1

    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    sput v1, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->H:I

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    const/4 v0, 0x2

    .line 11
    if-ne p0, v0, :cond_1

    .line 12
    .line 13
    sput v1, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->I:I

    .line 14
    .line 15
    return-void

    .line 16
    :cond_1
    const/4 v0, 0x3

    .line 17
    if-ne p0, v0, :cond_2

    .line 18
    .line 19
    sput v1, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->J:I

    .line 20
    .line 21
    :cond_2
    return-void
.end method

.method private w()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->t:Ljava/lang/CharSequence;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->w:Z

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->w:Z

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    const/4 v2, 0x3

    .line 15
    const/4 v3, -0x3

    .line 16
    filled-new-array {v3, v1, v2}, [I

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    const-wide/16 v2, 0x96

    .line 25
    .line 26
    invoke-virtual {v1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 27
    .line 28
    .line 29
    const/4 v2, 0x2

    .line 30
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1, v0}, Landroid/animation/ValueAnimator;->setRepeatMode(I)V

    .line 34
    .line 35
    .line 36
    new-instance v0, Ll/k8c;

    .line 37
    .line 38
    invoke-direct {v0, p0}, Ll/k8c;-><init>(Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 42
    .line 43
    .line 44
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$b;

    .line 45
    .line 46
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$b;-><init>(Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->start()V

    .line 53
    .line 54
    .line 55
    :cond_0
    return-void
.end method

.method private x(ILjava/lang/CharSequence;)Z
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Ll/bsj0;->m(I)Ljava/util/Date;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->u:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;

    .line 7
    .line 8
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    const/4 v3, 0x1

    .line 13
    if-eqz v2, :cond_a

    .line 14
    .line 15
    const/16 v2, 0xa

    .line 16
    .line 17
    if-ge p1, v2, :cond_0

    .line 18
    .line 19
    const/4 p2, 0x2

    .line 20
    invoke-direct {p0, p1, v3, p2}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->u(III)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0

    .line 25
    :cond_0
    const/16 v4, 0x64

    .line 26
    .line 27
    if-ge p1, v4, :cond_1

    .line 28
    .line 29
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->D:Ljava/util/Date;

    .line 30
    .line 31
    invoke-virtual {p2}, Ljava/util/Date;->getYear()I

    .line 32
    .line 33
    .line 34
    move-result p2

    .line 35
    add-int/lit16 p2, p2, 0x76c

    .line 36
    .line 37
    div-int/2addr p2, v4

    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->C:Ljava/util/Date;

    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/util/Date;->getYear()I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    add-int/lit16 v0, v0, 0x76c

    .line 45
    .line 46
    div-int/2addr v0, v4

    .line 47
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->u(III)Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    return p0

    .line 52
    :cond_1
    const/16 v4, 0x3e8

    .line 53
    .line 54
    if-ge p1, v4, :cond_2

    .line 55
    .line 56
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->D:Ljava/util/Date;

    .line 57
    .line 58
    invoke-virtual {p2}, Ljava/util/Date;->getYear()I

    .line 59
    .line 60
    .line 61
    move-result p2

    .line 62
    add-int/lit16 p2, p2, 0x76c

    .line 63
    .line 64
    div-int/2addr p2, v2

    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->C:Ljava/util/Date;

    .line 66
    .line 67
    invoke-virtual {v0}, Ljava/util/Date;->getYear()I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    add-int/lit16 v0, v0, 0x76c

    .line 72
    .line 73
    div-int/2addr v0, v2

    .line 74
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->u(III)Z

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    return p0

    .line 79
    :cond_2
    sget v2, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->J:I

    .line 80
    .line 81
    if-lez v2, :cond_3

    .line 82
    .line 83
    sget v2, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->I:I

    .line 84
    .line 85
    add-int/2addr v2, v3

    .line 86
    invoke-static {p1, v2}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->l(II)I

    .line 87
    .line 88
    .line 89
    move-result v2

    .line 90
    sget v4, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->J:I

    .line 91
    .line 92
    if-ge v2, v4, :cond_3

    .line 93
    .line 94
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->u:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;

    .line 95
    .line 96
    const/4 p1, 0x5

    .line 97
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;->d(I)V

    .line 98
    .line 99
    .line 100
    return v0

    .line 101
    :cond_3
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->D:Ljava/util/Date;

    .line 102
    .line 103
    invoke-virtual {v2}, Ljava/util/Date;->getYear()I

    .line 104
    .line 105
    .line 106
    move-result v2

    .line 107
    add-int/lit16 v2, v2, 0x76c

    .line 108
    .line 109
    const/4 v4, 0x4

    .line 110
    if-ge p1, v2, :cond_4

    .line 111
    .line 112
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->u:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;

    .line 113
    .line 114
    invoke-interface {p0, v4}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;->d(I)V

    .line 115
    .line 116
    .line 117
    return v0

    .line 118
    :cond_4
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->C:Ljava/util/Date;

    .line 119
    .line 120
    invoke-virtual {v2}, Ljava/util/Date;->getYear()I

    .line 121
    .line 122
    .line 123
    move-result v2

    .line 124
    add-int/lit16 v2, v2, 0x76c

    .line 125
    .line 126
    const/4 v5, 0x6

    .line 127
    if-le p1, v2, :cond_6

    .line 128
    .line 129
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->u:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;

    .line 130
    .line 131
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->F:Z

    .line 132
    .line 133
    if-eqz p0, :cond_5

    .line 134
    .line 135
    move v3, v5

    .line 136
    :cond_5
    invoke-interface {p1, v3}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;->d(I)V

    .line 137
    .line 138
    .line 139
    return v0

    .line 140
    :cond_6
    sget v2, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->J:I

    .line 141
    .line 142
    if-ltz v2, :cond_9

    .line 143
    .line 144
    sget v2, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->I:I

    .line 145
    .line 146
    if-ltz v2, :cond_9

    .line 147
    .line 148
    add-int/lit16 v2, p1, -0x76c

    .line 149
    .line 150
    invoke-virtual {v1, v2}, Ljava/util/Date;->setYear(I)V

    .line 151
    .line 152
    .line 153
    sget v2, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->I:I

    .line 154
    .line 155
    invoke-virtual {v1, v2}, Ljava/util/Date;->setMonth(I)V

    .line 156
    .line 157
    .line 158
    sget v2, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->J:I

    .line 159
    .line 160
    invoke-virtual {v1, v2}, Ljava/util/Date;->setDate(I)V

    .line 161
    .line 162
    .line 163
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->C:Ljava/util/Date;

    .line 164
    .line 165
    invoke-virtual {v1, v2}, Ljava/util/Date;->after(Ljava/util/Date;)Z

    .line 166
    .line 167
    .line 168
    move-result v2

    .line 169
    if-eqz v2, :cond_8

    .line 170
    .line 171
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->u:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;

    .line 172
    .line 173
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->F:Z

    .line 174
    .line 175
    if-eqz p0, :cond_7

    .line 176
    .line 177
    move v3, v5

    .line 178
    :cond_7
    invoke-interface {p1, v3}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;->d(I)V

    .line 179
    .line 180
    .line 181
    return v0

    .line 182
    :cond_8
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->D:Ljava/util/Date;

    .line 183
    .line 184
    invoke-virtual {v1, v2}, Ljava/util/Date;->before(Ljava/util/Date;)Z

    .line 185
    .line 186
    .line 187
    move-result v1

    .line 188
    if-eqz v1, :cond_9

    .line 189
    .line 190
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->u:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;

    .line 191
    .line 192
    invoke-interface {p0, v4}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;->d(I)V

    .line 193
    .line 194
    .line 195
    return v0

    .line 196
    :cond_9
    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    .line 197
    .line 198
    .line 199
    move-result p2

    .line 200
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->g:I

    .line 201
    .line 202
    if-ne p2, p0, :cond_a

    .line 203
    .line 204
    sput p1, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->H:I

    .line 205
    .line 206
    :cond_a
    return v3
.end method


# virtual methods
.method public getFinalNum()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->B:I

    .line 2
    .line 3
    return p0
.end method

.method public onAttachedToWindow()V
    .locals 8

    .line 1
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->v:Ljava/util/Timer;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    new-instance v0, Ljava/util/Timer;

    .line 13
    .line 14
    const-string v1, "DateEditTextNew-Core-Thread"

    .line 15
    .line 16
    invoke-direct {v0, v1}, Ljava/util/Timer;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->v:Ljava/util/Timer;

    .line 20
    .line 21
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->v:Ljava/util/Timer;

    .line 22
    .line 23
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->g()Ljava/util/TimerTask;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->k:I

    .line 28
    .line 29
    int-to-long v6, p0

    .line 30
    const-wide/16 v4, 0x0

    .line 31
    .line 32
    invoke-virtual/range {v2 .. v7}, Ljava/util/Timer;->scheduleAtFixedRate(Ljava/util/TimerTask;JJ)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public onCreateInputConnection(Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->A:Lcom/p1/mobile/putong/core/ui/profile/loop/input/a;

    .line 2
    .line 3
    invoke-super {p0, p1}, Landroidx/appcompat/widget/AppCompatEditText;->onCreateInputConnection(Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {v0, p1}, Landroid/view/inputmethod/InputConnectionWrapper;->setTarget(Landroid/view/inputmethod/InputConnection;)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->A:Lcom/p1/mobile/putong/core/ui/profile/loop/input/a;

    .line 11
    .line 12
    new-instance v0, Ll/i8c;

    .line 13
    .line 14
    invoke-direct {v0, p0}, Ll/i8c;-><init>(Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/a;->a(Lcom/p1/mobile/putong/core/ui/profile/loop/input/a$a;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->A:Lcom/p1/mobile/putong/core/ui/profile/loop/input/a;

    .line 21
    .line 22
    return-object p0
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->v:Ljava/util/Timer;

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->v:Ljava/util/Timer;

    .line 11
    .line 12
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->b:Landroid/graphics/Paint;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->s:Ljava/lang/CharSequence;

    .line 4
    .line 5
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    int-to-float v1, v1

    .line 18
    sub-float/2addr v1, v0

    .line 19
    const/high16 v0, 0x40000000    # 2.0f

    .line 20
    .line 21
    div-float/2addr v1, v0

    .line 22
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->G:F

    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->s:Ljava/lang/CharSequence;

    .line 25
    .line 26
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->j(Landroid/graphics/Canvas;Ljava/lang/CharSequence;)V

    .line 27
    .line 28
    .line 29
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->i(Landroid/graphics/Canvas;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public onSelectionChanged(II)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/widget/AppCompatEditText;->getText()Landroid/text/Editable;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-ne p1, v1, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eq p2, v1, :cond_1

    .line 18
    .line 19
    :cond_0
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    invoke-virtual {p0, p1, p2}, Landroid/widget/EditText;->setSelection(II)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    invoke-super {p0, p1, p2}, Landroid/widget/TextView;->onSelectionChanged(II)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public onSizeChanged(IIII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    .line 2
    .line 3
    .line 4
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->e:I

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->d:Landroid/graphics/RectF;

    .line 7
    .line 8
    int-to-float p1, p1

    .line 9
    int-to-float p2, p2

    .line 10
    const/4 p3, 0x0

    .line 11
    invoke-virtual {p0, p3, p3, p1, p2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/TextView;->onTextChanged(Ljava/lang/CharSequence;III)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 5
    .line 6
    .line 7
    move-result p2

    .line 8
    if-eqz p2, :cond_0

    .line 9
    .line 10
    const-string p1, ""

    .line 11
    .line 12
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->m(Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->s:Ljava/lang/CharSequence;

    .line 17
    .line 18
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->t:Ljava/lang/CharSequence;

    .line 19
    .line 20
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->v()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    :try_start_0
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->B:I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    .line 41
    :catch_0
    iget p2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->B:I

    .line 42
    .line 43
    const/4 p3, -0x1

    .line 44
    if-eq p2, p3, :cond_8

    .line 45
    .line 46
    invoke-direct {p0, p2, p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->k(ILjava/lang/CharSequence;)Z

    .line 47
    .line 48
    .line 49
    move-result p2

    .line 50
    const-string p4, "00"

    .line 51
    .line 52
    const-string v0, "0"

    .line 53
    .line 54
    if-eqz p2, :cond_6

    .line 55
    .line 56
    invoke-virtual {p4, p1}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    .line 57
    .line 58
    .line 59
    move-result p2

    .line 60
    if-nez p2, :cond_6

    .line 61
    .line 62
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->t:Ljava/lang/CharSequence;

    .line 67
    .line 68
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p2

    .line 72
    invoke-direct {p0, p2}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->m(Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p2

    .line 76
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->s:Ljava/lang/CharSequence;

    .line 77
    .line 78
    iget p2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->y:I

    .line 79
    .line 80
    const/4 p3, 0x2

    .line 81
    const/4 p4, 0x1

    .line 82
    if-ne p2, p3, :cond_2

    .line 83
    .line 84
    iget p2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->B:I

    .line 85
    .line 86
    if-le p2, p4, :cond_1

    .line 87
    .line 88
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 89
    .line 90
    .line 91
    move-result p2

    .line 92
    if-ne p2, p4, :cond_1

    .line 93
    .line 94
    new-instance p2, Ljava/lang/StringBuilder;

    .line 95
    .line 96
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    iget p3, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->B:I

    .line 100
    .line 101
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object p2

    .line 108
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->t:Ljava/lang/CharSequence;

    .line 109
    .line 110
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 111
    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 115
    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_2
    const/4 p3, 0x3

    .line 119
    if-ne p2, p3, :cond_4

    .line 120
    .line 121
    iget p2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->B:I

    .line 122
    .line 123
    if-le p2, p3, :cond_3

    .line 124
    .line 125
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 126
    .line 127
    .line 128
    move-result p2

    .line 129
    if-ne p2, p4, :cond_3

    .line 130
    .line 131
    new-instance p2, Ljava/lang/StringBuilder;

    .line 132
    .line 133
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    iget p3, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->B:I

    .line 137
    .line 138
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object p2

    .line 145
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->t:Ljava/lang/CharSequence;

    .line 146
    .line 147
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 148
    .line 149
    .line 150
    goto :goto_0

    .line 151
    :cond_3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 152
    .line 153
    .line 154
    goto :goto_0

    .line 155
    :cond_4
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 156
    .line 157
    .line 158
    :goto_0
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->u:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;

    .line 159
    .line 160
    if-eqz p2, :cond_8

    .line 161
    .line 162
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 163
    .line 164
    .line 165
    move-result p1

    .line 166
    iget p2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->g:I

    .line 167
    .line 168
    if-ne p1, p2, :cond_5

    .line 169
    .line 170
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->u:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;

    .line 171
    .line 172
    iget p2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->B:I

    .line 173
    .line 174
    invoke-interface {p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;->b(I)V

    .line 175
    .line 176
    .line 177
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->u:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;

    .line 178
    .line 179
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->B:I

    .line 180
    .line 181
    invoke-interface {p1, p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;->a(I)V

    .line 182
    .line 183
    .line 184
    goto :goto_2

    .line 185
    :cond_6
    invoke-virtual {p4, p1}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    .line 186
    .line 187
    .line 188
    move-result p1

    .line 189
    if-eqz p1, :cond_7

    .line 190
    .line 191
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 192
    .line 193
    .line 194
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->u:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;

    .line 195
    .line 196
    const/4 p2, 0x5

    .line 197
    invoke-interface {p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;->d(I)V

    .line 198
    .line 199
    .line 200
    goto :goto_1

    .line 201
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->u:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;

    .line 202
    .line 203
    invoke-interface {p1, p3}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;->d(I)V

    .line 204
    .line 205
    .line 206
    :goto_1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->w()V

    .line 207
    .line 208
    .line 209
    :cond_8
    :goto_2
    return-void
.end method

.method public onTextContextMenuItem(I)Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public p()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/widget/AppCompatEditText;->getText()Landroid/text/Editable;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Landroidx/appcompat/widget/AppCompatEditText;->getText()Landroid/text/Editable;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->g:I

    .line 20
    .line 21
    if-ne v0, p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public setNormalAge(I)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->F:Z

    .line 3
    .line 4
    invoke-static {p1}, Ll/bsj0;->m(I)Ljava/util/Date;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->C:Ljava/util/Date;

    .line 9
    .line 10
    return-void
.end method

.method public setTextChangedListener(Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->u:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;

    .line 2
    .line 3
    return-void
.end method

.method public setTextColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->p:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
