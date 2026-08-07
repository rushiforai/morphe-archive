.class public Ll/t94;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:I = 0x7530

.field private static b:[I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/16 v0, 0x11

    .line 2
    .line 3
    const v1, 0x32315659

    .line 4
    .line 5
    .line 6
    filled-new-array {v0, v1}, [I

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sput-object v0, Ll/t94;->b:[I

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Landroid/hardware/Camera;Ll/sow;)Z
    .locals 5

    .line 1
    invoke-virtual {p0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "auto"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/hardware/Camera$Parameters;->setWhiteBalance(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getSupportedFocusModes()Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    if-eqz v2, :cond_4

    .line 15
    .line 16
    sget-object v3, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 17
    .line 18
    const-string v4, "GT-I950"

    .line 19
    .line 20
    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    move-result v4

    .line 24
    if-nez v4, :cond_0

    .line 25
    .line 26
    const-string v4, "SCH-I959"

    .line 27
    .line 28
    invoke-virtual {v3, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 29
    .line 30
    .line 31
    move-result v4

    .line 32
    if-nez v4, :cond_0

    .line 33
    .line 34
    const-string v4, "MEIZU MX3"

    .line 35
    .line 36
    invoke-virtual {v3, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    if-eqz v3, :cond_1

    .line 41
    .line 42
    :cond_0
    const-string v3, "continuous-picture"

    .line 43
    .line 44
    invoke-interface {v2, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    if-eqz v4, :cond_1

    .line 49
    .line 50
    invoke-virtual {v0, v3}, Landroid/hardware/Camera$Parameters;->setFocusMode(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    const-string v3, "continuous-video"

    .line 55
    .line 56
    invoke-interface {v2, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result v4

    .line 60
    if-eqz v4, :cond_2

    .line 61
    .line 62
    invoke-virtual {v0, v3}, Landroid/hardware/Camera$Parameters;->setFocusMode(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_2
    invoke-interface {v2, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    if-eqz v3, :cond_3

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Landroid/hardware/Camera$Parameters;->setFocusMode(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_3
    const-string v1, "fixed"

    .line 77
    .line 78
    invoke-interface {v2, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result v2

    .line 82
    if-eqz v2, :cond_4

    .line 83
    .line 84
    invoke-virtual {v0, v1}, Landroid/hardware/Camera$Parameters;->setFocusMode(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    :cond_4
    :goto_0
    iget v1, p1, Ll/sow;->b:I

    .line 88
    .line 89
    iget v2, p1, Ll/sow;->c:I

    .line 90
    .line 91
    invoke-virtual {v0, v1, v2}, Landroid/hardware/Camera$Parameters;->setPreviewSize(II)V

    .line 92
    .line 93
    .line 94
    iget v1, p1, Ll/sow;->H:I

    .line 95
    .line 96
    iget v2, p1, Ll/sow;->G:I

    .line 97
    .line 98
    invoke-virtual {v0, v1, v2}, Landroid/hardware/Camera$Parameters;->setPreviewFpsRange(II)V

    .line 99
    .line 100
    .line 101
    iget v1, p1, Ll/sow;->s:I

    .line 102
    .line 103
    invoke-virtual {v0, v1}, Landroid/hardware/Camera$Parameters;->setPreviewFrameRate(I)V

    .line 104
    .line 105
    .line 106
    iget-boolean p1, p1, Ll/sow;->a0:Z

    .line 107
    .line 108
    const/4 v1, 0x1

    .line 109
    if-eqz p1, :cond_5

    .line 110
    .line 111
    invoke-virtual {v0, v1}, Landroid/hardware/Camera$Parameters;->setRecordingHint(Z)V

    .line 112
    .line 113
    .line 114
    const-string p1, "lqdebug"

    .line 115
    .line 116
    const-string v2, "lqdebug setRecordingHint true"

    .line 117
    .line 118
    invoke-static {p1, v2}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    :cond_5
    :try_start_0
    invoke-virtual {p0, v0}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 122
    .line 123
    .line 124
    return v1

    .line 125
    :catch_0
    move-exception p1

    .line 126
    const-string v0, "CameraHelper"

    .line 127
    .line 128
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    invoke-static {v0, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {p0}, Landroid/hardware/Camera;->release()V

    .line 136
    .line 137
    .line 138
    const/4 p0, 0x0

    .line 139
    return p0
.end method

.method public static b(II)I
    .locals 2

    .line 1
    new-instance v0, Landroid/hardware/Camera$CameraInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Landroid/hardware/Camera;->getCameraInfo(ILandroid/hardware/Camera$CameraInfo;)V

    .line 7
    .line 8
    .line 9
    iget p1, v0, Landroid/hardware/Camera$CameraInfo;->facing:I

    .line 10
    .line 11
    iget v0, v0, Landroid/hardware/Camera$CameraInfo;->orientation:I

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    if-ne p1, v1, :cond_0

    .line 15
    .line 16
    add-int/2addr v0, p0

    .line 17
    rem-int/lit16 v0, v0, 0x168

    .line 18
    .line 19
    rsub-int p0, v0, 0x168

    .line 20
    .line 21
    rem-int/lit16 p0, p0, 0x168

    .line 22
    .line 23
    return p0

    .line 24
    :cond_0
    sub-int/2addr v0, p0

    .line 25
    add-int/lit16 v0, v0, 0x168

    .line 26
    .line 27
    rem-int/lit16 v0, v0, 0x168

    .line 28
    .line 29
    return v0
.end method

.method public static c(Landroid/hardware/Camera$Parameters;Ll/sow;)Z
    .locals 7

    .line 1
    new-instance v0, Ljava/util/LinkedList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewFormats()Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    sget-object v1, Ll/t94;->b:[I

    .line 11
    .line 12
    array-length v2, v1

    .line 13
    const/4 v3, 0x0

    .line 14
    move v4, v3

    .line 15
    :goto_0
    if-ge v4, v2, :cond_1

    .line 16
    .line 17
    aget v5, v1, v4

    .line 18
    .line 19
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object v6

    .line 23
    invoke-interface {p0, v6}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v6

    .line 27
    if-eqz v6, :cond_0

    .line 28
    .line 29
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 30
    .line 31
    .line 32
    move-result-object v5

    .line 33
    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    :cond_0
    add-int/lit8 v4, v4, 0x1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    const/16 p0, 0x11

    .line 40
    .line 41
    iput p0, p1, Ll/sow;->x:I

    .line 42
    .line 43
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_2

    .line 52
    .line 53
    iput p0, p1, Ll/sow;->x:I

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_2
    const p0, 0x32315659

    .line 57
    .line 58
    .line 59
    iput p0, p1, Ll/sow;->x:I

    .line 60
    .line 61
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-eqz v0, :cond_3

    .line 70
    .line 71
    iput p0, p1, Ll/sow;->x:I

    .line 72
    .line 73
    :goto_1
    const/4 p0, 0x1

    .line 74
    return p0

    .line 75
    :cond_3
    const-string p0, "CameraHelper"

    .line 76
    .line 77
    const-string p1, "!!!!!!!!!!!UnSupport,previewColorFormat"

    .line 78
    .line 79
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    return v3
.end method

.method public static d(Landroid/hardware/Camera$Parameters;Ll/sow;)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewFpsRange()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget v0, p1, Ll/sow;->s:I

    .line 6
    .line 7
    mul-int/lit16 v0, v0, 0x3e8

    .line 8
    .line 9
    sput v0, Ll/t94;->a:I

    .line 10
    .line 11
    new-instance v0, Ll/t94$a;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/t94$a;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-static {p0, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 17
    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    move v1, v0

    .line 21
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    const/4 v3, 0x1

    .line 26
    if-ge v1, v2, :cond_2

    .line 27
    .line 28
    iget-boolean v2, p1, Ll/sow;->Y:Z

    .line 29
    .line 30
    if-eqz v2, :cond_0

    .line 31
    .line 32
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    check-cast v2, [I

    .line 37
    .line 38
    aget v2, v2, v0

    .line 39
    .line 40
    sget v4, Ll/t94;->a:I

    .line 41
    .line 42
    sub-int/2addr v2, v4

    .line 43
    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    check-cast v4, [I

    .line 52
    .line 53
    aget v4, v4, v3

    .line 54
    .line 55
    sget v5, Ll/t94;->a:I

    .line 56
    .line 57
    sub-int/2addr v4, v5

    .line 58
    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    .line 59
    .line 60
    .line 61
    move-result v4

    .line 62
    add-int/2addr v2, v4

    .line 63
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    check-cast v4, [I

    .line 68
    .line 69
    aget v4, v4, v0

    .line 70
    .line 71
    sget v5, Ll/t94;->a:I

    .line 72
    .line 73
    if-lt v4, v5, :cond_1

    .line 74
    .line 75
    iget v4, p1, Ll/sow;->Z:I

    .line 76
    .line 77
    mul-int/lit16 v4, v4, 0x3e8

    .line 78
    .line 79
    if-gt v2, v4, :cond_1

    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_0
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    check-cast v2, [I

    .line 87
    .line 88
    aget v2, v2, v0

    .line 89
    .line 90
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object v4

    .line 94
    check-cast v4, [I

    .line 95
    .line 96
    aget v4, v4, v3

    .line 97
    .line 98
    if-ne v2, v4, :cond_2

    .line 99
    .line 100
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_2
    :goto_1
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 104
    .line 105
    .line 106
    move-result v2

    .line 107
    if-lt v1, v2, :cond_3

    .line 108
    .line 109
    move v1, v0

    .line 110
    :cond_3
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    check-cast v2, [I

    .line 115
    .line 116
    aget v0, v2, v0

    .line 117
    .line 118
    iput v0, p1, Ll/sow;->H:I

    .line 119
    .line 120
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    check-cast v0, [I

    .line 125
    .line 126
    aget v0, v0, v3

    .line 127
    .line 128
    iput v0, p1, Ll/sow;->G:I

    .line 129
    .line 130
    iput-object p0, p1, Ll/sow;->X:Ljava/util/List;

    .line 131
    .line 132
    return-void
.end method

.method public static e(Landroid/hardware/Camera$Parameters;Ll/sow;Ll/crf0;)V
    .locals 13

    .line 1
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewSizes()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ll/t94$b;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/t94$b;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {p0, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p1, Ll/sow;->b0:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 16
    .line 17
    .line 18
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    check-cast v1, Landroid/hardware/Camera$Size;

    .line 33
    .line 34
    iget-object v2, p1, Ll/sow;->b0:Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    new-instance v2, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    const-string v3, "width = "

    .line 42
    .line 43
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iget v3, v1, Landroid/hardware/Camera$Size;->width:I

    .line 47
    .line 48
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const-string v3, " height = "

    .line 52
    .line 53
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    iget v1, v1, Landroid/hardware/Camera$Size;->height:I

    .line 57
    .line 58
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    const-string v2, "Camera"

    .line 66
    .line 67
    invoke-static {v2, v1}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_0
    invoke-virtual {p2}, Ll/crf0;->b()I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    invoke-virtual {p2}, Ll/crf0;->a()I

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    mul-int/2addr v0, v1

    .line 80
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    const/4 v2, 0x0

    .line 85
    move v3, v2

    .line 86
    move v4, v3

    .line 87
    :cond_1
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 88
    .line 89
    .line 90
    move-result v5

    .line 91
    if-eqz v5, :cond_9

    .line 92
    .line 93
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v5

    .line 97
    check-cast v5, Landroid/hardware/Camera$Size;

    .line 98
    .line 99
    iget v6, v5, Landroid/hardware/Camera$Size;->width:I

    .line 100
    .line 101
    if-eqz v6, :cond_1

    .line 102
    .line 103
    iget v7, v5, Landroid/hardware/Camera$Size;->height:I

    .line 104
    .line 105
    if-nez v7, :cond_2

    .line 106
    .line 107
    goto :goto_1

    .line 108
    :cond_2
    mul-int/2addr v6, v7

    .line 109
    invoke-virtual {p2}, Ll/crf0;->b()I

    .line 110
    .line 111
    .line 112
    move-result v7

    .line 113
    invoke-virtual {p2}, Ll/crf0;->a()I

    .line 114
    .line 115
    .line 116
    move-result v8

    .line 117
    mul-int/2addr v7, v8

    .line 118
    sub-int/2addr v6, v7

    .line 119
    iget v7, v5, Landroid/hardware/Camera$Size;->width:I

    .line 120
    .line 121
    int-to-float v7, v7

    .line 122
    iget v8, v5, Landroid/hardware/Camera$Size;->height:I

    .line 123
    .line 124
    int-to-float v8, v8

    .line 125
    div-float/2addr v7, v8

    .line 126
    invoke-virtual {p2}, Ll/crf0;->b()I

    .line 127
    .line 128
    .line 129
    move-result v8

    .line 130
    int-to-float v8, v8

    .line 131
    invoke-virtual {p2}, Ll/crf0;->a()I

    .line 132
    .line 133
    .line 134
    move-result v9

    .line 135
    int-to-float v9, v9

    .line 136
    div-float/2addr v8, v9

    .line 137
    sub-float/2addr v7, v8

    .line 138
    invoke-static {v7}, Ljava/lang/Math;->abs(F)F

    .line 139
    .line 140
    .line 141
    move-result v7

    .line 142
    float-to-double v9, v7

    .line 143
    float-to-double v7, v8

    .line 144
    const-wide v11, 0x3fd3333333333333L    # 0.3

    .line 145
    .line 146
    .line 147
    .line 148
    .line 149
    mul-double/2addr v7, v11

    .line 150
    cmpl-double v7, v9, v7

    .line 151
    .line 152
    if-lez v7, :cond_3

    .line 153
    .line 154
    goto :goto_1

    .line 155
    :cond_3
    iget v7, p1, Ll/sow;->K:I

    .line 156
    .line 157
    if-nez v7, :cond_4

    .line 158
    .line 159
    iget v7, v5, Landroid/hardware/Camera$Size;->width:I

    .line 160
    .line 161
    int-to-float v7, v7

    .line 162
    iget v8, p1, Ll/sow;->L:F

    .line 163
    .line 164
    div-float/2addr v7, v8

    .line 165
    iget v8, v5, Landroid/hardware/Camera$Size;->height:I

    .line 166
    .line 167
    int-to-float v8, v8

    .line 168
    cmpl-float v7, v7, v8

    .line 169
    .line 170
    if-lez v7, :cond_5

    .line 171
    .line 172
    goto :goto_1

    .line 173
    :cond_4
    const/4 v8, 0x1

    .line 174
    if-ne v7, v8, :cond_5

    .line 175
    .line 176
    iget v7, v5, Landroid/hardware/Camera$Size;->height:I

    .line 177
    .line 178
    int-to-float v7, v7

    .line 179
    iget v8, p1, Ll/sow;->L:F

    .line 180
    .line 181
    mul-float/2addr v7, v8

    .line 182
    iget v8, v5, Landroid/hardware/Camera$Size;->width:I

    .line 183
    .line 184
    int-to-float v8, v8

    .line 185
    cmpl-float v7, v7, v8

    .line 186
    .line 187
    if-lez v7, :cond_5

    .line 188
    .line 189
    goto :goto_1

    .line 190
    :cond_5
    invoke-static {v6}, Ljava/lang/Math;->abs(I)I

    .line 191
    .line 192
    .line 193
    move-result v7

    .line 194
    if-ge v7, v0, :cond_7

    .line 195
    .line 196
    iget v7, v5, Landroid/hardware/Camera$Size;->width:I

    .line 197
    .line 198
    invoke-virtual {p2}, Ll/crf0;->b()I

    .line 199
    .line 200
    .line 201
    move-result v8

    .line 202
    if-le v7, v8, :cond_6

    .line 203
    .line 204
    iget v7, v5, Landroid/hardware/Camera$Size;->height:I

    .line 205
    .line 206
    invoke-virtual {p2}, Ll/crf0;->a()I

    .line 207
    .line 208
    .line 209
    move-result v8

    .line 210
    if-gt v7, v8, :cond_1

    .line 211
    .line 212
    :cond_6
    invoke-static {v6}, Ljava/lang/Math;->abs(I)I

    .line 213
    .line 214
    .line 215
    move-result v0

    .line 216
    iget v3, v5, Landroid/hardware/Camera$Size;->width:I

    .line 217
    .line 218
    iget v4, v5, Landroid/hardware/Camera$Size;->height:I

    .line 219
    .line 220
    invoke-virtual {p2}, Ll/crf0;->a()I

    .line 221
    .line 222
    .line 223
    move-result v5

    .line 224
    if-ne v4, v5, :cond_1

    .line 225
    .line 226
    invoke-virtual {p2}, Ll/crf0;->b()I

    .line 227
    .line 228
    .line 229
    move-result v5

    .line 230
    if-ne v3, v5, :cond_1

    .line 231
    .line 232
    goto :goto_2

    .line 233
    :cond_7
    invoke-static {v6}, Ljava/lang/Math;->abs(I)I

    .line 234
    .line 235
    .line 236
    move-result v6

    .line 237
    if-ne v6, v0, :cond_1

    .line 238
    .line 239
    iget v6, v5, Landroid/hardware/Camera$Size;->height:I

    .line 240
    .line 241
    invoke-virtual {p2}, Ll/crf0;->a()I

    .line 242
    .line 243
    .line 244
    move-result v7

    .line 245
    if-ne v6, v7, :cond_8

    .line 246
    .line 247
    iget v6, v5, Landroid/hardware/Camera$Size;->width:I

    .line 248
    .line 249
    invoke-virtual {p2}, Ll/crf0;->b()I

    .line 250
    .line 251
    .line 252
    move-result v7

    .line 253
    if-ne v6, v7, :cond_8

    .line 254
    .line 255
    iget v3, v5, Landroid/hardware/Camera$Size;->width:I

    .line 256
    .line 257
    iget v4, v5, Landroid/hardware/Camera$Size;->height:I

    .line 258
    .line 259
    goto :goto_2

    .line 260
    :cond_8
    iget v6, v5, Landroid/hardware/Camera$Size;->width:I

    .line 261
    .line 262
    if-ge v3, v6, :cond_1

    .line 263
    .line 264
    iget v3, v5, Landroid/hardware/Camera$Size;->height:I

    .line 265
    .line 266
    move v4, v3

    .line 267
    move v3, v6

    .line 268
    goto/16 :goto_1

    .line 269
    .line 270
    :cond_9
    :goto_2
    if-eqz v3, :cond_a

    .line 271
    .line 272
    if-nez v4, :cond_b

    .line 273
    .line 274
    :cond_a
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 275
    .line 276
    .line 277
    move-result-object v0

    .line 278
    check-cast v0, Landroid/hardware/Camera$Size;

    .line 279
    .line 280
    iget v3, v0, Landroid/hardware/Camera$Size;->width:I

    .line 281
    .line 282
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 283
    .line 284
    .line 285
    move-result-object p0

    .line 286
    check-cast p0, Landroid/hardware/Camera$Size;

    .line 287
    .line 288
    iget v4, p0, Landroid/hardware/Camera$Size;->height:I

    .line 289
    .line 290
    :cond_b
    if-eqz v3, :cond_c

    .line 291
    .line 292
    if-eqz v4, :cond_c

    .line 293
    .line 294
    iput v3, p1, Ll/sow;->b:I

    .line 295
    .line 296
    iput v4, p1, Ll/sow;->c:I

    .line 297
    .line 298
    :cond_c
    new-instance p0, Ljava/lang/StringBuilder;

    .line 299
    .line 300
    const-string p1, "targetWidth = "

    .line 301
    .line 302
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 303
    .line 304
    .line 305
    invoke-virtual {p2}, Ll/crf0;->b()I

    .line 306
    .line 307
    .line 308
    move-result p1

    .line 309
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 310
    .line 311
    .line 312
    const-string p1, " targetHeight = "

    .line 313
    .line 314
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 315
    .line 316
    .line 317
    invoke-virtual {p2}, Ll/crf0;->a()I

    .line 318
    .line 319
    .line 320
    move-result p1

    .line 321
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 322
    .line 323
    .line 324
    const-string p1, " preferWidth = "

    .line 325
    .line 326
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 327
    .line 328
    .line 329
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 330
    .line 331
    .line 332
    const-string p1, " preferHeight = "

    .line 333
    .line 334
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 335
    .line 336
    .line 337
    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 338
    .line 339
    .line 340
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 341
    .line 342
    .line 343
    move-result-object p0

    .line 344
    const-string p1, "CameraHelper"

    .line 345
    .line 346
    invoke-static {p1, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 347
    .line 348
    .line 349
    return-void
.end method

.method public static f(Ljava/util/List;Ll/crf0;IF)Ll/crf0;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/crf0;",
            ">;",
            "Ll/crf0;",
            "IF)",
            "Ll/crf0;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    invoke-virtual {p1}, Ll/crf0;->b()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p1}, Ll/crf0;->a()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    mul-int/2addr v1, v2

    .line 14
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const/4 v2, 0x0

    .line 19
    move v3, v2

    .line 20
    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v4

    .line 24
    if-eqz v4, :cond_6

    .line 25
    .line 26
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v4

    .line 30
    check-cast v4, Ll/crf0;

    .line 31
    .line 32
    invoke-virtual {v4}, Ll/crf0;->b()I

    .line 33
    .line 34
    .line 35
    move-result v5

    .line 36
    invoke-virtual {v4}, Ll/crf0;->a()I

    .line 37
    .line 38
    .line 39
    move-result v6

    .line 40
    mul-int/2addr v5, v6

    .line 41
    invoke-virtual {p1}, Ll/crf0;->b()I

    .line 42
    .line 43
    .line 44
    move-result v6

    .line 45
    invoke-virtual {p1}, Ll/crf0;->a()I

    .line 46
    .line 47
    .line 48
    move-result v7

    .line 49
    mul-int/2addr v6, v7

    .line 50
    sub-int/2addr v5, v6

    .line 51
    if-nez p2, :cond_2

    .line 52
    .line 53
    invoke-virtual {v4}, Ll/crf0;->b()I

    .line 54
    .line 55
    .line 56
    move-result v6

    .line 57
    int-to-float v6, v6

    .line 58
    div-float/2addr v6, p3

    .line 59
    invoke-virtual {v4}, Ll/crf0;->a()I

    .line 60
    .line 61
    .line 62
    move-result v7

    .line 63
    int-to-float v7, v7

    .line 64
    cmpl-float v6, v6, v7

    .line 65
    .line 66
    if-lez v6, :cond_3

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_2
    const/4 v6, 0x1

    .line 70
    if-ne p2, v6, :cond_3

    .line 71
    .line 72
    invoke-virtual {v4}, Ll/crf0;->a()I

    .line 73
    .line 74
    .line 75
    move-result v6

    .line 76
    int-to-float v6, v6

    .line 77
    mul-float/2addr v6, p3

    .line 78
    invoke-virtual {v4}, Ll/crf0;->b()I

    .line 79
    .line 80
    .line 81
    move-result v7

    .line 82
    int-to-float v7, v7

    .line 83
    cmpl-float v6, v6, v7

    .line 84
    .line 85
    if-lez v6, :cond_3

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_3
    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    .line 89
    .line 90
    .line 91
    move-result v6

    .line 92
    if-ge v6, v1, :cond_5

    .line 93
    .line 94
    invoke-virtual {v4}, Ll/crf0;->b()I

    .line 95
    .line 96
    .line 97
    move-result v6

    .line 98
    invoke-virtual {p1}, Ll/crf0;->b()I

    .line 99
    .line 100
    .line 101
    move-result v7

    .line 102
    if-le v6, v7, :cond_4

    .line 103
    .line 104
    invoke-virtual {v4}, Ll/crf0;->a()I

    .line 105
    .line 106
    .line 107
    move-result v6

    .line 108
    invoke-virtual {p1}, Ll/crf0;->a()I

    .line 109
    .line 110
    .line 111
    move-result v7

    .line 112
    if-gt v6, v7, :cond_1

    .line 113
    .line 114
    :cond_4
    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    .line 115
    .line 116
    .line 117
    move-result v1

    .line 118
    invoke-virtual {v4}, Ll/crf0;->b()I

    .line 119
    .line 120
    .line 121
    move-result v2

    .line 122
    invoke-virtual {v4}, Ll/crf0;->a()I

    .line 123
    .line 124
    .line 125
    move-result v3

    .line 126
    :goto_1
    move v8, v3

    .line 127
    move v3, v2

    .line 128
    move v2, v8

    .line 129
    goto :goto_0

    .line 130
    :cond_5
    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    .line 131
    .line 132
    .line 133
    move-result v5

    .line 134
    if-ne v5, v1, :cond_1

    .line 135
    .line 136
    invoke-virtual {v4}, Ll/crf0;->b()I

    .line 137
    .line 138
    .line 139
    move-result v5

    .line 140
    if-ge v3, v5, :cond_1

    .line 141
    .line 142
    invoke-virtual {v4}, Ll/crf0;->b()I

    .line 143
    .line 144
    .line 145
    move-result v2

    .line 146
    invoke-virtual {v4}, Ll/crf0;->a()I

    .line 147
    .line 148
    .line 149
    move-result v3

    .line 150
    goto :goto_1

    .line 151
    :cond_6
    if-eqz v2, :cond_7

    .line 152
    .line 153
    if-eqz v3, :cond_7

    .line 154
    .line 155
    new-instance p0, Ll/crf0;

    .line 156
    .line 157
    invoke-direct {p0, v3, v2}, Ll/crf0;-><init>(II)V

    .line 158
    .line 159
    .line 160
    return-object p0

    .line 161
    :cond_7
    return-object v0
.end method
