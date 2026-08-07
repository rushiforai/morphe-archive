.class public Lcom/p1/mobile/putong/core/newui/home/views/SuperLikeBanner;
.super Lv/VImage;
.source "SourceFile"

# interfaces
.implements Landroid/os/Handler$Callback;


# instance fields
.field public d:Z

.field public e:I

.field public f:Z

.field public g:Ll/x20;

.field public h:[I
    .annotation build Landroidx/annotation/DrawableRes;
    .end annotation
.end field

.field public i:J

.field public j:Landroid/os/Handler;

.field public k:I

.field public l:J


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lv/VImage;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/SuperLikeBanner;->d:Z

    .line 6
    .line 7
    const/4 v0, -0x1

    .line 8
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/SuperLikeBanner;->e:I

    .line 9
    .line 10
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/SuperLikeBanner;->f:Z

    .line 11
    .line 12
    const-wide/16 v0, 0x11

    .line 13
    .line 14
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/SuperLikeBanner;->i:J

    .line 15
    .line 16
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1, p2}, Lv/VImage;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 18
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/SuperLikeBanner;->d:Z

    const/4 p2, -0x1

    .line 19
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/SuperLikeBanner;->e:I

    .line 20
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/SuperLikeBanner;->f:Z

    const-wide/16 p1, 0x11

    .line 21
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/SuperLikeBanner;->i:J

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 22
    invoke-direct {p0, p1, p2, p3}, Lv/VImage;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 23
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/SuperLikeBanner;->d:Z

    const/4 p2, -0x1

    .line 24
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/SuperLikeBanner;->e:I

    .line 25
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/SuperLikeBanner;->f:Z

    const-wide/16 p1, 0x11

    .line 26
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/SuperLikeBanner;->i:J

    return-void
.end method


# virtual methods
.method public h([IJ)V
    .locals 2
    .param p1    # [I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/SuperLikeBanner;->h:[I

    .line 2
    .line 3
    const-wide/16 v0, 0x11

    .line 4
    .line 5
    invoke-static {p2, p3, v0, v1}, Ljava/lang/Math;->max(JJ)J

    .line 6
    .line 7
    .line 8
    move-result-wide p1

    .line 9
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/SuperLikeBanner;->i:J

    .line 10
    .line 11
    new-instance p1, Landroid/os/Handler;

    .line 12
    .line 13
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-direct {p1, p2, p0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/SuperLikeBanner;->j:Landroid/os/Handler;

    .line 21
    .line 22
    return-void
.end method

.method public handleMessage(Landroid/os/Message;)Z
    .locals 0
    .param p1    # Landroid/os/Message;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/SuperLikeBanner;->j()V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x1

    .line 5
    return p0
.end method

.method public i()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/SuperLikeBanner;->d:Z

    .line 3
    .line 4
    const/4 v1, -0x1

    .line 5
    iput v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/SuperLikeBanner;->e:I

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/SuperLikeBanner;->f:Z

    .line 8
    .line 9
    return-void
.end method

.method public final j()V
    .locals 9

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/SuperLikeBanner;->d:Z

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/SuperLikeBanner;->f:Z

    .line 6
    .line 7
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/SuperLikeBanner;->e:I

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    add-int/lit8 v1, v1, -0x1

    .line 13
    .line 14
    iput v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/SuperLikeBanner;->e:I

    .line 15
    .line 16
    if-gez v1, :cond_1

    .line 17
    .line 18
    iput v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/SuperLikeBanner;->e:I

    .line 19
    .line 20
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/SuperLikeBanner;->d:Z

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 24
    .line 25
    iput v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/SuperLikeBanner;->e:I

    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/SuperLikeBanner;->h:[I

    .line 28
    .line 29
    array-length v3, v0

    .line 30
    if-lt v1, v3, :cond_1

    .line 31
    .line 32
    array-length v0, v0

    .line 33
    add-int/lit8 v0, v0, -0x1

    .line 34
    .line 35
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/SuperLikeBanner;->e:I

    .line 36
    .line 37
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/SuperLikeBanner;->d:Z

    .line 38
    .line 39
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/SuperLikeBanner;->h:[I

    .line 40
    .line 41
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/SuperLikeBanner;->e:I

    .line 42
    .line 43
    aget v0, v0, v1

    .line 44
    .line 45
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 46
    .line 47
    .line 48
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/SuperLikeBanner;->d:Z

    .line 49
    .line 50
    if-eqz v0, :cond_2

    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/SuperLikeBanner;->j:Landroid/os/Handler;

    .line 53
    .line 54
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/newui/home/views/SuperLikeBanner;->l:J

    .line 55
    .line 56
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/SuperLikeBanner;->e:I

    .line 57
    .line 58
    iget v5, p0, Lcom/p1/mobile/putong/core/newui/home/views/SuperLikeBanner;->k:I

    .line 59
    .line 60
    sub-int/2addr v1, v5

    .line 61
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    int-to-long v5, v1

    .line 66
    iget-wide v7, p0, Lcom/p1/mobile/putong/core/newui/home/views/SuperLikeBanner;->i:J

    .line 67
    .line 68
    mul-long/2addr v5, v7

    .line 69
    add-long/2addr v3, v5

    .line 70
    invoke-virtual {v0, v2, v3, v4}, Landroid/os/Handler;->sendEmptyMessageAtTime(IJ)Z

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/SuperLikeBanner;->g:Ll/x20;

    .line 75
    .line 76
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-eqz v0, :cond_3

    .line 81
    .line 82
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/SuperLikeBanner;->g:Ll/x20;

    .line 83
    .line 84
    invoke-interface {p0}, Ll/x20;->call()V

    .line 85
    .line 86
    .line 87
    :cond_3
    return-void
.end method

.method public k()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x0

    .line 3
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/home/views/SuperLikeBanner;->l(ZLl/x20;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public l(ZLl/x20;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/SuperLikeBanner;->j:Landroid/os/Handler;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 5
    .line 6
    .line 7
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/SuperLikeBanner;->e:I

    .line 8
    .line 9
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/SuperLikeBanner;->k:I

    .line 10
    .line 11
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/SuperLikeBanner;->l:J

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/SuperLikeBanner;->d:Z

    .line 19
    .line 20
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/SuperLikeBanner;->f:Z

    .line 21
    .line 22
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/SuperLikeBanner;->g:Ll/x20;

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/SuperLikeBanner;->j()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public setResByGender(Z)V
    .locals 18

    .line 1
    const/16 v1, 0xe

    .line 2
    .line 3
    const/16 v2, 0xd

    .line 4
    .line 5
    const/16 v3, 0xc

    .line 6
    .line 7
    const/16 v4, 0xb

    .line 8
    .line 9
    const/16 v5, 0xa

    .line 10
    .line 11
    const/16 v6, 0x9

    .line 12
    .line 13
    const/16 v7, 0x8

    .line 14
    .line 15
    const/4 v8, 0x7

    .line 16
    const/4 v9, 0x6

    .line 17
    const/4 v10, 0x5

    .line 18
    const/4 v11, 0x4

    .line 19
    const/4 v12, 0x3

    .line 20
    const/4 v13, 0x2

    .line 21
    const/4 v14, 0x1

    .line 22
    const/4 v15, 0x0

    .line 23
    const/16 v16, 0xf

    .line 24
    .line 25
    const/16 v0, 0x10

    .line 26
    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    new-array v0, v0, [I

    .line 30
    .line 31
    sget v17, Ll/dbc0;->s3:I

    .line 32
    .line 33
    aput v17, v0, v15

    .line 34
    .line 35
    sget v15, Ll/dbc0;->t3:I

    .line 36
    .line 37
    aput v15, v0, v14

    .line 38
    .line 39
    sget v14, Ll/dbc0;->z3:I

    .line 40
    .line 41
    aput v14, v0, v13

    .line 42
    .line 43
    sget v13, Ll/dbc0;->A3:I

    .line 44
    .line 45
    aput v13, v0, v12

    .line 46
    .line 47
    sget v12, Ll/dbc0;->B3:I

    .line 48
    .line 49
    aput v12, v0, v11

    .line 50
    .line 51
    sget v11, Ll/dbc0;->C3:I

    .line 52
    .line 53
    aput v11, v0, v10

    .line 54
    .line 55
    sget v10, Ll/dbc0;->D3:I

    .line 56
    .line 57
    aput v10, v0, v9

    .line 58
    .line 59
    sget v9, Ll/dbc0;->E3:I

    .line 60
    .line 61
    aput v9, v0, v8

    .line 62
    .line 63
    sget v8, Ll/dbc0;->F3:I

    .line 64
    .line 65
    aput v8, v0, v7

    .line 66
    .line 67
    sget v7, Ll/dbc0;->G3:I

    .line 68
    .line 69
    aput v7, v0, v6

    .line 70
    .line 71
    sget v6, Ll/dbc0;->u3:I

    .line 72
    .line 73
    aput v6, v0, v5

    .line 74
    .line 75
    sget v5, Ll/dbc0;->v3:I

    .line 76
    .line 77
    aput v5, v0, v4

    .line 78
    .line 79
    sget v4, Ll/dbc0;->w3:I

    .line 80
    .line 81
    aput v4, v0, v3

    .line 82
    .line 83
    sget v3, Ll/dbc0;->x3:I

    .line 84
    .line 85
    aput v3, v0, v2

    .line 86
    .line 87
    sget v2, Ll/dbc0;->y3:I

    .line 88
    .line 89
    aput v2, v0, v1

    .line 90
    .line 91
    aput v2, v0, v16

    .line 92
    .line 93
    :goto_0
    move-object/from16 v1, p0

    .line 94
    .line 95
    goto :goto_1

    .line 96
    :cond_0
    new-array v0, v0, [I

    .line 97
    .line 98
    sget v17, Ll/dbc0;->H3:I

    .line 99
    .line 100
    aput v17, v0, v15

    .line 101
    .line 102
    sget v15, Ll/dbc0;->I3:I

    .line 103
    .line 104
    aput v15, v0, v14

    .line 105
    .line 106
    sget v14, Ll/dbc0;->O3:I

    .line 107
    .line 108
    aput v14, v0, v13

    .line 109
    .line 110
    sget v13, Ll/dbc0;->P3:I

    .line 111
    .line 112
    aput v13, v0, v12

    .line 113
    .line 114
    sget v12, Ll/dbc0;->Q3:I

    .line 115
    .line 116
    aput v12, v0, v11

    .line 117
    .line 118
    sget v11, Ll/dbc0;->R3:I

    .line 119
    .line 120
    aput v11, v0, v10

    .line 121
    .line 122
    sget v10, Ll/dbc0;->S3:I

    .line 123
    .line 124
    aput v10, v0, v9

    .line 125
    .line 126
    sget v9, Ll/dbc0;->T3:I

    .line 127
    .line 128
    aput v9, v0, v8

    .line 129
    .line 130
    sget v8, Ll/dbc0;->U3:I

    .line 131
    .line 132
    aput v8, v0, v7

    .line 133
    .line 134
    sget v7, Ll/dbc0;->V3:I

    .line 135
    .line 136
    aput v7, v0, v6

    .line 137
    .line 138
    sget v6, Ll/dbc0;->J3:I

    .line 139
    .line 140
    aput v6, v0, v5

    .line 141
    .line 142
    sget v5, Ll/dbc0;->K3:I

    .line 143
    .line 144
    aput v5, v0, v4

    .line 145
    .line 146
    sget v4, Ll/dbc0;->L3:I

    .line 147
    .line 148
    aput v4, v0, v3

    .line 149
    .line 150
    sget v3, Ll/dbc0;->M3:I

    .line 151
    .line 152
    aput v3, v0, v2

    .line 153
    .line 154
    sget v2, Ll/dbc0;->N3:I

    .line 155
    .line 156
    aput v2, v0, v1

    .line 157
    .line 158
    aput v2, v0, v16

    .line 159
    .line 160
    goto :goto_0

    .line 161
    :goto_1
    iput-object v0, v1, Lcom/p1/mobile/putong/core/newui/home/views/SuperLikeBanner;->h:[I

    .line 162
    .line 163
    return-void
.end method
