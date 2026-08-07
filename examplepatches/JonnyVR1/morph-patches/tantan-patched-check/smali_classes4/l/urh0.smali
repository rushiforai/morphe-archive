.class public Ll/urh0;
.super Lcom/ss/android/ttvecamera/framework/TECameraModeBase;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x15
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/urh0$i;
    }
.end annotation


# instance fields
.field private X:J

.field private final Y:Ll/urh0$i;

.field private final Z:Landroid/os/Handler;

.field protected a0:Landroid/media/ImageReader;

.field protected b0:Landroid/media/ImageReader;

.field private c0:I

.field private d0:[Landroid/hardware/camera2/TotalCaptureResult;

.field private e0:Landroid/hardware/camera2/TotalCaptureResult;

.field private volatile f0:Z

.field private g0:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/hardware/camera2/CaptureRequest$Key<",
            "*>;>;"
        }
    .end annotation
.end field

.field private h0:I

.field private i0:I

.field private j0:Z

.field private k0:Z

.field private l0:Z

.field private m0:Z

.field private n0:I

.field private o0:I

.field private p0:J

.field private q0:Landroid/os/ConditionVariable;

.field private r0:I

.field private s0:I

.field private t0:I

.field private u0:J


# direct methods
.method public constructor <init>(Lcom/ss/android/ttvecamera/b;Landroid/content/Context;Landroid/hardware/camera2/CameraManager;Landroid/os/Handler;)V
    .locals 3

    .line 1
    invoke-direct {p0, p1, p2, p4}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;-><init>(Lcom/ss/android/ttvecamera/b;Landroid/content/Context;Landroid/os/Handler;)V

    .line 2
    .line 3
    .line 4
    const-wide/16 p1, 0x0

    .line 5
    .line 6
    iput-wide p1, p0, Ll/urh0;->X:J

    .line 7
    .line 8
    new-instance v0, Landroid/os/Handler;

    .line 9
    .line 10
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/urh0;->Z:Landroid/os/Handler;

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    iput-object v0, p0, Ll/urh0;->b0:Landroid/media/ImageReader;

    .line 21
    .line 22
    const/4 v1, -0x1

    .line 23
    iput v1, p0, Ll/urh0;->c0:I

    .line 24
    .line 25
    iput-object v0, p0, Ll/urh0;->e0:Landroid/hardware/camera2/TotalCaptureResult;

    .line 26
    .line 27
    const/4 v2, 0x0

    .line 28
    iput-boolean v2, p0, Ll/urh0;->f0:Z

    .line 29
    .line 30
    iput-object v0, p0, Ll/urh0;->g0:Ljava/util/List;

    .line 31
    .line 32
    iput v2, p0, Ll/urh0;->h0:I

    .line 33
    .line 34
    iput-boolean v2, p0, Ll/urh0;->j0:Z

    .line 35
    .line 36
    iput-boolean v2, p0, Ll/urh0;->k0:Z

    .line 37
    .line 38
    iput-boolean v2, p0, Ll/urh0;->l0:Z

    .line 39
    .line 40
    iput-boolean v2, p0, Ll/urh0;->m0:Z

    .line 41
    .line 42
    iput v2, p0, Ll/urh0;->n0:I

    .line 43
    .line 44
    iput v2, p0, Ll/urh0;->o0:I

    .line 45
    .line 46
    iput-wide p1, p0, Ll/urh0;->p0:J

    .line 47
    .line 48
    iput-object v0, p0, Ll/urh0;->q0:Landroid/os/ConditionVariable;

    .line 49
    .line 50
    iput v1, p0, Ll/urh0;->r0:I

    .line 51
    .line 52
    iput v2, p0, Ll/urh0;->s0:I

    .line 53
    .line 54
    iput v2, p0, Ll/urh0;->t0:I

    .line 55
    .line 56
    iput-wide p1, p0, Ll/urh0;->u0:J

    .line 57
    .line 58
    iput-object p3, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->e:Landroid/hardware/camera2/CameraManager;

    .line 59
    .line 60
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 61
    .line 62
    iget-boolean p1, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->m:Z

    .line 63
    .line 64
    if-eqz p1, :cond_0

    .line 65
    .line 66
    new-instance p1, Ll/wrh0;

    .line 67
    .line 68
    invoke-direct {p1, p0}, Ll/wrh0;-><init>(Ll/p6m$a;)V

    .line 69
    .line 70
    .line 71
    iput-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->i:Ll/orh0;

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_0
    new-instance p1, Ll/vrh0;

    .line 75
    .line 76
    invoke-direct {p1, p0}, Ll/vrh0;-><init>(Ll/p6m$a;)V

    .line 77
    .line 78
    .line 79
    iput-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->i:Ll/orh0;

    .line 80
    .line 81
    :goto_0
    new-instance p1, Ll/urh0$i;

    .line 82
    .line 83
    invoke-virtual {p4}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 84
    .line 85
    .line 86
    move-result-object p2

    .line 87
    invoke-direct {p1, p0, p2}, Ll/urh0$i;-><init>(Ll/urh0;Landroid/os/Looper;)V

    .line 88
    .line 89
    .line 90
    iput-object p1, p0, Ll/urh0;->Y:Ll/urh0$i;

    .line 91
    .line 92
    invoke-direct {p0}, Ll/urh0;->T1()V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public static synthetic A1(Ll/urh0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/urh0;->O1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic B0(Ll/urh0;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/urh0;->l0:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic B1(Ll/urh0;)Landroid/hardware/camera2/CaptureRequest$Builder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic C0(Ll/urh0;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/urh0;->l0:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic C1(Ll/urh0;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/urh0;->k0:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic D0(Ll/urh0;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/urh0;->X:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic D1(Ll/urh0;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/urh0;->k0:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic E0(Ll/urh0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->Q()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic E1(Ll/urh0;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/urh0;->u0:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic F0(Ll/urh0;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->G:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic F1(Ll/urh0;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/urh0;->u0:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic G0(Ll/urh0;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->J:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic G1(Ll/urh0;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/urh0;->t0:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic H0(Ll/urh0;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->I:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic H1(Ll/urh0;I)I
    .locals 0

    .line 1
    iput p1, p0, Ll/urh0;->t0:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic I0(Ll/urh0;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/urh0;->n0:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic I1(Ll/urh0;)I
    .locals 2

    .line 1
    iget v0, p0, Ll/urh0;->t0:I

    .line 2
    .line 3
    add-int/lit8 v1, v0, 0x1

    .line 4
    .line 5
    iput v1, p0, Ll/urh0;->t0:I

    .line 6
    .line 7
    return v0
.end method

.method public static synthetic J0(Ll/urh0;I)I
    .locals 0

    .line 1
    iput p1, p0, Ll/urh0;->n0:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic J1(Ll/urh0;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->G:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic K0(Ll/urh0;)I
    .locals 2

    .line 1
    iget v0, p0, Ll/urh0;->n0:I

    .line 2
    .line 3
    add-int/lit8 v1, v0, 0x1

    .line 4
    .line 5
    iput v1, p0, Ll/urh0;->n0:I

    .line 6
    .line 7
    return v0
.end method

.method private K1()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 2
    .line 3
    iget-boolean v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->Z:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_AE_AVAILABLE_TARGET_FPS_RANGES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, [Landroid/util/Range;

    .line 18
    .line 19
    invoke-direct {p0, v0}, Ll/urh0;->R1([Landroid/util/Range;)Landroid/util/Range;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 24
    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    sget-object v2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_TARGET_FPS_RANGE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 30
    .line 31
    invoke-virtual {v1, v2, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 35
    .line 36
    invoke-virtual {p0, v1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->v0(Landroid/hardware/camera2/CaptureRequest$Builder;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 37
    .line 38
    .line 39
    new-instance v1, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    const-string v2, "apply capture scene: "

    .line 42
    .line 43
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    const-string v1, "TEImage2Mode"

    .line 54
    .line 55
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    :cond_0
    invoke-direct {p0}, Ll/urh0;->M1()V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public static synthetic L0(Ll/urh0;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/urh0;->o0:I

    .line 2
    .line 3
    return p0
.end method

.method private L1()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 2
    .line 3
    iget-boolean v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->Z:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_AE_AVAILABLE_TARGET_FPS_RANGES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, [Landroid/util/Range;

    .line 18
    .line 19
    invoke-direct {p0, v0}, Ll/urh0;->S1([Landroid/util/Range;)Landroid/util/Range;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 24
    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    sget-object v2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_TARGET_FPS_RANGE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 30
    .line 31
    invoke-virtual {v1, v2, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 35
    .line 36
    invoke-virtual {p0, v1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->v0(Landroid/hardware/camera2/CaptureRequest$Builder;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 37
    .line 38
    .line 39
    new-instance v1, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    const-string v2, "apply record scene: "

    .line 42
    .line 43
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    const-string v1, "TEImage2Mode"

    .line 54
    .line 55
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    :cond_0
    invoke-direct {p0}, Ll/urh0;->P1()V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public static synthetic M0(Ll/urh0;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/urh0;->c0:I

    .line 2
    .line 3
    return p0
.end method

.method private M1()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/urh0;->b0:Landroid/media/ImageReader;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/Surface;->isValid()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 18
    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    :try_start_0
    invoke-virtual {v1, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->removeTarget(Landroid/view/Surface;)V

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 25
    .line 26
    invoke-virtual {v1, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :catch_0
    move-exception v0

    .line 31
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 32
    .line 33
    .line 34
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->v0(Landroid/hardware/camera2/CaptureRequest$Builder;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 37
    .line 38
    .line 39
    :cond_1
    return-void
.end method

.method public static synthetic N0(Ll/urh0;I)I
    .locals 0

    .line 1
    iput p1, p0, Ll/urh0;->c0:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic O0(Ll/urh0;)I
    .locals 2

    .line 1
    iget v0, p0, Ll/urh0;->c0:I

    .line 2
    .line 3
    add-int/lit8 v1, v0, 0x1

    .line 4
    .line 5
    iput v1, p0, Ll/urh0;->c0:I

    .line 6
    .line 7
    return v0
.end method

.method private O1()V
    .locals 4

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iput-wide v0, p0, Ll/urh0;->p0:J

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput v0, p0, Ll/urh0;->h0:I

    .line 9
    .line 10
    const/4 v0, 0x2

    .line 11
    invoke-virtual {p0, v0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->s(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/16 v1, -0x3e9

    .line 16
    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    new-instance v0, Ljava/lang/Exception;

    .line 20
    .line 21
    const-string v2, "capture build is null"

    .line 22
    .line 23
    invoke-direct {v0, v2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-direct {p0, v0, v1}, Ll/urh0;->U1(Ljava/lang/Exception;I)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    iget-object v2, p0, Ll/urh0;->a0:Landroid/media/ImageReader;

    .line 31
    .line 32
    if-nez v2, :cond_1

    .line 33
    .line 34
    new-instance v0, Ljava/lang/Exception;

    .line 35
    .line 36
    const-string v2, "image reader is null"

    .line 37
    .line 38
    invoke-direct {v0, v2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-direct {p0, v0, v1}, Ll/urh0;->U1(Ljava/lang/Exception;I)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_1
    invoke-virtual {v2}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-virtual {v0, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 50
    .line 51
    .line 52
    invoke-direct {p0, v0}, Ll/urh0;->a2(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 53
    .line 54
    .line 55
    new-instance v2, Ll/urh0$c;

    .line 56
    .line 57
    invoke-direct {v2, p0}, Ll/urh0$c;-><init>(Ll/urh0;)V

    .line 58
    .line 59
    .line 60
    iget-object v3, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->k:Landroid/os/Handler;

    .line 61
    .line 62
    invoke-virtual {p0, v0, v2, v3}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->l(Landroid/hardware/camera2/CaptureRequest$Builder;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->c()Z

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    if-nez v2, :cond_2

    .line 71
    .line 72
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->b()Ljava/lang/Exception;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-direct {p0, v0, v1}, Ll/urh0;->U1(Ljava/lang/Exception;I)V

    .line 77
    .line 78
    .line 79
    :cond_2
    return-void
.end method

.method public static synthetic P0(Ll/urh0;)[Landroid/hardware/camera2/TotalCaptureResult;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/urh0;->d0:[Landroid/hardware/camera2/TotalCaptureResult;

    .line 2
    .line 3
    return-object p0
.end method

.method private P1()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/urh0;->b0:Landroid/media/ImageReader;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/Surface;->isValid()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 18
    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    :try_start_0
    invoke-virtual {v1, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->removeTarget(Landroid/view/Surface;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :catch_0
    move-exception v0

    .line 26
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 27
    .line 28
    .line 29
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->v0(Landroid/hardware/camera2/CaptureRequest$Builder;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 32
    .line 33
    .line 34
    :cond_1
    return-void
.end method

.method public static synthetic Q0(Ll/urh0;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/urh0;->i0:I

    .line 2
    .line 3
    return p0
.end method

.method private Q1()V
    .locals 4

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iput-wide v0, p0, Ll/urh0;->p0:J

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput v0, p0, Ll/urh0;->h0:I

    .line 9
    .line 10
    const/4 v0, 0x2

    .line 11
    invoke-virtual {p0, v0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->s(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/16 v1, -0x3e9

    .line 16
    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    new-instance v0, Ljava/lang/Exception;

    .line 20
    .line 21
    const-string v2, "capture build is null"

    .line 22
    .line 23
    invoke-direct {v0, v2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-direct {p0, v0, v1}, Ll/urh0;->U1(Ljava/lang/Exception;I)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    iget-object v2, p0, Ll/urh0;->a0:Landroid/media/ImageReader;

    .line 31
    .line 32
    if-nez v2, :cond_1

    .line 33
    .line 34
    new-instance v0, Ljava/lang/Exception;

    .line 35
    .line 36
    const-string v2, "image reader is null"

    .line 37
    .line 38
    invoke-direct {v0, v2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-direct {p0, v0, v1}, Ll/urh0;->U1(Ljava/lang/Exception;I)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_1
    invoke-virtual {v2}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-virtual {v0, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 50
    .line 51
    .line 52
    invoke-direct {p0, v0}, Ll/urh0;->a2(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 53
    .line 54
    .line 55
    new-instance v2, Ll/urh0$d;

    .line 56
    .line 57
    invoke-direct {v2, p0}, Ll/urh0$d;-><init>(Ll/urh0;)V

    .line 58
    .line 59
    .line 60
    const/4 v3, 0x0

    .line 61
    invoke-virtual {p0, v0, v2, v3}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->l(Landroid/hardware/camera2/CaptureRequest$Builder;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->c()Z

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    if-nez v2, :cond_2

    .line 70
    .line 71
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->b()Ljava/lang/Exception;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-direct {p0, v0, v1}, Ll/urh0;->U1(Ljava/lang/Exception;I)V

    .line 76
    .line 77
    .line 78
    :cond_2
    return-void
.end method

.method public static synthetic R0(Ll/urh0;)Lcom/ss/android/ttvecamera/TECameraSettings$c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    return-object p0
.end method

.method private R1([Landroid/util/Range;)Landroid/util/Range;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;)",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_7

    .line 3
    .line 4
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 5
    .line 6
    const/16 v1, 0x1e

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    iget p0, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->Y:I

    .line 11
    .line 12
    if-ge p0, v1, :cond_1

    .line 13
    .line 14
    :cond_0
    move p0, v1

    .line 15
    :cond_1
    array-length v2, p1

    .line 16
    const/4 v3, 0x0

    .line 17
    move v4, v3

    .line 18
    move v5, v4

    .line 19
    :goto_0
    if-ge v3, v2, :cond_6

    .line 20
    .line 21
    aget-object v6, p1, v3

    .line 22
    .line 23
    new-instance v7, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    const-string v8, "fps: "

    .line 26
    .line 27
    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v6}, Landroid/util/Range;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v8

    .line 34
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v7

    .line 41
    const-string v8, "TEImage2Mode"

    .line 42
    .line 43
    invoke-static {v8, v7}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v6}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    .line 47
    .line 48
    .line 49
    move-result-object v7

    .line 50
    check-cast v7, Ljava/lang/Integer;

    .line 51
    .line 52
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    .line 53
    .line 54
    .line 55
    move-result v7

    .line 56
    invoke-virtual {v6}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    .line 57
    .line 58
    .line 59
    move-result-object v9

    .line 60
    check-cast v9, Ljava/lang/Integer;

    .line 61
    .line 62
    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    .line 63
    .line 64
    .line 65
    move-result v9

    .line 66
    const/4 v10, 0x5

    .line 67
    if-ge v9, v10, :cond_2

    .line 68
    .line 69
    new-instance v7, Ljava/lang/StringBuilder;

    .line 70
    .line 71
    const-string v9, "discard fps: "

    .line 72
    .line 73
    invoke-direct {v7, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v6}, Landroid/util/Range;->toString()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v6

    .line 80
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v6

    .line 87
    invoke-static {v8, v6}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    goto :goto_1

    .line 91
    :cond_2
    if-le v7, v4, :cond_3

    .line 92
    .line 93
    move v4, v7

    .line 94
    :cond_3
    if-le v7, p0, :cond_4

    .line 95
    .line 96
    goto :goto_1

    .line 97
    :cond_4
    sub-int/2addr v7, v9

    .line 98
    if-le v7, v5, :cond_5

    .line 99
    .line 100
    move-object v0, v6

    .line 101
    move v5, v7

    .line 102
    :cond_5
    :goto_1
    add-int/lit8 v3, v3, 0x1

    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_6
    if-le v4, v1, :cond_7

    .line 106
    .line 107
    const-string p0, "te_record_camera_max_fps"

    .line 108
    .line 109
    int-to-long v1, v4

    .line 110
    invoke-static {p0, v1, v2}, Ll/hrh0;->b(Ljava/lang/String;J)V

    .line 111
    .line 112
    .line 113
    :cond_7
    return-object v0
.end method

.method public static synthetic S0(Ll/urh0;)Ll/urh0$i;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/urh0;->Y:Ll/urh0$i;

    .line 2
    .line 3
    return-object p0
.end method

.method private S1([Landroid/util/Range;)Landroid/util/Range;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;)",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_5

    .line 3
    .line 4
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 5
    .line 6
    const/16 v1, 0x1e

    .line 7
    .line 8
    if-eqz p0, :cond_1

    .line 9
    .line 10
    iget p0, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->Y:I

    .line 11
    .line 12
    if-ge p0, v1, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    move v1, p0

    .line 16
    :cond_1
    :goto_0
    array-length p0, p1

    .line 17
    const/4 v2, 0x0

    .line 18
    move v3, v2

    .line 19
    move v4, v3

    .line 20
    :goto_1
    if-ge v2, p0, :cond_5

    .line 21
    .line 22
    aget-object v5, p1, v2

    .line 23
    .line 24
    new-instance v6, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    const-string v7, "fps: "

    .line 27
    .line 28
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v5}, Landroid/util/Range;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v7

    .line 35
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v6

    .line 42
    const-string v7, "TEImage2Mode"

    .line 43
    .line 44
    invoke-static {v7, v6}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v5}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    .line 48
    .line 49
    .line 50
    move-result-object v6

    .line 51
    check-cast v6, Ljava/lang/Integer;

    .line 52
    .line 53
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    .line 54
    .line 55
    .line 56
    move-result v6

    .line 57
    if-le v6, v3, :cond_2

    .line 58
    .line 59
    move v3, v6

    .line 60
    :cond_2
    if-gt v6, v1, :cond_4

    .line 61
    .line 62
    invoke-virtual {v5}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    .line 63
    .line 64
    .line 65
    move-result-object v7

    .line 66
    check-cast v7, Ljava/lang/Integer;

    .line 67
    .line 68
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    .line 69
    .line 70
    .line 71
    move-result v7

    .line 72
    if-eq v6, v7, :cond_3

    .line 73
    .line 74
    goto :goto_2

    .line 75
    :cond_3
    if-le v6, v4, :cond_4

    .line 76
    .line 77
    move-object v0, v5

    .line 78
    move v4, v6

    .line 79
    :cond_4
    :goto_2
    add-int/lit8 v2, v2, 0x1

    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_5
    return-object v0
.end method

.method public static synthetic T0(Ll/urh0;)Landroid/hardware/camera2/CaptureRequest$Builder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 2
    .line 3
    return-object p0
.end method

.method private T1()V
    .locals 1

    .line 1
    new-instance v0, Ll/urh0$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/urh0$a;-><init>(Ll/urh0;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->W:Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic U0(Ll/urh0;)Landroid/hardware/camera2/TotalCaptureResult;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/urh0;->e0:Landroid/hardware/camera2/TotalCaptureResult;

    .line 2
    .line 3
    return-object p0
.end method

.method private U1(Ljava/lang/Exception;I)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/urh0;->h0:I

    .line 3
    .line 4
    new-instance p0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v0, "onCaptureFailed, err = "

    .line 7
    .line 8
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string p1, ", errCode = "

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const-string p1, "TEImage2Mode"

    .line 27
    .line 28
    invoke-static {p1, p0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public static synthetic V0(Ll/urh0;Landroid/hardware/camera2/TotalCaptureResult;)Landroid/hardware/camera2/TotalCaptureResult;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/urh0;->e0:Landroid/hardware/camera2/TotalCaptureResult;

    .line 2
    .line 3
    return-object p1
.end method

.method private V1(Landroid/media/Image;Landroid/hardware/camera2/TotalCaptureResult;)V
    .locals 7

    .line 1
    invoke-virtual {p1}, Landroid/media/Image;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    invoke-virtual {p1}, Landroid/media/Image;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget v1, p0, Ll/urh0;->i0:I

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    if-ne v1, v2, :cond_0

    .line 13
    .line 14
    const/16 v1, 0x10e

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/16 v1, 0x5a

    .line 18
    .line 19
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    const-string v3, "on image available, consume: "

    .line 22
    .line 23
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 27
    .line 28
    .line 29
    move-result-wide v3

    .line 30
    iget-wide v5, p0, Ll/urh0;->p0:J

    .line 31
    .line 32
    sub-long/2addr v3, v5

    .line 33
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string p0, ", size: "

    .line 37
    .line 38
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    const-string p0, "x"

    .line 45
    .line 46
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string p0, ", format: "

    .line 53
    .line 54
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1}, Landroid/media/Image;->getFormat()I

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    const-string p0, ", rotation: "

    .line 65
    .line 66
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    const-string p1, "TEImage2Mode"

    .line 77
    .line 78
    invoke-static {p1, p0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public static synthetic W0(Ll/urh0;)Landroid/hardware/camera2/CaptureRequest$Builder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 2
    .line 3
    return-object p0
.end method

.method private W1()V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 7
    .line 8
    iget v2, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 9
    .line 10
    if-eqz v2, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 14
    .line 15
    if-nez v2, :cond_1

    .line 16
    .line 17
    const-string p0, "TEImage2Mode"

    .line 18
    .line 19
    const-string v0, "resetPreviewAfterFlashCapture failed, no builder"

    .line 20
    .line 21
    invoke-static {p0, v0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    iget v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->f0:I

    .line 26
    .line 27
    const/4 v3, 0x3

    .line 28
    if-ne v1, v3, :cond_2

    .line 29
    .line 30
    iget-boolean v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->L:Z

    .line 31
    .line 32
    if-eqz v1, :cond_3

    .line 33
    .line 34
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 35
    .line 36
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    invoke-virtual {v2, v1, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 44
    .line 45
    sget-object v2, Landroid/hardware/camera2/CaptureRequest;->FLASH_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 46
    .line 47
    const/4 v3, 0x1

    .line 48
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    invoke-virtual {v1, v2, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_2
    const/4 v3, 0x2

    .line 57
    if-ne v1, v3, :cond_3

    .line 58
    .line 59
    iget-boolean v1, p0, Ll/urh0;->j0:Z

    .line 60
    .line 61
    if-eqz v1, :cond_3

    .line 62
    .line 63
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 64
    .line 65
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    invoke-virtual {v2, v1, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 70
    .line 71
    .line 72
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 73
    .line 74
    const/4 v2, 0x0

    .line 75
    invoke-virtual {p0, v1, v2, v2}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->l(Landroid/hardware/camera2/CaptureRequest$Builder;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 76
    .line 77
    .line 78
    :cond_3
    :goto_0
    iget-boolean v1, p0, Ll/urh0;->j0:Z

    .line 79
    .line 80
    if-eqz v1, :cond_4

    .line 81
    .line 82
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 83
    .line 84
    sget-object v2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 85
    .line 86
    invoke-virtual {v1, v2, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 87
    .line 88
    .line 89
    :cond_4
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 90
    .line 91
    sget-object v2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 92
    .line 93
    const/4 v3, 0x4

    .line 94
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    invoke-virtual {v1, v2, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 99
    .line 100
    .line 101
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 102
    .line 103
    sget-object v2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_PRECAPTURE_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 104
    .line 105
    invoke-virtual {v1, v2, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 106
    .line 107
    .line 108
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 109
    .line 110
    invoke-virtual {p0, v0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->v0(Landroid/hardware/camera2/CaptureRequest$Builder;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 111
    .line 112
    .line 113
    return-void
.end method

.method public static synthetic X0(Ll/urh0;)Landroid/hardware/camera2/CaptureRequest$Builder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 2
    .line 3
    return-object p0
.end method

.method private X1(IIII)Lcom/ss/android/ttvecamera/TEFrameSizei;
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 2
    .line 3
    iget-boolean v1, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->A:Z

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    iput-boolean v2, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->A:Z

    .line 9
    .line 10
    iget-object p0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->r:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->l:Landroid/hardware/camera2/params/StreamConfigurationMap;

    .line 14
    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 18
    .line 19
    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->SCALER_STREAM_CONFIGURATION_MAP:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Landroid/hardware/camera2/params/StreamConfigurationMap;

    .line 26
    .line 27
    iput-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->l:Landroid/hardware/camera2/params/StreamConfigurationMap;

    .line 28
    .line 29
    :cond_1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->l:Landroid/hardware/camera2/params/StreamConfigurationMap;

    .line 30
    .line 31
    const/4 v1, 0x0

    .line 32
    const-string v3, "TEImage2Mode"

    .line 33
    .line 34
    if-nez v0, :cond_2

    .line 35
    .line 36
    const-string p0, "no stream configuration map..."

    .line 37
    .line 38
    invoke-static {v3, p0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-object v1

    .line 42
    :cond_2
    invoke-virtual {v0, p1}, Landroid/hardware/camera2/params/StreamConfigurationMap;->isOutputSupportedFor(I)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-nez v0, :cond_3

    .line 47
    .line 48
    const-string p0, "Output format is not supported"

    .line 49
    .line 50
    invoke-static {v3, p0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    return-object v1

    .line 54
    :cond_3
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->l:Landroid/hardware/camera2/params/StreamConfigurationMap;

    .line 55
    .line 56
    invoke-virtual {v0, p1}, Landroid/hardware/camera2/params/StreamConfigurationMap;->getOutputSizes(I)[Landroid/util/Size;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    new-instance v0, Ljava/util/ArrayList;

    .line 61
    .line 62
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 63
    .line 64
    .line 65
    array-length v4, p1

    .line 66
    move v5, v2

    .line 67
    :goto_0
    if-ge v5, v4, :cond_4

    .line 68
    .line 69
    aget-object v6, p1, v5

    .line 70
    .line 71
    new-instance v7, Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 72
    .line 73
    invoke-virtual {v6}, Landroid/util/Size;->getWidth()I

    .line 74
    .line 75
    .line 76
    move-result v8

    .line 77
    invoke-virtual {v6}, Landroid/util/Size;->getHeight()I

    .line 78
    .line 79
    .line 80
    move-result v6

    .line 81
    invoke-direct {v7, v8, v6}, Lcom/ss/android/ttvecamera/TEFrameSizei;-><init>(II)V

    .line 82
    .line 83
    .line 84
    invoke-interface {v0, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    add-int/lit8 v5, v5, 0x1

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_4
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 91
    .line 92
    iget-boolean v4, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->z:Z

    .line 93
    .line 94
    if-eqz v4, :cond_5

    .line 95
    .line 96
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/TECameraSettings;->a()Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 101
    .line 102
    iget p0, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->y:F

    .line 103
    .line 104
    invoke-static {v0, p1, p4, p0}, Lcom/ss/android/ttvecamera/f;->o(Ljava/util/List;Lcom/ss/android/ttvecamera/TEFrameSizei;IF)Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    return-object p0

    .line 109
    :cond_5
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->u:Lcom/ss/android/ttvecamera/c$d;

    .line 110
    .line 111
    if-eqz p1, :cond_8

    .line 112
    .line 113
    const-class p1, Landroid/graphics/SurfaceTexture;

    .line 114
    .line 115
    invoke-static {p1}, Landroid/hardware/camera2/params/StreamConfigurationMap;->isOutputSupportedFor(Ljava/lang/Class;)Z

    .line 116
    .line 117
    .line 118
    move-result p4

    .line 119
    if-nez p4, :cond_6

    .line 120
    .line 121
    const-string p0, "Output SurfaceTexture is not supported"

    .line 122
    .line 123
    invoke-static {v3, p0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    return-object v1

    .line 127
    :cond_6
    iget-object p4, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->l:Landroid/hardware/camera2/params/StreamConfigurationMap;

    .line 128
    .line 129
    invoke-virtual {p4, p1}, Landroid/hardware/camera2/params/StreamConfigurationMap;->getOutputSizes(Ljava/lang/Class;)[Landroid/util/Size;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    new-instance p4, Ljava/util/ArrayList;

    .line 134
    .line 135
    invoke-direct {p4}, Ljava/util/ArrayList;-><init>()V

    .line 136
    .line 137
    .line 138
    array-length v4, p1

    .line 139
    :goto_1
    if-ge v2, v4, :cond_7

    .line 140
    .line 141
    aget-object v5, p1, v2

    .line 142
    .line 143
    new-instance v6, Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 144
    .line 145
    invoke-virtual {v5}, Landroid/util/Size;->getWidth()I

    .line 146
    .line 147
    .line 148
    move-result v7

    .line 149
    invoke-virtual {v5}, Landroid/util/Size;->getHeight()I

    .line 150
    .line 151
    .line 152
    move-result v5

    .line 153
    invoke-direct {v6, v7, v5}, Lcom/ss/android/ttvecamera/TEFrameSizei;-><init>(II)V

    .line 154
    .line 155
    .line 156
    invoke-interface {p4, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 157
    .line 158
    .line 159
    add-int/lit8 v2, v2, 0x1

    .line 160
    .line 161
    goto :goto_1

    .line 162
    :cond_7
    :try_start_0
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->u:Lcom/ss/android/ttvecamera/c$d;

    .line 163
    .line 164
    invoke-interface {p1, v0, p4}, Lcom/ss/android/ttvecamera/c$d;->a(Ljava/util/List;Ljava/util/List;)Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 165
    .line 166
    .line 167
    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 168
    goto :goto_2

    .line 169
    :catch_0
    move-exception p1

    .line 170
    new-instance p4, Ljava/lang/StringBuilder;

    .line 171
    .line 172
    const-string v2, "select pic size from client err: "

    .line 173
    .line 174
    invoke-direct {p4, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 175
    .line 176
    .line 177
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object p1

    .line 181
    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 182
    .line 183
    .line 184
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object p1

    .line 188
    invoke-static {v3, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 189
    .line 190
    .line 191
    :cond_8
    :goto_2
    if-nez v1, :cond_9

    .line 192
    .line 193
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 194
    .line 195
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/TECameraSettings;->a()Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 196
    .line 197
    .line 198
    move-result-object p0

    .line 199
    new-instance p1, Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 200
    .line 201
    invoke-direct {p1, p2, p3}, Lcom/ss/android/ttvecamera/TEFrameSizei;-><init>(II)V

    .line 202
    .line 203
    .line 204
    invoke-static {v0, p0, p1}, Lcom/ss/android/ttvecamera/f;->p(Ljava/util/List;Lcom/ss/android/ttvecamera/TEFrameSizei;Lcom/ss/android/ttvecamera/TEFrameSizei;)Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 205
    .line 206
    .line 207
    move-result-object v1

    .line 208
    new-instance p0, Ljava/lang/StringBuilder;

    .line 209
    .line 210
    const-string p1, "select pic size is null, get closest size: "

    .line 211
    .line 212
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 213
    .line 214
    .line 215
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 216
    .line 217
    .line 218
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 219
    .line 220
    .line 221
    move-result-object p0

    .line 222
    invoke-static {v3, p0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 223
    .line 224
    .line 225
    :cond_9
    return-object v1
.end method

.method public static synthetic Y0(Ll/urh0;)Landroid/hardware/camera2/CaptureRequest$Builder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic Z0(Ll/urh0;)Landroid/hardware/camera2/CaptureRequest$Builder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic a1(Ll/urh0;)Landroid/hardware/camera2/CaptureRequest$Builder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 2
    .line 3
    return-object p0
.end method

.method private a2(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 4

    .line 1
    const-string v0, "TEImage2Mode"

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    const-string p0, "syncPreviewParam failed, no capture builder"

    .line 6
    .line 7
    invoke-static {v0, p0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 12
    .line 13
    if-nez v1, :cond_1

    .line 14
    .line 15
    const-string p0, "syncPreviewParam failed, no preview builder"

    .line 16
    .line 17
    invoke-static {v0, p0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_1
    sget-object v2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->get(Landroid/hardware/camera2/CaptureRequest$Key;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Ljava/lang/Integer;

    .line 28
    .line 29
    if-eqz v1, :cond_2

    .line 30
    .line 31
    invoke-virtual {p1, v2, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    new-instance v2, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    const-string v3, "sync afMode: "

    .line 37
    .line 38
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-static {v0, v1}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    :cond_2
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 52
    .line 53
    sget-object v2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_REGIONS:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 54
    .line 55
    invoke-virtual {v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->get(Landroid/hardware/camera2/CaptureRequest$Key;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    check-cast v1, [Landroid/hardware/camera2/params/MeteringRectangle;

    .line 60
    .line 61
    if-eqz v1, :cond_3

    .line 62
    .line 63
    invoke-virtual {p1, v2, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 64
    .line 65
    .line 66
    new-instance v2, Ljava/lang/StringBuilder;

    .line 67
    .line 68
    const-string v3, "sync aeRect: "

    .line 69
    .line 70
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    invoke-static {v1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    invoke-static {v0, v2}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    :cond_3
    iget-object v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 88
    .line 89
    sget-object v3, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_REGIONS:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 90
    .line 91
    invoke-virtual {v2, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->get(Landroid/hardware/camera2/CaptureRequest$Key;)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    check-cast v2, [Landroid/hardware/camera2/params/MeteringRectangle;

    .line 96
    .line 97
    if-eqz v1, :cond_4

    .line 98
    .line 99
    invoke-virtual {p1, v3, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 100
    .line 101
    .line 102
    new-instance v1, Ljava/lang/StringBuilder;

    .line 103
    .line 104
    const-string v3, "sync afRect: "

    .line 105
    .line 106
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    invoke-static {v2}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    invoke-static {v0, v1}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    :cond_4
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 124
    .line 125
    invoke-virtual {p0, v1, p1}, Ll/urh0;->Y1(Landroid/hardware/camera2/CaptureRequest$Builder;Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 126
    .line 127
    .line 128
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 129
    .line 130
    sget-object v2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_TARGET_FPS_RANGE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 131
    .line 132
    invoke-virtual {v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->get(Landroid/hardware/camera2/CaptureRequest$Key;)Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    move-result-object v1

    .line 136
    check-cast v1, Landroid/util/Range;

    .line 137
    .line 138
    if-eqz v1, :cond_5

    .line 139
    .line 140
    invoke-virtual {p1, v2, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 141
    .line 142
    .line 143
    new-instance v2, Ljava/lang/StringBuilder;

    .line 144
    .line 145
    const-string v3, "sync fpsRange: "

    .line 146
    .line 147
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    invoke-static {v0, v1}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 158
    .line 159
    .line 160
    :cond_5
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->t:Landroid/graphics/Rect;

    .line 161
    .line 162
    if-eqz v1, :cond_6

    .line 163
    .line 164
    sget-object v2, Landroid/hardware/camera2/CaptureRequest;->SCALER_CROP_REGION:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 165
    .line 166
    invoke-virtual {p1, v2, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 167
    .line 168
    .line 169
    new-instance v1, Ljava/lang/StringBuilder;

    .line 170
    .line 171
    const-string v2, "sync crop region: "

    .line 172
    .line 173
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 174
    .line 175
    .line 176
    iget-object v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->t:Landroid/graphics/Rect;

    .line 177
    .line 178
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 179
    .line 180
    .line 181
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object v1

    .line 185
    invoke-static {v0, v1}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 186
    .line 187
    .line 188
    :cond_6
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->b:Ll/crh0;

    .line 189
    .line 190
    if-eqz v0, :cond_7

    .line 191
    .line 192
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 193
    .line 194
    const/4 v2, 0x0

    .line 195
    invoke-virtual {v0, v1, p1, v2}, Ll/crh0;->a(Landroid/hardware/camera2/CameraCharacteristics;Landroid/hardware/camera2/CaptureRequest$Builder;Z)I

    .line 196
    .line 197
    .line 198
    :cond_7
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_EXPOSURE_COMPENSATION:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 199
    .line 200
    iget p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->s:I

    .line 201
    .line 202
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 203
    .line 204
    .line 205
    move-result-object p0

    .line 206
    invoke-virtual {p1, v0, p0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 207
    .line 208
    .line 209
    return-void
.end method

.method public static synthetic b1(Ll/urh0;Landroid/hardware/camera2/CaptureRequest$Builder;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->l(Landroid/hardware/camera2/CaptureRequest$Builder;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic c1(Ll/urh0;)Landroid/hardware/camera2/CaptureRequest$Builder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d1(Ll/urh0;)Landroid/hardware/camera2/CaptureRequest$Builder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic e1(Ll/urh0;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/urh0;->h0:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic f1(Ll/urh0;)Landroid/hardware/camera2/CaptureRequest$Builder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic g1(Ll/urh0;I)I
    .locals 0

    .line 1
    iput p1, p0, Ll/urh0;->h0:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic h1(Ll/urh0;Landroid/hardware/camera2/CaptureRequest$Builder;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->v0(Landroid/hardware/camera2/CaptureRequest$Builder;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic i1(Ll/urh0;)Lcom/ss/android/ttvecamera/TECameraSettings;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic j1(Ll/urh0;)Lcom/ss/android/ttvecamera/TECameraSettings;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic k1(Ll/urh0;)Lcom/ss/android/ttvecamera/TECameraSettings;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic l1(Ll/urh0;)Lcom/ss/android/ttvecamera/TECameraSettings;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic m1(Ll/urh0;)Lcom/ss/android/ttvecamera/TECameraSettings;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic n1(Ll/urh0;)Lcom/ss/android/ttvecamera/TECameraSettings;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic o1(Ll/urh0;)Lcom/ss/android/ttvecamera/TECameraSettings;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic p1(Ll/urh0;)Lcom/ss/android/ttvecamera/TECameraSettings;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic q1(Ll/urh0;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/urh0;->f0:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic r1(Ll/urh0;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/urh0;->f0:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic s1(Ll/urh0;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/urh0;->m0:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic t1(Ll/urh0;Landroid/media/Image;Landroid/hardware/camera2/TotalCaptureResult;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/urh0;->V1(Landroid/media/Image;Landroid/hardware/camera2/TotalCaptureResult;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic u1(Ll/urh0;Ljava/lang/Exception;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/urh0;->U1(Ljava/lang/Exception;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic v1(Ll/urh0;)Landroid/os/ConditionVariable;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/urh0;->q0:Landroid/os/ConditionVariable;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic w1(Ll/urh0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/urh0;->Q1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic x1(Ll/urh0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/urh0;->W1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic y1(Ll/urh0;)Landroid/hardware/camera2/CaptureRequest$Builder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic z1(Ll/urh0;Landroid/hardware/camera2/CaptureRequest$Builder;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->v0(Landroid/hardware/camera2/CaptureRequest$Builder;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method


# virtual methods
.method public B()[I
    .locals 3

    .line 1
    iget-object v0, p0, Ll/urh0;->a0:Landroid/media/ImageReader;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return-object v1

    .line 7
    :cond_0
    invoke-virtual {v0}, Landroid/media/ImageReader;->getWidth()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object p0, p0, Ll/urh0;->a0:Landroid/media/ImageReader;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/media/ImageReader;->getHeight()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-lez v0, :cond_1

    .line 18
    .line 19
    if-lez p0, :cond_1

    .line 20
    .line 21
    const/4 v1, 0x2

    .line 22
    new-array v1, v1, [I

    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    aput v0, v1, v2

    .line 26
    .line 27
    const/4 v0, 0x1

    .line 28
    aput p0, v1, v0

    .line 29
    .line 30
    :cond_1
    return-object v1
.end method

.method public E()I
    .locals 0

    .line 1
    const/4 p0, 0x4

    .line 2
    return p0
.end method

.method public G()I
    .locals 0

    .line 1
    iget p0, p0, Ll/urh0;->r0:I

    .line 2
    .line 3
    return p0
.end method

.method public K()[I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/urh0;->a0:Landroid/media/ImageReader;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    invoke-virtual {v0}, Landroid/media/ImageReader;->getWidth()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object p0, p0, Ll/urh0;->a0:Landroid/media/ImageReader;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/media/ImageReader;->getHeight()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    filled-new-array {v0, p0}, [I

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public N1()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 2
    .line 3
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->get(Landroid/hardware/camera2/CaptureRequest$Key;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Ljava/lang/Integer;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v2, 0x1

    .line 18
    if-ne v0, v2, :cond_0

    .line 19
    .line 20
    const-string v0, "TEImage2Mode"

    .line 21
    .line 22
    const-string v2, "need cancel af trigger"

    .line 23
    .line 24
    invoke-static {v0, v2}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 28
    .line 29
    const/4 v2, 0x2

    .line 30
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-virtual {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 38
    .line 39
    const/4 v2, 0x0

    .line 40
    invoke-virtual {p0, v0, v2, v2}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->l(Landroid/hardware/camera2/CaptureRequest$Builder;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 44
    .line 45
    const/4 v2, 0x0

    .line 46
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-virtual {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 54
    .line 55
    invoke-virtual {p0, v0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->v0(Landroid/hardware/camera2/CaptureRequest$Builder;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 56
    .line 57
    .line 58
    :cond_0
    return-void
.end method

.method public P(Ljava/lang/String;I)I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/hardware/camera2/CameraAccessException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/urh0;->s0:I

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    iput-object v1, p0, Ll/urh0;->g0:Ljava/util/List;

    .line 6
    .line 7
    iget v1, p0, Ll/urh0;->r0:I

    .line 8
    .line 9
    const/4 v2, -0x1

    .line 10
    if-ne v1, v2, :cond_0

    .line 11
    .line 12
    iput v0, p0, Ll/urh0;->r0:I

    .line 13
    .line 14
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->P(Ljava/lang/String;I)I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public Y1(Landroid/hardware/camera2/CaptureRequest$Builder;Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 5

    .line 1
    const/4 p0, 0x1

    .line 2
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 7
    .line 8
    invoke-virtual {p1, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->get(Landroid/hardware/camera2/CaptureRequest$Key;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    check-cast v2, Ljava/lang/Integer;

    .line 13
    .line 14
    if-eqz v2, :cond_0

    .line 15
    .line 16
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    const/4 v4, 0x3

    .line 21
    if-ne v3, v4, :cond_0

    .line 22
    .line 23
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p2, v1, p0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    sget-object p0, Landroid/hardware/camera2/CaptureRequest;->FLASH_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 31
    .line 32
    invoke-virtual {p2, p0, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    if-eqz v2, :cond_1

    .line 37
    .line 38
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    if-ne v2, p0, :cond_1

    .line 43
    .line 44
    sget-object p0, Landroid/hardware/camera2/CaptureRequest;->FLASH_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 45
    .line 46
    invoke-virtual {p1, p0}, Landroid/hardware/camera2/CaptureRequest$Builder;->get(Landroid/hardware/camera2/CaptureRequest$Key;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    check-cast p1, Ljava/lang/Integer;

    .line 51
    .line 52
    if-eqz p1, :cond_1

    .line 53
    .line 54
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    const/4 v2, 0x2

    .line 59
    if-ne p1, v2, :cond_1

    .line 60
    .line 61
    invoke-virtual {p2, v1, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-virtual {p2, p0, p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 69
    .line 70
    .line 71
    :cond_1
    return-void
.end method

.method public Z1(II)V
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 2
    .line 3
    iget-boolean v1, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->q0:Z

    .line 4
    .line 5
    const/16 v2, 0x23

    .line 6
    .line 7
    const/16 v3, 0x100

    .line 8
    .line 9
    if-nez v1, :cond_1

    .line 10
    .line 11
    iget-boolean v1, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->h:Z

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    move v1, v3

    .line 17
    goto :goto_1

    .line 18
    :cond_1
    :goto_0
    move v1, v2

    .line 19
    :goto_1
    iget v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->u:I

    .line 20
    .line 21
    invoke-direct {p0, v1, p1, p2, v0}, Ll/urh0;->X1(IIII)Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    const-string p2, "TEImage2Mode"

    .line 26
    .line 27
    if-nez p1, :cond_2

    .line 28
    .line 29
    new-instance p0, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    const-string p1, "select picture size failed...format: "

    .line 32
    .line 33
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-static {p2, p0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_2
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 48
    .line 49
    iput-object p1, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->r:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 50
    .line 51
    iget v4, p1, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 52
    .line 53
    iget p1, p1, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 54
    .line 55
    iget-boolean v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->h:Z

    .line 56
    .line 57
    const/4 v5, 0x0

    .line 58
    const/4 v6, 0x1

    .line 59
    if-eqz v0, :cond_3

    .line 60
    .line 61
    const/16 v0, 0x1000

    .line 62
    .line 63
    if-gt v4, v0, :cond_3

    .line 64
    .line 65
    if-ne v1, v2, :cond_3

    .line 66
    .line 67
    const/4 v0, 0x5

    .line 68
    new-array v0, v0, [Landroid/hardware/camera2/TotalCaptureResult;

    .line 69
    .line 70
    iput-object v0, p0, Ll/urh0;->d0:[Landroid/hardware/camera2/TotalCaptureResult;

    .line 71
    .line 72
    const/4 v0, 0x3

    .line 73
    invoke-static {v4, p1, v1, v0}, Landroid/media/ImageReader;->newInstance(IIII)Landroid/media/ImageReader;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    iput-object v0, p0, Ll/urh0;->b0:Landroid/media/ImageReader;

    .line 78
    .line 79
    new-instance v2, Ll/urh0$f;

    .line 80
    .line 81
    invoke-direct {v2, p0}, Ll/urh0$f;-><init>(Ll/urh0;)V

    .line 82
    .line 83
    .line 84
    iget-object v7, p0, Ll/urh0;->Z:Landroid/os/Handler;

    .line 85
    .line 86
    invoke-virtual {v0, v2, v7}, Landroid/media/ImageReader;->setOnImageAvailableListener(Landroid/media/ImageReader$OnImageAvailableListener;Landroid/os/Handler;)V

    .line 87
    .line 88
    .line 89
    move v0, v6

    .line 90
    goto :goto_2

    .line 91
    :cond_3
    move v0, v5

    .line 92
    :goto_2
    if-eqz v0, :cond_7

    .line 93
    .line 94
    iget-object v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->l:Landroid/hardware/camera2/params/StreamConfigurationMap;

    .line 95
    .line 96
    invoke-virtual {v2, v3}, Landroid/hardware/camera2/params/StreamConfigurationMap;->getOutputSizes(I)[Landroid/util/Size;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    const/4 v7, 0x0

    .line 101
    if-eqz v2, :cond_5

    .line 102
    .line 103
    array-length v8, v2

    .line 104
    :goto_3
    if-ge v5, v8, :cond_5

    .line 105
    .line 106
    aget-object v9, v2, v5

    .line 107
    .line 108
    invoke-virtual {v9}, Landroid/util/Size;->getWidth()I

    .line 109
    .line 110
    .line 111
    move-result v10

    .line 112
    if-ne v10, v4, :cond_4

    .line 113
    .line 114
    invoke-virtual {v9}, Landroid/util/Size;->getHeight()I

    .line 115
    .line 116
    .line 117
    move-result v10

    .line 118
    if-ne v10, p1, :cond_4

    .line 119
    .line 120
    goto :goto_4

    .line 121
    :cond_4
    add-int/lit8 v5, v5, 0x1

    .line 122
    .line 123
    goto :goto_3

    .line 124
    :cond_5
    move-object v9, v7

    .line 125
    :goto_4
    if-nez v9, :cond_6

    .line 126
    .line 127
    iput-object v7, p0, Ll/urh0;->d0:[Landroid/hardware/camera2/TotalCaptureResult;

    .line 128
    .line 129
    iget-object v2, p0, Ll/urh0;->b0:Landroid/media/ImageReader;

    .line 130
    .line 131
    invoke-virtual {v2, v7, v7}, Landroid/media/ImageReader;->setOnImageAvailableListener(Landroid/media/ImageReader$OnImageAvailableListener;Landroid/os/Handler;)V

    .line 132
    .line 133
    .line 134
    iget-object v2, p0, Ll/urh0;->b0:Landroid/media/ImageReader;

    .line 135
    .line 136
    invoke-virtual {v2}, Landroid/media/ImageReader;->close()V

    .line 137
    .line 138
    .line 139
    iput-object v7, p0, Ll/urh0;->b0:Landroid/media/ImageReader;

    .line 140
    .line 141
    goto :goto_5

    .line 142
    :cond_6
    invoke-virtual {v9}, Landroid/util/Size;->getWidth()I

    .line 143
    .line 144
    .line 145
    move-result v4

    .line 146
    invoke-virtual {v9}, Landroid/util/Size;->getHeight()I

    .line 147
    .line 148
    .line 149
    move-result p1

    .line 150
    goto :goto_6

    .line 151
    :cond_7
    :goto_5
    move v3, v1

    .line 152
    :goto_6
    invoke-static {v4, p1, v3, v6}, Landroid/media/ImageReader;->newInstance(IIII)Landroid/media/ImageReader;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    iput-object p1, p0, Ll/urh0;->a0:Landroid/media/ImageReader;

    .line 157
    .line 158
    new-instance p1, Ljava/lang/StringBuilder;

    .line 159
    .line 160
    const-string v1, "image reader width: "

    .line 161
    .line 162
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 163
    .line 164
    .line 165
    iget-object v1, p0, Ll/urh0;->a0:Landroid/media/ImageReader;

    .line 166
    .line 167
    invoke-virtual {v1}, Landroid/media/ImageReader;->getWidth()I

    .line 168
    .line 169
    .line 170
    move-result v1

    .line 171
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 172
    .line 173
    .line 174
    const-string v1, ", height = "

    .line 175
    .line 176
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    iget-object v1, p0, Ll/urh0;->a0:Landroid/media/ImageReader;

    .line 180
    .line 181
    invoke-virtual {v1}, Landroid/media/ImageReader;->getHeight()I

    .line 182
    .line 183
    .line 184
    move-result v1

    .line 185
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    const-string v1, ", format: "

    .line 189
    .line 190
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 191
    .line 192
    .line 193
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 194
    .line 195
    .line 196
    const-string v1, ", maxWidth: "

    .line 197
    .line 198
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 199
    .line 200
    .line 201
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 202
    .line 203
    iget v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->u:I

    .line 204
    .line 205
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    const-string v1, ", hasZslYuvSurface: "

    .line 209
    .line 210
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 211
    .line 212
    .line 213
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 214
    .line 215
    .line 216
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object p1

    .line 220
    invoke-static {p2, p1}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 221
    .line 222
    .line 223
    iget-object p1, p0, Ll/urh0;->a0:Landroid/media/ImageReader;

    .line 224
    .line 225
    new-instance p2, Ll/urh0$g;

    .line 226
    .line 227
    invoke-direct {p2, p0}, Ll/urh0$g;-><init>(Ll/urh0;)V

    .line 228
    .line 229
    .line 230
    iget-object p0, p0, Ll/urh0;->Z:Landroid/os/Handler;

    .line 231
    .line 232
    invoke-virtual {p1, p2, p0}, Landroid/media/ImageReader;->setOnImageAvailableListener(Landroid/media/ImageReader$OnImageAvailableListener;Landroid/os/Handler;)V

    .line 233
    .line 234
    .line 235
    return-void
.end method

.method public b2(I)V
    .locals 6

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    new-instance v2, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v3, "updateFlashModeParam: "

    .line 9
    .line 10
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    const-string v3, "TEImage2Mode"

    .line 21
    .line 22
    invoke-static {v3, v2}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iput p1, p0, Ll/urh0;->r0:I

    .line 26
    .line 27
    iget-object v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 28
    .line 29
    if-nez v2, :cond_0

    .line 30
    .line 31
    const-string p1, "[VE_UI_TEST]Failed event: TOGGLE_TORCH. Code: -100. Reason: mCaptureRequestBuilder is null"

    .line 32
    .line 33
    invoke-static {v3, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 37
    .line 38
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 39
    .line 40
    iget v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 41
    .line 42
    const/16 v1, -0x64

    .line 43
    .line 44
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 45
    .line 46
    const-string v2, "switchFlashMode : CaptureRequest.Builder is null"

    .line 47
    .line 48
    invoke-interface {p1, v0, v1, v2, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_0
    sget-object v4, Landroid/hardware/camera2/CaptureRequest;->FLASH_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 53
    .line 54
    invoke-virtual {v2, v4}, Landroid/hardware/camera2/CaptureRequest$Builder;->get(Landroid/hardware/camera2/CaptureRequest$Key;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    check-cast v2, Ljava/lang/Integer;

    .line 59
    .line 60
    const/4 v5, 0x0

    .line 61
    if-nez v2, :cond_1

    .line 62
    .line 63
    move v2, v5

    .line 64
    goto :goto_0

    .line 65
    :cond_1
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    :goto_0
    if-ne p1, v0, :cond_3

    .line 70
    .line 71
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 72
    .line 73
    iget p1, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 74
    .line 75
    if-ne p1, v0, :cond_2

    .line 76
    .line 77
    const-string p0, "[VE_UI_TEST]Failed event: TOGGLE_TORCH. Code: -416. Reason: not support torch"

    .line 78
    .line 79
    invoke-static {v3, p0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    const-string p0, "flash on is not supported in front camera!"

    .line 83
    .line 84
    invoke-static {v3, p0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :cond_2
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 89
    .line 90
    sget-object v2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 91
    .line 92
    const/4 v3, 0x3

    .line 93
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 94
    .line 95
    .line 96
    move-result-object v3

    .line 97
    invoke-virtual {p1, v2, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 98
    .line 99
    .line 100
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 101
    .line 102
    invoke-virtual {p1, v4, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 103
    .line 104
    .line 105
    iput-boolean v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->L:Z

    .line 106
    .line 107
    return-void

    .line 108
    :cond_3
    if-nez p1, :cond_5

    .line 109
    .line 110
    iput-boolean v5, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->L:Z

    .line 111
    .line 112
    if-nez v2, :cond_4

    .line 113
    .line 114
    const-string p0, "switchFlashMode flashStatus == FLASH_MODE_OFF"

    .line 115
    .line 116
    invoke-static {v3, p0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    return-void

    .line 120
    :cond_4
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 121
    .line 122
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 123
    .line 124
    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 125
    .line 126
    .line 127
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 128
    .line 129
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    invoke-virtual {p0, v4, p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 134
    .line 135
    .line 136
    return-void

    .line 137
    :cond_5
    const/4 v0, 0x2

    .line 138
    if-ne p1, v0, :cond_7

    .line 139
    .line 140
    iput-boolean v5, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->L:Z

    .line 141
    .line 142
    if-ne v2, v0, :cond_6

    .line 143
    .line 144
    const-string p0, "switchFlashMode flashStatus == FLASH_MODE_TORCH"

    .line 145
    .line 146
    invoke-static {v3, p0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    return-void

    .line 150
    :cond_6
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 151
    .line 152
    sget-object v2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 153
    .line 154
    invoke-virtual {p1, v2, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 155
    .line 156
    .line 157
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 158
    .line 159
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 160
    .line 161
    .line 162
    move-result-object p1

    .line 163
    invoke-virtual {p0, v4, p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 164
    .line 165
    .line 166
    return-void

    .line 167
    :cond_7
    new-instance p0, Ljava/lang/StringBuilder;

    .line 168
    .line 169
    const-string v0, "[VE_UI_TEST]Failed event: TOGGLE_TORCH. Code: -416. Reason: not support flash mode "

    .line 170
    .line 171
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 172
    .line 173
    .line 174
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 175
    .line 176
    .line 177
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object p0

    .line 181
    invoke-static {v3, p0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 182
    .line 183
    .line 184
    new-instance p0, Ljava/lang/StringBuilder;

    .line 185
    .line 186
    const-string v0, "not support flash mode: "

    .line 187
    .line 188
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 189
    .line 190
    .line 191
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 192
    .line 193
    .line 194
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object p0

    .line 198
    invoke-static {v3, p0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 199
    .line 200
    .line 201
    return-void
.end method

.method public c(I)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 2
    .line 3
    const-string v1, "TEImage2Mode"

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance p0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v0, "switchFlashMode failed, mode: "

    .line 10
    .line 11
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {v1, p0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    iget v0, p0, Ll/urh0;->r0:I

    .line 26
    .line 27
    const/4 v2, -0x1

    .line 28
    if-eq v0, v2, :cond_1

    .line 29
    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    if-nez p1, :cond_1

    .line 33
    .line 34
    const/4 v0, 0x1

    .line 35
    goto :goto_0

    .line 36
    :cond_1
    const/4 v0, 0x0

    .line 37
    :goto_0
    invoke-virtual {p0, p1}, Ll/urh0;->b2(I)V

    .line 38
    .line 39
    .line 40
    if-eqz v0, :cond_4

    .line 41
    .line 42
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 43
    .line 44
    .line 45
    move-result-wide v2

    .line 46
    iget-object p1, p0, Ll/urh0;->q0:Landroid/os/ConditionVariable;

    .line 47
    .line 48
    if-nez p1, :cond_2

    .line 49
    .line 50
    new-instance p1, Landroid/os/ConditionVariable;

    .line 51
    .line 52
    invoke-direct {p1}, Landroid/os/ConditionVariable;-><init>()V

    .line 53
    .line 54
    .line 55
    iput-object p1, p0, Ll/urh0;->q0:Landroid/os/ConditionVariable;

    .line 56
    .line 57
    :cond_2
    iget-object p1, p0, Ll/urh0;->q0:Landroid/os/ConditionVariable;

    .line 58
    .line 59
    invoke-virtual {p1}, Landroid/os/ConditionVariable;->close()V

    .line 60
    .line 61
    .line 62
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 63
    .line 64
    new-instance v0, Ll/urh0$h;

    .line 65
    .line 66
    invoke-direct {v0, p0}, Ll/urh0$h;-><init>(Ll/urh0;)V

    .line 67
    .line 68
    .line 69
    iget-object v4, p0, Ll/urh0;->Z:Landroid/os/Handler;

    .line 70
    .line 71
    invoke-virtual {p0, p1, v0, v4}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->x0(Landroid/hardware/camera2/CaptureRequest$Builder;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    iget-object v0, p0, Ll/urh0;->q0:Landroid/os/ConditionVariable;

    .line 76
    .line 77
    const-wide/16 v4, 0x21

    .line 78
    .line 79
    invoke-virtual {v0, v4, v5}, Landroid/os/ConditionVariable;->block(J)Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-nez v0, :cond_3

    .line 84
    .line 85
    new-instance v0, Ljava/lang/StringBuilder;

    .line 86
    .line 87
    const-string v4, "close flash: "

    .line 88
    .line 89
    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 93
    .line 94
    .line 95
    move-result-wide v4

    .line 96
    sub-long/2addr v4, v2

    .line 97
    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    const-string v2, "ms"

    .line 101
    .line 102
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    :cond_3
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 113
    .line 114
    invoke-virtual {p0, v0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->v0(Landroid/hardware/camera2/CaptureRequest$Builder;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 115
    .line 116
    .line 117
    goto :goto_1

    .line 118
    :cond_4
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 119
    .line 120
    invoke-virtual {p0, p1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->v0(Landroid/hardware/camera2/CaptureRequest$Builder;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    :goto_1
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->c()Z

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    if-nez v0, :cond_5

    .line 129
    .line 130
    new-instance v0, Ljava/lang/StringBuilder;

    .line 131
    .line 132
    const-string v2, "[VE_UI_TEST]Failed event: TOGGLE_TORCH. Code: -100. Reason: "

    .line 133
    .line 134
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->a()Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v2

    .line 141
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 152
    .line 153
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->a()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object p1

    .line 157
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 158
    .line 159
    const/16 v1, -0x64

    .line 160
    .line 161
    invoke-interface {v0, v1, v1, p1, p0}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 162
    .line 163
    .line 164
    :cond_5
    return-void
.end method

.method public d()I
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 8
    .line 9
    iget v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 10
    .line 11
    const-string v2, "rollbackMeteringSessionRequest : param is null."

    .line 12
    .line 13
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 14
    .line 15
    const/16 v3, -0x64

    .line 16
    .line 17
    invoke-interface {v0, v1, v3, v2, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    return v3

    .line 21
    :cond_0
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_PRECAPTURE_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 22
    .line 23
    const/4 v2, 0x2

    .line 24
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    invoke-super {p0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->d()I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    return p0
.end method

.method public f0(II)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

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
    invoke-virtual {p0}, Ll/urh0;->q()V

    .line 13
    .line 14
    .line 15
    :try_start_0
    invoke-virtual {p0}, Ll/urh0;->m0()I

    .line 16
    .line 17
    .line 18
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    return p0

    .line 20
    :catch_0
    move-exception p0

    .line 21
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 22
    .line 23
    .line 24
    const/4 p0, -0x1

    .line 25
    return p0
.end method

.method public i0(I)V
    .locals 2

    .line 1
    iput p1, p0, Ll/urh0;->s0:I

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v1, "setSceneMode: "

    .line 6
    .line 7
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "TEImage2Mode"

    .line 18
    .line 19
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    if-nez p1, :cond_0

    .line 23
    .line 24
    invoke-direct {p0}, Ll/urh0;->K1()V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    const/4 v0, 0x1

    .line 29
    if-ne p1, v0, :cond_1

    .line 30
    .line 31
    invoke-direct {p0}, Ll/urh0;->L1()V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    const-string p0, "un support scene"

    .line 36
    .line 37
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public m0()I
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    const-string v0, "TEImage2Mode-startPreview"

    .line 2
    .line 3
    invoke-static {v0}, Ll/dsh0;->a(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-boolean v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->L:Z

    .line 8
    .line 9
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 10
    .line 11
    sget-object v2, Landroid/hardware/camera2/CameraCharacteristics;->LENS_INFO_MINIMUM_FOCUS_DISTANCE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 12
    .line 13
    invoke-virtual {v1, v2}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ljava/lang/Float;

    .line 18
    .line 19
    if-nez v1, :cond_0

    .line 20
    .line 21
    move v1, v0

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-virtual {v1}, Ljava/lang/Float;->intValue()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    const-string v3, "lensInfoMinFocusDistance = "

    .line 30
    .line 31
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    const-string v3, "TEImage2Mode"

    .line 42
    .line 43
    invoke-static {v3, v2}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    const/4 v2, 0x1

    .line 47
    if-eqz v1, :cond_1

    .line 48
    .line 49
    move v1, v2

    .line 50
    goto :goto_1

    .line 51
    :cond_1
    move v1, v0

    .line 52
    :goto_1
    iput-boolean v1, p0, Ll/urh0;->j0:Z

    .line 53
    .line 54
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->g:Lcom/ss/android/ttvecamera/b;

    .line 55
    .line 56
    invoke-virtual {v1}, Lcom/ss/android/ttvecamera/c;->K()Ll/jrh0;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    iget-object v4, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 61
    .line 62
    if-eqz v4, :cond_13

    .line 63
    .line 64
    if-nez v1, :cond_2

    .line 65
    .line 66
    goto/16 :goto_8

    .line 67
    .line 68
    :cond_2
    iget-object v4, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 69
    .line 70
    iget-boolean v4, v4, Lcom/ss/android/ttvecamera/TECameraSettings;->p0:Z

    .line 71
    .line 72
    if-eqz v4, :cond_4

    .line 73
    .line 74
    invoke-virtual {v1}, Ll/jrh0;->f()Ll/irh0;

    .line 75
    .line 76
    .line 77
    move-result-object v4

    .line 78
    if-eqz v4, :cond_3

    .line 79
    .line 80
    invoke-virtual {v1}, Ll/jrh0;->f()Ll/irh0;

    .line 81
    .line 82
    .line 83
    move-result-object v4

    .line 84
    invoke-virtual {v4}, Ll/irh0;->l()V

    .line 85
    .line 86
    .line 87
    const-string v4, "reallocate st..."

    .line 88
    .line 89
    invoke-static {v3, v4}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    goto :goto_2

    .line 93
    :cond_3
    const-string v4, "reallocate st...err"

    .line 94
    .line 95
    invoke-static {v3, v4}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    :cond_4
    :goto_2
    invoke-super {p0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->R()I

    .line 99
    .line 100
    .line 101
    move-result v4

    .line 102
    if-eqz v4, :cond_5

    .line 103
    .line 104
    return v4

    .line 105
    :cond_5
    iget-object v4, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 106
    .line 107
    iget-object v4, v4, Lcom/ss/android/ttvecamera/TECameraSettings;->r:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 108
    .line 109
    iget v5, v4, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 110
    .line 111
    iget v4, v4, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 112
    .line 113
    invoke-virtual {p0, v5, v4}, Ll/urh0;->Z1(II)V

    .line 114
    .line 115
    .line 116
    iget-object v4, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 117
    .line 118
    invoke-virtual {v4, v2}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 119
    .line 120
    .line 121
    move-result-object v4

    .line 122
    iput-object v4, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 123
    .line 124
    iget-object v5, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->t:Landroid/graphics/Rect;

    .line 125
    .line 126
    if-eqz v5, :cond_6

    .line 127
    .line 128
    sget-object v6, Landroid/hardware/camera2/CaptureRequest;->SCALER_CROP_REGION:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 129
    .line 130
    invoke-virtual {v4, v6, v5}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 131
    .line 132
    .line 133
    :cond_6
    new-instance v4, Ljava/util/ArrayList;

    .line 134
    .line 135
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 136
    .line 137
    .line 138
    invoke-virtual {v1}, Ll/jrh0;->f()Ll/irh0;

    .line 139
    .line 140
    .line 141
    move-result-object v5

    .line 142
    invoke-virtual {v5}, Ll/irh0;->g()I

    .line 143
    .line 144
    .line 145
    move-result v5

    .line 146
    const/16 v6, 0x8

    .line 147
    .line 148
    if-ne v5, v6, :cond_7

    .line 149
    .line 150
    invoke-virtual {v1}, Ll/jrh0;->e()[Landroid/view/Surface;

    .line 151
    .line 152
    .line 153
    move-result-object v1

    .line 154
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 155
    .line 156
    .line 157
    move-result-object v1

    .line 158
    invoke-interface {v4, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 159
    .line 160
    .line 161
    goto :goto_3

    .line 162
    :cond_7
    invoke-virtual {v1}, Ll/jrh0;->d()Landroid/view/Surface;

    .line 163
    .line 164
    .line 165
    move-result-object v1

    .line 166
    invoke-interface {v4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 167
    .line 168
    .line 169
    :goto_3
    iget-object v1, p0, Ll/urh0;->b0:Landroid/media/ImageReader;

    .line 170
    .line 171
    if-eqz v1, :cond_8

    .line 172
    .line 173
    invoke-virtual {v1}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    .line 174
    .line 175
    .line 176
    move-result-object v1

    .line 177
    invoke-interface {v4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 178
    .line 179
    .line 180
    :cond_8
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 181
    .line 182
    .line 183
    move-result-object v1

    .line 184
    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 185
    .line 186
    .line 187
    move-result v5

    .line 188
    if-eqz v5, :cond_9

    .line 189
    .line 190
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 191
    .line 192
    .line 193
    move-result-object v5

    .line 194
    check-cast v5, Landroid/view/Surface;

    .line 195
    .line 196
    iget-object v6, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 197
    .line 198
    invoke-virtual {v6, v5}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 199
    .line 200
    .line 201
    goto :goto_4

    .line 202
    :cond_9
    iget-object v1, p0, Ll/urh0;->a0:Landroid/media/ImageReader;

    .line 203
    .line 204
    if-eqz v1, :cond_a

    .line 205
    .line 206
    invoke-virtual {v1}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    .line 207
    .line 208
    .line 209
    move-result-object v1

    .line 210
    invoke-interface {v4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 211
    .line 212
    .line 213
    :cond_a
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 214
    .line 215
    sget-object v5, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 216
    .line 217
    const/4 v6, 0x4

    .line 218
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 219
    .line 220
    .line 221
    move-result-object v6

    .line 222
    invoke-virtual {v1, v5, v6}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 223
    .line 224
    .line 225
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 226
    .line 227
    iget-boolean v5, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->Z:Z

    .line 228
    .line 229
    if-eqz v5, :cond_f

    .line 230
    .line 231
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 232
    .line 233
    const/16 v6, 0x1c

    .line 234
    .line 235
    if-lt v5, v6, :cond_e

    .line 236
    .line 237
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 238
    .line 239
    .line 240
    move-result-wide v5

    .line 241
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 242
    .line 243
    if-eqz v1, :cond_b

    .line 244
    .line 245
    iget-object v7, p0, Ll/urh0;->g0:Ljava/util/List;

    .line 246
    .line 247
    if-nez v7, :cond_b

    .line 248
    .line 249
    invoke-static {v1}, Ll/prh0;->a(Landroid/hardware/camera2/CameraCharacteristics;)Ljava/util/List;

    .line 250
    .line 251
    .line 252
    move-result-object v1

    .line 253
    iput-object v1, p0, Ll/urh0;->g0:Ljava/util/List;

    .line 254
    .line 255
    :cond_b
    iget-object v1, p0, Ll/urh0;->g0:Ljava/util/List;

    .line 256
    .line 257
    if-eqz v1, :cond_d

    .line 258
    .line 259
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 260
    .line 261
    .line 262
    move-result-object v1

    .line 263
    :cond_c
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 264
    .line 265
    .line 266
    move-result v7

    .line 267
    if-eqz v7, :cond_d

    .line 268
    .line 269
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 270
    .line 271
    .line 272
    move-result-object v7

    .line 273
    check-cast v7, Landroid/hardware/camera2/CaptureRequest$Key;

    .line 274
    .line 275
    sget-object v8, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_TARGET_FPS_RANGE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 276
    .line 277
    invoke-virtual {v8}, Landroid/hardware/camera2/CaptureRequest$Key;->getName()Ljava/lang/String;

    .line 278
    .line 279
    .line 280
    move-result-object v8

    .line 281
    invoke-virtual {v7}, Landroid/hardware/camera2/CaptureRequest$Key;->getName()Ljava/lang/String;

    .line 282
    .line 283
    .line 284
    move-result-object v7

    .line 285
    invoke-virtual {v8, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 286
    .line 287
    .line 288
    move-result v7

    .line 289
    if-eqz v7, :cond_c

    .line 290
    .line 291
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 292
    .line 293
    iput-boolean v0, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->Z:Z

    .line 294
    .line 295
    goto :goto_5

    .line 296
    :cond_d
    move v2, v0

    .line 297
    :goto_5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 298
    .line 299
    const-string v7, "check aeTargetFpsRange is session key: "

    .line 300
    .line 301
    invoke-direct {v1, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 302
    .line 303
    .line 304
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 305
    .line 306
    .line 307
    const-string v2, ", consume: "

    .line 308
    .line 309
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 310
    .line 311
    .line 312
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 313
    .line 314
    .line 315
    move-result-wide v7

    .line 316
    sub-long/2addr v7, v5

    .line 317
    invoke-virtual {v1, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 318
    .line 319
    .line 320
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 321
    .line 322
    .line 323
    move-result-object v1

    .line 324
    invoke-static {v3, v1}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 325
    .line 326
    .line 327
    goto :goto_6

    .line 328
    :cond_e
    iput-boolean v0, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->Z:Z

    .line 329
    .line 330
    :cond_f
    :goto_6
    const-wide/16 v1, 0x0

    .line 331
    .line 332
    iput-wide v1, p0, Ll/urh0;->u0:J

    .line 333
    .line 334
    iput v0, p0, Ll/urh0;->t0:I

    .line 335
    .line 336
    iput v0, p0, Ll/urh0;->n0:I

    .line 337
    .line 338
    const/4 v1, -0x1

    .line 339
    iput v1, p0, Ll/urh0;->c0:I

    .line 340
    .line 341
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 342
    .line 343
    iget v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->X:I

    .line 344
    .line 345
    iput v1, p0, Ll/urh0;->o0:I

    .line 346
    .line 347
    if-lez v1, :cond_10

    .line 348
    .line 349
    new-instance v1, Ljava/lang/StringBuilder;

    .line 350
    .line 351
    const-string v2, "release camera metadata threshold: "

    .line 352
    .line 353
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 354
    .line 355
    .line 356
    iget v2, p0, Ll/urh0;->o0:I

    .line 357
    .line 358
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 359
    .line 360
    .line 361
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 362
    .line 363
    .line 364
    move-result-object v1

    .line 365
    invoke-static {v3, v1}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 366
    .line 367
    .line 368
    :cond_10
    iput-boolean v0, p0, Ll/urh0;->m0:Z

    .line 369
    .line 370
    iput v0, p0, Ll/urh0;->h0:I

    .line 371
    .line 372
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 373
    .line 374
    .line 375
    move-result-wide v1

    .line 376
    iput-wide v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->H:J

    .line 377
    .line 378
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 379
    .line 380
    iget-boolean v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->k:Z

    .line 381
    .line 382
    if-eqz v1, :cond_11

    .line 383
    .line 384
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->D()Landroid/os/Handler;

    .line 385
    .line 386
    .line 387
    move-result-object v1

    .line 388
    goto :goto_7

    .line 389
    :cond_11
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->k:Landroid/os/Handler;

    .line 390
    .line 391
    :goto_7
    const/4 v2, 0x0

    .line 392
    iput-object v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->d:Landroid/hardware/camera2/CameraCaptureSession;

    .line 393
    .line 394
    iget-object v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->V:Landroid/hardware/camera2/CameraCaptureSession$StateCallback;

    .line 395
    .line 396
    invoke-virtual {p0, v4, v2, v1}, Ll/urh0;->t(Ljava/util/List;Landroid/hardware/camera2/CameraCaptureSession$StateCallback;Landroid/os/Handler;)V

    .line 397
    .line 398
    .line 399
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->d:Landroid/hardware/camera2/CameraCaptureSession;

    .line 400
    .line 401
    if-nez v1, :cond_12

    .line 402
    .line 403
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->z0()V

    .line 404
    .line 405
    .line 406
    :cond_12
    invoke-static {}, Ll/dsh0;->b()V

    .line 407
    .line 408
    .line 409
    return v0

    .line 410
    :cond_13
    :goto_8
    const-string p0, "CameraDevice or ProviderManager is null!"

    .line 411
    .line 412
    invoke-static {v3, p0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 413
    .line 414
    .line 415
    const/16 p0, -0x64

    .line 416
    .line 417
    return p0
.end method

.method public o(Ll/hj3;ILcom/ss/android/ttvecamera/TECameraSettings$c;)V
    .locals 7

    .line 1
    iget p3, p1, Ll/hj3;->c:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eqz p3, :cond_0

    .line 5
    .line 6
    iget-object v1, p0, Ll/urh0;->a0:Landroid/media/ImageReader;

    .line 7
    .line 8
    invoke-virtual {v1}, Landroid/media/ImageReader;->getWidth()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-ne p3, v1, :cond_1

    .line 13
    .line 14
    :cond_0
    iget p3, p1, Ll/hj3;->d:I

    .line 15
    .line 16
    if-eqz p3, :cond_2

    .line 17
    .line 18
    iget-object v1, p0, Ll/urh0;->a0:Landroid/media/ImageReader;

    .line 19
    .line 20
    invoke-virtual {v1}, Landroid/media/ImageReader;->getHeight()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eq p3, v1, :cond_2

    .line 25
    .line 26
    :cond_1
    const-string p3, "TEImage2Mode"

    .line 27
    .line 28
    const-string v1, "restart preview for burst capture"

    .line 29
    .line 30
    invoke-static {p3, v1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iget-object p3, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 34
    .line 35
    iput-boolean v0, p3, Lcom/ss/android/ttvecamera/TECameraSettings;->k:Z

    .line 36
    .line 37
    iget p3, p1, Ll/hj3;->c:I

    .line 38
    .line 39
    iget v1, p1, Ll/hj3;->d:I

    .line 40
    .line 41
    invoke-virtual {p0, p3, v1}, Ll/urh0;->f0(II)I

    .line 42
    .line 43
    .line 44
    :cond_2
    iput p2, p0, Ll/urh0;->i0:I

    .line 45
    .line 46
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 47
    .line 48
    .line 49
    move-result-wide p2

    .line 50
    iput-wide p2, p0, Ll/urh0;->p0:J

    .line 51
    .line 52
    iget-object p2, p0, Ll/urh0;->a0:Landroid/media/ImageReader;

    .line 53
    .line 54
    invoke-virtual {p2}, Landroid/media/ImageReader;->getWidth()I

    .line 55
    .line 56
    .line 57
    move-result p2

    .line 58
    iget-object p3, p0, Ll/urh0;->a0:Landroid/media/ImageReader;

    .line 59
    .line 60
    invoke-virtual {p3}, Landroid/media/ImageReader;->getHeight()I

    .line 61
    .line 62
    .line 63
    move-result p3

    .line 64
    iget-object v1, p1, Ll/hj3;->b:Ljava/util/List;

    .line 65
    .line 66
    new-instance v2, Ll/urh0$b;

    .line 67
    .line 68
    invoke-direct {v2, p0, p2, p3}, Ll/urh0$b;-><init>(Ll/urh0;II)V

    .line 69
    .line 70
    .line 71
    iget p2, p1, Ll/hj3;->a:I

    .line 72
    .line 73
    const/4 p3, 0x0

    .line 74
    const/4 v3, 0x2

    .line 75
    if-ne p2, v0, :cond_4

    .line 76
    .line 77
    new-instance p1, Ljava/util/ArrayList;

    .line 78
    .line 79
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 80
    .line 81
    .line 82
    move-result p2

    .line 83
    invoke-direct {p1, p2}, Ljava/util/ArrayList;-><init>(I)V

    .line 84
    .line 85
    .line 86
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 87
    .line 88
    .line 89
    move-result-object p2

    .line 90
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    if-eqz v0, :cond_3

    .line 95
    .line 96
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    check-cast v0, Ljava/lang/Integer;

    .line 101
    .line 102
    invoke-virtual {p0, v3}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->s(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    invoke-direct {p0, v1}, Ll/urh0;->a2(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 107
    .line 108
    .line 109
    sget-object v4, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_EXPOSURE_COMPENSATION:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 110
    .line 111
    invoke-virtual {v1, v4, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 112
    .line 113
    .line 114
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_LOCK:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 115
    .line 116
    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 117
    .line 118
    invoke-virtual {v1, v0, v4}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 119
    .line 120
    .line 121
    iget-object v0, p0, Ll/urh0;->a0:Landroid/media/ImageReader;

    .line 122
    .line 123
    invoke-virtual {v0}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    invoke-virtual {v1, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 128
    .line 129
    .line 130
    invoke-virtual {v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 135
    .line 136
    .line 137
    goto :goto_0

    .line 138
    :cond_3
    invoke-virtual {p0, p1, v2, p3}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->n(Ljava/util/List;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 139
    .line 140
    .line 141
    return-void

    .line 142
    :cond_4
    if-nez p2, :cond_8

    .line 143
    .line 144
    iget-boolean p2, p1, Ll/hj3;->f:Z

    .line 145
    .line 146
    if-eqz p2, :cond_5

    .line 147
    .line 148
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->q0()Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 149
    .line 150
    .line 151
    :cond_5
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 152
    .line 153
    .line 154
    move-result p2

    .line 155
    const/4 v0, 0x0

    .line 156
    :goto_1
    if-ge v0, p2, :cond_7

    .line 157
    .line 158
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 159
    .line 160
    .line 161
    move-result-object v4

    .line 162
    check-cast v4, Ljava/lang/Integer;

    .line 163
    .line 164
    invoke-virtual {p0, v3}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->s(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 165
    .line 166
    .line 167
    move-result-object v5

    .line 168
    invoke-direct {p0, v5}, Ll/urh0;->a2(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 169
    .line 170
    .line 171
    sget-object v6, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_EXPOSURE_COMPENSATION:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 172
    .line 173
    invoke-virtual {v5, v6, v4}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 174
    .line 175
    .line 176
    sget-object v4, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_LOCK:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 177
    .line 178
    sget-object v6, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 179
    .line 180
    invoke-virtual {v5, v4, v6}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 181
    .line 182
    .line 183
    iget-object v4, p0, Ll/urh0;->a0:Landroid/media/ImageReader;

    .line 184
    .line 185
    invoke-virtual {v4}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    .line 186
    .line 187
    .line 188
    move-result-object v4

    .line 189
    invoke-virtual {v5, v4}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 190
    .line 191
    .line 192
    invoke-virtual {v5}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    .line 193
    .line 194
    .line 195
    move-result-object v4

    .line 196
    invoke-virtual {p0, v4, v2, p3}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->m(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 197
    .line 198
    .line 199
    if-lez v0, :cond_6

    .line 200
    .line 201
    add-int/lit8 v4, p2, -0x1

    .line 202
    .line 203
    if-ge v0, v4, :cond_6

    .line 204
    .line 205
    iget v4, p1, Ll/hj3;->e:I

    .line 206
    .line 207
    if-lez v4, :cond_6

    .line 208
    .line 209
    int-to-long v4, v4

    .line 210
    :try_start_0
    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 211
    .line 212
    .line 213
    goto :goto_2

    .line 214
    :catch_0
    move-exception v4

    .line 215
    invoke-virtual {v4}, Ljava/lang/Throwable;->printStackTrace()V

    .line 216
    .line 217
    .line 218
    :cond_6
    :goto_2
    add-int/lit8 v0, v0, 0x1

    .line 219
    .line 220
    goto :goto_1

    .line 221
    :cond_7
    iget-boolean p1, p1, Ll/hj3;->f:Z

    .line 222
    .line 223
    if-eqz p1, :cond_8

    .line 224
    .line 225
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 226
    .line 227
    invoke-virtual {p0, p1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->v0(Landroid/hardware/camera2/CaptureRequest$Builder;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 228
    .line 229
    .line 230
    :cond_8
    return-void
.end method

.method public q()V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/urh0;->h0:I

    .line 3
    .line 4
    iget-object v1, p0, Ll/urh0;->Y:Ll/urh0$i;

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->D:Landroid/os/Handler;

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    const-wide/16 v3, 0x0

    .line 18
    .line 19
    iput-wide v3, p0, Ll/urh0;->X:J

    .line 20
    .line 21
    iput-boolean v0, p0, Ll/urh0;->l0:Z

    .line 22
    .line 23
    iput v0, p0, Ll/urh0;->n0:I

    .line 24
    .line 25
    const/4 v1, -0x1

    .line 26
    iput v1, p0, Ll/urh0;->r0:I

    .line 27
    .line 28
    iput-object v2, p0, Ll/urh0;->e0:Landroid/hardware/camera2/TotalCaptureResult;

    .line 29
    .line 30
    iput-boolean v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->L:Z

    .line 31
    .line 32
    iget-object v0, p0, Ll/urh0;->a0:Landroid/media/ImageReader;

    .line 33
    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    invoke-virtual {v0}, Landroid/media/ImageReader;->close()V

    .line 37
    .line 38
    .line 39
    iput-object v2, p0, Ll/urh0;->a0:Landroid/media/ImageReader;

    .line 40
    .line 41
    :cond_1
    iget-object v0, p0, Ll/urh0;->b0:Landroid/media/ImageReader;

    .line 42
    .line 43
    if-eqz v0, :cond_2

    .line 44
    .line 45
    invoke-virtual {v0}, Landroid/media/ImageReader;->close()V

    .line 46
    .line 47
    .line 48
    iput-object v2, p0, Ll/urh0;->b0:Landroid/media/ImageReader;

    .line 49
    .line 50
    :cond_2
    iput-object v2, p0, Ll/urh0;->d0:[Landroid/hardware/camera2/TotalCaptureResult;

    .line 51
    .line 52
    iput-object v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 53
    .line 54
    invoke-super {p0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->q()V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public r(Landroid/util/Range;)Landroid/util/Range;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;)",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 2
    .line 3
    if-eqz v0, :cond_c

    .line 4
    .line 5
    if-eqz p1, :cond_c

    .line 6
    .line 7
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 8
    .line 9
    iget-boolean v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->w0:Z

    .line 10
    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    goto/16 :goto_6

    .line 14
    .line 15
    :cond_0
    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_AE_AVAILABLE_TARGET_FPS_RANGES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, [Landroid/util/Range;

    .line 22
    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    return-object p1

    .line 26
    :cond_1
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->w:Lcom/ss/android/ttvecamera/c$b;

    .line 27
    .line 28
    const/4 v2, 0x0

    .line 29
    const/4 v3, 0x0

    .line 30
    const/4 v4, 0x1

    .line 31
    if-eqz v1, :cond_3

    .line 32
    .line 33
    new-instance v1, Ljava/util/ArrayList;

    .line 34
    .line 35
    array-length v5, v0

    .line 36
    invoke-direct {v1, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 37
    .line 38
    .line 39
    array-length v5, v0

    .line 40
    move v6, v3

    .line 41
    :goto_0
    if-ge v6, v5, :cond_2

    .line 42
    .line 43
    aget-object v7, v0, v6

    .line 44
    .line 45
    invoke-virtual {v7}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    .line 46
    .line 47
    .line 48
    move-result-object v8

    .line 49
    check-cast v8, Ljava/lang/Integer;

    .line 50
    .line 51
    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    .line 52
    .line 53
    .line 54
    move-result v8

    .line 55
    invoke-virtual {v7}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    .line 56
    .line 57
    .line 58
    move-result-object v7

    .line 59
    check-cast v7, Ljava/lang/Integer;

    .line 60
    .line 61
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    .line 62
    .line 63
    .line 64
    move-result v7

    .line 65
    filled-new-array {v8, v7}, [I

    .line 66
    .line 67
    .line 68
    move-result-object v7

    .line 69
    invoke-interface {v1, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    add-int/lit8 v6, v6, 0x1

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_2
    iget-object v5, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->w:Lcom/ss/android/ttvecamera/c$b;

    .line 76
    .line 77
    invoke-interface {v5, v1}, Lcom/ss/android/ttvecamera/c$b;->a(Ljava/util/List;)[I

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    if-eqz v1, :cond_3

    .line 82
    .line 83
    new-instance v5, Landroid/util/Range;

    .line 84
    .line 85
    aget v6, v1, v3

    .line 86
    .line 87
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 88
    .line 89
    .line 90
    move-result-object v6

    .line 91
    aget v1, v1, v4

    .line 92
    .line 93
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-direct {v5, v6, v1}, Landroid/util/Range;-><init>(Ljava/lang/Comparable;Ljava/lang/Comparable;)V

    .line 98
    .line 99
    .line 100
    goto :goto_1

    .line 101
    :cond_3
    move-object v5, v2

    .line 102
    :goto_1
    const-string v1, "TEImage2Mode"

    .line 103
    .line 104
    if-eqz v5, :cond_4

    .line 105
    .line 106
    new-instance p0, Ljava/lang/StringBuilder;

    .line 107
    .line 108
    const-string p1, "select fps from user callback: "

    .line 109
    .line 110
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    invoke-static {v1, p0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    return-object v5

    .line 124
    :cond_4
    iget-object v6, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 125
    .line 126
    iget v6, v6, Lcom/ss/android/ttvecamera/TECameraSettings;->O:I

    .line 127
    .line 128
    const/4 v7, 0x4

    .line 129
    if-ne v6, v7, :cond_6

    .line 130
    .line 131
    new-instance v6, Landroid/util/Range;

    .line 132
    .line 133
    iget-object v7, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 134
    .line 135
    iget-object v7, v7, Lcom/ss/android/ttvecamera/TECameraSettings;->c:Lcom/ss/android/ttvecamera/TEFrameRateRange;

    .line 136
    .line 137
    iget v7, v7, Lcom/ss/android/ttvecamera/TEFrameRateRange;->min:I

    .line 138
    .line 139
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 140
    .line 141
    .line 142
    move-result-object v7

    .line 143
    iget-object v8, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 144
    .line 145
    iget-object v8, v8, Lcom/ss/android/ttvecamera/TECameraSettings;->c:Lcom/ss/android/ttvecamera/TEFrameRateRange;

    .line 146
    .line 147
    iget v8, v8, Lcom/ss/android/ttvecamera/TEFrameRateRange;->max:I

    .line 148
    .line 149
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 150
    .line 151
    .line 152
    move-result-object v8

    .line 153
    invoke-direct {v6, v7, v8}, Landroid/util/Range;-><init>(Ljava/lang/Comparable;Ljava/lang/Comparable;)V

    .line 154
    .line 155
    .line 156
    array-length v7, v0

    .line 157
    :goto_2
    if-ge v3, v7, :cond_6

    .line 158
    .line 159
    aget-object v8, v0, v3

    .line 160
    .line 161
    invoke-virtual {v6, v8}, Landroid/util/Range;->equals(Ljava/lang/Object;)Z

    .line 162
    .line 163
    .line 164
    move-result v8

    .line 165
    if-eqz v8, :cond_5

    .line 166
    .line 167
    move-object v5, v6

    .line 168
    goto :goto_3

    .line 169
    :cond_5
    add-int/lit8 v3, v3, 0x1

    .line 170
    .line 171
    goto :goto_2

    .line 172
    :cond_6
    :goto_3
    if-eqz v5, :cond_7

    .line 173
    .line 174
    new-instance p0, Ljava/lang/StringBuilder;

    .line 175
    .line 176
    const-string p1, "select fps from user direct set: "

    .line 177
    .line 178
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 179
    .line 180
    .line 181
    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 182
    .line 183
    .line 184
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object p0

    .line 188
    invoke-static {v1, p0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 189
    .line 190
    .line 191
    return-object v5

    .line 192
    :cond_7
    iget v3, p0, Ll/urh0;->s0:I

    .line 193
    .line 194
    if-nez v3, :cond_8

    .line 195
    .line 196
    invoke-direct {p0, v0}, Ll/urh0;->R1([Landroid/util/Range;)Landroid/util/Range;

    .line 197
    .line 198
    .line 199
    move-result-object v2

    .line 200
    goto :goto_4

    .line 201
    :cond_8
    if-ne v3, v4, :cond_9

    .line 202
    .line 203
    invoke-direct {p0, v0}, Ll/urh0;->S1([Landroid/util/Range;)Landroid/util/Range;

    .line 204
    .line 205
    .line 206
    move-result-object v2

    .line 207
    :cond_9
    :goto_4
    if-eqz v2, :cond_a

    .line 208
    .line 209
    move-object v5, v2

    .line 210
    :cond_a
    if-nez v5, :cond_b

    .line 211
    .line 212
    goto :goto_5

    .line 213
    :cond_b
    move-object p1, v5

    .line 214
    :goto_5
    new-instance p0, Ljava/lang/StringBuilder;

    .line 215
    .line 216
    const-string v0, "select fps: "

    .line 217
    .line 218
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 219
    .line 220
    .line 221
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 222
    .line 223
    .line 224
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object p0

    .line 228
    invoke-static {v1, p0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 229
    .line 230
    .line 231
    :cond_c
    :goto_6
    return-object p1
.end method

.method public r0(IILcom/ss/android/ttvecamera/TECameraSettings$l;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 2
    .line 3
    iget p1, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 4
    .line 5
    invoke-virtual {p0, p3, p1}, Ll/urh0;->s0(Lcom/ss/android/ttvecamera/TECameraSettings$l;I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public s0(Lcom/ss/android/ttvecamera/TECameraSettings$l;I)V
    .locals 13

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    const/4 v2, 0x1

    .line 7
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object v3

    .line 11
    invoke-super {p0, p1, p2}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->s0(Lcom/ss/android/ttvecamera/TECameraSettings$l;I)V

    .line 12
    .line 13
    .line 14
    iput p2, p0, Ll/urh0;->i0:I

    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    iput-boolean p1, p0, Ll/urh0;->l0:Z

    .line 22
    .line 23
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 24
    .line 25
    .line 26
    move-result-wide v4

    .line 27
    iput-wide v4, p0, Ll/urh0;->p0:J

    .line 28
    .line 29
    iget-object p1, p0, Ll/urh0;->b0:Landroid/media/ImageReader;

    .line 30
    .line 31
    const-string v4, "TEImage2Mode"

    .line 32
    .line 33
    if-eqz p1, :cond_0

    .line 34
    .line 35
    iget-boolean p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->L:Z

    .line 36
    .line 37
    if-nez p1, :cond_0

    .line 38
    .line 39
    iput v2, p0, Ll/urh0;->h0:I

    .line 40
    .line 41
    iput-boolean v2, p0, Ll/urh0;->f0:Z

    .line 42
    .line 43
    const-string p0, "takePicture...use zsl buffer"

    .line 44
    .line 45
    invoke-static {v4, p0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    const-string v5, "takePicture...flash strategy: "

    .line 52
    .line 53
    invoke-direct {p1, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    iget-object v5, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 57
    .line 58
    iget v5, v5, Lcom/ss/android/ttvecamera/TECameraSettings;->f0:I

    .line 59
    .line 60
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-static {v4, p1}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    iget-boolean p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->L:Z

    .line 71
    .line 72
    if-eqz p1, :cond_1

    .line 73
    .line 74
    const-wide/16 v5, 0x640

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_1
    const-wide/16 v5, 0x320

    .line 78
    .line 79
    :goto_0
    iget-object v7, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 80
    .line 81
    iget v8, v7, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 82
    .line 83
    if-nez v8, :cond_10

    .line 84
    .line 85
    iget v7, v7, Lcom/ss/android/ttvecamera/TECameraSettings;->f0:I

    .line 86
    .line 87
    const/4 v8, 0x3

    .line 88
    const/4 v9, 0x0

    .line 89
    const-string v10, "CAPTURE_REQUEST_TAG_FOR_SHOT"

    .line 90
    .line 91
    const/16 v11, 0x3e9

    .line 92
    .line 93
    const/16 v12, 0x3eb

    .line 94
    .line 95
    if-ne v7, v8, :cond_4

    .line 96
    .line 97
    if-eqz p1, :cond_3

    .line 98
    .line 99
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 100
    .line 101
    .line 102
    move-result-wide v7

    .line 103
    iput-wide v7, p0, Ll/urh0;->X:J

    .line 104
    .line 105
    iput v0, p0, Ll/urh0;->h0:I

    .line 106
    .line 107
    iget-object p1, p0, Ll/urh0;->Y:Ll/urh0$i;

    .line 108
    .line 109
    invoke-virtual {p1, v11, v5, v6}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 110
    .line 111
    .line 112
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 113
    .line 114
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 115
    .line 116
    invoke-virtual {p1, v0, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 117
    .line 118
    .line 119
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 120
    .line 121
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->FLASH_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 122
    .line 123
    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 124
    .line 125
    .line 126
    iget-boolean p1, p0, Ll/urh0;->j0:Z

    .line 127
    .line 128
    if-eqz p1, :cond_2

    .line 129
    .line 130
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 131
    .line 132
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 133
    .line 134
    invoke-virtual {p1, v0, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 135
    .line 136
    .line 137
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 138
    .line 139
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 140
    .line 141
    invoke-virtual {p1, v0, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 142
    .line 143
    .line 144
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 145
    .line 146
    invoke-virtual {p1, v10}, Landroid/hardware/camera2/CaptureRequest$Builder;->setTag(Ljava/lang/Object;)V

    .line 147
    .line 148
    .line 149
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 150
    .line 151
    invoke-virtual {p0, p1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->k(Landroid/hardware/camera2/CaptureRequest$Builder;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 152
    .line 153
    .line 154
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 155
    .line 156
    invoke-virtual {p1, v9}, Landroid/hardware/camera2/CaptureRequest$Builder;->setTag(Ljava/lang/Object;)V

    .line 157
    .line 158
    .line 159
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 160
    .line 161
    invoke-virtual {p1, v0, p2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 162
    .line 163
    .line 164
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 165
    .line 166
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_PRECAPTURE_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 167
    .line 168
    invoke-virtual {p1, v0, p2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 169
    .line 170
    .line 171
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 172
    .line 173
    invoke-virtual {p0, p1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->v0(Landroid/hardware/camera2/CaptureRequest$Builder;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 174
    .line 175
    .line 176
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 177
    .line 178
    invoke-virtual {p0, p1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->v0(Landroid/hardware/camera2/CaptureRequest$Builder;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 179
    .line 180
    .line 181
    move-result-object p1

    .line 182
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->c()Z

    .line 183
    .line 184
    .line 185
    move-result p2

    .line 186
    if-nez p2, :cond_c

    .line 187
    .line 188
    iget-object p0, p0, Ll/urh0;->Y:Ll/urh0$i;

    .line 189
    .line 190
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->b()Ljava/lang/Exception;

    .line 191
    .line 192
    .line 193
    move-result-object p1

    .line 194
    invoke-virtual {p0, v12, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 195
    .line 196
    .line 197
    move-result-object p1

    .line 198
    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 199
    .line 200
    .line 201
    return-void

    .line 202
    :cond_2
    iget-object p0, p0, Ll/urh0;->Y:Ll/urh0$i;

    .line 203
    .line 204
    const/16 p1, 0x3e8

    .line 205
    .line 206
    const-wide/16 v0, 0x12c

    .line 207
    .line 208
    invoke-virtual {p0, p1, v0, v1}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 209
    .line 210
    .line 211
    return-void

    .line 212
    :cond_3
    invoke-direct {p0}, Ll/urh0;->Q1()V

    .line 213
    .line 214
    .line 215
    return-void

    .line 216
    :cond_4
    const-string v8, "af converge, do capture..."

    .line 217
    .line 218
    if-ne v7, v0, :cond_8

    .line 219
    .line 220
    if-nez p1, :cond_6

    .line 221
    .line 222
    iget-boolean p1, p0, Ll/urh0;->m0:Z

    .line 223
    .line 224
    if-nez p1, :cond_5

    .line 225
    .line 226
    goto :goto_1

    .line 227
    :cond_5
    invoke-static {v4, v8}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 228
    .line 229
    .line 230
    invoke-direct {p0}, Ll/urh0;->Q1()V

    .line 231
    .line 232
    .line 233
    return-void

    .line 234
    :cond_6
    :goto_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 235
    .line 236
    .line 237
    move-result-wide v1

    .line 238
    iput-wide v1, p0, Ll/urh0;->X:J

    .line 239
    .line 240
    iput v0, p0, Ll/urh0;->h0:I

    .line 241
    .line 242
    iget-object p1, p0, Ll/urh0;->Y:Ll/urh0$i;

    .line 243
    .line 244
    invoke-virtual {p1, v11, v5, v6}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 245
    .line 246
    .line 247
    iget-boolean p1, p0, Ll/urh0;->j0:Z

    .line 248
    .line 249
    if-eqz p1, :cond_7

    .line 250
    .line 251
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 252
    .line 253
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 254
    .line 255
    invoke-virtual {p1, v0, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 256
    .line 257
    .line 258
    :cond_7
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 259
    .line 260
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_PRECAPTURE_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 261
    .line 262
    invoke-virtual {p1, v0, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 263
    .line 264
    .line 265
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 266
    .line 267
    invoke-virtual {p1, v10}, Landroid/hardware/camera2/CaptureRequest$Builder;->setTag(Ljava/lang/Object;)V

    .line 268
    .line 269
    .line 270
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 271
    .line 272
    invoke-virtual {p0, p1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->k(Landroid/hardware/camera2/CaptureRequest$Builder;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 273
    .line 274
    .line 275
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 276
    .line 277
    invoke-virtual {p1, v9}, Landroid/hardware/camera2/CaptureRequest$Builder;->setTag(Ljava/lang/Object;)V

    .line 278
    .line 279
    .line 280
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 281
    .line 282
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 283
    .line 284
    invoke-virtual {p1, v1, p2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 285
    .line 286
    .line 287
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 288
    .line 289
    invoke-virtual {p1, v0, p2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 290
    .line 291
    .line 292
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 293
    .line 294
    invoke-virtual {p0, p1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->v0(Landroid/hardware/camera2/CaptureRequest$Builder;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 295
    .line 296
    .line 297
    move-result-object p1

    .line 298
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->c()Z

    .line 299
    .line 300
    .line 301
    move-result p2

    .line 302
    if-nez p2, :cond_c

    .line 303
    .line 304
    iget-object p0, p0, Ll/urh0;->Y:Ll/urh0$i;

    .line 305
    .line 306
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->b()Ljava/lang/Exception;

    .line 307
    .line 308
    .line 309
    move-result-object p1

    .line 310
    invoke-virtual {p0, v12, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 311
    .line 312
    .line 313
    move-result-object p1

    .line 314
    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 315
    .line 316
    .line 317
    return-void

    .line 318
    :cond_8
    if-nez v7, :cond_d

    .line 319
    .line 320
    if-nez p1, :cond_a

    .line 321
    .line 322
    iget-boolean p1, p0, Ll/urh0;->m0:Z

    .line 323
    .line 324
    if-nez p1, :cond_9

    .line 325
    .line 326
    goto :goto_2

    .line 327
    :cond_9
    invoke-static {v4, v8}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 328
    .line 329
    .line 330
    invoke-direct {p0}, Ll/urh0;->O1()V

    .line 331
    .line 332
    .line 333
    return-void

    .line 334
    :cond_a
    :goto_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 335
    .line 336
    .line 337
    move-result-wide p1

    .line 338
    iput-wide p1, p0, Ll/urh0;->X:J

    .line 339
    .line 340
    iput v2, p0, Ll/urh0;->h0:I

    .line 341
    .line 342
    iget-object p1, p0, Ll/urh0;->Y:Ll/urh0$i;

    .line 343
    .line 344
    const/16 p2, 0x3ef

    .line 345
    .line 346
    invoke-virtual {p1, p2, v5, v6}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 347
    .line 348
    .line 349
    iget-boolean p1, p0, Ll/urh0;->j0:Z

    .line 350
    .line 351
    if-eqz p1, :cond_b

    .line 352
    .line 353
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 354
    .line 355
    sget-object p2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 356
    .line 357
    invoke-virtual {p1, p2, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 358
    .line 359
    .line 360
    :cond_b
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 361
    .line 362
    sget-object p2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_PRECAPTURE_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 363
    .line 364
    invoke-virtual {p1, p2, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 365
    .line 366
    .line 367
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 368
    .line 369
    iget-object p2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->W:Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    .line 370
    .line 371
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->k:Landroid/os/Handler;

    .line 372
    .line 373
    invoke-virtual {p0, p1, p2, v0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->l(Landroid/hardware/camera2/CaptureRequest$Builder;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 374
    .line 375
    .line 376
    move-result-object p1

    .line 377
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->c()Z

    .line 378
    .line 379
    .line 380
    move-result p2

    .line 381
    if-nez p2, :cond_c

    .line 382
    .line 383
    iget-object p0, p0, Ll/urh0;->Y:Ll/urh0$i;

    .line 384
    .line 385
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->b()Ljava/lang/Exception;

    .line 386
    .line 387
    .line 388
    move-result-object p1

    .line 389
    invoke-virtual {p0, v12, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 390
    .line 391
    .line 392
    move-result-object p1

    .line 393
    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 394
    .line 395
    .line 396
    :cond_c
    return-void

    .line 397
    :cond_d
    if-ne v7, v2, :cond_f

    .line 398
    .line 399
    iput v2, p0, Ll/urh0;->h0:I

    .line 400
    .line 401
    if-eqz p1, :cond_e

    .line 402
    .line 403
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 404
    .line 405
    sget-object p2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 406
    .line 407
    invoke-virtual {p1, p2, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 408
    .line 409
    .line 410
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 411
    .line 412
    sget-object p2, Landroid/hardware/camera2/CaptureRequest;->FLASH_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 413
    .line 414
    invoke-virtual {p1, p2, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 415
    .line 416
    .line 417
    :cond_e
    invoke-direct {p0}, Ll/urh0;->O1()V

    .line 418
    .line 419
    .line 420
    return-void

    .line 421
    :cond_f
    iput v2, p0, Ll/urh0;->h0:I

    .line 422
    .line 423
    invoke-direct {p0}, Ll/urh0;->Q1()V

    .line 424
    .line 425
    .line 426
    return-void

    .line 427
    :cond_10
    iput v2, p0, Ll/urh0;->h0:I

    .line 428
    .line 429
    invoke-direct {p0}, Ll/urh0;->Q1()V

    .line 430
    .line 431
    .line 432
    return-void
.end method

.method public t(Ljava/util/List;Landroid/hardware/camera2/CameraCaptureSession$StateCallback;Landroid/os/Handler;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/view/Surface;",
            ">;",
            "Landroid/hardware/camera2/CameraCaptureSession$StateCallback;",
            "Landroid/os/Handler;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/hardware/camera2/CameraAccessException;
        }
    .end annotation

    .line 1
    const-string v0, "TEImage2Mode-createSession"

    .line 2
    .line 3
    invoke-static {v0}, Ll/dsh0;->a(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 7
    .line 8
    const/16 v1, 0x1c

    .line 9
    .line 10
    const-string v2, "TEImage2Mode"

    .line 11
    .line 12
    if-lt v0, v1, :cond_1

    .line 13
    .line 14
    new-instance v0, Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    if-eqz v3, :cond_0

    .line 28
    .line 29
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    check-cast v3, Landroid/view/Surface;

    .line 34
    .line 35
    new-instance v4, Landroid/hardware/camera2/params/OutputConfiguration;

    .line 36
    .line 37
    invoke-direct {v4, v3}, Landroid/hardware/camera2/params/OutputConfiguration;-><init>(Landroid/view/Surface;)V

    .line 38
    .line 39
    .line 40
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    invoke-static {}, Ll/trh0;->a()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0, p1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->M(Ljava/util/List;)I

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    new-instance v1, Ll/urh0$e;

    .line 52
    .line 53
    invoke-direct {v1, p0, p3}, Ll/urh0$e;-><init>(Ll/urh0;Landroid/os/Handler;)V

    .line 54
    .line 55
    .line 56
    invoke-static {p1, v0, v1, p2}, Ll/srh0;->a(ILjava/util/List;Ljava/util/concurrent/Executor;Landroid/hardware/camera2/CameraCaptureSession$StateCallback;)Landroid/hardware/camera2/params/SessionConfiguration;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    new-instance p2, Landroid/util/Range;

    .line 61
    .line 62
    iget-object p3, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->B:Lcom/ss/android/ttvecamera/TEFrameRateRange;

    .line 63
    .line 64
    iget p3, p3, Lcom/ss/android/ttvecamera/TEFrameRateRange;->min:I

    .line 65
    .line 66
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 67
    .line 68
    iget-object v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->c:Lcom/ss/android/ttvecamera/TEFrameRateRange;

    .line 69
    .line 70
    iget v0, v0, Lcom/ss/android/ttvecamera/TEFrameRateRange;->fpsUnitFactor:I

    .line 71
    .line 72
    div-int/2addr p3, v0

    .line 73
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 74
    .line 75
    .line 76
    move-result-object p3

    .line 77
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->B:Lcom/ss/android/ttvecamera/TEFrameRateRange;

    .line 78
    .line 79
    iget v0, v0, Lcom/ss/android/ttvecamera/TEFrameRateRange;->max:I

    .line 80
    .line 81
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 82
    .line 83
    iget-object v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->c:Lcom/ss/android/ttvecamera/TEFrameRateRange;

    .line 84
    .line 85
    iget v1, v1, Lcom/ss/android/ttvecamera/TEFrameRateRange;->fpsUnitFactor:I

    .line 86
    .line 87
    div-int/2addr v0, v1

    .line 88
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-direct {p2, p3, v0}, Landroid/util/Range;-><init>(Ljava/lang/Comparable;Ljava/lang/Comparable;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {p0, p2}, Ll/urh0;->r(Landroid/util/Range;)Landroid/util/Range;

    .line 96
    .line 97
    .line 98
    move-result-object p2

    .line 99
    iget-object p3, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 100
    .line 101
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_TARGET_FPS_RANGE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 102
    .line 103
    invoke-virtual {p3, v0, p2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 104
    .line 105
    .line 106
    iget p2, p0, Ll/urh0;->r0:I

    .line 107
    .line 108
    invoke-virtual {p0, p2}, Ll/urh0;->b2(I)V

    .line 109
    .line 110
    .line 111
    iget-object p2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 112
    .line 113
    invoke-virtual {p2}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    .line 114
    .line 115
    .line 116
    move-result-object p2

    .line 117
    invoke-static {p1, p2}, Ll/qrh0;->a(Landroid/hardware/camera2/params/SessionConfiguration;Landroid/hardware/camera2/CaptureRequest;)V

    .line 118
    .line 119
    .line 120
    const-string p2, "createSession by sessionConfiguration"

    .line 121
    .line 122
    invoke-static {v2, p2}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 126
    .line 127
    invoke-static {p0, p1}, Ll/rrh0;->a(Landroid/hardware/camera2/CameraDevice;Landroid/hardware/camera2/params/SessionConfiguration;)V

    .line 128
    .line 129
    .line 130
    goto :goto_1

    .line 131
    :cond_1
    const-string v0, "createSession by normally"

    .line 132
    .line 133
    invoke-static {v2, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 137
    .line 138
    invoke-virtual {p0, p1, p2, p3}, Landroid/hardware/camera2/CameraDevice;->createCaptureSession(Ljava/util/List;Landroid/hardware/camera2/CameraCaptureSession$StateCallback;Landroid/os/Handler;)V

    .line 139
    .line 140
    .line 141
    :goto_1
    invoke-static {}, Ll/dsh0;->b()V

    .line 142
    .line 143
    .line 144
    return-void
.end method

.method public t0(Z)I
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_0

    .line 3
    .line 4
    const/4 p1, 0x2

    .line 5
    goto :goto_0

    .line 6
    :cond_0
    move p1, v0

    .line 7
    :goto_0
    invoke-virtual {p0, p1}, Ll/urh0;->c(I)V

    .line 8
    .line 9
    .line 10
    return v0
.end method

.method public u0()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/hardware/camera2/CameraAccessException;
        }
    .end annotation

    .line 1
    iget v0, p0, Ll/urh0;->r0:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/urh0;->b2(I)V

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->u0()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public z(Lcom/ss/android/ttvecamera/TEFocusSettings;)I
    .locals 1

    .line 1
    iget v0, p0, Ll/urh0;->h0:I

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance p1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v0, "focus action discard, state = "

    .line 8
    .line 9
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget p0, p0, Ll/urh0;->h0:I

    .line 13
    .line 14
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string p1, "TEImage2Mode"

    .line 22
    .line 23
    invoke-static {p1, p0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const/16 p0, -0x6c

    .line 27
    .line 28
    return p0

    .line 29
    :cond_0
    invoke-super {p0, p1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->z(Lcom/ss/android/ttvecamera/TEFocusSettings;)I

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    return p0
.end method
