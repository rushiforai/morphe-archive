.class public Lcom/momo/mcamera/mask/MirrImageFrameFilter;
.super Ll/rt2;
.source "SourceFile"

# interfaces
.implements Ll/gam;


# static fields
.field private static final UNIFORM_BACKGROUND:Ljava/lang/String; = "background"

.field private static final UNIFORM_FIRST_TIME:Ljava/lang/String; = "firstTime"

.field private static final UNIFORM_ORDER:Ljava/lang/String; = "order"


# instance fields
.field private backgroundHandle:I

.field private firstHandle:I

.field private mBackground:F

.field private mFirst:F

.field private mFourPalaceCount:I

.field private mImageCount:I

.field private mOrder:F

.field private mTexture0:I

.field private mTexture0Handle:I

.field private mTexture1:I

.field private mTexture1Handle:I

.field private mTexture2:I

.field private mTexture2Handle:I

.field private mTexture3:I

.field private mTexture3Handle:I

.field private mTimeInterval:J

.field private mWindowsFrameFour:Ll/lej;

.field private mWindowsFrameOne:Ll/lej;

.field private mWindowsFrameThree:Ll/lej;

.field private mWindowsFrameTwo:Ll/lej;

.field private orderHandle:I


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ll/rt2;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mTexture0:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    iput v1, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mTexture0Handle:I

    .line 9
    .line 10
    iput v0, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mTexture1:I

    .line 11
    .line 12
    iput v1, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mTexture1Handle:I

    .line 13
    .line 14
    iput v0, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mTexture2:I

    .line 15
    .line 16
    iput v1, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mTexture2Handle:I

    .line 17
    .line 18
    iput v0, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mTexture3:I

    .line 19
    .line 20
    iput v1, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mTexture3Handle:I

    .line 21
    .line 22
    iput v1, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mImageCount:I

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    iput v0, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mOrder:F

    .line 26
    .line 27
    iput v0, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mBackground:F

    .line 28
    .line 29
    iput v0, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mFirst:F

    .line 30
    .line 31
    const/4 v0, 0x0

    .line 32
    iput-object v0, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mWindowsFrameOne:Ll/lej;

    .line 33
    .line 34
    iput-object v0, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mWindowsFrameTwo:Ll/lej;

    .line 35
    .line 36
    iput-object v0, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mWindowsFrameThree:Ll/lej;

    .line 37
    .line 38
    iput-object v0, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mWindowsFrameFour:Ll/lej;

    .line 39
    .line 40
    const-wide/16 v2, 0x1e

    .line 41
    .line 42
    iput-wide v2, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mTimeInterval:J

    .line 43
    .line 44
    iput v1, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mFourPalaceCount:I

    .line 45
    .line 46
    return-void
.end method

.method private activityPalaceFrameBuffer(Ll/lej;)Ll/lej;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_1

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->initFrameBuffer(Ll/lej;)Ll/lej;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    return-object v0

    .line 22
    :cond_1
    :goto_0
    if-eqz p1, :cond_3

    .line 23
    .line 24
    invoke-virtual {p1}, Ll/lej;->h()[I

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    if-nez v1, :cond_3

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_2

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eqz v1, :cond_2

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->initFrameBuffer(Ll/lej;)Ll/lej;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    goto :goto_1

    .line 47
    :cond_2
    return-object v0

    .line 48
    :cond_3
    :goto_1
    iget v0, p0, Ll/wej;->width:I

    .line 49
    .line 50
    iget p0, p0, Ll/wej;->height:I

    .line 51
    .line 52
    invoke-virtual {p1, v0, p0}, Ll/lej;->b(II)V

    .line 53
    .line 54
    .line 55
    return-object p1
.end method

.method private generateFramebuffer()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mWindowsFrameOne:Ll/lej;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0, v0}, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->activityPalaceFrameBuffer(Ll/lej;)Ll/lej;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mWindowsFrameOne:Ll/lej;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mWindowsFrameTwo:Ll/lej;

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-direct {p0, v0}, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->activityPalaceFrameBuffer(Ll/lej;)Ll/lej;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mWindowsFrameTwo:Ll/lej;

    .line 20
    .line 21
    :cond_1
    iget-object v0, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mWindowsFrameThree:Ll/lej;

    .line 22
    .line 23
    if-nez v0, :cond_2

    .line 24
    .line 25
    invoke-direct {p0, v0}, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->activityPalaceFrameBuffer(Ll/lej;)Ll/lej;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mWindowsFrameThree:Ll/lej;

    .line 30
    .line 31
    :cond_2
    iget-object v0, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mWindowsFrameFour:Ll/lej;

    .line 32
    .line 33
    if-nez v0, :cond_3

    .line 34
    .line 35
    invoke-direct {p0, v0}, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->activityPalaceFrameBuffer(Ll/lej;)Ll/lej;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iput-object v0, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mWindowsFrameFour:Ll/lej;

    .line 40
    .line 41
    :cond_3
    return-void
.end method

.method private releasePalaceFrameBuffer()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mWindowsFrameOne:Ll/lej;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/lej;->e()V

    .line 7
    .line 8
    .line 9
    iput-object v1, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mWindowsFrameOne:Ll/lej;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mWindowsFrameTwo:Ll/lej;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/lej;->e()V

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mWindowsFrameTwo:Ll/lej;

    .line 19
    .line 20
    :cond_1
    iget-object v0, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mWindowsFrameThree:Ll/lej;

    .line 21
    .line 22
    if-eqz v0, :cond_2

    .line 23
    .line 24
    invoke-virtual {v0}, Ll/lej;->e()V

    .line 25
    .line 26
    .line 27
    iput-object v1, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mWindowsFrameThree:Ll/lej;

    .line 28
    .line 29
    :cond_2
    iget-object v0, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mWindowsFrameFour:Ll/lej;

    .line 30
    .line 31
    if-eqz v0, :cond_3

    .line 32
    .line 33
    invoke-virtual {v0}, Ll/lej;->e()V

    .line 34
    .line 35
    .line 36
    iput-object v1, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mWindowsFrameFour:Ll/lej;

    .line 37
    .line 38
    :cond_3
    const/4 v0, 0x0

    .line 39
    iput v0, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mImageCount:I

    .line 40
    .line 41
    const/4 v1, 0x0

    .line 42
    iput v1, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mOrder:F

    .line 43
    .line 44
    iput v1, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mBackground:F

    .line 45
    .line 46
    iput v0, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mFourPalaceCount:I

    .line 47
    .line 48
    const/4 v0, 0x1

    .line 49
    iput-boolean v0, p0, Ll/bof0;->isFirstTime:Z

    .line 50
    .line 51
    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/gfj;->destroy()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mTexture0:I

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    const/4 v2, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    filled-new-array {v0}, [I

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 15
    .line 16
    .line 17
    iput v2, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mTexture0:I

    .line 18
    .line 19
    :cond_0
    iget v0, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mTexture1:I

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    filled-new-array {v0}, [I

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 28
    .line 29
    .line 30
    iput v2, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mTexture1:I

    .line 31
    .line 32
    :cond_1
    iget v0, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mTexture2:I

    .line 33
    .line 34
    if-eqz v0, :cond_2

    .line 35
    .line 36
    filled-new-array {v0}, [I

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 41
    .line 42
    .line 43
    iput v2, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mTexture2:I

    .line 44
    .line 45
    :cond_2
    iget v0, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mTexture3:I

    .line 46
    .line 47
    if-eqz v0, :cond_3

    .line 48
    .line 49
    filled-new-array {v0}, [I

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 54
    .line 55
    .line 56
    iput v2, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mTexture3:I

    .line 57
    .line 58
    :cond_3
    invoke-direct {p0}, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->releasePalaceFrameBuffer()V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public declared-synchronized drawFrame()V
    .locals 12

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-direct {p0}, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->generateFramebuffer()V

    .line 3
    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    move v1, v0

    .line 7
    :goto_0
    iget-object v2, p0, Ll/bof0;->mEffectTimeList:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-ge v1, v2, :cond_7

    .line 14
    .line 15
    iget-boolean v2, p0, Ll/bof0;->isFirstTime:Z

    .line 16
    .line 17
    const/4 v3, 0x0

    .line 18
    const/high16 v4, 0x3f800000    # 1.0f

    .line 19
    .line 20
    const/4 v5, 0x1

    .line 21
    const v6, 0x8d40

    .line 22
    .line 23
    .line 24
    if-nez v2, :cond_5

    .line 25
    .line 26
    iget v2, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mTexture0:I

    .line 27
    .line 28
    const/4 v7, -0x1

    .line 29
    if-eq v2, v7, :cond_5

    .line 30
    .line 31
    iget v2, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mTexture1:I

    .line 32
    .line 33
    if-eq v2, v7, :cond_5

    .line 34
    .line 35
    iget v2, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mTexture2:I

    .line 36
    .line 37
    if-eq v2, v7, :cond_5

    .line 38
    .line 39
    iget v2, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mTexture3:I

    .line 40
    .line 41
    if-ne v2, v7, :cond_0

    .line 42
    .line 43
    goto/16 :goto_2

    .line 44
    .line 45
    :cond_0
    iput v3, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mBackground:F

    .line 46
    .line 47
    invoke-super {p0}, Ll/gfj;->drawFrame()V

    .line 48
    .line 49
    .line 50
    iget v2, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mImageCount:I

    .line 51
    .line 52
    int-to-long v8, v2

    .line 53
    iget-wide v10, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mTimeInterval:J

    .line 54
    .line 55
    rem-long/2addr v8, v10

    .line 56
    const-wide/16 v10, 0x0

    .line 57
    .line 58
    cmp-long v3, v8, v10

    .line 59
    .line 60
    if-nez v3, :cond_6

    .line 61
    .line 62
    if-eqz v2, :cond_6

    .line 63
    .line 64
    iput v4, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mBackground:F

    .line 65
    .line 66
    iget v2, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mFourPalaceCount:I

    .line 67
    .line 68
    rem-int/lit8 v2, v2, 0x4

    .line 69
    .line 70
    int-to-float v2, v2

    .line 71
    iput v2, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mOrder:F

    .line 72
    .line 73
    sub-float/2addr v2, v4

    .line 74
    float-to-int v2, v2

    .line 75
    if-eq v2, v7, :cond_4

    .line 76
    .line 77
    if-eqz v2, :cond_3

    .line 78
    .line 79
    if-eq v2, v5, :cond_2

    .line 80
    .line 81
    const/4 v3, 0x2

    .line 82
    if-eq v2, v3, :cond_1

    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_1
    iget-object v2, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mWindowsFrameThree:Ll/lej;

    .line 86
    .line 87
    invoke-virtual {v2}, Ll/lej;->h()[I

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    aget v2, v2, v0

    .line 92
    .line 93
    invoke-static {v6, v2}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p0}, Ll/gfj;->drawSub()V

    .line 97
    .line 98
    .line 99
    iget-object v2, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mWindowsFrameThree:Ll/lej;

    .line 100
    .line 101
    invoke-virtual {v2}, Ll/lej;->i()[I

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    aget v2, v2, v0

    .line 106
    .line 107
    iput v2, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mTexture2:I

    .line 108
    .line 109
    goto :goto_1

    .line 110
    :catchall_0
    move-exception v0

    .line 111
    goto/16 :goto_4

    .line 112
    .line 113
    :cond_2
    iget-object v2, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mWindowsFrameTwo:Ll/lej;

    .line 114
    .line 115
    invoke-virtual {v2}, Ll/lej;->h()[I

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    aget v2, v2, v0

    .line 120
    .line 121
    invoke-static {v6, v2}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {p0}, Ll/gfj;->drawSub()V

    .line 125
    .line 126
    .line 127
    iget-object v2, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mWindowsFrameTwo:Ll/lej;

    .line 128
    .line 129
    invoke-virtual {v2}, Ll/lej;->i()[I

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    aget v2, v2, v0

    .line 134
    .line 135
    iput v2, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mTexture1:I

    .line 136
    .line 137
    goto :goto_1

    .line 138
    :cond_3
    iget-object v2, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mWindowsFrameOne:Ll/lej;

    .line 139
    .line 140
    invoke-virtual {v2}, Ll/lej;->h()[I

    .line 141
    .line 142
    .line 143
    move-result-object v2

    .line 144
    aget v2, v2, v0

    .line 145
    .line 146
    invoke-static {v6, v2}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {p0}, Ll/gfj;->drawSub()V

    .line 150
    .line 151
    .line 152
    iget-object v2, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mWindowsFrameOne:Ll/lej;

    .line 153
    .line 154
    invoke-virtual {v2}, Ll/lej;->i()[I

    .line 155
    .line 156
    .line 157
    move-result-object v2

    .line 158
    aget v2, v2, v0

    .line 159
    .line 160
    iput v2, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mTexture0:I

    .line 161
    .line 162
    goto :goto_1

    .line 163
    :cond_4
    iget-object v2, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mWindowsFrameFour:Ll/lej;

    .line 164
    .line 165
    invoke-virtual {v2}, Ll/lej;->h()[I

    .line 166
    .line 167
    .line 168
    move-result-object v2

    .line 169
    aget v2, v2, v0

    .line 170
    .line 171
    invoke-static {v6, v2}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 172
    .line 173
    .line 174
    invoke-virtual {p0}, Ll/gfj;->drawSub()V

    .line 175
    .line 176
    .line 177
    iget-object v2, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mWindowsFrameFour:Ll/lej;

    .line 178
    .line 179
    invoke-virtual {v2}, Ll/lej;->i()[I

    .line 180
    .line 181
    .line 182
    move-result-object v2

    .line 183
    aget v2, v2, v0

    .line 184
    .line 185
    iput v2, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mTexture3:I

    .line 186
    .line 187
    :goto_1
    iget v2, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mFourPalaceCount:I

    .line 188
    .line 189
    add-int/2addr v2, v5

    .line 190
    iput v2, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mFourPalaceCount:I

    .line 191
    .line 192
    goto :goto_3

    .line 193
    :cond_5
    :goto_2
    iput v4, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mFirst:F

    .line 194
    .line 195
    invoke-super {p0}, Ll/gfj;->drawFrame()V

    .line 196
    .line 197
    .line 198
    iput v3, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mFirst:F

    .line 199
    .line 200
    iput v0, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mFourPalaceCount:I

    .line 201
    .line 202
    iput v0, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mImageCount:I

    .line 203
    .line 204
    iput v3, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mOrder:F

    .line 205
    .line 206
    iput v4, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mBackground:F

    .line 207
    .line 208
    iget-object v2, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mWindowsFrameOne:Ll/lej;

    .line 209
    .line 210
    invoke-virtual {v2}, Ll/lej;->h()[I

    .line 211
    .line 212
    .line 213
    move-result-object v2

    .line 214
    aget v2, v2, v0

    .line 215
    .line 216
    invoke-static {v6, v2}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 217
    .line 218
    .line 219
    invoke-virtual {p0}, Ll/gfj;->drawSub()V

    .line 220
    .line 221
    .line 222
    iget-object v2, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mWindowsFrameTwo:Ll/lej;

    .line 223
    .line 224
    invoke-virtual {v2}, Ll/lej;->h()[I

    .line 225
    .line 226
    .line 227
    move-result-object v2

    .line 228
    aget v2, v2, v0

    .line 229
    .line 230
    invoke-static {v6, v2}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 231
    .line 232
    .line 233
    invoke-virtual {p0}, Ll/gfj;->drawSub()V

    .line 234
    .line 235
    .line 236
    iget-object v2, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mWindowsFrameThree:Ll/lej;

    .line 237
    .line 238
    invoke-virtual {v2}, Ll/lej;->h()[I

    .line 239
    .line 240
    .line 241
    move-result-object v2

    .line 242
    aget v2, v2, v0

    .line 243
    .line 244
    invoke-static {v6, v2}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 245
    .line 246
    .line 247
    invoke-virtual {p0}, Ll/gfj;->drawSub()V

    .line 248
    .line 249
    .line 250
    iget-object v2, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mWindowsFrameFour:Ll/lej;

    .line 251
    .line 252
    invoke-virtual {v2}, Ll/lej;->h()[I

    .line 253
    .line 254
    .line 255
    move-result-object v2

    .line 256
    aget v2, v2, v0

    .line 257
    .line 258
    invoke-static {v6, v2}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 259
    .line 260
    .line 261
    invoke-virtual {p0}, Ll/gfj;->drawSub()V

    .line 262
    .line 263
    .line 264
    iget-object v2, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mWindowsFrameOne:Ll/lej;

    .line 265
    .line 266
    invoke-virtual {v2}, Ll/lej;->i()[I

    .line 267
    .line 268
    .line 269
    move-result-object v2

    .line 270
    aget v2, v2, v0

    .line 271
    .line 272
    iput v2, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mTexture0:I

    .line 273
    .line 274
    iget-object v2, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mWindowsFrameTwo:Ll/lej;

    .line 275
    .line 276
    invoke-virtual {v2}, Ll/lej;->i()[I

    .line 277
    .line 278
    .line 279
    move-result-object v2

    .line 280
    aget v2, v2, v0

    .line 281
    .line 282
    iput v2, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mTexture1:I

    .line 283
    .line 284
    iget-object v2, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mWindowsFrameThree:Ll/lej;

    .line 285
    .line 286
    invoke-virtual {v2}, Ll/lej;->i()[I

    .line 287
    .line 288
    .line 289
    move-result-object v2

    .line 290
    aget v2, v2, v0

    .line 291
    .line 292
    iput v2, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mTexture2:I

    .line 293
    .line 294
    iget-object v2, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mWindowsFrameFour:Ll/lej;

    .line 295
    .line 296
    invoke-virtual {v2}, Ll/lej;->i()[I

    .line 297
    .line 298
    .line 299
    move-result-object v2

    .line 300
    aget v2, v2, v0

    .line 301
    .line 302
    iput v2, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mTexture3:I

    .line 303
    .line 304
    iget v2, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mFourPalaceCount:I

    .line 305
    .line 306
    add-int/2addr v2, v5

    .line 307
    iput v2, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mFourPalaceCount:I

    .line 308
    .line 309
    :cond_6
    :goto_3
    iget v2, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mImageCount:I

    .line 310
    .line 311
    add-int/2addr v2, v5

    .line 312
    iput v2, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mImageCount:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 313
    .line 314
    add-int/lit8 v1, v1, 0x1

    .line 315
    .line 316
    goto/16 :goto_0

    .line 317
    .line 318
    :cond_7
    monitor-exit p0

    .line 319
    return-void

    .line 320
    :goto_4
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 321
    throw v0
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision highp float;\nuniform sampler2D inputImageTexture0;\nuniform sampler2D inputImageTexture1;\nuniform sampler2D inputImageTexture2;\nuniform sampler2D inputImageTexture3;\nuniform sampler2D inputImageTexture4;\nuniform float order;\nuniform float background;\nuniform float firstTime;\nvarying vec2 textureCoordinate;\n float pick(float v)\n{    if(v > 0.5){\n      return (v - 0.5) * 2.0;\n    } return v * 2.0;\n}void main(){\n    vec2 uv = textureCoordinate;\n    vec4 color = vec4(0.0);\n    if (firstTime == 1.0) {\n    if(uv.x <= 0.5 && uv.y > 0.5)\n    {\n        color = texture2D(inputImageTexture0, vec2(pick(uv.x), pick(uv.y)));\n        float gray = color.r * 0.6 + color.g * 0.3 + color.b * 0.1;\n        color = vec4(gray, gray, gray, 1.0);\n    }\n    else if(uv.x > 0.5 && uv.y > 0.5)\n    {\n        color = texture2D(inputImageTexture0, vec2(pick(uv.x), pick(uv.y)));\n        float gray = color.r * 0.6 + color.g * 0.3 + color.b * 0.1;\n        color = vec4(gray, gray, gray, 1.0);\n    }\n    else if(uv.x > 0.5 && uv.y <= 0.5)\n    {\n        color = texture2D(inputImageTexture0, vec2(pick(uv.x), pick(uv.y)));\n        float gray = color.r * 0.6 + color.g * 0.3 + color.b * 0.1;\n        color = vec4(gray, gray, gray, 1.0);\n    }\n    else if(uv.x <= 0.5 && uv.y <= 0.5)\n    {\n        color = texture2D(inputImageTexture0, vec2(pick(uv.x), pick(uv.y)));\n        float gray = color.r * 0.6 + color.g * 0.3 + color.b * 0.1;\n        color = vec4(gray, gray, gray, 1.0);\n    }\n    } else {\n    if (background == 1.0) {        color = texture2D(inputImageTexture0, uv);\n    } else if(uv.x <= 0.5 && uv.y > 0.5)\n    {\n      if (order == 0.0) {        color = texture2D(inputImageTexture0, vec2(pick(uv.x), pick(uv.y)));\n      } else {\n        color = texture2D(inputImageTexture1, vec2(pick(uv.x), pick(uv.y)));\n        float gray = color.r * 0.6 + color.g * 0.3 + color.b * 0.1;\n        color = vec4(gray, gray, gray, 1.0);\n      }\n    }\n    else if(uv.x > 0.5 && uv.y > 0.5)\n    {\n      if (order == 1.0) {        color = texture2D(inputImageTexture0, vec2(pick(uv.x), pick(uv.y)));\n      } else {\n        color = texture2D(inputImageTexture2, vec2(pick(uv.x), pick(uv.y)));\n        float gray = color.r * 0.6 + color.g * 0.3 + color.b * 0.1;\n        color = vec4(gray, gray, gray, 1.0);\n      }\n    }\n    else if(uv.x > 0.5 && uv.y <= 0.5)\n    {\n      if (order == 2.0) {        color = texture2D(inputImageTexture0, vec2(pick(uv.x), pick(uv.y)));\n      } else {\n        color = texture2D(inputImageTexture3, vec2(pick(uv.x), pick(uv.y)));\n        float gray = color.r * 0.6 + color.g * 0.3 + color.b * 0.1;\n        color = vec4(gray, gray, gray, 1.0);\n      }\n    }\n    else if(uv.x <= 0.5 && uv.y <= 0.5)\n    {\n      if (order == 3.0) {        color = texture2D(inputImageTexture0, vec2(pick(uv.x), pick(uv.y)));\n      } else {\n        color = texture2D(inputImageTexture4, vec2(pick(uv.x), pick(uv.y)));\n        float gray = color.r * 0.6 + color.g * 0.3 + color.b * 0.1;\n        color = vec4(gray, gray, gray, 1.0);\n      }\n    }\n    } gl_FragColor = color;\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public declared-synchronized handleSizeChange()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-super {p0}, Ll/gfj;->handleSizeChange()V

    .line 3
    .line 4
    .line 5
    invoke-direct {p0}, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->releasePalaceFrameBuffer()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 6
    .line 7
    .line 8
    monitor-exit p0

    .line 9
    return-void

    .line 10
    :catchall_0
    move-exception v0

    .line 11
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 12
    throw v0
.end method

.method public initFrameBuffer(Ll/lej;)Ll/lej;
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/lej;->e()V

    .line 4
    .line 5
    .line 6
    :cond_0
    new-instance p1, Ll/lej;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    invoke-direct {p1, v0, v1}, Ll/lej;-><init>(II)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-virtual {p1, v0, v1}, Ll/lej;->b(II)V

    .line 28
    .line 29
    .line 30
    const v0, 0x8d40

    .line 31
    .line 32
    .line 33
    invoke-static {v0}, Landroid/opengl/GLES20;->glCheckFramebufferStatus(I)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    const v1, 0x8cd5

    .line 38
    .line 39
    .line 40
    if-ne v0, v1, :cond_1

    .line 41
    .line 42
    return-object p1

    .line 43
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    invoke-static {p1, v0, p0}, Ll/muf;->a(Ljava/lang/StringBuilder;II)V

    .line 56
    .line 57
    .line 58
    const/4 p0, 0x0

    .line 59
    return-object p0
.end method

.method public initShaderHandles()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/wej;->initShaderHandles()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/wej;->programHandle:I

    .line 5
    .line 6
    const-string v1, "inputImageTexture1"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mTexture0Handle:I

    .line 13
    .line 14
    iget v0, p0, Ll/wej;->programHandle:I

    .line 15
    .line 16
    const-string v1, "inputImageTexture2"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mTexture1Handle:I

    .line 23
    .line 24
    iget v0, p0, Ll/wej;->programHandle:I

    .line 25
    .line 26
    const-string v1, "inputImageTexture3"

    .line 27
    .line 28
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iput v0, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mTexture2Handle:I

    .line 33
    .line 34
    iget v0, p0, Ll/wej;->programHandle:I

    .line 35
    .line 36
    const-string v1, "inputImageTexture4"

    .line 37
    .line 38
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iput v0, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mTexture3Handle:I

    .line 43
    .line 44
    iget v0, p0, Ll/wej;->programHandle:I

    .line 45
    .line 46
    const-string v1, "order"

    .line 47
    .line 48
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    iput v0, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->orderHandle:I

    .line 53
    .line 54
    iget v0, p0, Ll/wej;->programHandle:I

    .line 55
    .line 56
    const-string v1, "background"

    .line 57
    .line 58
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    iput v0, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->backgroundHandle:I

    .line 63
    .line 64
    iget v0, p0, Ll/wej;->programHandle:I

    .line 65
    .line 66
    const-string v1, "firstTime"

    .line 67
    .line 68
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    iput v0, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->firstHandle:I

    .line 73
    .line 74
    return-void
.end method

.method public passShaderValues()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/wej;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    const v0, 0x84c1

    .line 5
    .line 6
    .line 7
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 8
    .line 9
    .line 10
    iget v0, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mTexture0:I

    .line 11
    .line 12
    const/16 v1, 0xde1

    .line 13
    .line 14
    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 15
    .line 16
    .line 17
    iget v0, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mTexture0Handle:I

    .line 18
    .line 19
    const/4 v2, 0x1

    .line 20
    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 21
    .line 22
    .line 23
    const v0, 0x84c2

    .line 24
    .line 25
    .line 26
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 27
    .line 28
    .line 29
    iget v0, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mTexture1:I

    .line 30
    .line 31
    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 32
    .line 33
    .line 34
    iget v0, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mTexture1Handle:I

    .line 35
    .line 36
    const/4 v2, 0x2

    .line 37
    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 38
    .line 39
    .line 40
    const v0, 0x84c3

    .line 41
    .line 42
    .line 43
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 44
    .line 45
    .line 46
    iget v0, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mTexture2:I

    .line 47
    .line 48
    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 49
    .line 50
    .line 51
    iget v0, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mTexture2Handle:I

    .line 52
    .line 53
    const/4 v2, 0x3

    .line 54
    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 55
    .line 56
    .line 57
    const v0, 0x84c4

    .line 58
    .line 59
    .line 60
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 61
    .line 62
    .line 63
    iget v0, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mTexture3:I

    .line 64
    .line 65
    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 66
    .line 67
    .line 68
    iget v0, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mTexture3Handle:I

    .line 69
    .line 70
    const/4 v1, 0x4

    .line 71
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 72
    .line 73
    .line 74
    iget v0, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->orderHandle:I

    .line 75
    .line 76
    iget v1, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mOrder:F

    .line 77
    .line 78
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 79
    .line 80
    .line 81
    iget v0, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->backgroundHandle:I

    .line 82
    .line 83
    iget v1, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mBackground:F

    .line 84
    .line 85
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 86
    .line 87
    .line 88
    iget v0, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->firstHandle:I

    .line 89
    .line 90
    iget p0, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mFirst:F

    .line 91
    .line 92
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public releaseFrameBuffer()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/gfj;->releaseFrameBuffer()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->releasePalaceFrameBuffer()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setTimeInterval(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/momo/mcamera/mask/MirrImageFrameFilter;->mTimeInterval:J

    .line 2
    .line 3
    return-void
.end method

.method public setTimeStamp(J)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ll/bof0;->setTimeStamp(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
