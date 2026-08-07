.class public Ll/fv0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/fv0$a;
    }
.end annotation


# instance fields
.field public final a:Landroid/widget/TextView;

.field public b:Ll/r0j0;

.field public c:Ll/r0j0;

.field public d:Ll/r0j0;

.field public e:Ll/r0j0;

.field public f:Ll/r0j0;

.field public g:Ll/r0j0;

.field public h:Ll/r0j0;

.field public final i:Ll/iv0;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public j:I

.field public k:I

.field public l:Landroid/graphics/Typeface;

.field public m:Z


# direct methods
.method public constructor <init>(Landroid/widget/TextView;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/fv0;->j:I

    .line 6
    .line 7
    const/4 v0, -0x1

    .line 8
    iput v0, p0, Ll/fv0;->k:I

    .line 9
    .line 10
    iput-object p1, p0, Ll/fv0;->a:Landroid/widget/TextView;

    .line 11
    .line 12
    new-instance v0, Ll/iv0;

    .line 13
    .line 14
    invoke-direct {v0, p1}, Ll/iv0;-><init>(Landroid/widget/TextView;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/fv0;->i:Ll/iv0;

    .line 18
    .line 19
    return-void
.end method

.method public static d(Landroid/content/Context;Ll/ou0;I)Ll/r0j0;
    .locals 0

    .line 1
    invoke-virtual {p1, p0, p2}, Ll/ou0;->f(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    new-instance p1, Ll/r0j0;

    .line 8
    .line 9
    invoke-direct {p1}, Ll/r0j0;-><init>()V

    .line 10
    .line 11
    .line 12
    const/4 p2, 0x1

    .line 13
    iput-boolean p2, p1, Ll/r0j0;->d:Z

    .line 14
    .line 15
    iput-object p0, p1, Ll/r0j0;->a:Landroid/content/res/ColorStateList;

    .line 16
    .line 17
    return-object p1

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return-object p0
.end method


# virtual methods
.method public final A(IF)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fv0;->i:Ll/iv0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/iv0;->u(IF)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public B(Landroid/graphics/Typeface;)V
    .locals 1
    .param p1    # Landroid/graphics/Typeface;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/RestrictTo;
        value = {
            .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY:Landroidx/annotation/RestrictTo$Scope;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/fv0;->m:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/fv0;->a:Landroid/widget/TextView;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Ll/fv0;->l:Landroid/graphics/Typeface;

    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final C(Landroid/content/Context;Ll/t0j0;)V
    .locals 9

    .line 1
    sget v0, Ll/gic0;->Y2:I

    .line 2
    .line 3
    iget v1, p0, Ll/fv0;->j:I

    .line 4
    .line 5
    invoke-virtual {p2, v0, v1}, Ll/t0j0;->k(II)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iput v0, p0, Ll/fv0;->j:I

    .line 10
    .line 11
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 12
    .line 13
    const/4 v1, 0x2

    .line 14
    const/4 v2, -0x1

    .line 15
    const/16 v3, 0x1c

    .line 16
    .line 17
    if-lt v0, v3, :cond_0

    .line 18
    .line 19
    sget v4, Ll/gic0;->b3:I

    .line 20
    .line 21
    invoke-virtual {p2, v4, v2}, Ll/t0j0;->k(II)I

    .line 22
    .line 23
    .line 24
    move-result v4

    .line 25
    iput v4, p0, Ll/fv0;->k:I

    .line 26
    .line 27
    if-eq v4, v2, :cond_0

    .line 28
    .line 29
    iget v4, p0, Ll/fv0;->j:I

    .line 30
    .line 31
    and-int/2addr v4, v1

    .line 32
    iput v4, p0, Ll/fv0;->j:I

    .line 33
    .line 34
    :cond_0
    sget v4, Ll/gic0;->a3:I

    .line 35
    .line 36
    invoke-virtual {p2, v4}, Ll/t0j0;->r(I)Z

    .line 37
    .line 38
    .line 39
    move-result v4

    .line 40
    const/4 v5, 0x1

    .line 41
    const/4 v6, 0x0

    .line 42
    if-nez v4, :cond_5

    .line 43
    .line 44
    sget v4, Ll/gic0;->c3:I

    .line 45
    .line 46
    invoke-virtual {p2, v4}, Ll/t0j0;->r(I)Z

    .line 47
    .line 48
    .line 49
    move-result v4

    .line 50
    if-eqz v4, :cond_1

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    sget p1, Ll/gic0;->X2:I

    .line 54
    .line 55
    invoke-virtual {p2, p1}, Ll/t0j0;->r(I)Z

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    if-eqz p1, :cond_e

    .line 60
    .line 61
    iput-boolean v6, p0, Ll/fv0;->m:Z

    .line 62
    .line 63
    sget p1, Ll/gic0;->X2:I

    .line 64
    .line 65
    invoke-virtual {p2, p1, v5}, Ll/t0j0;->k(II)I

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-eq p1, v5, :cond_4

    .line 70
    .line 71
    if-eq p1, v1, :cond_3

    .line 72
    .line 73
    const/4 p2, 0x3

    .line 74
    if-eq p1, p2, :cond_2

    .line 75
    .line 76
    goto/16 :goto_6

    .line 77
    .line 78
    :cond_2
    sget-object p1, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    .line 79
    .line 80
    iput-object p1, p0, Ll/fv0;->l:Landroid/graphics/Typeface;

    .line 81
    .line 82
    return-void

    .line 83
    :cond_3
    sget-object p1, Landroid/graphics/Typeface;->SERIF:Landroid/graphics/Typeface;

    .line 84
    .line 85
    iput-object p1, p0, Ll/fv0;->l:Landroid/graphics/Typeface;

    .line 86
    .line 87
    return-void

    .line 88
    :cond_4
    sget-object p1, Landroid/graphics/Typeface;->SANS_SERIF:Landroid/graphics/Typeface;

    .line 89
    .line 90
    iput-object p1, p0, Ll/fv0;->l:Landroid/graphics/Typeface;

    .line 91
    .line 92
    return-void

    .line 93
    :cond_5
    :goto_0
    const/4 v4, 0x0

    .line 94
    iput-object v4, p0, Ll/fv0;->l:Landroid/graphics/Typeface;

    .line 95
    .line 96
    sget v4, Ll/gic0;->c3:I

    .line 97
    .line 98
    invoke-virtual {p2, v4}, Ll/t0j0;->r(I)Z

    .line 99
    .line 100
    .line 101
    move-result v4

    .line 102
    if-eqz v4, :cond_6

    .line 103
    .line 104
    sget v4, Ll/gic0;->c3:I

    .line 105
    .line 106
    goto :goto_1

    .line 107
    :cond_6
    sget v4, Ll/gic0;->a3:I

    .line 108
    .line 109
    :goto_1
    iget v7, p0, Ll/fv0;->k:I

    .line 110
    .line 111
    iget v8, p0, Ll/fv0;->j:I

    .line 112
    .line 113
    invoke-virtual {p1}, Landroid/content/Context;->isRestricted()Z

    .line 114
    .line 115
    .line 116
    move-result p1

    .line 117
    if-nez p1, :cond_b

    .line 118
    .line 119
    new-instance p1, Ll/fv0$a;

    .line 120
    .line 121
    invoke-direct {p1, p0, v7, v8}, Ll/fv0$a;-><init>(Ll/fv0;II)V

    .line 122
    .line 123
    .line 124
    :try_start_0
    iget v7, p0, Ll/fv0;->j:I

    .line 125
    .line 126
    invoke-virtual {p2, v4, v7, p1}, Ll/t0j0;->j(IILl/c5d0$e;)Landroid/graphics/Typeface;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    if-eqz p1, :cond_9

    .line 131
    .line 132
    if-lt v0, v3, :cond_8

    .line 133
    .line 134
    iget v0, p0, Ll/fv0;->k:I

    .line 135
    .line 136
    if-eq v0, v2, :cond_8

    .line 137
    .line 138
    invoke-static {p1, v6}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    iget v0, p0, Ll/fv0;->k:I

    .line 143
    .line 144
    iget v7, p0, Ll/fv0;->j:I

    .line 145
    .line 146
    and-int/2addr v7, v1

    .line 147
    if-eqz v7, :cond_7

    .line 148
    .line 149
    move v7, v5

    .line 150
    goto :goto_2

    .line 151
    :cond_7
    move v7, v6

    .line 152
    :goto_2
    invoke-static {p1, v0, v7}, Ll/ev0;->a(Landroid/graphics/Typeface;IZ)Landroid/graphics/Typeface;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    iput-object p1, p0, Ll/fv0;->l:Landroid/graphics/Typeface;

    .line 157
    .line 158
    goto :goto_3

    .line 159
    :cond_8
    iput-object p1, p0, Ll/fv0;->l:Landroid/graphics/Typeface;

    .line 160
    .line 161
    :cond_9
    :goto_3
    iget-object p1, p0, Ll/fv0;->l:Landroid/graphics/Typeface;

    .line 162
    .line 163
    if-nez p1, :cond_a

    .line 164
    .line 165
    move p1, v5

    .line 166
    goto :goto_4

    .line 167
    :cond_a
    move p1, v6

    .line 168
    :goto_4
    iput-boolean p1, p0, Ll/fv0;->m:Z
    :try_end_0
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 169
    .line 170
    :catch_0
    :cond_b
    iget-object p1, p0, Ll/fv0;->l:Landroid/graphics/Typeface;

    .line 171
    .line 172
    if-nez p1, :cond_e

    .line 173
    .line 174
    invoke-virtual {p2, v4}, Ll/t0j0;->o(I)Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object p1

    .line 178
    if-eqz p1, :cond_e

    .line 179
    .line 180
    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 181
    .line 182
    if-lt p2, v3, :cond_d

    .line 183
    .line 184
    iget p2, p0, Ll/fv0;->k:I

    .line 185
    .line 186
    if-eq p2, v2, :cond_d

    .line 187
    .line 188
    invoke-static {p1, v6}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    .line 189
    .line 190
    .line 191
    move-result-object p1

    .line 192
    iget p2, p0, Ll/fv0;->k:I

    .line 193
    .line 194
    iget v0, p0, Ll/fv0;->j:I

    .line 195
    .line 196
    and-int/2addr v0, v1

    .line 197
    if-eqz v0, :cond_c

    .line 198
    .line 199
    goto :goto_5

    .line 200
    :cond_c
    move v5, v6

    .line 201
    :goto_5
    invoke-static {p1, p2, v5}, Ll/ev0;->a(Landroid/graphics/Typeface;IZ)Landroid/graphics/Typeface;

    .line 202
    .line 203
    .line 204
    move-result-object p1

    .line 205
    iput-object p1, p0, Ll/fv0;->l:Landroid/graphics/Typeface;

    .line 206
    .line 207
    goto :goto_6

    .line 208
    :cond_d
    iget p2, p0, Ll/fv0;->j:I

    .line 209
    .line 210
    invoke-static {p1, p2}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    .line 211
    .line 212
    .line 213
    move-result-object p1

    .line 214
    iput-object p1, p0, Ll/fv0;->l:Landroid/graphics/Typeface;

    .line 215
    .line 216
    :cond_e
    :goto_6
    return-void
.end method

.method public final a(Landroid/graphics/drawable/Drawable;Ll/r0j0;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/fv0;->a:Landroid/widget/TextView;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getDrawableState()[I

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p1, p2, p0}, Ll/ou0;->i(Landroid/graphics/drawable/Drawable;Ll/r0j0;[I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public b()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/fv0;->b:Ll/r0j0;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    const/4 v2, 0x0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/fv0;->c:Ll/r0j0;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/fv0;->d:Ll/r0j0;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/fv0;->e:Ll/r0j0;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Ll/fv0;->a:Landroid/widget/TextView;

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    aget-object v3, v0, v2

    .line 26
    .line 27
    iget-object v4, p0, Ll/fv0;->b:Ll/r0j0;

    .line 28
    .line 29
    invoke-virtual {p0, v3, v4}, Ll/fv0;->a(Landroid/graphics/drawable/Drawable;Ll/r0j0;)V

    .line 30
    .line 31
    .line 32
    const/4 v3, 0x1

    .line 33
    aget-object v3, v0, v3

    .line 34
    .line 35
    iget-object v4, p0, Ll/fv0;->c:Ll/r0j0;

    .line 36
    .line 37
    invoke-virtual {p0, v3, v4}, Ll/fv0;->a(Landroid/graphics/drawable/Drawable;Ll/r0j0;)V

    .line 38
    .line 39
    .line 40
    aget-object v3, v0, v1

    .line 41
    .line 42
    iget-object v4, p0, Ll/fv0;->d:Ll/r0j0;

    .line 43
    .line 44
    invoke-virtual {p0, v3, v4}, Ll/fv0;->a(Landroid/graphics/drawable/Drawable;Ll/r0j0;)V

    .line 45
    .line 46
    .line 47
    const/4 v3, 0x3

    .line 48
    aget-object v0, v0, v3

    .line 49
    .line 50
    iget-object v3, p0, Ll/fv0;->e:Ll/r0j0;

    .line 51
    .line 52
    invoke-virtual {p0, v0, v3}, Ll/fv0;->a(Landroid/graphics/drawable/Drawable;Ll/r0j0;)V

    .line 53
    .line 54
    .line 55
    :cond_1
    iget-object v0, p0, Ll/fv0;->f:Ll/r0j0;

    .line 56
    .line 57
    if-nez v0, :cond_3

    .line 58
    .line 59
    iget-object v0, p0, Ll/fv0;->g:Ll/r0j0;

    .line 60
    .line 61
    if-eqz v0, :cond_2

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_2
    return-void

    .line 65
    :cond_3
    :goto_0
    iget-object v0, p0, Ll/fv0;->a:Landroid/widget/TextView;

    .line 66
    .line 67
    invoke-virtual {v0}, Landroid/widget/TextView;->getCompoundDrawablesRelative()[Landroid/graphics/drawable/Drawable;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    aget-object v2, v0, v2

    .line 72
    .line 73
    iget-object v3, p0, Ll/fv0;->f:Ll/r0j0;

    .line 74
    .line 75
    invoke-virtual {p0, v2, v3}, Ll/fv0;->a(Landroid/graphics/drawable/Drawable;Ll/r0j0;)V

    .line 76
    .line 77
    .line 78
    aget-object v0, v0, v1

    .line 79
    .line 80
    iget-object v1, p0, Ll/fv0;->g:Ll/r0j0;

    .line 81
    .line 82
    invoke-virtual {p0, v0, v1}, Ll/fv0;->a(Landroid/graphics/drawable/Drawable;Ll/r0j0;)V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public c()V
    .locals 0
    .annotation build Landroidx/annotation/RestrictTo;
        value = {
            .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY_GROUP_PREFIX:Landroidx/annotation/RestrictTo$Scope;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/fv0;->i:Ll/iv0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/iv0;->a()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public e()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fv0;->i:Ll/iv0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/iv0;->g()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public f()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fv0;->i:Ll/iv0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/iv0;->h()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public g()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fv0;->i:Ll/iv0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/iv0;->i()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public h()[I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fv0;->i:Ll/iv0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/iv0;->j()[I

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public i()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fv0;->i:Ll/iv0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/iv0;->k()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public j()Landroid/content/res/ColorStateList;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/fv0;->h:Ll/r0j0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/r0j0;->a:Landroid/content/res/ColorStateList;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return-object p0
.end method

.method public k()Landroid/graphics/PorterDuff$Mode;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/fv0;->h:Ll/r0j0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/r0j0;->b:Landroid/graphics/PorterDuff$Mode;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return-object p0
.end method

.method public l()Z
    .locals 0
    .annotation build Landroidx/annotation/RestrictTo;
        value = {
            .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY_GROUP_PREFIX:Landroidx/annotation/RestrictTo$Scope;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/fv0;->i:Ll/iv0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/iv0;->o()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public m(Landroid/util/AttributeSet;I)V
    .locals 16
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move/from16 v2, p2

    .line 6
    .line 7
    iget-object v3, v0, Ll/fv0;->a:Landroid/widget/TextView;

    .line 8
    .line 9
    invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    invoke-static {}, Ll/ou0;->b()Ll/ou0;

    .line 14
    .line 15
    .line 16
    move-result-object v4

    .line 17
    sget-object v5, Ll/gic0;->Y:[I

    .line 18
    .line 19
    const/4 v6, 0x0

    .line 20
    invoke-static {v3, v1, v5, v2, v6}, Ll/t0j0;->u(Landroid/content/Context;Landroid/util/AttributeSet;[III)Ll/t0j0;

    .line 21
    .line 22
    .line 23
    move-result-object v5

    .line 24
    sget v7, Ll/gic0;->Z:I

    .line 25
    .line 26
    const/4 v8, -0x1

    .line 27
    invoke-virtual {v5, v7, v8}, Ll/t0j0;->n(II)I

    .line 28
    .line 29
    .line 30
    move-result v7

    .line 31
    sget v9, Ll/gic0;->c0:I

    .line 32
    .line 33
    invoke-virtual {v5, v9}, Ll/t0j0;->r(I)Z

    .line 34
    .line 35
    .line 36
    move-result v9

    .line 37
    if-eqz v9, :cond_0

    .line 38
    .line 39
    sget v9, Ll/gic0;->c0:I

    .line 40
    .line 41
    invoke-virtual {v5, v9, v6}, Ll/t0j0;->n(II)I

    .line 42
    .line 43
    .line 44
    move-result v9

    .line 45
    invoke-static {v3, v4, v9}, Ll/fv0;->d(Landroid/content/Context;Ll/ou0;I)Ll/r0j0;

    .line 46
    .line 47
    .line 48
    move-result-object v9

    .line 49
    iput-object v9, v0, Ll/fv0;->b:Ll/r0j0;

    .line 50
    .line 51
    :cond_0
    sget v9, Ll/gic0;->a0:I

    .line 52
    .line 53
    invoke-virtual {v5, v9}, Ll/t0j0;->r(I)Z

    .line 54
    .line 55
    .line 56
    move-result v9

    .line 57
    if-eqz v9, :cond_1

    .line 58
    .line 59
    sget v9, Ll/gic0;->a0:I

    .line 60
    .line 61
    invoke-virtual {v5, v9, v6}, Ll/t0j0;->n(II)I

    .line 62
    .line 63
    .line 64
    move-result v9

    .line 65
    invoke-static {v3, v4, v9}, Ll/fv0;->d(Landroid/content/Context;Ll/ou0;I)Ll/r0j0;

    .line 66
    .line 67
    .line 68
    move-result-object v9

    .line 69
    iput-object v9, v0, Ll/fv0;->c:Ll/r0j0;

    .line 70
    .line 71
    :cond_1
    sget v9, Ll/gic0;->d0:I

    .line 72
    .line 73
    invoke-virtual {v5, v9}, Ll/t0j0;->r(I)Z

    .line 74
    .line 75
    .line 76
    move-result v9

    .line 77
    if-eqz v9, :cond_2

    .line 78
    .line 79
    sget v9, Ll/gic0;->d0:I

    .line 80
    .line 81
    invoke-virtual {v5, v9, v6}, Ll/t0j0;->n(II)I

    .line 82
    .line 83
    .line 84
    move-result v9

    .line 85
    invoke-static {v3, v4, v9}, Ll/fv0;->d(Landroid/content/Context;Ll/ou0;I)Ll/r0j0;

    .line 86
    .line 87
    .line 88
    move-result-object v9

    .line 89
    iput-object v9, v0, Ll/fv0;->d:Ll/r0j0;

    .line 90
    .line 91
    :cond_2
    sget v9, Ll/gic0;->b0:I

    .line 92
    .line 93
    invoke-virtual {v5, v9}, Ll/t0j0;->r(I)Z

    .line 94
    .line 95
    .line 96
    move-result v9

    .line 97
    if-eqz v9, :cond_3

    .line 98
    .line 99
    sget v9, Ll/gic0;->b0:I

    .line 100
    .line 101
    invoke-virtual {v5, v9, v6}, Ll/t0j0;->n(II)I

    .line 102
    .line 103
    .line 104
    move-result v9

    .line 105
    invoke-static {v3, v4, v9}, Ll/fv0;->d(Landroid/content/Context;Ll/ou0;I)Ll/r0j0;

    .line 106
    .line 107
    .line 108
    move-result-object v9

    .line 109
    iput-object v9, v0, Ll/fv0;->e:Ll/r0j0;

    .line 110
    .line 111
    :cond_3
    sget v9, Ll/gic0;->e0:I

    .line 112
    .line 113
    invoke-virtual {v5, v9}, Ll/t0j0;->r(I)Z

    .line 114
    .line 115
    .line 116
    move-result v9

    .line 117
    if-eqz v9, :cond_4

    .line 118
    .line 119
    sget v9, Ll/gic0;->e0:I

    .line 120
    .line 121
    invoke-virtual {v5, v9, v6}, Ll/t0j0;->n(II)I

    .line 122
    .line 123
    .line 124
    move-result v9

    .line 125
    invoke-static {v3, v4, v9}, Ll/fv0;->d(Landroid/content/Context;Ll/ou0;I)Ll/r0j0;

    .line 126
    .line 127
    .line 128
    move-result-object v9

    .line 129
    iput-object v9, v0, Ll/fv0;->f:Ll/r0j0;

    .line 130
    .line 131
    :cond_4
    sget v9, Ll/gic0;->f0:I

    .line 132
    .line 133
    invoke-virtual {v5, v9}, Ll/t0j0;->r(I)Z

    .line 134
    .line 135
    .line 136
    move-result v9

    .line 137
    if-eqz v9, :cond_5

    .line 138
    .line 139
    sget v9, Ll/gic0;->f0:I

    .line 140
    .line 141
    invoke-virtual {v5, v9, v6}, Ll/t0j0;->n(II)I

    .line 142
    .line 143
    .line 144
    move-result v9

    .line 145
    invoke-static {v3, v4, v9}, Ll/fv0;->d(Landroid/content/Context;Ll/ou0;I)Ll/r0j0;

    .line 146
    .line 147
    .line 148
    move-result-object v9

    .line 149
    iput-object v9, v0, Ll/fv0;->g:Ll/r0j0;

    .line 150
    .line 151
    :cond_5
    invoke-virtual {v5}, Ll/t0j0;->v()V

    .line 152
    .line 153
    .line 154
    iget-object v5, v0, Ll/fv0;->a:Landroid/widget/TextView;

    .line 155
    .line 156
    invoke-virtual {v5}, Landroid/widget/TextView;->getTransformationMethod()Landroid/text/method/TransformationMethod;

    .line 157
    .line 158
    .line 159
    move-result-object v5

    .line 160
    instance-of v5, v5, Landroid/text/method/PasswordTransformationMethod;

    .line 161
    .line 162
    const/16 v9, 0x1a

    .line 163
    .line 164
    const/4 v11, 0x0

    .line 165
    if-eq v7, v8, :cond_9

    .line 166
    .line 167
    sget-object v12, Ll/gic0;->V2:[I

    .line 168
    .line 169
    invoke-static {v3, v7, v12}, Ll/t0j0;->s(Landroid/content/Context;I[I)Ll/t0j0;

    .line 170
    .line 171
    .line 172
    move-result-object v7

    .line 173
    if-nez v5, :cond_6

    .line 174
    .line 175
    sget v12, Ll/gic0;->e3:I

    .line 176
    .line 177
    invoke-virtual {v7, v12}, Ll/t0j0;->r(I)Z

    .line 178
    .line 179
    .line 180
    move-result v12

    .line 181
    if-eqz v12, :cond_6

    .line 182
    .line 183
    sget v12, Ll/gic0;->e3:I

    .line 184
    .line 185
    invoke-virtual {v7, v12, v6}, Ll/t0j0;->a(IZ)Z

    .line 186
    .line 187
    .line 188
    move-result v12

    .line 189
    const/4 v13, 0x1

    .line 190
    goto :goto_0

    .line 191
    :cond_6
    move v12, v6

    .line 192
    move v13, v12

    .line 193
    :goto_0
    invoke-virtual {v0, v3, v7}, Ll/fv0;->C(Landroid/content/Context;Ll/t0j0;)V

    .line 194
    .line 195
    .line 196
    sget v14, Ll/gic0;->f3:I

    .line 197
    .line 198
    invoke-virtual {v7, v14}, Ll/t0j0;->r(I)Z

    .line 199
    .line 200
    .line 201
    move-result v14

    .line 202
    if-eqz v14, :cond_7

    .line 203
    .line 204
    sget v14, Ll/gic0;->f3:I

    .line 205
    .line 206
    invoke-virtual {v7, v14}, Ll/t0j0;->o(I)Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object v14

    .line 210
    goto :goto_1

    .line 211
    :cond_7
    move-object v14, v11

    .line 212
    :goto_1
    sget v15, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 213
    .line 214
    if-lt v15, v9, :cond_8

    .line 215
    .line 216
    sget v15, Ll/gic0;->d3:I

    .line 217
    .line 218
    invoke-virtual {v7, v15}, Ll/t0j0;->r(I)Z

    .line 219
    .line 220
    .line 221
    move-result v15

    .line 222
    if-eqz v15, :cond_8

    .line 223
    .line 224
    sget v15, Ll/gic0;->d3:I

    .line 225
    .line 226
    invoke-virtual {v7, v15}, Ll/t0j0;->o(I)Ljava/lang/String;

    .line 227
    .line 228
    .line 229
    move-result-object v15

    .line 230
    goto :goto_2

    .line 231
    :cond_8
    move-object v15, v11

    .line 232
    :goto_2
    invoke-virtual {v7}, Ll/t0j0;->v()V

    .line 233
    .line 234
    .line 235
    goto :goto_3

    .line 236
    :cond_9
    move v12, v6

    .line 237
    move v13, v12

    .line 238
    move-object v14, v11

    .line 239
    move-object v15, v14

    .line 240
    :goto_3
    sget-object v7, Ll/gic0;->V2:[I

    .line 241
    .line 242
    invoke-static {v3, v1, v7, v2, v6}, Ll/t0j0;->u(Landroid/content/Context;Landroid/util/AttributeSet;[III)Ll/t0j0;

    .line 243
    .line 244
    .line 245
    move-result-object v7

    .line 246
    if-nez v5, :cond_a

    .line 247
    .line 248
    sget v10, Ll/gic0;->e3:I

    .line 249
    .line 250
    invoke-virtual {v7, v10}, Ll/t0j0;->r(I)Z

    .line 251
    .line 252
    .line 253
    move-result v10

    .line 254
    if-eqz v10, :cond_a

    .line 255
    .line 256
    sget v10, Ll/gic0;->e3:I

    .line 257
    .line 258
    invoke-virtual {v7, v10, v6}, Ll/t0j0;->a(IZ)Z

    .line 259
    .line 260
    .line 261
    move-result v12

    .line 262
    const/4 v10, 0x1

    .line 263
    goto :goto_4

    .line 264
    :cond_a
    move v10, v13

    .line 265
    :goto_4
    sget v13, Ll/gic0;->f3:I

    .line 266
    .line 267
    invoke-virtual {v7, v13}, Ll/t0j0;->r(I)Z

    .line 268
    .line 269
    .line 270
    move-result v13

    .line 271
    if-eqz v13, :cond_b

    .line 272
    .line 273
    sget v13, Ll/gic0;->f3:I

    .line 274
    .line 275
    invoke-virtual {v7, v13}, Ll/t0j0;->o(I)Ljava/lang/String;

    .line 276
    .line 277
    .line 278
    move-result-object v14

    .line 279
    :cond_b
    sget v13, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 280
    .line 281
    if-lt v13, v9, :cond_c

    .line 282
    .line 283
    sget v9, Ll/gic0;->d3:I

    .line 284
    .line 285
    invoke-virtual {v7, v9}, Ll/t0j0;->r(I)Z

    .line 286
    .line 287
    .line 288
    move-result v9

    .line 289
    if-eqz v9, :cond_c

    .line 290
    .line 291
    sget v9, Ll/gic0;->d3:I

    .line 292
    .line 293
    invoke-virtual {v7, v9}, Ll/t0j0;->o(I)Ljava/lang/String;

    .line 294
    .line 295
    .line 296
    move-result-object v15

    .line 297
    :cond_c
    const/16 v9, 0x1c

    .line 298
    .line 299
    if-lt v13, v9, :cond_d

    .line 300
    .line 301
    sget v9, Ll/gic0;->W2:I

    .line 302
    .line 303
    invoke-virtual {v7, v9}, Ll/t0j0;->r(I)Z

    .line 304
    .line 305
    .line 306
    move-result v9

    .line 307
    if-eqz v9, :cond_d

    .line 308
    .line 309
    sget v9, Ll/gic0;->W2:I

    .line 310
    .line 311
    invoke-virtual {v7, v9, v8}, Ll/t0j0;->f(II)I

    .line 312
    .line 313
    .line 314
    move-result v9

    .line 315
    if-nez v9, :cond_d

    .line 316
    .line 317
    iget-object v9, v0, Ll/fv0;->a:Landroid/widget/TextView;

    .line 318
    .line 319
    const/4 v13, 0x0

    .line 320
    invoke-virtual {v9, v6, v13}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 321
    .line 322
    .line 323
    :cond_d
    invoke-virtual {v0, v3, v7}, Ll/fv0;->C(Landroid/content/Context;Ll/t0j0;)V

    .line 324
    .line 325
    .line 326
    invoke-virtual {v7}, Ll/t0j0;->v()V

    .line 327
    .line 328
    .line 329
    if-nez v5, :cond_e

    .line 330
    .line 331
    if-eqz v10, :cond_e

    .line 332
    .line 333
    invoke-virtual {v0, v12}, Ll/fv0;->r(Z)V

    .line 334
    .line 335
    .line 336
    :cond_e
    iget-object v5, v0, Ll/fv0;->l:Landroid/graphics/Typeface;

    .line 337
    .line 338
    if-eqz v5, :cond_10

    .line 339
    .line 340
    iget v7, v0, Ll/fv0;->k:I

    .line 341
    .line 342
    iget-object v9, v0, Ll/fv0;->a:Landroid/widget/TextView;

    .line 343
    .line 344
    if-ne v7, v8, :cond_f

    .line 345
    .line 346
    iget v7, v0, Ll/fv0;->j:I

    .line 347
    .line 348
    invoke-virtual {v9, v5, v7}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 349
    .line 350
    .line 351
    goto :goto_5

    .line 352
    :cond_f
    invoke-virtual {v9, v5}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 353
    .line 354
    .line 355
    :cond_10
    :goto_5
    if-eqz v15, :cond_11

    .line 356
    .line 357
    iget-object v5, v0, Ll/fv0;->a:Landroid/widget/TextView;

    .line 358
    .line 359
    invoke-static {v5, v15}, Ll/av0;->a(Landroid/widget/TextView;Ljava/lang/String;)Z

    .line 360
    .line 361
    .line 362
    :cond_11
    if-eqz v14, :cond_12

    .line 363
    .line 364
    iget-object v5, v0, Ll/fv0;->a:Landroid/widget/TextView;

    .line 365
    .line 366
    invoke-static {v14}, Landroid/os/LocaleList;->forLanguageTags(Ljava/lang/String;)Landroid/os/LocaleList;

    .line 367
    .line 368
    .line 369
    move-result-object v7

    .line 370
    invoke-virtual {v5, v7}, Landroid/widget/TextView;->setTextLocales(Landroid/os/LocaleList;)V

    .line 371
    .line 372
    .line 373
    :cond_12
    iget-object v5, v0, Ll/fv0;->i:Ll/iv0;

    .line 374
    .line 375
    invoke-virtual {v5, v1, v2}, Ll/iv0;->p(Landroid/util/AttributeSet;I)V

    .line 376
    .line 377
    .line 378
    sget-boolean v2, Ll/qj1;->f0:Z

    .line 379
    .line 380
    if-eqz v2, :cond_14

    .line 381
    .line 382
    iget-object v2, v0, Ll/fv0;->i:Ll/iv0;

    .line 383
    .line 384
    invoke-virtual {v2}, Ll/iv0;->k()I

    .line 385
    .line 386
    .line 387
    move-result v2

    .line 388
    if-eqz v2, :cond_14

    .line 389
    .line 390
    iget-object v2, v0, Ll/fv0;->i:Ll/iv0;

    .line 391
    .line 392
    invoke-virtual {v2}, Ll/iv0;->j()[I

    .line 393
    .line 394
    .line 395
    move-result-object v2

    .line 396
    array-length v5, v2

    .line 397
    if-lez v5, :cond_14

    .line 398
    .line 399
    iget-object v5, v0, Ll/fv0;->a:Landroid/widget/TextView;

    .line 400
    .line 401
    invoke-static {v5}, Ll/bv0;->a(Landroid/widget/TextView;)I

    .line 402
    .line 403
    .line 404
    move-result v5

    .line 405
    int-to-float v5, v5

    .line 406
    const/high16 v7, -0x40800000    # -1.0f

    .line 407
    .line 408
    cmpl-float v5, v5, v7

    .line 409
    .line 410
    iget-object v7, v0, Ll/fv0;->a:Landroid/widget/TextView;

    .line 411
    .line 412
    if-eqz v5, :cond_13

    .line 413
    .line 414
    iget-object v2, v0, Ll/fv0;->i:Ll/iv0;

    .line 415
    .line 416
    invoke-virtual {v2}, Ll/iv0;->h()I

    .line 417
    .line 418
    .line 419
    move-result v2

    .line 420
    iget-object v5, v0, Ll/fv0;->i:Ll/iv0;

    .line 421
    .line 422
    invoke-virtual {v5}, Ll/iv0;->g()I

    .line 423
    .line 424
    .line 425
    move-result v5

    .line 426
    iget-object v9, v0, Ll/fv0;->i:Ll/iv0;

    .line 427
    .line 428
    invoke-virtual {v9}, Ll/iv0;->i()I

    .line 429
    .line 430
    .line 431
    move-result v9

    .line 432
    invoke-static {v7, v2, v5, v9, v6}, Ll/cv0;->a(Landroid/widget/TextView;IIII)V

    .line 433
    .line 434
    .line 435
    goto :goto_6

    .line 436
    :cond_13
    invoke-static {v7, v2, v6}, Ll/dv0;->a(Landroid/widget/TextView;[II)V

    .line 437
    .line 438
    .line 439
    :cond_14
    :goto_6
    sget-object v2, Ll/gic0;->g0:[I

    .line 440
    .line 441
    invoke-static {v3, v1, v2}, Ll/t0j0;->t(Landroid/content/Context;Landroid/util/AttributeSet;[I)Ll/t0j0;

    .line 442
    .line 443
    .line 444
    move-result-object v7

    .line 445
    sget v1, Ll/gic0;->o0:I

    .line 446
    .line 447
    invoke-virtual {v7, v1, v8}, Ll/t0j0;->n(II)I

    .line 448
    .line 449
    .line 450
    move-result v1

    .line 451
    if-eq v1, v8, :cond_15

    .line 452
    .line 453
    invoke-virtual {v4, v3, v1}, Ll/ou0;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 454
    .line 455
    .line 456
    move-result-object v1

    .line 457
    goto :goto_7

    .line 458
    :cond_15
    move-object v1, v11

    .line 459
    :goto_7
    sget v2, Ll/gic0;->t0:I

    .line 460
    .line 461
    invoke-virtual {v7, v2, v8}, Ll/t0j0;->n(II)I

    .line 462
    .line 463
    .line 464
    move-result v2

    .line 465
    if-eq v2, v8, :cond_16

    .line 466
    .line 467
    invoke-virtual {v4, v3, v2}, Ll/ou0;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 468
    .line 469
    .line 470
    move-result-object v2

    .line 471
    goto :goto_8

    .line 472
    :cond_16
    move-object v2, v11

    .line 473
    :goto_8
    sget v5, Ll/gic0;->p0:I

    .line 474
    .line 475
    invoke-virtual {v7, v5, v8}, Ll/t0j0;->n(II)I

    .line 476
    .line 477
    .line 478
    move-result v5

    .line 479
    if-eq v5, v8, :cond_17

    .line 480
    .line 481
    invoke-virtual {v4, v3, v5}, Ll/ou0;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 482
    .line 483
    .line 484
    move-result-object v5

    .line 485
    goto :goto_9

    .line 486
    :cond_17
    move-object v5, v11

    .line 487
    :goto_9
    sget v6, Ll/gic0;->m0:I

    .line 488
    .line 489
    invoke-virtual {v7, v6, v8}, Ll/t0j0;->n(II)I

    .line 490
    .line 491
    .line 492
    move-result v6

    .line 493
    if-eq v6, v8, :cond_18

    .line 494
    .line 495
    invoke-virtual {v4, v3, v6}, Ll/ou0;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 496
    .line 497
    .line 498
    move-result-object v6

    .line 499
    goto :goto_a

    .line 500
    :cond_18
    move-object v6, v11

    .line 501
    :goto_a
    sget v9, Ll/gic0;->q0:I

    .line 502
    .line 503
    invoke-virtual {v7, v9, v8}, Ll/t0j0;->n(II)I

    .line 504
    .line 505
    .line 506
    move-result v9

    .line 507
    if-eq v9, v8, :cond_19

    .line 508
    .line 509
    invoke-virtual {v4, v3, v9}, Ll/ou0;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 510
    .line 511
    .line 512
    move-result-object v9

    .line 513
    goto :goto_b

    .line 514
    :cond_19
    move-object v9, v11

    .line 515
    :goto_b
    sget v10, Ll/gic0;->n0:I

    .line 516
    .line 517
    invoke-virtual {v7, v10, v8}, Ll/t0j0;->n(II)I

    .line 518
    .line 519
    .line 520
    move-result v10

    .line 521
    if-eq v10, v8, :cond_1a

    .line 522
    .line 523
    invoke-virtual {v4, v3, v10}, Ll/ou0;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 524
    .line 525
    .line 526
    move-result-object v3

    .line 527
    move-object v4, v6

    .line 528
    move-object v6, v3

    .line 529
    :goto_c
    move-object v3, v5

    .line 530
    move-object v5, v9

    .line 531
    goto :goto_d

    .line 532
    :cond_1a
    move-object v4, v6

    .line 533
    move-object v6, v11

    .line 534
    goto :goto_c

    .line 535
    :goto_d
    invoke-virtual/range {v0 .. v6}, Ll/fv0;->x(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 536
    .line 537
    .line 538
    sget v1, Ll/gic0;->r0:I

    .line 539
    .line 540
    invoke-virtual {v7, v1}, Ll/t0j0;->r(I)Z

    .line 541
    .line 542
    .line 543
    move-result v1

    .line 544
    if-eqz v1, :cond_1b

    .line 545
    .line 546
    sget v1, Ll/gic0;->r0:I

    .line 547
    .line 548
    invoke-virtual {v7, v1}, Ll/t0j0;->c(I)Landroid/content/res/ColorStateList;

    .line 549
    .line 550
    .line 551
    move-result-object v1

    .line 552
    iget-object v2, v0, Ll/fv0;->a:Landroid/widget/TextView;

    .line 553
    .line 554
    invoke-static {v2, v1}, Ll/msi0;->h(Landroid/widget/TextView;Landroid/content/res/ColorStateList;)V

    .line 555
    .line 556
    .line 557
    :cond_1b
    sget v1, Ll/gic0;->s0:I

    .line 558
    .line 559
    invoke-virtual {v7, v1}, Ll/t0j0;->r(I)Z

    .line 560
    .line 561
    .line 562
    move-result v1

    .line 563
    if-eqz v1, :cond_1c

    .line 564
    .line 565
    sget v1, Ll/gic0;->s0:I

    .line 566
    .line 567
    invoke-virtual {v7, v1, v8}, Ll/t0j0;->k(II)I

    .line 568
    .line 569
    .line 570
    move-result v1

    .line 571
    invoke-static {v1, v11}, Ll/gde;->d(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuff$Mode;

    .line 572
    .line 573
    .line 574
    move-result-object v1

    .line 575
    iget-object v2, v0, Ll/fv0;->a:Landroid/widget/TextView;

    .line 576
    .line 577
    invoke-static {v2, v1}, Ll/msi0;->i(Landroid/widget/TextView;Landroid/graphics/PorterDuff$Mode;)V

    .line 578
    .line 579
    .line 580
    :cond_1c
    sget v1, Ll/gic0;->u0:I

    .line 581
    .line 582
    invoke-virtual {v7, v1, v8}, Ll/t0j0;->f(II)I

    .line 583
    .line 584
    .line 585
    move-result v1

    .line 586
    sget v2, Ll/gic0;->v0:I

    .line 587
    .line 588
    invoke-virtual {v7, v2, v8}, Ll/t0j0;->f(II)I

    .line 589
    .line 590
    .line 591
    move-result v2

    .line 592
    sget v3, Ll/gic0;->w0:I

    .line 593
    .line 594
    invoke-virtual {v7, v3, v8}, Ll/t0j0;->f(II)I

    .line 595
    .line 596
    .line 597
    move-result v3

    .line 598
    invoke-virtual {v7}, Ll/t0j0;->v()V

    .line 599
    .line 600
    .line 601
    if-eq v1, v8, :cond_1d

    .line 602
    .line 603
    iget-object v4, v0, Ll/fv0;->a:Landroid/widget/TextView;

    .line 604
    .line 605
    invoke-static {v4, v1}, Ll/msi0;->k(Landroid/widget/TextView;I)V

    .line 606
    .line 607
    .line 608
    :cond_1d
    if-eq v2, v8, :cond_1e

    .line 609
    .line 610
    iget-object v1, v0, Ll/fv0;->a:Landroid/widget/TextView;

    .line 611
    .line 612
    invoke-static {v1, v2}, Ll/msi0;->l(Landroid/widget/TextView;I)V

    .line 613
    .line 614
    .line 615
    :cond_1e
    if-eq v3, v8, :cond_1f

    .line 616
    .line 617
    iget-object v0, v0, Ll/fv0;->a:Landroid/widget/TextView;

    .line 618
    .line 619
    invoke-static {v0, v3}, Ll/msi0;->m(Landroid/widget/TextView;I)V

    .line 620
    .line 621
    .line 622
    :cond_1f
    return-void
.end method

.method public n(ZIIII)V
    .locals 0
    .annotation build Landroidx/annotation/RestrictTo;
        value = {
            .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY_GROUP_PREFIX:Landroidx/annotation/RestrictTo$Scope;
        }
    .end annotation

    .line 1
    sget-boolean p1, Ll/qj1;->f0:Z

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/fv0;->c()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public o()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/fv0;->b()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public p(Landroid/content/Context;I)V
    .locals 3

    .line 1
    sget-object v0, Ll/gic0;->V2:[I

    .line 2
    .line 3
    invoke-static {p1, p2, v0}, Ll/t0j0;->s(Landroid/content/Context;I[I)Ll/t0j0;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    sget v0, Ll/gic0;->e3:I

    .line 8
    .line 9
    invoke-virtual {p2, v0}, Ll/t0j0;->r(I)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    sget v0, Ll/gic0;->e3:I

    .line 17
    .line 18
    invoke-virtual {p2, v0, v1}, Ll/t0j0;->a(IZ)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    invoke-virtual {p0, v0}, Ll/fv0;->r(Z)V

    .line 23
    .line 24
    .line 25
    :cond_0
    sget v0, Ll/gic0;->W2:I

    .line 26
    .line 27
    invoke-virtual {p2, v0}, Ll/t0j0;->r(I)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    sget v0, Ll/gic0;->W2:I

    .line 34
    .line 35
    const/4 v2, -0x1

    .line 36
    invoke-virtual {p2, v0, v2}, Ll/t0j0;->f(II)I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-nez v0, :cond_1

    .line 41
    .line 42
    iget-object v0, p0, Ll/fv0;->a:Landroid/widget/TextView;

    .line 43
    .line 44
    const/4 v2, 0x0

    .line 45
    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 46
    .line 47
    .line 48
    :cond_1
    invoke-virtual {p0, p1, p2}, Ll/fv0;->C(Landroid/content/Context;Ll/t0j0;)V

    .line 49
    .line 50
    .line 51
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 52
    .line 53
    const/16 v0, 0x1a

    .line 54
    .line 55
    if-lt p1, v0, :cond_2

    .line 56
    .line 57
    sget p1, Ll/gic0;->d3:I

    .line 58
    .line 59
    invoke-virtual {p2, p1}, Ll/t0j0;->r(I)Z

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    if-eqz p1, :cond_2

    .line 64
    .line 65
    sget p1, Ll/gic0;->d3:I

    .line 66
    .line 67
    invoke-virtual {p2, p1}, Ll/t0j0;->o(I)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    if-eqz p1, :cond_2

    .line 72
    .line 73
    iget-object v0, p0, Ll/fv0;->a:Landroid/widget/TextView;

    .line 74
    .line 75
    invoke-static {v0, p1}, Ll/av0;->a(Landroid/widget/TextView;Ljava/lang/String;)Z

    .line 76
    .line 77
    .line 78
    :cond_2
    invoke-virtual {p2}, Ll/t0j0;->v()V

    .line 79
    .line 80
    .line 81
    iget-object p1, p0, Ll/fv0;->l:Landroid/graphics/Typeface;

    .line 82
    .line 83
    if-eqz p1, :cond_3

    .line 84
    .line 85
    iget-object p2, p0, Ll/fv0;->a:Landroid/widget/TextView;

    .line 86
    .line 87
    iget p0, p0, Ll/fv0;->j:I

    .line 88
    .line 89
    invoke-virtual {p2, p1, p0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 90
    .line 91
    .line 92
    :cond_3
    return-void
.end method

.method public q(Ljava/lang/Runnable;)V
    .locals 0
    .param p1    # Ljava/lang/Runnable;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/RestrictTo;
        value = {
            .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY:Landroidx/annotation/RestrictTo$Scope;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/fv0;->a:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public r(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fv0;->a:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setAllCaps(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public s(IIII)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/fv0;->i:Ll/iv0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/iv0;->q(IIII)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public t([II)V
    .locals 0
    .param p1    # [I
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/fv0;->i:Ll/iv0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/iv0;->r([II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public u(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fv0;->i:Ll/iv0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/iv0;->s(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public v(Landroid/content/res/ColorStateList;)V
    .locals 1
    .param p1    # Landroid/content/res/ColorStateList;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/fv0;->h:Ll/r0j0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/r0j0;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/r0j0;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/fv0;->h:Ll/r0j0;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Ll/fv0;->h:Ll/r0j0;

    .line 13
    .line 14
    iput-object p1, v0, Ll/r0j0;->a:Landroid/content/res/ColorStateList;

    .line 15
    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    const/4 p1, 0x1

    .line 19
    goto :goto_0

    .line 20
    :cond_1
    const/4 p1, 0x0

    .line 21
    :goto_0
    iput-boolean p1, v0, Ll/r0j0;->d:Z

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/fv0;->y()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public w(Landroid/graphics/PorterDuff$Mode;)V
    .locals 1
    .param p1    # Landroid/graphics/PorterDuff$Mode;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/fv0;->h:Ll/r0j0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/r0j0;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/r0j0;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/fv0;->h:Ll/r0j0;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Ll/fv0;->h:Ll/r0j0;

    .line 13
    .line 14
    iput-object p1, v0, Ll/r0j0;->b:Landroid/graphics/PorterDuff$Mode;

    .line 15
    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    const/4 p1, 0x1

    .line 19
    goto :goto_0

    .line 20
    :cond_1
    const/4 p1, 0x0

    .line 21
    :goto_0
    iput-boolean p1, v0, Ll/r0j0;->c:Z

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/fv0;->y()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final x(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V
    .locals 5

    .line 1
    const/4 v0, 0x3

    .line 2
    const/4 v1, 0x1

    .line 3
    const/4 v2, 0x0

    .line 4
    const/4 v3, 0x2

    .line 5
    if-nez p5, :cond_b

    .line 6
    .line 7
    if-eqz p6, :cond_0

    .line 8
    .line 9
    goto :goto_8

    .line 10
    :cond_0
    if-nez p1, :cond_2

    .line 11
    .line 12
    if-nez p2, :cond_2

    .line 13
    .line 14
    if-nez p3, :cond_2

    .line 15
    .line 16
    if-eqz p4, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    return-void

    .line 20
    :cond_2
    :goto_0
    iget-object p5, p0, Ll/fv0;->a:Landroid/widget/TextView;

    .line 21
    .line 22
    invoke-virtual {p5}, Landroid/widget/TextView;->getCompoundDrawablesRelative()[Landroid/graphics/drawable/Drawable;

    .line 23
    .line 24
    .line 25
    move-result-object p5

    .line 26
    aget-object p6, p5, v2

    .line 27
    .line 28
    if-nez p6, :cond_8

    .line 29
    .line 30
    aget-object v4, p5, v3

    .line 31
    .line 32
    if-eqz v4, :cond_3

    .line 33
    .line 34
    goto :goto_5

    .line 35
    :cond_3
    iget-object p5, p0, Ll/fv0;->a:Landroid/widget/TextView;

    .line 36
    .line 37
    invoke-virtual {p5}, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    .line 38
    .line 39
    .line 40
    move-result-object p5

    .line 41
    iget-object p0, p0, Ll/fv0;->a:Landroid/widget/TextView;

    .line 42
    .line 43
    if-eqz p1, :cond_4

    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_4
    aget-object p1, p5, v2

    .line 47
    .line 48
    :goto_1
    if-eqz p2, :cond_5

    .line 49
    .line 50
    goto :goto_2

    .line 51
    :cond_5
    aget-object p2, p5, v1

    .line 52
    .line 53
    :goto_2
    if-eqz p3, :cond_6

    .line 54
    .line 55
    goto :goto_3

    .line 56
    :cond_6
    aget-object p3, p5, v3

    .line 57
    .line 58
    :goto_3
    if-eqz p4, :cond_7

    .line 59
    .line 60
    goto :goto_4

    .line 61
    :cond_7
    aget-object p4, p5, v0

    .line 62
    .line 63
    :goto_4
    invoke-virtual {p0, p1, p2, p3, p4}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_8
    :goto_5
    iget-object p0, p0, Ll/fv0;->a:Landroid/widget/TextView;

    .line 68
    .line 69
    if-eqz p2, :cond_9

    .line 70
    .line 71
    goto :goto_6

    .line 72
    :cond_9
    aget-object p2, p5, v1

    .line 73
    .line 74
    :goto_6
    aget-object p1, p5, v3

    .line 75
    .line 76
    if-eqz p4, :cond_a

    .line 77
    .line 78
    goto :goto_7

    .line 79
    :cond_a
    aget-object p4, p5, v0

    .line 80
    .line 81
    :goto_7
    invoke-virtual {p0, p6, p2, p1, p4}, Landroid/widget/TextView;->setCompoundDrawablesRelativeWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :cond_b
    :goto_8
    iget-object p1, p0, Ll/fv0;->a:Landroid/widget/TextView;

    .line 86
    .line 87
    invoke-virtual {p1}, Landroid/widget/TextView;->getCompoundDrawablesRelative()[Landroid/graphics/drawable/Drawable;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    iget-object p0, p0, Ll/fv0;->a:Landroid/widget/TextView;

    .line 92
    .line 93
    if-eqz p5, :cond_c

    .line 94
    .line 95
    goto :goto_9

    .line 96
    :cond_c
    aget-object p5, p1, v2

    .line 97
    .line 98
    :goto_9
    if-eqz p2, :cond_d

    .line 99
    .line 100
    goto :goto_a

    .line 101
    :cond_d
    aget-object p2, p1, v1

    .line 102
    .line 103
    :goto_a
    if-eqz p6, :cond_e

    .line 104
    .line 105
    goto :goto_b

    .line 106
    :cond_e
    aget-object p6, p1, v3

    .line 107
    .line 108
    :goto_b
    if-eqz p4, :cond_f

    .line 109
    .line 110
    goto :goto_c

    .line 111
    :cond_f
    aget-object p4, p1, v0

    .line 112
    .line 113
    :goto_c
    invoke-virtual {p0, p5, p2, p6, p4}, Landroid/widget/TextView;->setCompoundDrawablesRelativeWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 114
    .line 115
    .line 116
    return-void
.end method

.method public final y()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fv0;->h:Ll/r0j0;

    .line 2
    .line 3
    iput-object v0, p0, Ll/fv0;->b:Ll/r0j0;

    .line 4
    .line 5
    iput-object v0, p0, Ll/fv0;->c:Ll/r0j0;

    .line 6
    .line 7
    iput-object v0, p0, Ll/fv0;->d:Ll/r0j0;

    .line 8
    .line 9
    iput-object v0, p0, Ll/fv0;->e:Ll/r0j0;

    .line 10
    .line 11
    iput-object v0, p0, Ll/fv0;->f:Ll/r0j0;

    .line 12
    .line 13
    iput-object v0, p0, Ll/fv0;->g:Ll/r0j0;

    .line 14
    .line 15
    return-void
.end method

.method public z(IF)V
    .locals 1
    .annotation build Landroidx/annotation/RestrictTo;
        value = {
            .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY_GROUP_PREFIX:Landroidx/annotation/RestrictTo$Scope;
        }
    .end annotation

    .line 1
    sget-boolean v0, Ll/qj1;->f0:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/fv0;->l()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p1, p2}, Ll/fv0;->A(IF)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method
