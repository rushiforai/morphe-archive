.class public Ll/biw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/xpl;


# annotations
.annotation build Landroidx/annotation/RequiresApi;
    api = 0xe
.end annotation


# static fields
.field private static q:Z


# instance fields
.field private final a:Ljava/lang/String;

.field private final b:Ljava/lang/Object;

.field private c:Ll/tow;

.field private d:Landroid/hardware/Camera;

.field private e:I

.field private f:I

.field private g:I

.field private h:I

.field private i:Landroid/graphics/SurfaceTexture;

.field private j:Ll/wje;

.field private k:Ll/xpl$a;

.field private l:Ll/xpl$d;

.field m:Landroid/hardware/Camera$CameraInfo;

.field private n:Z

.field private o:Ll/xpl$c;

.field private p:Ll/hh3;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Ll/tow;)V
    .locals 1
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x9
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "Camera"

    .line 5
    .line 6
    iput-object v0, p0, Ll/biw;->a:Ljava/lang/String;

    .line 7
    .line 8
    new-instance v0, Ljava/lang/Object;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Ll/biw;->b:Ljava/lang/Object;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput v0, p0, Ll/biw;->e:I

    .line 17
    .line 18
    iput v0, p0, Ll/biw;->f:I

    .line 19
    .line 20
    iput v0, p0, Ll/biw;->h:I

    .line 21
    .line 22
    new-instance v0, Landroid/hardware/Camera$CameraInfo;

    .line 23
    .line 24
    invoke-direct {v0}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Ll/biw;->m:Landroid/hardware/Camera$CameraInfo;

    .line 28
    .line 29
    const/4 v0, 0x1

    .line 30
    iput-boolean v0, p0, Ll/biw;->n:Z

    .line 31
    .line 32
    const/4 v0, 0x0

    .line 33
    iput-object v0, p0, Ll/biw;->o:Ll/xpl$c;

    .line 34
    .line 35
    iput-object p1, p0, Ll/biw;->c:Ll/tow;

    .line 36
    .line 37
    invoke-static {}, Landroid/hardware/Camera;->getNumberOfCameras()I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    iput p1, p0, Ll/biw;->g:I

    .line 42
    .line 43
    return-void
.end method

.method private A(Landroid/graphics/Rect;Landroid/hardware/Camera$AutoFocusCallback;)V
    .locals 6

    .line 1
    const-string v0, "Camera"

    .line 2
    .line 3
    iget-object v1, p0, Ll/biw;->d:Landroid/hardware/Camera;

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    goto/16 :goto_2

    .line 8
    .line 9
    :cond_0
    :try_start_0
    invoke-virtual {v1}, Landroid/hardware/Camera;->cancelAutoFocus()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .line 10
    .line 11
    .line 12
    :try_start_1
    iget-object v1, p0, Ll/biw;->d:Landroid/hardware/Camera;

    .line 13
    .line 14
    invoke-virtual {v1}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 15
    .line 16
    .line 17
    move-result-object v1
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0

    .line 18
    goto :goto_0

    .line 19
    :catch_0
    const/4 v1, 0x0

    .line 20
    :goto_0
    if-nez v1, :cond_1

    .line 21
    .line 22
    goto :goto_2

    .line 23
    :cond_1
    invoke-direct {p0, v1}, Ll/biw;->y(Landroid/hardware/Camera$Parameters;)Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-nez v2, :cond_3

    .line 28
    .line 29
    invoke-direct {p0, v1}, Ll/biw;->z(Landroid/hardware/Camera$Parameters;)Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-nez v2, :cond_2

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/biw;->i()Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-nez v2, :cond_2

    .line 40
    .line 41
    goto :goto_2

    .line 42
    :cond_2
    const-string v2, "continuous-video"

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_3
    const-string v2, "auto"

    .line 46
    .line 47
    :goto_1
    new-instance v3, Ljava/util/ArrayList;

    .line 48
    .line 49
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 50
    .line 51
    .line 52
    new-instance v4, Landroid/hardware/Camera$Area;

    .line 53
    .line 54
    const/16 v5, 0x3e8

    .line 55
    .line 56
    invoke-direct {v4, p1, v5}, Landroid/hardware/Camera$Area;-><init>(Landroid/graphics/Rect;I)V

    .line 57
    .line 58
    .line 59
    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Ll/biw;->i()Z

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    if-nez p1, :cond_4

    .line 67
    .line 68
    invoke-virtual {v1, v2}, Landroid/hardware/Camera$Parameters;->setFocusMode(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v1, v3}, Landroid/hardware/Camera$Parameters;->setFocusAreas(Ljava/util/List;)V

    .line 72
    .line 73
    .line 74
    :cond_4
    :try_start_2
    iget-object p1, p0, Ll/biw;->d:Landroid/hardware/Camera;

    .line 75
    .line 76
    invoke-virtual {p1, v1}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0}, Ll/biw;->i()Z

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    if-nez p1, :cond_6

    .line 84
    .line 85
    iget-object p1, p0, Ll/biw;->d:Landroid/hardware/Camera;

    .line 86
    .line 87
    invoke-virtual {p1, p2}, Landroid/hardware/Camera;->autoFocus(Landroid/hardware/Camera$AutoFocusCallback;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 88
    .line 89
    .line 90
    goto :goto_2

    .line 91
    :catch_1
    move-exception p1

    .line 92
    iget-object p0, p0, Ll/biw;->o:Ll/xpl$c;

    .line 93
    .line 94
    if-eqz p0, :cond_5

    .line 95
    .line 96
    new-instance p2, Ljava/lang/StringBuilder;

    .line 97
    .line 98
    const-string v1, "Set camera autoFocus error!"

    .line 99
    .line 100
    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object p2

    .line 114
    const/16 v1, 0xfa5

    .line 115
    .line 116
    invoke-interface {p0, v1, p2}, Ll/xpl$c;->onFail(ILjava/lang/String;)V

    .line 117
    .line 118
    .line 119
    :cond_5
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    invoke-static {v0, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    :cond_6
    :goto_2
    return-void

    .line 127
    :catch_2
    move-exception p0

    .line 128
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    invoke-static {v0, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    return-void
.end method

.method private C(Ll/tow;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/biw;->p:Ll/hh3;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/hh3;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/hh3;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/biw;->p:Ll/hh3;

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-virtual {v0}, Ll/hh3;->b()V

    .line 14
    .line 15
    .line 16
    :goto_0
    const/4 v0, 0x0

    .line 17
    :goto_1
    :try_start_0
    iget v1, p1, Ll/tow;->M:I

    .line 18
    .line 19
    if-ge v0, v1, :cond_1

    .line 20
    .line 21
    iget-object v1, p0, Ll/biw;->d:Landroid/hardware/Camera;

    .line 22
    .line 23
    iget-object v2, p0, Ll/biw;->p:Ll/hh3;

    .line 24
    .line 25
    iget v3, p1, Ll/tow;->L:I

    .line 26
    .line 27
    invoke-virtual {v2, v3}, Ll/hh3;->a(I)[B

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {v1, v2}, Landroid/hardware/Camera;->addCallbackBuffer([B)V
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    .line 32
    .line 33
    .line 34
    add-int/lit8 v0, v0, 0x1

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_1
    return-void

    .line 38
    :catch_0
    move-exception p0

    .line 39
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method private D(Ll/tow;Ll/erf0;)V
    .locals 4

    .line 1
    iget p0, p1, Ll/tow;->c:I

    .line 2
    .line 3
    iget-boolean p2, p1, Ll/tow;->d:Z

    .line 4
    .line 5
    const/4 v0, 0x2

    .line 6
    if-ne p0, v0, :cond_0

    .line 7
    .line 8
    goto :goto_2

    .line 9
    :cond_0
    if-eqz p2, :cond_1

    .line 10
    .line 11
    iget p0, p1, Ll/tow;->f:I

    .line 12
    .line 13
    int-to-float p0, p0

    .line 14
    iget p2, p1, Ll/tow;->e:I

    .line 15
    .line 16
    :goto_0
    int-to-float p2, p2

    .line 17
    goto :goto_1

    .line 18
    :cond_1
    iget p0, p1, Ll/tow;->e:I

    .line 19
    .line 20
    int-to-float p0, p0

    .line 21
    iget p2, p1, Ll/tow;->f:I

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :goto_1
    iget v1, p1, Ll/tow;->s:I

    .line 25
    .line 26
    int-to-float v1, v1

    .line 27
    iget v2, p1, Ll/tow;->t:I

    .line 28
    .line 29
    int-to-float v2, v2

    .line 30
    div-float/2addr p2, p0

    .line 31
    div-float/2addr v2, v1

    .line 32
    cmpl-float p0, p2, v2

    .line 33
    .line 34
    if-nez p0, :cond_2

    .line 35
    .line 36
    const/4 p0, 0x0

    .line 37
    iput p0, p1, Ll/tow;->J:F

    .line 38
    .line 39
    goto :goto_2

    .line 40
    :cond_2
    const/high16 v1, 0x40000000    # 2.0f

    .line 41
    .line 42
    const/high16 v3, 0x3f800000    # 1.0f

    .line 43
    .line 44
    if-lez p0, :cond_3

    .line 45
    .line 46
    div-float/2addr v2, p2

    .line 47
    sub-float/2addr v3, v2

    .line 48
    div-float/2addr v3, v1

    .line 49
    iput v3, p1, Ll/tow;->J:F

    .line 50
    .line 51
    goto :goto_2

    .line 52
    :cond_3
    div-float/2addr p2, v2

    .line 53
    sub-float/2addr v3, p2

    .line 54
    neg-float p0, v3

    .line 55
    div-float/2addr p0, v1

    .line 56
    iput p0, p1, Ll/tow;->J:F

    .line 57
    .line 58
    :goto_2
    iget p0, p1, Ll/tow;->e:I

    .line 59
    .line 60
    iget p2, p1, Ll/tow;->f:I

    .line 61
    .line 62
    mul-int/2addr p0, p2

    .line 63
    mul-int/lit8 p0, p0, 0x3

    .line 64
    .line 65
    div-int/2addr p0, v0

    .line 66
    iput p0, p1, Ll/tow;->L:I

    .line 67
    .line 68
    return-void
.end method

.method private static M(Landroid/content/Context;Ljava/util/List;Ljava/lang/String;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Ll/erf0;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Ll/erf0;

    .line 21
    .line 22
    new-instance v2, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1}, Ll/erf0;->b()I

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    const-string v3, ","

    .line 35
    .line 36
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1}, Ll/erf0;->a()I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string v1, "\r\n"

    .line 47
    .line 48
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_0
    invoke-static {p0}, Lcom/core/glcore/util/PreferenceUtil;->getEditor(Landroid/content/Context;)Landroid/content/SharedPreferences$Editor;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-interface {p0, p2, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method private N(Landroid/graphics/Rect;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/biw;->d:Landroid/hardware/Camera;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    :try_start_0
    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 7
    .line 8
    .line 9
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    goto :goto_0

    .line 11
    :catch_0
    const/4 v0, 0x0

    .line 12
    :goto_0
    if-nez v0, :cond_1

    .line 13
    .line 14
    goto :goto_1

    .line 15
    :cond_1
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getMaxNumMeteringAreas()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-lez v1, :cond_3

    .line 20
    .line 21
    new-instance v1, Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 24
    .line 25
    .line 26
    new-instance v2, Landroid/hardware/Camera$Area;

    .line 27
    .line 28
    const/16 v3, 0x3e8

    .line 29
    .line 30
    invoke-direct {v2, p1, v3}, Landroid/hardware/Camera$Area;-><init>(Landroid/graphics/Rect;I)V

    .line 31
    .line 32
    .line 33
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/hardware/Camera$Parameters;->setMeteringAreas(Ljava/util/List;)V

    .line 37
    .line 38
    .line 39
    :try_start_1
    iget-object p1, p0, Ll/biw;->d:Landroid/hardware/Camera;

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 42
    .line 43
    .line 44
    goto :goto_1

    .line 45
    :catch_1
    move-exception p1

    .line 46
    iget-object p0, p0, Ll/biw;->o:Ll/xpl$c;

    .line 47
    .line 48
    if-eqz p0, :cond_2

    .line 49
    .line 50
    new-instance v0, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    const-string v1, "Set camera setMeteringArea error!"

    .line 53
    .line 54
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    const/16 v1, 0xfa5

    .line 69
    .line 70
    invoke-interface {p0, v1, v0}, Ll/xpl$c;->onFail(ILjava/lang/String;)V

    .line 71
    .line 72
    .line 73
    :cond_2
    const-string p0, "Camera"

    .line 74
    .line 75
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    :cond_3
    :goto_1
    return-void
.end method

.method public static synthetic f(Ll/biw;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/biw;->b:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic l(Ll/biw;)Ll/xpl$a;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/biw;->k:Ll/xpl$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic n(Ll/biw;)Landroid/hardware/Camera;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/biw;->d:Landroid/hardware/Camera;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic o(Ll/biw;)Ll/tow;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/biw;->c:Ll/tow;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic p(Ll/biw;)Ll/wje;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/biw;->j:Ll/wje;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic q(Ll/biw;)Landroid/graphics/SurfaceTexture;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/biw;->i:Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    return-object p0
.end method

.method public static declared-synchronized s()V
    .locals 1

    .line 1
    const-class v0, Ll/biw;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    monitor-exit v0

    .line 5
    return-void
.end method

.method private t()Z
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    :try_start_0
    iget v2, p0, Ll/biw;->h:I

    .line 4
    .line 5
    iget-object v3, p0, Ll/biw;->m:Landroid/hardware/Camera$CameraInfo;

    .line 6
    .line 7
    invoke-static {v2, v3}, Landroid/hardware/Camera;->getCameraInfo(ILandroid/hardware/Camera$CameraInfo;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    .line 10
    move v2, v1

    .line 11
    goto :goto_0

    .line 12
    :catch_0
    move-exception v2

    .line 13
    const-string v3, "Camera"

    .line 14
    .line 15
    invoke-static {v3, v2}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 16
    .line 17
    .line 18
    iget-object v3, p0, Ll/biw;->o:Ll/xpl$c;

    .line 19
    .line 20
    if-eqz v3, :cond_0

    .line 21
    .line 22
    new-instance v4, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    const-string v5, "Get camera is front error!"

    .line 25
    .line 26
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    const/16 v4, 0xfa7

    .line 41
    .line 42
    invoke-interface {v3, v4, v2}, Ll/xpl$c;->onFail(ILjava/lang/String;)V

    .line 43
    .line 44
    .line 45
    :cond_0
    move v2, v0

    .line 46
    :goto_0
    iget v3, p0, Ll/biw;->h:I

    .line 47
    .line 48
    if-eq v3, v1, :cond_1

    .line 49
    .line 50
    if-eqz v2, :cond_2

    .line 51
    .line 52
    iget-object p0, p0, Ll/biw;->m:Landroid/hardware/Camera$CameraInfo;

    .line 53
    .line 54
    iget p0, p0, Landroid/hardware/Camera$CameraInfo;->facing:I

    .line 55
    .line 56
    if-ne p0, v1, :cond_2

    .line 57
    .line 58
    :cond_1
    move v0, v1

    .line 59
    :cond_2
    return v0
.end method

.method private u(Ljava/lang/Exception;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/biw;->d:Landroid/hardware/Camera;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Landroid/hardware/Camera;->setPreviewCallback(Landroid/hardware/Camera$PreviewCallback;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/biw;->d:Landroid/hardware/Camera;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/hardware/Camera;->setPreviewCallbackWithBuffer(Landroid/hardware/Camera$PreviewCallback;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/biw;->d:Landroid/hardware/Camera;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/hardware/Camera;->release()V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/biw;->i:Landroid/graphics/SurfaceTexture;

    .line 20
    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->release()V

    .line 24
    .line 25
    .line 26
    :cond_0
    iput-object v1, p0, Ll/biw;->d:Landroid/hardware/Camera;

    .line 27
    .line 28
    iget-object p0, p0, Ll/biw;->o:Ll/xpl$c;

    .line 29
    .line 30
    if-eqz p0, :cond_1

    .line 31
    .line 32
    new-instance v0, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    const-string v1, "Camera start preview failed !"

    .line 35
    .line 36
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    const/16 v0, 0xfa2

    .line 51
    .line 52
    invoke-interface {p0, v0, p1}, Ll/xpl$c;->onFail(ILjava/lang/String;)V

    .line 53
    .line 54
    .line 55
    :cond_1
    return-void
.end method

.method public static v(Landroid/content/Context;I)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "I)",
            "Ljava/util/List<",
            "Ll/erf0;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v0, -0x1

    .line 2
    const/high16 v1, -0x40800000    # -1.0f

    .line 3
    .line 4
    const/4 v2, 0x0

    .line 5
    invoke-static {p0, v2, p1, v0, v1}, Ll/biw;->w(Landroid/content/Context;Ll/erf0;IIF)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static w(Landroid/content/Context;Ll/erf0;IIF)Ljava/util/List;
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ll/erf0;",
            "IIF)",
            "Ljava/util/List<",
            "Ll/erf0;",
            ">;"
        }
    .end annotation

    .line 1
    move/from16 v0, p2

    .line 2
    .line 3
    move/from16 v1, p3

    .line 4
    .line 5
    new-instance v2, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    invoke-static {p0, v2, v3}, Ll/biw;->x(Landroid/content/Context;Ljava/util/List;Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    if-eqz v3, :cond_0

    .line 19
    .line 20
    return-object v2

    .line 21
    :cond_0
    and-int/lit8 v3, v0, 0x2

    .line 22
    .line 23
    const/4 v4, 0x0

    .line 24
    const/4 v5, 0x0

    .line 25
    if-eqz v3, :cond_1

    .line 26
    .line 27
    :try_start_0
    invoke-static {v4}, Landroid/hardware/Camera;->open(I)Landroid/hardware/Camera;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    invoke-virtual {v3}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 32
    .line 33
    .line 34
    move-result-object v6

    .line 35
    invoke-virtual {v6}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewSizes()Ljava/util/List;

    .line 36
    .line 37
    .line 38
    move-result-object v6

    .line 39
    invoke-virtual {v3}, Landroid/hardware/Camera;->release()V

    .line 40
    .line 41
    .line 42
    new-instance v3, Ll/biw$c;

    .line 43
    .line 44
    invoke-direct {v3}, Ll/biw$c;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-static {v6, v3}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 48
    .line 49
    .line 50
    move-object v3, v6

    .line 51
    goto :goto_0

    .line 52
    :cond_1
    move-object v3, v5

    .line 53
    move-object v6, v3

    .line 54
    :goto_0
    and-int/lit8 v7, v0, 0x1

    .line 55
    .line 56
    const/4 v8, 0x1

    .line 57
    if-eqz v7, :cond_2

    .line 58
    .line 59
    invoke-static {v8}, Landroid/hardware/Camera;->open(I)Landroid/hardware/Camera;

    .line 60
    .line 61
    .line 62
    move-result-object v6

    .line 63
    invoke-virtual {v6}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 64
    .line 65
    .line 66
    move-result-object v7

    .line 67
    invoke-virtual {v7}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewSizes()Ljava/util/List;

    .line 68
    .line 69
    .line 70
    move-result-object v7

    .line 71
    invoke-virtual {v6}, Landroid/hardware/Camera;->release()V

    .line 72
    .line 73
    .line 74
    new-instance v6, Ll/biw$d;

    .line 75
    .line 76
    invoke-direct {v6}, Ll/biw$d;-><init>()V

    .line 77
    .line 78
    .line 79
    invoke-static {v7, v6}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 80
    .line 81
    .line 82
    move-object v6, v7

    .line 83
    goto :goto_1

    .line 84
    :cond_2
    move-object v7, v5

    .line 85
    :goto_1
    const/4 v9, 0x3

    .line 86
    if-ne v0, v9, :cond_5

    .line 87
    .line 88
    new-instance v6, Ljava/util/ArrayList;

    .line 89
    .line 90
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 91
    .line 92
    .line 93
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 94
    .line 95
    .line 96
    move-result-object v3

    .line 97
    :cond_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 98
    .line 99
    .line 100
    move-result v9

    .line 101
    if-eqz v9, :cond_5

    .line 102
    .line 103
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object v9

    .line 107
    check-cast v9, Landroid/hardware/Camera$Size;

    .line 108
    .line 109
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 110
    .line 111
    .line 112
    move-result-object v10

    .line 113
    :cond_4
    :goto_2
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    .line 114
    .line 115
    .line 116
    move-result v11

    .line 117
    if-eqz v11, :cond_3

    .line 118
    .line 119
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    move-result-object v11

    .line 123
    check-cast v11, Landroid/hardware/Camera$Size;

    .line 124
    .line 125
    iget v12, v9, Landroid/hardware/Camera$Size;->width:I

    .line 126
    .line 127
    iget v13, v11, Landroid/hardware/Camera$Size;->width:I

    .line 128
    .line 129
    if-ne v12, v13, :cond_4

    .line 130
    .line 131
    iget v12, v9, Landroid/hardware/Camera$Size;->height:I

    .line 132
    .line 133
    iget v11, v11, Landroid/hardware/Camera$Size;->height:I

    .line 134
    .line 135
    if-ne v12, v11, :cond_4

    .line 136
    .line 137
    invoke-interface {v6, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 138
    .line 139
    .line 140
    goto :goto_2

    .line 141
    :cond_5
    if-lez v1, :cond_c

    .line 142
    .line 143
    const/4 v3, 0x0

    .line 144
    cmpl-float v3, p4, v3

    .line 145
    .line 146
    if-lez v3, :cond_c

    .line 147
    .line 148
    if-eqz p1, :cond_c

    .line 149
    .line 150
    invoke-interface {v6}, Ljava/util/List;->size()I

    .line 151
    .line 152
    .line 153
    move-result v3

    .line 154
    if-lez v3, :cond_c

    .line 155
    .line 156
    invoke-virtual {p1}, Ll/erf0;->b()I

    .line 157
    .line 158
    .line 159
    move-result v3

    .line 160
    invoke-virtual {p1}, Ll/erf0;->a()I

    .line 161
    .line 162
    .line 163
    move-result v7

    .line 164
    mul-int/2addr v3, v7

    .line 165
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 166
    .line 167
    .line 168
    move-result-object v6

    .line 169
    move v7, v4

    .line 170
    :cond_6
    :goto_3
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    .line 171
    .line 172
    .line 173
    move-result v9

    .line 174
    if-eqz v9, :cond_b

    .line 175
    .line 176
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 177
    .line 178
    .line 179
    move-result-object v9

    .line 180
    check-cast v9, Landroid/hardware/Camera$Size;

    .line 181
    .line 182
    iget v10, v9, Landroid/hardware/Camera$Size;->width:I

    .line 183
    .line 184
    iget v11, v9, Landroid/hardware/Camera$Size;->height:I

    .line 185
    .line 186
    mul-int/2addr v10, v11

    .line 187
    invoke-virtual {p1}, Ll/erf0;->b()I

    .line 188
    .line 189
    .line 190
    move-result v11

    .line 191
    invoke-virtual {p1}, Ll/erf0;->a()I

    .line 192
    .line 193
    .line 194
    move-result v12

    .line 195
    mul-int/2addr v11, v12

    .line 196
    sub-int/2addr v10, v11

    .line 197
    if-nez v1, :cond_7

    .line 198
    .line 199
    iget v11, v9, Landroid/hardware/Camera$Size;->width:I

    .line 200
    .line 201
    int-to-float v11, v11

    .line 202
    div-float v11, v11, p4

    .line 203
    .line 204
    iget v12, v9, Landroid/hardware/Camera$Size;->height:I

    .line 205
    .line 206
    int-to-float v12, v12

    .line 207
    cmpl-float v11, v11, v12

    .line 208
    .line 209
    if-lez v11, :cond_8

    .line 210
    .line 211
    goto :goto_3

    .line 212
    :cond_7
    if-ne v1, v8, :cond_8

    .line 213
    .line 214
    iget v11, v9, Landroid/hardware/Camera$Size;->height:I

    .line 215
    .line 216
    int-to-float v11, v11

    .line 217
    mul-float v11, v11, p4

    .line 218
    .line 219
    iget v12, v9, Landroid/hardware/Camera$Size;->width:I

    .line 220
    .line 221
    int-to-float v12, v12

    .line 222
    cmpl-float v11, v11, v12

    .line 223
    .line 224
    if-lez v11, :cond_8

    .line 225
    .line 226
    goto :goto_3

    .line 227
    :cond_8
    invoke-static {v10}, Ljava/lang/Math;->abs(I)I

    .line 228
    .line 229
    .line 230
    move-result v11

    .line 231
    if-ge v11, v3, :cond_a

    .line 232
    .line 233
    iget v11, v9, Landroid/hardware/Camera$Size;->width:I

    .line 234
    .line 235
    invoke-virtual {p1}, Ll/erf0;->b()I

    .line 236
    .line 237
    .line 238
    move-result v12

    .line 239
    if-le v11, v12, :cond_9

    .line 240
    .line 241
    iget v11, v9, Landroid/hardware/Camera$Size;->height:I

    .line 242
    .line 243
    invoke-virtual {p1}, Ll/erf0;->a()I

    .line 244
    .line 245
    .line 246
    move-result v12

    .line 247
    if-gt v11, v12, :cond_6

    .line 248
    .line 249
    :cond_9
    invoke-static {v10}, Ljava/lang/Math;->abs(I)I

    .line 250
    .line 251
    .line 252
    move-result v3

    .line 253
    iget v4, v9, Landroid/hardware/Camera$Size;->width:I

    .line 254
    .line 255
    iget v7, v9, Landroid/hardware/Camera$Size;->height:I

    .line 256
    .line 257
    goto :goto_3

    .line 258
    :cond_a
    invoke-static {v10}, Ljava/lang/Math;->abs(I)I

    .line 259
    .line 260
    .line 261
    move-result v10

    .line 262
    if-ne v10, v3, :cond_6

    .line 263
    .line 264
    iget v10, v9, Landroid/hardware/Camera$Size;->width:I

    .line 265
    .line 266
    if-ge v4, v10, :cond_6

    .line 267
    .line 268
    iget v4, v9, Landroid/hardware/Camera$Size;->height:I

    .line 269
    .line 270
    move v7, v4

    .line 271
    move v4, v10

    .line 272
    goto :goto_3

    .line 273
    :cond_b
    if-eqz v4, :cond_e

    .line 274
    .line 275
    if-eqz v7, :cond_e

    .line 276
    .line 277
    new-instance p1, Ll/erf0;

    .line 278
    .line 279
    invoke-direct {p1, v4, v7}, Ll/erf0;-><init>(II)V

    .line 280
    .line 281
    .line 282
    invoke-interface {v2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 283
    .line 284
    .line 285
    goto :goto_5

    .line 286
    :cond_c
    if-nez p1, :cond_e

    .line 287
    .line 288
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 289
    .line 290
    .line 291
    move-result-object p1

    .line 292
    :goto_4
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 293
    .line 294
    .line 295
    move-result v1

    .line 296
    if-eqz v1, :cond_d

    .line 297
    .line 298
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 299
    .line 300
    .line 301
    move-result-object v1

    .line 302
    check-cast v1, Landroid/hardware/Camera$Size;

    .line 303
    .line 304
    new-instance v3, Ll/erf0;

    .line 305
    .line 306
    iget v4, v1, Landroid/hardware/Camera$Size;->width:I

    .line 307
    .line 308
    iget v1, v1, Landroid/hardware/Camera$Size;->height:I

    .line 309
    .line 310
    invoke-direct {v3, v4, v1}, Ll/erf0;-><init>(II)V

    .line 311
    .line 312
    .line 313
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 314
    .line 315
    .line 316
    goto :goto_4

    .line 317
    :cond_d
    new-instance p1, Ll/biw$e;

    .line 318
    .line 319
    invoke-direct {p1}, Ll/biw$e;-><init>()V

    .line 320
    .line 321
    .line 322
    invoke-static {v6, p1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 323
    .line 324
    .line 325
    goto :goto_5

    .line 326
    :catchall_0
    return-object v5

    .line 327
    :cond_e
    :goto_5
    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 328
    .line 329
    .line 330
    move-result-object p1

    .line 331
    invoke-static {p0, v2, p1}, Ll/biw;->M(Landroid/content/Context;Ljava/util/List;Ljava/lang/String;)V

    .line 332
    .line 333
    .line 334
    return-object v2
.end method

.method private static x(Landroid/content/Context;Ljava/util/List;Ljava/lang/String;)Z
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Ll/erf0;",
            ">;",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    .line 1
    const-string v0, "Read camera support resolution failed !!!"

    .line 2
    .line 3
    const-string v1, "Camera"

    .line 4
    .line 5
    const-string v2, "utf8"

    .line 6
    .line 7
    invoke-static {p0}, Lcom/core/glcore/util/PreferenceUtil;->getDefault(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/4 v3, 0x0

    .line 12
    invoke-interface {p0, p2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const/4 p2, 0x0

    .line 17
    if-eqz p0, :cond_2

    .line 18
    .line 19
    :try_start_0
    new-instance v3, Ljava/io/BufferedReader;

    .line 20
    .line 21
    new-instance v4, Ljava/io/InputStreamReader;

    .line 22
    .line 23
    new-instance v5, Ljava/io/ByteArrayInputStream;

    .line 24
    .line 25
    invoke-static {v2}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    .line 26
    .line 27
    .line 28
    move-result-object v6

    .line 29
    invoke-virtual {p0, v6}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-direct {v5, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 34
    .line 35
    .line 36
    invoke-static {v2}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-direct {v4, v5, p0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    .line 41
    .line 42
    .line 43
    invoke-direct {v3, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 44
    .line 45
    .line 46
    :cond_0
    :goto_0
    const/4 p0, 0x1

    .line 47
    :try_start_1
    invoke-virtual {v3}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    if-eqz v2, :cond_1

    .line 52
    .line 53
    const-string v4, ","

    .line 54
    .line 55
    invoke-virtual {v2, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    array-length v4, v2

    .line 60
    const/4 v5, 0x2

    .line 61
    if-ne v4, v5, :cond_0

    .line 62
    .line 63
    new-instance v4, Ll/erf0;

    .line 64
    .line 65
    aget-object v5, v2, p2

    .line 66
    .line 67
    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 68
    .line 69
    .line 70
    move-result v5

    .line 71
    aget-object v2, v2, p0

    .line 72
    .line 73
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    invoke-direct {v4, v5, v2}, Ll/erf0;-><init>(II)V

    .line 78
    .line 79
    .line 80
    invoke-interface {p1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 81
    .line 82
    .line 83
    goto :goto_0

    .line 84
    :catch_0
    move-exception p1

    .line 85
    goto :goto_1

    .line 86
    :cond_1
    :try_start_2
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 87
    .line 88
    .line 89
    return p0

    .line 90
    :catch_1
    move-exception p0

    .line 91
    goto :goto_2

    .line 92
    :goto_1
    :try_start_3
    new-instance v2, Ljava/lang/StringBuilder;

    .line 93
    .line 94
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    invoke-static {v1, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 112
    .line 113
    .line 114
    :try_start_4
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V

    .line 115
    .line 116
    .line 117
    return p0

    .line 118
    :catchall_0
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    .line 119
    .line 120
    .line 121
    return p0

    .line 122
    :goto_2
    new-instance p1, Ljava/lang/StringBuilder;

    .line 123
    .line 124
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    invoke-static {v1, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    :cond_2
    return p2
.end method

.method private y(Landroid/hardware/Camera$Parameters;)Z
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/hardware/Camera$Parameters;->getSupportedFocusModes()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 p1, 0x0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    return p1

    .line 9
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_2

    .line 18
    .line 19
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ljava/lang/String;

    .line 24
    .line 25
    const-string v1, "auto"

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    const/4 p0, 0x1

    .line 34
    return p0

    .line 35
    :cond_2
    return p1
.end method

.method private z(Landroid/hardware/Camera$Parameters;)Z
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/hardware/Camera$Parameters;->getSupportedFocusModes()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 p1, 0x0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    return p1

    .line 9
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_2

    .line 18
    .line 19
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ljava/lang/String;

    .line 24
    .line 25
    const-string v1, "fixed"

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    const/4 p0, 0x1

    .line 34
    return p0

    .line 35
    :cond_2
    return p1
.end method


# virtual methods
.method public B()Z
    .locals 4
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x9
    .end annotation

    .line 1
    :try_start_0
    iget v0, p0, Ll/biw;->h:I

    .line 2
    .line 3
    invoke-static {v0}, Landroid/hardware/Camera;->open(I)Landroid/hardware/Camera;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iput-object v0, p0, Ll/biw;->d:Landroid/hardware/Camera;

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    sput-boolean v0, Ll/biw;->q:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    invoke-direct {p0}, Ll/biw;->t()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    iput-boolean v1, p0, Ll/biw;->n:Z

    .line 17
    .line 18
    return v0

    .line 19
    :catchall_0
    move-exception v0

    .line 20
    new-instance v1, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    const-string v2, "Camera open failed !"

    .line 23
    .line 24
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    const-string v3, "Camera"

    .line 39
    .line 40
    invoke-static {v3, v1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Ll/biw;->o:Ll/xpl$c;

    .line 44
    .line 45
    if-eqz p0, :cond_0

    .line 46
    .line 47
    new-instance v1, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    const/16 v1, 0xfa4

    .line 64
    .line 65
    invoke-interface {p0, v1, v0}, Ll/xpl$c;->onFail(ILjava/lang/String;)V

    .line 66
    .line 67
    .line 68
    :cond_0
    const/4 p0, 0x0

    .line 69
    return p0
.end method

.method public E(ILl/row;)Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/biw;->b:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    const-string v1, "Camera"

    .line 5
    .line 6
    const-string v2, "Swap camera"

    .line 7
    .line 8
    invoke-static {v1, v2}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Ll/biw;->d:Landroid/hardware/Camera;

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {v1}, Landroid/hardware/Camera;->stopPreview()V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Ll/biw;->d:Landroid/hardware/Camera;

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    invoke-virtual {v1, v2}, Landroid/hardware/Camera;->setPreviewCallback(Landroid/hardware/Camera$PreviewCallback;)V

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Ll/biw;->d:Landroid/hardware/Camera;

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Landroid/hardware/Camera;->setPreviewCallbackWithBuffer(Landroid/hardware/Camera$PreviewCallback;)V

    .line 27
    .line 28
    .line 29
    iget-object v1, p0, Ll/biw;->d:Landroid/hardware/Camera;

    .line 30
    .line 31
    invoke-virtual {v1}, Landroid/hardware/Camera;->release()V

    .line 32
    .line 33
    .line 34
    iput-object v2, p0, Ll/biw;->d:Landroid/hardware/Camera;

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :catchall_0
    move-exception p0

    .line 38
    goto :goto_1

    .line 39
    :cond_0
    :goto_0
    iget v1, p0, Ll/biw;->h:I

    .line 40
    .line 41
    add-int/lit8 v1, v1, 0x1

    .line 42
    .line 43
    iget v2, p0, Ll/biw;->g:I

    .line 44
    .line 45
    rem-int/2addr v1, v2

    .line 46
    iput v1, p0, Ll/biw;->h:I

    .line 47
    .line 48
    invoke-virtual {p2, v1}, Ll/row;->q(I)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0, p1, p2}, Ll/biw;->G(ILl/row;)Z

    .line 52
    .line 53
    .line 54
    monitor-exit v0

    .line 55
    const/4 p0, 0x0

    .line 56
    return p0

    .line 57
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 58
    throw p0
.end method

.method public F(ILl/row;)Z
    .locals 3

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/biw;->b:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    :try_start_1
    const-string v1, "Camera"

    .line 5
    .line 6
    const-string v2, "Reset camera"

    .line 7
    .line 8
    invoke-static {v1, v2}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Ll/biw;->d:Landroid/hardware/Camera;

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {v1}, Landroid/hardware/Camera;->stopPreview()V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Ll/biw;->d:Landroid/hardware/Camera;

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    invoke-virtual {v1, v2}, Landroid/hardware/Camera;->setPreviewCallback(Landroid/hardware/Camera$PreviewCallback;)V

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Ll/biw;->d:Landroid/hardware/Camera;

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Landroid/hardware/Camera;->setPreviewCallbackWithBuffer(Landroid/hardware/Camera$PreviewCallback;)V

    .line 27
    .line 28
    .line 29
    iget-object v1, p0, Ll/biw;->d:Landroid/hardware/Camera;

    .line 30
    .line 31
    invoke-virtual {v1}, Landroid/hardware/Camera;->release()V

    .line 32
    .line 33
    .line 34
    iput-object v2, p0, Ll/biw;->d:Landroid/hardware/Camera;

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :catchall_0
    move-exception p0

    .line 38
    goto :goto_1

    .line 39
    :cond_0
    :goto_0
    iget v1, p0, Ll/biw;->h:I

    .line 40
    .line 41
    invoke-virtual {p2, v1}, Ll/row;->q(I)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0, p1, p2}, Ll/biw;->G(ILl/row;)Z

    .line 45
    .line 46
    .line 47
    monitor-exit v0

    .line 48
    goto :goto_2

    .line 49
    :goto_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 50
    :try_start_2
    throw p0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 51
    :catch_0
    move-exception p0

    .line 52
    const-string p1, "Camera"

    .line 53
    .line 54
    new-instance p2, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    const-string v0, "Reset camera failed !!!"

    .line 57
    .line 58
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-static {p1, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    :goto_2
    const/4 p0, 0x0

    .line 76
    return p0
.end method

.method public G(ILl/row;)Z
    .locals 7

    .line 1
    iget v0, p0, Ll/biw;->g:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    sub-int/2addr v0, v1

    .line 5
    invoke-virtual {p2}, Ll/row;->a()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-lt v0, v2, :cond_0

    .line 10
    .line 11
    invoke-virtual {p2}, Ll/row;->a()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iput v0, p0, Ll/biw;->h:I

    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Ll/biw;->b:Ljava/lang/Object;

    .line 18
    .line 19
    monitor-enter v0

    .line 20
    const/4 v2, 0x0

    .line 21
    move v3, v2

    .line 22
    :catchall_0
    :cond_1
    :goto_0
    const/4 v4, 0x2

    .line 23
    if-ge v3, v4, :cond_5

    .line 24
    .line 25
    :try_start_0
    invoke-virtual {p0}, Ll/biw;->B()Z

    .line 26
    .line 27
    .line 28
    move-result v5

    .line 29
    if-nez v5, :cond_2

    .line 30
    .line 31
    const-string v5, "Camera"

    .line 32
    .line 33
    const-string v6, "Camera Open Failed!"

    .line 34
    .line 35
    invoke-static {v5, v6}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 36
    .line 37
    .line 38
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 39
    return v2

    .line 40
    :catchall_1
    move-exception p0

    .line 41
    goto/16 :goto_8

    .line 42
    .line 43
    :cond_2
    :try_start_2
    iget-object v5, p0, Ll/biw;->d:Landroid/hardware/Camera;

    .line 44
    .line 45
    if-nez v5, :cond_3

    .line 46
    .line 47
    const-string v5, "Camera"

    .line 48
    .line 49
    const-string v6, "Camera is NULL"

    .line 50
    .line 51
    invoke-static {v5, v6}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 52
    .line 53
    .line 54
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 55
    return v2

    .line 56
    :cond_3
    :try_start_4
    invoke-virtual {p0, p1}, Ll/biw;->r(I)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 57
    .line 58
    .line 59
    goto :goto_1

    .line 60
    :catchall_2
    add-int/lit8 v3, v3, 0x1

    .line 61
    .line 62
    if-lt v3, v4, :cond_4

    .line 63
    .line 64
    :try_start_5
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 65
    return v2

    .line 66
    :cond_4
    :try_start_6
    iget-object v4, p0, Ll/biw;->d:Landroid/hardware/Camera;

    .line 67
    .line 68
    if-eqz v4, :cond_1

    .line 69
    .line 70
    const/4 v5, 0x0

    .line 71
    invoke-virtual {v4, v5}, Landroid/hardware/Camera;->setPreviewCallback(Landroid/hardware/Camera$PreviewCallback;)V

    .line 72
    .line 73
    .line 74
    iget-object v4, p0, Ll/biw;->d:Landroid/hardware/Camera;

    .line 75
    .line 76
    invoke-virtual {v4, v5}, Landroid/hardware/Camera;->setPreviewCallbackWithBuffer(Landroid/hardware/Camera$PreviewCallback;)V

    .line 77
    .line 78
    .line 79
    iget-object v4, p0, Ll/biw;->d:Landroid/hardware/Camera;

    .line 80
    .line 81
    invoke-virtual {v4}, Landroid/hardware/Camera;->release()V

    .line 82
    .line 83
    .line 84
    iput-object v5, p0, Ll/biw;->d:Landroid/hardware/Camera;
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_5
    :goto_1
    :try_start_7
    iget-object p1, p0, Ll/biw;->d:Landroid/hardware/Camera;

    .line 88
    .line 89
    invoke-virtual {p1}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    iget-object v3, p0, Ll/biw;->c:Ll/tow;

    .line 94
    .line 95
    invoke-virtual {p2}, Ll/row;->f()Ll/erf0;

    .line 96
    .line 97
    .line 98
    move-result-object v4

    .line 99
    invoke-static {p1, v3, v4}, Lcom/core/glcore/util/CameraHelper;->selectCameraPreviewWH(Landroid/hardware/Camera$Parameters;Ll/tow;Ll/erf0;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p2}, Ll/row;->h()I

    .line 103
    .line 104
    .line 105
    move-result v3

    .line 106
    iget-object v4, p0, Ll/biw;->c:Ll/tow;

    .line 107
    .line 108
    iget v5, v4, Ll/tow;->T:I

    .line 109
    .line 110
    div-int/lit16 v6, v5, 0x3e8

    .line 111
    .line 112
    if-le v3, v6, :cond_6

    .line 113
    .line 114
    div-int/lit16 v5, v5, 0x3e8

    .line 115
    .line 116
    iput v5, v4, Ll/tow;->F:I

    .line 117
    .line 118
    goto :goto_2

    .line 119
    :catch_0
    move-exception p1

    .line 120
    goto/16 :goto_7

    .line 121
    .line 122
    :cond_6
    invoke-virtual {p2}, Ll/row;->h()I

    .line 123
    .line 124
    .line 125
    move-result v3

    .line 126
    iput v3, v4, Ll/tow;->F:I

    .line 127
    .line 128
    :goto_2
    iget-object v3, p0, Ll/biw;->c:Ll/tow;

    .line 129
    .line 130
    invoke-static {p1, v3}, Lcom/core/glcore/util/CameraHelper;->selectCameraFpsRange(Landroid/hardware/Camera$Parameters;Ll/tow;)V

    .line 131
    .line 132
    .line 133
    iget-object v3, p0, Ll/biw;->c:Ll/tow;

    .line 134
    .line 135
    invoke-virtual {p2}, Ll/row;->f()Ll/erf0;

    .line 136
    .line 137
    .line 138
    move-result-object v4

    .line 139
    invoke-direct {p0, v3, v4}, Ll/biw;->D(Ll/tow;Ll/erf0;)V

    .line 140
    .line 141
    .line 142
    iget-object v3, p0, Ll/biw;->c:Ll/tow;

    .line 143
    .line 144
    invoke-static {p1, v3}, Lcom/core/glcore/util/CameraHelper;->selectCameraColorFormat(Landroid/hardware/Camera$Parameters;Ll/tow;)Z

    .line 145
    .line 146
    .line 147
    move-result p1

    .line 148
    if-nez p1, :cond_8

    .line 149
    .line 150
    const-string p1, "Camera"

    .line 151
    .line 152
    const-string p2, "CameraHelper.selectCameraColorFormat,Failed"

    .line 153
    .line 154
    invoke-static {p1, p2}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    iget-object p1, p0, Ll/biw;->o:Ll/xpl$c;

    .line 158
    .line 159
    if-eqz p1, :cond_7

    .line 160
    .line 161
    const-string p2, "CameraHelper.selectCameraColorFormat,Failed"

    .line 162
    .line 163
    const/16 v1, 0xfa6

    .line 164
    .line 165
    invoke-interface {p1, v1, p2}, Ll/xpl$c;->onFail(ILjava/lang/String;)V

    .line 166
    .line 167
    .line 168
    :cond_7
    iget-object p1, p0, Ll/biw;->c:Ll/tow;

    .line 169
    .line 170
    invoke-virtual {p1}, Ll/tow;->a()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_0
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 171
    .line 172
    .line 173
    :try_start_8
    monitor-exit v0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 174
    return v2

    .line 175
    :cond_8
    :try_start_9
    iget-object p1, p0, Ll/biw;->d:Landroid/hardware/Camera;

    .line 176
    .line 177
    iget-object v3, p0, Ll/biw;->c:Ll/tow;

    .line 178
    .line 179
    invoke-static {p1, v3}, Lcom/core/glcore/util/CameraHelper;->configCamera(Landroid/hardware/Camera;Ll/tow;)Z

    .line 180
    .line 181
    .line 182
    move-result p1

    .line 183
    if-nez p1, :cond_a

    .line 184
    .line 185
    const-string p1, "Camera"

    .line 186
    .line 187
    const-string p2, "CameraHelper.configCamera,Failed"

    .line 188
    .line 189
    invoke-static {p1, p2}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 190
    .line 191
    .line 192
    iget-object p1, p0, Ll/biw;->o:Ll/xpl$c;

    .line 193
    .line 194
    if-eqz p1, :cond_9

    .line 195
    .line 196
    const-string p2, "CameraHelper.configCamera,Failed"

    .line 197
    .line 198
    const/16 v1, 0xfa5

    .line 199
    .line 200
    invoke-interface {p1, v1, p2}, Ll/xpl$c;->onFail(ILjava/lang/String;)V

    .line 201
    .line 202
    .line 203
    :cond_9
    iget-object p1, p0, Ll/biw;->c:Ll/tow;

    .line 204
    .line 205
    invoke-virtual {p1}, Ll/tow;->a()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_0
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    .line 206
    .line 207
    .line 208
    :try_start_a
    monitor-exit v0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    .line 209
    return v2

    .line 210
    :cond_a
    :try_start_b
    iget-object p1, p0, Ll/biw;->c:Ll/tow;

    .line 211
    .line 212
    invoke-direct {p0, p1}, Ll/biw;->C(Ll/tow;)V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_0
    .catchall {:try_start_b .. :try_end_b} :catchall_1

    .line 213
    .line 214
    .line 215
    :try_start_c
    monitor-exit v0
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_1

    .line 216
    iget-object p1, p0, Ll/biw;->c:Ll/tow;

    .line 217
    .line 218
    iget v0, p1, Ll/tow;->e:I

    .line 219
    .line 220
    iget p1, p1, Ll/tow;->f:I

    .line 221
    .line 222
    invoke-virtual {p2}, Ll/row;->c()Z

    .line 223
    .line 224
    .line 225
    move-result v2

    .line 226
    if-nez v2, :cond_c

    .line 227
    .line 228
    invoke-virtual {p2}, Ll/row;->d()I

    .line 229
    .line 230
    .line 231
    move-result v2

    .line 232
    if-ne v2, v1, :cond_b

    .line 233
    .line 234
    int-to-float v0, p1

    .line 235
    invoke-virtual {p2}, Ll/row;->e()F

    .line 236
    .line 237
    .line 238
    move-result v2

    .line 239
    mul-float/2addr v0, v2

    .line 240
    float-to-int v0, v0

    .line 241
    iget-object v2, p0, Ll/biw;->c:Ll/tow;

    .line 242
    .line 243
    iget v2, v2, Ll/tow;->e:I

    .line 244
    .line 245
    if-eq v0, v2, :cond_c

    .line 246
    .line 247
    shr-int/lit8 v0, v0, 0x4

    .line 248
    .line 249
    shl-int/lit8 v0, v0, 0x4

    .line 250
    .line 251
    goto :goto_3

    .line 252
    :cond_b
    invoke-virtual {p2}, Ll/row;->d()I

    .line 253
    .line 254
    .line 255
    move-result v2

    .line 256
    if-nez v2, :cond_c

    .line 257
    .line 258
    int-to-float p1, v0

    .line 259
    invoke-virtual {p2}, Ll/row;->e()F

    .line 260
    .line 261
    .line 262
    move-result v2

    .line 263
    div-float/2addr p1, v2

    .line 264
    float-to-int p1, p1

    .line 265
    iget-object v2, p0, Ll/biw;->c:Ll/tow;

    .line 266
    .line 267
    iget v2, v2, Ll/tow;->f:I

    .line 268
    .line 269
    if-eq p1, v2, :cond_c

    .line 270
    .line 271
    shr-int/lit8 p1, p1, 0x4

    .line 272
    .line 273
    shl-int/lit8 p1, p1, 0x4

    .line 274
    .line 275
    :cond_c
    :goto_3
    iget v2, p0, Ll/biw;->f:I

    .line 276
    .line 277
    if-eq v2, v1, :cond_e

    .line 278
    .line 279
    const/4 v3, 0x3

    .line 280
    if-ne v2, v3, :cond_d

    .line 281
    .line 282
    goto :goto_4

    .line 283
    :cond_d
    new-instance v2, Ll/erf0;

    .line 284
    .line 285
    invoke-direct {v2, v0, p1}, Ll/erf0;-><init>(II)V

    .line 286
    .line 287
    .line 288
    goto :goto_5

    .line 289
    :cond_e
    :goto_4
    new-instance v2, Ll/erf0;

    .line 290
    .line 291
    invoke-direct {v2, p1, v0}, Ll/erf0;-><init>(II)V

    .line 292
    .line 293
    .line 294
    :goto_5
    iget-object p1, p0, Ll/biw;->c:Ll/tow;

    .line 295
    .line 296
    iget-boolean p1, p1, Ll/tow;->Z:Z

    .line 297
    .line 298
    if-eqz p1, :cond_f

    .line 299
    .line 300
    invoke-virtual {v2}, Ll/erf0;->b()I

    .line 301
    .line 302
    .line 303
    move-result p1

    .line 304
    if-lez p1, :cond_10

    .line 305
    .line 306
    invoke-virtual {v2}, Ll/erf0;->a()I

    .line 307
    .line 308
    .line 309
    move-result p1

    .line 310
    if-lez p1, :cond_10

    .line 311
    .line 312
    iget-object p1, p0, Ll/biw;->c:Ll/tow;

    .line 313
    .line 314
    invoke-virtual {v2}, Ll/erf0;->b()I

    .line 315
    .line 316
    .line 317
    move-result v0

    .line 318
    iput v0, p1, Ll/tow;->m:I

    .line 319
    .line 320
    iget-object p1, p0, Ll/biw;->c:Ll/tow;

    .line 321
    .line 322
    invoke-virtual {v2}, Ll/erf0;->a()I

    .line 323
    .line 324
    .line 325
    move-result v0

    .line 326
    iput v0, p1, Ll/tow;->n:I

    .line 327
    .line 328
    invoke-virtual {p2, v2}, Ll/row;->r(Ll/erf0;)V

    .line 329
    .line 330
    .line 331
    goto :goto_6

    .line 332
    :cond_f
    invoke-virtual {p2}, Ll/row;->b()Ll/erf0;

    .line 333
    .line 334
    .line 335
    move-result-object p1

    .line 336
    if-eqz p1, :cond_10

    .line 337
    .line 338
    invoke-virtual {p1}, Ll/erf0;->b()I

    .line 339
    .line 340
    .line 341
    move-result p2

    .line 342
    if-lez p2, :cond_10

    .line 343
    .line 344
    invoke-virtual {p1}, Ll/erf0;->a()I

    .line 345
    .line 346
    .line 347
    move-result p2

    .line 348
    if-lez p2, :cond_10

    .line 349
    .line 350
    iget-object p2, p0, Ll/biw;->c:Ll/tow;

    .line 351
    .line 352
    invoke-virtual {p1}, Ll/erf0;->b()I

    .line 353
    .line 354
    .line 355
    move-result v0

    .line 356
    iput v0, p2, Ll/tow;->m:I

    .line 357
    .line 358
    iget-object p2, p0, Ll/biw;->c:Ll/tow;

    .line 359
    .line 360
    invoke-virtual {p1}, Ll/erf0;->a()I

    .line 361
    .line 362
    .line 363
    move-result p1

    .line 364
    iput p1, p2, Ll/tow;->n:I

    .line 365
    .line 366
    :cond_10
    :goto_6
    iget-object p1, p0, Ll/biw;->l:Ll/xpl$d;

    .line 367
    .line 368
    if-eqz p1, :cond_11

    .line 369
    .line 370
    iget-object p0, p0, Ll/biw;->d:Landroid/hardware/Camera;

    .line 371
    .line 372
    invoke-interface {p1, p0}, Ll/xpl$d;->V(Landroid/hardware/Camera;)V

    .line 373
    .line 374
    .line 375
    :cond_11
    return v1

    .line 376
    :goto_7
    :try_start_d
    const-string p2, "Camera"

    .line 377
    .line 378
    new-instance v1, Ljava/lang/StringBuilder;

    .line 379
    .line 380
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 381
    .line 382
    .line 383
    const-string v3, "CameraHelper.prepare failed !"

    .line 384
    .line 385
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 386
    .line 387
    .line 388
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 389
    .line 390
    .line 391
    move-result-object v3

    .line 392
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 393
    .line 394
    .line 395
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 396
    .line 397
    .line 398
    move-result-object v1

    .line 399
    invoke-static {p2, v1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 400
    .line 401
    .line 402
    iget-object p0, p0, Ll/biw;->o:Ll/xpl$c;

    .line 403
    .line 404
    if-eqz p0, :cond_12

    .line 405
    .line 406
    new-instance p2, Ljava/lang/StringBuilder;

    .line 407
    .line 408
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 409
    .line 410
    .line 411
    const-string v1, "CameraHelper.prepare failed !"

    .line 412
    .line 413
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 414
    .line 415
    .line 416
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 417
    .line 418
    .line 419
    move-result-object p1

    .line 420
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 421
    .line 422
    .line 423
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 424
    .line 425
    .line 426
    move-result-object p1

    .line 427
    const/16 p2, 0xfa1

    .line 428
    .line 429
    invoke-interface {p0, p2, p1}, Ll/xpl$c;->onFail(ILjava/lang/String;)V

    .line 430
    .line 431
    .line 432
    :cond_12
    monitor-exit v0

    .line 433
    return v2

    .line 434
    :goto_8
    monitor-exit v0
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_1

    .line 435
    throw p0
.end method

.method public H()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/biw;->d:Landroid/hardware/Camera;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v1, p0, Ll/biw;->k:Ll/xpl$a;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    new-instance v1, Ll/biw$b;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/biw$b;-><init>(Ll/biw;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/hardware/Camera;->setPreviewCallbackWithBuffer(Landroid/hardware/Camera$PreviewCallback;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object p0, p0, Ll/biw;->d:Landroid/hardware/Camera;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/hardware/Camera;->startPreview()V

    .line 20
    .line 21
    .line 22
    :cond_1
    return-void
.end method

.method public I(Ll/xpl$d;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/biw;->b:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iput-object p1, p0, Ll/biw;->l:Ll/xpl$d;

    .line 5
    .line 6
    monitor-exit v0

    .line 7
    return-void

    .line 8
    :catchall_0
    move-exception p0

    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    throw p0
.end method

.method public J(Ll/xpl$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/biw;->o:Ll/xpl$c;

    .line 2
    .line 3
    return-void
.end method

.method public K(Ll/xpl$a;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/biw;->b:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iput-object p1, p0, Ll/biw;->k:Ll/xpl$a;

    .line 5
    .line 6
    monitor-exit v0

    .line 7
    return-void

    .line 8
    :catchall_0
    move-exception p0

    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    throw p0
.end method

.method public L()V
    .locals 4

    .line 1
    const-string v0, "Camera pauseCamera failed !"

    .line 2
    .line 3
    iget-object v1, p0, Ll/biw;->b:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    :try_start_0
    iget-object p0, p0, Ll/biw;->d:Landroid/hardware/Camera;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    :try_start_1
    invoke-virtual {p0}, Landroid/hardware/Camera;->stopPreview()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :catchall_0
    move-exception p0

    .line 15
    :try_start_2
    const-string v2, "Camera"

    .line 16
    .line 17
    new-instance v3, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-static {v2, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :catchall_1
    move-exception p0

    .line 38
    goto :goto_1

    .line 39
    :cond_0
    :goto_0
    monitor-exit v1

    .line 40
    return-void

    .line 41
    :goto_1
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 42
    throw p0
.end method

.method public O(Landroid/graphics/SurfaceTexture;Ll/wje;)Z
    .locals 4
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0xe
    .end annotation

    .line 1
    const-string v0, "Camera start preview failed !"

    .line 2
    .line 3
    iput-object p1, p0, Ll/biw;->i:Landroid/graphics/SurfaceTexture;

    .line 4
    .line 5
    iput-object p2, p0, Ll/biw;->j:Ll/wje;

    .line 6
    .line 7
    iget-object p1, p0, Ll/biw;->d:Landroid/hardware/Camera;

    .line 8
    .line 9
    const/4 p2, 0x0

    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    const-string p0, "Camera"

    .line 13
    .line 14
    const-string p1, "Camera is NULL"

    .line 15
    .line 16
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return p2

    .line 20
    :cond_0
    iget-object v1, p0, Ll/biw;->k:Ll/xpl$a;

    .line 21
    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    new-instance v1, Ll/biw$a;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/biw$a;-><init>(Ll/biw;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1, v1}, Landroid/hardware/Camera;->setPreviewCallbackWithBuffer(Landroid/hardware/Camera$PreviewCallback;)V

    .line 30
    .line 31
    .line 32
    :cond_1
    iget-object p1, p0, Ll/biw;->b:Ljava/lang/Object;

    .line 33
    .line 34
    monitor-enter p1

    .line 35
    :try_start_0
    iget-object v1, p0, Ll/biw;->d:Landroid/hardware/Camera;

    .line 36
    .line 37
    iget-object v2, p0, Ll/biw;->i:Landroid/graphics/SurfaceTexture;

    .line 38
    .line 39
    invoke-virtual {v1, v2}, Landroid/hardware/Camera;->setPreviewTexture(Landroid/graphics/SurfaceTexture;)V

    .line 40
    .line 41
    .line 42
    iget-object v1, p0, Ll/biw;->d:Landroid/hardware/Camera;

    .line 43
    .line 44
    invoke-virtual {v1}, Landroid/hardware/Camera;->startPreview()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 45
    .line 46
    .line 47
    :try_start_1
    monitor-exit p1

    .line 48
    const/4 p0, 0x1

    .line 49
    return p0

    .line 50
    :catchall_0
    move-exception p0

    .line 51
    goto :goto_2

    .line 52
    :catch_0
    move-exception v0

    .line 53
    goto :goto_0

    .line 54
    :catch_1
    move-exception v1

    .line 55
    goto :goto_1

    .line 56
    :goto_0
    invoke-direct {p0, v0}, Ll/biw;->u(Ljava/lang/Exception;)V

    .line 57
    .line 58
    .line 59
    monitor-exit p1

    .line 60
    return p2

    .line 61
    :goto_1
    const-string v2, "Camera"

    .line 62
    .line 63
    new-instance v3, Ljava/lang/StringBuilder;

    .line 64
    .line 65
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-static {v2, v0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    invoke-direct {p0, v1}, Ll/biw;->u(Ljava/lang/Exception;)V

    .line 83
    .line 84
    .line 85
    monitor-exit p1

    .line 86
    return p2

    .line 87
    :goto_2
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 88
    throw p0
.end method

.method public a()I
    .locals 6

    .line 1
    const-string v0, "Camera stop preview failed !"

    .line 2
    .line 3
    const-string v1, "Camera stop preview failed !"

    .line 4
    .line 5
    iget-object v2, p0, Ll/biw;->l:Ll/xpl$d;

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    iget-object v4, p0, Ll/biw;->c:Ll/tow;

    .line 11
    .line 12
    iget-boolean v4, v4, Ll/tow;->r:Z

    .line 13
    .line 14
    if-nez v4, :cond_0

    .line 15
    .line 16
    invoke-interface {v2, v3}, Ll/xpl$d;->V(Landroid/hardware/Camera;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object v2, p0, Ll/biw;->b:Ljava/lang/Object;

    .line 20
    .line 21
    monitor-enter v2

    .line 22
    :try_start_0
    iget-object v4, p0, Ll/biw;->d:Landroid/hardware/Camera;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 23
    .line 24
    const/4 v5, 0x1

    .line 25
    if-eqz v4, :cond_4

    .line 26
    .line 27
    :try_start_1
    invoke-virtual {v4}, Landroid/hardware/Camera;->stopPreview()V

    .line 28
    .line 29
    .line 30
    iget-object v4, p0, Ll/biw;->d:Landroid/hardware/Camera;

    .line 31
    .line 32
    invoke-virtual {v4, v3}, Landroid/hardware/Camera;->setPreviewCallback(Landroid/hardware/Camera$PreviewCallback;)V

    .line 33
    .line 34
    .line 35
    iget-object v4, p0, Ll/biw;->d:Landroid/hardware/Camera;

    .line 36
    .line 37
    invoke-virtual {v4, v3}, Landroid/hardware/Camera;->setPreviewCallbackWithBuffer(Landroid/hardware/Camera$PreviewCallback;)V

    .line 38
    .line 39
    .line 40
    iget-object v4, p0, Ll/biw;->d:Landroid/hardware/Camera;

    .line 41
    .line 42
    invoke-virtual {v4}, Landroid/hardware/Camera;->release()V

    .line 43
    .line 44
    .line 45
    iget-object v4, p0, Ll/biw;->l:Ll/xpl$d;

    .line 46
    .line 47
    if-eqz v4, :cond_1

    .line 48
    .line 49
    invoke-interface {v4}, Ll/xpl$d;->G()V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :catchall_0
    move-exception v3

    .line 54
    goto :goto_1

    .line 55
    :cond_1
    :goto_0
    iput-object v3, p0, Ll/biw;->d:Landroid/hardware/Camera;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 56
    .line 57
    :try_start_2
    monitor-exit v2

    .line 58
    return v5

    .line 59
    :catchall_1
    move-exception p0

    .line 60
    goto :goto_2

    .line 61
    :goto_1
    const-string v4, "Camera"

    .line 62
    .line 63
    new-instance v5, Ljava/lang/StringBuilder;

    .line 64
    .line 65
    invoke-direct {v5, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v3}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-static {v4, v1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    iget-object v1, p0, Ll/biw;->o:Ll/xpl$c;

    .line 83
    .line 84
    if-eqz v1, :cond_2

    .line 85
    .line 86
    new-instance v4, Ljava/lang/StringBuilder;

    .line 87
    .line 88
    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v3}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    const/16 v3, 0xfa3

    .line 103
    .line 104
    invoke-interface {v1, v3, v0}, Ll/xpl$c;->onFail(ILjava/lang/String;)V

    .line 105
    .line 106
    .line 107
    :cond_2
    iget-object p0, p0, Ll/biw;->l:Ll/xpl$d;

    .line 108
    .line 109
    if-eqz p0, :cond_3

    .line 110
    .line 111
    invoke-interface {p0}, Ll/xpl$d;->G()V

    .line 112
    .line 113
    .line 114
    :cond_3
    monitor-exit v2

    .line 115
    const/4 p0, -0x1

    .line 116
    return p0

    .line 117
    :cond_4
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 118
    iget-object p0, p0, Ll/biw;->l:Ll/xpl$d;

    .line 119
    .line 120
    if-eqz p0, :cond_5

    .line 121
    .line 122
    invoke-interface {p0}, Ll/xpl$d;->G()V

    .line 123
    .line 124
    .line 125
    :cond_5
    return v5

    .line 126
    :goto_2
    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 127
    throw p0
.end method

.method public b(I)V
    .locals 5

    .line 1
    const-string v0, "Set camera zoom level error!"

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "level"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const-string v2, "Camera"

    .line 18
    .line 19
    invoke-static {v2, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const/16 v1, 0xfa5

    .line 23
    .line 24
    :try_start_0
    iget-object v3, p0, Ll/biw;->d:Landroid/hardware/Camera;

    .line 25
    .line 26
    invoke-virtual {v3}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    if-eqz v3, :cond_3

    .line 31
    .line 32
    iget-object v3, p0, Ll/biw;->d:Landroid/hardware/Camera;

    .line 33
    .line 34
    if-nez v3, :cond_0

    .line 35
    .line 36
    goto/16 :goto_2

    .line 37
    .line 38
    :cond_0
    invoke-virtual {v3}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    invoke-virtual {v3}, Landroid/hardware/Camera$Parameters;->getMaxZoom()I

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    if-lt p1, v3, :cond_1

    .line 47
    .line 48
    const/4 p1, 0x0

    .line 49
    :cond_1
    iget-object v3, p0, Ll/biw;->d:Landroid/hardware/Camera;

    .line 50
    .line 51
    invoke-virtual {v3}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    invoke-virtual {v3}, Landroid/hardware/Camera$Parameters;->isZoomSupported()Z

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    if-eqz v3, :cond_3

    .line 60
    .line 61
    iget-object v3, p0, Ll/biw;->d:Landroid/hardware/Camera;

    .line 62
    .line 63
    invoke-virtual {v3}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    invoke-virtual {v3, p1}, Landroid/hardware/Camera$Parameters;->setZoom(I)V

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Ll/biw;->d:Landroid/hardware/Camera;

    .line 71
    .line 72
    invoke-virtual {p1, v3}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :catch_0
    move-exception p1

    .line 77
    goto :goto_0

    .line 78
    :catch_1
    move-exception p1

    .line 79
    goto :goto_1

    .line 80
    :goto_0
    new-instance v3, Ljava/lang/StringBuilder;

    .line 81
    .line 82
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v4

    .line 89
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v3

    .line 96
    invoke-static {v2, v3}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    iget-object p0, p0, Ll/biw;->o:Ll/xpl$c;

    .line 100
    .line 101
    if-eqz p0, :cond_2

    .line 102
    .line 103
    new-instance v2, Ljava/lang/StringBuilder;

    .line 104
    .line 105
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-interface {p0, v1, v0}, Ll/xpl$c;->onFail(ILjava/lang/String;)V

    .line 120
    .line 121
    .line 122
    :cond_2
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 123
    .line 124
    .line 125
    goto :goto_2

    .line 126
    :goto_1
    new-instance v3, Ljava/lang/StringBuilder;

    .line 127
    .line 128
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v4

    .line 135
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v3

    .line 142
    invoke-static {v2, v3}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    iget-object p0, p0, Ll/biw;->o:Ll/xpl$c;

    .line 146
    .line 147
    if-eqz p0, :cond_3

    .line 148
    .line 149
    new-instance v2, Ljava/lang/StringBuilder;

    .line 150
    .line 151
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object p1

    .line 158
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    invoke-interface {p0, v1, p1}, Ll/xpl$c;->onFail(ILjava/lang/String;)V

    .line 166
    .line 167
    .line 168
    :cond_3
    :goto_2
    return-void
.end method

.method public c()I
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    iget-object v1, p0, Ll/biw;->d:Landroid/hardware/Camera;

    .line 3
    .line 4
    if-eqz v1, :cond_0

    .line 5
    .line 6
    invoke-virtual {v1}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    iget-object v1, p0, Ll/biw;->d:Landroid/hardware/Camera;

    .line 13
    .line 14
    invoke-virtual {v1}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v1}, Landroid/hardware/Camera$Parameters;->getMaxZoom()I

    .line 19
    .line 20
    .line 21
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    add-int/lit8 p0, p0, -0x1

    .line 23
    .line 24
    return p0

    .line 25
    :catch_0
    move-exception v1

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    return v0

    .line 28
    :goto_0
    iget-object p0, p0, Ll/biw;->o:Ll/xpl$c;

    .line 29
    .line 30
    if-eqz p0, :cond_1

    .line 31
    .line 32
    new-instance v2, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    const-string v3, "Get camera max support zoom level error!"

    .line 35
    .line 36
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    const/16 v3, 0xfa7

    .line 51
    .line 52
    invoke-interface {p0, v3, v2}, Ll/xpl$c;->onFail(ILjava/lang/String;)V

    .line 53
    .line 54
    .line 55
    :cond_1
    const-string p0, "Camera"

    .line 56
    .line 57
    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-static {p0, v1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    return v0
.end method

.method public d()I
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    iget-object v1, p0, Ll/biw;->d:Landroid/hardware/Camera;

    .line 3
    .line 4
    invoke-virtual {v1}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    iget-object v1, p0, Ll/biw;->d:Landroid/hardware/Camera;

    .line 11
    .line 12
    invoke-virtual {v1}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v1}, Landroid/hardware/Camera$Parameters;->getZoom()I

    .line 17
    .line 18
    .line 19
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    return p0

    .line 21
    :catch_0
    move-exception v1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return v0

    .line 24
    :goto_0
    iget-object p0, p0, Ll/biw;->o:Ll/xpl$c;

    .line 25
    .line 26
    if-eqz p0, :cond_1

    .line 27
    .line 28
    new-instance v2, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    const-string v3, "Get camera current zoom level error!"

    .line 31
    .line 32
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    const/16 v3, 0xfa7

    .line 47
    .line 48
    invoke-interface {p0, v3, v2}, Ll/xpl$c;->onFail(ILjava/lang/String;)V

    .line 49
    .line 50
    .line 51
    :cond_1
    const-string p0, "Camera"

    .line 52
    .line 53
    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-static {p0, v1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    return v0
.end method

.method public e(Landroid/hardware/Camera$ErrorCallback;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/biw;->d:Landroid/hardware/Camera;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/hardware/Camera;->setErrorCallback(Landroid/hardware/Camera$ErrorCallback;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public g()I
    .locals 4

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/biw;->d:Landroid/hardware/Camera;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getMinExposureCompensation()I

    .line 10
    .line 11
    .line 12
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    return p0

    .line 14
    :catch_0
    move-exception v0

    .line 15
    iget-object p0, p0, Ll/biw;->o:Ll/xpl$c;

    .line 16
    .line 17
    const-string v1, "Get camera Min Exposure Compensation error!"

    .line 18
    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    new-instance v2, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    const/16 v3, 0xfa7

    .line 38
    .line 39
    invoke-interface {p0, v3, v2}, Ll/xpl$c;->onFail(ILjava/lang/String;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    const-string v0, "Camera"

    .line 59
    .line 60
    invoke-static {v0, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    :cond_1
    const/4 p0, 0x0

    .line 64
    return p0
.end method

.method public h()I
    .locals 4

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/biw;->d:Landroid/hardware/Camera;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getMaxExposureCompensation()I

    .line 10
    .line 11
    .line 12
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    return p0

    .line 14
    :catch_0
    move-exception v0

    .line 15
    iget-object p0, p0, Ll/biw;->o:Ll/xpl$c;

    .line 16
    .line 17
    const-string v1, "Get camera Max Exposure Compensation error!"

    .line 18
    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    new-instance v2, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    const/16 v3, 0xfa7

    .line 38
    .line 39
    invoke-interface {p0, v3, v2}, Ll/xpl$c;->onFail(ILjava/lang/String;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    const-string v0, "Camera"

    .line 59
    .line 60
    invoke-static {v0, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    :cond_1
    const/4 p0, 0x0

    .line 64
    return p0
.end method

.method public i()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/biw;->n:Z

    .line 2
    .line 3
    return p0
.end method

.method public j(Landroid/graphics/SurfaceTexture;)Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/biw;->O(Landroid/graphics/SurfaceTexture;Ll/wje;)Z

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    return p0
.end method

.method public k(Landroid/graphics/Rect;Landroid/hardware/Camera$AutoFocusCallback;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/biw;->A(Landroid/graphics/Rect;Landroid/hardware/Camera$AutoFocusCallback;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Ll/biw;->N(Landroid/graphics/Rect;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public m()I
    .locals 0

    .line 1
    iget p0, p0, Ll/biw;->f:I

    .line 2
    .line 3
    mul-int/lit8 p0, p0, 0x5a

    .line 4
    .line 5
    return p0
.end method

.method public r(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/biw;->d:Landroid/hardware/Camera;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string p0, "Camera"

    .line 6
    .line 7
    const-string p1, "\u8bf7\u5148\u6253\u5f00Camera!"

    .line 8
    .line 9
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget v0, p0, Ll/biw;->h:I

    .line 14
    .line 15
    invoke-static {p1, v0}, Lcom/core/glcore/util/CameraHelper;->determineDisplayOrientation(II)I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    iput p1, p0, Ll/biw;->e:I

    .line 20
    .line 21
    sget-object v0, Lcom/core/glcore/config/Rotation;->NORMAL:Lcom/core/glcore/config/Rotation;

    .line 22
    .line 23
    const/16 v1, 0x5a

    .line 24
    .line 25
    if-eq p1, v1, :cond_3

    .line 26
    .line 27
    const/16 v1, 0xb4

    .line 28
    .line 29
    if-eq p1, v1, :cond_2

    .line 30
    .line 31
    const/16 v1, 0x10e

    .line 32
    .line 33
    if-eq p1, v1, :cond_1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    sget-object v0, Lcom/core/glcore/config/Rotation;->ROTATION_270:Lcom/core/glcore/config/Rotation;

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_2
    sget-object v0, Lcom/core/glcore/config/Rotation;->ROTATION_180:Lcom/core/glcore/config/Rotation;

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_3
    sget-object v0, Lcom/core/glcore/config/Rotation;->ROTATION_90:Lcom/core/glcore/config/Rotation;

    .line 43
    .line 44
    :goto_0
    iget p1, p0, Ll/biw;->h:I

    .line 45
    .line 46
    const/4 v1, 0x1

    .line 47
    if-ne p1, v1, :cond_4

    .line 48
    .line 49
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    sget-object v0, Lcom/core/glcore/config/Rotation;->ROTATION_270:Lcom/core/glcore/config/Rotation;

    .line 54
    .line 55
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    add-int/2addr v0, v1

    .line 60
    rem-int/2addr p1, v0

    .line 61
    goto :goto_1

    .line 62
    :cond_4
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    sget-object v0, Lcom/core/glcore/config/Rotation;->ROTATION_270:Lcom/core/glcore/config/Rotation;

    .line 67
    .line 68
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    add-int/2addr v0, v1

    .line 73
    rem-int/2addr p1, v0

    .line 74
    :goto_1
    iput p1, p0, Ll/biw;->f:I

    .line 75
    .line 76
    iget-object p1, p0, Ll/biw;->d:Landroid/hardware/Camera;

    .line 77
    .line 78
    iget p0, p0, Ll/biw;->e:I

    .line 79
    .line 80
    invoke-virtual {p1, p0}, Landroid/hardware/Camera;->setDisplayOrientation(I)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public release()V
    .locals 3
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x8
    .end annotation

    .line 1
    iget-object v0, p0, Ll/biw;->b:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/biw;->d:Landroid/hardware/Camera;

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v1, v2}, Landroid/hardware/Camera;->setPreviewCallback(Landroid/hardware/Camera$PreviewCallback;)V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Ll/biw;->d:Landroid/hardware/Camera;

    .line 13
    .line 14
    invoke-virtual {v1, v2}, Landroid/hardware/Camera;->setPreviewCallbackWithBuffer(Landroid/hardware/Camera$PreviewCallback;)V

    .line 15
    .line 16
    .line 17
    iget-object v1, p0, Ll/biw;->d:Landroid/hardware/Camera;

    .line 18
    .line 19
    invoke-virtual {v1}, Landroid/hardware/Camera;->release()V

    .line 20
    .line 21
    .line 22
    iput-object v2, p0, Ll/biw;->d:Landroid/hardware/Camera;

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :catchall_0
    move-exception p0

    .line 26
    goto :goto_1

    .line 27
    :cond_0
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    iput-object v2, p0, Ll/biw;->j:Ll/wje;

    .line 29
    .line 30
    invoke-static {}, Ll/biw;->s()V

    .line 31
    .line 32
    .line 33
    const/4 p0, 0x0

    .line 34
    sput-boolean p0, Ll/biw;->q:Z

    .line 35
    .line 36
    return-void

    .line 37
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 38
    throw p0
.end method

.method public setExposureCompensation(I)V
    .locals 3

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/biw;->d:Landroid/hardware/Camera;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Ll/biw;->h()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-le p1, v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/biw;->h()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    goto :goto_0

    .line 20
    :catch_0
    move-exception p1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    invoke-virtual {p0}, Ll/biw;->g()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-ge p1, v1, :cond_1

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/biw;->g()I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    :cond_1
    invoke-virtual {v0, p1}, Landroid/hardware/Camera$Parameters;->setExposureCompensation(I)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Ll/biw;->d:Landroid/hardware/Camera;

    .line 36
    .line 37
    invoke-virtual {p1, v0}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    .line 39
    .line 40
    :cond_2
    return-void

    .line 41
    :goto_1
    iget-object p0, p0, Ll/biw;->o:Ll/xpl$c;

    .line 42
    .line 43
    const-string v0, "Set camera Exposure Compensation error!"

    .line 44
    .line 45
    if-eqz p0, :cond_3

    .line 46
    .line 47
    new-instance v1, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    const/16 v2, 0xfa5

    .line 64
    .line 65
    invoke-interface {p0, v2, v1}, Ll/xpl$c;->onFail(ILjava/lang/String;)V

    .line 66
    .line 67
    .line 68
    :cond_3
    new-instance p0, Ljava/lang/StringBuilder;

    .line 69
    .line 70
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    const-string p1, "Camera"

    .line 85
    .line 86
    invoke-static {p1, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    return-void
.end method
