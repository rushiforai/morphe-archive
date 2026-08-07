.class public Lv/smart_refresh/SmartRefreshLayout$k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lv/smart_refresh/SmartRefreshLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "k"
.end annotation


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:J

.field public e:F

.field public f:F

.field public final synthetic g:Lv/smart_refresh/SmartRefreshLayout;


# direct methods
.method public constructor <init>(Lv/smart_refresh/SmartRefreshLayout;FI)V
    .locals 3

    .line 1
    iput-object p1, p0, Lv/smart_refresh/SmartRefreshLayout$k;->g:Lv/smart_refresh/SmartRefreshLayout;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput v0, p0, Lv/smart_refresh/SmartRefreshLayout$k;->a:I

    .line 8
    .line 9
    const/16 v0, 0xa

    .line 10
    .line 11
    iput v0, p0, Lv/smart_refresh/SmartRefreshLayout$k;->b:I

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput v0, p0, Lv/smart_refresh/SmartRefreshLayout$k;->e:F

    .line 15
    .line 16
    iput p2, p0, Lv/smart_refresh/SmartRefreshLayout$k;->f:F

    .line 17
    .line 18
    iput p3, p0, Lv/smart_refresh/SmartRefreshLayout$k;->c:I

    .line 19
    .line 20
    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    .line 21
    .line 22
    .line 23
    move-result-wide v1

    .line 24
    iput-wide v1, p0, Lv/smart_refresh/SmartRefreshLayout$k;->d:J

    .line 25
    .line 26
    iget-object p3, p1, Lv/smart_refresh/SmartRefreshLayout;->b1:Landroid/os/Handler;

    .line 27
    .line 28
    iget v1, p0, Lv/smart_refresh/SmartRefreshLayout$k;->b:I

    .line 29
    .line 30
    int-to-long v1, v1

    .line 31
    invoke-virtual {p3, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 32
    .line 33
    .line 34
    cmpl-float p0, p2, v0

    .line 35
    .line 36
    iget-object p1, p1, Lv/smart_refresh/SmartRefreshLayout;->c1:Ll/lvc0;

    .line 37
    .line 38
    if-lez p0, :cond_0

    .line 39
    .line 40
    sget-object p0, Lv/smart_refresh/constant/RefreshState;->PullDownToRefresh:Lv/smart_refresh/constant/RefreshState;

    .line 41
    .line 42
    invoke-interface {p1, p0}, Ll/lvc0;->f(Lv/smart_refresh/constant/RefreshState;)Ll/lvc0;

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_0
    sget-object p0, Lv/smart_refresh/constant/RefreshState;->PullUpToLoad:Lv/smart_refresh/constant/RefreshState;

    .line 47
    .line 48
    invoke-interface {p1, p0}, Ll/lvc0;->f(Lv/smart_refresh/constant/RefreshState;)Ll/lvc0;

    .line 49
    .line 50
    .line 51
    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 1
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout$k;->g:Lv/smart_refresh/SmartRefreshLayout;

    .line 2
    .line 3
    iget-object v1, v0, Lv/smart_refresh/SmartRefreshLayout;->o1:Ljava/lang/Runnable;

    .line 4
    .line 5
    if-ne v1, p0, :cond_5

    .line 6
    .line 7
    iget-object v1, v0, Lv/smart_refresh/SmartRefreshLayout;->d1:Lv/smart_refresh/constant/RefreshState;

    .line 8
    .line 9
    iget-boolean v1, v1, Lv/smart_refresh/constant/RefreshState;->isFinishing:Z

    .line 10
    .line 11
    if-nez v1, :cond_5

    .line 12
    .line 13
    iget v0, v0, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 14
    .line 15
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iget v1, p0, Lv/smart_refresh/SmartRefreshLayout$k;->c:I

    .line 20
    .line 21
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-lt v0, v1, :cond_1

    .line 26
    .line 27
    iget v0, p0, Lv/smart_refresh/SmartRefreshLayout$k;->c:I

    .line 28
    .line 29
    iget v1, p0, Lv/smart_refresh/SmartRefreshLayout$k;->f:F

    .line 30
    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    float-to-double v0, v1

    .line 34
    iget v2, p0, Lv/smart_refresh/SmartRefreshLayout$k;->a:I

    .line 35
    .line 36
    add-int/lit8 v2, v2, 0x1

    .line 37
    .line 38
    iput v2, p0, Lv/smart_refresh/SmartRefreshLayout$k;->a:I

    .line 39
    .line 40
    mul-int/lit8 v2, v2, 0x2

    .line 41
    .line 42
    int-to-double v2, v2

    .line 43
    const-wide v4, 0x3fdcccccc0000000L    # 0.44999998807907104

    .line 44
    .line 45
    .line 46
    .line 47
    .line 48
    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->pow(DD)D

    .line 49
    .line 50
    .line 51
    move-result-wide v2

    .line 52
    mul-double/2addr v0, v2

    .line 53
    double-to-float v0, v0

    .line 54
    iput v0, p0, Lv/smart_refresh/SmartRefreshLayout$k;->f:F

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_0
    float-to-double v0, v1

    .line 58
    iget v2, p0, Lv/smart_refresh/SmartRefreshLayout$k;->a:I

    .line 59
    .line 60
    add-int/lit8 v2, v2, 0x1

    .line 61
    .line 62
    iput v2, p0, Lv/smart_refresh/SmartRefreshLayout$k;->a:I

    .line 63
    .line 64
    mul-int/lit8 v2, v2, 0x2

    .line 65
    .line 66
    int-to-double v2, v2

    .line 67
    const-wide v4, 0x3feb333340000000L    # 0.8500000238418579

    .line 68
    .line 69
    .line 70
    .line 71
    .line 72
    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->pow(DD)D

    .line 73
    .line 74
    .line 75
    move-result-wide v2

    .line 76
    mul-double/2addr v0, v2

    .line 77
    double-to-float v0, v0

    .line 78
    iput v0, p0, Lv/smart_refresh/SmartRefreshLayout$k;->f:F

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_1
    iget v0, p0, Lv/smart_refresh/SmartRefreshLayout$k;->f:F

    .line 82
    .line 83
    float-to-double v0, v0

    .line 84
    iget v2, p0, Lv/smart_refresh/SmartRefreshLayout$k;->a:I

    .line 85
    .line 86
    add-int/lit8 v2, v2, 0x1

    .line 87
    .line 88
    iput v2, p0, Lv/smart_refresh/SmartRefreshLayout$k;->a:I

    .line 89
    .line 90
    mul-int/lit8 v2, v2, 0x2

    .line 91
    .line 92
    int-to-double v2, v2

    .line 93
    const-wide v4, 0x3fee666660000000L    # 0.949999988079071

    .line 94
    .line 95
    .line 96
    .line 97
    .line 98
    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->pow(DD)D

    .line 99
    .line 100
    .line 101
    move-result-wide v2

    .line 102
    mul-double/2addr v0, v2

    .line 103
    double-to-float v0, v0

    .line 104
    iput v0, p0, Lv/smart_refresh/SmartRefreshLayout$k;->f:F

    .line 105
    .line 106
    :goto_0
    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    .line 107
    .line 108
    .line 109
    move-result-wide v0

    .line 110
    iget-wide v2, p0, Lv/smart_refresh/SmartRefreshLayout$k;->d:J

    .line 111
    .line 112
    sub-long v2, v0, v2

    .line 113
    .line 114
    long-to-float v2, v2

    .line 115
    const/high16 v3, 0x3f800000    # 1.0f

    .line 116
    .line 117
    mul-float/2addr v2, v3

    .line 118
    const/high16 v4, 0x447a0000    # 1000.0f

    .line 119
    .line 120
    div-float/2addr v2, v4

    .line 121
    iget v4, p0, Lv/smart_refresh/SmartRefreshLayout$k;->f:F

    .line 122
    .line 123
    mul-float/2addr v4, v2

    .line 124
    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    .line 125
    .line 126
    .line 127
    move-result v2

    .line 128
    cmpl-float v2, v2, v3

    .line 129
    .line 130
    if-ltz v2, :cond_2

    .line 131
    .line 132
    iput-wide v0, p0, Lv/smart_refresh/SmartRefreshLayout$k;->d:J

    .line 133
    .line 134
    iget v0, p0, Lv/smart_refresh/SmartRefreshLayout$k;->e:F

    .line 135
    .line 136
    add-float/2addr v0, v4

    .line 137
    iput v0, p0, Lv/smart_refresh/SmartRefreshLayout$k;->e:F

    .line 138
    .line 139
    iget-object v1, p0, Lv/smart_refresh/SmartRefreshLayout$k;->g:Lv/smart_refresh/SmartRefreshLayout;

    .line 140
    .line 141
    invoke-virtual {v1, v0}, Lv/smart_refresh/SmartRefreshLayout;->C(F)V

    .line 142
    .line 143
    .line 144
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout$k;->g:Lv/smart_refresh/SmartRefreshLayout;

    .line 145
    .line 146
    iget-object v0, v0, Lv/smart_refresh/SmartRefreshLayout;->b1:Landroid/os/Handler;

    .line 147
    .line 148
    iget v1, p0, Lv/smart_refresh/SmartRefreshLayout$k;->b:I

    .line 149
    .line 150
    int-to-long v1, v1

    .line 151
    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 152
    .line 153
    .line 154
    return-void

    .line 155
    :cond_2
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout$k;->g:Lv/smart_refresh/SmartRefreshLayout;

    .line 156
    .line 157
    iget-object v1, v0, Lv/smart_refresh/SmartRefreshLayout;->e1:Lv/smart_refresh/constant/RefreshState;

    .line 158
    .line 159
    iget-boolean v2, v1, Lv/smart_refresh/constant/RefreshState;->isDragging:Z

    .line 160
    .line 161
    if-eqz v2, :cond_3

    .line 162
    .line 163
    iget-boolean v3, v1, Lv/smart_refresh/constant/RefreshState;->isHeader:Z

    .line 164
    .line 165
    if-eqz v3, :cond_3

    .line 166
    .line 167
    iget-object v0, v0, Lv/smart_refresh/SmartRefreshLayout;->c1:Ll/lvc0;

    .line 168
    .line 169
    sget-object v1, Lv/smart_refresh/constant/RefreshState;->PullDownCanceled:Lv/smart_refresh/constant/RefreshState;

    .line 170
    .line 171
    invoke-interface {v0, v1}, Ll/lvc0;->f(Lv/smart_refresh/constant/RefreshState;)Ll/lvc0;

    .line 172
    .line 173
    .line 174
    goto :goto_1

    .line 175
    :cond_3
    if-eqz v2, :cond_4

    .line 176
    .line 177
    iget-boolean v1, v1, Lv/smart_refresh/constant/RefreshState;->isFooter:Z

    .line 178
    .line 179
    if-eqz v1, :cond_4

    .line 180
    .line 181
    iget-object v0, v0, Lv/smart_refresh/SmartRefreshLayout;->c1:Ll/lvc0;

    .line 182
    .line 183
    sget-object v1, Lv/smart_refresh/constant/RefreshState;->PullUpCanceled:Lv/smart_refresh/constant/RefreshState;

    .line 184
    .line 185
    invoke-interface {v0, v1}, Ll/lvc0;->f(Lv/smart_refresh/constant/RefreshState;)Ll/lvc0;

    .line 186
    .line 187
    .line 188
    :cond_4
    :goto_1
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout$k;->g:Lv/smart_refresh/SmartRefreshLayout;

    .line 189
    .line 190
    const/4 v1, 0x0

    .line 191
    iput-object v1, v0, Lv/smart_refresh/SmartRefreshLayout;->o1:Ljava/lang/Runnable;

    .line 192
    .line 193
    iget v0, v0, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 194
    .line 195
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 196
    .line 197
    .line 198
    move-result v0

    .line 199
    iget v1, p0, Lv/smart_refresh/SmartRefreshLayout$k;->c:I

    .line 200
    .line 201
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 202
    .line 203
    .line 204
    move-result v1

    .line 205
    if-lt v0, v1, :cond_5

    .line 206
    .line 207
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout$k;->g:Lv/smart_refresh/SmartRefreshLayout;

    .line 208
    .line 209
    iget v0, v0, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 210
    .line 211
    iget v1, p0, Lv/smart_refresh/SmartRefreshLayout$k;->c:I

    .line 212
    .line 213
    sub-int/2addr v0, v1

    .line 214
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 215
    .line 216
    .line 217
    move-result v0

    .line 218
    invoke-static {v0}, Ll/rsf0;->i(I)F

    .line 219
    .line 220
    .line 221
    move-result v0

    .line 222
    float-to-int v0, v0

    .line 223
    const/16 v1, 0x1e

    .line 224
    .line 225
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    .line 226
    .line 227
    .line 228
    move-result v0

    .line 229
    const/16 v1, 0x64

    .line 230
    .line 231
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 232
    .line 233
    .line 234
    move-result v0

    .line 235
    mul-int/lit8 v0, v0, 0xa

    .line 236
    .line 237
    iget-object v1, p0, Lv/smart_refresh/SmartRefreshLayout$k;->g:Lv/smart_refresh/SmartRefreshLayout;

    .line 238
    .line 239
    iget p0, p0, Lv/smart_refresh/SmartRefreshLayout$k;->c:I

    .line 240
    .line 241
    const/4 v2, 0x0

    .line 242
    iget-object v3, v1, Lv/smart_refresh/SmartRefreshLayout;->z:Landroid/view/animation/Interpolator;

    .line 243
    .line 244
    invoke-virtual {v1, p0, v2, v3, v0}, Lv/smart_refresh/SmartRefreshLayout;->h(IILandroid/view/animation/Interpolator;I)Landroid/animation/ValueAnimator;

    .line 245
    .line 246
    .line 247
    :cond_5
    return-void
.end method
