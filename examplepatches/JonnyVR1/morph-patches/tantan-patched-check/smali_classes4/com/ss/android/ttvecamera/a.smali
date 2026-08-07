.class public Lcom/ss/android/ttvecamera/a;
.super Lcom/ss/android/ttvecamera/c;
.source "SourceFile"


# instance fields
.field private A:Ll/nrh0;

.field private B:Ljava/lang/String;

.field private C:I

.field private D:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/ss/android/ttvecamera/TEFrameSizei;",
            ">;"
        }
    .end annotation
.end field

.field private E:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/ss/android/ttvecamera/TEFrameSizei;",
            ">;"
        }
    .end annotation
.end field

.field private F:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/ss/android/ttvecamera/TEFrameSizei;",
            ">;"
        }
    .end annotation
.end field

.field private G:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private H:F

.field private I:I

.field private J:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private K:J

.field private L:I

.field private M:Z

.field y:Landroid/hardware/Camera;

.field private z:Landroid/hardware/Camera$Parameters;


# direct methods
.method private constructor <init>(Landroid/content/Context;Lcom/ss/android/ttvecamera/c$a;Landroid/os/Handler;Lcom/ss/android/ttvecamera/c$d;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/ss/android/ttvecamera/c;-><init>(Landroid/content/Context;Lcom/ss/android/ttvecamera/c$a;Landroid/os/Handler;Lcom/ss/android/ttvecamera/c$d;)V

    .line 2
    .line 3
    .line 4
    const-string p2, ""

    .line 5
    .line 6
    iput-object p2, p0, Lcom/ss/android/ttvecamera/a;->B:Ljava/lang/String;

    .line 7
    .line 8
    const/4 p2, 0x0

    .line 9
    iput p2, p0, Lcom/ss/android/ttvecamera/a;->C:I

    .line 10
    .line 11
    new-instance p3, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p3, p0, Lcom/ss/android/ttvecamera/a;->D:Ljava/util/List;

    .line 17
    .line 18
    new-instance p3, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object p3, p0, Lcom/ss/android/ttvecamera/a;->E:Ljava/util/List;

    .line 24
    .line 25
    new-instance p3, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object p3, p0, Lcom/ss/android/ttvecamera/a;->F:Ljava/util/List;

    .line 31
    .line 32
    const/4 p3, 0x0

    .line 33
    iput-object p3, p0, Lcom/ss/android/ttvecamera/a;->G:Ljava/util/List;

    .line 34
    .line 35
    const/high16 p4, 0x42c80000    # 100.0f

    .line 36
    .line 37
    iput p4, p0, Lcom/ss/android/ttvecamera/a;->H:F

    .line 38
    .line 39
    iput p2, p0, Lcom/ss/android/ttvecamera/a;->I:I

    .line 40
    .line 41
    new-instance p4, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 42
    .line 43
    invoke-direct {p4, p2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 44
    .line 45
    .line 46
    iput-object p4, p0, Lcom/ss/android/ttvecamera/a;->J:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 47
    .line 48
    const-wide/16 v0, 0x0

    .line 49
    .line 50
    iput-wide v0, p0, Lcom/ss/android/ttvecamera/a;->K:J

    .line 51
    .line 52
    iput p2, p0, Lcom/ss/android/ttvecamera/a;->L:I

    .line 53
    .line 54
    iput-boolean p2, p0, Lcom/ss/android/ttvecamera/a;->M:Z

    .line 55
    .line 56
    new-instance p2, Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 57
    .line 58
    const/4 p4, 0x1

    .line 59
    invoke-direct {p2, p1, p4}, Lcom/ss/android/ttvecamera/TECameraSettings;-><init>(Landroid/content/Context;I)V

    .line 60
    .line 61
    .line 62
    iput-object p2, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 63
    .line 64
    new-instance p1, Ll/nrh0;

    .line 65
    .line 66
    invoke-direct {p1, p4}, Ll/nrh0;-><init>(I)V

    .line 67
    .line 68
    .line 69
    iput-object p1, p0, Lcom/ss/android/ttvecamera/a;->A:Ll/nrh0;

    .line 70
    .line 71
    iput-object p3, p0, Lcom/ss/android/ttvecamera/c;->t:Lcom/bytedance/bpea/basics/Cert;

    .line 72
    .line 73
    return-void
.end method

.method public static synthetic I0(Lcom/ss/android/ttvecamera/a;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/android/ttvecamera/a;->L:I

    .line 2
    .line 3
    return p0
.end method

.method private J0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 2
    .line 3
    iget-boolean v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->Z:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    :try_start_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {v0, v1}, Landroid/hardware/Camera$Parameters;->setRecordingHint(Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :catch_0
    move-exception p0

    .line 22
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method private K0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 2
    .line 3
    iget-boolean v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->Z:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    :try_start_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-virtual {v0, v1}, Landroid/hardware/Camera$Parameters;->setRecordingHint(Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :catch_0
    move-exception p0

    .line 22
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public static L0(Ljava/util/List;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "[I>;)",
            "Ljava/util/List<",
            "Lcom/ss/android/ttvecamera/TEFrameRateRange;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 8
    .line 9
    .line 10
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, [I

    .line 25
    .line 26
    new-instance v2, Lcom/ss/android/ttvecamera/TEFrameRateRange;

    .line 27
    .line 28
    const/4 v3, 0x0

    .line 29
    aget v3, v1, v3

    .line 30
    .line 31
    const/4 v4, 0x1

    .line 32
    aget v1, v1, v4

    .line 33
    .line 34
    invoke-direct {v2, v3, v1}, Lcom/ss/android/ttvecamera/TEFrameRateRange;-><init>(II)V

    .line 35
    .line 36
    .line 37
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    return-object v0
.end method

.method public static M0(Ljava/util/List;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/hardware/Camera$Size;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/ss/android/ttvecamera/TEFrameSizei;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 8
    .line 9
    .line 10
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Landroid/hardware/Camera$Size;

    .line 25
    .line 26
    new-instance v2, Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 27
    .line 28
    iget v3, v1, Landroid/hardware/Camera$Size;->width:I

    .line 29
    .line 30
    iget v1, v1, Landroid/hardware/Camera$Size;->height:I

    .line 31
    .line 32
    invoke-direct {v2, v3, v1}, Lcom/ss/android/ttvecamera/TEFrameSizei;-><init>(II)V

    .line 33
    .line 34
    .line 35
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    return-object v0
.end method

.method public static N0(Landroid/content/Context;Lcom/ss/android/ttvecamera/c$a;Landroid/os/Handler;Lcom/ss/android/ttvecamera/c$d;)Lcom/ss/android/ttvecamera/a;
    .locals 1

    .line 1
    new-instance v0, Lcom/ss/android/ttvecamera/a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Lcom/ss/android/ttvecamera/a;-><init>(Landroid/content/Context;Lcom/ss/android/ttvecamera/c$a;Landroid/os/Handler;Lcom/ss/android/ttvecamera/c$d;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method private O0(I)I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->G:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    sub-int/2addr v0, v1

    .line 9
    const/4 v2, 0x0

    .line 10
    :goto_0
    sub-int v3, v0, v2

    .line 11
    .line 12
    iget-object v4, p0, Lcom/ss/android/ttvecamera/a;->G:Ljava/util/List;

    .line 13
    .line 14
    if-le v3, v1, :cond_1

    .line 15
    .line 16
    add-int v3, v2, v0

    .line 17
    .line 18
    div-int/lit8 v3, v3, 0x2

    .line 19
    .line 20
    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v4

    .line 24
    check-cast v4, Ljava/lang/Integer;

    .line 25
    .line 26
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 27
    .line 28
    .line 29
    move-result v4

    .line 30
    if-le p1, v4, :cond_0

    .line 31
    .line 32
    move v2, v3

    .line 33
    goto :goto_0

    .line 34
    :cond_0
    move v0, v3

    .line 35
    goto :goto_0

    .line 36
    :cond_1
    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    check-cast v1, Ljava/lang/Integer;

    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    sub-int v1, p1, v1

    .line 47
    .line 48
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    iget-object p0, p0, Lcom/ss/android/ttvecamera/a;->G:Ljava/util/List;

    .line 53
    .line 54
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    check-cast p0, Ljava/lang/Integer;

    .line 59
    .line 60
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    sub-int/2addr p1, p0

    .line 65
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    if-le v1, p0, :cond_2

    .line 70
    .line 71
    return v0

    .line 72
    :cond_2
    return v2
.end method

.method private P0()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/ss/android/ttvecamera/TEFrameRateRange;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewFpsRange()Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Lcom/ss/android/ttvecamera/a;->L0(Ljava/util/List;)Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method private Q0()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/ss/android/ttvecamera/TEFrameSizei;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getSupportedVideoSizes()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getSupportedVideoSizes()Ljava/util/List;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {v0}, Lcom/ss/android/ttvecamera/a;->M0(Ljava/util/List;)Ljava/util/List;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iput-object v0, p0, Lcom/ss/android/ttvecamera/a;->F:Ljava/util/List;

    .line 23
    .line 24
    return-object v0

    .line 25
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->F:Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/ss/android/ttvecamera/a;->F:Ljava/util/List;

    .line 31
    .line 32
    return-object p0
.end method

.method private R0()I
    .locals 12

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 2
    .line 3
    const-string v1, "TECamera1"

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    const-string v0, "initCamera: Camera is not opened!"

    .line 9
    .line 10
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 16
    .line 17
    const/16 v3, -0x191

    .line 18
    .line 19
    invoke-interface {v1, v2, v3, v0, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    return v3

    .line 23
    :cond_0
    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 28
    .line 29
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewFpsRange()Ljava/util/List;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object v3, p0, Lcom/ss/android/ttvecamera/c;->p:Lcom/ss/android/ttvecamera/c$b;

    .line 34
    .line 35
    const/4 v4, 0x0

    .line 36
    const/4 v5, 0x0

    .line 37
    if-eqz v3, :cond_5

    .line 38
    .line 39
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    new-instance v6, Ljava/util/ArrayList;

    .line 44
    .line 45
    invoke-direct {v6, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 46
    .line 47
    .line 48
    move v8, v2

    .line 49
    move v7, v5

    .line 50
    :goto_0
    const/16 v9, 0x3e8

    .line 51
    .line 52
    if-ge v7, v3, :cond_4

    .line 53
    .line 54
    invoke-interface {v0, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v8

    .line 58
    check-cast v8, [I

    .line 59
    .line 60
    aget v10, v8, v5

    .line 61
    .line 62
    if-lt v10, v9, :cond_1

    .line 63
    .line 64
    move v11, v2

    .line 65
    goto :goto_1

    .line 66
    :cond_1
    move v11, v5

    .line 67
    :goto_1
    if-lt v10, v9, :cond_2

    .line 68
    .line 69
    div-int/lit16 v10, v10, 0x3e8

    .line 70
    .line 71
    :cond_2
    aget v8, v8, v2

    .line 72
    .line 73
    if-lt v8, v9, :cond_3

    .line 74
    .line 75
    div-int/lit16 v8, v8, 0x3e8

    .line 76
    .line 77
    :cond_3
    filled-new-array {v10, v8}, [I

    .line 78
    .line 79
    .line 80
    move-result-object v8

    .line 81
    invoke-interface {v6, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    add-int/lit8 v7, v7, 0x1

    .line 85
    .line 86
    move v8, v11

    .line 87
    goto :goto_0

    .line 88
    :cond_4
    iget-object v3, p0, Lcom/ss/android/ttvecamera/c;->p:Lcom/ss/android/ttvecamera/c$b;

    .line 89
    .line 90
    invoke-interface {v3, v6}, Lcom/ss/android/ttvecamera/c$b;->a(Ljava/util/List;)[I

    .line 91
    .line 92
    .line 93
    move-result-object v3

    .line 94
    if-eqz v8, :cond_6

    .line 95
    .line 96
    if-eqz v3, :cond_6

    .line 97
    .line 98
    aget v6, v3, v5

    .line 99
    .line 100
    mul-int/2addr v6, v9

    .line 101
    aput v6, v3, v5

    .line 102
    .line 103
    aget v6, v3, v2

    .line 104
    .line 105
    mul-int/2addr v6, v9

    .line 106
    aput v6, v3, v2

    .line 107
    .line 108
    goto :goto_2

    .line 109
    :cond_5
    move-object v3, v4

    .line 110
    :cond_6
    :goto_2
    if-nez v3, :cond_7

    .line 111
    .line 112
    invoke-static {v0}, Lcom/ss/android/ttvecamera/TEFrameRateRange;->a(Ljava/util/List;)I

    .line 113
    .line 114
    .line 115
    move-result v3

    .line 116
    iget-object v6, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 117
    .line 118
    iget v7, v6, Lcom/ss/android/ttvecamera/TECameraSettings;->O:I

    .line 119
    .line 120
    iget v8, v6, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 121
    .line 122
    iget-object v6, v6, Lcom/ss/android/ttvecamera/TECameraSettings;->c:Lcom/ss/android/ttvecamera/TEFrameRateRange;

    .line 123
    .line 124
    invoke-virtual {v6, v3}, Lcom/ss/android/ttvecamera/TEFrameRateRange;->c(I)[I

    .line 125
    .line 126
    .line 127
    move-result-object v3

    .line 128
    invoke-static {v7, v8, v3, v0}, Lcom/ss/android/ttvecamera/f;->s(II[ILjava/util/List;)[I

    .line 129
    .line 130
    .line 131
    move-result-object v3

    .line 132
    if-nez v3, :cond_7

    .line 133
    .line 134
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 135
    .line 136
    .line 137
    move-result v6

    .line 138
    if-lez v6, :cond_7

    .line 139
    .line 140
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 141
    .line 142
    .line 143
    move-result v3

    .line 144
    sub-int/2addr v3, v2

    .line 145
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    move-object v3, v0

    .line 150
    check-cast v3, [I

    .line 151
    .line 152
    :cond_7
    if-eqz v3, :cond_1f

    .line 153
    .line 154
    new-instance v0, Ljava/lang/StringBuilder;

    .line 155
    .line 156
    const-string v6, "Selected FPS Range: "

    .line 157
    .line 158
    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    aget v6, v3, v5

    .line 162
    .line 163
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 164
    .line 165
    .line 166
    const-string v6, ","

    .line 167
    .line 168
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 169
    .line 170
    .line 171
    aget v6, v3, v2

    .line 172
    .line 173
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 181
    .line 182
    .line 183
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 184
    .line 185
    new-instance v6, Lcom/ss/android/ttvecamera/TEFrameRateRange;

    .line 186
    .line 187
    aget v7, v3, v5

    .line 188
    .line 189
    aget v8, v3, v2

    .line 190
    .line 191
    invoke-direct {v6, v7, v8}, Lcom/ss/android/ttvecamera/TEFrameRateRange;-><init>(II)V

    .line 192
    .line 193
    .line 194
    invoke-virtual {v6}, Lcom/ss/android/ttvecamera/TEFrameRateRange;->toString()Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v6

    .line 198
    const/16 v7, 0x79

    .line 199
    .line 200
    invoke-interface {v0, v7, v5, v6, v4}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 201
    .line 202
    .line 203
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->o:Lcom/ss/android/ttvecamera/c$e;

    .line 204
    .line 205
    if-eqz v0, :cond_9

    .line 206
    .line 207
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/a;->O()Ljava/util/List;

    .line 208
    .line 209
    .line 210
    move-result-object v6

    .line 211
    invoke-interface {v0, v6}, Lcom/ss/android/ttvecamera/c$e;->getPreviewSize(Ljava/util/List;)Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 212
    .line 213
    .line 214
    move-result-object v0

    .line 215
    iget-object v6, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 216
    .line 217
    if-eqz v0, :cond_8

    .line 218
    .line 219
    iput-object v0, v6, Lcom/ss/android/ttvecamera/TECameraSettings;->q:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 220
    .line 221
    goto :goto_3

    .line 222
    :cond_8
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/a;->O()Ljava/util/List;

    .line 223
    .line 224
    .line 225
    move-result-object v0

    .line 226
    iget-object v7, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 227
    .line 228
    iget-object v7, v7, Lcom/ss/android/ttvecamera/TECameraSettings;->q:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 229
    .line 230
    invoke-static {v0, v7}, Lcom/ss/android/ttvecamera/f;->b(Ljava/util/List;Lcom/ss/android/ttvecamera/TEFrameSizei;)Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 231
    .line 232
    .line 233
    move-result-object v0

    .line 234
    iput-object v0, v6, Lcom/ss/android/ttvecamera/TECameraSettings;->q:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 235
    .line 236
    goto :goto_3

    .line 237
    :cond_9
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 238
    .line 239
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/a;->O()Ljava/util/List;

    .line 240
    .line 241
    .line 242
    move-result-object v6

    .line 243
    iget-object v7, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 244
    .line 245
    iget-object v7, v7, Lcom/ss/android/ttvecamera/TECameraSettings;->q:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 246
    .line 247
    invoke-static {v6, v7}, Lcom/ss/android/ttvecamera/f;->b(Ljava/util/List;Lcom/ss/android/ttvecamera/TEFrameSizei;)Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 248
    .line 249
    .line 250
    move-result-object v6

    .line 251
    iput-object v6, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->q:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 252
    .line 253
    :goto_3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 254
    .line 255
    const-string v6, "Preview Size:"

    .line 256
    .line 257
    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 258
    .line 259
    .line 260
    iget-object v6, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 261
    .line 262
    iget-object v6, v6, Lcom/ss/android/ttvecamera/TECameraSettings;->q:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 263
    .line 264
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 265
    .line 266
    .line 267
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 268
    .line 269
    .line 270
    move-result-object v0

    .line 271
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 272
    .line 273
    .line 274
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 275
    .line 276
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getSupportedPictureFormats()Ljava/util/List;

    .line 277
    .line 278
    .line 279
    move-result-object v0

    .line 280
    iget-object v6, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 281
    .line 282
    iget-boolean v6, v6, Lcom/ss/android/ttvecamera/TECameraSettings;->q0:Z

    .line 283
    .line 284
    const/16 v7, 0x100

    .line 285
    .line 286
    const/16 v8, 0x11

    .line 287
    .line 288
    if-eqz v6, :cond_a

    .line 289
    .line 290
    if-eqz v0, :cond_a

    .line 291
    .line 292
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 293
    .line 294
    .line 295
    move-result-object v6

    .line 296
    invoke-interface {v0, v6}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 297
    .line 298
    .line 299
    move-result v0

    .line 300
    if-eqz v0, :cond_a

    .line 301
    .line 302
    move v0, v8

    .line 303
    goto :goto_4

    .line 304
    :cond_a
    move v0, v7

    .line 305
    :goto_4
    iget-object v6, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 306
    .line 307
    invoke-virtual {v6, v0}, Landroid/hardware/Camera$Parameters;->setPictureFormat(I)V

    .line 308
    .line 309
    .line 310
    if-ne v0, v7, :cond_b

    .line 311
    .line 312
    iget-object v6, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 313
    .line 314
    const/16 v7, 0x64

    .line 315
    .line 316
    invoke-virtual {v6, v7}, Landroid/hardware/Camera$Parameters;->setJpegQuality(I)V

    .line 317
    .line 318
    .line 319
    :cond_b
    iget-object v6, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 320
    .line 321
    iget-boolean v7, v6, Lcom/ss/android/ttvecamera/TECameraSettings;->z:Z

    .line 322
    .line 323
    if-eqz v7, :cond_c

    .line 324
    .line 325
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 326
    .line 327
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getSupportedPictureSizes()Ljava/util/List;

    .line 328
    .line 329
    .line 330
    move-result-object v0

    .line 331
    invoke-static {v0}, Lcom/ss/android/ttvecamera/a;->M0(Ljava/util/List;)Ljava/util/List;

    .line 332
    .line 333
    .line 334
    move-result-object v0

    .line 335
    iget-object v7, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 336
    .line 337
    invoke-virtual {v7}, Lcom/ss/android/ttvecamera/TECameraSettings;->a()Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 338
    .line 339
    .line 340
    move-result-object v7

    .line 341
    iget-object v8, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 342
    .line 343
    iget v9, v8, Lcom/ss/android/ttvecamera/TECameraSettings;->u:I

    .line 344
    .line 345
    iget v8, v8, Lcom/ss/android/ttvecamera/TECameraSettings;->y:F

    .line 346
    .line 347
    invoke-static {v0, v7, v9, v8}, Lcom/ss/android/ttvecamera/f;->o(Ljava/util/List;Lcom/ss/android/ttvecamera/TEFrameSizei;IF)Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 348
    .line 349
    .line 350
    move-result-object v0

    .line 351
    iput-object v0, v6, Lcom/ss/android/ttvecamera/TECameraSettings;->r:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 352
    .line 353
    goto/16 :goto_7

    .line 354
    .line 355
    :cond_c
    iget-object v6, p0, Lcom/ss/android/ttvecamera/c;->n:Lcom/ss/android/ttvecamera/c$d;

    .line 356
    .line 357
    if-eqz v6, :cond_11

    .line 358
    .line 359
    iget-object v6, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 360
    .line 361
    invoke-virtual {v6}, Landroid/hardware/Camera$Parameters;->getSupportedPictureSizes()Ljava/util/List;

    .line 362
    .line 363
    .line 364
    move-result-object v6

    .line 365
    invoke-static {v6}, Lcom/ss/android/ttvecamera/a;->M0(Ljava/util/List;)Ljava/util/List;

    .line 366
    .line 367
    .line 368
    move-result-object v6

    .line 369
    new-instance v7, Ljava/util/ArrayList;

    .line 370
    .line 371
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 372
    .line 373
    .line 374
    if-ne v0, v8, :cond_f

    .line 375
    .line 376
    if-eqz v6, :cond_f

    .line 377
    .line 378
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 379
    .line 380
    .line 381
    move-result-object v0

    .line 382
    :cond_d
    :goto_5
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 383
    .line 384
    .line 385
    move-result v8

    .line 386
    if-eqz v8, :cond_e

    .line 387
    .line 388
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 389
    .line 390
    .line 391
    move-result-object v8

    .line 392
    check-cast v8, Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 393
    .line 394
    iget v9, v8, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 395
    .line 396
    rem-int/lit8 v9, v9, 0x10

    .line 397
    .line 398
    if-nez v9, :cond_d

    .line 399
    .line 400
    iget v9, v8, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 401
    .line 402
    rem-int/lit8 v9, v9, 0x10

    .line 403
    .line 404
    if-nez v9, :cond_d

    .line 405
    .line 406
    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 407
    .line 408
    .line 409
    goto :goto_5

    .line 410
    :cond_e
    invoke-interface {v7}, Ljava/util/List;->isEmpty()Z

    .line 411
    .line 412
    .line 413
    move-result v0

    .line 414
    if-eqz v0, :cond_f

    .line 415
    .line 416
    const-string v0, "final pic sizes is empty..."

    .line 417
    .line 418
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 419
    .line 420
    .line 421
    :cond_f
    invoke-interface {v7}, Ljava/util/List;->isEmpty()Z

    .line 422
    .line 423
    .line 424
    move-result v0

    .line 425
    if-eqz v0, :cond_10

    .line 426
    .line 427
    invoke-interface {v7, v6}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 428
    .line 429
    .line 430
    :cond_10
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->n:Lcom/ss/android/ttvecamera/c$d;

    .line 431
    .line 432
    iget-object v6, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 433
    .line 434
    invoke-virtual {v6}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewSizes()Ljava/util/List;

    .line 435
    .line 436
    .line 437
    move-result-object v6

    .line 438
    invoke-static {v6}, Lcom/ss/android/ttvecamera/a;->M0(Ljava/util/List;)Ljava/util/List;

    .line 439
    .line 440
    .line 441
    move-result-object v6

    .line 442
    invoke-interface {v0, v7, v6}, Lcom/ss/android/ttvecamera/c$d;->a(Ljava/util/List;Ljava/util/List;)Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 443
    .line 444
    .line 445
    move-result-object v0

    .line 446
    goto :goto_6

    .line 447
    :cond_11
    move-object v0, v4

    .line 448
    :goto_6
    iget-object v6, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 449
    .line 450
    if-eqz v0, :cond_12

    .line 451
    .line 452
    iput-object v0, v6, Lcom/ss/android/ttvecamera/TECameraSettings;->r:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 453
    .line 454
    goto :goto_7

    .line 455
    :cond_12
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/a;->N()Ljava/util/List;

    .line 456
    .line 457
    .line 458
    move-result-object v0

    .line 459
    iget-object v7, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 460
    .line 461
    iget-object v8, v7, Lcom/ss/android/ttvecamera/TECameraSettings;->q:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 462
    .line 463
    iget-object v7, v7, Lcom/ss/android/ttvecamera/TECameraSettings;->r:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 464
    .line 465
    invoke-static {v0, v8, v7}, Lcom/ss/android/ttvecamera/f;->p(Ljava/util/List;Lcom/ss/android/ttvecamera/TEFrameSizei;Lcom/ss/android/ttvecamera/TEFrameSizei;)Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 466
    .line 467
    .line 468
    move-result-object v0

    .line 469
    iput-object v0, v6, Lcom/ss/android/ttvecamera/TECameraSettings;->r:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 470
    .line 471
    :goto_7
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 472
    .line 473
    iget-object v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->r:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 474
    .line 475
    if-eqz v0, :cond_13

    .line 476
    .line 477
    iget-object v6, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 478
    .line 479
    iget v7, v0, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 480
    .line 481
    iget v0, v0, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 482
    .line 483
    invoke-virtual {v6, v7, v0}, Landroid/hardware/Camera$Parameters;->setPictureSize(II)V

    .line 484
    .line 485
    .line 486
    new-instance v0, Ljava/lang/StringBuilder;

    .line 487
    .line 488
    const-string v6, "Picture Size:"

    .line 489
    .line 490
    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 491
    .line 492
    .line 493
    iget-object v6, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 494
    .line 495
    iget-object v6, v6, Lcom/ss/android/ttvecamera/TECameraSettings;->r:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 496
    .line 497
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 498
    .line 499
    .line 500
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 501
    .line 502
    .line 503
    move-result-object v0

    .line 504
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 505
    .line 506
    .line 507
    goto :goto_8

    .line 508
    :cond_13
    const-string v0, "No closest supported picture size"

    .line 509
    .line 510
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 511
    .line 512
    .line 513
    :goto_8
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 514
    .line 515
    iget-object v6, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 516
    .line 517
    iget-object v6, v6, Lcom/ss/android/ttvecamera/TECameraSettings;->q:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 518
    .line 519
    iget v7, v6, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 520
    .line 521
    iget v6, v6, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 522
    .line 523
    invoke-virtual {v0, v7, v6}, Landroid/hardware/Camera$Parameters;->setPreviewSize(II)V

    .line 524
    .line 525
    .line 526
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 527
    .line 528
    iget-object v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->E:Landroid/os/Bundle;

    .line 529
    .line 530
    if-eqz v0, :cond_14

    .line 531
    .line 532
    const-string v6, "enable_dim_light_quality"

    .line 533
    .line 534
    invoke-virtual {v0, v6}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 535
    .line 536
    .line 537
    move-result v0

    .line 538
    if-eqz v0, :cond_14

    .line 539
    .line 540
    aget v0, v3, v5

    .line 541
    .line 542
    aget v6, v3, v2

    .line 543
    .line 544
    if-gt v0, v6, :cond_15

    .line 545
    .line 546
    :cond_14
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 547
    .line 548
    aget v6, v3, v5

    .line 549
    .line 550
    aget v3, v3, v2

    .line 551
    .line 552
    invoke-virtual {v0, v6, v3}, Landroid/hardware/Camera$Parameters;->setPreviewFpsRange(II)V

    .line 553
    .line 554
    .line 555
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 556
    .line 557
    iget-boolean v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->P:Z

    .line 558
    .line 559
    if-eqz v0, :cond_15

    .line 560
    .line 561
    const-string v0, "use setRecordingHint"

    .line 562
    .line 563
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 564
    .line 565
    .line 566
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 567
    .line 568
    invoke-virtual {v0, v2}, Landroid/hardware/Camera$Parameters;->setRecordingHint(Z)V

    .line 569
    .line 570
    .line 571
    :cond_15
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 572
    .line 573
    const-string v3, "auto"

    .line 574
    .line 575
    invoke-virtual {v0, v3}, Landroid/hardware/Camera$Parameters;->setWhiteBalance(Ljava/lang/String;)V

    .line 576
    .line 577
    .line 578
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 579
    .line 580
    invoke-virtual {v0, v3}, Landroid/hardware/Camera$Parameters;->setSceneMode(Ljava/lang/String;)V

    .line 581
    .line 582
    .line 583
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 584
    .line 585
    iget-object v3, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 586
    .line 587
    iget v3, v3, Lcom/ss/android/ttvecamera/TECameraSettings;->g:I

    .line 588
    .line 589
    invoke-virtual {v0, v3}, Landroid/hardware/Camera$Parameters;->setPreviewFormat(I)V

    .line 590
    .line 591
    .line 592
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 593
    .line 594
    iget v3, p0, Lcom/ss/android/ttvecamera/a;->I:I

    .line 595
    .line 596
    invoke-virtual {v0, v3}, Landroid/hardware/Camera$Parameters;->setExposureCompensation(I)V

    .line 597
    .line 598
    .line 599
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 600
    .line 601
    iget-boolean v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->U:Z

    .line 602
    .line 603
    const-string v3, ""

    .line 604
    .line 605
    if-eqz v0, :cond_17

    .line 606
    .line 607
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 608
    .line 609
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->isVideoStabilizationSupported()Z

    .line 610
    .line 611
    .line 612
    move-result v0

    .line 613
    const-string v6, "te_record_camera_stabilization"

    .line 614
    .line 615
    if-eqz v0, :cond_16

    .line 616
    .line 617
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 618
    .line 619
    invoke-virtual {v0, v2}, Landroid/hardware/Camera$Parameters;->setVideoStabilization(Z)V

    .line 620
    .line 621
    .line 622
    const-wide/16 v7, 0x1

    .line 623
    .line 624
    invoke-static {v6, v7, v8}, Ll/hrh0;->b(Ljava/lang/String;J)V

    .line 625
    .line 626
    .line 627
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 628
    .line 629
    const/16 v6, 0x71

    .line 630
    .line 631
    iget-object v7, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 632
    .line 633
    invoke-interface {v0, v6, v2, v3, v7}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 634
    .line 635
    .line 636
    goto :goto_9

    .line 637
    :cond_16
    const-wide/16 v7, 0x0

    .line 638
    .line 639
    invoke-static {v6, v7, v8}, Ll/hrh0;->b(Ljava/lang/String;J)V

    .line 640
    .line 641
    .line 642
    :cond_17
    :goto_9
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->A:Ll/nrh0;

    .line 643
    .line 644
    iget-object v2, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 645
    .line 646
    iget v6, v2, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 647
    .line 648
    iget-object v7, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 649
    .line 650
    iget-object v2, v2, Lcom/ss/android/ttvecamera/TECameraSettings;->E:Landroid/os/Bundle;

    .line 651
    .line 652
    const-string v8, "enableFrontFacingVideoContinueFocus"

    .line 653
    .line 654
    invoke-virtual {v2, v8}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 655
    .line 656
    .line 657
    move-result v2

    .line 658
    invoke-virtual {v0, v6, v7, v2}, Ll/nrh0;->g(ILandroid/hardware/Camera$Parameters;Z)Ljava/lang/String;

    .line 659
    .line 660
    .line 661
    move-result-object v0

    .line 662
    iput-object v0, p0, Lcom/ss/android/ttvecamera/a;->B:Ljava/lang/String;

    .line 663
    .line 664
    if-eq v0, v3, :cond_18

    .line 665
    .line 666
    iget-object v2, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 667
    .line 668
    invoke-virtual {v2, v0}, Landroid/hardware/Camera$Parameters;->setFocusMode(Ljava/lang/String;)V

    .line 669
    .line 670
    .line 671
    goto :goto_a

    .line 672
    :cond_18
    new-instance v0, Ljava/lang/StringBuilder;

    .line 673
    .line 674
    const-string v2, "No Supported Focus Mode for Facing"

    .line 675
    .line 676
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 677
    .line 678
    .line 679
    iget-object v2, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 680
    .line 681
    iget v2, v2, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 682
    .line 683
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 684
    .line 685
    .line 686
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 687
    .line 688
    .line 689
    move-result-object v0

    .line 690
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 691
    .line 692
    .line 693
    :goto_a
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 694
    .line 695
    iget-object v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->K:Lcom/ss/android/ttvecamera/TECameraSettings$d;

    .line 696
    .line 697
    iget-object v2, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 698
    .line 699
    invoke-virtual {v2}, Landroid/hardware/Camera$Parameters;->getMaxExposureCompensation()I

    .line 700
    .line 701
    .line 702
    move-result v2

    .line 703
    iput v2, v0, Lcom/ss/android/ttvecamera/TECameraSettings$d;->a:I

    .line 704
    .line 705
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 706
    .line 707
    iget-object v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->K:Lcom/ss/android/ttvecamera/TECameraSettings$d;

    .line 708
    .line 709
    iget-object v2, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 710
    .line 711
    invoke-virtual {v2}, Landroid/hardware/Camera$Parameters;->getMinExposureCompensation()I

    .line 712
    .line 713
    .line 714
    move-result v2

    .line 715
    iput v2, v0, Lcom/ss/android/ttvecamera/TECameraSettings$d;->c:I

    .line 716
    .line 717
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 718
    .line 719
    iget-object v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->K:Lcom/ss/android/ttvecamera/TECameraSettings$d;

    .line 720
    .line 721
    iget-object v2, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 722
    .line 723
    invoke-virtual {v2}, Landroid/hardware/Camera$Parameters;->getExposureCompensationStep()F

    .line 724
    .line 725
    .line 726
    move-result v2

    .line 727
    iput v2, v0, Lcom/ss/android/ttvecamera/TECameraSettings$d;->d:F

    .line 728
    .line 729
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 730
    .line 731
    iget-object v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->K:Lcom/ss/android/ttvecamera/TECameraSettings$d;

    .line 732
    .line 733
    iget-object v2, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 734
    .line 735
    invoke-virtual {v2}, Landroid/hardware/Camera$Parameters;->getExposureCompensation()I

    .line 736
    .line 737
    .line 738
    move-result v2

    .line 739
    iput v2, v0, Lcom/ss/android/ttvecamera/TECameraSettings$d;->b:I

    .line 740
    .line 741
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 742
    .line 743
    iget-boolean v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->i:Z

    .line 744
    .line 745
    if-eqz v0, :cond_1b

    .line 746
    .line 747
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 748
    .line 749
    const-string v2, "zsl-values"

    .line 750
    .line 751
    invoke-virtual {v0, v2}, Landroid/hardware/Camera$Parameters;->get(Ljava/lang/String;)Ljava/lang/String;

    .line 752
    .line 753
    .line 754
    move-result-object v0

    .line 755
    iget-object v2, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 756
    .line 757
    const-string v3, "zsl"

    .line 758
    .line 759
    invoke-virtual {v2, v3}, Landroid/hardware/Camera$Parameters;->get(Ljava/lang/String;)Ljava/lang/String;

    .line 760
    .line 761
    .line 762
    move-result-object v2

    .line 763
    const-string v6, "off"

    .line 764
    .line 765
    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 766
    .line 767
    .line 768
    move-result v2

    .line 769
    const-string v7, "on"

    .line 770
    .line 771
    if-eqz v2, :cond_19

    .line 772
    .line 773
    if-eqz v0, :cond_19

    .line 774
    .line 775
    invoke-virtual {v0, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 776
    .line 777
    .line 778
    move-result v2

    .line 779
    if-eqz v2, :cond_19

    .line 780
    .line 781
    iget-object v2, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 782
    .line 783
    invoke-virtual {v2, v3, v7}, Landroid/hardware/Camera$Parameters;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 784
    .line 785
    .line 786
    :cond_19
    iget-object v2, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 787
    .line 788
    invoke-virtual {v2, v3}, Landroid/hardware/Camera$Parameters;->get(Ljava/lang/String;)Ljava/lang/String;

    .line 789
    .line 790
    .line 791
    move-result-object v2

    .line 792
    invoke-virtual {v7, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 793
    .line 794
    .line 795
    move-result v2

    .line 796
    iput-boolean v2, p0, Lcom/ss/android/ttvecamera/c;->a:Z

    .line 797
    .line 798
    if-nez v2, :cond_1b

    .line 799
    .line 800
    iget-object v2, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 801
    .line 802
    iget-boolean v2, v2, Lcom/ss/android/ttvecamera/TECameraSettings;->i:Z

    .line 803
    .line 804
    if-eqz v2, :cond_1b

    .line 805
    .line 806
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 807
    .line 808
    .line 809
    move-result v0

    .line 810
    if-eqz v0, :cond_1b

    .line 811
    .line 812
    invoke-static {}, Ll/rqh0;->a()Z

    .line 813
    .line 814
    .line 815
    move-result v0

    .line 816
    if-eqz v0, :cond_1b

    .line 817
    .line 818
    invoke-static {}, Ll/rqh0;->b()Z

    .line 819
    .line 820
    .line 821
    move-result v0

    .line 822
    if-eqz v0, :cond_1b

    .line 823
    .line 824
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 825
    .line 826
    const-string v2, "zsd-mode-values"

    .line 827
    .line 828
    invoke-virtual {v0, v2}, Landroid/hardware/Camera$Parameters;->get(Ljava/lang/String;)Ljava/lang/String;

    .line 829
    .line 830
    .line 831
    move-result-object v0

    .line 832
    iget-object v2, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 833
    .line 834
    const-string v3, "zsd-mode"

    .line 835
    .line 836
    invoke-virtual {v2, v3}, Landroid/hardware/Camera$Parameters;->get(Ljava/lang/String;)Ljava/lang/String;

    .line 837
    .line 838
    .line 839
    move-result-object v2

    .line 840
    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 841
    .line 842
    .line 843
    move-result v2

    .line 844
    if-eqz v2, :cond_1a

    .line 845
    .line 846
    if-eqz v0, :cond_1a

    .line 847
    .line 848
    invoke-virtual {v0, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 849
    .line 850
    .line 851
    move-result v0

    .line 852
    if-eqz v0, :cond_1a

    .line 853
    .line 854
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 855
    .line 856
    invoke-virtual {v0, v3, v7}, Landroid/hardware/Camera$Parameters;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 857
    .line 858
    .line 859
    :cond_1a
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 860
    .line 861
    invoke-virtual {v0, v3}, Landroid/hardware/Camera$Parameters;->get(Ljava/lang/String;)Ljava/lang/String;

    .line 862
    .line 863
    .line 864
    move-result-object v0

    .line 865
    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 866
    .line 867
    .line 868
    move-result v0

    .line 869
    iput-boolean v0, p0, Lcom/ss/android/ttvecamera/c;->a:Z

    .line 870
    .line 871
    :cond_1b
    iget-boolean v0, p0, Lcom/ss/android/ttvecamera/c;->a:Z

    .line 872
    .line 873
    if-eqz v0, :cond_1c

    .line 874
    .line 875
    const-string v0, "Enable"

    .line 876
    .line 877
    goto :goto_b

    .line 878
    :cond_1c
    const-string v0, "Disable"

    .line 879
    .line 880
    :goto_b
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 881
    .line 882
    .line 883
    move-result-object v0

    .line 884
    const-string v2, "%s zsl"

    .line 885
    .line 886
    invoke-static {v2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 887
    .line 888
    .line 889
    move-result-object v0

    .line 890
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 891
    .line 892
    .line 893
    iput-object v4, p0, Lcom/ss/android/ttvecamera/a;->G:Ljava/util/List;

    .line 894
    .line 895
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 896
    .line 897
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->isZoomSupported()Z

    .line 898
    .line 899
    .line 900
    move-result v0

    .line 901
    if-eqz v0, :cond_1d

    .line 902
    .line 903
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 904
    .line 905
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getZoomRatios()Ljava/util/List;

    .line 906
    .line 907
    .line 908
    move-result-object v0

    .line 909
    iput-object v0, p0, Lcom/ss/android/ttvecamera/a;->G:Ljava/util/List;

    .line 910
    .line 911
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 912
    .line 913
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getMaxZoom()I

    .line 914
    .line 915
    .line 916
    move-result v0

    .line 917
    int-to-float v0, v0

    .line 918
    iput v0, p0, Lcom/ss/android/ttvecamera/c;->l:F

    .line 919
    .line 920
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->G:Ljava/util/List;

    .line 921
    .line 922
    invoke-static {v0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 923
    .line 924
    .line 925
    const/high16 v0, 0x42c80000    # 100.0f

    .line 926
    .line 927
    iput v0, p0, Lcom/ss/android/ttvecamera/a;->H:F

    .line 928
    .line 929
    goto :goto_c

    .line 930
    :cond_1d
    const-string v0, "camera don\'t support zoom"

    .line 931
    .line 932
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 933
    .line 934
    .line 935
    :goto_c
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 936
    .line 937
    iget-object v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->E:Landroid/os/Bundle;

    .line 938
    .line 939
    const-string v2, "enableShutterSound"

    .line 940
    .line 941
    invoke-virtual {v0, v2}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 942
    .line 943
    .line 944
    move-result v0

    .line 945
    if-eqz v0, :cond_1e

    .line 946
    .line 947
    :try_start_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 948
    .line 949
    iget-object v3, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 950
    .line 951
    iget-object v3, v3, Lcom/ss/android/ttvecamera/TECameraSettings;->E:Landroid/os/Bundle;

    .line 952
    .line 953
    invoke-virtual {v3, v2}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 954
    .line 955
    .line 956
    move-result v2

    .line 957
    invoke-virtual {v0, v2}, Landroid/hardware/Camera;->enableShutterSound(Z)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 958
    .line 959
    .line 960
    goto :goto_d

    .line 961
    :catch_0
    move-exception v0

    .line 962
    new-instance v2, Ljava/lang/StringBuilder;

    .line 963
    .line 964
    const-string v3, "unsupport enableShutterSound, "

    .line 965
    .line 966
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 967
    .line 968
    .line 969
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 970
    .line 971
    .line 972
    move-result-object v0

    .line 973
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 974
    .line 975
    .line 976
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 977
    .line 978
    .line 979
    move-result-object v0

    .line 980
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 981
    .line 982
    .line 983
    :cond_1e
    :goto_d
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 984
    .line 985
    iget-object v1, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 986
    .line 987
    invoke-virtual {v0, v1}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 988
    .line 989
    .line 990
    :try_start_1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 991
    .line 992
    invoke-virtual {v0, v5}, Landroid/hardware/Camera;->setDisplayOrientation(I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 993
    .line 994
    .line 995
    :catchall_0
    iput-boolean v5, p0, Lcom/ss/android/ttvecamera/a;->M:Z

    .line 996
    .line 997
    return v5

    .line 998
    :cond_1f
    const-string p0, "fps config failed"

    .line 999
    .line 1000
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 1001
    .line 1002
    .line 1003
    return v5
.end method

.method private S0(Lcom/bytedance/bpea/basics/Cert;)I
    .locals 10

    .line 1
    const-string v0, "TECamera1"

    .line 2
    .line 3
    const-string v1, "innerOpen mNumberOfCameras: "

    .line 4
    .line 5
    const-string v2, "TECamera1-innerOpen"

    .line 6
    .line 7
    invoke-static {v2}, Ll/dsh0;->a(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    iput v2, p0, Lcom/ss/android/ttvecamera/a;->I:I

    .line 12
    .line 13
    iput-object p1, p0, Lcom/ss/android/ttvecamera/c;->t:Lcom/bytedance/bpea/basics/Cert;

    .line 14
    .line 15
    const/16 v3, -0x191

    .line 16
    .line 17
    const/4 v4, 0x0

    .line 18
    const/4 v5, 0x1

    .line 19
    :try_start_0
    iget-object v6, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 20
    .line 21
    iget-boolean v7, v6, Lcom/ss/android/ttvecamera/TECameraSettings;->l0:Z

    .line 22
    .line 23
    if-eqz v7, :cond_0

    .line 24
    .line 25
    iget-object v6, v6, Lcom/ss/android/ttvecamera/TECameraSettings;->J:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v6

    .line 31
    if-nez v6, :cond_0

    .line 32
    .line 33
    new-instance v1, Landroid/hardware/Camera$CameraInfo;

    .line 34
    .line 35
    invoke-direct {v1}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    .line 36
    .line 37
    .line 38
    iget-object v6, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 39
    .line 40
    iget-object v6, v6, Lcom/ss/android/ttvecamera/TECameraSettings;->J:Ljava/lang/String;

    .line 41
    .line 42
    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    move-result v6

    .line 46
    invoke-static {v6, v1}, Landroid/hardware/Camera;->getCameraInfo(ILandroid/hardware/Camera$CameraInfo;)V

    .line 47
    .line 48
    .line 49
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 50
    .line 51
    iput v6, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->f:I

    .line 52
    .line 53
    iget v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 54
    .line 55
    iput v1, p0, Lcom/ss/android/ttvecamera/c;->i:I

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :catch_0
    move-exception p1

    .line 59
    goto/16 :goto_7

    .line 60
    .line 61
    :cond_0
    invoke-static {}, Landroid/hardware/Camera;->getNumberOfCameras()I

    .line 62
    .line 63
    .line 64
    move-result v6

    .line 65
    iput v6, p0, Lcom/ss/android/ttvecamera/a;->C:I

    .line 66
    .line 67
    const-string v7, "te_record_camera_size"

    .line 68
    .line 69
    int-to-long v8, v6

    .line 70
    invoke-static {v7, v8, v9}, Ll/hrh0;->b(Ljava/lang/String;J)V

    .line 71
    .line 72
    .line 73
    new-instance v6, Ljava/lang/StringBuilder;

    .line 74
    .line 75
    invoke-direct {v6, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    iget v1, p0, Lcom/ss/android/ttvecamera/a;->C:I

    .line 79
    .line 80
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string v1, ", current mDefaultCameraID:"

    .line 84
    .line 85
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 89
    .line 90
    iget v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->f:I

    .line 91
    .line 92
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    invoke-static {v0, v1}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    new-instance v1, Landroid/hardware/Camera$CameraInfo;

    .line 103
    .line 104
    invoke-direct {v1}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    .line 105
    .line 106
    .line 107
    move v6, v2

    .line 108
    :goto_0
    iget v7, p0, Lcom/ss/android/ttvecamera/a;->C:I

    .line 109
    .line 110
    if-ge v6, v7, :cond_2

    .line 111
    .line 112
    invoke-static {v6, v1}, Landroid/hardware/Camera;->getCameraInfo(ILandroid/hardware/Camera$CameraInfo;)V

    .line 113
    .line 114
    .line 115
    new-instance v7, Ljava/lang/StringBuilder;

    .line 116
    .line 117
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 118
    .line 119
    .line 120
    const-string v8, "innerOpen cameraInfo facing: "

    .line 121
    .line 122
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    iget v8, v1, Landroid/hardware/Camera$CameraInfo;->facing:I

    .line 126
    .line 127
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    const-string v8, ", mCameraSettings.mFacing:"

    .line 131
    .line 132
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    iget-object v8, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 136
    .line 137
    iget v8, v8, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 138
    .line 139
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v7

    .line 146
    invoke-static {v0, v7}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    iget v7, v1, Landroid/hardware/Camera$CameraInfo;->facing:I

    .line 150
    .line 151
    iget-object v8, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 152
    .line 153
    iget v9, v8, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 154
    .line 155
    if-ne v7, v9, :cond_1

    .line 156
    .line 157
    iput v6, v8, Lcom/ss/android/ttvecamera/TECameraSettings;->f:I

    .line 158
    .line 159
    goto :goto_1

    .line 160
    :cond_1
    add-int/lit8 v6, v6, 0x1

    .line 161
    .line 162
    goto :goto_0

    .line 163
    :cond_2
    :goto_1
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 164
    .line 165
    iget v6, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->f:I

    .line 166
    .line 167
    const/4 v7, -0x1

    .line 168
    if-ne v6, v7, :cond_4

    .line 169
    .line 170
    iget v8, p0, Lcom/ss/android/ttvecamera/a;->C:I

    .line 171
    .line 172
    if-lez v8, :cond_4

    .line 173
    .line 174
    iget-boolean v8, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->j0:Z

    .line 175
    .line 176
    if-nez v8, :cond_3

    .line 177
    .line 178
    goto :goto_2

    .line 179
    :cond_3
    const-string p1, "innerOpen: camera info check error"

    .line 180
    .line 181
    invoke-static {v0, p1}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 182
    .line 183
    .line 184
    new-instance p1, Ljava/lang/RuntimeException;

    .line 185
    .line 186
    const-string v1, "CameraIDError"

    .line 187
    .line 188
    invoke-direct {p1, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 189
    .line 190
    .line 191
    throw p1

    .line 192
    :cond_4
    :goto_2
    if-ne v6, v7, :cond_5

    .line 193
    .line 194
    iget v6, p0, Lcom/ss/android/ttvecamera/a;->C:I

    .line 195
    .line 196
    if-lez v6, :cond_5

    .line 197
    .line 198
    iget-boolean v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->i0:Z

    .line 199
    .line 200
    if-eqz v1, :cond_5

    .line 201
    .line 202
    const-string v1, "innerOpen: camera info check, set CameraID to 0"

    .line 203
    .line 204
    invoke-static {v0, v1}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 205
    .line 206
    .line 207
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 208
    .line 209
    iput v2, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->f:I

    .line 210
    .line 211
    :cond_5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 212
    .line 213
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 214
    .line 215
    .line 216
    const-string v6, "innerOpen: "

    .line 217
    .line 218
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 219
    .line 220
    .line 221
    iget-object v6, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 222
    .line 223
    iget v6, v6, Lcom/ss/android/ttvecamera/TECameraSettings;->f:I

    .line 224
    .line 225
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 226
    .line 227
    .line 228
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object v1

    .line 232
    invoke-static {v0, v1}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 233
    .line 234
    .line 235
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 236
    .line 237
    const-string v6, "will start camera1"

    .line 238
    .line 239
    const/16 v8, 0x6a

    .line 240
    .line 241
    invoke-interface {v1, v8, v2, v6, v4}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 242
    .line 243
    .line 244
    const-string v1, "TECamera1-innerOpen-openCamera"

    .line 245
    .line 246
    invoke-static {v1}, Ll/dsh0;->a(Ljava/lang/String;)V

    .line 247
    .line 248
    .line 249
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 250
    .line 251
    iget v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->f:I

    .line 252
    .line 253
    if-ltz v1, :cond_6

    .line 254
    .line 255
    invoke-static {p1, v1}, Ll/sqh0;->c(Lcom/bytedance/bpea/basics/Cert;I)Landroid/hardware/Camera;

    .line 256
    .line 257
    .line 258
    move-result-object p1

    .line 259
    iput-object p1, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 260
    .line 261
    goto :goto_4

    .line 262
    :cond_6
    invoke-static {p1, v1}, Ll/sqh0;->c(Lcom/bytedance/bpea/basics/Cert;I)Landroid/hardware/Camera;

    .line 263
    .line 264
    .line 265
    move-result-object p1

    .line 266
    iput-object p1, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 267
    .line 268
    iget-object p1, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 269
    .line 270
    iput v2, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 271
    .line 272
    iput v2, p0, Lcom/ss/android/ttvecamera/c;->i:I

    .line 273
    .line 274
    new-instance p1, Landroid/hardware/Camera$CameraInfo;

    .line 275
    .line 276
    invoke-direct {p1}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    .line 277
    .line 278
    .line 279
    move v1, v2

    .line 280
    :goto_3
    iget v6, p0, Lcom/ss/android/ttvecamera/a;->C:I

    .line 281
    .line 282
    if-ge v1, v6, :cond_8

    .line 283
    .line 284
    invoke-static {v1, p1}, Landroid/hardware/Camera;->getCameraInfo(ILandroid/hardware/Camera$CameraInfo;)V

    .line 285
    .line 286
    .line 287
    iget v6, p1, Landroid/hardware/Camera$CameraInfo;->facing:I

    .line 288
    .line 289
    iget v8, p0, Lcom/ss/android/ttvecamera/c;->i:I

    .line 290
    .line 291
    if-ne v6, v8, :cond_7

    .line 292
    .line 293
    iget-object p1, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 294
    .line 295
    iput v1, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->f:I

    .line 296
    .line 297
    goto :goto_4

    .line 298
    :cond_7
    add-int/lit8 v1, v1, 0x1

    .line 299
    .line 300
    goto :goto_3

    .line 301
    :cond_8
    :goto_4
    invoke-static {}, Ll/dsh0;->b()V

    .line 302
    .line 303
    .line 304
    new-instance p1, Ljava/lang/StringBuilder;

    .line 305
    .line 306
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 307
    .line 308
    .line 309
    const-string v1, "innerOpen mNewFacing: "

    .line 310
    .line 311
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 312
    .line 313
    .line 314
    iget v1, p0, Lcom/ss/android/ttvecamera/c;->i:I

    .line 315
    .line 316
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 317
    .line 318
    .line 319
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 320
    .line 321
    .line 322
    move-result-object p1

    .line 323
    invoke-static {v0, p1}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 324
    .line 325
    .line 326
    new-instance p1, Ljava/lang/StringBuilder;

    .line 327
    .line 328
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 329
    .line 330
    .line 331
    const-string v1, "innerOpen mCameraSettings.mDefaultCameraID: "

    .line 332
    .line 333
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 334
    .line 335
    .line 336
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 337
    .line 338
    iget v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->f:I

    .line 339
    .line 340
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 341
    .line 342
    .line 343
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 344
    .line 345
    .line 346
    move-result-object p1

    .line 347
    invoke-static {v0, p1}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 348
    .line 349
    .line 350
    iget-object p1, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 351
    .line 352
    const/16 v1, 0x6b

    .line 353
    .line 354
    const-string v6, "did start camera1"

    .line 355
    .line 356
    invoke-interface {p1, v1, v2, v6, v4}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 357
    .line 358
    .line 359
    iget-object p1, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 360
    .line 361
    if-nez p1, :cond_a

    .line 362
    .line 363
    new-instance p1, Ljava/lang/StringBuilder;

    .line 364
    .line 365
    const-string v1, "Open Camera Failed with ID:"

    .line 366
    .line 367
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 368
    .line 369
    .line 370
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 371
    .line 372
    iget v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->f:I

    .line 373
    .line 374
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 375
    .line 376
    .line 377
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 378
    .line 379
    .line 380
    move-result-object p1

    .line 381
    invoke-static {v0, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 382
    .line 383
    .line 384
    iget-object p1, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 385
    .line 386
    iget p1, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->f:I

    .line 387
    .line 388
    if-ne p1, v7, :cond_9

    .line 389
    .line 390
    const/16 v3, -0x195

    .line 391
    .line 392
    :cond_9
    iget-object p1, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 393
    .line 394
    iget-object p0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 395
    .line 396
    invoke-interface {p1, v5, v3, v4, p0}, Lcom/ss/android/ttvecamera/c$a;->f(IILcom/ss/android/ttvecamera/c;Ljava/lang/Object;)V

    .line 397
    .line 398
    .line 399
    return v3

    .line 400
    :cond_a
    :try_start_1
    const-string p1, "TECamera1-initCamera"

    .line 401
    .line 402
    invoke-static {p1}, Ll/dsh0;->a(Ljava/lang/String;)V

    .line 403
    .line 404
    .line 405
    invoke-direct {p0}, Lcom/ss/android/ttvecamera/a;->R0()I

    .line 406
    .line 407
    .line 408
    move-result p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    .line 409
    :try_start_2
    invoke-static {}, Ll/dsh0;->b()V

    .line 410
    .line 411
    .line 412
    const-string v1, "TECamera1-fillFeatures"

    .line 413
    .line 414
    invoke-static {v1}, Ll/dsh0;->a(Ljava/lang/String;)V

    .line 415
    .line 416
    .line 417
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/a;->l()Landroid/os/Bundle;

    .line 418
    .line 419
    .line 420
    invoke-static {}, Ll/dsh0;->b()V

    .line 421
    .line 422
    .line 423
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 424
    .line 425
    const-string v3, "TECamera1 features is ready"

    .line 426
    .line 427
    iget-object v4, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 428
    .line 429
    invoke-interface {v1, v5, v2, v3, v4}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 430
    .line 431
    .line 432
    goto :goto_6

    .line 433
    :catch_1
    move-exception v1

    .line 434
    move v2, p1

    .line 435
    goto :goto_5

    .line 436
    :catch_2
    move-exception v1

    .line 437
    :goto_5
    new-instance p1, Ljava/lang/StringBuilder;

    .line 438
    .line 439
    const-string v3, "Open init Camera Failed!: "

    .line 440
    .line 441
    invoke-direct {p1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 442
    .line 443
    .line 444
    invoke-static {v1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 445
    .line 446
    .line 447
    move-result-object v3

    .line 448
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 449
    .line 450
    .line 451
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 452
    .line 453
    .line 454
    move-result-object p1

    .line 455
    invoke-static {v0, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 456
    .line 457
    .line 458
    invoke-static {v1}, Lcom/ss/android/ttvecamera/e;->a(Ljava/lang/Throwable;)V

    .line 459
    .line 460
    .line 461
    move p1, v2

    .line 462
    :goto_6
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 463
    .line 464
    iget-object v1, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 465
    .line 466
    invoke-interface {v0, v5, p1, p0, v1}, Lcom/ss/android/ttvecamera/c$a;->f(IILcom/ss/android/ttvecamera/c;Ljava/lang/Object;)V

    .line 467
    .line 468
    .line 469
    invoke-static {}, Ll/dsh0;->b()V

    .line 470
    .line 471
    .line 472
    return p1

    .line 473
    :goto_7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 474
    .line 475
    const-string v2, "Open Camera Failed!: "

    .line 476
    .line 477
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 478
    .line 479
    .line 480
    invoke-static {p1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 481
    .line 482
    .line 483
    move-result-object v2

    .line 484
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 485
    .line 486
    .line 487
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 488
    .line 489
    .line 490
    move-result-object v1

    .line 491
    invoke-static {v0, v1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 492
    .line 493
    .line 494
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 495
    .line 496
    .line 497
    move-result-object v0

    .line 498
    if-eqz v0, :cond_c

    .line 499
    .line 500
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 501
    .line 502
    .line 503
    move-result-object v0

    .line 504
    const-string v1, "Fail to connect to camera service"

    .line 505
    .line 506
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 507
    .line 508
    .line 509
    move-result v0

    .line 510
    if-eqz v0, :cond_b

    .line 511
    .line 512
    const/16 v3, -0x19a

    .line 513
    .line 514
    goto :goto_8

    .line 515
    :cond_b
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 516
    .line 517
    .line 518
    move-result-object v0

    .line 519
    const-string v1, "Camera initialization failed"

    .line 520
    .line 521
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 522
    .line 523
    .line 524
    move-result v0

    .line 525
    if-eqz v0, :cond_c

    .line 526
    .line 527
    const/16 v3, -0x197

    .line 528
    .line 529
    :cond_c
    :goto_8
    invoke-static {p1}, Lcom/ss/android/ttvecamera/e;->a(Ljava/lang/Throwable;)V

    .line 530
    .line 531
    .line 532
    iget-object p1, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 533
    .line 534
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 535
    .line 536
    invoke-interface {p1, v5, v3, v4, v0}, Lcom/ss/android/ttvecamera/c$a;->f(IILcom/ss/android/ttvecamera/c;Ljava/lang/Object;)V

    .line 537
    .line 538
    .line 539
    iput-object v4, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 540
    .line 541
    return v3
.end method


# virtual methods
.method public A0(Lcom/ss/android/ttvecamera/TECameraSettings$p;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const-string v2, "TECamera1"

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    const-string p1, "[VE_UI_TEST]Failed event: STOP_ZOOM. Code: -439. Reason: mCameraDevice is null"

    .line 9
    .line 10
    invoke-static {v2, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    const-string p1, "stopZoom : Camera is null!"

    .line 14
    .line 15
    invoke-static {v2, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 19
    .line 20
    const/16 v2, -0x1b7

    .line 21
    .line 22
    iget-object p0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 23
    .line 24
    invoke-interface {v0, v1, v2, p1, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    :try_start_0
    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->isSmoothZoomSupported()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    if-eqz p1, :cond_1

    .line 39
    .line 40
    invoke-interface {p1}, Lcom/ss/android/ttvecamera/TECameraSettings$p;->enableSmooth()Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-eqz p1, :cond_1

    .line 45
    .line 46
    iget-object p1, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 47
    .line 48
    invoke-virtual {p1}, Landroid/hardware/Camera;->stopSmoothZoom()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :catch_0
    move-exception p1

    .line 53
    goto :goto_0

    .line 54
    :cond_1
    return-void

    .line 55
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 56
    .line 57
    const-string v3, "[VE_UI_TEST]Failed event: STOP_ZOOM. Code: -420. Reason: "

    .line 58
    .line 59
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-static {v2, v0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    new-instance v0, Ljava/lang/StringBuilder;

    .line 73
    .line 74
    const-string v3, "Stop zoom failed : "

    .line 75
    .line 76
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-static {v2, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 94
    .line 95
    const/16 v2, -0x1a4

    .line 96
    .line 97
    iget-object p0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 98
    .line 99
    invoke-interface {v0, v1, v2, p1, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 100
    .line 101
    .line 102
    return-void
.end method

.method public B()I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 2
    .line 3
    if-eqz p0, :cond_4

    .line 4
    .line 5
    :try_start_0
    invoke-virtual {p0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getFlashMode()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    goto :goto_0

    .line 14
    :catch_0
    move-exception p0

    .line 15
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 16
    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    :goto_0
    const-string v0, "on"

    .line 20
    .line 21
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    goto :goto_1

    .line 29
    :cond_0
    const-string v0, "auto"

    .line 30
    .line 31
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    const/4 p0, 0x3

    .line 38
    goto :goto_1

    .line 39
    :cond_1
    const-string v0, "off"

    .line 40
    .line 41
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_2

    .line 46
    .line 47
    const/4 p0, 0x0

    .line 48
    goto :goto_1

    .line 49
    :cond_2
    const-string v0, "torch"

    .line 50
    .line 51
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_3

    .line 56
    .line 57
    const/4 p0, 0x2

    .line 58
    goto :goto_1

    .line 59
    :cond_3
    const-string v0, "red-eye"

    .line 60
    .line 61
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    if-eqz p0, :cond_4

    .line 66
    .line 67
    const/4 p0, 0x4

    .line 68
    goto :goto_1

    .line 69
    :cond_4
    const/4 p0, -0x1

    .line 70
    :goto_1
    return p0
.end method

.method public B0(I)V
    .locals 2

    .line 1
    const-string p1, "TECamera1"

    .line 2
    .line 3
    const-string v0, "Does not support switch mode for camera1"

    .line 4
    .line 5
    invoke-static {p1, v0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 9
    .line 10
    const/16 v1, -0xc8

    .line 11
    .line 12
    iget-object p0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 13
    .line 14
    invoke-interface {p1, v1, v1, v0, p0}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public C()I
    .locals 5

    .line 1
    iget v0, p0, Lcom/ss/android/ttvecamera/c;->k:I

    .line 2
    .line 3
    if-gez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->f:Landroid/content/Context;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/ss/android/ttvecamera/f;->q(Landroid/content/Context;)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    :cond_0
    new-instance v1, Landroid/hardware/Camera$CameraInfo;

    .line 12
    .line 13
    invoke-direct {v1}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    .line 14
    .line 15
    .line 16
    iget v2, p0, Lcom/ss/android/ttvecamera/c;->i:I

    .line 17
    .line 18
    iput v2, p0, Lcom/ss/android/ttvecamera/c;->h:I

    .line 19
    .line 20
    const/4 v2, 0x1

    .line 21
    :try_start_0
    iget-object v3, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 22
    .line 23
    iget v3, v3, Lcom/ss/android/ttvecamera/TECameraSettings;->f:I

    .line 24
    .line 25
    invoke-static {v3, v1}, Landroid/hardware/Camera;->getCameraInfo(ILandroid/hardware/Camera$CameraInfo;)V

    .line 26
    .line 27
    .line 28
    iget v3, p0, Lcom/ss/android/ttvecamera/c;->h:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 29
    .line 30
    iget v1, v1, Landroid/hardware/Camera$CameraInfo;->orientation:I

    .line 31
    .line 32
    if-ne v3, v2, :cond_1

    .line 33
    .line 34
    add-int/2addr v1, v0

    .line 35
    :try_start_1
    rem-int/lit16 v1, v1, 0x168

    .line 36
    .line 37
    rsub-int v0, v1, 0x21c

    .line 38
    .line 39
    rem-int/lit16 v0, v0, 0x168

    .line 40
    .line 41
    iput v0, p0, Lcom/ss/android/ttvecamera/c;->j:I

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :catch_0
    move-exception v0

    .line 45
    goto :goto_1

    .line 46
    :cond_1
    sub-int/2addr v1, v0

    .line 47
    add-int/lit16 v1, v1, 0x168

    .line 48
    .line 49
    rem-int/lit16 v1, v1, 0x168

    .line 50
    .line 51
    iput v1, p0, Lcom/ss/android/ttvecamera/c;->j:I

    .line 52
    .line 53
    :goto_0
    iget p0, p0, Lcom/ss/android/ttvecamera/c;->j:I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 54
    .line 55
    return p0

    .line 56
    :goto_1
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 57
    .line 58
    new-instance v3, Ljava/lang/StringBuilder;

    .line 59
    .line 60
    const-string v4, "getFrameOrientation :"

    .line 61
    .line 62
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    iget-object p0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 77
    .line 78
    const/16 v3, -0x195

    .line 79
    .line 80
    invoke-interface {v1, v2, v3, v0, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 81
    .line 82
    .line 83
    const/4 p0, 0x0

    .line 84
    return p0
.end method

.method public C0(I)V
    .locals 19

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move/from16 v2, p1

    .line 4
    .line 5
    const-string v0, "[VE_UI_TEST]Failed event: TOGGLE_TORCH. Code: -419. Reason: not support flash mode "

    .line 6
    .line 7
    const-string v3, "camera1 did change flash mode "

    .line 8
    .line 9
    const-string v4, "camera1 will change flash mode "

    .line 10
    .line 11
    iget-object v5, v1, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 12
    .line 13
    const-string v6, "TECamera1"

    .line 14
    .line 15
    const/4 v7, 0x0

    .line 16
    const/4 v8, 0x1

    .line 17
    if-nez v5, :cond_1

    .line 18
    .line 19
    const-string v0, "[VE_UI_TEST]Failed event: TOGGLE_TORCH. Code: -439. Reason: mCameraDevice is null"

    .line 20
    .line 21
    invoke-static {v6, v0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const-string v13, "switchFlashMode failed: Camera is not ready!"

    .line 25
    .line 26
    invoke-static {v6, v13}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, v1, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 30
    .line 31
    const/16 v3, -0x1b7

    .line 32
    .line 33
    iget-object v4, v1, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 34
    .line 35
    invoke-interface {v0, v8, v3, v13, v4}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    iget-object v9, v1, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 39
    .line 40
    if-nez v2, :cond_0

    .line 41
    .line 42
    move v12, v7

    .line 43
    goto :goto_0

    .line 44
    :cond_0
    move v12, v8

    .line 45
    :goto_0
    iget-object v14, v1, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 46
    .line 47
    const/4 v10, 0x1

    .line 48
    const/16 v11, -0x1b7

    .line 49
    .line 50
    invoke-interface/range {v9 .. v14}, Lcom/ss/android/ttvecamera/c$a;->g(IIILjava/lang/String;Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_1
    iget-wide v9, v1, Lcom/ss/android/ttvecamera/a;->K:J

    .line 55
    .line 56
    const-wide/16 v11, 0x0

    .line 57
    .line 58
    cmp-long v5, v9, v11

    .line 59
    .line 60
    const-wide/16 v9, 0xc8

    .line 61
    .line 62
    if-eqz v5, :cond_2

    .line 63
    .line 64
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 65
    .line 66
    .line 67
    move-result-wide v11

    .line 68
    iget-wide v13, v1, Lcom/ss/android/ttvecamera/a;->K:J

    .line 69
    .line 70
    sub-long/2addr v11, v13

    .line 71
    cmp-long v5, v11, v9

    .line 72
    .line 73
    if-gez v5, :cond_2

    .line 74
    .line 75
    iget-object v5, v1, Lcom/ss/android/ttvecamera/c;->e:Landroid/os/Handler;

    .line 76
    .line 77
    if-eqz v5, :cond_2

    .line 78
    .line 79
    new-instance v0, Lcom/ss/android/ttvecamera/a$e;

    .line 80
    .line 81
    invoke-direct {v0, v1, v2}, Lcom/ss/android/ttvecamera/a$e;-><init>(Lcom/ss/android/ttvecamera/a;I)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v5, v0, v9, v10}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :cond_2
    iput-boolean v7, v1, Lcom/ss/android/ttvecamera/a;->M:Z

    .line 89
    .line 90
    :try_start_0
    iget-object v5, v1, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 91
    .line 92
    invoke-virtual {v5}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 93
    .line 94
    .line 95
    move-result-object v5

    .line 96
    iput-object v5, v1, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 97
    .line 98
    invoke-virtual {v5}, Landroid/hardware/Camera$Parameters;->getSupportedFlashModes()Ljava/util/List;

    .line 99
    .line 100
    .line 101
    move-result-object v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 102
    if-eqz v5, :cond_a

    .line 103
    .line 104
    const-string v11, "off"

    .line 105
    .line 106
    const/4 v12, 0x0

    .line 107
    if-eqz v2, :cond_7

    .line 108
    .line 109
    if-eq v2, v8, :cond_6

    .line 110
    .line 111
    const/4 v13, 0x2

    .line 112
    if-eq v2, v13, :cond_5

    .line 113
    .line 114
    const/4 v13, 0x3

    .line 115
    if-eq v2, v13, :cond_4

    .line 116
    .line 117
    const/4 v13, 0x4

    .line 118
    if-eq v2, v13, :cond_3

    .line 119
    .line 120
    move-object v13, v12

    .line 121
    goto :goto_1

    .line 122
    :cond_3
    :try_start_1
    const-string v13, "red-eye"

    .line 123
    .line 124
    goto :goto_1

    .line 125
    :catch_0
    move-exception v0

    .line 126
    goto/16 :goto_7

    .line 127
    .line 128
    :cond_4
    const-string v13, "auto"

    .line 129
    .line 130
    goto :goto_1

    .line 131
    :cond_5
    const-string v13, "torch"

    .line 132
    .line 133
    goto :goto_1

    .line 134
    :cond_6
    const-string v13, "on"

    .line 135
    .line 136
    iput-boolean v8, v1, Lcom/ss/android/ttvecamera/a;->M:Z

    .line 137
    .line 138
    goto :goto_1

    .line 139
    :cond_7
    move-object v13, v11

    .line 140
    :goto_1
    if-eqz v13, :cond_a

    .line 141
    .line 142
    invoke-interface {v5, v13}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 143
    .line 144
    .line 145
    move-result v14

    .line 146
    if-eqz v14, :cond_a

    .line 147
    .line 148
    iget-object v0, v1, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 149
    .line 150
    invoke-virtual {v4, v13}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v4

    .line 154
    const/16 v5, 0x68

    .line 155
    .line 156
    invoke-interface {v0, v5, v7, v4, v12}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 157
    .line 158
    .line 159
    iget-object v0, v1, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 160
    .line 161
    invoke-virtual {v0, v13}, Landroid/hardware/Camera$Parameters;->setFlashMode(Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    iget-object v0, v1, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 165
    .line 166
    iget-object v4, v1, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 167
    .line 168
    invoke-virtual {v0, v4}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 169
    .line 170
    .line 171
    invoke-virtual {v11, v13}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 172
    .line 173
    .line 174
    move-result v0

    .line 175
    if-eqz v0, :cond_8

    .line 176
    .line 177
    iget-object v0, v1, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 178
    .line 179
    iget-object v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->E:Landroid/os/Bundle;

    .line 180
    .line 181
    const-string v4, "enableSwitchFlashSleepToTakeEffect"

    .line 182
    .line 183
    invoke-virtual {v0, v4}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 184
    .line 185
    .line 186
    move-result v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 187
    if-eqz v0, :cond_8

    .line 188
    .line 189
    :try_start_2
    invoke-static {v9, v10}, Ljava/lang/Thread;->sleep(J)V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 190
    .line 191
    .line 192
    goto :goto_2

    .line 193
    :catch_1
    move-exception v0

    .line 194
    :try_start_3
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 195
    .line 196
    .line 197
    :cond_8
    :goto_2
    iget-object v0, v1, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 198
    .line 199
    invoke-virtual {v3, v13}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    move-result-object v3

    .line 203
    const/16 v4, 0x69

    .line 204
    .line 205
    invoke-interface {v0, v4, v7, v3, v12}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 206
    .line 207
    .line 208
    iget-object v13, v1, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 209
    .line 210
    if-nez v2, :cond_9

    .line 211
    .line 212
    move/from16 v16, v7

    .line 213
    .line 214
    goto :goto_3

    .line 215
    :cond_9
    move/from16 v16, v8

    .line 216
    .line 217
    :goto_3
    const-string v17, "torch success"

    .line 218
    .line 219
    iget-object v0, v1, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 220
    .line 221
    const/4 v14, 0x1

    .line 222
    const/4 v15, 0x0

    .line 223
    move-object/from16 v18, v0

    .line 224
    .line 225
    invoke-interface/range {v13 .. v18}, Lcom/ss/android/ttvecamera/c$a;->h(IIILjava/lang/String;Ljava/lang/Object;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 226
    .line 227
    .line 228
    return-void

    .line 229
    :cond_a
    const-string v3, "Camera does not support flash mode: "

    .line 230
    .line 231
    if-eqz v5, :cond_b

    .line 232
    .line 233
    :try_start_4
    new-instance v4, Ljava/lang/StringBuilder;

    .line 234
    .line 235
    invoke-direct {v4, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 236
    .line 237
    .line 238
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 239
    .line 240
    .line 241
    const-string v3, "support list: "

    .line 242
    .line 243
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 244
    .line 245
    .line 246
    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object v3

    .line 250
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 251
    .line 252
    .line 253
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 254
    .line 255
    .line 256
    move-result-object v3

    .line 257
    :goto_4
    move-object v13, v3

    .line 258
    goto :goto_5

    .line 259
    :cond_b
    new-instance v4, Ljava/lang/StringBuilder;

    .line 260
    .line 261
    invoke-direct {v4, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 262
    .line 263
    .line 264
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 265
    .line 266
    .line 267
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 268
    .line 269
    .line 270
    move-result-object v3

    .line 271
    goto :goto_4

    .line 272
    :goto_5
    new-instance v3, Ljava/lang/StringBuilder;

    .line 273
    .line 274
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 275
    .line 276
    .line 277
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 278
    .line 279
    .line 280
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 281
    .line 282
    .line 283
    move-result-object v0

    .line 284
    invoke-static {v6, v0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 285
    .line 286
    .line 287
    invoke-static {v6, v13}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 288
    .line 289
    .line 290
    iget-object v0, v1, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 291
    .line 292
    iget-object v3, v1, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 293
    .line 294
    const/16 v4, -0x1a3

    .line 295
    .line 296
    invoke-interface {v0, v8, v4, v13, v3}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 297
    .line 298
    .line 299
    iget-object v9, v1, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 300
    .line 301
    if-nez v2, :cond_c

    .line 302
    .line 303
    move v12, v7

    .line 304
    goto :goto_6

    .line 305
    :cond_c
    move v12, v8

    .line 306
    :goto_6
    iget-object v14, v1, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 307
    .line 308
    const/4 v10, 0x1

    .line 309
    const/16 v11, -0x1a3

    .line 310
    .line 311
    invoke-interface/range {v9 .. v14}, Lcom/ss/android/ttvecamera/c$a;->g(IIILjava/lang/String;Ljava/lang/Object;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 312
    .line 313
    .line 314
    return-void

    .line 315
    :goto_7
    new-instance v3, Ljava/lang/StringBuilder;

    .line 316
    .line 317
    const-string v4, "[VE_UI_TEST]Failed event: TOGGLE_TORCH. Code: -419. Reason: "

    .line 318
    .line 319
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 320
    .line 321
    .line 322
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 323
    .line 324
    .line 325
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 326
    .line 327
    .line 328
    move-result-object v3

    .line 329
    invoke-static {v6, v3}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 330
    .line 331
    .line 332
    new-instance v3, Ljava/lang/StringBuilder;

    .line 333
    .line 334
    const-string v4, "Switch flash mode failed: "

    .line 335
    .line 336
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 337
    .line 338
    .line 339
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 340
    .line 341
    .line 342
    move-result-object v0

    .line 343
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 344
    .line 345
    .line 346
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 347
    .line 348
    .line 349
    move-result-object v13

    .line 350
    invoke-static {v6, v13}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 351
    .line 352
    .line 353
    iget-object v0, v1, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 354
    .line 355
    const/16 v3, -0x1a2

    .line 356
    .line 357
    iget-object v4, v1, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 358
    .line 359
    invoke-interface {v0, v8, v3, v13, v4}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 360
    .line 361
    .line 362
    iget-object v9, v1, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 363
    .line 364
    if-nez v2, :cond_d

    .line 365
    .line 366
    move v12, v7

    .line 367
    goto :goto_8

    .line 368
    :cond_d
    move v12, v8

    .line 369
    :goto_8
    iget-object v14, v1, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 370
    .line 371
    const/4 v10, 0x1

    .line 372
    const/16 v11, -0x1a2

    .line 373
    .line 374
    invoke-interface/range {v9 .. v14}, Lcom/ss/android/ttvecamera/c$a;->g(IIILjava/lang/String;Ljava/lang/Object;)V

    .line 375
    .line 376
    .line 377
    return-void
.end method

.method public D0(IILcom/ss/android/ttvecamera/TECameraSettings$l;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string p1, "TECamera1"

    .line 6
    .line 7
    const-string p2, "takePicture : camera is null"

    .line 8
    .line 9
    invoke-static {p1, p2}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 13
    .line 14
    const/16 p3, -0x1b7

    .line 15
    .line 16
    iget-object p0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    invoke-interface {p1, v0, p3, p2, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    :try_start_0
    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 28
    .line 29
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getPictureSize()Landroid/hardware/Camera$Size;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget v0, v0, Landroid/hardware/Camera$Size;->width:I

    .line 34
    .line 35
    if-ne v0, p1, :cond_1

    .line 36
    .line 37
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 38
    .line 39
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getPictureSize()Landroid/hardware/Camera$Size;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iget v0, v0, Landroid/hardware/Camera$Size;->height:I

    .line 44
    .line 45
    if-eq v0, p2, :cond_3

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :catch_0
    move-exception p1

    .line 49
    goto :goto_2

    .line 50
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 51
    .line 52
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getSupportedPictureSizes()Ljava/util/List;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-static {v0}, Lcom/ss/android/ttvecamera/a;->M0(Ljava/util/List;)Ljava/util/List;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 61
    .line 62
    invoke-virtual {v1}, Lcom/ss/android/ttvecamera/TECameraSettings;->a()Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    new-instance v2, Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 67
    .line 68
    invoke-direct {v2, p1, p2}, Lcom/ss/android/ttvecamera/TEFrameSizei;-><init>(II)V

    .line 69
    .line 70
    .line 71
    invoke-static {v0, v1, v2}, Lcom/ss/android/ttvecamera/f;->p(Ljava/util/List;Lcom/ss/android/ttvecamera/TEFrameSizei;Lcom/ss/android/ttvecamera/TEFrameSizei;)Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    iget-object p2, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 76
    .line 77
    iget v0, p1, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 78
    .line 79
    iget p1, p1, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 80
    .line 81
    invoke-virtual {p2, v0, p1}, Landroid/hardware/Camera$Parameters;->setPictureSize(II)V

    .line 82
    .line 83
    .line 84
    iget-object p1, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 85
    .line 86
    invoke-virtual {p1}, Landroid/hardware/Camera$Parameters;->getSupportedPictureFormats()Ljava/util/List;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    iget-object p2, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 91
    .line 92
    iget-boolean p2, p2, Lcom/ss/android/ttvecamera/TECameraSettings;->q0:Z

    .line 93
    .line 94
    if-eqz p2, :cond_2

    .line 95
    .line 96
    if-eqz p1, :cond_2

    .line 97
    .line 98
    const/16 p2, 0x11

    .line 99
    .line 100
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-interface {p1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    move-result p1

    .line 108
    if-eqz p1, :cond_2

    .line 109
    .line 110
    iget-object p1, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 111
    .line 112
    invoke-virtual {p1, p2}, Landroid/hardware/Camera$Parameters;->setPictureFormat(I)V

    .line 113
    .line 114
    .line 115
    goto :goto_1

    .line 116
    :cond_2
    iget-object p1, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 117
    .line 118
    const/16 p2, 0x100

    .line 119
    .line 120
    invoke-virtual {p1, p2}, Landroid/hardware/Camera$Parameters;->setPictureFormat(I)V

    .line 121
    .line 122
    .line 123
    iget-object p1, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 124
    .line 125
    const/16 p2, 0x64

    .line 126
    .line 127
    invoke-virtual {p1, p2}, Landroid/hardware/Camera$Parameters;->setJpegQuality(I)V

    .line 128
    .line 129
    .line 130
    :goto_1
    iget-object p1, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 131
    .line 132
    iget-object p2, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 133
    .line 134
    invoke-virtual {p1, p2}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 135
    .line 136
    .line 137
    :cond_3
    const/4 p1, 0x0

    .line 138
    iput-boolean p1, p0, Lcom/ss/android/ttvecamera/c;->c:Z

    .line 139
    .line 140
    iget-object p1, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 141
    .line 142
    new-instance p2, Lcom/ss/android/ttvecamera/a$b;

    .line 143
    .line 144
    invoke-direct {p2, p0, p3}, Lcom/ss/android/ttvecamera/a$b;-><init>(Lcom/ss/android/ttvecamera/a;Lcom/ss/android/ttvecamera/TECameraSettings$l;)V

    .line 145
    .line 146
    .line 147
    const/4 v0, 0x0

    .line 148
    invoke-virtual {p1, v0, v0, p2}, Landroid/hardware/Camera;->takePicture(Landroid/hardware/Camera$ShutterCallback;Landroid/hardware/Camera$PictureCallback;Landroid/hardware/Camera$PictureCallback;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 149
    .line 150
    .line 151
    return-void

    .line 152
    :goto_2
    invoke-static {p1}, Lcom/ss/android/ttvecamera/e;->a(Ljava/lang/Throwable;)V

    .line 153
    .line 154
    .line 155
    if-eqz p3, :cond_4

    .line 156
    .line 157
    const/16 p2, -0x3e8

    .line 158
    .line 159
    invoke-virtual {p0, p1, p2}, Lcom/ss/android/ttvecamera/c;->h(Ljava/lang/Exception;I)Ljava/lang/Exception;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    invoke-interface {p3, p0}, Lcom/ss/android/ttvecamera/TECameraSettings$l;->a(Ljava/lang/Exception;)V

    .line 164
    .line 165
    .line 166
    :cond_4
    return-void
.end method

.method public E0(Lcom/ss/android/ttvecamera/TECameraSettings$l;)V
    .locals 4

    .line 1
    const-string v0, "takePicture size: "

    .line 2
    .line 3
    iget-object v1, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 4
    .line 5
    const-string v2, "TECamera1"

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    const-string p1, "takePicture: camera is null."

    .line 10
    .line 11
    invoke-static {v2, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 15
    .line 16
    const/16 v1, -0x1b7

    .line 17
    .line 18
    iget-object p0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 19
    .line 20
    const/4 v2, 0x1

    .line 21
    invoke-interface {v0, v2, v1, p1, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    const/4 v1, 0x0

    .line 26
    :try_start_0
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/c;->c:Z

    .line 27
    .line 28
    new-instance v1, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->r:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/TEFrameSizei;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-static {v2, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 52
    .line 53
    .line 54
    move-result-wide v0

    .line 55
    iget-object v2, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 56
    .line 57
    new-instance v3, Lcom/ss/android/ttvecamera/a$c;

    .line 58
    .line 59
    invoke-direct {v3, p0, v0, v1, p1}, Lcom/ss/android/ttvecamera/a$c;-><init>(Lcom/ss/android/ttvecamera/a;JLcom/ss/android/ttvecamera/TECameraSettings$l;)V

    .line 60
    .line 61
    .line 62
    const/4 v0, 0x0

    .line 63
    invoke-virtual {v2, v0, v0, v3}, Landroid/hardware/Camera;->takePicture(Landroid/hardware/Camera$ShutterCallback;Landroid/hardware/Camera$PictureCallback;Landroid/hardware/Camera$PictureCallback;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :catch_0
    move-exception v0

    .line 68
    invoke-static {v0}, Lcom/ss/android/ttvecamera/e;->a(Ljava/lang/Throwable;)V

    .line 69
    .line 70
    .line 71
    if-eqz p1, :cond_1

    .line 72
    .line 73
    const/16 v1, -0x3e8

    .line 74
    .line 75
    invoke-virtual {p0, v0, v1}, Lcom/ss/android/ttvecamera/c;->h(Ljava/lang/Exception;I)Ljava/lang/Exception;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-interface {p1, p0}, Lcom/ss/android/ttvecamera/TECameraSettings$l;->a(Ljava/lang/Exception;)V

    .line 80
    .line 81
    .line 82
    :cond_1
    return-void
.end method

.method public F0(Z)V
    .locals 11

    .line 1
    const-string v0, "toggleTorch "

    .line 2
    .line 3
    const-string v2, "camera1 did change flash mode "

    .line 4
    .line 5
    const-string v3, "camera1 will change flash mode "

    .line 6
    .line 7
    const/4 v4, 0x0

    .line 8
    iput-boolean v4, p0, Lcom/ss/android/ttvecamera/a;->M:Z

    .line 9
    .line 10
    iget-object v5, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 11
    .line 12
    const/4 v8, 0x1

    .line 13
    const-string v9, "TECamera1"

    .line 14
    .line 15
    if-nez v5, :cond_0

    .line 16
    .line 17
    const-string v0, "[VE_UI_TEST]Failed event: TOGGLE_TORCH. Code: -439. Reason: mCameraDevice is null"

    .line 18
    .line 19
    invoke-static {v9, v0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const-string v4, "toggleTorch : Camera is not ready!"

    .line 23
    .line 24
    invoke-static {v9, v4}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 28
    .line 29
    const/16 v2, -0x1b7

    .line 30
    .line 31
    iget-object v3, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 32
    .line 33
    invoke-interface {v0, v8, v2, v4, v3}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 37
    .line 38
    iget-object v5, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 39
    .line 40
    const/4 v1, 0x1

    .line 41
    move v3, p1

    .line 42
    invoke-interface/range {v0 .. v5}, Lcom/ss/android/ttvecamera/c$a;->g(IIILjava/lang/String;Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_0
    iget-object v5, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 47
    .line 48
    iget v5, v5, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 49
    .line 50
    if-ne v5, v8, :cond_1

    .line 51
    .line 52
    const-string v0, "[VE_UI_TEST]Failed event: TOGGLE_TORCH. Code: -416. Reason: not support torch"

    .line 53
    .line 54
    invoke-static {v9, v0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    const-string v4, "Front camera does not support torch!"

    .line 58
    .line 59
    invoke-static {v9, v4}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 63
    .line 64
    iget-object v2, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 65
    .line 66
    const/16 v3, -0x1a0

    .line 67
    .line 68
    invoke-interface {v0, v3, v3, v4, v2}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 72
    .line 73
    const/16 v2, -0x1a0

    .line 74
    .line 75
    iget-object v5, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 76
    .line 77
    const/4 v1, 0x1

    .line 78
    move v3, p1

    .line 79
    invoke-interface/range {v0 .. v5}, Lcom/ss/android/ttvecamera/c$a;->g(IIILjava/lang/String;Ljava/lang/Object;)V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :cond_1
    :try_start_0
    iget-object v6, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 84
    .line 85
    new-instance v7, Ljava/lang/StringBuilder;

    .line 86
    .line 87
    invoke-direct {v7, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v3

    .line 97
    const/4 v7, 0x0

    .line 98
    const/16 v10, 0x68

    .line 99
    .line 100
    invoke-interface {v6, v10, v4, v3, v7}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 101
    .line 102
    .line 103
    iget-object v3, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 104
    .line 105
    invoke-virtual {v3}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 106
    .line 107
    .line 108
    move-result-object v3

    .line 109
    iput-object v3, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 110
    .line 111
    if-eqz p1, :cond_2

    .line 112
    .line 113
    const-string v6, "torch"

    .line 114
    .line 115
    goto :goto_0

    .line 116
    :catch_0
    move-exception v0

    .line 117
    goto :goto_1

    .line 118
    :cond_2
    const-string v6, "off"

    .line 119
    .line 120
    :goto_0
    invoke-virtual {v3, v6}, Landroid/hardware/Camera$Parameters;->setFlashMode(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    iget-object v3, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 124
    .line 125
    iget-object v6, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 126
    .line 127
    invoke-virtual {v3, v6}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 128
    .line 129
    .line 130
    iget-object v3, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 131
    .line 132
    new-instance v6, Ljava/lang/StringBuilder;

    .line 133
    .line 134
    invoke-direct {v6, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v2

    .line 144
    const/16 v6, 0x69

    .line 145
    .line 146
    invoke-interface {v3, v6, v4, v2, v7}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 147
    .line 148
    .line 149
    iget-object v2, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 150
    .line 151
    new-instance v3, Ljava/lang/StringBuilder;

    .line 152
    .line 153
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v6

    .line 163
    iget-object v7, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 164
    .line 165
    const/4 v3, 0x1

    .line 166
    const/4 v4, 0x0

    .line 167
    move v5, p1

    .line 168
    invoke-interface/range {v2 .. v7}, Lcom/ss/android/ttvecamera/c$a;->h(IIILjava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 169
    .line 170
    .line 171
    return-void

    .line 172
    :goto_1
    new-instance v2, Ljava/lang/StringBuilder;

    .line 173
    .line 174
    const-string v3, "[VE_UI_TEST]Failed event: TOGGLE_TORCH. Code: -417. Reason: "

    .line 175
    .line 176
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 177
    .line 178
    .line 179
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 180
    .line 181
    .line 182
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v2

    .line 186
    invoke-static {v9, v2}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 187
    .line 188
    .line 189
    new-instance v2, Ljava/lang/StringBuilder;

    .line 190
    .line 191
    const-string v3, "Toggle torch failed: "

    .line 192
    .line 193
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 194
    .line 195
    .line 196
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 201
    .line 202
    .line 203
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object v4

    .line 207
    invoke-static {v9, v4}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 208
    .line 209
    .line 210
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 211
    .line 212
    const/16 v2, -0x1a1

    .line 213
    .line 214
    iget-object v3, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 215
    .line 216
    invoke-interface {v0, v8, v2, v4, v3}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 217
    .line 218
    .line 219
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 220
    .line 221
    iget-object v5, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 222
    .line 223
    const/4 v1, 0x1

    .line 224
    move v3, p1

    .line 225
    invoke-interface/range {v0 .. v5}, Lcom/ss/android/ttvecamera/c$a;->g(IIILjava/lang/String;Ljava/lang/Object;)V

    .line 226
    .line 227
    .line 228
    return-void
.end method

.method public H0(FLcom/ss/android/ttvecamera/TECameraSettings$p;)V
    .locals 4

    .line 1
    const-string v0, "TECamera1"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/ss/android/ttvecamera/a;->G:Ljava/util/List;

    .line 4
    .line 5
    if-eqz v1, :cond_4

    .line 6
    .line 7
    iget-object v2, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 8
    .line 9
    if-nez v2, :cond_0

    .line 10
    .line 11
    goto/16 :goto_2

    .line 12
    .line 13
    :cond_0
    iget v2, p0, Lcom/ss/android/ttvecamera/a;->H:F

    .line 14
    .line 15
    mul-float/2addr v2, p1

    .line 16
    iput v2, p0, Lcom/ss/android/ttvecamera/a;->H:F

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    :try_start_0
    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, Ljava/lang/Integer;

    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    int-to-float v1, v1

    .line 30
    cmpg-float v1, v2, v1

    .line 31
    .line 32
    if-gez v1, :cond_1

    .line 33
    .line 34
    iget-object v1, p0, Lcom/ss/android/ttvecamera/a;->G:Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    check-cast p1, Ljava/lang/Integer;

    .line 41
    .line 42
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    int-to-float p1, p1

    .line 47
    iput p1, p0, Lcom/ss/android/ttvecamera/a;->H:F

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :catch_0
    move-exception p0

    .line 51
    goto :goto_1

    .line 52
    :cond_1
    :goto_0
    iget p1, p0, Lcom/ss/android/ttvecamera/a;->H:F

    .line 53
    .line 54
    iget-object v1, p0, Lcom/ss/android/ttvecamera/a;->G:Ljava/util/List;

    .line 55
    .line 56
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    const/4 v3, 0x1

    .line 61
    sub-int/2addr v2, v3

    .line 62
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    check-cast v1, Ljava/lang/Integer;

    .line 67
    .line 68
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    int-to-float v1, v1

    .line 73
    cmpl-float p1, p1, v1

    .line 74
    .line 75
    if-lez p1, :cond_2

    .line 76
    .line 77
    iget-object p1, p0, Lcom/ss/android/ttvecamera/a;->G:Ljava/util/List;

    .line 78
    .line 79
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    sub-int/2addr v1, v3

    .line 84
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    check-cast p1, Ljava/lang/Integer;

    .line 89
    .line 90
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    int-to-float p1, p1

    .line 95
    iput p1, p0, Lcom/ss/android/ttvecamera/a;->H:F

    .line 96
    .line 97
    :cond_2
    iget-object p1, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 98
    .line 99
    invoke-virtual {p1}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    if-eqz p1, :cond_3

    .line 104
    .line 105
    invoke-virtual {p1}, Landroid/hardware/Camera$Parameters;->isZoomSupported()Z

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    if-eqz v1, :cond_3

    .line 110
    .line 111
    iget v1, p0, Lcom/ss/android/ttvecamera/a;->H:F

    .line 112
    .line 113
    float-to-int v1, v1

    .line 114
    invoke-direct {p0, v1}, Lcom/ss/android/ttvecamera/a;->O0(I)I

    .line 115
    .line 116
    .line 117
    move-result v1

    .line 118
    invoke-virtual {p1}, Landroid/hardware/Camera$Parameters;->getZoom()I

    .line 119
    .line 120
    .line 121
    move-result v2

    .line 122
    if-eq v2, v1, :cond_4

    .line 123
    .line 124
    invoke-virtual {p1, v1}, Landroid/hardware/Camera$Parameters;->setZoom(I)V

    .line 125
    .line 126
    .line 127
    iget-object v2, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 128
    .line 129
    invoke-virtual {v2, p1}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 130
    .line 131
    .line 132
    if-eqz p2, :cond_4

    .line 133
    .line 134
    iget-object p0, p0, Lcom/ss/android/ttvecamera/a;->G:Ljava/util/List;

    .line 135
    .line 136
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    check-cast p0, Ljava/lang/Integer;

    .line 141
    .line 142
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 143
    .line 144
    .line 145
    move-result p0

    .line 146
    int-to-float p0, p0

    .line 147
    const/high16 p1, 0x42c80000    # 100.0f

    .line 148
    .line 149
    div-float/2addr p0, p1

    .line 150
    invoke-interface {p2, v3, p0, v3}, Lcom/ss/android/ttvecamera/TECameraSettings$p;->onChange(IFZ)V

    .line 151
    .line 152
    .line 153
    return-void

    .line 154
    :cond_3
    const-string p0, "[VE_UI_TEST]Failed event: SET_ZOOM. Code: -420. Reason: getParameters is null"

    .line 155
    .line 156
    invoke-static {v0, p0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 157
    .line 158
    .line 159
    const-string p0, "setZoom failed for getParameters null"

    .line 160
    .line 161
    invoke-static {v0, p0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 162
    .line 163
    .line 164
    return-void

    .line 165
    :goto_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 166
    .line 167
    const-string p2, "[VE_UI_TEST]Failed event: SET_ZOOM. Code: -420. Reason: "

    .line 168
    .line 169
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 170
    .line 171
    .line 172
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object p1

    .line 179
    invoke-static {v0, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 180
    .line 181
    .line 182
    new-instance p1, Ljava/lang/StringBuilder;

    .line 183
    .line 184
    const-string p2, "setZoom failed, "

    .line 185
    .line 186
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 187
    .line 188
    .line 189
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object p0

    .line 193
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 194
    .line 195
    .line 196
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object p0

    .line 200
    invoke-static {v0, p0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 201
    .line 202
    .line 203
    :cond_4
    :goto_2
    return-void
.end method

.method public I()[I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getPictureSize()Landroid/hardware/Camera$Size;

    .line 11
    .line 12
    .line 13
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    goto :goto_0

    .line 15
    :catch_0
    move-exception p0

    .line 16
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 17
    .line 18
    .line 19
    :cond_0
    move-object p0, v0

    .line 20
    :goto_0
    if-nez p0, :cond_1

    .line 21
    .line 22
    return-object v0

    .line 23
    :cond_1
    iget v0, p0, Landroid/hardware/Camera$Size;->width:I

    .line 24
    .line 25
    iget p0, p0, Landroid/hardware/Camera$Size;->height:I

    .line 26
    .line 27
    filled-new-array {v0, p0}, [I

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0
.end method

.method public J()[I
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    :try_start_0
    invoke-virtual {p0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 v0, 0x2

    .line 10
    new-array v0, v0, [I

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Landroid/hardware/Camera$Parameters;->getPreviewFpsRange([I)V

    .line 13
    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    aget v1, v0, p0

    .line 17
    .line 18
    div-int/lit16 v1, v1, 0x3e8

    .line 19
    .line 20
    aput v1, v0, p0

    .line 21
    .line 22
    const/4 p0, 0x1

    .line 23
    aget v1, v0, p0

    .line 24
    .line 25
    div-int/lit16 v1, v1, 0x3e8

    .line 26
    .line 27
    aput v1, v0, p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 28
    .line 29
    return-object v0

    .line 30
    :catch_0
    move-exception p0

    .line 31
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 32
    .line 33
    .line 34
    :cond_0
    const/4 p0, 0x0

    .line 35
    return-object p0
.end method

.method public N()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/ss/android/ttvecamera/TEFrameSizei;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->E:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/ss/android/ttvecamera/a;->E:Ljava/util/List;

    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getSupportedPictureSizes()Ljava/util/List;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Lcom/ss/android/ttvecamera/a;->M0(Ljava/util/List;)Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iput-object v0, p0, Lcom/ss/android/ttvecamera/a;->E:Ljava/util/List;

    .line 22
    .line 23
    return-object v0
.end method

.method public O()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/ss/android/ttvecamera/TEFrameSizei;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->D:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/ss/android/ttvecamera/a;->D:Ljava/util/List;

    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewSizes()Ljava/util/List;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Lcom/ss/android/ttvecamera/a;->M0(Ljava/util/List;)Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iput-object v0, p0, Lcom/ss/android/ttvecamera/a;->D:Ljava/util/List;

    .line 22
    .line 23
    return-object v0
.end method

.method public Q()Z
    .locals 2

    .line 1
    const-string v0, "TECamera1"

    .line 2
    .line 3
    const-string v1, "isAutoExposureLockSupported..."

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-boolean p0, p0, Lcom/ss/android/ttvecamera/c;->c:Z

    .line 17
    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->isAutoExposureLockSupported()Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public R()Z
    .locals 4

    .line 1
    const-string v0, "TECamera1"

    .line 2
    .line 3
    const-string v1, "isAutoFocusLockSupported..."

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v2, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 14
    .line 15
    if-eqz v2, :cond_0

    .line 16
    .line 17
    iget-boolean v3, p0, Lcom/ss/android/ttvecamera/c;->c:Z

    .line 18
    .line 19
    if-eqz v3, :cond_0

    .line 20
    .line 21
    :try_start_0
    invoke-virtual {v2}, Landroid/hardware/Camera$Parameters;->getSupportedFocusModes()Ljava/util/List;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v2, "fixed"

    .line 26
    .line 27
    invoke-interface {v0, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    if-eqz p0, :cond_1

    .line 32
    .line 33
    return v1

    .line 34
    :catch_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 35
    .line 36
    iget-object p0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 37
    .line 38
    const/16 v1, -0x1b1

    .line 39
    .line 40
    const-string v2, "isAutoFocusLockSupported failed"

    .line 41
    .line 42
    invoke-interface {v0, v1, v1, v2, p0}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    iget-object p0, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 47
    .line 48
    const/16 v2, -0x1b7

    .line 49
    .line 50
    const-string v3, "setAutoFocusLock failed. \uff1a Camera is null."

    .line 51
    .line 52
    invoke-interface {p0, v1, v2, v3, v0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 56
    return p0
.end method

.method public T()Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    iget-object v1, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 3
    .line 4
    if-eqz v1, :cond_0

    .line 5
    .line 6
    iget-object v1, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {v1}, Landroid/hardware/Camera$Parameters;->getSupportedWhiteBalance()Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->isAutoWhiteBalanceLockSupported()Z

    .line 19
    .line 20
    .line 21
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    const/4 p0, 0x1

    .line 25
    return p0

    .line 26
    :catch_0
    move-exception p0

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    return v0

    .line 29
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    const-string v2, "Unsupported whileBalance!: "

    .line 32
    .line 33
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    const-string v1, "TECamera1"

    .line 48
    .line 49
    invoke-static {v1, p0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    return v0
.end method

.method public T0(I)V
    .locals 2

    .line 1
    const-string v0, "Camera start face detect"

    .line 2
    .line 3
    const-string v1, "TECamera1"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-boolean v0, p0, Lcom/ss/android/ttvecamera/c;->c:Z

    .line 9
    .line 10
    if-eqz v0, :cond_2

    .line 11
    .line 12
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 13
    .line 14
    if-eqz v0, :cond_2

    .line 15
    .line 16
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getMaxNumDetectedFaces()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-lez v0, :cond_2

    .line 23
    .line 24
    const/4 v0, 0x1

    .line 25
    if-ne p1, v0, :cond_0

    .line 26
    .line 27
    :try_start_0
    iget p1, p0, Lcom/ss/android/ttvecamera/c;->h:I

    .line 28
    .line 29
    if-ne p1, v0, :cond_2

    .line 30
    .line 31
    iget-object p0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/hardware/Camera;->startFaceDetection()V

    .line 34
    .line 35
    .line 36
    const-string p0, "use faceae for front"

    .line 37
    .line 38
    invoke-static {v1, p0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    const/4 v0, 0x2

    .line 43
    if-ne p1, v0, :cond_1

    .line 44
    .line 45
    iget p1, p0, Lcom/ss/android/ttvecamera/c;->h:I

    .line 46
    .line 47
    if-nez p1, :cond_2

    .line 48
    .line 49
    iget-object p0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 50
    .line 51
    invoke-virtual {p0}, Landroid/hardware/Camera;->startFaceDetection()V

    .line 52
    .line 53
    .line 54
    const-string p0, "use faceae for rear"

    .line 55
    .line 56
    invoke-static {v1, p0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_1
    const/4 v0, 0x3

    .line 61
    if-ne p1, v0, :cond_2

    .line 62
    .line 63
    iget-object p0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 64
    .line 65
    invoke-virtual {p0}, Landroid/hardware/Camera;->startFaceDetection()V

    .line 66
    .line 67
    .line 68
    const-string p0, "use faceae for all"

    .line 69
    .line 70
    invoke-static {v1, p0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :catch_0
    const-string p0, "camera start face detect failed"

    .line 75
    .line 76
    invoke-static {v1, p0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    :cond_2
    return-void
.end method

.method public U()Z
    .locals 2

    .line 1
    const-string v0, "TECamera1"

    .line 2
    .line 3
    const-string v1, "isSupportedExposureCompensation..."

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-boolean v0, p0, Lcom/ss/android/ttvecamera/c;->c:Z

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object p0, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->K:Lcom/ss/android/ttvecamera/TECameraSettings$d;

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/TECameraSettings$d;->a()Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    return p0

    .line 29
    :cond_0
    const/4 p0, 0x0

    .line 30
    return p0
.end method

.method public V()Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/c;->A()Ljava/util/Map;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->H:Ljava/lang/String;

    .line 8
    .line 9
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Landroid/os/Bundle;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    if-nez p0, :cond_0

    .line 17
    .line 18
    return v0

    .line 19
    :cond_0
    const-string v1, "camera_torch_supported"

    .line 20
    .line 21
    invoke-virtual {p0, v1, v0}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    return p0
.end method

.method public W(Lcom/ss/android/ttvecamera/TECameraSettings;Lcom/bytedance/bpea/basics/Cert;)I
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/ss/android/ttvecamera/c;->W(Lcom/ss/android/ttvecamera/TECameraSettings;Lcom/bytedance/bpea/basics/Cert;)I

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 5
    .line 6
    iget p1, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 7
    .line 8
    iput p1, p0, Lcom/ss/android/ttvecamera/c;->i:I

    .line 9
    .line 10
    invoke-direct {p0, p2}, Lcom/ss/android/ttvecamera/a;->S0(Lcom/bytedance/bpea/basics/Cert;)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method public Z(Lcom/ss/android/ttvecamera/TECameraSettings$n;)V
    .locals 8

    .line 1
    const-string v0, "TECamera1"

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    const-string p0, "ShaderZoomCallback is null, do nothing!"

    .line 6
    .line 7
    invoke-static {v0, p0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object v1, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 12
    .line 13
    const/4 v2, 0x1

    .line 14
    if-nez v1, :cond_1

    .line 15
    .line 16
    const-string p1, "queryShaderZoomStep : Camera is null!"

    .line 17
    .line 18
    invoke-static {v0, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 22
    .line 23
    const/16 v1, -0x1b7

    .line 24
    .line 25
    iget-object p0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 26
    .line 27
    invoke-interface {v0, v2, v1, p1, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    :try_start_0
    invoke-virtual {v1}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    if-eqz v1, :cond_4

    .line 36
    .line 37
    invoke-virtual {v1}, Landroid/hardware/Camera$Parameters;->isZoomSupported()Z

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    if-eqz v3, :cond_4

    .line 42
    .line 43
    invoke-virtual {v1}, Landroid/hardware/Camera$Parameters;->getMaxZoom()I

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    const/16 v4, 0x63

    .line 48
    .line 49
    if-le v3, v4, :cond_2

    .line 50
    .line 51
    move v3, v4

    .line 52
    :cond_2
    invoke-virtual {v1}, Landroid/hardware/Camera$Parameters;->getZoomRatios()Ljava/util/List;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    if-gtz v3, :cond_3

    .line 57
    .line 58
    const/4 v1, 0x0

    .line 59
    invoke-interface {p1, v1}, Lcom/ss/android/ttvecamera/TECameraSettings$n;->a(F)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :catch_0
    move-exception p1

    .line 64
    goto :goto_0

    .line 65
    :cond_3
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    check-cast v3, Ljava/lang/Integer;

    .line 70
    .line 71
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 72
    .line 73
    .line 74
    move-result v3

    .line 75
    const/4 v4, 0x0

    .line 76
    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    check-cast v1, Ljava/lang/Integer;

    .line 81
    .line 82
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    sub-int/2addr v3, v1

    .line 87
    int-to-float v1, v3

    .line 88
    const/high16 v3, 0x42c80000    # 100.0f

    .line 89
    .line 90
    div-float/2addr v1, v3

    .line 91
    const/high16 v3, 0x3f800000    # 1.0f

    .line 92
    .line 93
    add-float/2addr v1, v3

    .line 94
    float-to-double v4, v1

    .line 95
    const-wide/high16 v6, 0x3fe0000000000000L    # 0.5

    .line 96
    .line 97
    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->pow(DD)D

    .line 98
    .line 99
    .line 100
    move-result-wide v4

    .line 101
    double-to-float v1, v4

    .line 102
    sub-float/2addr v1, v3

    .line 103
    invoke-interface {p1, v1}, Lcom/ss/android/ttvecamera/TECameraSettings$n;->a(F)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 104
    .line 105
    .line 106
    :cond_4
    return-void

    .line 107
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 108
    .line 109
    const-string v3, "Query shader zoom step failed : "

    .line 110
    .line 111
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    invoke-static {v0, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 129
    .line 130
    const/16 v1, -0x1a4

    .line 131
    .line 132
    iget-object p0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 133
    .line 134
    invoke-interface {v0, v2, v1, p1, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 135
    .line 136
    .line 137
    return-void
.end method

.method public a0(Lcom/ss/android/ttvecamera/TECameraSettings$p;Z)V
    .locals 10

    .line 1
    const-string v1, "TECamera1"

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    const-string p0, "ZoomCallback is null, do nothing!"

    .line 6
    .line 7
    invoke-static {v1, p0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 12
    .line 13
    const/4 v2, 0x1

    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    const-string p1, "queryZoomAbility : Camera is null!"

    .line 17
    .line 18
    invoke-static {v1, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object p2, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 22
    .line 23
    const/16 v0, -0x1b7

    .line 24
    .line 25
    iget-object p0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 26
    .line 27
    invoke-interface {p2, v2, v0, p1, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    :try_start_0
    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getMaxZoom()I

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    int-to-float v3, v3

    .line 40
    iput v3, p0, Lcom/ss/android/ttvecamera/c;->l:F

    .line 41
    .line 42
    if-eqz p2, :cond_2

    .line 43
    .line 44
    iget-object p2, p0, Lcom/ss/android/ttvecamera/a;->G:Ljava/util/List;

    .line 45
    .line 46
    float-to-int v3, v3

    .line 47
    invoke-interface {p2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    check-cast p2, Ljava/lang/Integer;

    .line 52
    .line 53
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 54
    .line 55
    .line 56
    move-result p2

    .line 57
    int-to-float p2, p2

    .line 58
    const/high16 v3, 0x42c80000    # 100.0f

    .line 59
    .line 60
    div-float v8, p2, v3

    .line 61
    .line 62
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->isZoomSupported()Z

    .line 63
    .line 64
    .line 65
    move-result v6

    .line 66
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->isSmoothZoomSupported()Z

    .line 67
    .line 68
    .line 69
    move-result v7

    .line 70
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getZoomRatios()Ljava/util/List;

    .line 71
    .line 72
    .line 73
    move-result-object v9

    .line 74
    const/4 v5, 0x1

    .line 75
    move-object v4, p1

    .line 76
    invoke-interface/range {v4 .. v9}, Lcom/ss/android/ttvecamera/TECameraSettings$p;->onZoomSupport(IZZFLjava/util/List;)V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :catch_0
    move-exception v0

    .line 81
    move-object p1, v0

    .line 82
    goto :goto_0

    .line 83
    :cond_2
    move-object v3, p1

    .line 84
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->isZoomSupported()Z

    .line 85
    .line 86
    .line 87
    move-result v5

    .line 88
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->isSmoothZoomSupported()Z

    .line 89
    .line 90
    .line 91
    move-result v6

    .line 92
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getMaxZoom()I

    .line 93
    .line 94
    .line 95
    move-result p1

    .line 96
    int-to-float v7, p1

    .line 97
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getZoomRatios()Ljava/util/List;

    .line 98
    .line 99
    .line 100
    move-result-object v8

    .line 101
    const/4 v4, 0x1

    .line 102
    invoke-interface/range {v3 .. v8}, Lcom/ss/android/ttvecamera/TECameraSettings$p;->onZoomSupport(IZZFLjava/util/List;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 103
    .line 104
    .line 105
    return-void

    .line 106
    :goto_0
    new-instance p2, Ljava/lang/StringBuilder;

    .line 107
    .line 108
    const-string v0, "Query zoom ability failed : "

    .line 109
    .line 110
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    invoke-static {v1, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    iget-object p2, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 128
    .line 129
    const/16 v0, -0x1a4

    .line 130
    .line 131
    iget-object p0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 132
    .line 133
    invoke-interface {p2, v2, v0, p1, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 134
    .line 135
    .line 136
    return-void
.end method

.method public c()V
    .locals 2

    .line 1
    const-string v0, "TECamera1"

    .line 2
    .line 3
    const-string v1, "cancelFocus..."

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    :try_start_0
    invoke-virtual {p0}, Landroid/hardware/Camera;->cancelAutoFocus()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    .line 14
    .line 15
    :catchall_0
    :cond_0
    return-void
.end method

.method public f(Lcom/bytedance/bpea/basics/Cert;)V
    .locals 10

    .line 1
    const-string v0, "te_record_camera1_stop_preview_cost"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/a;->M:Z

    .line 5
    .line 6
    const-string v2, "Camera close start..."

    .line 7
    .line 8
    const-string v3, "TECamera1"

    .line 9
    .line 10
    invoke-static {v3, v2}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object v2, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 14
    .line 15
    const/4 v4, 0x0

    .line 16
    if-eqz v2, :cond_3

    .line 17
    .line 18
    iget-boolean v2, p0, Lcom/ss/android/ttvecamera/c;->c:Z

    .line 19
    .line 20
    const/4 v5, 0x1

    .line 21
    if-eqz v2, :cond_2

    .line 22
    .line 23
    :try_start_0
    const-string v2, "Camera close torch..."

    .line 24
    .line 25
    invoke-static {v3, v2}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object v2, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 29
    .line 30
    invoke-virtual {v2}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    iput-object v2, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 35
    .line 36
    const-string v6, "off"

    .line 37
    .line 38
    invoke-virtual {v2, v6}, Landroid/hardware/Camera$Parameters;->setFlashMode(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    iget-object v2, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 42
    .line 43
    iget-object v6, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 44
    .line 45
    invoke-virtual {v2, v6}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 46
    .line 47
    .line 48
    const-string v2, "Camera stopPreview..."

    .line 49
    .line 50
    invoke-static {v3, v2}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 54
    .line 55
    .line 56
    move-result-wide v6

    .line 57
    iget-object v2, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 58
    .line 59
    invoke-virtual {v2}, Landroid/hardware/Camera;->stopPreview()V

    .line 60
    .line 61
    .line 62
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 63
    .line 64
    .line 65
    move-result-wide v8

    .line 66
    sub-long/2addr v8, v6

    .line 67
    const-string v2, "Camera stopPreview end..."

    .line 68
    .line 69
    invoke-static {v3, v2}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    invoke-static {v0, v8, v9}, Ll/hrh0;->b(Ljava/lang/String;J)V

    .line 73
    .line 74
    .line 75
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-static {v0, v2}, Lcom/ss/android/ttvecamera/g;->f(Ljava/lang/String;Ljava/lang/Object;)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->g:Ll/jrh0;

    .line 83
    .line 84
    invoke-virtual {v0}, Ll/jrh0;->g()I

    .line 85
    .line 86
    .line 87
    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 88
    iget-object v2, p0, Lcom/ss/android/ttvecamera/c;->g:Ll/jrh0;

    .line 89
    .line 90
    if-ne v0, v5, :cond_0

    .line 91
    .line 92
    :try_start_1
    invoke-virtual {v2}, Ll/jrh0;->h()Landroid/graphics/SurfaceTexture;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-virtual {v0, v4, v4}, Landroid/graphics/SurfaceTexture;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;Landroid/os/Handler;)V

    .line 97
    .line 98
    .line 99
    goto :goto_1

    .line 100
    :catch_0
    move-exception v0

    .line 101
    goto :goto_0

    .line 102
    :cond_0
    invoke-virtual {v2}, Ll/jrh0;->g()I

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    const/4 v2, 0x4

    .line 107
    if-ne v0, v2, :cond_1

    .line 108
    .line 109
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 110
    .line 111
    invoke-virtual {v0, v4}, Landroid/hardware/Camera;->setPreviewCallbackWithBuffer(Landroid/hardware/Camera$PreviewCallback;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 112
    .line 113
    .line 114
    goto :goto_1

    .line 115
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 116
    .line 117
    const-string v6, "Close camera failed: "

    .line 118
    .line 119
    invoke-direct {v2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    invoke-static {v3, v0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    :cond_1
    :goto_1
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/c;->c:Z

    .line 137
    .line 138
    :cond_2
    :try_start_2
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 139
    .line 140
    invoke-virtual {v0, v4}, Landroid/hardware/Camera;->setErrorCallback(Landroid/hardware/Camera$ErrorCallback;)V

    .line 141
    .line 142
    .line 143
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 144
    .line 145
    const-string v2, "will close camera1"

    .line 146
    .line 147
    const/16 v6, 0x6c

    .line 148
    .line 149
    invoke-interface {v0, v6, v1, v2, v4}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 150
    .line 151
    .line 152
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 153
    .line 154
    invoke-static {p1, v0}, Ll/sqh0;->b(Lcom/bytedance/bpea/basics/Cert;Landroid/hardware/Camera;)V

    .line 155
    .line 156
    .line 157
    iget-object p1, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 158
    .line 159
    const-string v0, "did close camera1"

    .line 160
    .line 161
    const/16 v2, 0x6d

    .line 162
    .line 163
    invoke-interface {p1, v2, v1, v0, v4}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 164
    .line 165
    .line 166
    goto :goto_2

    .line 167
    :catch_1
    move-exception p1

    .line 168
    new-instance v0, Ljava/lang/StringBuilder;

    .line 169
    .line 170
    const-string v2, "Camera release failed: "

    .line 171
    .line 172
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 173
    .line 174
    .line 175
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object p1

    .line 179
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 180
    .line 181
    .line 182
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object p1

    .line 186
    invoke-static {v3, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 187
    .line 188
    .line 189
    :goto_2
    iget-object p1, p0, Lcom/ss/android/ttvecamera/a;->J:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 190
    .line 191
    invoke-virtual {p1, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 192
    .line 193
    .line 194
    iput-object v4, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 195
    .line 196
    const-string p1, "Camera closed end!"

    .line 197
    .line 198
    invoke-static {v3, p1}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 199
    .line 200
    .line 201
    iget-object p1, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 202
    .line 203
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 204
    .line 205
    invoke-interface {p1, v5, p0, v0}, Lcom/ss/android/ttvecamera/c$a;->i(ILcom/ss/android/ttvecamera/c;Ljava/lang/Object;)V

    .line 206
    .line 207
    .line 208
    :cond_3
    iput-object v4, p0, Lcom/ss/android/ttvecamera/c;->t:Lcom/bytedance/bpea/basics/Cert;

    .line 209
    .line 210
    return-void
.end method

.method public g()V
    .locals 11

    .line 1
    const-string v0, "="

    .line 2
    .line 3
    const-string v1, "TECamera1-collectCameraCapabilities"

    .line 4
    .line 5
    invoke-static {v1}, Ll/dsh0;->a(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/c;->S()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    invoke-static {}, Ll/dsh0;->b()V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 19
    .line 20
    .line 21
    move-result-wide v1

    .line 22
    :try_start_0
    iget-object v3, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 23
    .line 24
    if-eqz v3, :cond_3

    .line 25
    .line 26
    iget-object v3, p0, Lcom/ss/android/ttvecamera/c;->v:Lorg/json/JSONObject;

    .line 27
    .line 28
    const-string v4, "camera_id"

    .line 29
    .line 30
    iget-object v5, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 31
    .line 32
    iget v5, v5, Lcom/ss/android/ttvecamera/TECameraSettings;->f:I

    .line 33
    .line 34
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 35
    .line 36
    .line 37
    move-result-object v5

    .line 38
    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 39
    .line 40
    .line 41
    iget-object v3, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 42
    .line 43
    invoke-virtual {v3}, Landroid/hardware/Camera$Parameters;->isZoomSupported()Z

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    if-eqz v3, :cond_1

    .line 48
    .line 49
    iget-object v3, p0, Lcom/ss/android/ttvecamera/c;->v:Lorg/json/JSONObject;

    .line 50
    .line 51
    const-string v4, "camera_zoom_max_ability"

    .line 52
    .line 53
    iget-object v5, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 54
    .line 55
    invoke-virtual {v5}, Landroid/hardware/Camera$Parameters;->getMaxZoom()I

    .line 56
    .line 57
    .line 58
    move-result v5

    .line 59
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 60
    .line 61
    .line 62
    move-result-object v5

    .line 63
    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 64
    .line 65
    .line 66
    :cond_1
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/a;->O()Ljava/util/List;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    if-eqz v3, :cond_3

    .line 71
    .line 72
    iget-object v4, p0, Lcom/ss/android/ttvecamera/c;->u:Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector;

    .line 73
    .line 74
    new-instance v5, Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$a;

    .line 75
    .line 76
    sget-object v6, Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$Capability;->PREVIEW_SIZE:Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$Capability;

    .line 77
    .line 78
    sget-object v7, Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$DataType;->STRING:Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$DataType;

    .line 79
    .line 80
    new-instance v8, Ljava/lang/StringBuilder;

    .line 81
    .line 82
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 83
    .line 84
    .line 85
    iget-object v9, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 86
    .line 87
    iget-object v9, v9, Lcom/ss/android/ttvecamera/TECameraSettings;->H:Ljava/lang/String;

    .line 88
    .line 89
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v9

    .line 99
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v8

    .line 106
    invoke-direct {v5, v6, v7, v8}, Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$a;-><init>(Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$Capability;Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$DataType;Ljava/lang/Object;)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {v4, v5}, Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector;->a(Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$a;)V

    .line 110
    .line 111
    .line 112
    new-instance v4, Lorg/json/JSONArray;

    .line 113
    .line 114
    invoke-direct {v4}, Lorg/json/JSONArray;-><init>()V

    .line 115
    .line 116
    .line 117
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 118
    .line 119
    .line 120
    move-result-object v3

    .line 121
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 122
    .line 123
    .line 124
    move-result v5

    .line 125
    if-eqz v5, :cond_2

    .line 126
    .line 127
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object v5

    .line 131
    check-cast v5, Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 132
    .line 133
    new-instance v6, Lorg/json/JSONObject;

    .line 134
    .line 135
    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    .line 136
    .line 137
    .line 138
    const-string v7, "width"

    .line 139
    .line 140
    iget v8, v5, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 141
    .line 142
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 143
    .line 144
    .line 145
    move-result-object v8

    .line 146
    invoke-virtual {v6, v7, v8}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 147
    .line 148
    .line 149
    const-string v7, "height"

    .line 150
    .line 151
    iget v5, v5, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 152
    .line 153
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 154
    .line 155
    .line 156
    move-result-object v5

    .line 157
    invoke-virtual {v6, v7, v5}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 158
    .line 159
    .line 160
    invoke-virtual {v4, v6}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 161
    .line 162
    .line 163
    goto :goto_0

    .line 164
    :cond_2
    iget-object v3, p0, Lcom/ss/android/ttvecamera/c;->v:Lorg/json/JSONObject;

    .line 165
    .line 166
    const-string v5, "preview_size_lit"

    .line 167
    .line 168
    invoke-virtual {v3, v5, v4}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 169
    .line 170
    .line 171
    :catch_0
    :cond_3
    iget-object v3, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 172
    .line 173
    invoke-virtual {v3}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewFpsRange()Ljava/util/List;

    .line 174
    .line 175
    .line 176
    move-result-object v3

    .line 177
    new-instance v4, Ljava/lang/StringBuilder;

    .line 178
    .line 179
    new-instance v5, Ljava/lang/StringBuilder;

    .line 180
    .line 181
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 182
    .line 183
    .line 184
    iget-object v6, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 185
    .line 186
    iget-object v6, v6, Lcom/ss/android/ttvecamera/TECameraSettings;->H:Ljava/lang/String;

    .line 187
    .line 188
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 189
    .line 190
    .line 191
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 192
    .line 193
    .line 194
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 199
    .line 200
    .line 201
    const/4 v0, 0x1

    .line 202
    :try_start_1
    new-instance v5, Lorg/json/JSONArray;

    .line 203
    .line 204
    invoke-direct {v5}, Lorg/json/JSONArray;-><init>()V

    .line 205
    .line 206
    .line 207
    if-eqz v3, :cond_6

    .line 208
    .line 209
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 210
    .line 211
    .line 212
    move-result-object v6

    .line 213
    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    .line 214
    .line 215
    .line 216
    move-result v7

    .line 217
    if-eqz v7, :cond_5

    .line 218
    .line 219
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 220
    .line 221
    .line 222
    move-result-object v7

    .line 223
    check-cast v7, [I

    .line 224
    .line 225
    const-string v8, "["

    .line 226
    .line 227
    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 228
    .line 229
    .line 230
    const/4 v8, 0x0

    .line 231
    aget v9, v7, v8

    .line 232
    .line 233
    div-int/lit16 v9, v9, 0x3e8

    .line 234
    .line 235
    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 236
    .line 237
    .line 238
    const-string v9, ","

    .line 239
    .line 240
    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 241
    .line 242
    .line 243
    aget v9, v7, v0

    .line 244
    .line 245
    div-int/lit16 v9, v9, 0x3e8

    .line 246
    .line 247
    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 248
    .line 249
    .line 250
    const-string v9, "]"

    .line 251
    .line 252
    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 253
    .line 254
    .line 255
    invoke-interface {v3, v7}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 256
    .line 257
    .line 258
    move-result v9

    .line 259
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 260
    .line 261
    .line 262
    move-result v10

    .line 263
    sub-int/2addr v10, v0

    .line 264
    if-eq v9, v10, :cond_4

    .line 265
    .line 266
    const-string v9, ", "

    .line 267
    .line 268
    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 269
    .line 270
    .line 271
    :cond_4
    new-instance v9, Lorg/json/JSONObject;

    .line 272
    .line 273
    invoke-direct {v9}, Lorg/json/JSONObject;-><init>()V

    .line 274
    .line 275
    .line 276
    const-string v10, "fps_min"

    .line 277
    .line 278
    aget v8, v7, v8

    .line 279
    .line 280
    div-int/lit16 v8, v8, 0x3e8

    .line 281
    .line 282
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 283
    .line 284
    .line 285
    move-result-object v8

    .line 286
    invoke-virtual {v9, v10, v8}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 287
    .line 288
    .line 289
    const-string v8, "fps_max"

    .line 290
    .line 291
    aget v7, v7, v0

    .line 292
    .line 293
    div-int/lit16 v7, v7, 0x3e8

    .line 294
    .line 295
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 296
    .line 297
    .line 298
    move-result-object v7

    .line 299
    invoke-virtual {v9, v8, v7}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 300
    .line 301
    .line 302
    invoke-virtual {v5, v9}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 303
    .line 304
    .line 305
    goto :goto_1

    .line 306
    :cond_5
    iget-object v3, p0, Lcom/ss/android/ttvecamera/c;->u:Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector;

    .line 307
    .line 308
    new-instance v6, Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$a;

    .line 309
    .line 310
    sget-object v7, Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$Capability;->FPS_RANGE:Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$Capability;

    .line 311
    .line 312
    sget-object v8, Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$DataType;->STRING:Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$DataType;

    .line 313
    .line 314
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 315
    .line 316
    .line 317
    move-result-object v4

    .line 318
    invoke-direct {v6, v7, v8, v4}, Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$a;-><init>(Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$Capability;Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$DataType;Ljava/lang/Object;)V

    .line 319
    .line 320
    .line 321
    invoke-virtual {v3, v6}, Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector;->a(Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$a;)V

    .line 322
    .line 323
    .line 324
    iget-object v3, p0, Lcom/ss/android/ttvecamera/c;->v:Lorg/json/JSONObject;

    .line 325
    .line 326
    const-string v4, "fps_range_list"

    .line 327
    .line 328
    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 329
    .line 330
    .line 331
    :catch_1
    :cond_6
    iget-object v3, p0, Lcom/ss/android/ttvecamera/c;->u:Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector;

    .line 332
    .line 333
    invoke-virtual {v3}, Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector;->d()V

    .line 334
    .line 335
    .line 336
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 337
    .line 338
    .line 339
    move-result-wide v3

    .line 340
    sub-long/2addr v3, v1

    .line 341
    new-instance v1, Ljava/lang/StringBuilder;

    .line 342
    .line 343
    const-string v2, "collectCameraCapabilities consume: "

    .line 344
    .line 345
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 346
    .line 347
    .line 348
    invoke-virtual {v1, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 349
    .line 350
    .line 351
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 352
    .line 353
    .line 354
    move-result-object v1

    .line 355
    const-string v2, "TECamera1"

    .line 356
    .line 357
    invoke-static {v2, v1}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 358
    .line 359
    .line 360
    const-string v1, "te_record_camera_collect_capbilities_cost"

    .line 361
    .line 362
    invoke-static {v1, v3, v4}, Ll/hrh0;->b(Ljava/lang/String;J)V

    .line 363
    .line 364
    .line 365
    iput-boolean v0, p0, Lcom/ss/android/ttvecamera/c;->w:Z

    .line 366
    .line 367
    invoke-static {}, Ll/dsh0;->b()V

    .line 368
    .line 369
    .line 370
    return-void
.end method

.method public g0(Z)V
    .locals 4

    .line 1
    const-string v0, "setAutoExposureLock..."

    .line 2
    .line 3
    const-string v1, "TECamera1"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iget-object v2, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 13
    .line 14
    if-eqz v2, :cond_1

    .line 15
    .line 16
    iget-boolean v3, p0, Lcom/ss/android/ttvecamera/c;->c:Z

    .line 17
    .line 18
    if-eqz v3, :cond_1

    .line 19
    .line 20
    invoke-virtual {v2}, Landroid/hardware/Camera$Parameters;->isAutoExposureLockSupported()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    const-string p1, "Current camera doesn\'t support ae lock."

    .line 27
    .line 28
    invoke-static {v1, p1}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 34
    .line 35
    const/16 v1, -0x1aa

    .line 36
    .line 37
    invoke-interface {v0, v1, v1, p1, p0}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 42
    .line 43
    invoke-virtual {v0, p1}, Landroid/hardware/Camera$Parameters;->setAutoExposureLock(Z)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 47
    .line 48
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 49
    .line 50
    invoke-virtual {p1, v0}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :catch_0
    move-exception p1

    .line 55
    new-instance v0, Ljava/lang/StringBuilder;

    .line 56
    .line 57
    const-string v2, "Error: setAutoExposureLock failed: "

    .line 58
    .line 59
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-static {v1, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 77
    .line 78
    iget-object p0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 79
    .line 80
    const/16 v1, -0x1ab

    .line 81
    .line 82
    invoke-interface {v0, v1, v1, p1, p0}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 83
    .line 84
    .line 85
    return-void

    .line 86
    :cond_1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 87
    .line 88
    const/4 p1, 0x1

    .line 89
    const/16 v1, -0x1b7

    .line 90
    .line 91
    const-string v2, "setAutoExposureLock failed. \uff1a Camera is null."

    .line 92
    .line 93
    invoke-interface {p0, p1, v1, v2, v0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public h0(Z)V
    .locals 3

    .line 1
    const-string v0, "setAutoFocusLock..."

    .line 2
    .line 3
    const-string v1, "TECamera1"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 9
    .line 10
    if-eqz v0, :cond_2

    .line 11
    .line 12
    iget-object v2, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 13
    .line 14
    if-eqz v2, :cond_2

    .line 15
    .line 16
    iget-boolean v2, p0, Lcom/ss/android/ttvecamera/c;->c:Z

    .line 17
    .line 18
    if-eqz v2, :cond_2

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/a;->R()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    const-string p1, "Current camera doesn\'t support af lock."

    .line 27
    .line 28
    invoke-static {v1, p1}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 34
    .line 35
    const/16 v1, -0x1b1

    .line 36
    .line 37
    invoke-interface {v0, v1, v1, p1, p0}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 42
    .line 43
    if-eqz p1, :cond_1

    .line 44
    .line 45
    :try_start_0
    const-string p1, "fixed"

    .line 46
    .line 47
    invoke-virtual {v0, p1}, Landroid/hardware/Camera$Parameters;->setFocusMode(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :catch_0
    move-exception p1

    .line 52
    goto :goto_1

    .line 53
    :cond_1
    const-string p1, "continuous-video"

    .line 54
    .line 55
    invoke-virtual {v0, p1}, Landroid/hardware/Camera$Parameters;->setFocusMode(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    :goto_0
    iget-object p1, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 59
    .line 60
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 61
    .line 62
    invoke-virtual {p1, v0}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :goto_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 67
    .line 68
    const-string v2, "Error: setAutoFocusLock failed: "

    .line 69
    .line 70
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-static {v1, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 88
    .line 89
    iget-object p0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 90
    .line 91
    const/16 v1, -0x1ab

    .line 92
    .line 93
    invoke-interface {v0, v1, v1, p1, p0}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 94
    .line 95
    .line 96
    return-void

    .line 97
    :cond_2
    iget-object p0, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 98
    .line 99
    const/4 p1, 0x1

    .line 100
    const/16 v1, -0x1b7

    .line 101
    .line 102
    const-string v2, "setAutoFocusLock failed. \uff1a Camera is null."

    .line 103
    .line 104
    invoke-interface {p0, p1, v1, v2, v0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 105
    .line 106
    .line 107
    return-void
.end method

.method public j()V
    .locals 4

    .line 1
    const-string v0, "continuous-video"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    iget-object v1, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    const-string v1, "enableCaf..."

    .line 12
    .line 13
    const-string v2, "TECamera1"

    .line 14
    .line 15
    invoke-static {v2, v1}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    :try_start_0
    iget-object v1, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 19
    .line 20
    invoke-virtual {v1}, Landroid/hardware/Camera$Parameters;->getSupportedFocusModes()Ljava/util/List;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-interface {v1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    iget-object v1, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 31
    .line 32
    invoke-virtual {v1}, Landroid/hardware/Camera;->cancelAutoFocus()V

    .line 33
    .line 34
    .line 35
    iget-object v1, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 36
    .line 37
    invoke-virtual {v1, v0}, Landroid/hardware/Camera$Parameters;->setFocusMode(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 41
    .line 42
    iget-object v1, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :catchall_0
    move-exception v0

    .line 49
    new-instance v1, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    const-string v3, "Error: focusAtPoint failed: "

    .line 52
    .line 53
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-static {v2, v0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 71
    .line 72
    const/16 v2, -0x19b

    .line 73
    .line 74
    iget-object p0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 75
    .line 76
    const/4 v3, 0x1

    .line 77
    invoke-interface {v1, v3, v2, v0, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 78
    .line 79
    .line 80
    :cond_0
    return-void
.end method

.method public j0(I)Z
    .locals 7

    .line 1
    const-string v0, "EC = "

    .line 2
    .line 3
    iput p1, p0, Lcom/ss/android/ttvecamera/a;->I:I

    .line 4
    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v2, "setExposureCompensation... value: "

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const-string v2, "TECamera1"

    .line 20
    .line 21
    invoke-static {v2, v1}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 25
    .line 26
    const/16 v3, -0x19d

    .line 27
    .line 28
    const/4 v4, 0x1

    .line 29
    const/4 v5, 0x0

    .line 30
    if-eqz v1, :cond_2

    .line 31
    .line 32
    iget-object v1, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 33
    .line 34
    if-eqz v1, :cond_2

    .line 35
    .line 36
    iget-boolean v1, p0, Lcom/ss/android/ttvecamera/c;->c:Z

    .line 37
    .line 38
    if-eqz v1, :cond_2

    .line 39
    .line 40
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 41
    .line 42
    iget-object v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->K:Lcom/ss/android/ttvecamera/TECameraSettings$d;

    .line 43
    .line 44
    invoke-virtual {v1}, Lcom/ss/android/ttvecamera/TECameraSettings$d;->a()Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-eqz v1, :cond_2

    .line 49
    .line 50
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 51
    .line 52
    iget-object v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->K:Lcom/ss/android/ttvecamera/TECameraSettings$d;

    .line 53
    .line 54
    iget v6, v1, Lcom/ss/android/ttvecamera/TECameraSettings$d;->a:I

    .line 55
    .line 56
    if-gt p1, v6, :cond_1

    .line 57
    .line 58
    iget v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings$d;->c:I

    .line 59
    .line 60
    if-ge p1, v1, :cond_0

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_0
    :try_start_0
    iget-object v1, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 64
    .line 65
    invoke-virtual {v1, p1}, Landroid/hardware/Camera$Parameters;->setExposureCompensation(I)V

    .line 66
    .line 67
    .line 68
    iget-object p1, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 69
    .line 70
    iget-object v1, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 71
    .line 72
    invoke-virtual {p1, v1}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 73
    .line 74
    .line 75
    iget-object p1, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 76
    .line 77
    iget-object p1, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->K:Lcom/ss/android/ttvecamera/TECameraSettings$d;

    .line 78
    .line 79
    iget-object v1, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 80
    .line 81
    invoke-virtual {v1}, Landroid/hardware/Camera$Parameters;->getExposureCompensation()I

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    iput v1, p1, Lcom/ss/android/ttvecamera/TECameraSettings$d;->b:I

    .line 86
    .line 87
    new-instance p1, Ljava/lang/StringBuilder;

    .line 88
    .line 89
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 93
    .line 94
    iget-object v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->K:Lcom/ss/android/ttvecamera/TECameraSettings$d;

    .line 95
    .line 96
    iget v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings$d;->b:I

    .line 97
    .line 98
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    const-string v0, ", EV = "

    .line 102
    .line 103
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 107
    .line 108
    iget-object v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->K:Lcom/ss/android/ttvecamera/TECameraSettings$d;

    .line 109
    .line 110
    iget v1, v0, Lcom/ss/android/ttvecamera/TECameraSettings$d;->b:I

    .line 111
    .line 112
    int-to-float v1, v1

    .line 113
    iget v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings$d;->d:F

    .line 114
    .line 115
    mul-float/2addr v1, v0

    .line 116
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    invoke-static {v2, p1}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 124
    .line 125
    .line 126
    const/4 p0, 0x0

    .line 127
    move-object p1, p0

    .line 128
    move p0, v5

    .line 129
    goto :goto_3

    .line 130
    :catch_0
    move-exception p1

    .line 131
    new-instance v0, Ljava/lang/StringBuilder;

    .line 132
    .line 133
    const-string v1, "Error: setExposureCompensation failed: "

    .line 134
    .line 135
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 150
    .line 151
    iget-object p0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 152
    .line 153
    invoke-interface {v0, v4, v3, p1, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 154
    .line 155
    .line 156
    const/4 p0, -0x1

    .line 157
    goto :goto_3

    .line 158
    :cond_1
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 159
    .line 160
    const-string v1, "Invalid exposure: "

    .line 161
    .line 162
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 163
    .line 164
    .line 165
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object p1

    .line 172
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 173
    .line 174
    const/16 v1, -0x19f

    .line 175
    .line 176
    iget-object p0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 177
    .line 178
    invoke-interface {v0, v4, v1, p1, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 179
    .line 180
    .line 181
    return v5

    .line 182
    :cond_2
    iget-object p1, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 183
    .line 184
    if-eqz p1, :cond_4

    .line 185
    .line 186
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 187
    .line 188
    if-eqz v0, :cond_4

    .line 189
    .line 190
    iget-boolean v0, p0, Lcom/ss/android/ttvecamera/c;->c:Z

    .line 191
    .line 192
    if-nez v0, :cond_3

    .line 193
    .line 194
    goto :goto_1

    .line 195
    :cond_3
    const/16 v3, -0x19e

    .line 196
    .line 197
    const-string p1, "Unsupported exposure compensation!"

    .line 198
    .line 199
    goto :goto_2

    .line 200
    :cond_4
    :goto_1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 201
    .line 202
    const/16 v1, -0x1b7

    .line 203
    .line 204
    const-string v6, "setExposureCompensation \uff1a Camera is null."

    .line 205
    .line 206
    invoke-interface {v0, v4, v1, v6, p1}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 207
    .line 208
    .line 209
    move-object p1, v6

    .line 210
    :goto_2
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 211
    .line 212
    iget-object p0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 213
    .line 214
    invoke-interface {v0, v4, v3, p1, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 215
    .line 216
    .line 217
    move p0, v3

    .line 218
    :goto_3
    if-nez p0, :cond_5

    .line 219
    .line 220
    goto :goto_4

    .line 221
    :cond_5
    move v4, v5

    .line 222
    :goto_4
    if-nez v4, :cond_6

    .line 223
    .line 224
    new-instance p0, Ljava/lang/StringBuilder;

    .line 225
    .line 226
    const-string v0, "setExposureCompensation failed: "

    .line 227
    .line 228
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 229
    .line 230
    .line 231
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 232
    .line 233
    .line 234
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object p0

    .line 238
    invoke-static {v2, p0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 239
    .line 240
    .line 241
    :cond_6
    return v4
.end method

.method public k0(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Lcom/ss/android/ttvecamera/c;->k0(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    goto :goto_1

    .line 7
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->r:Ljava/util/Map;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->H:Ljava/lang/String;

    .line 12
    .line 13
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Landroid/os/Bundle;

    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/os/BaseBundle;->keySet()Ljava/util/Set;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_3

    .line 32
    .line 33
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    check-cast v1, Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {p1, v1}, Landroid/os/BaseBundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-static {v1, v2}, Lcom/ss/android/ttvecamera/TECameraSettings$k;->a(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    if-nez v2, :cond_2

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    const-string v2, "support_light_soft"

    .line 51
    .line 52
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    if-eqz v1, :cond_1

    .line 57
    .line 58
    invoke-virtual {p1, v2}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    invoke-virtual {p0, v2, v1}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 63
    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_3
    :goto_1
    return-void
.end method

.method public l()Landroid/os/Bundle;
    .locals 5
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x15
    .end annotation

    .line 1
    const-string v0, "camera_torch_supported"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 4
    .line 5
    new-instance v2, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    iget-object v3, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 11
    .line 12
    iget v3, v3, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 13
    .line 14
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v3, ""

    .line 18
    .line 19
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    iput-object v2, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->H:Ljava/lang/String;

    .line 27
    .line 28
    invoke-super {p0}, Lcom/ss/android/ttvecamera/c;->l()Landroid/os/Bundle;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    if-eqz v1, :cond_1

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/a;->O()Ljava/util/List;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    check-cast v2, Ljava/util/ArrayList;

    .line 39
    .line 40
    const-string v3, "support_preview_sizes"

    .line 41
    .line 42
    invoke-virtual {v1, v3, v2}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/a;->N()Ljava/util/List;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    check-cast v2, Ljava/util/ArrayList;

    .line 50
    .line 51
    const-string v3, "support_picture_sizes"

    .line 52
    .line 53
    invoke-virtual {v1, v3, v2}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 54
    .line 55
    .line 56
    invoke-direct {p0}, Lcom/ss/android/ttvecamera/a;->Q0()Ljava/util/List;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    check-cast v2, Ljava/util/ArrayList;

    .line 61
    .line 62
    const-string v3, "support_video_sizes"

    .line 63
    .line 64
    invoke-virtual {v1, v3, v2}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 65
    .line 66
    .line 67
    invoke-direct {p0}, Lcom/ss/android/ttvecamera/a;->P0()Ljava/util/List;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    check-cast v2, Ljava/util/ArrayList;

    .line 72
    .line 73
    const-string v3, "camera_support_fps_range"

    .line 74
    .line 75
    invoke-virtual {v1, v3, v2}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 76
    .line 77
    .line 78
    iget-object v2, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 79
    .line 80
    iget-object v2, v2, Lcom/ss/android/ttvecamera/TECameraSettings;->q:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 81
    .line 82
    const-string v3, "camera_preview_size"

    .line 83
    .line 84
    invoke-virtual {v1, v3, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 85
    .line 86
    .line 87
    const/4 v2, 0x0

    .line 88
    :try_start_0
    iget-object v3, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 89
    .line 90
    if-eqz v3, :cond_0

    .line 91
    .line 92
    iget-object p0, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 93
    .line 94
    if-eqz p0, :cond_0

    .line 95
    .line 96
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getSupportedFlashModes()Ljava/util/List;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    if-eqz p0, :cond_0

    .line 101
    .line 102
    const/4 p0, 0x1

    .line 103
    goto :goto_0

    .line 104
    :catch_0
    move-exception p0

    .line 105
    goto :goto_1

    .line 106
    :cond_0
    move p0, v2

    .line 107
    :goto_0
    invoke-virtual {v1, v0, p0}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 108
    .line 109
    .line 110
    return-object v1

    .line 111
    :goto_1
    new-instance v3, Ljava/lang/StringBuilder;

    .line 112
    .line 113
    const-string v4, "Get camera torch information failed: "

    .line 114
    .line 115
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    const-string v3, "TECamera1"

    .line 130
    .line 131
    invoke-static {v3, p0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {v1, v0, v2}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 135
    .line 136
    .line 137
    :cond_1
    return-object v1
.end method

.method public m(Lcom/ss/android/ttvecamera/TEFocusSettings;)V
    .locals 12

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const-string v2, "TECamera1"

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    const-string v0, "focusAtPoint: camera is null."

    .line 9
    .line 10
    invoke-static {v2, v0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/TEFocusSettings;->g()Lcom/ss/android/ttvecamera/TEFocusSettings$b;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iget-object v2, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 18
    .line 19
    iget v2, v2, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 20
    .line 21
    const/16 v3, -0x1b7

    .line 22
    .line 23
    invoke-interface {p1, v3, v2, v0}, Lcom/ss/android/ttvecamera/TEFocusSettings$b;->a(IILjava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 29
    .line 30
    invoke-interface {p1, v1, v3, v0, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    const/4 v3, 0x0

    .line 35
    :try_start_0
    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iput-object v0, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 40
    .line 41
    iget-object v4, p0, Lcom/ss/android/ttvecamera/a;->A:Ll/nrh0;

    .line 42
    .line 43
    iget-object v5, p0, Lcom/ss/android/ttvecamera/a;->B:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {v4, v0, v5}, Ll/nrh0;->e(Landroid/hardware/Camera$Parameters;Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-nez v0, :cond_2

    .line 50
    .line 51
    const-string v0, "Error: not support focus."

    .line 52
    .line 53
    invoke-static {v2, v0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    iget-object v4, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 57
    .line 58
    iget-object v5, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 59
    .line 60
    const/16 v6, -0x19c

    .line 61
    .line 62
    invoke-interface {v4, v6, v6, v0, v5}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 63
    .line 64
    .line 65
    iget-object v4, p0, Lcom/ss/android/ttvecamera/a;->A:Ll/nrh0;

    .line 66
    .line 67
    iget-object v5, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 68
    .line 69
    iget v5, v5, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 70
    .line 71
    iget-object v7, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 72
    .line 73
    invoke-virtual {v4, v5, v7}, Ll/nrh0;->f(ILandroid/hardware/Camera$Parameters;)Z

    .line 74
    .line 75
    .line 76
    move-result v4

    .line 77
    if-eqz v4, :cond_1

    .line 78
    .line 79
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/TEFocusSettings;->p()Z

    .line 80
    .line 81
    .line 82
    move-result v4

    .line 83
    if-eqz v4, :cond_1

    .line 84
    .line 85
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/TEFocusSettings;->d()Ll/n6m;

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 89
    .line 90
    iget-object v4, p0, Lcom/ss/android/ttvecamera/a;->A:Ll/nrh0;

    .line 91
    .line 92
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/TEFocusSettings;->j()I

    .line 93
    .line 94
    .line 95
    move-result v5

    .line 96
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/TEFocusSettings;->i()I

    .line 97
    .line 98
    .line 99
    move-result v6

    .line 100
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/TEFocusSettings;->f()F

    .line 101
    .line 102
    .line 103
    move-result v7

    .line 104
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/TEFocusSettings;->k()I

    .line 105
    .line 106
    .line 107
    move-result v8

    .line 108
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/TEFocusSettings;->l()I

    .line 109
    .line 110
    .line 111
    move-result v9

    .line 112
    iget-object v10, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 113
    .line 114
    iget v10, v10, Lcom/ss/android/ttvecamera/TECameraSettings;->e:I

    .line 115
    .line 116
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/TEFocusSettings;->e()Lcom/ss/android/ttvecamera/TEFocusSettings$CoordinatesMode;

    .line 117
    .line 118
    .line 119
    move-result-object v11

    .line 120
    invoke-virtual/range {v4 .. v11}, Ll/nrh0;->b(IIFIIILcom/ss/android/ttvecamera/TEFocusSettings$CoordinatesMode;)Ljava/util/List;

    .line 121
    .line 122
    .line 123
    move-result-object v4

    .line 124
    invoke-virtual {v0, v4}, Landroid/hardware/Camera$Parameters;->setMeteringAreas(Ljava/util/List;)V

    .line 125
    .line 126
    .line 127
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 128
    .line 129
    iget-object v4, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 130
    .line 131
    invoke-virtual {v0, v4}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 132
    .line 133
    .line 134
    return-void

    .line 135
    :catch_0
    move-exception v0

    .line 136
    goto/16 :goto_0

    .line 137
    .line 138
    :cond_1
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/TEFocusSettings;->g()Lcom/ss/android/ttvecamera/TEFocusSettings$b;

    .line 139
    .line 140
    .line 141
    move-result-object v4

    .line 142
    iget-object v5, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 143
    .line 144
    iget v5, v5, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 145
    .line 146
    invoke-interface {v4, v6, v5, v0}, Lcom/ss/android/ttvecamera/TEFocusSettings$b;->a(IILjava/lang/String;)V

    .line 147
    .line 148
    .line 149
    return-void

    .line 150
    :cond_2
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/TEFocusSettings;->p()Z

    .line 151
    .line 152
    .line 153
    move-result v0

    .line 154
    if-eqz v0, :cond_3

    .line 155
    .line 156
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->A:Ll/nrh0;

    .line 157
    .line 158
    iget-object v4, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 159
    .line 160
    iget v4, v4, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 161
    .line 162
    iget-object v5, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 163
    .line 164
    invoke-virtual {v0, v4, v5}, Ll/nrh0;->f(ILandroid/hardware/Camera$Parameters;)Z

    .line 165
    .line 166
    .line 167
    move-result v0

    .line 168
    if-eqz v0, :cond_3

    .line 169
    .line 170
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/TEFocusSettings;->d()Ll/n6m;

    .line 171
    .line 172
    .line 173
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 174
    .line 175
    iget-object v4, p0, Lcom/ss/android/ttvecamera/a;->A:Ll/nrh0;

    .line 176
    .line 177
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/TEFocusSettings;->j()I

    .line 178
    .line 179
    .line 180
    move-result v5

    .line 181
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/TEFocusSettings;->i()I

    .line 182
    .line 183
    .line 184
    move-result v6

    .line 185
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/TEFocusSettings;->f()F

    .line 186
    .line 187
    .line 188
    move-result v7

    .line 189
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/TEFocusSettings;->k()I

    .line 190
    .line 191
    .line 192
    move-result v8

    .line 193
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/TEFocusSettings;->l()I

    .line 194
    .line 195
    .line 196
    move-result v9

    .line 197
    iget-object v10, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 198
    .line 199
    iget v10, v10, Lcom/ss/android/ttvecamera/TECameraSettings;->e:I

    .line 200
    .line 201
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/TEFocusSettings;->e()Lcom/ss/android/ttvecamera/TEFocusSettings$CoordinatesMode;

    .line 202
    .line 203
    .line 204
    move-result-object v11

    .line 205
    invoke-virtual/range {v4 .. v11}, Ll/nrh0;->b(IIFIIILcom/ss/android/ttvecamera/TEFocusSettings$CoordinatesMode;)Ljava/util/List;

    .line 206
    .line 207
    .line 208
    move-result-object v4

    .line 209
    invoke-virtual {v0, v4}, Landroid/hardware/Camera$Parameters;->setMeteringAreas(Ljava/util/List;)V

    .line 210
    .line 211
    .line 212
    :cond_3
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/TEFocusSettings;->o()Z

    .line 213
    .line 214
    .line 215
    move-result v0

    .line 216
    if-eqz v0, :cond_5

    .line 217
    .line 218
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/TEFocusSettings;->c()Ll/m6m;

    .line 219
    .line 220
    .line 221
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 222
    .line 223
    iget-object v4, p0, Lcom/ss/android/ttvecamera/a;->A:Ll/nrh0;

    .line 224
    .line 225
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/TEFocusSettings;->j()I

    .line 226
    .line 227
    .line 228
    move-result v5

    .line 229
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/TEFocusSettings;->i()I

    .line 230
    .line 231
    .line 232
    move-result v6

    .line 233
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/TEFocusSettings;->f()F

    .line 234
    .line 235
    .line 236
    move-result v7

    .line 237
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/TEFocusSettings;->k()I

    .line 238
    .line 239
    .line 240
    move-result v8

    .line 241
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/TEFocusSettings;->l()I

    .line 242
    .line 243
    .line 244
    move-result v9

    .line 245
    iget-object v10, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 246
    .line 247
    iget v10, v10, Lcom/ss/android/ttvecamera/TECameraSettings;->e:I

    .line 248
    .line 249
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/TEFocusSettings;->e()Lcom/ss/android/ttvecamera/TEFocusSettings$CoordinatesMode;

    .line 250
    .line 251
    .line 252
    move-result-object v11

    .line 253
    invoke-virtual/range {v4 .. v11}, Ll/nrh0;->a(IIFIIILcom/ss/android/ttvecamera/TEFocusSettings$CoordinatesMode;)Ljava/util/List;

    .line 254
    .line 255
    .line 256
    move-result-object v4

    .line 257
    invoke-virtual {v0, v4}, Landroid/hardware/Camera$Parameters;->setFocusAreas(Ljava/util/List;)V

    .line 258
    .line 259
    .line 260
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 261
    .line 262
    invoke-virtual {v0}, Landroid/hardware/Camera;->cancelAutoFocus()V

    .line 263
    .line 264
    .line 265
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 266
    .line 267
    const-string v4, "auto"

    .line 268
    .line 269
    invoke-virtual {v0, v4}, Landroid/hardware/Camera$Parameters;->setFocusMode(Ljava/lang/String;)V

    .line 270
    .line 271
    .line 272
    iget-boolean v0, p0, Lcom/ss/android/ttvecamera/a;->M:Z

    .line 273
    .line 274
    if-eqz v0, :cond_4

    .line 275
    .line 276
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/TEFocusSettings;->m()Z

    .line 277
    .line 278
    .line 279
    move-result v0

    .line 280
    if-nez v0, :cond_4

    .line 281
    .line 282
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 283
    .line 284
    const-string v4, "off"

    .line 285
    .line 286
    invoke-virtual {v0, v4}, Landroid/hardware/Camera$Parameters;->setFlashMode(Ljava/lang/String;)V

    .line 287
    .line 288
    .line 289
    move v3, v1

    .line 290
    :cond_4
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 291
    .line 292
    iget-object v4, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 293
    .line 294
    invoke-virtual {v0, v4}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 295
    .line 296
    .line 297
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 298
    .line 299
    new-instance v4, Lcom/ss/android/ttvecamera/a$d;

    .line 300
    .line 301
    invoke-direct {v4, p0, p1}, Lcom/ss/android/ttvecamera/a$d;-><init>(Lcom/ss/android/ttvecamera/a;Lcom/ss/android/ttvecamera/TEFocusSettings;)V

    .line 302
    .line 303
    .line 304
    invoke-virtual {v0, v4}, Landroid/hardware/Camera;->autoFocus(Landroid/hardware/Camera$AutoFocusCallback;)V

    .line 305
    .line 306
    .line 307
    goto :goto_1

    .line 308
    :cond_5
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 309
    .line 310
    iget-object v4, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 311
    .line 312
    invoke-virtual {v0, v4}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 313
    .line 314
    .line 315
    const-string v0, "focus is not enable!"

    .line 316
    .line 317
    invoke-static {v2, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 318
    .line 319
    .line 320
    return-void

    .line 321
    :goto_0
    new-instance v4, Ljava/lang/StringBuilder;

    .line 322
    .line 323
    const-string v5, "Error: focusAtPoint failed: "

    .line 324
    .line 325
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 326
    .line 327
    .line 328
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 329
    .line 330
    .line 331
    move-result-object v0

    .line 332
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 333
    .line 334
    .line 335
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 336
    .line 337
    .line 338
    move-result-object v0

    .line 339
    invoke-static {v2, v0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 340
    .line 341
    .line 342
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/TEFocusSettings;->g()Lcom/ss/android/ttvecamera/TEFocusSettings$b;

    .line 343
    .line 344
    .line 345
    move-result-object p1

    .line 346
    iget-object v2, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 347
    .line 348
    iget v2, v2, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 349
    .line 350
    const/16 v4, -0x19b

    .line 351
    .line 352
    invoke-interface {p1, v4, v2, v0}, Lcom/ss/android/ttvecamera/TEFocusSettings$b;->a(IILjava/lang/String;)V

    .line 353
    .line 354
    .line 355
    iget-object p1, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 356
    .line 357
    iget-object v2, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 358
    .line 359
    invoke-interface {p1, v1, v4, v0, v2}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 360
    .line 361
    .line 362
    :goto_1
    if-eqz v3, :cond_6

    .line 363
    .line 364
    :try_start_1
    iget-object p1, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 365
    .line 366
    const-string v0, "on"

    .line 367
    .line 368
    invoke-virtual {p1, v0}, Landroid/hardware/Camera$Parameters;->setFlashMode(Ljava/lang/String;)V

    .line 369
    .line 370
    .line 371
    iget-object p1, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 372
    .line 373
    iget-object p0, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 374
    .line 375
    invoke-virtual {p1, p0}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 376
    .line 377
    .line 378
    :catch_1
    :cond_6
    return-void
.end method

.method public n(Lcom/bytedance/bpea/basics/Cert;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/ss/android/ttvecamera/c;->n(Lcom/bytedance/bpea/basics/Cert;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v1, "force close camera: "

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "TECamera1"

    .line 21
    .line 22
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    :try_start_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 26
    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    invoke-static {p1, v0}, Ll/sqh0;->b(Lcom/bytedance/bpea/basics/Cert;Landroid/hardware/Camera;)V

    .line 30
    .line 31
    .line 32
    const/4 p1, 0x0

    .line 33
    iput-object p1, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    .line 35
    :cond_0
    return-void

    .line 36
    :catch_0
    const-string p0, "force close camera failed"

    .line 37
    .line 38
    invoke-static {v1, p0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public n0(II)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    iput-boolean v1, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->A:Z

    .line 5
    .line 6
    iget-object v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->r:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 7
    .line 8
    iput p1, v0, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 9
    .line 10
    iput p2, v0, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/a;->x0()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/a;->u0()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public o0()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewFpsRange()Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {v0}, Lcom/ss/android/ttvecamera/TEFrameRateRange;->a(Ljava/util/List;)I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    iget-object v2, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 15
    .line 16
    iget v3, v2, Lcom/ss/android/ttvecamera/TECameraSettings;->O:I

    .line 17
    .line 18
    iget v4, v2, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 19
    .line 20
    iget-object v2, v2, Lcom/ss/android/ttvecamera/TECameraSettings;->c:Lcom/ss/android/ttvecamera/TEFrameRateRange;

    .line 21
    .line 22
    invoke-virtual {v2, v1}, Lcom/ss/android/ttvecamera/TEFrameRateRange;->c(I)[I

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-static {v3, v4, v1, v0}, Lcom/ss/android/ttvecamera/f;->s(II[ILjava/util/List;)[I

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object v1, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 31
    .line 32
    const/4 v2, 0x0

    .line 33
    aget v3, v0, v2

    .line 34
    .line 35
    const/4 v4, 0x1

    .line 36
    aget v5, v0, v4

    .line 37
    .line 38
    invoke-virtual {v1, v3, v5}, Landroid/hardware/Camera$Parameters;->setPreviewFpsRange(II)V

    .line 39
    .line 40
    .line 41
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 42
    .line 43
    new-instance v3, Lcom/ss/android/ttvecamera/TEFrameRateRange;

    .line 44
    .line 45
    aget v5, v0, v2

    .line 46
    .line 47
    aget v0, v0, v4

    .line 48
    .line 49
    invoke-direct {v3, v5, v0}, Lcom/ss/android/ttvecamera/TEFrameRateRange;-><init>(II)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v3}, Lcom/ss/android/ttvecamera/TEFrameRateRange;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    const/4 v3, 0x0

    .line 57
    const/16 v4, 0x79

    .line 58
    .line 59
    invoke-interface {v1, v4, v2, v0, v3}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 63
    .line 64
    iget-object p0, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 65
    .line 66
    invoke-virtual {v0, p0}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public p(FLcom/ss/android/ttvecamera/TEFrameSizei;)Lcom/ss/android/ttvecamera/TEFrameSizei;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string p0, "TECamera1"

    .line 6
    .line 7
    const-string p1, "getBestPreviewSize: Camera is not opened!"

    .line 8
    .line 9
    invoke-static {p0, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    return-object p0

    .line 14
    :cond_0
    iget-object v1, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 15
    .line 16
    if-nez v1, :cond_1

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iput-object v0, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 23
    .line 24
    :cond_1
    if-eqz p2, :cond_2

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/a;->O()Ljava/util/List;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-static {p0, p2}, Lcom/ss/android/ttvecamera/f;->b(Ljava/util/List;Lcom/ss/android/ttvecamera/TEFrameSizei;)Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0

    .line 35
    :cond_2
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/a;->O()Ljava/util/List;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-static {p0, p1}, Lcom/ss/android/ttvecamera/f;->c(Ljava/util/List;F)Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0
.end method

.method public q()Lorg/json/JSONObject;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/c;->v:Lorg/json/JSONObject;

    .line 2
    .line 3
    return-object p0
.end method

.method public r()[I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    :try_start_0
    invoke-virtual {p0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getPreviewSize()Landroid/hardware/Camera$Size;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    iget v0, p0, Landroid/hardware/Camera$Size;->width:I

    .line 14
    .line 15
    iget p0, p0, Landroid/hardware/Camera$Size;->height:I

    .line 16
    .line 17
    filled-new-array {v0, p0}, [I

    .line 18
    .line 19
    .line 20
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 21
    return-object p0

    .line 22
    :catch_0
    move-exception p0

    .line 23
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 24
    .line 25
    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return-object p0
.end method

.method public r0(I)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/ss/android/ttvecamera/c;->r0(I)V

    .line 2
    .line 3
    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    invoke-direct {p0}, Lcom/ss/android/ttvecamera/a;->J0()V

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    const/4 v0, 0x1

    .line 11
    if-ne p1, v0, :cond_1

    .line 12
    .line 13
    invoke-direct {p0}, Lcom/ss/android/ttvecamera/a;->K0()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_1
    const-string p0, "un support scene"

    .line 18
    .line 19
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public t0(ZLjava/lang/String;)V
    .locals 4

    .line 1
    const-string p1, "SupportWBList has no value: "

    .line 2
    .line 3
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    const-string v2, "TECamera1"

    .line 7
    .line 8
    if-eqz v0, :cond_2

    .line 9
    .line 10
    iget-boolean v3, p0, Lcom/ss/android/ttvecamera/c;->c:Z

    .line 11
    .line 12
    if-nez v3, :cond_0

    .line 13
    .line 14
    goto :goto_1

    .line 15
    :cond_0
    const/16 v3, -0x1a8

    .line 16
    .line 17
    :try_start_0
    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iput-object v0, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 22
    .line 23
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getSupportedWhiteBalance()Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    invoke-interface {v0, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    iget-object p1, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 36
    .line 37
    invoke-virtual {p1, p2}, Landroid/hardware/Camera$Parameters;->setWhiteBalance(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 41
    .line 42
    iget-object p2, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 43
    .line 44
    invoke-virtual {p1, p2}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :catch_0
    move-exception p1

    .line 49
    goto :goto_0

    .line 50
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    invoke-direct {v0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-static {v2, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    iget-object p2, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 66
    .line 67
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 68
    .line 69
    invoke-interface {p2, v1, v3, p1, v0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :goto_0
    new-instance p2, Ljava/lang/StringBuilder;

    .line 74
    .line 75
    const-string v0, "Set WhileBalance failed: "

    .line 76
    .line 77
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    invoke-static {v2, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    iget-object p2, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 95
    .line 96
    iget-object p0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 97
    .line 98
    invoke-interface {p2, v1, v3, p1, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 99
    .line 100
    .line 101
    return-void

    .line 102
    :cond_2
    :goto_1
    const-string p1, "setWhileBalance : Camera is null!"

    .line 103
    .line 104
    invoke-static {v2, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    iget-object p2, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 108
    .line 109
    const/16 v0, -0x1b7

    .line 110
    .line 111
    iget-object p0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 112
    .line 113
    invoke-interface {p2, v1, v0, p1, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 114
    .line 115
    .line 116
    return-void
.end method

.method public u0()V
    .locals 13

    .line 1
    const-string v0, "te_record_camera1_start_preview_cost"

    .line 2
    .line 3
    const-string v1, "SurfaceTexture is null"

    .line 4
    .line 5
    const-string v2, "Unsupported camera provider type : "

    .line 6
    .line 7
    const-string v3, "Init provider failed, ret = "

    .line 8
    .line 9
    const-string v4, "TECamera1-startCapture"

    .line 10
    .line 11
    invoke-static {v4}, Ll/dsh0;->a(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const-string v4, "Camera startPreview..."

    .line 15
    .line 16
    const-string v5, "TECamera1"

    .line 17
    .line 18
    invoke-static {v5, v4}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-boolean v4, p0, Lcom/ss/android/ttvecamera/c;->c:Z

    .line 22
    .line 23
    if-eqz v4, :cond_0

    .line 24
    .line 25
    const-string p0, "Camera is previewing..."

    .line 26
    .line 27
    invoke-static {v5, p0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    iget-object v4, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 32
    .line 33
    if-eqz v4, :cond_18

    .line 34
    .line 35
    const/4 v4, 0x1

    .line 36
    const/4 v6, 0x0

    .line 37
    :try_start_0
    iget-object v7, p0, Lcom/ss/android/ttvecamera/c;->g:Ll/jrh0;

    .line 38
    .line 39
    if-eqz v7, :cond_13

    .line 40
    .line 41
    iget-object v8, p0, Lcom/ss/android/ttvecamera/c;->o:Lcom/ss/android/ttvecamera/c$e;

    .line 42
    .line 43
    if-eqz v8, :cond_1

    .line 44
    .line 45
    invoke-virtual {v7, v8}, Ll/jrh0;->l(Lcom/ss/android/ttvecamera/c$e;)V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :catch_0
    move-exception v0

    .line 50
    move-object v1, v0

    .line 51
    goto/16 :goto_5

    .line 52
    .line 53
    :cond_1
    :goto_0
    iget-object v7, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 54
    .line 55
    if-nez v7, :cond_2

    .line 56
    .line 57
    iget-object v7, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 58
    .line 59
    invoke-virtual {v7}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 60
    .line 61
    .line 62
    move-result-object v7

    .line 63
    iput-object v7, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 64
    .line 65
    :cond_2
    iget-object v7, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 66
    .line 67
    invoke-virtual {v7}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewSizes()Ljava/util/List;

    .line 68
    .line 69
    .line 70
    move-result-object v7

    .line 71
    invoke-static {v7}, Lcom/ss/android/ttvecamera/a;->M0(Ljava/util/List;)Ljava/util/List;

    .line 72
    .line 73
    .line 74
    move-result-object v7

    .line 75
    iget-object v8, p0, Lcom/ss/android/ttvecamera/c;->g:Ll/jrh0;

    .line 76
    .line 77
    iget-object v9, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 78
    .line 79
    iget-object v9, v9, Lcom/ss/android/ttvecamera/TECameraSettings;->q:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 80
    .line 81
    invoke-virtual {v8, v7, v9}, Ll/jrh0;->j(Ljava/util/List;Lcom/ss/android/ttvecamera/TEFrameSizei;)I

    .line 82
    .line 83
    .line 84
    move-result v7

    .line 85
    if-eqz v7, :cond_3

    .line 86
    .line 87
    new-instance v0, Ljava/lang/StringBuilder;

    .line 88
    .line 89
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-static {v5, v0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_3
    iget-object v3, p0, Lcom/ss/android/ttvecamera/c;->g:Ll/jrh0;

    .line 104
    .line 105
    invoke-virtual {v3}, Ll/jrh0;->g()I

    .line 106
    .line 107
    .line 108
    move-result v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 109
    iget-object v7, p0, Lcom/ss/android/ttvecamera/c;->g:Ll/jrh0;

    .line 110
    .line 111
    if-ne v3, v4, :cond_5

    .line 112
    .line 113
    :try_start_1
    invoke-virtual {v7}, Ll/jrh0;->h()Landroid/graphics/SurfaceTexture;

    .line 114
    .line 115
    .line 116
    move-result-object v2

    .line 117
    if-eqz v2, :cond_4

    .line 118
    .line 119
    iget-object v1, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 120
    .line 121
    iget-object v2, p0, Lcom/ss/android/ttvecamera/c;->g:Ll/jrh0;

    .line 122
    .line 123
    invoke-virtual {v2}, Ll/jrh0;->h()Landroid/graphics/SurfaceTexture;

    .line 124
    .line 125
    .line 126
    move-result-object v2

    .line 127
    invoke-virtual {v1, v2}, Landroid/hardware/Camera;->setPreviewTexture(Landroid/graphics/SurfaceTexture;)V

    .line 128
    .line 129
    .line 130
    goto :goto_2

    .line 131
    :cond_4
    invoke-static {v5, v1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    new-instance v0, Landroid/util/AndroidRuntimeException;

    .line 135
    .line 136
    invoke-direct {v0, v1}, Landroid/util/AndroidRuntimeException;-><init>(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    throw v0

    .line 140
    :cond_5
    invoke-virtual {v7}, Ll/jrh0;->g()I

    .line 141
    .line 142
    .line 143
    move-result v1

    .line 144
    const/4 v3, 0x4

    .line 145
    if-ne v1, v3, :cond_12

    .line 146
    .line 147
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->g:Ll/jrh0;

    .line 148
    .line 149
    invoke-virtual {v1}, Ll/jrh0;->f()Ll/irh0;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    check-cast v1, Ll/qqh0;

    .line 154
    .line 155
    if-eqz v1, :cond_11

    .line 156
    .line 157
    iget-object v2, p0, Lcom/ss/android/ttvecamera/a;->J:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 158
    .line 159
    invoke-virtual {v2, v6, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 160
    .line 161
    .line 162
    move-result v2

    .line 163
    if-eqz v2, :cond_6

    .line 164
    .line 165
    const/4 v2, 0x3

    .line 166
    invoke-virtual {v1, v2}, Ll/qqh0;->r(I)[[B

    .line 167
    .line 168
    .line 169
    move-result-object v2

    .line 170
    array-length v3, v2

    .line 171
    move v7, v6

    .line 172
    :goto_1
    if-ge v7, v3, :cond_6

    .line 173
    .line 174
    aget-object v8, v2, v7

    .line 175
    .line 176
    iget-object v9, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 177
    .line 178
    invoke-virtual {v9, v8}, Landroid/hardware/Camera;->addCallbackBuffer([B)V

    .line 179
    .line 180
    .line 181
    add-int/lit8 v7, v7, 0x1

    .line 182
    .line 183
    goto :goto_1

    .line 184
    :cond_6
    iget-object v2, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 185
    .line 186
    invoke-virtual {v1}, Ll/qqh0;->s()Landroid/hardware/Camera$PreviewCallback;

    .line 187
    .line 188
    .line 189
    move-result-object v1

    .line 190
    invoke-virtual {v2, v1}, Landroid/hardware/Camera;->setPreviewCallbackWithBuffer(Landroid/hardware/Camera$PreviewCallback;)V

    .line 191
    .line 192
    .line 193
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->g:Ll/jrh0;

    .line 194
    .line 195
    invoke-virtual {v1}, Ll/jrh0;->h()Landroid/graphics/SurfaceTexture;

    .line 196
    .line 197
    .line 198
    move-result-object v1

    .line 199
    if-eqz v1, :cond_7

    .line 200
    .line 201
    iget-object v1, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 202
    .line 203
    iget-object v2, p0, Lcom/ss/android/ttvecamera/c;->g:Ll/jrh0;

    .line 204
    .line 205
    invoke-virtual {v2}, Ll/jrh0;->h()Landroid/graphics/SurfaceTexture;

    .line 206
    .line 207
    .line 208
    move-result-object v2

    .line 209
    invoke-virtual {v1, v2}, Landroid/hardware/Camera;->setPreviewTexture(Landroid/graphics/SurfaceTexture;)V

    .line 210
    .line 211
    .line 212
    :cond_7
    :goto_2
    iget-object v1, p0, Lcom/ss/android/ttvecamera/a;->G:Ljava/util/List;

    .line 213
    .line 214
    if-eqz v1, :cond_a

    .line 215
    .line 216
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 217
    .line 218
    iget v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->x0:F

    .line 219
    .line 220
    const/high16 v2, 0x3f800000    # 1.0f

    .line 221
    .line 222
    invoke-static {v1, v2}, Ljava/lang/Float;->compare(FF)I

    .line 223
    .line 224
    .line 225
    move-result v1

    .line 226
    if-eqz v1, :cond_a

    .line 227
    .line 228
    iget v1, p0, Lcom/ss/android/ttvecamera/a;->H:F

    .line 229
    .line 230
    iget-object v2, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 231
    .line 232
    iget v2, v2, Lcom/ss/android/ttvecamera/TECameraSettings;->x0:F

    .line 233
    .line 234
    mul-float/2addr v1, v2

    .line 235
    iput v1, p0, Lcom/ss/android/ttvecamera/a;->H:F

    .line 236
    .line 237
    iget-object v2, p0, Lcom/ss/android/ttvecamera/a;->G:Ljava/util/List;

    .line 238
    .line 239
    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 240
    .line 241
    .line 242
    move-result-object v2

    .line 243
    check-cast v2, Ljava/lang/Integer;

    .line 244
    .line 245
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 246
    .line 247
    .line 248
    move-result v2

    .line 249
    int-to-float v2, v2

    .line 250
    cmpg-float v1, v1, v2

    .line 251
    .line 252
    if-gez v1, :cond_8

    .line 253
    .line 254
    iget-object v1, p0, Lcom/ss/android/ttvecamera/a;->G:Ljava/util/List;

    .line 255
    .line 256
    invoke-interface {v1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 257
    .line 258
    .line 259
    move-result-object v1

    .line 260
    check-cast v1, Ljava/lang/Integer;

    .line 261
    .line 262
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 263
    .line 264
    .line 265
    move-result v1

    .line 266
    int-to-float v1, v1

    .line 267
    iput v1, p0, Lcom/ss/android/ttvecamera/a;->H:F

    .line 268
    .line 269
    goto :goto_3

    .line 270
    :cond_8
    iget v1, p0, Lcom/ss/android/ttvecamera/a;->H:F

    .line 271
    .line 272
    iget-object v2, p0, Lcom/ss/android/ttvecamera/a;->G:Ljava/util/List;

    .line 273
    .line 274
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 275
    .line 276
    .line 277
    move-result v3

    .line 278
    sub-int/2addr v3, v4

    .line 279
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 280
    .line 281
    .line 282
    move-result-object v2

    .line 283
    check-cast v2, Ljava/lang/Integer;

    .line 284
    .line 285
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 286
    .line 287
    .line 288
    move-result v2

    .line 289
    int-to-float v2, v2

    .line 290
    cmpl-float v1, v1, v2

    .line 291
    .line 292
    if-lez v1, :cond_9

    .line 293
    .line 294
    iget-object v1, p0, Lcom/ss/android/ttvecamera/a;->G:Ljava/util/List;

    .line 295
    .line 296
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 297
    .line 298
    .line 299
    move-result v2

    .line 300
    sub-int/2addr v2, v4

    .line 301
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 302
    .line 303
    .line 304
    move-result-object v1

    .line 305
    check-cast v1, Ljava/lang/Integer;

    .line 306
    .line 307
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 308
    .line 309
    .line 310
    move-result v1

    .line 311
    int-to-float v1, v1

    .line 312
    iput v1, p0, Lcom/ss/android/ttvecamera/a;->H:F

    .line 313
    .line 314
    :cond_9
    :goto_3
    iget v1, p0, Lcom/ss/android/ttvecamera/a;->H:F

    .line 315
    .line 316
    float-to-int v1, v1

    .line 317
    invoke-direct {p0, v1}, Lcom/ss/android/ttvecamera/a;->O0(I)I

    .line 318
    .line 319
    .line 320
    move-result v1

    .line 321
    iget-object v2, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 322
    .line 323
    invoke-virtual {v2, v1}, Landroid/hardware/Camera$Parameters;->setZoom(I)V

    .line 324
    .line 325
    .line 326
    iget-object v1, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 327
    .line 328
    iget-object v2, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 329
    .line 330
    invoke-virtual {v1, v2}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 331
    .line 332
    .line 333
    :cond_a
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->g:Ll/jrh0;

    .line 334
    .line 335
    invoke-virtual {v1}, Ll/jrh0;->c()Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 336
    .line 337
    .line 338
    move-result-object v1

    .line 339
    if-eqz v1, :cond_f

    .line 340
    .line 341
    iget-object v2, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 342
    .line 343
    invoke-virtual {v2}, Landroid/hardware/Camera$Parameters;->getPreviewSize()Landroid/hardware/Camera$Size;

    .line 344
    .line 345
    .line 346
    move-result-object v2

    .line 347
    iget v2, v2, Landroid/hardware/Camera$Size;->width:I

    .line 348
    .line 349
    iget v3, v1, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 350
    .line 351
    if-ne v2, v3, :cond_b

    .line 352
    .line 353
    iget-object v2, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 354
    .line 355
    invoke-virtual {v2}, Landroid/hardware/Camera$Parameters;->getPreviewSize()Landroid/hardware/Camera$Size;

    .line 356
    .line 357
    .line 358
    move-result-object v2

    .line 359
    iget v2, v2, Landroid/hardware/Camera$Size;->height:I

    .line 360
    .line 361
    iget v3, v1, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 362
    .line 363
    if-eq v2, v3, :cond_e

    .line 364
    .line 365
    :cond_b
    iget-object v2, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 366
    .line 367
    iget v3, v1, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 368
    .line 369
    iget v7, v1, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 370
    .line 371
    invoke-virtual {v2, v3, v7}, Landroid/hardware/Camera$Parameters;->setPreviewSize(II)V

    .line 372
    .line 373
    .line 374
    iget-object v2, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 375
    .line 376
    iget-boolean v3, v2, Lcom/ss/android/ttvecamera/TECameraSettings;->z:Z

    .line 377
    .line 378
    if-eqz v3, :cond_d

    .line 379
    .line 380
    iget-boolean v3, v2, Lcom/ss/android/ttvecamera/TECameraSettings;->A:Z

    .line 381
    .line 382
    if-nez v3, :cond_c

    .line 383
    .line 384
    iget-object v3, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 385
    .line 386
    invoke-virtual {v3}, Landroid/hardware/Camera$Parameters;->getSupportedPictureSizes()Ljava/util/List;

    .line 387
    .line 388
    .line 389
    move-result-object v3

    .line 390
    invoke-static {v3}, Lcom/ss/android/ttvecamera/a;->M0(Ljava/util/List;)Ljava/util/List;

    .line 391
    .line 392
    .line 393
    move-result-object v3

    .line 394
    iget-object v7, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 395
    .line 396
    iget v8, v7, Lcom/ss/android/ttvecamera/TECameraSettings;->u:I

    .line 397
    .line 398
    iget v7, v7, Lcom/ss/android/ttvecamera/TECameraSettings;->y:F

    .line 399
    .line 400
    invoke-static {v3, v1, v8, v7}, Lcom/ss/android/ttvecamera/f;->o(Ljava/util/List;Lcom/ss/android/ttvecamera/TEFrameSizei;IF)Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 401
    .line 402
    .line 403
    move-result-object v3

    .line 404
    iput-object v3, v2, Lcom/ss/android/ttvecamera/TECameraSettings;->r:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 405
    .line 406
    goto :goto_4

    .line 407
    :cond_c
    iput-boolean v6, v2, Lcom/ss/android/ttvecamera/TECameraSettings;->A:Z

    .line 408
    .line 409
    :goto_4
    iget-object v2, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 410
    .line 411
    iget-object v3, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 412
    .line 413
    iget-object v3, v3, Lcom/ss/android/ttvecamera/TECameraSettings;->r:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 414
    .line 415
    iget v7, v3, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 416
    .line 417
    iget v3, v3, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 418
    .line 419
    invoke-virtual {v2, v7, v3}, Landroid/hardware/Camera$Parameters;->setPictureSize(II)V

    .line 420
    .line 421
    .line 422
    :cond_d
    iget-object v2, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 423
    .line 424
    iget-object v3, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 425
    .line 426
    invoke-virtual {v2, v3}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 427
    .line 428
    .line 429
    :cond_e
    iget-object v2, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 430
    .line 431
    invoke-virtual {v1}, Lcom/ss/android/ttvecamera/TEFrameSizei;->toString()Ljava/lang/String;

    .line 432
    .line 433
    .line 434
    move-result-object v1

    .line 435
    iget-object v3, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 436
    .line 437
    const/16 v7, 0x32

    .line 438
    .line 439
    invoke-interface {v2, v7, v6, v1, v3}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 440
    .line 441
    .line 442
    :cond_f
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 443
    .line 444
    iget-boolean v2, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->A:Z

    .line 445
    .line 446
    if-eqz v2, :cond_10

    .line 447
    .line 448
    iput-boolean v6, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->A:Z

    .line 449
    .line 450
    iget-object v2, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 451
    .line 452
    iget-object v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->r:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 453
    .line 454
    iget v3, v1, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 455
    .line 456
    iget v1, v1, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 457
    .line 458
    invoke-virtual {v2, v3, v1}, Landroid/hardware/Camera$Parameters;->setPictureSize(II)V

    .line 459
    .line 460
    .line 461
    iget-object v1, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 462
    .line 463
    iget-object v2, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 464
    .line 465
    invoke-virtual {v1, v2}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 466
    .line 467
    .line 468
    new-instance v1, Ljava/lang/StringBuilder;

    .line 469
    .line 470
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 471
    .line 472
    .line 473
    const-string v2, "force set picture size: "

    .line 474
    .line 475
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 476
    .line 477
    .line 478
    iget-object v2, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 479
    .line 480
    iget-object v2, v2, Lcom/ss/android/ttvecamera/TECameraSettings;->r:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 481
    .line 482
    iget v2, v2, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 483
    .line 484
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 485
    .line 486
    .line 487
    const-string v2, "x"

    .line 488
    .line 489
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 490
    .line 491
    .line 492
    iget-object v2, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 493
    .line 494
    iget-object v2, v2, Lcom/ss/android/ttvecamera/TECameraSettings;->r:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 495
    .line 496
    iget v2, v2, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 497
    .line 498
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 499
    .line 500
    .line 501
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 502
    .line 503
    .line 504
    move-result-object v1

    .line 505
    invoke-static {v5, v1}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 506
    .line 507
    .line 508
    :cond_10
    iget-object v1, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 509
    .line 510
    new-instance v2, Lcom/ss/android/ttvecamera/a$a;

    .line 511
    .line 512
    invoke-direct {v2, p0}, Lcom/ss/android/ttvecamera/a$a;-><init>(Lcom/ss/android/ttvecamera/a;)V

    .line 513
    .line 514
    .line 515
    invoke-virtual {v1, v2}, Landroid/hardware/Camera;->setErrorCallback(Landroid/hardware/Camera$ErrorCallback;)V

    .line 516
    .line 517
    .line 518
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 519
    .line 520
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/a;->C()I

    .line 521
    .line 522
    .line 523
    move-result v2

    .line 524
    iput v2, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->e:I

    .line 525
    .line 526
    new-instance v1, Ljava/lang/StringBuilder;

    .line 527
    .line 528
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 529
    .line 530
    .line 531
    const-string v2, "Camera rotation = "

    .line 532
    .line 533
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 534
    .line 535
    .line 536
    iget-object v2, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 537
    .line 538
    iget v2, v2, Lcom/ss/android/ttvecamera/TECameraSettings;->e:I

    .line 539
    .line 540
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 541
    .line 542
    .line 543
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 544
    .line 545
    .line 546
    move-result-object v1

    .line 547
    invoke-static {v5, v1}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 548
    .line 549
    .line 550
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 551
    .line 552
    .line 553
    move-result-wide v1

    .line 554
    const-string v3, "Camera startPreview start"

    .line 555
    .line 556
    invoke-static {v5, v3}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 557
    .line 558
    .line 559
    iget-object v3, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 560
    .line 561
    invoke-virtual {v3}, Landroid/hardware/Camera;->startPreview()V

    .line 562
    .line 563
    .line 564
    const-string v3, "Camera startPreview end"

    .line 565
    .line 566
    invoke-static {v5, v3}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 567
    .line 568
    .line 569
    iget-object v3, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 570
    .line 571
    iget-object v3, v3, Lcom/ss/android/ttvecamera/TECameraSettings;->E:Landroid/os/Bundle;

    .line 572
    .line 573
    const-string v7, "useCameraFaceDetect"

    .line 574
    .line 575
    invoke-virtual {v3, v7}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 576
    .line 577
    .line 578
    move-result v3

    .line 579
    iput v3, p0, Lcom/ss/android/ttvecamera/a;->L:I

    .line 580
    .line 581
    invoke-virtual {p0, v3}, Lcom/ss/android/ttvecamera/a;->T0(I)V

    .line 582
    .line 583
    .line 584
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 585
    .line 586
    .line 587
    move-result-wide v7

    .line 588
    iput-wide v7, p0, Lcom/ss/android/ttvecamera/a;->K:J

    .line 589
    .line 590
    sub-long/2addr v7, v1

    .line 591
    invoke-static {v0, v7, v8}, Ll/hrh0;->b(Ljava/lang/String;J)V

    .line 592
    .line 593
    .line 594
    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 595
    .line 596
    .line 597
    move-result-object v1

    .line 598
    invoke-static {v0, v1}, Lcom/ss/android/ttvecamera/g;->f(Ljava/lang/String;Ljava/lang/Object;)V

    .line 599
    .line 600
    .line 601
    iput-boolean v4, p0, Lcom/ss/android/ttvecamera/c;->c:Z

    .line 602
    .line 603
    iget-object v7, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 604
    .line 605
    const-string v11, "TECamera1 preview"

    .line 606
    .line 607
    iget-object v12, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 608
    .line 609
    const/4 v8, 0x1

    .line 610
    const/4 v9, 0x0

    .line 611
    const/4 v10, 0x0

    .line 612
    invoke-interface/range {v7 .. v12}, Lcom/ss/android/ttvecamera/c$a;->a(IIILjava/lang/String;Ljava/lang/Object;)V

    .line 613
    .line 614
    .line 615
    goto/16 :goto_9

    .line 616
    .line 617
    :cond_11
    new-instance v0, Landroid/util/AndroidRuntimeException;

    .line 618
    .line 619
    const-string v1, "Provider is null"

    .line 620
    .line 621
    invoke-direct {v0, v1}, Landroid/util/AndroidRuntimeException;-><init>(Ljava/lang/String;)V

    .line 622
    .line 623
    .line 624
    throw v0

    .line 625
    :cond_12
    new-instance v0, Ljava/lang/StringBuilder;

    .line 626
    .line 627
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 628
    .line 629
    .line 630
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->g:Ll/jrh0;

    .line 631
    .line 632
    invoke-virtual {v1}, Ll/jrh0;->g()I

    .line 633
    .line 634
    .line 635
    move-result v1

    .line 636
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 637
    .line 638
    .line 639
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 640
    .line 641
    .line 642
    move-result-object v0

    .line 643
    invoke-static {v5, v0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 644
    .line 645
    .line 646
    return-void

    .line 647
    :cond_13
    new-instance v0, Landroid/util/AndroidRuntimeException;

    .line 648
    .line 649
    const-string v1, "ProviderManager is null"

    .line 650
    .line 651
    invoke-direct {v0, v1}, Landroid/util/AndroidRuntimeException;-><init>(Ljava/lang/String;)V

    .line 652
    .line 653
    .line 654
    throw v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 655
    :goto_5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 656
    .line 657
    const-string v2, "startPreview: Error "

    .line 658
    .line 659
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 660
    .line 661
    .line 662
    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 663
    .line 664
    .line 665
    move-result-object v2

    .line 666
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 667
    .line 668
    .line 669
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 670
    .line 671
    .line 672
    move-result-object v0

    .line 673
    invoke-static {v5, v0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 674
    .line 675
    .line 676
    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 677
    .line 678
    .line 679
    move-result-object v0

    .line 680
    if-eqz v0, :cond_15

    .line 681
    .line 682
    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 683
    .line 684
    .line 685
    move-result-object v0

    .line 686
    const-string v2, "setParameters failed"

    .line 687
    .line 688
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 689
    .line 690
    .line 691
    move-result v0

    .line 692
    if-eqz v0, :cond_14

    .line 693
    .line 694
    const/16 v0, -0x192

    .line 695
    .line 696
    :goto_6
    move v2, v0

    .line 697
    goto :goto_7

    .line 698
    :cond_14
    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 699
    .line 700
    .line 701
    move-result-object v0

    .line 702
    const-string v2, "startPreview failed"

    .line 703
    .line 704
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 705
    .line 706
    .line 707
    move-result v0

    .line 708
    if-eqz v0, :cond_15

    .line 709
    .line 710
    const/16 v0, -0x19a

    .line 711
    .line 712
    goto :goto_6

    .line 713
    :cond_15
    const/16 v0, -0x1a9

    .line 714
    .line 715
    goto :goto_6

    .line 716
    :goto_7
    invoke-static {v1}, Lcom/ss/android/ttvecamera/e;->a(Ljava/lang/Throwable;)V

    .line 717
    .line 718
    .line 719
    iput-boolean v6, p0, Lcom/ss/android/ttvecamera/c;->c:Z

    .line 720
    .line 721
    const/4 v3, 0x0

    .line 722
    :try_start_2
    iget v0, p0, Lcom/ss/android/ttvecamera/c;->m:I

    .line 723
    .line 724
    if-nez v0, :cond_16

    .line 725
    .line 726
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 727
    .line 728
    const-string v5, "preview error will close camera1"

    .line 729
    .line 730
    const/16 v7, 0x6c

    .line 731
    .line 732
    invoke-interface {v0, v7, v6, v5, v3}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 733
    .line 734
    .line 735
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->t:Lcom/bytedance/bpea/basics/Cert;

    .line 736
    .line 737
    iget-object v5, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 738
    .line 739
    invoke-static {v0, v5}, Ll/sqh0;->b(Lcom/bytedance/bpea/basics/Cert;Landroid/hardware/Camera;)V

    .line 740
    .line 741
    .line 742
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 743
    .line 744
    const-string v5, "preview error did close camera1"

    .line 745
    .line 746
    const/16 v7, 0x6d

    .line 747
    .line 748
    invoke-interface {v0, v7, v6, v5, v3}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 749
    .line 750
    .line 751
    goto :goto_8

    .line 752
    :catch_1
    move-exception v0

    .line 753
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 754
    .line 755
    .line 756
    :cond_16
    :goto_8
    iget v0, p0, Lcom/ss/android/ttvecamera/c;->m:I

    .line 757
    .line 758
    if-nez v0, :cond_17

    .line 759
    .line 760
    iput-object v3, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 761
    .line 762
    :cond_17
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 763
    .line 764
    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 765
    .line 766
    .line 767
    move-result-object v1

    .line 768
    iget-object p0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 769
    .line 770
    invoke-interface {v0, v4, v2, v1, p0}, Lcom/ss/android/ttvecamera/c$a;->b(IILjava/lang/String;Ljava/lang/Object;)V

    .line 771
    .line 772
    .line 773
    :cond_18
    :goto_9
    invoke-static {}, Ll/dsh0;->b()V

    .line 774
    .line 775
    .line 776
    return-void
.end method

.method public v()I
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method

.method public w0(FLcom/ss/android/ttvecamera/TECameraSettings$p;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const-string v2, "TECamera1"

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    const-string p1, "[VE_UI_TEST]Failed event: START_ZOOM. Code: -439. Reason: mCameraDevice is null"

    .line 9
    .line 10
    invoke-static {v2, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    const-string p1, "startZoom : Camera is null!"

    .line 14
    .line 15
    invoke-static {v2, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object p2, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 19
    .line 20
    const/16 v0, -0x1b7

    .line 21
    .line 22
    iget-object p0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 23
    .line 24
    invoke-interface {p2, v1, v0, p1, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    :try_start_0
    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iput-object v0, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 33
    .line 34
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->isZoomSupported()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-nez v0, :cond_1

    .line 39
    .line 40
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 41
    .line 42
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->isSmoothZoomSupported()Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-nez v0, :cond_1

    .line 47
    .line 48
    const-string p1, "[VE_UI_TEST]Failed event: START_ZOOM. Code: -421. Reason: camera is not support zoom"

    .line 49
    .line 50
    invoke-static {v2, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    const-string p1, "Camera is not support zoom!"

    .line 54
    .line 55
    invoke-static {v2, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    iget-object p2, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 59
    .line 60
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 61
    .line 62
    const/16 v3, -0x1a5

    .line 63
    .line 64
    invoke-interface {p2, v1, v3, p1, v0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :catch_0
    move-exception p1

    .line 69
    goto :goto_0

    .line 70
    :cond_1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 71
    .line 72
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getMaxZoom()I

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    int-to-float v0, v0

    .line 77
    invoke-static {v0, p1}, Ljava/lang/Math;->min(FF)F

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    float-to-int p1, p1

    .line 82
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 83
    .line 84
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->isSmoothZoomSupported()Z

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    if-eqz v0, :cond_2

    .line 89
    .line 90
    if-eqz p2, :cond_2

    .line 91
    .line 92
    invoke-interface {p2}, Lcom/ss/android/ttvecamera/TECameraSettings$p;->enableSmooth()Z

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    if-eqz v0, :cond_2

    .line 97
    .line 98
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 99
    .line 100
    invoke-virtual {v0, p1}, Landroid/hardware/Camera;->startSmoothZoom(I)V

    .line 101
    .line 102
    .line 103
    iget-object p1, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 104
    .line 105
    new-instance v0, Lcom/ss/android/ttvecamera/a$f;

    .line 106
    .line 107
    invoke-direct {v0, p0, p2}, Lcom/ss/android/ttvecamera/a$f;-><init>(Lcom/ss/android/ttvecamera/a;Lcom/ss/android/ttvecamera/TECameraSettings$p;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p1, v0}, Landroid/hardware/Camera;->setZoomChangeListener(Landroid/hardware/Camera$OnZoomChangeListener;)V

    .line 111
    .line 112
    .line 113
    return-void

    .line 114
    :cond_2
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 115
    .line 116
    invoke-virtual {v0, p1}, Landroid/hardware/Camera$Parameters;->setZoom(I)V

    .line 117
    .line 118
    .line 119
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 120
    .line 121
    iget-object v3, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 122
    .line 123
    invoke-virtual {v0, v3}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 124
    .line 125
    .line 126
    if-eqz p2, :cond_3

    .line 127
    .line 128
    int-to-float p1, p1

    .line 129
    invoke-interface {p2, v1, p1, v1}, Lcom/ss/android/ttvecamera/TECameraSettings$p;->onChange(IFZ)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 130
    .line 131
    .line 132
    :cond_3
    return-void

    .line 133
    :goto_0
    new-instance p2, Ljava/lang/StringBuilder;

    .line 134
    .line 135
    const-string v0, "[VE_UI_TEST]Failed event: START_ZOOM. Code: -420. Reason: "

    .line 136
    .line 137
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object p2

    .line 147
    invoke-static {v2, p2}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    new-instance p2, Ljava/lang/StringBuilder;

    .line 151
    .line 152
    const-string v0, "Start zoom failed : "

    .line 153
    .line 154
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 162
    .line 163
    .line 164
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    invoke-static {v2, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 169
    .line 170
    .line 171
    iget-object p2, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 172
    .line 173
    const/16 v0, -0x1a4

    .line 174
    .line 175
    iget-object p0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 176
    .line 177
    invoke-interface {p2, v1, v0, p1, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 178
    .line 179
    .line 180
    return-void
.end method

.method public x()[F
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    const/4 v2, 0x1

    .line 5
    const-string v3, "TECamera1"

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string v0, "getFOV: camera device is null."

    .line 10
    .line 11
    invoke-static {v3, v0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object v3, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 15
    .line 16
    const/16 v4, -0x1b7

    .line 17
    .line 18
    iget-object p0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 19
    .line 20
    invoke-interface {v3, v2, v4, v0, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    new-array p0, v1, [F

    .line 24
    .line 25
    fill-array-data p0, :array_0

    .line 26
    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_0
    :try_start_0
    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iput-object v0, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    .line 35
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getVerticalViewAngle()F

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    iget-object p0, p0, Lcom/ss/android/ttvecamera/a;->z:Landroid/hardware/Camera$Parameters;

    .line 40
    .line 41
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getHorizontalViewAngle()F

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    new-array v1, v1, [F

    .line 46
    .line 47
    const/4 v4, 0x0

    .line 48
    aput v0, v1, v4

    .line 49
    .line 50
    aput p0, v1, v2

    .line 51
    .line 52
    new-instance p0, Ljava/lang/StringBuilder;

    .line 53
    .line 54
    const-string v0, "Camera1:verticalFOV = "

    .line 55
    .line 56
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    aget v0, v1, v4

    .line 60
    .line 61
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    const-string v0, ",horizontalFOV = "

    .line 65
    .line 66
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    aget v0, v1, v2

    .line 70
    .line 71
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-static {v3, p0}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    return-object v1

    .line 82
    :catch_0
    move-exception p0

    .line 83
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 84
    .line 85
    .line 86
    new-array p0, v1, [F

    .line 87
    .line 88
    fill-array-data p0, :array_1

    .line 89
    .line 90
    .line 91
    return-object p0

    .line 92
    nop

    .line 93
    :array_0
    .array-data 4
        -0x40000000    # -2.0f
        -0x40000000    # -2.0f
    .end array-data

    .line 94
    .line 95
    .line 96
    .line 97
    .line 98
    .line 99
    .line 100
    .line 101
    :array_1
    .array-data 4
        -0x40000000    # -2.0f
        -0x40000000    # -2.0f
    .end array-data
.end method

.method public x0()V
    .locals 9

    .line 1
    const-string v0, "te_record_camera1_stop_preview_cost"

    .line 2
    .line 3
    const-string v1, "Camera stopPreview..."

    .line 4
    .line 5
    const-string v2, "TECamera1"

    .line 6
    .line 7
    invoke-static {v2, v1}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-boolean v1, p0, Lcom/ss/android/ttvecamera/c;->c:Z

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    iget-object v1, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 15
    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/c;->c:Z

    .line 20
    .line 21
    iget-object v3, p0, Lcom/ss/android/ttvecamera/a;->J:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 22
    .line 23
    invoke-virtual {v3, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 24
    .line 25
    .line 26
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 27
    .line 28
    .line 29
    move-result-wide v3

    .line 30
    iget-object v1, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 31
    .line 32
    invoke-virtual {v1}, Landroid/hardware/Camera;->stopPreview()V

    .line 33
    .line 34
    .line 35
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 36
    .line 37
    .line 38
    move-result-wide v5

    .line 39
    sub-long/2addr v5, v3

    .line 40
    invoke-static {v0, v5, v6}, Ll/hrh0;->b(Ljava/lang/String;J)V

    .line 41
    .line 42
    .line 43
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-static {v0, v1}, Lcom/ss/android/ttvecamera/g;->f(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :catch_0
    move-exception v0

    .line 52
    new-instance v1, Ljava/lang/StringBuilder;

    .line 53
    .line 54
    const-string v3, "camera stopcapture failed: "

    .line 55
    .line 56
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-static {v2, v0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    :goto_0
    const-wide/16 v0, 0x0

    .line 74
    .line 75
    iput-wide v0, p0, Lcom/ss/android/ttvecamera/a;->K:J

    .line 76
    .line 77
    const-string v0, "Camera preview stopped!"

    .line 78
    .line 79
    invoke-static {v2, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    iget-object v3, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 83
    .line 84
    const-string v7, "TECamera1 preview stoped"

    .line 85
    .line 86
    iget-object v8, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 87
    .line 88
    const/4 v4, 0x1

    .line 89
    const/4 v5, 0x4

    .line 90
    const/4 v6, 0x0

    .line 91
    invoke-interface/range {v3 .. v8}, Lcom/ss/android/ttvecamera/c$a;->d(IIILjava/lang/String;Ljava/lang/Object;)V

    .line 92
    .line 93
    .line 94
    :cond_0
    return-void
.end method
