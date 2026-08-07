.class public Ll/g7h0$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/g7h0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public A:Ll/t30;

.field public B:Ljava/lang/CharSequence;

.field public C:Ljava/lang/CharSequence;

.field public D:Landroid/content/res/ColorStateList;

.field public E:Landroid/graphics/PorterDuff$Mode;

.field public final synthetic F:Ll/g7h0;

.field public a:Landroid/view/Menu;

.field public b:I

.field public c:I

.field public d:I

.field public e:I

.field public f:Z

.field public g:Z

.field public h:Z

.field public i:I

.field public j:I

.field public k:Ljava/lang/CharSequence;

.field public l:Ljava/lang/CharSequence;

.field public m:I

.field public n:C

.field public o:I

.field public p:C

.field public q:I

.field public r:I

.field public s:Z

.field public t:Z

.field public u:Z

.field public v:I

.field public w:I

.field public x:Ljava/lang/String;

.field public y:Ljava/lang/String;

.field public z:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/g7h0;Landroid/view/Menu;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/g7h0$b;->F:Ll/g7h0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-object p1, p0, Ll/g7h0$b;->D:Landroid/content/res/ColorStateList;

    .line 8
    .line 9
    iput-object p1, p0, Ll/g7h0$b;->E:Landroid/graphics/PorterDuff$Mode;

    .line 10
    .line 11
    iput-object p2, p0, Ll/g7h0$b;->a:Landroid/view/Menu;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/g7h0$b;->h()V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public a()V
    .locals 5

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/g7h0$b;->h:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/g7h0$b;->a:Landroid/view/Menu;

    .line 5
    .line 6
    iget v1, p0, Ll/g7h0$b;->b:I

    .line 7
    .line 8
    iget v2, p0, Ll/g7h0$b;->i:I

    .line 9
    .line 10
    iget v3, p0, Ll/g7h0$b;->j:I

    .line 11
    .line 12
    iget-object v4, p0, Ll/g7h0$b;->k:Ljava/lang/CharSequence;

    .line 13
    .line 14
    invoke-interface {v0, v1, v2, v3, v4}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, v0}, Ll/g7h0$b;->i(Landroid/view/MenuItem;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public b()Landroid/view/SubMenu;
    .locals 5

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/g7h0$b;->h:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/g7h0$b;->a:Landroid/view/Menu;

    .line 5
    .line 6
    iget v1, p0, Ll/g7h0$b;->b:I

    .line 7
    .line 8
    iget v2, p0, Ll/g7h0$b;->i:I

    .line 9
    .line 10
    iget v3, p0, Ll/g7h0$b;->j:I

    .line 11
    .line 12
    iget-object v4, p0, Ll/g7h0$b;->k:Ljava/lang/CharSequence;

    .line 13
    .line 14
    invoke-interface {v0, v1, v2, v3, v4}, Landroid/view/Menu;->addSubMenu(IIILjava/lang/CharSequence;)Landroid/view/SubMenu;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-interface {v0}, Landroid/view/SubMenu;->getItem()Landroid/view/MenuItem;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {p0, v1}, Ll/g7h0$b;->i(Landroid/view/MenuItem;)V

    .line 23
    .line 24
    .line 25
    return-object v0
.end method

.method public final c(Ljava/lang/String;)C
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return p0

    .line 5
    :cond_0
    invoke-virtual {p1, p0}, Ljava/lang/String;->charAt(I)C

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public d()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/g7h0$b;->h:Z

    .line 2
    .line 3
    return p0
.end method

.method public final e(Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Class<",
            "*>;[",
            "Ljava/lang/Object;",
            ")TT;"
        }
    .end annotation

    .line 1
    :try_start_0
    iget-object p0, p0, Ll/g7h0$b;->F:Ll/g7h0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/g7h0;->c:Landroid/content/Context;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-static {p1, v0, p0}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0, p2}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const/4 p1, 0x1

    .line 19
    invoke-virtual {p0, p1}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, p3}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 26
    return-object p0

    .line 27
    :catch_0
    const/4 p0, 0x0

    .line 28
    return-object p0
.end method

.method public f(Landroid/util/AttributeSet;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/g7h0$b;->F:Ll/g7h0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/g7h0;->c:Landroid/content/Context;

    .line 4
    .line 5
    sget-object v1, Ll/gic0;->s1:[I

    .line 6
    .line 7
    invoke-virtual {v0, p1, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    sget v0, Ll/gic0;->u1:I

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iput v0, p0, Ll/g7h0$b;->b:I

    .line 19
    .line 20
    sget v0, Ll/gic0;->w1:I

    .line 21
    .line 22
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    iput v0, p0, Ll/g7h0$b;->c:I

    .line 27
    .line 28
    sget v0, Ll/gic0;->x1:I

    .line 29
    .line 30
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    iput v0, p0, Ll/g7h0$b;->d:I

    .line 35
    .line 36
    sget v0, Ll/gic0;->y1:I

    .line 37
    .line 38
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iput v0, p0, Ll/g7h0$b;->e:I

    .line 43
    .line 44
    sget v0, Ll/gic0;->v1:I

    .line 45
    .line 46
    const/4 v1, 0x1

    .line 47
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    iput-boolean v0, p0, Ll/g7h0$b;->f:Z

    .line 52
    .line 53
    sget v0, Ll/gic0;->t1:I

    .line 54
    .line 55
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    iput-boolean v0, p0, Ll/g7h0$b;->g:Z

    .line 60
    .line 61
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public g(Landroid/util/AttributeSet;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/g7h0$b;->F:Ll/g7h0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/g7h0;->c:Landroid/content/Context;

    .line 4
    .line 5
    sget-object v1, Ll/gic0;->z1:[I

    .line 6
    .line 7
    invoke-static {v0, p1, v1}, Ll/t0j0;->t(Landroid/content/Context;Landroid/util/AttributeSet;[I)Ll/t0j0;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    sget v0, Ll/gic0;->C1:I

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {p1, v0, v1}, Ll/t0j0;->n(II)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iput v0, p0, Ll/g7h0$b;->i:I

    .line 19
    .line 20
    sget v0, Ll/gic0;->F1:I

    .line 21
    .line 22
    iget v2, p0, Ll/g7h0$b;->c:I

    .line 23
    .line 24
    invoke-virtual {p1, v0, v2}, Ll/t0j0;->k(II)I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    sget v2, Ll/gic0;->G1:I

    .line 29
    .line 30
    iget v3, p0, Ll/g7h0$b;->d:I

    .line 31
    .line 32
    invoke-virtual {p1, v2, v3}, Ll/t0j0;->k(II)I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    const/high16 v3, -0x10000

    .line 37
    .line 38
    and-int/2addr v0, v3

    .line 39
    const v3, 0xffff

    .line 40
    .line 41
    .line 42
    and-int/2addr v2, v3

    .line 43
    or-int/2addr v0, v2

    .line 44
    iput v0, p0, Ll/g7h0$b;->j:I

    .line 45
    .line 46
    sget v0, Ll/gic0;->H1:I

    .line 47
    .line 48
    invoke-virtual {p1, v0}, Ll/t0j0;->p(I)Ljava/lang/CharSequence;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iput-object v0, p0, Ll/g7h0$b;->k:Ljava/lang/CharSequence;

    .line 53
    .line 54
    sget v0, Ll/gic0;->I1:I

    .line 55
    .line 56
    invoke-virtual {p1, v0}, Ll/t0j0;->p(I)Ljava/lang/CharSequence;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iput-object v0, p0, Ll/g7h0$b;->l:Ljava/lang/CharSequence;

    .line 61
    .line 62
    sget v0, Ll/gic0;->A1:I

    .line 63
    .line 64
    invoke-virtual {p1, v0, v1}, Ll/t0j0;->n(II)I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    iput v0, p0, Ll/g7h0$b;->m:I

    .line 69
    .line 70
    sget v0, Ll/gic0;->J1:I

    .line 71
    .line 72
    invoke-virtual {p1, v0}, Ll/t0j0;->o(I)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {p0, v0}, Ll/g7h0$b;->c(Ljava/lang/String;)C

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    iput-char v0, p0, Ll/g7h0$b;->n:C

    .line 81
    .line 82
    sget v0, Ll/gic0;->Q1:I

    .line 83
    .line 84
    const/16 v2, 0x1000

    .line 85
    .line 86
    invoke-virtual {p1, v0, v2}, Ll/t0j0;->k(II)I

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    iput v0, p0, Ll/g7h0$b;->o:I

    .line 91
    .line 92
    sget v0, Ll/gic0;->K1:I

    .line 93
    .line 94
    invoke-virtual {p1, v0}, Ll/t0j0;->o(I)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-virtual {p0, v0}, Ll/g7h0$b;->c(Ljava/lang/String;)C

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    iput-char v0, p0, Ll/g7h0$b;->p:C

    .line 103
    .line 104
    sget v0, Ll/gic0;->U1:I

    .line 105
    .line 106
    invoke-virtual {p1, v0, v2}, Ll/t0j0;->k(II)I

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    iput v0, p0, Ll/g7h0$b;->q:I

    .line 111
    .line 112
    sget v0, Ll/gic0;->L1:I

    .line 113
    .line 114
    invoke-virtual {p1, v0}, Ll/t0j0;->r(I)Z

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    if-eqz v0, :cond_0

    .line 119
    .line 120
    sget v0, Ll/gic0;->L1:I

    .line 121
    .line 122
    invoke-virtual {p1, v0, v1}, Ll/t0j0;->a(IZ)Z

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    iput v0, p0, Ll/g7h0$b;->r:I

    .line 127
    .line 128
    goto :goto_0

    .line 129
    :cond_0
    iget v0, p0, Ll/g7h0$b;->e:I

    .line 130
    .line 131
    iput v0, p0, Ll/g7h0$b;->r:I

    .line 132
    .line 133
    :goto_0
    sget v0, Ll/gic0;->D1:I

    .line 134
    .line 135
    invoke-virtual {p1, v0, v1}, Ll/t0j0;->a(IZ)Z

    .line 136
    .line 137
    .line 138
    move-result v0

    .line 139
    iput-boolean v0, p0, Ll/g7h0$b;->s:Z

    .line 140
    .line 141
    sget v0, Ll/gic0;->E1:I

    .line 142
    .line 143
    iget-boolean v2, p0, Ll/g7h0$b;->f:Z

    .line 144
    .line 145
    invoke-virtual {p1, v0, v2}, Ll/t0j0;->a(IZ)Z

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    iput-boolean v0, p0, Ll/g7h0$b;->t:Z

    .line 150
    .line 151
    sget v0, Ll/gic0;->B1:I

    .line 152
    .line 153
    iget-boolean v2, p0, Ll/g7h0$b;->g:Z

    .line 154
    .line 155
    invoke-virtual {p1, v0, v2}, Ll/t0j0;->a(IZ)Z

    .line 156
    .line 157
    .line 158
    move-result v0

    .line 159
    iput-boolean v0, p0, Ll/g7h0$b;->u:Z

    .line 160
    .line 161
    sget v0, Ll/gic0;->V1:I

    .line 162
    .line 163
    const/4 v2, -0x1

    .line 164
    invoke-virtual {p1, v0, v2}, Ll/t0j0;->k(II)I

    .line 165
    .line 166
    .line 167
    move-result v0

    .line 168
    iput v0, p0, Ll/g7h0$b;->v:I

    .line 169
    .line 170
    sget v0, Ll/gic0;->M1:I

    .line 171
    .line 172
    invoke-virtual {p1, v0}, Ll/t0j0;->o(I)Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    iput-object v0, p0, Ll/g7h0$b;->z:Ljava/lang/String;

    .line 177
    .line 178
    sget v0, Ll/gic0;->N1:I

    .line 179
    .line 180
    invoke-virtual {p1, v0, v1}, Ll/t0j0;->n(II)I

    .line 181
    .line 182
    .line 183
    move-result v0

    .line 184
    iput v0, p0, Ll/g7h0$b;->w:I

    .line 185
    .line 186
    sget v0, Ll/gic0;->P1:I

    .line 187
    .line 188
    invoke-virtual {p1, v0}, Ll/t0j0;->o(I)Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    iput-object v0, p0, Ll/g7h0$b;->x:Ljava/lang/String;

    .line 193
    .line 194
    sget v0, Ll/gic0;->O1:I

    .line 195
    .line 196
    invoke-virtual {p1, v0}, Ll/t0j0;->o(I)Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    iput-object v0, p0, Ll/g7h0$b;->y:Ljava/lang/String;

    .line 201
    .line 202
    const/4 v3, 0x0

    .line 203
    if-eqz v0, :cond_1

    .line 204
    .line 205
    iget v4, p0, Ll/g7h0$b;->w:I

    .line 206
    .line 207
    if-nez v4, :cond_1

    .line 208
    .line 209
    iget-object v4, p0, Ll/g7h0$b;->x:Ljava/lang/String;

    .line 210
    .line 211
    if-nez v4, :cond_1

    .line 212
    .line 213
    sget-object v4, Ll/g7h0;->f:[Ljava/lang/Class;

    .line 214
    .line 215
    iget-object v5, p0, Ll/g7h0$b;->F:Ll/g7h0;

    .line 216
    .line 217
    iget-object v5, v5, Ll/g7h0;->b:[Ljava/lang/Object;

    .line 218
    .line 219
    invoke-virtual {p0, v0, v4, v5}, Ll/g7h0$b;->e(Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 220
    .line 221
    .line 222
    move-result-object v0

    .line 223
    check-cast v0, Ll/t30;

    .line 224
    .line 225
    iput-object v0, p0, Ll/g7h0$b;->A:Ll/t30;

    .line 226
    .line 227
    goto :goto_1

    .line 228
    :cond_1
    iput-object v3, p0, Ll/g7h0$b;->A:Ll/t30;

    .line 229
    .line 230
    :goto_1
    sget v0, Ll/gic0;->R1:I

    .line 231
    .line 232
    invoke-virtual {p1, v0}, Ll/t0j0;->p(I)Ljava/lang/CharSequence;

    .line 233
    .line 234
    .line 235
    move-result-object v0

    .line 236
    iput-object v0, p0, Ll/g7h0$b;->B:Ljava/lang/CharSequence;

    .line 237
    .line 238
    sget v0, Ll/gic0;->W1:I

    .line 239
    .line 240
    invoke-virtual {p1, v0}, Ll/t0j0;->p(I)Ljava/lang/CharSequence;

    .line 241
    .line 242
    .line 243
    move-result-object v0

    .line 244
    iput-object v0, p0, Ll/g7h0$b;->C:Ljava/lang/CharSequence;

    .line 245
    .line 246
    sget v0, Ll/gic0;->T1:I

    .line 247
    .line 248
    invoke-virtual {p1, v0}, Ll/t0j0;->r(I)Z

    .line 249
    .line 250
    .line 251
    move-result v0

    .line 252
    if-eqz v0, :cond_2

    .line 253
    .line 254
    sget v0, Ll/gic0;->T1:I

    .line 255
    .line 256
    invoke-virtual {p1, v0, v2}, Ll/t0j0;->k(II)I

    .line 257
    .line 258
    .line 259
    move-result v0

    .line 260
    iget-object v2, p0, Ll/g7h0$b;->E:Landroid/graphics/PorterDuff$Mode;

    .line 261
    .line 262
    invoke-static {v0, v2}, Ll/gde;->d(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuff$Mode;

    .line 263
    .line 264
    .line 265
    move-result-object v0

    .line 266
    iput-object v0, p0, Ll/g7h0$b;->E:Landroid/graphics/PorterDuff$Mode;

    .line 267
    .line 268
    goto :goto_2

    .line 269
    :cond_2
    iput-object v3, p0, Ll/g7h0$b;->E:Landroid/graphics/PorterDuff$Mode;

    .line 270
    .line 271
    :goto_2
    sget v0, Ll/gic0;->S1:I

    .line 272
    .line 273
    invoke-virtual {p1, v0}, Ll/t0j0;->r(I)Z

    .line 274
    .line 275
    .line 276
    move-result v0

    .line 277
    if-eqz v0, :cond_3

    .line 278
    .line 279
    sget v0, Ll/gic0;->S1:I

    .line 280
    .line 281
    invoke-virtual {p1, v0}, Ll/t0j0;->c(I)Landroid/content/res/ColorStateList;

    .line 282
    .line 283
    .line 284
    move-result-object v0

    .line 285
    iput-object v0, p0, Ll/g7h0$b;->D:Landroid/content/res/ColorStateList;

    .line 286
    .line 287
    goto :goto_3

    .line 288
    :cond_3
    iput-object v3, p0, Ll/g7h0$b;->D:Landroid/content/res/ColorStateList;

    .line 289
    .line 290
    :goto_3
    invoke-virtual {p1}, Ll/t0j0;->v()V

    .line 291
    .line 292
    .line 293
    iput-boolean v1, p0, Ll/g7h0$b;->h:Z

    .line 294
    .line 295
    return-void
.end method

.method public h()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/g7h0$b;->b:I

    .line 3
    .line 4
    iput v0, p0, Ll/g7h0$b;->c:I

    .line 5
    .line 6
    iput v0, p0, Ll/g7h0$b;->d:I

    .line 7
    .line 8
    iput v0, p0, Ll/g7h0$b;->e:I

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    iput-boolean v0, p0, Ll/g7h0$b;->f:Z

    .line 12
    .line 13
    iput-boolean v0, p0, Ll/g7h0$b;->g:Z

    .line 14
    .line 15
    return-void
.end method

.method public final i(Landroid/view/MenuItem;)V
    .locals 5

    .line 1
    iget-boolean v0, p0, Ll/g7h0$b;->s:Z

    .line 2
    .line 3
    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-boolean v1, p0, Ll/g7h0$b;->t:Z

    .line 8
    .line 9
    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-boolean v1, p0, Ll/g7h0$b;->u:Z

    .line 14
    .line 15
    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget v1, p0, Ll/g7h0$b;->r:I

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    const/4 v3, 0x1

    .line 23
    if-lt v1, v3, :cond_0

    .line 24
    .line 25
    move v1, v3

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    move v1, v2

    .line 28
    :goto_0
    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setCheckable(Z)Landroid/view/MenuItem;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iget-object v1, p0, Ll/g7h0$b;->l:Ljava/lang/CharSequence;

    .line 33
    .line 34
    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setTitleCondensed(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iget v1, p0, Ll/g7h0$b;->m:I

    .line 39
    .line 40
    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 41
    .line 42
    .line 43
    iget v0, p0, Ll/g7h0$b;->v:I

    .line 44
    .line 45
    if-ltz v0, :cond_1

    .line 46
    .line 47
    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 48
    .line 49
    .line 50
    :cond_1
    iget-object v0, p0, Ll/g7h0$b;->z:Ljava/lang/String;

    .line 51
    .line 52
    if-eqz v0, :cond_3

    .line 53
    .line 54
    iget-object v0, p0, Ll/g7h0$b;->F:Ll/g7h0;

    .line 55
    .line 56
    iget-object v0, v0, Ll/g7h0;->c:Landroid/content/Context;

    .line 57
    .line 58
    invoke-virtual {v0}, Landroid/content/Context;->isRestricted()Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-nez v0, :cond_2

    .line 63
    .line 64
    new-instance v0, Ll/g7h0$a;

    .line 65
    .line 66
    iget-object v1, p0, Ll/g7h0$b;->F:Ll/g7h0;

    .line 67
    .line 68
    invoke-virtual {v1}, Ll/g7h0;->b()Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    iget-object v4, p0, Ll/g7h0$b;->z:Ljava/lang/String;

    .line 73
    .line 74
    invoke-direct {v0, v1, v4}, Ll/g7h0$a;-><init>(Ljava/lang/Object;Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    .line 78
    .line 79
    .line 80
    goto :goto_1

    .line 81
    :cond_2
    const-string p0, "The android:onClick attribute cannot be used within a restricted context"

    .line 82
    .line 83
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_3
    :goto_1
    instance-of v0, p1, Landroidx/appcompat/view/menu/MenuItemImpl;

    .line 88
    .line 89
    if-eqz v0, :cond_4

    .line 90
    .line 91
    move-object v1, p1

    .line 92
    check-cast v1, Landroidx/appcompat/view/menu/MenuItemImpl;

    .line 93
    .line 94
    :cond_4
    iget v1, p0, Ll/g7h0$b;->r:I

    .line 95
    .line 96
    const/4 v4, 0x2

    .line 97
    if-lt v1, v4, :cond_6

    .line 98
    .line 99
    if-eqz v0, :cond_5

    .line 100
    .line 101
    move-object v0, p1

    .line 102
    check-cast v0, Landroidx/appcompat/view/menu/MenuItemImpl;

    .line 103
    .line 104
    invoke-virtual {v0, v3}, Landroidx/appcompat/view/menu/MenuItemImpl;->setExclusiveCheckable(Z)V

    .line 105
    .line 106
    .line 107
    goto :goto_2

    .line 108
    :cond_5
    instance-of v0, p1, Landroidx/appcompat/view/menu/MenuItemWrapperICS;

    .line 109
    .line 110
    if-eqz v0, :cond_6

    .line 111
    .line 112
    move-object v0, p1

    .line 113
    check-cast v0, Landroidx/appcompat/view/menu/MenuItemWrapperICS;

    .line 114
    .line 115
    invoke-virtual {v0, v3}, Landroidx/appcompat/view/menu/MenuItemWrapperICS;->f(Z)V

    .line 116
    .line 117
    .line 118
    :cond_6
    :goto_2
    iget-object v0, p0, Ll/g7h0$b;->x:Ljava/lang/String;

    .line 119
    .line 120
    if-eqz v0, :cond_7

    .line 121
    .line 122
    sget-object v1, Ll/g7h0;->e:[Ljava/lang/Class;

    .line 123
    .line 124
    iget-object v2, p0, Ll/g7h0$b;->F:Ll/g7h0;

    .line 125
    .line 126
    iget-object v2, v2, Ll/g7h0;->a:[Ljava/lang/Object;

    .line 127
    .line 128
    invoke-virtual {p0, v0, v1, v2}, Ll/g7h0$b;->e(Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    check-cast v0, Landroid/view/View;

    .line 133
    .line 134
    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setActionView(Landroid/view/View;)Landroid/view/MenuItem;

    .line 135
    .line 136
    .line 137
    move v2, v3

    .line 138
    :cond_7
    iget v0, p0, Ll/g7h0$b;->w:I

    .line 139
    .line 140
    if-lez v0, :cond_8

    .line 141
    .line 142
    if-nez v2, :cond_8

    .line 143
    .line 144
    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setActionView(I)Landroid/view/MenuItem;

    .line 145
    .line 146
    .line 147
    :cond_8
    iget-object v0, p0, Ll/g7h0$b;->A:Ll/t30;

    .line 148
    .line 149
    if-eqz v0, :cond_9

    .line 150
    .line 151
    invoke-static {p1, v0}, Ll/iqy;->a(Landroid/view/MenuItem;Ll/t30;)Landroid/view/MenuItem;

    .line 152
    .line 153
    .line 154
    :cond_9
    iget-object v0, p0, Ll/g7h0$b;->B:Ljava/lang/CharSequence;

    .line 155
    .line 156
    invoke-static {p1, v0}, Ll/iqy;->c(Landroid/view/MenuItem;Ljava/lang/CharSequence;)V

    .line 157
    .line 158
    .line 159
    iget-object v0, p0, Ll/g7h0$b;->C:Ljava/lang/CharSequence;

    .line 160
    .line 161
    invoke-static {p1, v0}, Ll/iqy;->g(Landroid/view/MenuItem;Ljava/lang/CharSequence;)V

    .line 162
    .line 163
    .line 164
    iget-char v0, p0, Ll/g7h0$b;->n:C

    .line 165
    .line 166
    iget v1, p0, Ll/g7h0$b;->o:I

    .line 167
    .line 168
    invoke-static {p1, v0, v1}, Ll/iqy;->b(Landroid/view/MenuItem;CI)V

    .line 169
    .line 170
    .line 171
    iget-char v0, p0, Ll/g7h0$b;->p:C

    .line 172
    .line 173
    iget v1, p0, Ll/g7h0$b;->q:I

    .line 174
    .line 175
    invoke-static {p1, v0, v1}, Ll/iqy;->f(Landroid/view/MenuItem;CI)V

    .line 176
    .line 177
    .line 178
    iget-object v0, p0, Ll/g7h0$b;->E:Landroid/graphics/PorterDuff$Mode;

    .line 179
    .line 180
    if-eqz v0, :cond_a

    .line 181
    .line 182
    invoke-static {p1, v0}, Ll/iqy;->e(Landroid/view/MenuItem;Landroid/graphics/PorterDuff$Mode;)V

    .line 183
    .line 184
    .line 185
    :cond_a
    iget-object p0, p0, Ll/g7h0$b;->D:Landroid/content/res/ColorStateList;

    .line 186
    .line 187
    if-eqz p0, :cond_b

    .line 188
    .line 189
    invoke-static {p1, p0}, Ll/iqy;->d(Landroid/view/MenuItem;Landroid/content/res/ColorStateList;)V

    .line 190
    .line 191
    .line 192
    :cond_b
    return-void
.end method
