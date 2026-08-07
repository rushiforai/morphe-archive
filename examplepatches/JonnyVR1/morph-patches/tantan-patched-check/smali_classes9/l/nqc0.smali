.class public Ll/nqc0;
.super Ll/lam;
.source "SourceFile"


# instance fields
.field public i:Ll/mqc0;

.field public j:Ll/rqc0;

.field public k:Ll/tqc0;

.field public l:Ll/lqc0;

.field public m:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/kam;",
            ">;"
        }
    .end annotation
.end field

.field public n:F

.field public o:F

.field public p:F

.field public q:F

.field public r:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/lam;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/nqc0;->l()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private l()V
    .locals 2

    .line 1
    new-instance v0, Ll/mqc0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/lam;->b()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Ll/mqc0;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/nqc0;->i:Ll/mqc0;

    .line 11
    .line 12
    new-instance v0, Ll/rqc0;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/lam;->b()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-direct {v0, v1}, Ll/rqc0;-><init>(Landroid/content/Context;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Ll/nqc0;->j:Ll/rqc0;

    .line 22
    .line 23
    new-instance v0, Ll/tqc0;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/lam;->b()Landroid/content/Context;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-direct {v0, v1}, Ll/tqc0;-><init>(Landroid/content/Context;)V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Ll/nqc0;->k:Ll/tqc0;

    .line 33
    .line 34
    new-instance v0, Ll/lqc0;

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/lam;->b()Landroid/content/Context;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-direct {v0, v1}, Ll/lqc0;-><init>(Landroid/content/Context;)V

    .line 41
    .line 42
    .line 43
    iput-object v0, p0, Ll/nqc0;->l:Ll/lqc0;

    .line 44
    .line 45
    new-instance v0, Ljava/util/ArrayList;

    .line 46
    .line 47
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 48
    .line 49
    .line 50
    iput-object v0, p0, Ll/nqc0;->m:Ljava/util/List;

    .line 51
    .line 52
    iget-object v1, p0, Ll/nqc0;->i:Ll/mqc0;

    .line 53
    .line 54
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ll/nqc0;->m:Ljava/util/List;

    .line 58
    .line 59
    iget-object v1, p0, Ll/nqc0;->j:Ll/rqc0;

    .line 60
    .line 61
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Ll/nqc0;->m:Ljava/util/List;

    .line 65
    .line 66
    iget-object v1, p0, Ll/nqc0;->k:Ll/tqc0;

    .line 67
    .line 68
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Ll/nqc0;->m:Ljava/util/List;

    .line 72
    .line 73
    iget-object v1, p0, Ll/nqc0;->l:Ll/lqc0;

    .line 74
    .line 75
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    const/16 v0, 0x42

    .line 79
    .line 80
    invoke-virtual {p0, v0}, Ll/lam;->a(I)I

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    int-to-float v0, v0

    .line 85
    iput v0, p0, Ll/nqc0;->n:F

    .line 86
    .line 87
    const/16 v0, 0x2a

    .line 88
    .line 89
    invoke-virtual {p0, v0}, Ll/lam;->a(I)I

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    int-to-float v0, v0

    .line 94
    iput v0, p0, Ll/nqc0;->o:F

    .line 95
    .line 96
    const/16 v0, 0x10

    .line 97
    .line 98
    invoke-virtual {p0, v0}, Ll/lam;->a(I)I

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    int-to-float v0, v0

    .line 103
    iput v0, p0, Ll/nqc0;->r:F

    .line 104
    .line 105
    return-void
.end method


# virtual methods
.method public f(II)V
    .locals 7

    .line 1
    if-nez p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Ll/lam;->h:Landroid/graphics/RectF;

    .line 4
    .line 5
    iget-object v1, p0, Ll/lam;->g:Landroid/graphics/RectF;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget v0, v0, Landroid/graphics/RectF;->left:F

    .line 10
    .line 11
    iget v2, p0, Ll/nqc0;->n:F

    .line 12
    .line 13
    invoke-virtual {p0, v0, v2, p2}, Ll/lam;->d(FFI)F

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iget v2, p0, Ll/lam;->c:I

    .line 18
    .line 19
    int-to-float v2, v2

    .line 20
    iget-object v3, p0, Ll/lam;->h:Landroid/graphics/RectF;

    .line 21
    .line 22
    iget v3, v3, Landroid/graphics/RectF;->top:F

    .line 23
    .line 24
    sub-float/2addr v2, v3

    .line 25
    iget v3, p0, Ll/nqc0;->o:F

    .line 26
    .line 27
    invoke-virtual {p0, v2, v3, p2}, Ll/lam;->d(FFI)F

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    iget-object v3, p0, Ll/lam;->h:Landroid/graphics/RectF;

    .line 32
    .line 33
    iget v3, v3, Landroid/graphics/RectF;->right:F

    .line 34
    .line 35
    iget v4, p0, Ll/nqc0;->p:F

    .line 36
    .line 37
    invoke-virtual {p0, v3, v4, p2}, Ll/lam;->d(FFI)F

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    iget v4, p0, Ll/lam;->c:I

    .line 42
    .line 43
    int-to-float v4, v4

    .line 44
    iget-object v5, p0, Ll/lam;->h:Landroid/graphics/RectF;

    .line 45
    .line 46
    iget v5, v5, Landroid/graphics/RectF;->bottom:F

    .line 47
    .line 48
    sub-float/2addr v4, v5

    .line 49
    iget v5, p0, Ll/nqc0;->q:F

    .line 50
    .line 51
    invoke-virtual {p0, v4, v5, p2}, Ll/lam;->d(FFI)F

    .line 52
    .line 53
    .line 54
    move-result v4

    .line 55
    invoke-virtual {v1, v0, v2, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_0
    iget v0, p0, Ll/nqc0;->n:F

    .line 60
    .line 61
    iget v2, p0, Ll/nqc0;->o:F

    .line 62
    .line 63
    iget v3, p0, Ll/nqc0;->p:F

    .line 64
    .line 65
    iget v4, p0, Ll/nqc0;->q:F

    .line 66
    .line 67
    invoke-virtual {v1, v0, v2, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_1
    const/4 v0, 0x1

    .line 72
    const v1, 0x3ecccccd    # 0.4f

    .line 73
    .line 74
    .line 75
    const/16 v2, 0x2a

    .line 76
    .line 77
    if-ne p1, v0, :cond_2

    .line 78
    .line 79
    iget v0, p0, Ll/nqc0;->n:F

    .line 80
    .line 81
    invoke-virtual {p0, v2}, Ll/lam;->a(I)I

    .line 82
    .line 83
    .line 84
    move-result v2

    .line 85
    mul-int/2addr v2, p2

    .line 86
    int-to-float v2, v2

    .line 87
    mul-float/2addr v2, v1

    .line 88
    const/high16 v1, 0x42c80000    # 100.0f

    .line 89
    .line 90
    div-float/2addr v2, v1

    .line 91
    add-float/2addr v0, v2

    .line 92
    iget-object v1, p0, Ll/lam;->g:Landroid/graphics/RectF;

    .line 93
    .line 94
    iget v2, p0, Ll/nqc0;->o:F

    .line 95
    .line 96
    iget v3, p0, Ll/nqc0;->p:F

    .line 97
    .line 98
    iget v4, p0, Ll/nqc0;->q:F

    .line 99
    .line 100
    invoke-virtual {v1, v0, v2, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 101
    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_2
    const/4 v0, 0x2

    .line 105
    if-ne p1, v0, :cond_3

    .line 106
    .line 107
    iget-object v0, p0, Ll/lam;->g:Landroid/graphics/RectF;

    .line 108
    .line 109
    iget v3, p0, Ll/nqc0;->n:F

    .line 110
    .line 111
    invoke-virtual {p0, v2}, Ll/lam;->a(I)I

    .line 112
    .line 113
    .line 114
    move-result v2

    .line 115
    int-to-float v2, v2

    .line 116
    mul-float/2addr v2, v1

    .line 117
    add-float/2addr v3, v2

    .line 118
    iget-object v1, p0, Ll/lam;->h:Landroid/graphics/RectF;

    .line 119
    .line 120
    iget v1, v1, Landroid/graphics/RectF;->left:F

    .line 121
    .line 122
    invoke-virtual {p0, v3, v1, p2}, Ll/lam;->d(FFI)F

    .line 123
    .line 124
    .line 125
    move-result v1

    .line 126
    iget v2, p0, Ll/nqc0;->o:F

    .line 127
    .line 128
    iget v3, p0, Ll/lam;->c:I

    .line 129
    .line 130
    int-to-float v3, v3

    .line 131
    iget-object v4, p0, Ll/lam;->h:Landroid/graphics/RectF;

    .line 132
    .line 133
    iget v4, v4, Landroid/graphics/RectF;->top:F

    .line 134
    .line 135
    sub-float/2addr v3, v4

    .line 136
    invoke-virtual {p0, v2, v3, p2}, Ll/lam;->d(FFI)F

    .line 137
    .line 138
    .line 139
    move-result v2

    .line 140
    iget v3, p0, Ll/nqc0;->p:F

    .line 141
    .line 142
    iget-object v4, p0, Ll/lam;->h:Landroid/graphics/RectF;

    .line 143
    .line 144
    iget v4, v4, Landroid/graphics/RectF;->right:F

    .line 145
    .line 146
    invoke-virtual {p0, v3, v4, p2}, Ll/lam;->d(FFI)F

    .line 147
    .line 148
    .line 149
    move-result v3

    .line 150
    iget v4, p0, Ll/nqc0;->q:F

    .line 151
    .line 152
    iget v5, p0, Ll/lam;->c:I

    .line 153
    .line 154
    int-to-float v5, v5

    .line 155
    iget-object v6, p0, Ll/lam;->h:Landroid/graphics/RectF;

    .line 156
    .line 157
    iget v6, v6, Landroid/graphics/RectF;->bottom:F

    .line 158
    .line 159
    sub-float/2addr v5, v6

    .line 160
    invoke-virtual {p0, v4, v5, p2}, Ll/lam;->d(FFI)F

    .line 161
    .line 162
    .line 163
    move-result v4

    .line 164
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 165
    .line 166
    .line 167
    :cond_3
    :goto_0
    invoke-virtual {p0}, Ll/nqc0;->m()V

    .line 168
    .line 169
    .line 170
    iget-object v0, p0, Ll/nqc0;->m:Ljava/util/List;

    .line 171
    .line 172
    if-eqz v0, :cond_4

    .line 173
    .line 174
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 179
    .line 180
    .line 181
    move-result v1

    .line 182
    if-eqz v1, :cond_4

    .line 183
    .line 184
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 185
    .line 186
    .line 187
    move-result-object v1

    .line 188
    check-cast v1, Ll/lam;

    .line 189
    .line 190
    invoke-virtual {v1, p1, p2}, Ll/lam;->f(II)V

    .line 191
    .line 192
    .line 193
    goto :goto_1

    .line 194
    :cond_4
    invoke-super {p0, p1, p2}, Ll/lam;->f(II)V

    .line 195
    .line 196
    .line 197
    return-void
.end method

.method public g(Landroid/graphics/Canvas;II)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Ll/lam;->g:Landroid/graphics/RectF;

    .line 6
    .line 7
    iget v2, v1, Landroid/graphics/RectF;->left:F

    .line 8
    .line 9
    iget v1, v1, Landroid/graphics/RectF;->top:F

    .line 10
    .line 11
    invoke-virtual {p1, v2, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/nqc0;->m:Ljava/util/List;

    .line 15
    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    check-cast v1, Ll/lam;

    .line 33
    .line 34
    invoke-virtual {v1, p1, p2, p3}, Ll/lam;->g(Landroid/graphics/Canvas;II)V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public h(II)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2}, Ll/lam;->h(II)V

    .line 2
    .line 3
    .line 4
    int-to-float v0, p1

    .line 5
    iget v1, p0, Ll/nqc0;->r:F

    .line 6
    .line 7
    sub-float/2addr v0, v1

    .line 8
    iput v0, p0, Ll/nqc0;->p:F

    .line 9
    .line 10
    iget v0, p0, Ll/nqc0;->o:F

    .line 11
    .line 12
    const/16 v1, 0x38

    .line 13
    .line 14
    invoke-virtual {p0, v1}, Ll/lam;->a(I)I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    int-to-float v1, v1

    .line 19
    add-float/2addr v0, v1

    .line 20
    iput v0, p0, Ll/nqc0;->q:F

    .line 21
    .line 22
    iget-object v0, p0, Ll/nqc0;->m:Ljava/util/List;

    .line 23
    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_0

    .line 35
    .line 36
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    check-cast v1, Ll/kam;

    .line 41
    .line 42
    invoke-virtual {v1, p1, p2}, Ll/lam;->h(II)V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    invoke-virtual {p0}, Ll/nqc0;->m()V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public i()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/lam;->i()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/nqc0;->m:Ljava/util/List;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Ll/lam;

    .line 23
    .line 24
    invoke-virtual {v0}, Ll/lam;->i()V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    return-void
.end method

.method public j(Landroid/graphics/RectF;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/lam;->j(Landroid/graphics/RectF;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/nqc0;->m:Ljava/util/List;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Ll/kam;

    .line 23
    .line 24
    invoke-virtual {v0, p1}, Ll/lam;->j(Landroid/graphics/RectF;)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    return-void
.end method

.method public k(Ll/n4m;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/lam;->k(Ll/n4m;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/nqc0;->m:Ljava/util/List;

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Ll/kam;

    .line 23
    .line 24
    iget-object v1, p0, Ll/lam;->f:Ll/n4m;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ll/lam;->k(Ll/n4m;)V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    return-void
.end method

.method public final m()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/nqc0;->m:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Ll/kam;

    .line 20
    .line 21
    iget-object v2, p0, Ll/lam;->g:Landroid/graphics/RectF;

    .line 22
    .line 23
    iget v3, v2, Landroid/graphics/RectF;->right:F

    .line 24
    .line 25
    iget v4, v2, Landroid/graphics/RectF;->left:F

    .line 26
    .line 27
    sub-float/2addr v3, v4

    .line 28
    iget v4, v2, Landroid/graphics/RectF;->bottom:F

    .line 29
    .line 30
    iget v2, v2, Landroid/graphics/RectF;->top:F

    .line 31
    .line 32
    sub-float/2addr v4, v2

    .line 33
    const/4 v2, 0x0

    .line 34
    invoke-virtual {v1, v2, v2, v3, v4}, Ll/kam;->m(FFFF)V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    return-void
.end method
