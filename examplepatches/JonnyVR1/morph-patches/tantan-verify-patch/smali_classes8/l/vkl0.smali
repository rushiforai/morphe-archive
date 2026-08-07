.class public Ll/vkl0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:I

.field public final c:F

.field public d:Ll/tkl0;

.field public e:Z

.field public f:Z

.field public g:F

.field public h:F

.field public i:F

.field public j:F

.field public k:Landroid/view/ViewParent;

.field public l:Ll/xkl0;

.field public m:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/tkl0;Z)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x42480000    # 50.0f

    .line 5
    .line 6
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iput v0, p0, Ll/vkl0;->b:I

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-boolean v0, p0, Ll/vkl0;->e:Z

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    iput-boolean v0, p0, Ll/vkl0;->f:Z

    .line 17
    .line 18
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    int-to-float v0, v0

    .line 27
    iput v0, p0, Ll/vkl0;->c:F

    .line 28
    .line 29
    const/high16 v0, 0x42c80000    # 100.0f

    .line 30
    .line 31
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    iput v0, p0, Ll/vkl0;->a:I

    .line 36
    .line 37
    iput-object p2, p0, Ll/vkl0;->d:Ll/tkl0;

    .line 38
    .line 39
    new-instance p2, Ll/xkl0;

    .line 40
    .line 41
    invoke-direct {p2, p1}, Ll/xkl0;-><init>(Landroid/content/Context;)V

    .line 42
    .line 43
    .line 44
    iput-object p2, p0, Ll/vkl0;->l:Ll/xkl0;

    .line 45
    .line 46
    iput-boolean p3, p0, Ll/vkl0;->m:Z

    .line 47
    .line 48
    return-void
.end method


# virtual methods
.method public a(Landroid/view/MotionEvent;)Z
    .locals 5

    .line 1
    iget-object v0, p0, Ll/vkl0;->l:Ll/xkl0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/xkl0;->a(Landroid/view/MotionEvent;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Ll/u610;->c(Landroid/view/MotionEvent;)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    const/4 v2, 0x0

    .line 12
    const/4 v3, 0x1

    .line 13
    if-eq v0, v3, :cond_7

    .line 14
    .line 15
    const/4 v4, 0x2

    .line 16
    if-eq v0, v4, :cond_1

    .line 17
    .line 18
    const/4 v4, 0x3

    .line 19
    if-eq v0, v4, :cond_7

    .line 20
    .line 21
    const/4 p1, 0x5

    .line 22
    if-eq v0, p1, :cond_0

    .line 23
    .line 24
    goto/16 :goto_4

    .line 25
    .line 26
    :cond_0
    iput-boolean v2, p0, Ll/vkl0;->f:Z

    .line 27
    .line 28
    goto/16 :goto_4

    .line 29
    .line 30
    :cond_1
    iget-boolean v0, p0, Ll/vkl0;->f:Z

    .line 31
    .line 32
    if-eqz v0, :cond_e

    .line 33
    .line 34
    iget v0, p0, Ll/vkl0;->g:F

    .line 35
    .line 36
    cmpl-float v0, v0, v1

    .line 37
    .line 38
    if-nez v0, :cond_2

    .line 39
    .line 40
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    iput v0, p0, Ll/vkl0;->g:F

    .line 45
    .line 46
    :cond_2
    iget v0, p0, Ll/vkl0;->h:F

    .line 47
    .line 48
    cmpl-float v0, v0, v1

    .line 49
    .line 50
    if-nez v0, :cond_3

    .line 51
    .line 52
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    iput v0, p0, Ll/vkl0;->h:F

    .line 57
    .line 58
    :cond_3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    iget-boolean v1, p0, Ll/vkl0;->e:Z

    .line 67
    .line 68
    if-nez v1, :cond_4

    .line 69
    .line 70
    iget v1, p0, Ll/vkl0;->h:F

    .line 71
    .line 72
    sub-float v2, p1, v1

    .line 73
    .line 74
    iget v4, p0, Ll/vkl0;->c:F

    .line 75
    .line 76
    cmpl-float v2, v2, v4

    .line 77
    .line 78
    if-lez v2, :cond_4

    .line 79
    .line 80
    sub-float v1, p1, v1

    .line 81
    .line 82
    iget v2, p0, Ll/vkl0;->g:F

    .line 83
    .line 84
    sub-float v2, v0, v2

    .line 85
    .line 86
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    .line 87
    .line 88
    .line 89
    move-result v2

    .line 90
    cmpl-float v1, v1, v2

    .line 91
    .line 92
    if-gtz v1, :cond_5

    .line 93
    .line 94
    :cond_4
    iget-boolean v1, p0, Ll/vkl0;->m:Z

    .line 95
    .line 96
    if-eqz v1, :cond_6

    .line 97
    .line 98
    iget v1, p0, Ll/vkl0;->g:F

    .line 99
    .line 100
    sub-float v1, v0, v1

    .line 101
    .line 102
    iget v2, p0, Ll/vkl0;->c:F

    .line 103
    .line 104
    cmpl-float v1, v1, v2

    .line 105
    .line 106
    if-lez v1, :cond_6

    .line 107
    .line 108
    :cond_5
    iput-boolean v3, p0, Ll/vkl0;->e:Z

    .line 109
    .line 110
    :cond_6
    iget-boolean v1, p0, Ll/vkl0;->e:Z

    .line 111
    .line 112
    if-eqz v1, :cond_e

    .line 113
    .line 114
    iget-object v1, p0, Ll/vkl0;->k:Landroid/view/ViewParent;

    .line 115
    .line 116
    invoke-interface {v1, v3}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 117
    .line 118
    .line 119
    iget-object v1, p0, Ll/vkl0;->d:Ll/tkl0;

    .line 120
    .line 121
    iget v2, p0, Ll/vkl0;->g:F

    .line 122
    .line 123
    sub-float/2addr v0, v2

    .line 124
    iget p0, p0, Ll/vkl0;->h:F

    .line 125
    .line 126
    sub-float/2addr p1, p0

    .line 127
    invoke-virtual {v1, v0, p1}, Ll/tkl0;->l(FF)V

    .line 128
    .line 129
    .line 130
    goto :goto_4

    .line 131
    :cond_7
    iget v0, p0, Ll/vkl0;->g:F

    .line 132
    .line 133
    cmpl-float v0, v0, v1

    .line 134
    .line 135
    if-nez v0, :cond_8

    .line 136
    .line 137
    iget v0, p0, Ll/vkl0;->h:F

    .line 138
    .line 139
    cmpl-float v0, v0, v1

    .line 140
    .line 141
    if-nez v0, :cond_8

    .line 142
    .line 143
    return v2

    .line 144
    :cond_8
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 145
    .line 146
    .line 147
    move-result v0

    .line 148
    iput v0, p0, Ll/vkl0;->i:F

    .line 149
    .line 150
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 151
    .line 152
    .line 153
    move-result p1

    .line 154
    iput p1, p0, Ll/vkl0;->j:F

    .line 155
    .line 156
    iget v0, p0, Ll/vkl0;->h:F

    .line 157
    .line 158
    sub-float/2addr p1, v0

    .line 159
    iget v0, p0, Ll/vkl0;->a:I

    .line 160
    .line 161
    int-to-float v0, v0

    .line 162
    cmpl-float p1, p1, v0

    .line 163
    .line 164
    if-gtz p1, :cond_a

    .line 165
    .line 166
    iget-object p1, p0, Ll/vkl0;->l:Ll/xkl0;

    .line 167
    .line 168
    invoke-virtual {p1}, Ll/xkl0;->e()Z

    .line 169
    .line 170
    .line 171
    move-result p1

    .line 172
    if-eqz p1, :cond_9

    .line 173
    .line 174
    goto :goto_0

    .line 175
    :cond_9
    move p1, v2

    .line 176
    goto :goto_1

    .line 177
    :cond_a
    :goto_0
    move p1, v3

    .line 178
    :goto_1
    iget-boolean v0, p0, Ll/vkl0;->m:Z

    .line 179
    .line 180
    if-eqz v0, :cond_b

    .line 181
    .line 182
    iget v0, p0, Ll/vkl0;->i:F

    .line 183
    .line 184
    iget v1, p0, Ll/vkl0;->g:F

    .line 185
    .line 186
    sub-float/2addr v0, v1

    .line 187
    iget v1, p0, Ll/vkl0;->b:I

    .line 188
    .line 189
    int-to-float v1, v1

    .line 190
    cmpl-float v0, v0, v1

    .line 191
    .line 192
    if-lez v0, :cond_b

    .line 193
    .line 194
    move v0, v3

    .line 195
    goto :goto_2

    .line 196
    :cond_b
    move v0, v2

    .line 197
    :goto_2
    if-eqz p1, :cond_c

    .line 198
    .line 199
    iget-object p1, p0, Ll/vkl0;->d:Ll/tkl0;

    .line 200
    .line 201
    invoke-virtual {p1, v3}, Ll/tkl0;->m(Z)V

    .line 202
    .line 203
    .line 204
    goto :goto_3

    .line 205
    :cond_c
    iget-object p1, p0, Ll/vkl0;->d:Ll/tkl0;

    .line 206
    .line 207
    if-eqz v0, :cond_d

    .line 208
    .line 209
    invoke-virtual {p1}, Ll/tkl0;->d()V

    .line 210
    .line 211
    .line 212
    goto :goto_3

    .line 213
    :cond_d
    invoke-virtual {p1, v2}, Ll/tkl0;->m(Z)V

    .line 214
    .line 215
    .line 216
    :goto_3
    iget-object p1, p0, Ll/vkl0;->k:Landroid/view/ViewParent;

    .line 217
    .line 218
    invoke-interface {p1, v2}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 219
    .line 220
    .line 221
    invoke-virtual {p0, v2}, Ll/vkl0;->b(Z)V

    .line 222
    .line 223
    .line 224
    :cond_e
    :goto_4
    return v3
.end method

.method public b(Z)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/vkl0;->f:Z

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/vkl0;->g:F

    .line 6
    .line 7
    iput v0, p0, Ll/vkl0;->h:F

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-boolean v0, p0, Ll/vkl0;->e:Z

    .line 11
    .line 12
    iget-object v1, p0, Ll/vkl0;->l:Ll/xkl0;

    .line 13
    .line 14
    invoke-virtual {v1}, Ll/xkl0;->c()V

    .line 15
    .line 16
    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Ll/vkl0;->d:Ll/tkl0;

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Ll/tkl0;->m(Z)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public c(Landroid/view/ViewParent;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vkl0;->k:Landroid/view/ViewParent;

    .line 2
    .line 3
    return-void
.end method
