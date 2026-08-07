.class public Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;
.super Landroidx/appcompat/widget/AppCompatEditText;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew$c;
    }
.end annotation


# static fields
.field public static F:I = -0x1

.field public static G:I = -0x1

.field public static H:I = -0x1


# instance fields
.field public A:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/b;

.field public B:I

.field public C:Ljava/util/Date;

.field public D:Ljava/util/Date;

.field public E:Ljava/lang/CharSequence;

.field public a:Landroid/graphics/Paint;

.field public b:Landroid/graphics/Paint;

.field public c:Landroid/graphics/Paint;

.field public d:Landroid/graphics/RectF;

.field public e:Landroid/graphics/RectF;

.field public f:I

.field public g:I

.field public h:I

.field public i:I

.field public j:I

.field public k:Z

.field public l:I

.field public m:I

.field public n:I

.field public o:I

.field public p:I

.field public q:I

.field public r:I

.field public s:Z

.field public t:Ljava/lang/CharSequence;

.field public u:Ljava/lang/CharSequence;

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

    .line 236
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 235
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

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
    iput-object p3, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->t:Ljava/lang/CharSequence;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->u:Ljava/lang/CharSequence;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-boolean v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->w:Z

    .line 12
    .line 13
    iput v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->x:I

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
    iput v2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->z:I

    .line 21
    .line 22
    const/4 v2, -0x1

    .line 23
    iput v2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->B:I

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
    iput-object v2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->C:Ljava/util/Date;

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
    iput-object v2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->D:Ljava/util/Date;

    .line 40
    .line 41
    iput-object p3, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->E:Ljava/lang/CharSequence;

    .line 42
    .line 43
    new-instance p3, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/b;

    .line 44
    .line 45
    const/4 v2, 0x0

    .line 46
    const/4 v3, 0x1

    .line 47
    invoke-direct {p3, v2, v3}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/b;-><init>(Landroid/view/inputmethod/InputConnection;Z)V

    .line 48
    .line 49
    .line 50
    iput-object p3, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->A:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/b;

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Landroid/view/View;->setLongClickable(Z)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextIsSelectable(Z)V

    .line 56
    .line 57
    .line 58
    new-instance p3, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew$a;

    .line 59
    .line 60
    invoke-direct {p3, p0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew$a;-><init>(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0, p3}, Landroidx/appcompat/widget/AppCompatEditText;->setCustomSelectionActionModeCallback(Landroid/view/ActionMode$Callback;)V

    .line 64
    .line 65
    .line 66
    sget-object p3, Ll/ihc0;->a:[I

    .line 67
    .line 68
    invoke-virtual {p1, p2, p3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    sget p2, Ll/ihc0;->k:I

    .line 73
    .line 74
    invoke-virtual {p1, p2, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 75
    .line 76
    .line 77
    move-result p2

    .line 78
    iput-boolean p2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->k:Z

    .line 79
    .line 80
    sget p2, Ll/ihc0;->d:I

    .line 81
    .line 82
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 83
    .line 84
    .line 85
    move-result-object p3

    .line 86
    sget v0, Ll/a9c0;->f:I

    .line 87
    .line 88
    invoke-static {p3, v0}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 89
    .line 90
    .line 91
    move-result p3

    .line 92
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 93
    .line 94
    .line 95
    move-result p2

    .line 96
    iput p2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->o:I

    .line 97
    .line 98
    sget p2, Ll/ihc0;->b:I

    .line 99
    .line 100
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 101
    .line 102
    .line 103
    move-result-object p3

    .line 104
    sget v0, Ll/a9c0;->c:I

    .line 105
    .line 106
    invoke-static {p3, v0}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 107
    .line 108
    .line 109
    move-result p3

    .line 110
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 111
    .line 112
    .line 113
    move-result p2

    .line 114
    iput p2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->p:I

    .line 115
    .line 116
    sget p2, Ll/ihc0;->l:I

    .line 117
    .line 118
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 119
    .line 120
    .line 121
    move-result-object p3

    .line 122
    sget v0, Ll/a9c0;->f:I

    .line 123
    .line 124
    invoke-static {p3, v0}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 125
    .line 126
    .line 127
    move-result p3

    .line 128
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 129
    .line 130
    .line 131
    move-result p2

    .line 132
    iput p2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->q:I

    .line 133
    .line 134
    sget p2, Ll/ihc0;->i:I

    .line 135
    .line 136
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 137
    .line 138
    .line 139
    move-result-object p3

    .line 140
    sget v0, Ll/a9c0;->g:I

    .line 141
    .line 142
    invoke-static {p3, v0}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 143
    .line 144
    .line 145
    move-result p3

    .line 146
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 147
    .line 148
    .line 149
    move-result p2

    .line 150
    iput p2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->r:I

    .line 151
    .line 152
    sget p2, Ll/ihc0;->f:I

    .line 153
    .line 154
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 155
    .line 156
    .line 157
    move-result-object p3

    .line 158
    sget v0, Ll/a9c0;->f:I

    .line 159
    .line 160
    invoke-static {p3, v0}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 161
    .line 162
    .line 163
    move-result p3

    .line 164
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 165
    .line 166
    .line 167
    move-result p2

    .line 168
    iput p2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->n:I

    .line 169
    .line 170
    sget p2, Ll/ihc0;->c:I

    .line 171
    .line 172
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 173
    .line 174
    .line 175
    move-result p2

    .line 176
    float-to-int p2, p2

    .line 177
    iput p2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->h:I

    .line 178
    .line 179
    sget p2, Ll/ihc0;->j:I

    .line 180
    .line 181
    const/4 p3, 0x6

    .line 182
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 183
    .line 184
    .line 185
    move-result p2

    .line 186
    iput p2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->i:I

    .line 187
    .line 188
    sget p2, Ll/ihc0;->m:I

    .line 189
    .line 190
    invoke-virtual {p1, p2, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 191
    .line 192
    .line 193
    move-result p2

    .line 194
    iput p2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->y:I

    .line 195
    .line 196
    sget p2, Ll/ihc0;->g:I

    .line 197
    .line 198
    const/16 p3, 0x1f4

    .line 199
    .line 200
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 201
    .line 202
    .line 203
    move-result p2

    .line 204
    iput p2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->l:I

    .line 205
    .line 206
    sget p2, Ll/ihc0;->h:I

    .line 207
    .line 208
    const/high16 p3, 0x40000000    # 2.0f

    .line 209
    .line 210
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 211
    .line 212
    .line 213
    move-result p2

    .line 214
    float-to-int p2, p2

    .line 215
    iput p2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->m:I

    .line 216
    .line 217
    sget p2, Ll/ihc0;->e:I

    .line 218
    .line 219
    const/high16 p3, 0x40a00000    # 5.0f

    .line 220
    .line 221
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 222
    .line 223
    .line 224
    move-result p2

    .line 225
    float-to-int p2, p2

    .line 226
    iput p2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->j:I

    .line 227
    .line 228
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 229
    .line 230
    .line 231
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->l()V

    .line 232
    .line 233
    .line 234
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->n()Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->s:Z

    return p0
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->w:Z

    return p0
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->s:Z

    return-void
.end method

.method public static j(II)I
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


# virtual methods
.method public final e()Ljava/util/TimerTask;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew$b;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew$b;-><init>(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public final f(ILjava/lang/CharSequence;)Z
    .locals 7

    .line 1
    const/4 v0, -0x1

    .line 2
    sput v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->H:I

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-static {v0}, Ll/bsj0;->m(I)Ljava/util/Date;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    const/4 v3, 0x1

    .line 15
    if-eqz v2, :cond_7

    .line 16
    .line 17
    sget v2, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->F:I

    .line 18
    .line 19
    sget v4, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->G:I

    .line 20
    .line 21
    add-int/2addr v4, v3

    .line 22
    invoke-static {v2, v4}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->j(II)I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    .line 27
    .line 28
    .line 29
    move-result v4

    .line 30
    const/4 v5, 0x2

    .line 31
    if-ne v4, v5, :cond_0

    .line 32
    .line 33
    if-gt p1, v2, :cond_1

    .line 34
    .line 35
    :cond_0
    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    const/4 v6, 0x3

    .line 40
    if-ne v4, v3, :cond_2

    .line 41
    .line 42
    if-gt p1, v6, :cond_2

    .line 43
    .line 44
    div-int/lit8 v2, v2, 0xa

    .line 45
    .line 46
    if-gt p1, v2, :cond_1

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    throw v1

    .line 50
    :cond_2
    :goto_0
    sget v2, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->F:I

    .line 51
    .line 52
    const/16 v4, 0x76c

    .line 53
    .line 54
    if-le v2, v4, :cond_6

    .line 55
    .line 56
    sget v2, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->G:I

    .line 57
    .line 58
    if-ltz v2, :cond_6

    .line 59
    .line 60
    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    if-eq v2, v5, :cond_3

    .line 65
    .line 66
    if-le p1, v6, :cond_6

    .line 67
    .line 68
    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    if-ne v2, v3, :cond_6

    .line 73
    .line 74
    :cond_3
    sget v2, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->F:I

    .line 75
    .line 76
    sub-int/2addr v2, v4

    .line 77
    invoke-virtual {v0, v2}, Ljava/util/Date;->setYear(I)V

    .line 78
    .line 79
    .line 80
    sget v2, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->G:I

    .line 81
    .line 82
    invoke-virtual {v0, v2}, Ljava/util/Date;->setMonth(I)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v0, p1}, Ljava/util/Date;->setDate(I)V

    .line 86
    .line 87
    .line 88
    iget-object v2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->C:Ljava/util/Date;

    .line 89
    .line 90
    invoke-virtual {v0, v2}, Ljava/util/Date;->after(Ljava/util/Date;)Z

    .line 91
    .line 92
    .line 93
    move-result v2

    .line 94
    if-nez v2, :cond_5

    .line 95
    .line 96
    iget-object v2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->D:Ljava/util/Date;

    .line 97
    .line 98
    invoke-virtual {v0, v2}, Ljava/util/Date;->before(Ljava/util/Date;)Z

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    if-nez v0, :cond_4

    .line 103
    .line 104
    goto :goto_1

    .line 105
    :cond_4
    throw v1

    .line 106
    :cond_5
    throw v1

    .line 107
    :cond_6
    :goto_1
    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    .line 108
    .line 109
    .line 110
    move-result p2

    .line 111
    iget p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->i:I

    .line 112
    .line 113
    if-ne p2, p0, :cond_7

    .line 114
    .line 115
    sput p1, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->H:I

    .line 116
    .line 117
    :cond_7
    return v3
.end method

.method public final g(Landroid/graphics/Canvas;)V
    .locals 11

    .line 1
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->t:Ljava/lang/CharSequence;

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
    iget-object v4, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->t:Ljava/lang/CharSequence;

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
    iget-object v4, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->t:Ljava/lang/CharSequence;

    .line 20
    .line 21
    invoke-interface {v4, v3}, Ljava/lang/CharSequence;->charAt(I)C

    .line 22
    .line 23
    .line 24
    move-result v4

    .line 25
    invoke-virtual {p0, v4}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->m(C)Z

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
    iget-object v3, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->b:Landroid/graphics/Paint;

    .line 37
    .line 38
    iget-object v4, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->t:Ljava/lang/CharSequence;

    .line 39
    .line 40
    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    float-to-int v3, v3

    .line 49
    iget v4, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->h:I

    .line 50
    .line 51
    iget-object v5, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->t:Ljava/lang/CharSequence;

    .line 52
    .line 53
    invoke-interface {v5}, Ljava/lang/CharSequence;->length()I

    .line 54
    .line 55
    .line 56
    move-result v5

    .line 57
    add-int/lit8 v5, v5, -0x1

    .line 58
    .line 59
    mul-int/2addr v4, v5

    .line 60
    add-int/2addr v3, v4

    .line 61
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 62
    .line 63
    .line 64
    move-result v4

    .line 65
    sub-int/2addr v4, v3

    .line 66
    div-int/lit8 v4, v4, 0x2

    .line 67
    .line 68
    iget v3, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->i:I

    .line 69
    .line 70
    iget v5, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->h:I

    .line 71
    .line 72
    if-le v1, v3, :cond_2

    .line 73
    .line 74
    mul-int/2addr v5, v1

    .line 75
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->b:Landroid/graphics/Paint;

    .line 76
    .line 77
    iget-object v2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->t:Ljava/lang/CharSequence;

    .line 78
    .line 79
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    :goto_2
    float-to-int v1, v1

    .line 88
    add-int/2addr v5, v1

    .line 89
    add-int/2addr v4, v5

    .line 90
    goto :goto_3

    .line 91
    :cond_2
    mul-int/2addr v5, v1

    .line 92
    iget-object v3, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->b:Landroid/graphics/Paint;

    .line 93
    .line 94
    iget-object v6, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->t:Ljava/lang/CharSequence;

    .line 95
    .line 96
    invoke-interface {v6, v2, v1}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    invoke-virtual {v3, v1}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    goto :goto_2

    .line 109
    :goto_3
    iget v1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->g:I

    .line 110
    .line 111
    div-int/lit8 v2, v1, 0x2

    .line 112
    .line 113
    sget v3, Ll/qa00;->i:I

    .line 114
    .line 115
    sub-int/2addr v2, v3

    .line 116
    div-int/lit8 v1, v1, 0x2

    .line 117
    .line 118
    add-int/2addr v1, v3

    .line 119
    iget-boolean v3, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->w:Z

    .line 120
    .line 121
    if-eqz v3, :cond_3

    .line 122
    .line 123
    iget v3, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->x:I

    .line 124
    .line 125
    if-eqz v3, :cond_4

    .line 126
    .line 127
    add-int/2addr v4, v3

    .line 128
    int-to-float v6, v4

    .line 129
    int-to-float v7, v2

    .line 130
    int-to-float v9, v1

    .line 131
    iget-object v10, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->c:Landroid/graphics/Paint;

    .line 132
    .line 133
    move v8, v6

    .line 134
    move-object v5, p1

    .line 135
    invoke-virtual/range {v5 .. v10}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 136
    .line 137
    .line 138
    return-void

    .line 139
    :cond_3
    iget-boolean v3, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->s:Z

    .line 140
    .line 141
    if-nez v3, :cond_4

    .line 142
    .line 143
    iget-boolean v3, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->k:Z

    .line 144
    .line 145
    if-eqz v3, :cond_4

    .line 146
    .line 147
    invoke-virtual {p0}, Landroid/view/View;->hasFocus()Z

    .line 148
    .line 149
    .line 150
    move-result v3

    .line 151
    if-eqz v3, :cond_4

    .line 152
    .line 153
    int-to-float v3, v4

    .line 154
    int-to-float v2, v2

    .line 155
    int-to-float v4, v1

    .line 156
    iget-object v5, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->c:Landroid/graphics/Paint;

    .line 157
    .line 158
    move v1, v3

    .line 159
    move-object v0, p1

    .line 160
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 161
    .line 162
    .line 163
    :cond_4
    return-void
.end method

.method public getFinalNum()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->B:I

    .line 2
    .line 3
    return p0
.end method

.method public final h(Landroid/graphics/Canvas;Ljava/lang/CharSequence;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->b:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    float-to-int v0, v0

    .line 12
    iget v1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->h:I

    .line 13
    .line 14
    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    add-int/lit8 v2, v2, -0x1

    .line 19
    .line 20
    mul-int/2addr v1, v2

    .line 21
    add-int/2addr v0, v1

    .line 22
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    sub-int/2addr v1, v0

    .line 27
    div-int/lit8 v1, v1, 0x2

    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    :goto_0
    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-ge v0, v2, :cond_1

    .line 35
    .line 36
    invoke-interface {p2, v0}, Ljava/lang/CharSequence;->charAt(I)C

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->m(C)Z

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    iget-object v4, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->b:Landroid/graphics/Paint;

    .line 45
    .line 46
    if-eqz v3, :cond_0

    .line 47
    .line 48
    iget v3, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->r:I

    .line 49
    .line 50
    invoke-virtual {v4, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 51
    .line 52
    .line 53
    iget-object v3, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->b:Landroid/graphics/Paint;

    .line 54
    .line 55
    sget-object v4, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 56
    .line 57
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 58
    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_0
    iget v3, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->q:I

    .line 62
    .line 63
    invoke-virtual {v4, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 64
    .line 65
    .line 66
    iget-object v3, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->b:Landroid/graphics/Paint;

    .line 67
    .line 68
    sget-object v4, Landroid/graphics/Paint$Style;->FILL_AND_STROKE:Landroid/graphics/Paint$Style;

    .line 69
    .line 70
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 71
    .line 72
    .line 73
    :goto_1
    iget v3, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->g:I

    .line 74
    .line 75
    div-int/lit8 v3, v3, 0x2

    .line 76
    .line 77
    int-to-float v3, v3

    .line 78
    iget-object v4, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->b:Landroid/graphics/Paint;

    .line 79
    .line 80
    invoke-virtual {v4}, Landroid/graphics/Paint;->descent()F

    .line 81
    .line 82
    .line 83
    move-result v4

    .line 84
    iget-object v5, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->b:Landroid/graphics/Paint;

    .line 85
    .line 86
    invoke-virtual {v5}, Landroid/graphics/Paint;->ascent()F

    .line 87
    .line 88
    .line 89
    move-result v5

    .line 90
    add-float/2addr v4, v5

    .line 91
    const/high16 v5, 0x40000000    # 2.0f

    .line 92
    .line 93
    div-float/2addr v4, v5

    .line 94
    sub-float/2addr v3, v4

    .line 95
    float-to-int v3, v3

    .line 96
    invoke-static {v2}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v4

    .line 100
    int-to-float v5, v1

    .line 101
    int-to-float v3, v3

    .line 102
    iget-object v6, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->b:Landroid/graphics/Paint;

    .line 103
    .line 104
    invoke-virtual {p1, v4, v5, v3, v6}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 105
    .line 106
    .line 107
    iget v3, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->h:I

    .line 108
    .line 109
    iget-object v4, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->b:Landroid/graphics/Paint;

    .line 110
    .line 111
    invoke-static {v2}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    invoke-virtual {v4, v2}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 116
    .line 117
    .line 118
    move-result v2

    .line 119
    float-to-int v2, v2

    .line 120
    add-int/2addr v3, v2

    .line 121
    add-int/2addr v1, v3

    .line 122
    add-int/lit8 v0, v0, 0x1

    .line 123
    .line 124
    goto :goto_0

    .line 125
    :cond_1
    return-void
.end method

.method public final i(ILjava/lang/CharSequence;)Z
    .locals 3

    .line 1
    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->E:Ljava/lang/CharSequence;

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
    iput-object p2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->E:Ljava/lang/CharSequence;

    .line 18
    .line 19
    if-eqz v0, :cond_3

    .line 20
    .line 21
    iget v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->y:I

    .line 22
    .line 23
    if-ne v0, v2, :cond_1

    .line 24
    .line 25
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->r(ILjava/lang/CharSequence;)Z

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
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->o(ILjava/lang/CharSequence;)Z

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
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->f(ILjava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    return p0

    .line 46
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->q()V

    .line 47
    .line 48
    .line 49
    :cond_4
    return v2
.end method

.method public final k(Ljava/lang/CharSequence;)Ljava/lang/String;
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
    iget v3, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->i:I

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
    iget v3, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->y:I

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

.method public final l()V
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
    iget v3, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->i:I

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
    iget v2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->p:I

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
    iput-object v1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->b:Landroid/graphics/Paint;

    .line 55
    .line 56
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 57
    .line 58
    .line 59
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->b:Landroid/graphics/Paint;

    .line 60
    .line 61
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 62
    .line 63
    .line 64
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->b:Landroid/graphics/Paint;

    .line 65
    .line 66
    const/16 v2, 0x12

    .line 67
    .line 68
    invoke-static {v2}, Ll/qa00;->f(I)I

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    int-to-float v2, v2

    .line 73
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 74
    .line 75
    .line 76
    new-instance v1, Landroid/graphics/Paint;

    .line 77
    .line 78
    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    .line 79
    .line 80
    .line 81
    iput-object v1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->a:Landroid/graphics/Paint;

    .line 82
    .line 83
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 84
    .line 85
    .line 86
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->a:Landroid/graphics/Paint;

    .line 87
    .line 88
    iget v2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->o:I

    .line 89
    .line 90
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 91
    .line 92
    .line 93
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->a:Landroid/graphics/Paint;

    .line 94
    .line 95
    iget v2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->j:I

    .line 96
    .line 97
    int-to-float v2, v2

    .line 98
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 99
    .line 100
    .line 101
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->a:Landroid/graphics/Paint;

    .line 102
    .line 103
    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 104
    .line 105
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 106
    .line 107
    .line 108
    new-instance v1, Landroid/graphics/Paint;

    .line 109
    .line 110
    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    .line 111
    .line 112
    .line 113
    iput-object v1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->c:Landroid/graphics/Paint;

    .line 114
    .line 115
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 116
    .line 117
    .line 118
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->c:Landroid/graphics/Paint;

    .line 119
    .line 120
    iget v1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->n:I

    .line 121
    .line 122
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 123
    .line 124
    .line 125
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->c:Landroid/graphics/Paint;

    .line 126
    .line 127
    sget-object v1, Landroid/graphics/Paint$Style;->FILL_AND_STROKE:Landroid/graphics/Paint$Style;

    .line 128
    .line 129
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 130
    .line 131
    .line 132
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->c:Landroid/graphics/Paint;

    .line 133
    .line 134
    iget v1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->m:I

    .line 135
    .line 136
    int-to-float v1, v1

    .line 137
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 138
    .line 139
    .line 140
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->c:Landroid/graphics/Paint;

    .line 141
    .line 142
    sget-object v1, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    .line 143
    .line 144
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 145
    .line 146
    .line 147
    new-instance v0, Landroid/graphics/RectF;

    .line 148
    .line 149
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 150
    .line 151
    .line 152
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->d:Landroid/graphics/RectF;

    .line 153
    .line 154
    new-instance v0, Landroid/graphics/RectF;

    .line 155
    .line 156
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 157
    .line 158
    .line 159
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->e:Landroid/graphics/RectF;

    .line 160
    .line 161
    const-string v0, ""

    .line 162
    .line 163
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->k(Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->t:Ljava/lang/CharSequence;

    .line 168
    .line 169
    return-void
.end method

.method public final m(C)Z
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

.method public final synthetic n()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public final o(ILjava/lang/CharSequence;)Z
    .locals 7

    .line 1
    const/4 v0, -0x1

    .line 2
    sput v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->G:I

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-static {v0}, Ll/bsj0;->m(I)Ljava/util/Date;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v3

    .line 14
    const/4 v4, 0x1

    .line 15
    if-eqz v3, :cond_e

    .line 16
    .line 17
    const/16 v3, 0xc

    .line 18
    .line 19
    if-gt p1, v3, :cond_d

    .line 20
    .line 21
    const/4 v3, 0x2

    .line 22
    if-gt p1, v4, :cond_0

    .line 23
    .line 24
    if-ne p1, v4, :cond_6

    .line 25
    .line 26
    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    .line 27
    .line 28
    .line 29
    move-result v5

    .line 30
    if-ne v5, v3, :cond_6

    .line 31
    .line 32
    :cond_0
    sget v5, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->H:I

    .line 33
    .line 34
    if-lez v5, :cond_2

    .line 35
    .line 36
    sget v5, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->F:I

    .line 37
    .line 38
    invoke-static {v5, p1}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->j(II)I

    .line 39
    .line 40
    .line 41
    move-result v5

    .line 42
    sget v6, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->H:I

    .line 43
    .line 44
    if-lt v5, v6, :cond_1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    throw v2

    .line 48
    :cond_2
    :goto_0
    sget v5, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->F:I

    .line 49
    .line 50
    iget-object v6, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->C:Ljava/util/Date;

    .line 51
    .line 52
    invoke-virtual {v6}, Ljava/util/Date;->getYear()I

    .line 53
    .line 54
    .line 55
    move-result v6

    .line 56
    add-int/lit16 v6, v6, 0x76c

    .line 57
    .line 58
    if-ne v5, v6, :cond_4

    .line 59
    .line 60
    iget-object v5, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->C:Ljava/util/Date;

    .line 61
    .line 62
    invoke-virtual {v5}, Ljava/util/Date;->getMonth()I

    .line 63
    .line 64
    .line 65
    move-result v5

    .line 66
    add-int/2addr v5, v4

    .line 67
    if-gt p1, v5, :cond_3

    .line 68
    .line 69
    goto :goto_1

    .line 70
    :cond_3
    throw v2

    .line 71
    :cond_4
    :goto_1
    sget v5, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->F:I

    .line 72
    .line 73
    iget-object v6, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->D:Ljava/util/Date;

    .line 74
    .line 75
    invoke-virtual {v6}, Ljava/util/Date;->getYear()I

    .line 76
    .line 77
    .line 78
    move-result v6

    .line 79
    add-int/lit16 v6, v6, 0x76c

    .line 80
    .line 81
    if-ne v5, v6, :cond_6

    .line 82
    .line 83
    iget-object v5, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->D:Ljava/util/Date;

    .line 84
    .line 85
    invoke-virtual {v5}, Ljava/util/Date;->getMonth()I

    .line 86
    .line 87
    .line 88
    move-result v5

    .line 89
    add-int/2addr v5, v4

    .line 90
    if-lt p1, v5, :cond_5

    .line 91
    .line 92
    goto :goto_2

    .line 93
    :cond_5
    throw v2

    .line 94
    :cond_6
    :goto_2
    sget v5, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->H:I

    .line 95
    .line 96
    if-lez v5, :cond_b

    .line 97
    .line 98
    sget v5, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->F:I

    .line 99
    .line 100
    if-lez v5, :cond_b

    .line 101
    .line 102
    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    .line 103
    .line 104
    .line 105
    move-result v5

    .line 106
    if-eq v5, v3, :cond_7

    .line 107
    .line 108
    if-le p1, v4, :cond_b

    .line 109
    .line 110
    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    .line 111
    .line 112
    .line 113
    move-result v3

    .line 114
    if-ne v3, v4, :cond_b

    .line 115
    .line 116
    :cond_7
    sget v3, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->F:I

    .line 117
    .line 118
    add-int/lit16 v3, v3, -0x76c

    .line 119
    .line 120
    invoke-virtual {v1, v3}, Ljava/util/Date;->setYear(I)V

    .line 121
    .line 122
    .line 123
    if-nez p1, :cond_8

    .line 124
    .line 125
    move v3, v0

    .line 126
    goto :goto_3

    .line 127
    :cond_8
    add-int/lit8 v3, p1, -0x1

    .line 128
    .line 129
    :goto_3
    invoke-virtual {v1, v3}, Ljava/util/Date;->setMonth(I)V

    .line 130
    .line 131
    .line 132
    sget v3, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->H:I

    .line 133
    .line 134
    invoke-virtual {v1, v3}, Ljava/util/Date;->setDate(I)V

    .line 135
    .line 136
    .line 137
    iget-object v3, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->C:Ljava/util/Date;

    .line 138
    .line 139
    invoke-virtual {v1, v3}, Ljava/util/Date;->after(Ljava/util/Date;)Z

    .line 140
    .line 141
    .line 142
    move-result v3

    .line 143
    if-nez v3, :cond_a

    .line 144
    .line 145
    iget-object v3, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->D:Ljava/util/Date;

    .line 146
    .line 147
    invoke-virtual {v1, v3}, Ljava/util/Date;->before(Ljava/util/Date;)Z

    .line 148
    .line 149
    .line 150
    move-result v1

    .line 151
    if-nez v1, :cond_9

    .line 152
    .line 153
    goto :goto_4

    .line 154
    :cond_9
    throw v2

    .line 155
    :cond_a
    throw v2

    .line 156
    :cond_b
    :goto_4
    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    .line 157
    .line 158
    .line 159
    move-result p2

    .line 160
    iget p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->i:I

    .line 161
    .line 162
    if-ne p2, p0, :cond_e

    .line 163
    .line 164
    if-nez p1, :cond_c

    .line 165
    .line 166
    goto :goto_5

    .line 167
    :cond_c
    add-int/lit8 v0, p1, -0x1

    .line 168
    .line 169
    :goto_5
    sput v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->G:I

    .line 170
    .line 171
    goto :goto_6

    .line 172
    :cond_d
    throw v2

    .line 173
    :cond_e
    :goto_6
    return v4
.end method

.method public onAttachedToWindow()V
    .locals 8

    .line 1
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->v:Ljava/util/Timer;

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
    const-string v1, "DateEditTextNew-Thread"

    .line 15
    .line 16
    invoke-direct {v0, v1}, Ljava/util/Timer;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->v:Ljava/util/Timer;

    .line 20
    .line 21
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->v:Ljava/util/Timer;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->e()Ljava/util/TimerTask;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    iget p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->l:I

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
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->A:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/b;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->A:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/b;

    .line 11
    .line 12
    new-instance v0, Ll/j8c;

    .line 13
    .line 14
    invoke-direct {v0, p0}, Ll/j8c;-><init>(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/b;->a(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/b$a;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->A:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/b;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->v:Ljava/util/Timer;

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->v:Ljava/util/Timer;

    .line 11
    .line 12
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->t:Ljava/lang/CharSequence;

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->h(Landroid/graphics/Canvas;Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->g(Landroid/graphics/Canvas;)V

    .line 7
    .line 8
    .line 9
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
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    .line 2
    .line 3
    .line 4
    iget p3, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->h:I

    .line 5
    .line 6
    iget p4, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->i:I

    .line 7
    .line 8
    add-int/lit8 v0, p4, 0x1

    .line 9
    .line 10
    mul-int/2addr p3, v0

    .line 11
    sub-int p3, p1, p3

    .line 12
    .line 13
    iget v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->z:I

    .line 14
    .line 15
    mul-int/lit8 v0, v0, 0x5

    .line 16
    .line 17
    sub-int/2addr p3, v0

    .line 18
    div-int/2addr p3, p4

    .line 19
    iput p3, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->f:I

    .line 20
    .line 21
    iput p2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->g:I

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->d:Landroid/graphics/RectF;

    .line 24
    .line 25
    int-to-float p1, p1

    .line 26
    int-to-float p2, p2

    .line 27
    const/4 p3, 0x0

    .line 28
    invoke-virtual {p0, p3, p3, p1, p2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 29
    .line 30
    .line 31
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
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->k(Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    iput-object p2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->t:Ljava/lang/CharSequence;

    .line 17
    .line 18
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->u:Ljava/lang/CharSequence;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->q()V

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
    iput p2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->B:I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    .line 41
    :catch_0
    iget p2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->B:I

    .line 42
    .line 43
    const/4 p3, -0x1

    .line 44
    if-eq p2, p3, :cond_7

    .line 45
    .line 46
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->i(ILjava/lang/CharSequence;)Z

    .line 47
    .line 48
    .line 49
    move-result p2

    .line 50
    const-string p3, "00"

    .line 51
    .line 52
    const-string p4, "0"

    .line 53
    .line 54
    if-eqz p2, :cond_5

    .line 55
    .line 56
    invoke-virtual {p3, p1}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    .line 57
    .line 58
    .line 59
    move-result p2

    .line 60
    if-nez p2, :cond_5

    .line 61
    .line 62
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    iput-object p2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->u:Ljava/lang/CharSequence;

    .line 67
    .line 68
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p2

    .line 72
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->k(Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p2

    .line 76
    iput-object p2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->t:Ljava/lang/CharSequence;

    .line 77
    .line 78
    iget p2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->y:I

    .line 79
    .line 80
    const/4 p3, 0x2

    .line 81
    const/4 v0, 0x1

    .line 82
    if-ne p2, p3, :cond_2

    .line 83
    .line 84
    iget p2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->B:I

    .line 85
    .line 86
    if-le p2, v0, :cond_1

    .line 87
    .line 88
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    if-ne p1, v0, :cond_1

    .line 93
    .line 94
    new-instance p1, Ljava/lang/StringBuilder;

    .line 95
    .line 96
    invoke-direct {p1, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    iget p2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->B:I

    .line 100
    .line 101
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->u:Ljava/lang/CharSequence;

    .line 109
    .line 110
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

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
    iget p2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->B:I

    .line 122
    .line 123
    if-le p2, p3, :cond_3

    .line 124
    .line 125
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 126
    .line 127
    .line 128
    move-result p1

    .line 129
    if-ne p1, v0, :cond_3

    .line 130
    .line 131
    new-instance p1, Ljava/lang/StringBuilder;

    .line 132
    .line 133
    invoke-direct {p1, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    iget p2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->B:I

    .line 137
    .line 138
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->u:Ljava/lang/CharSequence;

    .line 146
    .line 147
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

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
    goto :goto_0

    .line 159
    :cond_5
    invoke-virtual {p3, p1}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    .line 160
    .line 161
    .line 162
    move-result p1

    .line 163
    const/4 p2, 0x0

    .line 164
    if-eqz p1, :cond_6

    .line 165
    .line 166
    invoke-virtual {p0, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 167
    .line 168
    .line 169
    throw p2

    .line 170
    :cond_6
    throw p2

    .line 171
    :cond_7
    :goto_0
    return-void
.end method

.method public onTextContextMenuItem(I)Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public final p(III)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    if-lt p1, p2, :cond_1

    .line 3
    .line 4
    if-gt p1, p3, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    throw p0

    .line 9
    :cond_1
    throw p0
.end method

.method public final q()V
    .locals 2

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->y:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    const/4 v1, -0x1

    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    sput v1, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->F:I

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
    sput v1, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->G:I

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
    sput v1, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->H:I

    .line 20
    .line 21
    :cond_2
    return-void
.end method

.method public final r(ILjava/lang/CharSequence;)Z
    .locals 5

    .line 1
    const/4 v0, -0x1

    .line 2
    sput v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->F:I

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-static {v0}, Ll/bsj0;->m(I)Ljava/util/Date;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    const/4 v3, 0x1

    .line 15
    if-eqz v2, :cond_b

    .line 16
    .line 17
    const/16 v2, 0xa

    .line 18
    .line 19
    if-ge p1, v2, :cond_0

    .line 20
    .line 21
    const/4 p2, 0x2

    .line 22
    invoke-virtual {p0, p1, v3, p2}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->p(III)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0

    .line 27
    :cond_0
    const/16 v4, 0x64

    .line 28
    .line 29
    if-ge p1, v4, :cond_1

    .line 30
    .line 31
    iget-object p2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->D:Ljava/util/Date;

    .line 32
    .line 33
    invoke-virtual {p2}, Ljava/util/Date;->getYear()I

    .line 34
    .line 35
    .line 36
    move-result p2

    .line 37
    add-int/lit16 p2, p2, 0x76c

    .line 38
    .line 39
    div-int/2addr p2, v4

    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->C:Ljava/util/Date;

    .line 41
    .line 42
    invoke-virtual {v0}, Ljava/util/Date;->getYear()I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    add-int/lit16 v0, v0, 0x76c

    .line 47
    .line 48
    div-int/2addr v0, v4

    .line 49
    invoke-virtual {p0, p1, p2, v0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->p(III)Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    return p0

    .line 54
    :cond_1
    const/16 v4, 0x3e8

    .line 55
    .line 56
    if-ge p1, v4, :cond_2

    .line 57
    .line 58
    iget-object p2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->D:Ljava/util/Date;

    .line 59
    .line 60
    invoke-virtual {p2}, Ljava/util/Date;->getYear()I

    .line 61
    .line 62
    .line 63
    move-result p2

    .line 64
    add-int/lit16 p2, p2, 0x76c

    .line 65
    .line 66
    div-int/2addr p2, v2

    .line 67
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->C:Ljava/util/Date;

    .line 68
    .line 69
    invoke-virtual {v0}, Ljava/util/Date;->getYear()I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    add-int/lit16 v0, v0, 0x76c

    .line 74
    .line 75
    div-int/2addr v0, v2

    .line 76
    invoke-virtual {p0, p1, p2, v0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->p(III)Z

    .line 77
    .line 78
    .line 79
    move-result p0

    .line 80
    return p0

    .line 81
    :cond_2
    sget v2, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->H:I

    .line 82
    .line 83
    if-lez v2, :cond_4

    .line 84
    .line 85
    sget v2, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->G:I

    .line 86
    .line 87
    add-int/2addr v2, v3

    .line 88
    invoke-static {p1, v2}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->j(II)I

    .line 89
    .line 90
    .line 91
    move-result v2

    .line 92
    sget v4, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->H:I

    .line 93
    .line 94
    if-lt v2, v4, :cond_3

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_3
    throw v1

    .line 98
    :cond_4
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->D:Ljava/util/Date;

    .line 99
    .line 100
    invoke-virtual {v2}, Ljava/util/Date;->getYear()I

    .line 101
    .line 102
    .line 103
    move-result v2

    .line 104
    add-int/lit16 v2, v2, 0x76c

    .line 105
    .line 106
    if-lt p1, v2, :cond_a

    .line 107
    .line 108
    iget-object v2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->C:Ljava/util/Date;

    .line 109
    .line 110
    invoke-virtual {v2}, Ljava/util/Date;->getYear()I

    .line 111
    .line 112
    .line 113
    move-result v2

    .line 114
    add-int/lit16 v2, v2, 0x76c

    .line 115
    .line 116
    if-gt p1, v2, :cond_9

    .line 117
    .line 118
    sget v2, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->H:I

    .line 119
    .line 120
    if-ltz v2, :cond_7

    .line 121
    .line 122
    sget v2, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->G:I

    .line 123
    .line 124
    if-ltz v2, :cond_7

    .line 125
    .line 126
    add-int/lit16 v2, p1, -0x76c

    .line 127
    .line 128
    invoke-virtual {v0, v2}, Ljava/util/Date;->setYear(I)V

    .line 129
    .line 130
    .line 131
    sget v2, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->G:I

    .line 132
    .line 133
    invoke-virtual {v0, v2}, Ljava/util/Date;->setMonth(I)V

    .line 134
    .line 135
    .line 136
    sget v2, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->H:I

    .line 137
    .line 138
    invoke-virtual {v0, v2}, Ljava/util/Date;->setDate(I)V

    .line 139
    .line 140
    .line 141
    iget-object v2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->C:Ljava/util/Date;

    .line 142
    .line 143
    invoke-virtual {v0, v2}, Ljava/util/Date;->after(Ljava/util/Date;)Z

    .line 144
    .line 145
    .line 146
    move-result v2

    .line 147
    if-nez v2, :cond_6

    .line 148
    .line 149
    iget-object v2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->D:Ljava/util/Date;

    .line 150
    .line 151
    invoke-virtual {v0, v2}, Ljava/util/Date;->before(Ljava/util/Date;)Z

    .line 152
    .line 153
    .line 154
    move-result v0

    .line 155
    if-nez v0, :cond_5

    .line 156
    .line 157
    goto :goto_1

    .line 158
    :cond_5
    throw v1

    .line 159
    :cond_6
    throw v1

    .line 160
    :cond_7
    :goto_1
    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    .line 161
    .line 162
    .line 163
    move-result p2

    .line 164
    iget p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->i:I

    .line 165
    .line 166
    if-ne p2, p0, :cond_8

    .line 167
    .line 168
    sput p1, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->F:I

    .line 169
    .line 170
    :cond_8
    return v3

    .line 171
    :cond_9
    throw v1

    .line 172
    :cond_a
    throw v1

    .line 173
    :cond_b
    return v3
.end method

.method public setTextChangedListener(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew$c;)V
    .locals 0

    return-void
.end method

.method public setTextColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/DateEditTextNew;->q:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
