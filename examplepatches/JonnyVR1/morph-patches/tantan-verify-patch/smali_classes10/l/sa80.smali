.class public Ll/sa80;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Landroid/view/View;

.field public b:Landroid/view/View;

.field public c:Landroid/widget/LinearLayout;

.field public d:Landroid/widget/TextView;

.field public e:Landroid/animation/Animator;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/view/View;Landroid/view/View;Landroid/widget/LinearLayout;Landroid/widget/TextView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/sa80;->a:Landroid/view/View;

    .line 5
    .line 6
    iput-object p2, p0, Ll/sa80;->b:Landroid/view/View;

    .line 7
    .line 8
    iput-object p3, p0, Ll/sa80;->c:Landroid/widget/LinearLayout;

    .line 9
    .line 10
    iput-object p4, p0, Ll/sa80;->d:Landroid/widget/TextView;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/sa80;->e:Landroid/animation/Animator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Ll/sa80;->e:Landroid/animation/Animator;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public b()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sa80;->c:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    sget v1, Ll/obc0;->w:I

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/sa80;->b:Landroid/view/View;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/sa80;->a:Landroid/view/View;

    .line 18
    .line 19
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public c()V
    .locals 12

    .line 1
    iget-object v0, p0, Ll/sa80;->a:Landroid/view/View;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Ll/sa80;->b:Landroid/view/View;

    .line 7
    .line 8
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    iget-object v0, p0, Ll/sa80;->b:Landroid/view/View;

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/sa80;->a:Landroid/view/View;

    .line 21
    .line 22
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/sa80;->d:Landroid/widget/TextView;

    .line 26
    .line 27
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/sa80;->c:Landroid/widget/LinearLayout;

    .line 31
    .line 32
    invoke-static {}, Ll/dox;->e()I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    const/high16 v2, 0x41d00000    # 26.0f

    .line 37
    .line 38
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    invoke-static {v2}, Ll/dox;->b(I)I

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    invoke-virtual {v0, v1, v2}, Landroid/view/View;->measure(II)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Ll/sa80;->b:Landroid/view/View;

    .line 50
    .line 51
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 56
    .line 57
    iget-object v1, p0, Ll/sa80;->c:Landroid/widget/LinearLayout;

    .line 58
    .line 59
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 64
    .line 65
    iget-object v1, p0, Ll/sa80;->c:Landroid/widget/LinearLayout;

    .line 66
    .line 67
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 72
    .line 73
    iget-object v1, p0, Ll/sa80;->b:Landroid/view/View;

    .line 74
    .line 75
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Ll/sa80;->a:Landroid/view/View;

    .line 79
    .line 80
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 85
    .line 86
    iget-object v1, p0, Ll/sa80;->c:Landroid/widget/LinearLayout;

    .line 87
    .line 88
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 93
    .line 94
    iget-object v1, p0, Ll/sa80;->c:Landroid/widget/LinearLayout;

    .line 95
    .line 96
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 101
    .line 102
    iget-object v1, p0, Ll/sa80;->a:Landroid/view/View;

    .line 103
    .line 104
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 105
    .line 106
    .line 107
    iget-object v0, p0, Ll/sa80;->b:Landroid/view/View;

    .line 108
    .line 109
    sget v1, Ll/obc0;->w0:I

    .line 110
    .line 111
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 112
    .line 113
    .line 114
    iget-object v0, p0, Ll/sa80;->a:Landroid/view/View;

    .line 115
    .line 116
    sget v1, Ll/obc0;->w0:I

    .line 117
    .line 118
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 119
    .line 120
    .line 121
    iget-object v0, p0, Ll/sa80;->c:Landroid/widget/LinearLayout;

    .line 122
    .line 123
    sget v1, Ll/obc0;->Na:I

    .line 124
    .line 125
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 126
    .line 127
    .line 128
    :cond_1
    iget-object v2, p0, Ll/sa80;->b:Landroid/view/View;

    .line 129
    .line 130
    sget-object v3, Ll/gt0;->i:Landroid/util/Property;

    .line 131
    .line 132
    sget-object v10, Ll/gt0;->a:Landroid/view/animation/Interpolator;

    .line 133
    .line 134
    const/4 v0, 0x3

    .line 135
    new-array v9, v0, [F

    .line 136
    .line 137
    fill-array-data v9, :array_0

    .line 138
    .line 139
    .line 140
    const-wide/16 v4, 0x0

    .line 141
    .line 142
    const-wide/16 v6, 0x3e8

    .line 143
    .line 144
    move-object v8, v10

    .line 145
    invoke-static/range {v2 .. v9}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    iget-object v2, p0, Ll/sa80;->a:Landroid/view/View;

    .line 150
    .line 151
    sget-object v3, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 152
    .line 153
    new-instance v8, Landroid/view/animation/LinearInterpolator;

    .line 154
    .line 155
    invoke-direct {v8}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 156
    .line 157
    .line 158
    const/4 v4, 0x2

    .line 159
    new-array v9, v4, [F

    .line 160
    .line 161
    fill-array-data v9, :array_1

    .line 162
    .line 163
    .line 164
    const-wide/16 v4, 0x0

    .line 165
    .line 166
    invoke-static/range {v2 .. v9}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 167
    .line 168
    .line 169
    move-result-object v2

    .line 170
    iget-object v4, p0, Ll/sa80;->a:Landroid/view/View;

    .line 171
    .line 172
    sget-object v5, Landroid/view/View;->SCALE_X:Landroid/util/Property;

    .line 173
    .line 174
    new-array v11, v0, [F

    .line 175
    .line 176
    fill-array-data v11, :array_2

    .line 177
    .line 178
    .line 179
    const-wide/16 v6, 0x0

    .line 180
    .line 181
    const-wide/16 v8, 0x3e8

    .line 182
    .line 183
    invoke-static/range {v4 .. v11}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 184
    .line 185
    .line 186
    move-result-object v3

    .line 187
    iget-object v4, p0, Ll/sa80;->a:Landroid/view/View;

    .line 188
    .line 189
    sget-object v5, Landroid/view/View;->SCALE_Y:Landroid/util/Property;

    .line 190
    .line 191
    new-array v11, v0, [F

    .line 192
    .line 193
    fill-array-data v11, :array_3

    .line 194
    .line 195
    .line 196
    invoke-static/range {v4 .. v11}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    filled-new-array {v1, v2, v3, v0}, [Landroid/animation/Animator;

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    invoke-static {v0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    iput-object v0, p0, Ll/sa80;->e:Landroid/animation/Animator;

    .line 209
    .line 210
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 211
    .line 212
    .line 213
    return-void

    .line 214
    nop

    .line 215
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x3fa66666    # 1.3f
        0x3f800000    # 1.0f
    .end array-data

    .line 216
    .line 217
    .line 218
    .line 219
    .line 220
    .line 221
    .line 222
    .line 223
    .line 224
    .line 225
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 226
    .line 227
    .line 228
    .line 229
    .line 230
    .line 231
    .line 232
    .line 233
    :array_2
    .array-data 4
        0x3f800000    # 1.0f
        0x3fa66666    # 1.3f
        0x3fb33333    # 1.4f
    .end array-data

    .line 234
    .line 235
    .line 236
    .line 237
    .line 238
    .line 239
    .line 240
    .line 241
    .line 242
    .line 243
    :array_3
    .array-data 4
        0x3f800000    # 1.0f
        0x3fa66666    # 1.3f
        0x3fe00000    # 1.75f
    .end array-data
.end method
