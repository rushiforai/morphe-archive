.class public Lv/smart_refresh/SmartRefreshLayout$l;
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
    name = "l"
.end annotation


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:F

.field public e:F

.field public f:J

.field public g:J

.field public final synthetic h:Lv/smart_refresh/SmartRefreshLayout;


# direct methods
.method public constructor <init>(Lv/smart_refresh/SmartRefreshLayout;F)V
    .locals 2

    .line 1
    iput-object p1, p0, Lv/smart_refresh/SmartRefreshLayout$l;->h:Lv/smart_refresh/SmartRefreshLayout;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput v0, p0, Lv/smart_refresh/SmartRefreshLayout$l;->b:I

    .line 8
    .line 9
    const/16 v0, 0xa

    .line 10
    .line 11
    iput v0, p0, Lv/smart_refresh/SmartRefreshLayout$l;->c:I

    .line 12
    .line 13
    const v0, 0x3f7ae148    # 0.98f

    .line 14
    .line 15
    .line 16
    iput v0, p0, Lv/smart_refresh/SmartRefreshLayout$l;->e:F

    .line 17
    .line 18
    const-wide/16 v0, 0x0

    .line 19
    .line 20
    iput-wide v0, p0, Lv/smart_refresh/SmartRefreshLayout$l;->f:J

    .line 21
    .line 22
    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    .line 23
    .line 24
    .line 25
    move-result-wide v0

    .line 26
    iput-wide v0, p0, Lv/smart_refresh/SmartRefreshLayout$l;->g:J

    .line 27
    .line 28
    iput p2, p0, Lv/smart_refresh/SmartRefreshLayout$l;->d:F

    .line 29
    .line 30
    iget p1, p1, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 31
    .line 32
    iput p1, p0, Lv/smart_refresh/SmartRefreshLayout$l;->a:I

    .line 33
    .line 34
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/Runnable;
    .locals 11

    .line 1
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout$l;->h:Lv/smart_refresh/SmartRefreshLayout;

    .line 2
    .line 3
    iget-object v1, v0, Lv/smart_refresh/SmartRefreshLayout;->d1:Lv/smart_refresh/constant/RefreshState;

    .line 4
    .line 5
    iget-boolean v2, v1, Lv/smart_refresh/constant/RefreshState;->isFinishing:Z

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    return-object v3

    .line 11
    :cond_0
    iget v2, v0, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 12
    .line 13
    if-eqz v2, :cond_8

    .line 14
    .line 15
    iget-boolean v1, v1, Lv/smart_refresh/constant/RefreshState;->isOpening:Z

    .line 16
    .line 17
    if-nez v1, :cond_1

    .line 18
    .line 19
    iget-boolean v1, v0, Lv/smart_refresh/SmartRefreshLayout;->T:Z

    .line 20
    .line 21
    if-eqz v1, :cond_4

    .line 22
    .line 23
    iget-boolean v1, v0, Lv/smart_refresh/SmartRefreshLayout;->H:Z

    .line 24
    .line 25
    if-eqz v1, :cond_4

    .line 26
    .line 27
    iget-boolean v1, v0, Lv/smart_refresh/SmartRefreshLayout;->U:Z

    .line 28
    .line 29
    if-eqz v1, :cond_4

    .line 30
    .line 31
    iget-boolean v1, v0, Lv/smart_refresh/SmartRefreshLayout;->C:Z

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Lv/smart_refresh/SmartRefreshLayout;->z(Z)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_4

    .line 38
    .line 39
    :cond_1
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout$l;->h:Lv/smart_refresh/SmartRefreshLayout;

    .line 40
    .line 41
    iget-object v1, v0, Lv/smart_refresh/SmartRefreshLayout;->d1:Lv/smart_refresh/constant/RefreshState;

    .line 42
    .line 43
    sget-object v2, Lv/smart_refresh/constant/RefreshState;->Loading:Lv/smart_refresh/constant/RefreshState;

    .line 44
    .line 45
    if-eq v1, v2, :cond_2

    .line 46
    .line 47
    iget-boolean v1, v0, Lv/smart_refresh/SmartRefreshLayout;->T:Z

    .line 48
    .line 49
    if-eqz v1, :cond_3

    .line 50
    .line 51
    iget-boolean v1, v0, Lv/smart_refresh/SmartRefreshLayout;->H:Z

    .line 52
    .line 53
    if-eqz v1, :cond_3

    .line 54
    .line 55
    iget-boolean v1, v0, Lv/smart_refresh/SmartRefreshLayout;->U:Z

    .line 56
    .line 57
    if-eqz v1, :cond_3

    .line 58
    .line 59
    iget-boolean v1, v0, Lv/smart_refresh/SmartRefreshLayout;->C:Z

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Lv/smart_refresh/SmartRefreshLayout;->z(Z)Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-eqz v0, :cond_3

    .line 66
    .line 67
    :cond_2
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout$l;->h:Lv/smart_refresh/SmartRefreshLayout;

    .line 68
    .line 69
    iget v1, v0, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 70
    .line 71
    iget v0, v0, Lv/smart_refresh/SmartRefreshLayout;->O0:I

    .line 72
    .line 73
    neg-int v0, v0

    .line 74
    if-lt v1, v0, :cond_4

    .line 75
    .line 76
    :cond_3
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout$l;->h:Lv/smart_refresh/SmartRefreshLayout;

    .line 77
    .line 78
    iget-object v1, v0, Lv/smart_refresh/SmartRefreshLayout;->d1:Lv/smart_refresh/constant/RefreshState;

    .line 79
    .line 80
    sget-object v2, Lv/smart_refresh/constant/RefreshState;->Refreshing:Lv/smart_refresh/constant/RefreshState;

    .line 81
    .line 82
    if-ne v1, v2, :cond_8

    .line 83
    .line 84
    iget v1, v0, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 85
    .line 86
    iget v0, v0, Lv/smart_refresh/SmartRefreshLayout;->M0:I

    .line 87
    .line 88
    if-le v1, v0, :cond_8

    .line 89
    .line 90
    :cond_4
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout$l;->h:Lv/smart_refresh/SmartRefreshLayout;

    .line 91
    .line 92
    iget v0, v0, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 93
    .line 94
    iget v1, p0, Lv/smart_refresh/SmartRefreshLayout$l;->d:F

    .line 95
    .line 96
    const/4 v2, 0x0

    .line 97
    move v4, v0

    .line 98
    :goto_0
    mul-int v5, v0, v4

    .line 99
    .line 100
    if-lez v5, :cond_8

    .line 101
    .line 102
    float-to-double v5, v1

    .line 103
    iget v1, p0, Lv/smart_refresh/SmartRefreshLayout$l;->e:F

    .line 104
    .line 105
    float-to-double v7, v1

    .line 106
    add-int/lit8 v2, v2, 0x1

    .line 107
    .line 108
    iget v1, p0, Lv/smart_refresh/SmartRefreshLayout$l;->c:I

    .line 109
    .line 110
    mul-int/2addr v1, v2

    .line 111
    int-to-float v1, v1

    .line 112
    const/high16 v9, 0x41200000    # 10.0f

    .line 113
    .line 114
    div-float/2addr v1, v9

    .line 115
    float-to-double v9, v1

    .line 116
    invoke-static {v7, v8, v9, v10}, Ljava/lang/Math;->pow(DD)D

    .line 117
    .line 118
    .line 119
    move-result-wide v7

    .line 120
    mul-double/2addr v5, v7

    .line 121
    double-to-float v1, v5

    .line 122
    iget v5, p0, Lv/smart_refresh/SmartRefreshLayout$l;->c:I

    .line 123
    .line 124
    int-to-float v5, v5

    .line 125
    const/high16 v6, 0x3f800000    # 1.0f

    .line 126
    .line 127
    mul-float/2addr v5, v6

    .line 128
    const/high16 v7, 0x447a0000    # 1000.0f

    .line 129
    .line 130
    div-float/2addr v5, v7

    .line 131
    mul-float/2addr v5, v1

    .line 132
    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    .line 133
    .line 134
    .line 135
    move-result v7

    .line 136
    cmpg-float v6, v7, v6

    .line 137
    .line 138
    if-gez v6, :cond_7

    .line 139
    .line 140
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout$l;->h:Lv/smart_refresh/SmartRefreshLayout;

    .line 141
    .line 142
    iget-object v1, v0, Lv/smart_refresh/SmartRefreshLayout;->d1:Lv/smart_refresh/constant/RefreshState;

    .line 143
    .line 144
    iget-boolean v2, v1, Lv/smart_refresh/constant/RefreshState;->isOpening:Z

    .line 145
    .line 146
    if-eqz v2, :cond_6

    .line 147
    .line 148
    sget-object v2, Lv/smart_refresh/constant/RefreshState;->Refreshing:Lv/smart_refresh/constant/RefreshState;

    .line 149
    .line 150
    if-ne v1, v2, :cond_5

    .line 151
    .line 152
    iget v5, v0, Lv/smart_refresh/SmartRefreshLayout;->M0:I

    .line 153
    .line 154
    if-gt v4, v5, :cond_6

    .line 155
    .line 156
    :cond_5
    if-eq v1, v2, :cond_8

    .line 157
    .line 158
    iget v0, v0, Lv/smart_refresh/SmartRefreshLayout;->O0:I

    .line 159
    .line 160
    neg-int v0, v0

    .line 161
    if-ge v4, v0, :cond_8

    .line 162
    .line 163
    :cond_6
    return-object v3

    .line 164
    :cond_7
    int-to-float v4, v4

    .line 165
    add-float/2addr v4, v5

    .line 166
    float-to-int v4, v4

    .line 167
    goto :goto_0

    .line 168
    :cond_8
    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    .line 169
    .line 170
    .line 171
    move-result-wide v0

    .line 172
    iput-wide v0, p0, Lv/smart_refresh/SmartRefreshLayout$l;->f:J

    .line 173
    .line 174
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout$l;->h:Lv/smart_refresh/SmartRefreshLayout;

    .line 175
    .line 176
    iget-object v0, v0, Lv/smart_refresh/SmartRefreshLayout;->b1:Landroid/os/Handler;

    .line 177
    .line 178
    iget v1, p0, Lv/smart_refresh/SmartRefreshLayout$l;->c:I

    .line 179
    .line 180
    int-to-long v1, v1

    .line 181
    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 182
    .line 183
    .line 184
    return-object p0
.end method

.method public run()V
    .locals 11

    .line 1
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout$l;->h:Lv/smart_refresh/SmartRefreshLayout;

    .line 2
    .line 3
    iget-object v1, v0, Lv/smart_refresh/SmartRefreshLayout;->o1:Ljava/lang/Runnable;

    .line 4
    .line 5
    if-ne v1, p0, :cond_2

    .line 6
    .line 7
    iget-object v0, v0, Lv/smart_refresh/SmartRefreshLayout;->d1:Lv/smart_refresh/constant/RefreshState;

    .line 8
    .line 9
    iget-boolean v0, v0, Lv/smart_refresh/constant/RefreshState;->isFinishing:Z

    .line 10
    .line 11
    if-nez v0, :cond_2

    .line 12
    .line 13
    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    iget-wide v2, p0, Lv/smart_refresh/SmartRefreshLayout$l;->g:J

    .line 18
    .line 19
    sub-long v2, v0, v2

    .line 20
    .line 21
    iget v4, p0, Lv/smart_refresh/SmartRefreshLayout$l;->d:F

    .line 22
    .line 23
    float-to-double v4, v4

    .line 24
    iget v6, p0, Lv/smart_refresh/SmartRefreshLayout$l;->e:F

    .line 25
    .line 26
    float-to-double v6, v6

    .line 27
    iget-wide v8, p0, Lv/smart_refresh/SmartRefreshLayout$l;->f:J

    .line 28
    .line 29
    sub-long v8, v0, v8

    .line 30
    .line 31
    long-to-float v8, v8

    .line 32
    iget v9, p0, Lv/smart_refresh/SmartRefreshLayout$l;->c:I

    .line 33
    .line 34
    int-to-float v9, v9

    .line 35
    const/high16 v10, 0x447a0000    # 1000.0f

    .line 36
    .line 37
    div-float v9, v10, v9

    .line 38
    .line 39
    div-float/2addr v8, v9

    .line 40
    float-to-double v8, v8

    .line 41
    invoke-static {v6, v7, v8, v9}, Ljava/lang/Math;->pow(DD)D

    .line 42
    .line 43
    .line 44
    move-result-wide v6

    .line 45
    mul-double/2addr v4, v6

    .line 46
    double-to-float v4, v4

    .line 47
    iput v4, p0, Lv/smart_refresh/SmartRefreshLayout$l;->d:F

    .line 48
    .line 49
    long-to-float v2, v2

    .line 50
    const/high16 v3, 0x3f800000    # 1.0f

    .line 51
    .line 52
    mul-float/2addr v2, v3

    .line 53
    div-float/2addr v2, v10

    .line 54
    mul-float/2addr v4, v2

    .line 55
    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    cmpl-float v2, v2, v3

    .line 60
    .line 61
    const/4 v3, 0x0

    .line 62
    if-lez v2, :cond_1

    .line 63
    .line 64
    iput-wide v0, p0, Lv/smart_refresh/SmartRefreshLayout$l;->g:J

    .line 65
    .line 66
    iget v0, p0, Lv/smart_refresh/SmartRefreshLayout$l;->a:I

    .line 67
    .line 68
    int-to-float v0, v0

    .line 69
    add-float/2addr v0, v4

    .line 70
    float-to-int v0, v0

    .line 71
    iput v0, p0, Lv/smart_refresh/SmartRefreshLayout$l;->a:I

    .line 72
    .line 73
    iget-object v1, p0, Lv/smart_refresh/SmartRefreshLayout$l;->h:Lv/smart_refresh/SmartRefreshLayout;

    .line 74
    .line 75
    iget v2, v1, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 76
    .line 77
    mul-int/2addr v2, v0

    .line 78
    const/4 v5, 0x1

    .line 79
    if-lez v2, :cond_0

    .line 80
    .line 81
    iget-object v1, v1, Lv/smart_refresh/SmartRefreshLayout;->c1:Ll/lvc0;

    .line 82
    .line 83
    invoke-interface {v1, v0, v5}, Ll/lvc0;->e(IZ)Ll/lvc0;

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout$l;->h:Lv/smart_refresh/SmartRefreshLayout;

    .line 87
    .line 88
    iget-object v0, v0, Lv/smart_refresh/SmartRefreshLayout;->b1:Landroid/os/Handler;

    .line 89
    .line 90
    iget v1, p0, Lv/smart_refresh/SmartRefreshLayout$l;->c:I

    .line 91
    .line 92
    int-to-long v1, v1

    .line 93
    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 94
    .line 95
    .line 96
    return-void

    .line 97
    :cond_0
    iput-object v3, v1, Lv/smart_refresh/SmartRefreshLayout;->o1:Ljava/lang/Runnable;

    .line 98
    .line 99
    iget-object v0, v1, Lv/smart_refresh/SmartRefreshLayout;->c1:Ll/lvc0;

    .line 100
    .line 101
    const/4 v1, 0x0

    .line 102
    invoke-interface {v0, v1, v5}, Ll/lvc0;->e(IZ)Ll/lvc0;

    .line 103
    .line 104
    .line 105
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout$l;->h:Lv/smart_refresh/SmartRefreshLayout;

    .line 106
    .line 107
    iget-object v0, v0, Lv/smart_refresh/SmartRefreshLayout;->Z0:Ll/hvc0;

    .line 108
    .line 109
    invoke-interface {v0}, Ll/hvc0;->h()Landroid/view/View;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    iget v2, p0, Lv/smart_refresh/SmartRefreshLayout$l;->d:F

    .line 114
    .line 115
    neg-float v2, v2

    .line 116
    float-to-int v2, v2

    .line 117
    invoke-static {v0, v2}, Ll/rsf0;->d(Landroid/view/View;I)V

    .line 118
    .line 119
    .line 120
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout$l;->h:Lv/smart_refresh/SmartRefreshLayout;

    .line 121
    .line 122
    iget-boolean v0, p0, Lv/smart_refresh/SmartRefreshLayout;->l1:Z

    .line 123
    .line 124
    if-eqz v0, :cond_2

    .line 125
    .line 126
    const/4 v0, 0x0

    .line 127
    cmpl-float v0, v4, v0

    .line 128
    .line 129
    if-lez v0, :cond_2

    .line 130
    .line 131
    iput-boolean v1, p0, Lv/smart_refresh/SmartRefreshLayout;->l1:Z

    .line 132
    .line 133
    return-void

    .line 134
    :cond_1
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout$l;->h:Lv/smart_refresh/SmartRefreshLayout;

    .line 135
    .line 136
    iput-object v3, p0, Lv/smart_refresh/SmartRefreshLayout;->o1:Ljava/lang/Runnable;

    .line 137
    .line 138
    :cond_2
    return-void
.end method
