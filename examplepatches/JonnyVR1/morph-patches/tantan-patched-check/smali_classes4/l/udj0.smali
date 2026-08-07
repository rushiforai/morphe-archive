.class public Ll/udj0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<C:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field public a:Ll/ox2;

.field public b:F

.field public c:F

.field public d:F

.field public e:I

.field public f:Landroid/view/VelocityTracker;

.field public g:I

.field public h:Z


# direct methods
.method public constructor <init>(Ll/ox2;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x41a00000    # 20.0f

    .line 5
    .line 6
    iput v0, p0, Ll/udj0;->d:F

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput v0, p0, Ll/udj0;->e:I

    .line 10
    .line 11
    iput v0, p0, Ll/udj0;->g:I

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    iput-boolean v0, p0, Ll/udj0;->h:Z

    .line 15
    .line 16
    iput-object p1, p0, Ll/udj0;->a:Ll/ox2;

    .line 17
    .line 18
    invoke-virtual {p1}, Ll/ox2;->r()Landroid/content/Context;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    int-to-float p1, p1

    .line 31
    iput p1, p0, Ll/udj0;->d:F

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/udj0;->d()V

    .line 34
    .line 35
    .line 36
    return-void
.end method


# virtual methods
.method public a()F
    .locals 0

    .line 1
    iget p0, p0, Ll/udj0;->d:F

    .line 2
    .line 3
    return p0
.end method

.method public b()Ll/qn4;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/udj0;->a:Ll/ox2;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ox2;->G()Ll/txl0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, v0, Ll/txl0;->a:Landroid/view/View;

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    instance-of v1, v0, Ll/qn4;

    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    check-cast v0, Ll/qn4;

    .line 18
    .line 19
    return-object v0

    .line 20
    :cond_0
    instance-of v1, v0, Landroid/view/ViewGroup;

    .line 21
    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    check-cast v0, Landroid/view/ViewGroup;

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Ll/udj0;->c(Landroid/view/ViewGroup;)Ll/qn4;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0

    .line 31
    :cond_1
    const/4 p0, 0x0

    .line 32
    return-object p0
.end method

.method public c(Landroid/view/ViewGroup;)Ll/qn4;
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-lez v0, :cond_2

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    :goto_0
    if-ge v1, v0, :cond_2

    .line 9
    .line 10
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    instance-of v2, v2, Ll/qn4;

    .line 15
    .line 16
    if-eqz v2, :cond_0

    .line 17
    .line 18
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Ll/qn4;

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_0
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    instance-of v2, v2, Landroid/view/ViewGroup;

    .line 30
    .line 31
    if-eqz v2, :cond_1

    .line 32
    .line 33
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    check-cast p1, Landroid/view/ViewGroup;

    .line 38
    .line 39
    invoke-virtual {p0, p1}, Ll/udj0;->c(Landroid/view/ViewGroup;)Ll/qn4;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0

    .line 44
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    const/4 p0, 0x0

    .line 48
    return-object p0
.end method

.method public final d()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/udj0;->f:Landroid/view/VelocityTracker;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Ll/udj0;->f:Landroid/view/VelocityTracker;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public e()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/udj0;->h:Z

    .line 3
    .line 4
    return-void
.end method

.method public f(Landroid/view/ViewGroup;Landroid/view/MotionEvent;)V
    .locals 0

    .line 1
    return-void
.end method

.method public g(Landroid/view/ViewGroup;Landroid/view/MotionEvent;)Z
    .locals 7

    .line 1
    iget-object p1, p0, Ll/udj0;->a:Ll/ox2;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/ox2;->V()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 v0, 0x0

    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    return v0

    .line 11
    :cond_0
    invoke-virtual {p0}, Ll/udj0;->b()Ll/qn4;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    invoke-interface {p1}, Ll/qn4;->b()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0, p2}, Ll/udj0;->h(Landroid/view/MotionEvent;)Z

    .line 24
    .line 25
    .line 26
    return v0

    .line 27
    :cond_1
    invoke-virtual {p0}, Ll/udj0;->d()V

    .line 28
    .line 29
    .line 30
    iget-object v1, p0, Ll/udj0;->f:Landroid/view/VelocityTracker;

    .line 31
    .line 32
    invoke-virtual {v1, p2}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    const/high16 v2, 0x3f000000    # 0.5f

    .line 40
    .line 41
    add-float/2addr v1, v2

    .line 42
    float-to-int v1, v1

    .line 43
    int-to-float v1, v1

    .line 44
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    add-float/2addr v3, v2

    .line 49
    float-to-int v3, v3

    .line 50
    int-to-float v3, v3

    .line 51
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 52
    .line 53
    .line 54
    move-result v4

    .line 55
    const/4 v5, 0x1

    .line 56
    if-eqz v4, :cond_c

    .line 57
    .line 58
    if-eq v4, v5, :cond_a

    .line 59
    .line 60
    const/4 v2, 0x2

    .line 61
    if-eq v4, v2, :cond_2

    .line 62
    .line 63
    const/4 p1, 0x3

    .line 64
    if-eq v4, p1, :cond_a

    .line 65
    .line 66
    goto/16 :goto_0

    .line 67
    .line 68
    :cond_2
    iget-boolean v4, p0, Ll/udj0;->h:Z

    .line 69
    .line 70
    if-nez v4, :cond_3

    .line 71
    .line 72
    return v0

    .line 73
    :cond_3
    iget v4, p0, Ll/udj0;->g:I

    .line 74
    .line 75
    add-int/2addr v4, v5

    .line 76
    iput v4, p0, Ll/udj0;->g:I

    .line 77
    .line 78
    iget v4, p0, Ll/udj0;->e:I

    .line 79
    .line 80
    if-lt v4, v5, :cond_5

    .line 81
    .line 82
    if-ne v4, v5, :cond_4

    .line 83
    .line 84
    iget-object p1, p0, Ll/udj0;->a:Ll/ox2;

    .line 85
    .line 86
    sget-object p2, Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;->START_MOVING:Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;

    .line 87
    .line 88
    invoke-virtual {p1, p2, v0}, Ll/ox2;->o0(Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;Z)V

    .line 89
    .line 90
    .line 91
    :cond_4
    iput v2, p0, Ll/udj0;->e:I

    .line 92
    .line 93
    iget-object p1, p0, Ll/udj0;->a:Ll/ox2;

    .line 94
    .line 95
    iget p2, p0, Ll/udj0;->b:F

    .line 96
    .line 97
    iget p0, p0, Ll/udj0;->c:F

    .line 98
    .line 99
    invoke-virtual {p1, v1, v3, p2, p0}, Ll/ox2;->P(FFFF)V

    .line 100
    .line 101
    .line 102
    return v5

    .line 103
    :cond_5
    if-eqz p1, :cond_6

    .line 104
    .line 105
    iget v2, p0, Ll/udj0;->b:F

    .line 106
    .line 107
    iget v4, p0, Ll/udj0;->c:F

    .line 108
    .line 109
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    .line 110
    .line 111
    .line 112
    move-result v6

    .line 113
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    .line 114
    .line 115
    .line 116
    move-result p2

    .line 117
    invoke-interface {p1, v2, v4, v6, p2}, Ll/qn4;->a(FFFF)Z

    .line 118
    .line 119
    .line 120
    move-result p1

    .line 121
    if-eqz p1, :cond_6

    .line 122
    .line 123
    return v0

    .line 124
    :cond_6
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->c:Ljava/lang/String;

    .line 125
    .line 126
    iget p1, p0, Ll/udj0;->b:F

    .line 127
    .line 128
    sub-float/2addr p1, v1

    .line 129
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 130
    .line 131
    .line 132
    move-result p1

    .line 133
    iget p2, p0, Ll/udj0;->d:F

    .line 134
    .line 135
    cmpl-float p1, p1, p2

    .line 136
    .line 137
    if-gez p1, :cond_7

    .line 138
    .line 139
    iget p1, p0, Ll/udj0;->c:F

    .line 140
    .line 141
    sub-float/2addr p1, v3

    .line 142
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 143
    .line 144
    .line 145
    move-result p1

    .line 146
    iget p2, p0, Ll/udj0;->d:F

    .line 147
    .line 148
    cmpl-float p1, p1, p2

    .line 149
    .line 150
    if-ltz p1, :cond_9

    .line 151
    .line 152
    :cond_7
    sget-boolean p1, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->d:Z

    .line 153
    .line 154
    if-eqz p1, :cond_8

    .line 155
    .line 156
    iget p1, p0, Ll/udj0;->b:F

    .line 157
    .line 158
    sub-float/2addr p1, v1

    .line 159
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 160
    .line 161
    .line 162
    iget p1, p0, Ll/udj0;->c:F

    .line 163
    .line 164
    sub-float/2addr p1, v3

    .line 165
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 166
    .line 167
    .line 168
    :cond_8
    iget-object p1, p0, Ll/udj0;->a:Ll/ox2;

    .line 169
    .line 170
    invoke-virtual {p1}, Ll/ox2;->G()Ll/txl0;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    iput v1, p0, Ll/udj0;->b:F

    .line 175
    .line 176
    iput v3, p0, Ll/udj0;->c:F

    .line 177
    .line 178
    iput v5, p0, Ll/udj0;->e:I

    .line 179
    .line 180
    if-eqz p1, :cond_9

    .line 181
    .line 182
    invoke-virtual {p1}, Ll/txl0;->a()V

    .line 183
    .line 184
    .line 185
    iget p2, p0, Ll/udj0;->b:F

    .line 186
    .line 187
    iget v1, p1, Ll/txl0;->l:F

    .line 188
    .line 189
    sub-float/2addr p2, v1

    .line 190
    iput p2, p0, Ll/udj0;->b:F

    .line 191
    .line 192
    iget p2, p0, Ll/udj0;->c:F

    .line 193
    .line 194
    iget p1, p1, Ll/txl0;->m:F

    .line 195
    .line 196
    sub-float/2addr p2, p1

    .line 197
    iput p2, p0, Ll/udj0;->c:F

    .line 198
    .line 199
    :cond_9
    return v0

    .line 200
    :cond_a
    iget-boolean p1, p0, Ll/udj0;->h:Z

    .line 201
    .line 202
    if-nez p1, :cond_b

    .line 203
    .line 204
    return v0

    .line 205
    :cond_b
    const/high16 p1, -0x40800000    # -1.0f

    .line 206
    .line 207
    iput p1, p0, Ll/udj0;->b:F

    .line 208
    .line 209
    iput v0, p0, Ll/udj0;->e:I

    .line 210
    .line 211
    iput-boolean v0, p0, Ll/udj0;->h:Z

    .line 212
    .line 213
    :goto_0
    return v0

    .line 214
    :cond_c
    iput-boolean v5, p0, Ll/udj0;->h:Z

    .line 215
    .line 216
    iput v0, p0, Ll/udj0;->e:I

    .line 217
    .line 218
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    .line 219
    .line 220
    .line 221
    move-result p1

    .line 222
    add-float/2addr p1, v2

    .line 223
    float-to-int p1, p1

    .line 224
    int-to-float p1, p1

    .line 225
    iput p1, p0, Ll/udj0;->b:F

    .line 226
    .line 227
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    .line 228
    .line 229
    .line 230
    move-result p1

    .line 231
    add-float/2addr p1, v2

    .line 232
    float-to-int p1, p1

    .line 233
    int-to-float p1, p1

    .line 234
    iput p1, p0, Ll/udj0;->c:F

    .line 235
    .line 236
    iput v5, p0, Ll/udj0;->g:I

    .line 237
    .line 238
    iget-object p0, p0, Ll/udj0;->a:Ll/ox2;

    .line 239
    .line 240
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;->START_TOUCH:Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;

    .line 241
    .line 242
    invoke-virtual {p0, p1, v0}, Ll/ox2;->o0(Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;Z)V

    .line 243
    .line 244
    .line 245
    return v0
.end method

.method public h(Landroid/view/MotionEvent;)Z
    .locals 10

    .line 1
    iget-object v0, p0, Ll/udj0;->a:Ll/ox2;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ox2;->V()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    invoke-virtual {p0}, Ll/udj0;->d()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/udj0;->f:Landroid/view/VelocityTracker;

    .line 15
    .line 16
    invoke-virtual {v0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 24
    .line 25
    .line 26
    move-result v4

    .line 27
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    const/4 v9, 0x1

    .line 32
    if-eqz v0, :cond_9

    .line 33
    .line 34
    const/4 p1, 0x2

    .line 35
    if-eq v0, v9, :cond_6

    .line 36
    .line 37
    if-eq v0, p1, :cond_1

    .line 38
    .line 39
    const/4 v2, 0x3

    .line 40
    if-eq v0, v2, :cond_6

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :cond_1
    iget-boolean v0, p0, Ll/udj0;->h:Z

    .line 45
    .line 46
    if-nez v0, :cond_2

    .line 47
    .line 48
    return v1

    .line 49
    :cond_2
    iget v0, p0, Ll/udj0;->e:I

    .line 50
    .line 51
    if-lt v0, v9, :cond_4

    .line 52
    .line 53
    if-ne v0, v9, :cond_3

    .line 54
    .line 55
    iget-object v0, p0, Ll/udj0;->a:Ll/ox2;

    .line 56
    .line 57
    sget-object v2, Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;->START_MOVING:Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;

    .line 58
    .line 59
    invoke-virtual {v0, v2, v1}, Ll/ox2;->o0(Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;Z)V

    .line 60
    .line 61
    .line 62
    :cond_3
    iput p1, p0, Ll/udj0;->e:I

    .line 63
    .line 64
    iget-object p1, p0, Ll/udj0;->a:Ll/ox2;

    .line 65
    .line 66
    iget v0, p0, Ll/udj0;->b:F

    .line 67
    .line 68
    iget p0, p0, Ll/udj0;->c:F

    .line 69
    .line 70
    invoke-virtual {p1, v3, v4, v0, p0}, Ll/ox2;->P(FFFF)V

    .line 71
    .line 72
    .line 73
    goto/16 :goto_0

    .line 74
    .line 75
    :cond_4
    iget p1, p0, Ll/udj0;->b:F

    .line 76
    .line 77
    sub-float/2addr p1, v3

    .line 78
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    iget v0, p0, Ll/udj0;->d:F

    .line 83
    .line 84
    cmpl-float p1, p1, v0

    .line 85
    .line 86
    if-gez p1, :cond_5

    .line 87
    .line 88
    iget p1, p0, Ll/udj0;->c:F

    .line 89
    .line 90
    sub-float/2addr p1, v4

    .line 91
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    iget v0, p0, Ll/udj0;->d:F

    .line 96
    .line 97
    cmpl-float p1, p1, v0

    .line 98
    .line 99
    if-ltz p1, :cond_a

    .line 100
    .line 101
    :cond_5
    iput v3, p0, Ll/udj0;->b:F

    .line 102
    .line 103
    iput v4, p0, Ll/udj0;->c:F

    .line 104
    .line 105
    iput v9, p0, Ll/udj0;->e:I

    .line 106
    .line 107
    iget-object p1, p0, Ll/udj0;->a:Ll/ox2;

    .line 108
    .line 109
    invoke-virtual {p1}, Ll/ox2;->G()Ll/txl0;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    if-eqz p1, :cond_a

    .line 114
    .line 115
    invoke-virtual {p1}, Ll/txl0;->a()V

    .line 116
    .line 117
    .line 118
    iget v0, p0, Ll/udj0;->b:F

    .line 119
    .line 120
    iget v1, p1, Ll/txl0;->l:F

    .line 121
    .line 122
    sub-float/2addr v0, v1

    .line 123
    iput v0, p0, Ll/udj0;->b:F

    .line 124
    .line 125
    iget v0, p0, Ll/udj0;->c:F

    .line 126
    .line 127
    iget p1, p1, Ll/txl0;->m:F

    .line 128
    .line 129
    sub-float/2addr v0, p1

    .line 130
    iput v0, p0, Ll/udj0;->c:F

    .line 131
    .line 132
    goto :goto_0

    .line 133
    :cond_6
    iget-boolean v0, p0, Ll/udj0;->h:Z

    .line 134
    .line 135
    if-nez v0, :cond_7

    .line 136
    .line 137
    return v1

    .line 138
    :cond_7
    iget v0, p0, Ll/udj0;->e:I

    .line 139
    .line 140
    if-ne v0, p1, :cond_8

    .line 141
    .line 142
    iget-object p1, p0, Ll/udj0;->a:Ll/ox2;

    .line 143
    .line 144
    iget v0, p0, Ll/udj0;->b:F

    .line 145
    .line 146
    iget v2, p0, Ll/udj0;->c:F

    .line 147
    .line 148
    invoke-virtual {p1, v3, v4, v0, v2}, Ll/ox2;->P(FFFF)V

    .line 149
    .line 150
    .line 151
    iget-object p1, p0, Ll/udj0;->f:Landroid/view/VelocityTracker;

    .line 152
    .line 153
    const/16 v0, 0x3e8

    .line 154
    .line 155
    sget v2, Ll/vo0;->w:F

    .line 156
    .line 157
    invoke-virtual {p1, v0, v2}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 158
    .line 159
    .line 160
    iget-object v2, p0, Ll/udj0;->a:Ll/ox2;

    .line 161
    .line 162
    iget v5, p0, Ll/udj0;->b:F

    .line 163
    .line 164
    iget v6, p0, Ll/udj0;->c:F

    .line 165
    .line 166
    invoke-virtual {p1}, Landroid/view/VelocityTracker;->getXVelocity()F

    .line 167
    .line 168
    .line 169
    move-result v7

    .line 170
    invoke-virtual {p1}, Landroid/view/VelocityTracker;->getYVelocity()F

    .line 171
    .line 172
    .line 173
    move-result v8

    .line 174
    invoke-virtual/range {v2 .. v8}, Ll/ox2;->Q(FFFFFF)V

    .line 175
    .line 176
    .line 177
    :cond_8
    iget-object p1, p0, Ll/udj0;->f:Landroid/view/VelocityTracker;

    .line 178
    .line 179
    invoke-virtual {p1}, Landroid/view/VelocityTracker;->recycle()V

    .line 180
    .line 181
    .line 182
    const/4 p1, 0x0

    .line 183
    iput-object p1, p0, Ll/udj0;->f:Landroid/view/VelocityTracker;

    .line 184
    .line 185
    const/high16 p1, -0x40800000    # -1.0f

    .line 186
    .line 187
    iput p1, p0, Ll/udj0;->b:F

    .line 188
    .line 189
    iput v1, p0, Ll/udj0;->e:I

    .line 190
    .line 191
    iput-boolean v1, p0, Ll/udj0;->h:Z

    .line 192
    .line 193
    goto :goto_0

    .line 194
    :cond_9
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 195
    .line 196
    .line 197
    move-result v0

    .line 198
    iput v0, p0, Ll/udj0;->b:F

    .line 199
    .line 200
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 201
    .line 202
    .line 203
    move-result p1

    .line 204
    iput p1, p0, Ll/udj0;->c:F

    .line 205
    .line 206
    iput v1, p0, Ll/udj0;->e:I

    .line 207
    .line 208
    iput-boolean v9, p0, Ll/udj0;->h:Z

    .line 209
    .line 210
    :cond_a
    :goto_0
    return v9
.end method
