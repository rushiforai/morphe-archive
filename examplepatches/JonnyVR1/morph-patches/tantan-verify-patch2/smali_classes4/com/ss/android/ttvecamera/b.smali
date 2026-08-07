.class public Lcom/ss/android/ttvecamera/b;
.super Lcom/ss/android/ttvecamera/c;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x15
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/android/ttvecamera/b$b;
    }
.end annotation


# instance fields
.field protected A:Landroid/hardware/camera2/CameraCharacteristics;

.field protected B:Landroid/hardware/camera2/CaptureRequest;

.field protected C:Landroid/hardware/camera2/CameraManager;

.field protected volatile D:Landroid/hardware/camera2/CameraDevice;

.field protected E:I

.field protected F:Z

.field protected G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

.field private final H:Ll/lwk;

.field protected I:Z

.field protected J:Z

.field private K:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/ss/android/ttvecamera/TEFrameSizei;",
            ">;"
        }
    .end annotation
.end field

.field private L:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/ss/android/ttvecamera/TEFrameSizei;",
            ">;"
        }
    .end annotation
.end field

.field protected M:Landroid/os/ConditionVariable;

.field protected N:Landroid/hardware/camera2/CameraDevice$StateCallback;

.field protected y:Ll/crh0;

.field protected volatile z:I


# direct methods
.method public constructor <init>(ILandroid/content/Context;Lcom/ss/android/ttvecamera/c$a;Landroid/os/Handler;Lcom/ss/android/ttvecamera/c$d;)V
    .locals 0

    .line 1
    invoke-direct {p0, p2, p3, p4, p5}, Lcom/ss/android/ttvecamera/c;-><init>(Landroid/content/Context;Lcom/ss/android/ttvecamera/c$a;Landroid/os/Handler;Lcom/ss/android/ttvecamera/c$d;)V

    .line 2
    .line 3
    .line 4
    const/4 p3, 0x0

    .line 5
    iput p3, p0, Lcom/ss/android/ttvecamera/b;->z:I

    .line 6
    .line 7
    const/4 p4, -0x1

    .line 8
    iput p4, p0, Lcom/ss/android/ttvecamera/b;->E:I

    .line 9
    .line 10
    const/4 p4, 0x1

    .line 11
    iput-boolean p4, p0, Lcom/ss/android/ttvecamera/b;->F:Z

    .line 12
    .line 13
    iput-boolean p3, p0, Lcom/ss/android/ttvecamera/b;->I:Z

    .line 14
    .line 15
    iput-boolean p3, p0, Lcom/ss/android/ttvecamera/b;->J:Z

    .line 16
    .line 17
    const/4 p3, 0x0

    .line 18
    iput-object p3, p0, Lcom/ss/android/ttvecamera/b;->K:Ljava/util/List;

    .line 19
    .line 20
    iput-object p3, p0, Lcom/ss/android/ttvecamera/b;->L:Ljava/util/List;

    .line 21
    .line 22
    new-instance p3, Landroid/os/ConditionVariable;

    .line 23
    .line 24
    invoke-direct {p3}, Landroid/os/ConditionVariable;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object p3, p0, Lcom/ss/android/ttvecamera/b;->M:Landroid/os/ConditionVariable;

    .line 28
    .line 29
    new-instance p3, Lcom/ss/android/ttvecamera/b$a;

    .line 30
    .line 31
    invoke-direct {p3, p0}, Lcom/ss/android/ttvecamera/b$a;-><init>(Lcom/ss/android/ttvecamera/b;)V

    .line 32
    .line 33
    .line 34
    iput-object p3, p0, Lcom/ss/android/ttvecamera/b;->N:Landroid/hardware/camera2/CameraDevice$StateCallback;

    .line 35
    .line 36
    new-instance p3, Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 37
    .line 38
    invoke-direct {p3, p2, p1}, Lcom/ss/android/ttvecamera/TECameraSettings;-><init>(Landroid/content/Context;I)V

    .line 39
    .line 40
    .line 41
    iput-object p3, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 42
    .line 43
    new-instance p3, Ll/lwk;

    .line 44
    .line 45
    invoke-direct {p3, p2}, Ll/lwk;-><init>(Landroid/content/Context;)V

    .line 46
    .line 47
    .line 48
    iput-object p3, p0, Lcom/ss/android/ttvecamera/b;->H:Ll/lwk;

    .line 49
    .line 50
    invoke-static {p2, p1}, Ll/crh0;->c(Landroid/content/Context;I)Ll/crh0;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    iput-object p1, p0, Lcom/ss/android/ttvecamera/b;->y:Ll/crh0;

    .line 55
    .line 56
    return-void
.end method

.method private P0(Landroid/hardware/camera2/CameraAccessException;)I
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/hardware/camera2/CameraAccessException;->getReason()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 p1, 0x1

    .line 6
    if-eq p0, p1, :cond_3

    .line 7
    .line 8
    const/4 p1, 0x2

    .line 9
    if-eq p0, p1, :cond_2

    .line 10
    .line 11
    const/4 p1, 0x3

    .line 12
    if-eq p0, p1, :cond_1

    .line 13
    .line 14
    const/4 p1, 0x4

    .line 15
    if-eq p0, p1, :cond_0

    .line 16
    .line 17
    const/4 p1, 0x5

    .line 18
    if-eq p0, p1, :cond_0

    .line 19
    .line 20
    const/16 p0, -0x191

    .line 21
    .line 22
    return p0

    .line 23
    :cond_0
    const/16 p0, -0x196

    .line 24
    .line 25
    return p0

    .line 26
    :cond_1
    const/16 p0, -0x19a

    .line 27
    .line 28
    return p0

    .line 29
    :cond_2
    const/16 p0, -0x199

    .line 30
    .line 31
    return p0

    .line 32
    :cond_3
    const/16 p0, -0x198

    .line 33
    .line 34
    return p0
.end method

.method public static Q0(ILandroid/content/Context;Lcom/ss/android/ttvecamera/c$a;Landroid/os/Handler;Lcom/ss/android/ttvecamera/c$d;)Lcom/ss/android/ttvecamera/b;
    .locals 6

    .line 1
    new-instance v0, Lcom/ss/android/ttvecamera/b;

    .line 2
    .line 3
    move v1, p0

    .line 4
    move-object v2, p1

    .line 5
    move-object v3, p2

    .line 6
    move-object v4, p3

    .line 7
    move-object v5, p4

    .line 8
    invoke-direct/range {v0 .. v5}, Lcom/ss/android/ttvecamera/b;-><init>(ILandroid/content/Context;Lcom/ss/android/ttvecamera/c$a;Landroid/os/Handler;Lcom/ss/android/ttvecamera/c$d;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method private S0(ILandroid/hardware/camera2/CameraManager;)V
    .locals 0

    .line 1
    const-string p1, "TECamera2-fillWideCameraID"

    .line 2
    .line 3
    invoke-static {p1}, Ll/dsh0;->a(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/ss/android/ttvecamera/b;->y:Ll/crh0;

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    iget-object p2, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 11
    .line 12
    iget p2, p2, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 13
    .line 14
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->C:Landroid/hardware/camera2/CameraManager;

    .line 15
    .line 16
    invoke-virtual {p1, p2, p0}, Ll/crh0;->b(ILandroid/hardware/camera2/CameraManager;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    invoke-static {}, Ll/dsh0;->b()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method private V0()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/ss/android/ttvecamera/TEFrameRateRange;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    sget-object p0, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_AE_AVAILABLE_TARGET_FPS_RANGES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 11
    .line 12
    invoke-virtual {v0, p0}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, [Landroid/util/Range;

    .line 17
    .line 18
    invoke-static {p0}, Lcom/ss/android/ttvecamera/f;->h([Landroid/util/Range;)Ljava/util/List;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0

    .line 23
    :cond_1
    :goto_0
    const-string v0, "TECamera2"

    .line 24
    .line 25
    const-string v1, "getSupportedFpsRanges: camera is null."

    .line 26
    .line 27
    invoke-static {v0, v1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 31
    .line 32
    iget-object v2, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 33
    .line 34
    iget v2, v2, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 35
    .line 36
    const/16 v3, -0x1b7

    .line 37
    .line 38
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 39
    .line 40
    invoke-interface {v0, v2, v3, v1, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    const/4 p0, 0x0

    .line 44
    return-object p0
.end method


# virtual methods
.method public A0(Lcom/ss/android/ttvecamera/TECameraSettings$p;)V
    .locals 0

    .line 1
    return-void
.end method

.method public B()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, -0x1

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->G()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public B0(I)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/ss/android/ttvecamera/b;->z:I

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    if-eq v0, v1, :cond_0

    .line 5
    .line 6
    new-instance p1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v0, "Invalid state: "

    .line 9
    .line 10
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget p0, p0, Lcom/ss/android/ttvecamera/b;->z:I

    .line 14
    .line 15
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const-string p1, "TECamera2"

    .line 23
    .line 24
    invoke-static {p1, p0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    invoke-virtual {p0, p1}, Lcom/ss/android/ttvecamera/b;->N0(I)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public C()I
    .locals 4

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
    iget v1, p0, Lcom/ss/android/ttvecamera/c;->i:I

    .line 12
    .line 13
    iput v1, p0, Lcom/ss/android/ttvecamera/c;->h:I

    .line 14
    .line 15
    iget-object v1, p0, Lcom/ss/android/ttvecamera/b;->A:Landroid/hardware/camera2/CameraCharacteristics;

    .line 16
    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    sget-object v2, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_ORIENTATION:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Ljava/lang/Integer;

    .line 26
    .line 27
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    goto :goto_0

    .line 32
    :cond_1
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 33
    .line 34
    iget v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->e:I

    .line 35
    .line 36
    :goto_0
    iget v2, p0, Lcom/ss/android/ttvecamera/c;->h:I

    .line 37
    .line 38
    const/4 v3, 0x1

    .line 39
    if-ne v2, v3, :cond_2

    .line 40
    .line 41
    add-int/2addr v1, v0

    .line 42
    rem-int/lit16 v1, v1, 0x168

    .line 43
    .line 44
    rsub-int v0, v1, 0x21c

    .line 45
    .line 46
    rem-int/lit16 v0, v0, 0x168

    .line 47
    .line 48
    iput v0, p0, Lcom/ss/android/ttvecamera/c;->j:I

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_2
    sub-int/2addr v1, v0

    .line 52
    add-int/lit16 v1, v1, 0x168

    .line 53
    .line 54
    rem-int/lit16 v1, v1, 0x168

    .line 55
    .line 56
    iput v1, p0, Lcom/ss/android/ttvecamera/c;->j:I

    .line 57
    .line 58
    :goto_1
    iget p0, p0, Lcom/ss/android/ttvecamera/c;->j:I

    .line 59
    .line 60
    return p0
.end method

.method public C0(I)V
    .locals 10

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "switchFlashMode: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "TECamera2"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget v0, p0, Lcom/ss/android/ttvecamera/b;->z:I

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    const/4 v3, 0x1

    .line 24
    if-ne v0, v3, :cond_2

    .line 25
    .line 26
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 27
    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    instance-of v4, v0, Ll/urh0;

    .line 31
    .line 32
    if-eqz v4, :cond_0

    .line 33
    .line 34
    check-cast v0, Ll/urh0;

    .line 35
    .line 36
    invoke-virtual {v0, p1}, Ll/urh0;->b2(I)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    const-string v0, "[VE_UI_TEST]Failed event: TOGGLE_TORCH. Code: -439. Reason: camera is opening, ignore toggleTorch operation"

    .line 41
    .line 42
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    const-string v8, "Camera is opening, ignore toggleTorch operation."

    .line 46
    .line 47
    invoke-static {v1, v8}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    iget-object v4, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 51
    .line 52
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 53
    .line 54
    iget v5, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 55
    .line 56
    if-nez p1, :cond_1

    .line 57
    .line 58
    move v7, v2

    .line 59
    goto :goto_0

    .line 60
    :cond_1
    move v7, v3

    .line 61
    :goto_0
    iget-object v9, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 62
    .line 63
    const/16 v6, -0x1b7

    .line 64
    .line 65
    invoke-interface/range {v4 .. v9}, Lcom/ss/android/ttvecamera/c$a;->g(IIILjava/lang/String;Ljava/lang/Object;)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_2
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/b;->I0()Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-eqz v0, :cond_4

    .line 74
    .line 75
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 76
    .line 77
    if-nez v0, :cond_3

    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_3
    invoke-interface {v0, p1}, Ll/o6m;->c(I)V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_4
    :goto_1
    const-string v0, "[VE_UI_TEST]Failed event: TOGGLE_TORCH. Code: -439. Reason: camera is null"

    .line 85
    .line 86
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    const-string v8, "switch flash mode  failed, you must open camera first."

    .line 90
    .line 91
    invoke-static {v1, v8}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    iget-object v4, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 95
    .line 96
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 97
    .line 98
    iget v5, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 99
    .line 100
    if-nez p1, :cond_5

    .line 101
    .line 102
    move v7, v2

    .line 103
    goto :goto_2

    .line 104
    :cond_5
    move v7, v3

    .line 105
    :goto_2
    iget-object v9, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 106
    .line 107
    const/16 v6, -0x1b7

    .line 108
    .line 109
    invoke-interface/range {v4 .. v9}, Lcom/ss/android/ttvecamera/c$a;->g(IIILjava/lang/String;Ljava/lang/Object;)V

    .line 110
    .line 111
    .line 112
    iget-object p1, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 113
    .line 114
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 115
    .line 116
    iget v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 117
    .line 118
    const/16 v1, -0x1b7

    .line 119
    .line 120
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 121
    .line 122
    invoke-interface {p1, v0, v1, v8, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 123
    .line 124
    .line 125
    return-void
.end method

.method public D0(IILcom/ss/android/ttvecamera/TECameraSettings$l;)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/ss/android/ttvecamera/b;->z:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const-string v2, "TECamera2"

    .line 5
    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    const-string p0, "Camera is opening, ignore takePicture operation."

    .line 9
    .line 10
    invoke-static {v2, p0}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget v0, p0, Lcom/ss/android/ttvecamera/b;->z:I

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    if-ne v0, v1, :cond_1

    .line 18
    .line 19
    const-string p0, "Camera is opened, ignore takePicture operation."

    .line 20
    .line 21
    invoke-static {v2, p0}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/b;->I0()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_3

    .line 30
    .line 31
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 32
    .line 33
    if-nez v0, :cond_2

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_2
    invoke-virtual {v0, p1, p2, p3}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->r0(IILcom/ss/android/ttvecamera/TECameraSettings$l;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_3
    :goto_0
    const-string p1, "takePicture : camera is null."

    .line 41
    .line 42
    invoke-static {v2, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    iget-object p2, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 46
    .line 47
    iget-object p3, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 48
    .line 49
    iget p3, p3, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 50
    .line 51
    const/16 v0, -0x1b7

    .line 52
    .line 53
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 54
    .line 55
    invoke-interface {p2, p3, v0, p1, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public E0(Lcom/ss/android/ttvecamera/TECameraSettings$l;)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/ss/android/ttvecamera/b;->z:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const-string v2, "TECamera2"

    .line 5
    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    const-string p0, "Camera is opening, ignore takePicture operation."

    .line 9
    .line 10
    invoke-static {v2, p0}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget v0, p0, Lcom/ss/android/ttvecamera/b;->z:I

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    if-ne v0, v1, :cond_1

    .line 18
    .line 19
    const-string p0, "Camera is opened, ignore takePicture operation."

    .line 20
    .line 21
    invoke-static {v2, p0}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/b;->I0()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_3

    .line 30
    .line 31
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 32
    .line 33
    if-nez v0, :cond_2

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_2
    iget p0, p0, Lcom/ss/android/ttvecamera/c;->i:I

    .line 37
    .line 38
    invoke-virtual {v0, p1, p0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->s0(Lcom/ss/android/ttvecamera/TECameraSettings$l;I)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_3
    :goto_0
    const-string p1, "takePicture : camera is null."

    .line 43
    .line 44
    invoke-static {v2, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 48
    .line 49
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 50
    .line 51
    iget v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 52
    .line 53
    const/16 v2, -0x1b7

    .line 54
    .line 55
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 56
    .line 57
    invoke-interface {v0, v1, v2, p1, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public F()I
    .locals 5

    .line 1
    const-string v0, "getISO..."

    .line 2
    .line 3
    const-string v1, "TECamera2"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v0, p0, Lcom/ss/android/ttvecamera/b;->z:I

    .line 9
    .line 10
    const/4 v2, 0x1

    .line 11
    const/4 v3, -0x1

    .line 12
    if-ne v0, v2, :cond_0

    .line 13
    .line 14
    const-string p0, "Camera is opening, ignore setISO operation."

    .line 15
    .line 16
    invoke-static {v1, p0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return v3

    .line 20
    :cond_0
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/b;->I0()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 27
    .line 28
    if-nez v0, :cond_1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->H()I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    return p0

    .line 36
    :cond_2
    :goto_0
    const-string v0, "getISO : camera is null."

    .line 37
    .line 38
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 42
    .line 43
    iget-object v2, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 44
    .line 45
    iget v2, v2, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 46
    .line 47
    const/16 v4, -0x1b7

    .line 48
    .line 49
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 50
    .line 51
    invoke-interface {v1, v2, v4, v0, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    return v3
.end method

.method public F0(Z)V
    .locals 14

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "toggleTorch: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "TECamera2"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget v0, p0, Lcom/ss/android/ttvecamera/b;->z:I

    .line 21
    .line 22
    const/4 v2, 0x1

    .line 23
    if-ne v0, v2, :cond_0

    .line 24
    .line 25
    const-string v0, "[VE_UI_TEST]Failed event: TOGGLE_TORCH. Code: -439. Reason: camera is opening, ignore toggleTorch operation"

    .line 26
    .line 27
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    const-string v0, "Camera is opening, ignore toggleTorch operation."

    .line 31
    .line 32
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iget-object v2, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 36
    .line 37
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 38
    .line 39
    iget v3, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 40
    .line 41
    const/16 v4, -0x1b7

    .line 42
    .line 43
    iget-object v7, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 44
    .line 45
    const-string v6, "Camera is opening, ignore toggleTorch operation."

    .line 46
    .line 47
    move v5, p1

    .line 48
    invoke-interface/range {v2 .. v7}, Lcom/ss/android/ttvecamera/c$a;->g(IIILjava/lang/String;Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_0
    move v5, p1

    .line 53
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/b;->I0()Z

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    if-eqz p1, :cond_2

    .line 58
    .line 59
    iget-object p1, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 60
    .line 61
    if-nez p1, :cond_1

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_1
    invoke-virtual {p1, v5}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->t0(Z)I

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_2
    :goto_0
    const-string p1, "[VE_UI_TEST]Failed event: TOGGLE_TORCH. Code: -439. Reason: camera is null"

    .line 69
    .line 70
    invoke-static {v1, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    const-string v12, "Toggle torch failed, you must open camera first."

    .line 74
    .line 75
    invoke-static {v1, v12}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    iget-object p1, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 79
    .line 80
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 81
    .line 82
    iget v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 83
    .line 84
    const/16 v1, -0x1b7

    .line 85
    .line 86
    iget-object v2, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 87
    .line 88
    invoke-interface {p1, v0, v1, v12, v2}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 89
    .line 90
    .line 91
    iget-object v8, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 92
    .line 93
    iget-object p1, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 94
    .line 95
    iget v9, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 96
    .line 97
    const/16 v10, -0x1b7

    .line 98
    .line 99
    iget-object v13, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 100
    .line 101
    move v11, v5

    .line 102
    invoke-interface/range {v8 .. v13}, Lcom/ss/android/ttvecamera/c$a;->g(IIILjava/lang/String;Ljava/lang/Object;)V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public G()[I
    .locals 5

    .line 1
    const-string v0, "getISORange..."

    .line 2
    .line 3
    const-string v1, "TECamera2"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v0, p0, Lcom/ss/android/ttvecamera/b;->z:I

    .line 9
    .line 10
    const/4 v2, 0x1

    .line 11
    const/4 v3, -0x1

    .line 12
    if-ne v0, v2, :cond_0

    .line 13
    .line 14
    const-string p0, "Camera is opening, ignore setWhileBalance operation."

    .line 15
    .line 16
    invoke-static {v1, p0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    filled-new-array {v3, v3}, [I

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0

    .line 24
    :cond_0
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/b;->I0()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 31
    .line 32
    if-nez v0, :cond_1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->I()[I

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0

    .line 40
    :cond_2
    :goto_0
    const-string v0, "setWhileBalance : camera is null."

    .line 41
    .line 42
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 46
    .line 47
    iget-object v2, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 48
    .line 49
    iget v2, v2, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 50
    .line 51
    const/16 v4, -0x1b7

    .line 52
    .line 53
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 54
    .line 55
    invoke-interface {v1, v2, v4, v0, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    filled-new-array {v3, v3}, [I

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0
.end method

.method public H()F
    .locals 5

    .line 1
    iget v0, p0, Lcom/ss/android/ttvecamera/b;->z:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/high16 v2, -0x40800000    # -1.0f

    .line 5
    .line 6
    const-string v3, "TECamera2"

    .line 7
    .line 8
    if-ne v0, v1, :cond_0

    .line 9
    .line 10
    const-string p0, "Camera is opening, ignore getManualFocusAbility operation."

    .line 11
    .line 12
    invoke-static {v3, p0}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return v2

    .line 16
    :cond_0
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/b;->I0()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_2

    .line 21
    .line 22
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 23
    .line 24
    if-nez v0, :cond_1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->J()F

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0

    .line 32
    :cond_2
    :goto_0
    const-string v0, "getManualFocusAbility : camera is null."

    .line 33
    .line 34
    invoke-static {v3, v0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 38
    .line 39
    iget-object v3, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 40
    .line 41
    iget v3, v3, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 42
    .line 43
    const/16 v4, -0x1b7

    .line 44
    .line 45
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 46
    .line 47
    invoke-interface {v1, v3, v4, v0, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    return v2
.end method

.method public H0(FLcom/ss/android/ttvecamera/TECameraSettings$p;)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/ss/android/ttvecamera/b;->z:I

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    const-string v2, "TECamera2"

    .line 5
    .line 6
    if-eq v0, v1, :cond_0

    .line 7
    .line 8
    const-string p1, "[VE_UI_TEST]Failed event: START_ZOOM. Code: -420. Reason: session is not running"

    .line 9
    .line 10
    invoke-static {v2, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    new-instance p1, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string p2, "Invalid state, state = "

    .line 16
    .line 17
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget p2, p0, Lcom/ss/android/ttvecamera/b;->z:I

    .line 21
    .line 22
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iget-object p2, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 30
    .line 31
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 32
    .line 33
    iget v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 34
    .line 35
    const/16 v1, -0x1a4

    .line 36
    .line 37
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 38
    .line 39
    invoke-interface {p2, v0, v1, p1, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_0
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/b;->I0()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_2

    .line 48
    .line 49
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 50
    .line 51
    if-nez v0, :cond_1

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    invoke-virtual {v0, p1, p2}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->A0(FLcom/ss/android/ttvecamera/TECameraSettings$p;)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_2
    :goto_0
    const-string p1, "[VE_UI_TEST]Failed event: START_ZOOM. Code: -439. Reason: camera is null"

    .line 59
    .line 60
    invoke-static {v2, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    iget-object p1, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 64
    .line 65
    iget-object p2, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 66
    .line 67
    iget p2, p2, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 68
    .line 69
    const/16 v0, -0x1b7

    .line 70
    .line 71
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 72
    .line 73
    const-string v1, "zoomV2 : Camera is null."

    .line 74
    .line 75
    invoke-interface {p1, p2, v0, v1, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public I()[I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, "TECamera2"

    .line 6
    .line 7
    const-string v0, "get picture size failed, no mode..."

    .line 8
    .line 9
    invoke-static {p0, v0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    return-object p0

    .line 14
    :cond_0
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->K()[I

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public I0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public J()[I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

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
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->L()[I

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public J0(Lcom/bytedance/bpea/basics/Cert;)I
    .locals 7
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MissingPermission"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    const-string v0, "TECamera2-_open"

    .line 2
    .line 3
    invoke-static {v0}, Ll/dsh0;->a(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b;->C:Landroid/hardware/camera2/CameraManager;

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->f:Landroid/content/Context;

    .line 11
    .line 12
    const-string v1, "camera"

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Landroid/hardware/camera2/CameraManager;

    .line 19
    .line 20
    iput-object v0, p0, Lcom/ss/android/ttvecamera/b;->C:Landroid/hardware/camera2/CameraManager;

    .line 21
    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    const/16 p0, -0x197

    .line 25
    .line 26
    return p0

    .line 27
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 28
    .line 29
    iget v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->B:I

    .line 30
    .line 31
    const/4 v1, 0x1

    .line 32
    const/4 v2, 0x0

    .line 33
    if-nez v0, :cond_1

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/b;->R0()V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    if-ne v0, v1, :cond_2

    .line 40
    .line 41
    new-instance v0, Ll/urh0;

    .line 42
    .line 43
    iget-object v3, p0, Lcom/ss/android/ttvecamera/c;->f:Landroid/content/Context;

    .line 44
    .line 45
    iget-object v4, p0, Lcom/ss/android/ttvecamera/b;->C:Landroid/hardware/camera2/CameraManager;

    .line 46
    .line 47
    iget-object v5, p0, Lcom/ss/android/ttvecamera/c;->e:Landroid/os/Handler;

    .line 48
    .line 49
    invoke-direct {v0, p0, v3, v4, v5}, Ll/urh0;-><init>(Lcom/ss/android/ttvecamera/b;Landroid/content/Context;Landroid/hardware/camera2/CameraManager;Landroid/os/Handler;)V

    .line 50
    .line 51
    .line 52
    iput-object v0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 53
    .line 54
    iget-object v3, p0, Lcom/ss/android/ttvecamera/c;->n:Lcom/ss/android/ttvecamera/c$d;

    .line 55
    .line 56
    invoke-virtual {v0, v3}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->g0(Lcom/ss/android/ttvecamera/c$d;)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 60
    .line 61
    iget-object v3, p0, Lcom/ss/android/ttvecamera/c;->p:Lcom/ss/android/ttvecamera/c$b;

    .line 62
    .line 63
    invoke-virtual {v0, v3}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c0(Lcom/ss/android/ttvecamera/c$b;)V

    .line 64
    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_2
    new-instance v0, Ll/pqh0;

    .line 68
    .line 69
    iget-object v3, p0, Lcom/ss/android/ttvecamera/c;->f:Landroid/content/Context;

    .line 70
    .line 71
    iget-object v4, p0, Lcom/ss/android/ttvecamera/b;->C:Landroid/hardware/camera2/CameraManager;

    .line 72
    .line 73
    iget-object v5, p0, Lcom/ss/android/ttvecamera/c;->e:Landroid/os/Handler;

    .line 74
    .line 75
    invoke-direct {v0, p0, v3, v4, v5}, Ll/pqh0;-><init>(Lcom/ss/android/ttvecamera/b;Landroid/content/Context;Landroid/hardware/camera2/CameraManager;Landroid/os/Handler;)V

    .line 76
    .line 77
    .line 78
    iput-object v0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 79
    .line 80
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 81
    .line 82
    const-string v3, "enable arcore"

    .line 83
    .line 84
    iget-object v4, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 85
    .line 86
    const/16 v5, 0x75

    .line 87
    .line 88
    invoke-interface {v0, v5, v2, v3, v4}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 89
    .line 90
    .line 91
    :goto_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 92
    .line 93
    iget-object v3, p0, Lcom/ss/android/ttvecamera/c;->o:Lcom/ss/android/ttvecamera/c$e;

    .line 94
    .line 95
    invoke-virtual {v0, v3}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h0(Lcom/ss/android/ttvecamera/c$e;)V

    .line 96
    .line 97
    .line 98
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 99
    .line 100
    iget-boolean v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->k:Z

    .line 101
    .line 102
    if-eqz v0, :cond_3

    .line 103
    .line 104
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 105
    .line 106
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->D()Landroid/os/Handler;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    goto :goto_1

    .line 111
    :cond_3
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->e:Landroid/os/Handler;

    .line 112
    .line 113
    :goto_1
    iget-object v3, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 114
    .line 115
    instance-of v4, v3, Ll/pqh0;

    .line 116
    .line 117
    if-eqz v4, :cond_4

    .line 118
    .line 119
    check-cast v3, Ll/pqh0;

    .line 120
    .line 121
    iget-object v4, p0, Lcom/ss/android/ttvecamera/c;->f:Landroid/content/Context;

    .line 122
    .line 123
    invoke-virtual {v3, v4, v0}, Ll/pqh0;->C0(Landroid/content/Context;Landroid/os/Handler;)V

    .line 124
    .line 125
    .line 126
    :cond_4
    iget-object v3, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 127
    .line 128
    iget v4, v3, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 129
    .line 130
    invoke-virtual {p0, v4}, Lcom/ss/android/ttvecamera/b;->Z0(I)Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v4

    .line 134
    iput-object v4, v3, Lcom/ss/android/ttvecamera/TECameraSettings;->H:Ljava/lang/String;

    .line 135
    .line 136
    iget-object v3, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 137
    .line 138
    iget-object v4, v3, Lcom/ss/android/ttvecamera/TECameraSettings;->H:Ljava/lang/String;

    .line 139
    .line 140
    if-nez v4, :cond_5

    .line 141
    .line 142
    const-string p0, "TECamera2"

    .line 143
    .line 144
    const-string p1, "Invalid CameraID"

    .line 145
    .line 146
    invoke-static {p0, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    const/16 p0, -0x195

    .line 150
    .line 151
    return p0

    .line 152
    :cond_5
    iget-object v5, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 153
    .line 154
    iget-boolean v6, p0, Lcom/ss/android/ttvecamera/b;->F:Z

    .line 155
    .line 156
    if-eqz v6, :cond_6

    .line 157
    .line 158
    iget v3, v3, Lcom/ss/android/ttvecamera/TECameraSettings;->D:I

    .line 159
    .line 160
    goto :goto_2

    .line 161
    :cond_6
    move v3, v2

    .line 162
    :goto_2
    invoke-virtual {v5, v4, v3}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->P(Ljava/lang/String;I)I

    .line 163
    .line 164
    .line 165
    move-result v3

    .line 166
    if-eqz v3, :cond_7

    .line 167
    .line 168
    return v3

    .line 169
    :cond_7
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/b;->O0()V

    .line 170
    .line 171
    .line 172
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/b;->l()Landroid/os/Bundle;

    .line 173
    .line 174
    .line 175
    iget-object v3, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 176
    .line 177
    iget v3, v3, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 178
    .line 179
    iget-object v4, p0, Lcom/ss/android/ttvecamera/b;->C:Landroid/hardware/camera2/CameraManager;

    .line 180
    .line 181
    invoke-direct {p0, v3, v4}, Lcom/ss/android/ttvecamera/b;->S0(ILandroid/hardware/camera2/CameraManager;)V

    .line 182
    .line 183
    .line 184
    iget-object v3, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 185
    .line 186
    const-string v4, "TECamera2 features is ready"

    .line 187
    .line 188
    iget-object v5, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 189
    .line 190
    invoke-interface {v3, v1, v2, v4, v5}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 191
    .line 192
    .line 193
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 194
    .line 195
    iget-boolean v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->k:Z

    .line 196
    .line 197
    const/4 v3, 0x0

    .line 198
    if-eqz v1, :cond_8

    .line 199
    .line 200
    :try_start_0
    iput-object v3, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 201
    .line 202
    iget-object v1, p0, Lcom/ss/android/ttvecamera/b;->C:Landroid/hardware/camera2/CameraManager;

    .line 203
    .line 204
    iget-object v3, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 205
    .line 206
    iget-object v3, v3, Lcom/ss/android/ttvecamera/TECameraSettings;->H:Ljava/lang/String;

    .line 207
    .line 208
    iget-object v4, p0, Lcom/ss/android/ttvecamera/b;->N:Landroid/hardware/camera2/CameraDevice$StateCallback;

    .line 209
    .line 210
    invoke-static {p1, v1, v3, v4, v0}, Ll/wqh0;->c(Lcom/bytedance/bpea/basics/Cert;Landroid/hardware/camera2/CameraManager;Ljava/lang/String;Landroid/hardware/camera2/CameraDevice$StateCallback;Landroid/os/Handler;)V
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 211
    .line 212
    .line 213
    iget-object p1, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 214
    .line 215
    if-nez p1, :cond_9

    .line 216
    .line 217
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/b;->b1()V

    .line 218
    .line 219
    .line 220
    goto :goto_3

    .line 221
    :catch_0
    move-exception p1

    .line 222
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/b;->P0(Landroid/hardware/camera2/CameraAccessException;)I

    .line 223
    .line 224
    .line 225
    move-result v0

    .line 226
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 227
    .line 228
    .line 229
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/b;->X0()V

    .line 230
    .line 231
    .line 232
    return v0

    .line 233
    :cond_8
    :try_start_1
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 234
    .line 235
    const-string v4, "will start camera2"

    .line 236
    .line 237
    const/16 v5, 0x6a

    .line 238
    .line 239
    invoke-interface {v1, v5, v2, v4, v3}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 240
    .line 241
    .line 242
    iget-object v1, p0, Lcom/ss/android/ttvecamera/b;->C:Landroid/hardware/camera2/CameraManager;

    .line 243
    .line 244
    iget-object v3, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 245
    .line 246
    iget-object v3, v3, Lcom/ss/android/ttvecamera/TECameraSettings;->H:Ljava/lang/String;

    .line 247
    .line 248
    iget-object v4, p0, Lcom/ss/android/ttvecamera/b;->N:Landroid/hardware/camera2/CameraDevice$StateCallback;

    .line 249
    .line 250
    invoke-static {p1, v1, v3, v4, v0}, Ll/wqh0;->c(Lcom/bytedance/bpea/basics/Cert;Landroid/hardware/camera2/CameraManager;Ljava/lang/String;Landroid/hardware/camera2/CameraDevice$StateCallback;Landroid/os/Handler;)V
    :try_end_1
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_1 .. :try_end_1} :catch_1

    .line 251
    .line 252
    .line 253
    :cond_9
    :goto_3
    invoke-static {}, Ll/dsh0;->b()V

    .line 254
    .line 255
    .line 256
    return v2

    .line 257
    :catch_1
    move-exception p1

    .line 258
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/b;->P0(Landroid/hardware/camera2/CameraAccessException;)I

    .line 259
    .line 260
    .line 261
    move-result p0

    .line 262
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 263
    .line 264
    .line 265
    return p0
.end method

.method public K0(Lcom/bytedance/bpea/basics/Cert;)V
    .locals 6

    .line 1
    const/4 v0, 0x2

    .line 2
    const/4 v1, 0x0

    .line 3
    const/4 v2, 0x0

    .line 4
    :try_start_0
    iget-object v3, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 5
    .line 6
    invoke-virtual {v3}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->U()V

    .line 7
    .line 8
    .line 9
    iget-object v3, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 10
    .line 11
    invoke-virtual {v3}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->q()V

    .line 12
    .line 13
    .line 14
    iget-object v3, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 15
    .line 16
    if-eqz v3, :cond_0

    .line 17
    .line 18
    iget-object v3, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 19
    .line 20
    const-string v4, "will close camera2"

    .line 21
    .line 22
    const/16 v5, 0x6c

    .line 23
    .line 24
    invoke-interface {v3, v5, v1, v4, v2}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    iget-object v3, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 28
    .line 29
    invoke-static {p1, v3}, Ll/wqh0;->b(Lcom/bytedance/bpea/basics/Cert;Landroid/hardware/camera2/CameraDevice;)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 33
    .line 34
    const-string v3, "did close camera2"

    .line 35
    .line 36
    const/16 v4, 0x6d

    .line 37
    .line 38
    invoke-interface {p1, v4, v1, v3, v2}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    iput-object v2, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 42
    .line 43
    iget-object p1, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 44
    .line 45
    iget-object v3, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 46
    .line 47
    invoke-interface {p1, v0, p0, v3}, Lcom/ss/android/ttvecamera/c$a;->i(ILcom/ss/android/ttvecamera/c;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :catchall_0
    move-exception p1

    .line 52
    const-string v3, "TECamera2"

    .line 53
    .line 54
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-static {v3, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    :cond_0
    :goto_0
    invoke-virtual {p0, v1}, Lcom/ss/android/ttvecamera/b;->a1(I)V

    .line 62
    .line 63
    .line 64
    iput-object v2, p0, Lcom/ss/android/ttvecamera/b;->A:Landroid/hardware/camera2/CameraCharacteristics;

    .line 65
    .line 66
    iput-object v2, p0, Lcom/ss/android/ttvecamera/b;->B:Landroid/hardware/camera2/CaptureRequest;

    .line 67
    .line 68
    iput-object v2, p0, Lcom/ss/android/ttvecamera/c;->t:Lcom/bytedance/bpea/basics/Cert;

    .line 69
    .line 70
    iget-object p1, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 71
    .line 72
    if-eqz p1, :cond_1

    .line 73
    .line 74
    iget-object p0, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 75
    .line 76
    iget p0, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->B:I

    .line 77
    .line 78
    if-ne p0, v0, :cond_1

    .line 79
    .line 80
    check-cast p1, Ll/pqh0;

    .line 81
    .line 82
    invoke-virtual {p1}, Ll/pqh0;->B0()V

    .line 83
    .line 84
    .line 85
    :cond_1
    return-void
.end method

.method public L0()I
    .locals 5

    .line 1
    const-string v0, "TECamera2-_startCapture"

    .line 2
    .line 3
    invoke-static {v0}, Ll/dsh0;->a(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/c;->z0()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 16
    .line 17
    iget v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 18
    .line 19
    const/16 v2, -0x1b7

    .line 20
    .line 21
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 22
    .line 23
    const-string v3, "_startCapture : mode is null"

    .line 24
    .line 25
    invoke-interface {v0, v1, v2, v3, p0}, Lcom/ss/android/ttvecamera/c$a;->b(IILjava/lang/String;Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    const/4 p0, -0x1

    .line 29
    return p0

    .line 30
    :cond_0
    :try_start_0
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->m0()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/b;->X0()V

    .line 37
    .line 38
    .line 39
    const-string v1, "_startCapture : something wrong"

    .line 40
    .line 41
    iget-object v2, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 42
    .line 43
    iget-object v3, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 44
    .line 45
    iget v3, v3, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 46
    .line 47
    iget-object v4, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 48
    .line 49
    invoke-interface {v2, v3, v0, v1, v4}, Lcom/ss/android/ttvecamera/c$a;->b(IILjava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :catch_0
    move-exception v0

    .line 54
    goto :goto_1

    .line 55
    :cond_1
    :goto_0
    invoke-static {}, Ll/dsh0;->b()V

    .line 56
    .line 57
    .line 58
    return v0

    .line 59
    :goto_1
    instance-of v1, v0, Landroid/hardware/camera2/CameraAccessException;

    .line 60
    .line 61
    if-eqz v1, :cond_2

    .line 62
    .line 63
    const/16 v1, -0x19a

    .line 64
    .line 65
    goto :goto_2

    .line 66
    :cond_2
    instance-of v1, v0, Ljava/lang/IllegalArgumentException;

    .line 67
    .line 68
    if-eqz v1, :cond_3

    .line 69
    .line 70
    const/16 v1, -0x192

    .line 71
    .line 72
    goto :goto_2

    .line 73
    :cond_3
    instance-of v1, v0, Ljava/lang/IllegalStateException;

    .line 74
    .line 75
    if-eqz v1, :cond_4

    .line 76
    .line 77
    const/16 v1, -0x199

    .line 78
    .line 79
    goto :goto_2

    .line 80
    :cond_4
    const/16 v1, -0x1a9

    .line 81
    .line 82
    :goto_2
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/b;->X0()V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 86
    .line 87
    .line 88
    invoke-static {v0}, Lcom/ss/android/ttvecamera/e;->a(Ljava/lang/Throwable;)V

    .line 89
    .line 90
    .line 91
    new-instance v2, Ljava/lang/StringBuilder;

    .line 92
    .line 93
    const-string v3, "_startCapture : mode is null, err msg: "

    .line 94
    .line 95
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    iget-object v2, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 110
    .line 111
    iget-object v3, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 112
    .line 113
    iget v3, v3, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 114
    .line 115
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 116
    .line 117
    invoke-interface {v2, v3, v1, v0, p0}, Lcom/ss/android/ttvecamera/c$a;->b(IILjava/lang/String;Ljava/lang/Object;)V

    .line 118
    .line 119
    .line 120
    return v1
.end method

.method public M()[J
    .locals 5

    .line 1
    const-string v0, "getShutterTimeRange..."

    .line 2
    .line 3
    const-string v1, "TECamera2"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v0, p0, Lcom/ss/android/ttvecamera/b;->z:I

    .line 9
    .line 10
    const/4 v2, 0x1

    .line 11
    const/4 v3, 0x2

    .line 12
    if-ne v0, v2, :cond_0

    .line 13
    .line 14
    const-string p0, "Camera is opening, ignore getShutterTimeRange operation."

    .line 15
    .line 16
    invoke-static {v1, p0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    new-array p0, v3, [J

    .line 20
    .line 21
    fill-array-data p0, :array_0

    .line 22
    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_0
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/b;->I0()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 32
    .line 33
    if-nez v0, :cond_1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->N()[J

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0

    .line 41
    :cond_2
    :goto_0
    const-string v0, "getShutterTimeRange : camera is null."

    .line 42
    .line 43
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 47
    .line 48
    iget-object v2, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 49
    .line 50
    iget v2, v2, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 51
    .line 52
    const/16 v4, -0x1b7

    .line 53
    .line 54
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 55
    .line 56
    invoke-interface {v1, v2, v4, v0, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    new-array p0, v3, [J

    .line 60
    .line 61
    fill-array-data p0, :array_1

    .line 62
    .line 63
    .line 64
    return-object p0

    .line 65
    :array_0
    .array-data 8
        -0x1
        -0x1
    .end array-data

    .line 66
    .line 67
    .line 68
    .line 69
    .line 70
    .line 71
    .line 72
    .line 73
    .line 74
    .line 75
    :array_1
    .array-data 8
        -0x1
        -0x1
    .end array-data
.end method

.method public M0()I
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 7
    .line 8
    iget-object v2, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 9
    .line 10
    iget v2, v2, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 11
    .line 12
    const/16 v3, -0x1b7

    .line 13
    .line 14
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 15
    .line 16
    const-string v4, "_stopCapture : mode is null"

    .line 17
    .line 18
    invoke-interface {v0, v2, v3, v4, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    return v1

    .line 22
    :cond_0
    :try_start_0
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->q()V

    .line 23
    .line 24
    .line 25
    iget-object v5, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 26
    .line 27
    const-string v9, "TECamera2 preview stoped"

    .line 28
    .line 29
    iget-object v10, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 30
    .line 31
    const/4 v6, 0x2

    .line 32
    const/4 v7, 0x4

    .line 33
    const/4 v8, 0x0

    .line 34
    invoke-interface/range {v5 .. v10}, Lcom/ss/android/ttvecamera/c$a;->d(IIILjava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 35
    .line 36
    .line 37
    const/4 p0, 0x0

    .line 38
    return p0

    .line 39
    :catch_0
    move-exception v0

    .line 40
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 44
    .line 45
    iget-object v2, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 46
    .line 47
    iget v2, v2, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 48
    .line 49
    const/16 v3, -0x1a9

    .line 50
    .line 51
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 52
    .line 53
    const-string v4, "Error:_stopCapture : mode is null"

    .line 54
    .line 55
    invoke-interface {v0, v2, v3, v4, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    return v1
.end method

.method public N()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/ss/android/ttvecamera/TEFrameSizei;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    iget-object v1, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v2, p0, Lcom/ss/android/ttvecamera/b;->L:Ljava/util/List;

    .line 11
    .line 12
    if-nez v2, :cond_2

    .line 13
    .line 14
    iget-object v2, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->l:Landroid/hardware/camera2/params/StreamConfigurationMap;

    .line 15
    .line 16
    if-nez v2, :cond_1

    .line 17
    .line 18
    sget-object v2, Landroid/hardware/camera2/CameraCharacteristics;->SCALER_STREAM_CONFIGURATION_MAP:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Landroid/hardware/camera2/params/StreamConfigurationMap;

    .line 25
    .line 26
    iput-object v1, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->l:Landroid/hardware/camera2/params/StreamConfigurationMap;

    .line 27
    .line 28
    :cond_1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 29
    .line 30
    iget-object v0, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->l:Landroid/hardware/camera2/params/StreamConfigurationMap;

    .line 31
    .line 32
    const/16 v1, 0x100

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroid/hardware/camera2/params/StreamConfigurationMap;->getOutputSizes(I)[Landroid/util/Size;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {v0}, Lcom/ss/android/ttvecamera/f;->i([Landroid/util/Size;)Ljava/util/List;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iput-object v0, p0, Lcom/ss/android/ttvecamera/b;->L:Ljava/util/List;

    .line 43
    .line 44
    :cond_2
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->L:Ljava/util/List;

    .line 45
    .line 46
    return-object p0

    .line 47
    :cond_3
    :goto_0
    const-string v0, "TECamera2"

    .line 48
    .line 49
    const-string v1, "getSupportedPictureSizes: camera is null."

    .line 50
    .line 51
    invoke-static {v0, v1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 55
    .line 56
    iget-object v2, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 57
    .line 58
    iget v2, v2, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 59
    .line 60
    const/16 v3, -0x1b7

    .line 61
    .line 62
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 63
    .line 64
    invoke-interface {v0, v2, v3, v1, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    const/4 p0, 0x0

    .line 68
    return-object p0
.end method

.method public N0(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto/16 :goto_2

    .line 6
    .line 7
    :cond_0
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/b;->M0()I

    .line 8
    .line 9
    .line 10
    if-nez p1, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/b;->R0()V

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_1
    const/4 v0, 0x1

    .line 17
    if-ne p1, v0, :cond_2

    .line 18
    .line 19
    new-instance p1, Ll/urh0;

    .line 20
    .line 21
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->f:Landroid/content/Context;

    .line 22
    .line 23
    iget-object v1, p0, Lcom/ss/android/ttvecamera/b;->C:Landroid/hardware/camera2/CameraManager;

    .line 24
    .line 25
    iget-object v2, p0, Lcom/ss/android/ttvecamera/c;->e:Landroid/os/Handler;

    .line 26
    .line 27
    invoke-direct {p1, p0, v0, v1, v2}, Ll/urh0;-><init>(Lcom/ss/android/ttvecamera/b;Landroid/content/Context;Landroid/hardware/camera2/CameraManager;Landroid/os/Handler;)V

    .line 28
    .line 29
    .line 30
    iput-object p1, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 31
    .line 32
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->n:Lcom/ss/android/ttvecamera/c$d;

    .line 33
    .line 34
    invoke-virtual {p1, v0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->g0(Lcom/ss/android/ttvecamera/c$d;)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 38
    .line 39
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->o:Lcom/ss/android/ttvecamera/c$e;

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h0(Lcom/ss/android/ttvecamera/c$e;)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 45
    .line 46
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->p:Lcom/ss/android/ttvecamera/c$b;

    .line 47
    .line 48
    invoke-virtual {p1, v0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c0(Lcom/ss/android/ttvecamera/c$b;)V

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    new-instance p1, Ll/pqh0;

    .line 53
    .line 54
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->f:Landroid/content/Context;

    .line 55
    .line 56
    iget-object v1, p0, Lcom/ss/android/ttvecamera/b;->C:Landroid/hardware/camera2/CameraManager;

    .line 57
    .line 58
    iget-object v2, p0, Lcom/ss/android/ttvecamera/c;->e:Landroid/os/Handler;

    .line 59
    .line 60
    invoke-direct {p1, p0, v0, v1, v2}, Ll/pqh0;-><init>(Lcom/ss/android/ttvecamera/b;Landroid/content/Context;Landroid/hardware/camera2/CameraManager;Landroid/os/Handler;)V

    .line 61
    .line 62
    .line 63
    iput-object p1, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 64
    .line 65
    :goto_0
    iget-object p1, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 66
    .line 67
    iget-boolean p1, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->k:Z

    .line 68
    .line 69
    if-eqz p1, :cond_3

    .line 70
    .line 71
    iget-object p1, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 72
    .line 73
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->D()Landroid/os/Handler;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    goto :goto_1

    .line 78
    :cond_3
    iget-object p1, p0, Lcom/ss/android/ttvecamera/c;->e:Landroid/os/Handler;

    .line 79
    .line 80
    :goto_1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 81
    .line 82
    instance-of v1, v0, Ll/pqh0;

    .line 83
    .line 84
    if-eqz v1, :cond_4

    .line 85
    .line 86
    check-cast v0, Ll/pqh0;

    .line 87
    .line 88
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->f:Landroid/content/Context;

    .line 89
    .line 90
    invoke-virtual {v0, v1, p1}, Ll/pqh0;->C0(Landroid/content/Context;Landroid/os/Handler;)V

    .line 91
    .line 92
    .line 93
    :cond_4
    :try_start_0
    iget-object p1, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 94
    .line 95
    iget v0, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 96
    .line 97
    invoke-virtual {p0, v0}, Lcom/ss/android/ttvecamera/b;->Z0(I)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    iput-object v0, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->H:Ljava/lang/String;

    .line 102
    .line 103
    iget-object p1, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 104
    .line 105
    iget-object v0, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->H:Ljava/lang/String;

    .line 106
    .line 107
    if-nez v0, :cond_5

    .line 108
    .line 109
    goto :goto_2

    .line 110
    :cond_5
    iget-object v1, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 111
    .line 112
    iget p1, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->D:I

    .line 113
    .line 114
    invoke-virtual {v1, v0, p1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->P(Ljava/lang/String;I)I

    .line 115
    .line 116
    .line 117
    move-result p1
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 118
    if-eqz p1, :cond_6

    .line 119
    .line 120
    :goto_2
    return-void

    .line 121
    :catch_0
    move-exception p1

    .line 122
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 123
    .line 124
    .line 125
    :cond_6
    iget-object p1, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 126
    .line 127
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 128
    .line 129
    invoke-virtual {p1, v0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->Z(Ljava/lang/Object;)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/b;->L0()I

    .line 133
    .line 134
    .line 135
    return-void
.end method

.method public O()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/ss/android/ttvecamera/TEFrameSizei;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    iget-object v1, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v2, p0, Lcom/ss/android/ttvecamera/b;->K:Ljava/util/List;

    .line 11
    .line 12
    if-nez v2, :cond_2

    .line 13
    .line 14
    iget-object v2, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->l:Landroid/hardware/camera2/params/StreamConfigurationMap;

    .line 15
    .line 16
    if-nez v2, :cond_1

    .line 17
    .line 18
    sget-object v2, Landroid/hardware/camera2/CameraCharacteristics;->SCALER_STREAM_CONFIGURATION_MAP:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Landroid/hardware/camera2/params/StreamConfigurationMap;

    .line 25
    .line 26
    iput-object v1, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->l:Landroid/hardware/camera2/params/StreamConfigurationMap;

    .line 27
    .line 28
    :cond_1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 29
    .line 30
    iget-object v0, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->l:Landroid/hardware/camera2/params/StreamConfigurationMap;

    .line 31
    .line 32
    const-class v1, Landroid/graphics/SurfaceTexture;

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroid/hardware/camera2/params/StreamConfigurationMap;->getOutputSizes(Ljava/lang/Class;)[Landroid/util/Size;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {v0}, Lcom/ss/android/ttvecamera/f;->i([Landroid/util/Size;)Ljava/util/List;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iput-object v0, p0, Lcom/ss/android/ttvecamera/b;->K:Ljava/util/List;

    .line 43
    .line 44
    :cond_2
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->K:Ljava/util/List;

    .line 45
    .line 46
    return-object p0

    .line 47
    :cond_3
    :goto_0
    const-string v0, "TECamera2"

    .line 48
    .line 49
    const-string v1, "getSupportedPreviewSizes: camera is null."

    .line 50
    .line 51
    invoke-static {v0, v1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 55
    .line 56
    iget-object v2, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 57
    .line 58
    iget v2, v2, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 59
    .line 60
    const/16 v3, -0x1b7

    .line 61
    .line 62
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 63
    .line 64
    invoke-interface {v0, v2, v3, v1, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    const/4 p0, 0x0

    .line 68
    return-object p0
.end method

.method public O0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 2
    .line 3
    iget-boolean v1, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->o0:Z

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    iget v1, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 8
    .line 9
    const/4 v2, 0x2

    .line 10
    if-ne v1, v2, :cond_0

    .line 11
    .line 12
    iget v1, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->B:I

    .line 13
    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    iget-object v1, p0, Lcom/ss/android/ttvecamera/b;->y:Ll/crh0;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 21
    .line 22
    const/4 v2, 0x1

    .line 23
    invoke-virtual {v1, p0, v2}, Ll/crh0;->n(Landroid/hardware/camera2/CameraCharacteristics;I)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const/4 v2, 0x0

    .line 31
    :goto_0
    iput-boolean v2, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->o0:Z

    .line 32
    .line 33
    return-void
.end method

.method public Q()Z
    .locals 5

    .line 1
    const-string v0, "isAutoExposureLockSupported..."

    .line 2
    .line 3
    const-string v1, "TECamera2"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v0, p0, Lcom/ss/android/ttvecamera/b;->z:I

    .line 9
    .line 10
    const/4 v2, 0x1

    .line 11
    const/4 v3, 0x0

    .line 12
    if-ne v0, v2, :cond_0

    .line 13
    .line 14
    const-string p0, "Camera is opening, ignore isAutoExposureLockSupported operation."

    .line 15
    .line 16
    invoke-static {v1, p0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return v3

    .line 20
    :cond_0
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/b;->I0()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_3

    .line 25
    .line 26
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 27
    .line 28
    if-eqz v0, :cond_3

    .line 29
    .line 30
    iget-object v0, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 31
    .line 32
    if-nez v0, :cond_1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    sget-object p0, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_AE_LOCK_AVAILABLE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 36
    .line 37
    invoke-virtual {v0, p0}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    check-cast p0, Ljava/lang/Boolean;

    .line 42
    .line 43
    if-nez p0, :cond_2

    .line 44
    .line 45
    return v3

    .line 46
    :cond_2
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    return p0

    .line 51
    :cond_3
    :goto_0
    const-string v0, "isAutoExposureLockSupported : camera is null."

    .line 52
    .line 53
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 57
    .line 58
    iget-object v2, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 59
    .line 60
    iget v2, v2, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 61
    .line 62
    const/16 v4, -0x1b7

    .line 63
    .line 64
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 65
    .line 66
    invoke-interface {v1, v2, v4, v0, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 67
    .line 68
    .line 69
    return v3
.end method

.method public R()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method

.method public R0()V
    .locals 4

    .line 1
    const-string v0, "TECamera2"

    .line 2
    .line 3
    const-string v1, "create TEVideo2Mode"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Ll/hsh0;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->f:Landroid/content/Context;

    .line 11
    .line 12
    iget-object v2, p0, Lcom/ss/android/ttvecamera/b;->C:Landroid/hardware/camera2/CameraManager;

    .line 13
    .line 14
    iget-object v3, p0, Lcom/ss/android/ttvecamera/c;->e:Landroid/os/Handler;

    .line 15
    .line 16
    invoke-direct {v0, p0, v1, v2, v3}, Ll/hsh0;-><init>(Lcom/ss/android/ttvecamera/b;Landroid/content/Context;Landroid/hardware/camera2/CameraManager;Landroid/os/Handler;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 20
    .line 21
    return-void
.end method

.method public T()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method

.method public T0()Ll/lwk;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->H:Ll/lwk;

    .line 2
    .line 3
    return-object p0
.end method

.method public U()Z
    .locals 5

    .line 1
    const-string v0, "isSupportedExposureCompensation..."

    .line 2
    .line 3
    const-string v1, "TECamera2"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v0, p0, Lcom/ss/android/ttvecamera/b;->z:I

    .line 9
    .line 10
    const/4 v2, 0x1

    .line 11
    const/4 v3, 0x0

    .line 12
    if-ne v0, v2, :cond_0

    .line 13
    .line 14
    const-string p0, "Camera is opening, ignore setExposureCompensation operation."

    .line 15
    .line 16
    invoke-static {v1, p0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return v3

    .line 20
    :cond_0
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/b;->I0()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    iget-object v0, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 31
    .line 32
    if-nez v0, :cond_1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->K:Lcom/ss/android/ttvecamera/TECameraSettings$d;

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/TECameraSettings$d;->a()Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    return p0

    .line 44
    :cond_2
    :goto_0
    const-string v0, "isSupportedExposureCompensation : camera is null."

    .line 45
    .line 46
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 50
    .line 51
    iget-object v2, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 52
    .line 53
    iget v2, v2, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 54
    .line 55
    const/16 v4, -0x1b7

    .line 56
    .line 57
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 58
    .line 59
    invoke-interface {v1, v2, v4, v0, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    return v3
.end method

.method public U0()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/android/ttvecamera/b;->z:I

    .line 2
    .line 3
    return p0
.end method

.method public V()Z
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/b;->I0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "TECamera2"

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-eqz v0, :cond_3

    .line 9
    .line 10
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 11
    .line 12
    if-eqz v0, :cond_3

    .line 13
    .line 14
    iget-object v0, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 15
    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b;->y:Ll/crh0;

    .line 20
    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    const-string v0, "DeviceProxy is null!"

    .line 24
    .line 25
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 29
    .line 30
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 31
    .line 32
    iget v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 33
    .line 34
    const/16 v3, -0x1a1

    .line 35
    .line 36
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 37
    .line 38
    const-string v4, ""

    .line 39
    .line 40
    invoke-interface {v0, v1, v3, v4, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    return v2

    .line 44
    :cond_1
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/c;->A()Ljava/util/Map;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iget-object p0, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 49
    .line 50
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->H:Ljava/lang/String;

    .line 51
    .line 52
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    check-cast p0, Landroid/os/Bundle;

    .line 57
    .line 58
    if-nez p0, :cond_2

    .line 59
    .line 60
    return v2

    .line 61
    :cond_2
    const-string v0, "camera_torch_supported"

    .line 62
    .line 63
    invoke-virtual {p0, v0, v2}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    return p0

    .line 68
    :cond_3
    :goto_0
    const-string v0, "Query torch info failed, you must open camera first."

    .line 69
    .line 70
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 74
    .line 75
    iget-object v3, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 76
    .line 77
    iget v3, v3, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 78
    .line 79
    const/16 v4, -0x1b7

    .line 80
    .line 81
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 82
    .line 83
    invoke-interface {v1, v3, v4, v0, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 84
    .line 85
    .line 86
    return v2
.end method

.method public W(Lcom/ss/android/ttvecamera/TECameraSettings;Lcom/bytedance/bpea/basics/Cert;)I
    .locals 8

    .line 1
    const-string v0, "TECamera2"

    .line 2
    .line 3
    const-string v1, "open: camera face = "

    .line 4
    .line 5
    const-string v2, "TECamera2-open"

    .line 6
    .line 7
    invoke-static {v2}, Ll/dsh0;->a(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-super {p0, p1, p2}, Lcom/ss/android/ttvecamera/c;->W(Lcom/ss/android/ttvecamera/TECameraSettings;Lcom/bytedance/bpea/basics/Cert;)I

    .line 11
    .line 12
    .line 13
    iput-object p2, p0, Lcom/ss/android/ttvecamera/c;->t:Lcom/bytedance/bpea/basics/Cert;

    .line 14
    .line 15
    iput-object p1, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 16
    .line 17
    iget v2, p0, Lcom/ss/android/ttvecamera/b;->z:I

    .line 18
    .line 19
    const/4 v3, 0x4

    .line 20
    if-ne v2, v3, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0, p2}, Lcom/ss/android/ttvecamera/b;->K0(Lcom/bytedance/bpea/basics/Cert;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    const/4 v2, 0x1

    .line 26
    const/4 v4, 0x0

    .line 27
    :try_start_0
    invoke-virtual {p0, v2}, Lcom/ss/android/ttvecamera/b;->a1(I)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, p2}, Lcom/ss/android/ttvecamera/b;->J0(Lcom/bytedance/bpea/basics/Cert;)I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    iget v5, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 35
    .line 36
    iput v5, p0, Lcom/ss/android/ttvecamera/c;->i:I

    .line 37
    .line 38
    new-instance v5, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    invoke-direct {v5, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    iget v6, p0, Lcom/ss/android/ttvecamera/c;->i:I

    .line 44
    .line 45
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    const-string v6, ", ret: "

    .line 49
    .line 50
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v5

    .line 60
    invoke-static {v0, v5}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    const/4 v5, 0x0

    .line 64
    if-eqz v2, :cond_2

    .line 65
    .line 66
    invoke-virtual {p0, v5}, Lcom/ss/android/ttvecamera/b;->a1(I)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0, p2}, Lcom/ss/android/ttvecamera/b;->K0(Lcom/bytedance/bpea/basics/Cert;)V

    .line 70
    .line 71
    .line 72
    iget-object v5, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 73
    .line 74
    if-eqz v5, :cond_1

    .line 75
    .line 76
    iget v6, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 77
    .line 78
    iget-object v7, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 79
    .line 80
    invoke-interface {v5, v6, v2, v4, v7}, Lcom/ss/android/ttvecamera/c$a;->f(IILcom/ss/android/ttvecamera/c;Ljava/lang/Object;)V

    .line 81
    .line 82
    .line 83
    goto :goto_0

    .line 84
    :catchall_0
    move-exception v2

    .line 85
    goto :goto_1

    .line 86
    :cond_1
    :goto_0
    const/4 p0, -0x1

    .line 87
    return p0

    .line 88
    :cond_2
    iget-boolean v2, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->Q:Z

    .line 89
    .line 90
    iput-boolean v2, p0, Lcom/ss/android/ttvecamera/b;->J:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 91
    .line 92
    invoke-static {}, Ll/dsh0;->b()V

    .line 93
    .line 94
    .line 95
    return v5

    .line 96
    :goto_1
    new-instance v5, Ljava/lang/StringBuilder;

    .line 97
    .line 98
    invoke-direct {v5, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    iget v1, p0, Lcom/ss/android/ttvecamera/c;->i:I

    .line 102
    .line 103
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    const-string v1, " failed: "

    .line 107
    .line 108
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    invoke-virtual {v2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    invoke-static {v0, v1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    instance-of v0, v2, Landroid/hardware/camera2/CameraAccessException;

    .line 126
    .line 127
    if-eqz v0, :cond_3

    .line 128
    .line 129
    check-cast v2, Landroid/hardware/camera2/CameraAccessException;

    .line 130
    .line 131
    invoke-direct {p0, v2}, Lcom/ss/android/ttvecamera/b;->P0(Landroid/hardware/camera2/CameraAccessException;)I

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    goto :goto_2

    .line 136
    :cond_3
    instance-of v0, v2, Ljava/lang/IllegalArgumentException;

    .line 137
    .line 138
    if-eqz v0, :cond_4

    .line 139
    .line 140
    const/16 v0, -0x195

    .line 141
    .line 142
    goto :goto_2

    .line 143
    :cond_4
    instance-of v0, v2, Ljava/lang/SecurityException;

    .line 144
    .line 145
    if-eqz v0, :cond_5

    .line 146
    .line 147
    const/16 v0, -0x198

    .line 148
    .line 149
    goto :goto_2

    .line 150
    :cond_5
    const/16 v0, -0x191

    .line 151
    .line 152
    :goto_2
    invoke-virtual {p0, v3}, Lcom/ss/android/ttvecamera/b;->a1(I)V

    .line 153
    .line 154
    .line 155
    invoke-virtual {p0, p2}, Lcom/ss/android/ttvecamera/b;->K0(Lcom/bytedance/bpea/basics/Cert;)V

    .line 156
    .line 157
    .line 158
    iget-object p2, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 159
    .line 160
    if-eqz p2, :cond_6

    .line 161
    .line 162
    iget p1, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 163
    .line 164
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 165
    .line 166
    invoke-interface {p2, p1, v0, v4, p0}, Lcom/ss/android/ttvecamera/c$a;->f(IILcom/ss/android/ttvecamera/c;Ljava/lang/Object;)V

    .line 167
    .line 168
    .line 169
    :cond_6
    return v0
.end method

.method public W0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->y:Ll/crh0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/crh0;->s()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public X0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 2
    .line 3
    iget-boolean v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->k:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->M:Landroid/os/ConditionVariable;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/os/ConditionVariable;->open()V

    .line 10
    .line 11
    .line 12
    const-string p0, "TECamera2"

    .line 13
    .line 14
    const-string v0, "open camera-operation lock"

    .line 15
    .line 16
    invoke-static {p0, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public Y0()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->T()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public Z(Lcom/ss/android/ttvecamera/TECameraSettings$n;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/b;->I0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "TECamera2"

    .line 6
    .line 7
    if-eqz v0, :cond_3

    .line 8
    .line 9
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 10
    .line 11
    if-eqz v0, :cond_3

    .line 12
    .line 13
    iget-object v0, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object v2, p0, Lcom/ss/android/ttvecamera/b;->y:Ll/crh0;

    .line 19
    .line 20
    if-nez v2, :cond_1

    .line 21
    .line 22
    const-string p1, "DeviceProxy is null!"

    .line 23
    .line 24
    invoke-static {v1, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 28
    .line 29
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 30
    .line 31
    iget v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 32
    .line 33
    const/16 v1, -0x1a4

    .line 34
    .line 35
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 36
    .line 37
    const-string v2, ""

    .line 38
    .line 39
    invoke-interface {p1, v0, v1, v2, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_1
    invoke-virtual {v2, v0}, Ll/crh0;->f(Landroid/hardware/camera2/CameraCharacteristics;)F

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-eqz p1, :cond_2

    .line 48
    .line 49
    invoke-interface {p1, p0}, Lcom/ss/android/ttvecamera/TECameraSettings$n;->a(F)V

    .line 50
    .line 51
    .line 52
    :cond_2
    return-void

    .line 53
    :cond_3
    :goto_0
    const-string p1, "queryShaderZoomStep: camera is null."

    .line 54
    .line 55
    invoke-static {v1, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 59
    .line 60
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 61
    .line 62
    iget v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 63
    .line 64
    const/16 v2, -0x1b7

    .line 65
    .line 66
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 67
    .line 68
    invoke-interface {v0, v1, v2, p1, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public Z0(I)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/hardware/camera2/CameraAccessException;
        }
    .end annotation

    .line 1
    iget-object p1, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 4
    .line 5
    iget p0, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->V(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public a()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/b;->I0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string p0, "TECamera2"

    .line 8
    .line 9
    const-string v0, "Device is not ready."

    .line 10
    .line 11
    invoke-static {p0, v0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f()V

    .line 20
    .line 21
    .line 22
    :cond_1
    return-void
.end method

.method public a0(Lcom/ss/android/ttvecamera/TECameraSettings$p;Z)V
    .locals 10

    .line 1
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/b;->I0()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    const-string v0, "TECamera2"

    .line 6
    .line 7
    if-eqz p2, :cond_4

    .line 8
    .line 9
    iget-object p2, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 10
    .line 11
    if-eqz p2, :cond_4

    .line 12
    .line 13
    iget-object p2, p2, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 14
    .line 15
    if-nez p2, :cond_0

    .line 16
    .line 17
    goto :goto_2

    .line 18
    :cond_0
    iget-object v1, p0, Lcom/ss/android/ttvecamera/b;->y:Ll/crh0;

    .line 19
    .line 20
    if-nez v1, :cond_1

    .line 21
    .line 22
    const-string p1, "DeviceProxy is null!"

    .line 23
    .line 24
    invoke-static {v0, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 28
    .line 29
    iget-object p2, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 30
    .line 31
    iget p2, p2, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 32
    .line 33
    const/16 v0, -0x1a4

    .line 34
    .line 35
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 36
    .line 37
    const-string v1, ""

    .line 38
    .line 39
    invoke-interface {p1, p2, v0, v1, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_1
    iget-object v2, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 44
    .line 45
    iget v3, v2, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 46
    .line 47
    iget v2, v2, Lcom/ss/android/ttvecamera/TECameraSettings;->p:F

    .line 48
    .line 49
    invoke-virtual {v1, p2, v3, v2}, Ll/crh0;->e(Landroid/hardware/camera2/CameraCharacteristics;IF)F

    .line 50
    .line 51
    .line 52
    move-result v8

    .line 53
    iput v8, p0, Lcom/ss/android/ttvecamera/c;->l:F

    .line 54
    .line 55
    new-instance p2, Ljava/lang/StringBuilder;

    .line 56
    .line 57
    const-string v1, "zoom: "

    .line 58
    .line 59
    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p2, v8}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    const-string v1, ", factor = "

    .line 66
    .line 67
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 71
    .line 72
    iget v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->p:F

    .line 73
    .line 74
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p2

    .line 81
    invoke-static {v0, p2}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    if-eqz p1, :cond_3

    .line 85
    .line 86
    new-instance v9, Ljava/util/ArrayList;

    .line 87
    .line 88
    const/4 p2, 0x1

    .line 89
    invoke-direct {v9, p2}, Ljava/util/ArrayList;-><init>(I)V

    .line 90
    .line 91
    .line 92
    const/high16 v0, 0x42c80000    # 100.0f

    .line 93
    .line 94
    mul-float/2addr v0, v8

    .line 95
    float-to-int v0, v0

    .line 96
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-interface {v9, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    iget-object p0, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 104
    .line 105
    iget v5, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 106
    .line 107
    const/4 p0, 0x0

    .line 108
    cmpl-float p0, v8, p0

    .line 109
    .line 110
    if-lez p0, :cond_2

    .line 111
    .line 112
    :goto_0
    move v6, p2

    .line 113
    goto :goto_1

    .line 114
    :cond_2
    const/4 p2, 0x0

    .line 115
    goto :goto_0

    .line 116
    :goto_1
    const/4 v7, 0x0

    .line 117
    move-object v4, p1

    .line 118
    invoke-interface/range {v4 .. v9}, Lcom/ss/android/ttvecamera/TECameraSettings$p;->onZoomSupport(IZZFLjava/util/List;)V

    .line 119
    .line 120
    .line 121
    :cond_3
    return-void

    .line 122
    :cond_4
    :goto_2
    const-string p1, "queryZoomAbility: camera is null."

    .line 123
    .line 124
    invoke-static {v0, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    iget-object p2, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 128
    .line 129
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 130
    .line 131
    iget v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 132
    .line 133
    const/16 v1, -0x1b7

    .line 134
    .line 135
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 136
    .line 137
    invoke-interface {p2, v0, v1, p1, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 138
    .line 139
    .line 140
    return-void
.end method

.method public a1(I)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/ss/android/ttvecamera/b;->z:I

    .line 2
    .line 3
    const-string v1, "TECamera2"

    .line 4
    .line 5
    if-ne v0, p1, :cond_0

    .line 6
    .line 7
    new-instance p0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v0, "No need update state: "

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
    invoke-static {v1, p0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    const-string v2, "[updateSessionState]: "

    .line 28
    .line 29
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget v2, p0, Lcom/ss/android/ttvecamera/b;->z:I

    .line 33
    .line 34
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string v2, " -> "

    .line 38
    .line 39
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    iput p1, p0, Lcom/ss/android/ttvecamera/b;->z:I

    .line 53
    .line 54
    return-void
.end method

.method public b1()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 2
    .line 3
    iget-boolean v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->k:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b;->M:Landroid/os/ConditionVariable;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/os/ConditionVariable;->close()V

    .line 10
    .line 11
    .line 12
    const-string v0, "block camera-operation start..."

    .line 13
    .line 14
    const-string v1, "TECamera2"

    .line 15
    .line 16
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->M:Landroid/os/ConditionVariable;

    .line 20
    .line 21
    const-wide/16 v2, 0x3e8

    .line 22
    .line 23
    invoke-virtual {p0, v2, v3}, Landroid/os/ConditionVariable;->block(J)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    new-instance v0, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    const-string v2, "block camera-operation end...result = "

    .line 30
    .line 31
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-static {v1, p0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method

.method public c()V
    .locals 4

    .line 1
    iget v0, p0, Lcom/ss/android/ttvecamera/b;->z:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const-string v2, "TECamera2"

    .line 5
    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    const-string p0, "Camera is opening, ignore cancelAutoFocus operation."

    .line 9
    .line 10
    invoke-static {v2, p0}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/b;->I0()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_2

    .line 19
    .line 20
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 21
    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j()I

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_2
    :goto_0
    const-string v0, "cancelFocus : camera is null."

    .line 30
    .line 31
    invoke-static {v2, v0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 35
    .line 36
    iget-object v2, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 37
    .line 38
    iget v2, v2, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 39
    .line 40
    const/16 v3, -0x1b7

    .line 41
    .line 42
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 43
    .line 44
    invoke-interface {v1, v2, v3, v0, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public d(Ll/hj3;Lcom/ss/android/ttvecamera/TECameraSettings$c;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 2
    .line 3
    iget p0, p0, Lcom/ss/android/ttvecamera/c;->i:I

    .line 4
    .line 5
    invoke-virtual {v0, p1, p0, p2}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->o(Ll/hj3;ILcom/ss/android/ttvecamera/TECameraSettings$c;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public f(Lcom/bytedance/bpea/basics/Cert;)V
    .locals 2

    .line 1
    const-string v0, "TECamera2"

    .line 2
    .line 3
    const-string v1, "close..."

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v0, p0, Lcom/ss/android/ttvecamera/b;->z:I

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    if-ne v0, v1, :cond_0

    .line 12
    .line 13
    iget-boolean p1, p0, Lcom/ss/android/ttvecamera/b;->J:Z

    .line 14
    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/b;->I:Z

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-virtual {p0, p1}, Lcom/ss/android/ttvecamera/b;->K0(Lcom/bytedance/bpea/basics/Cert;)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 24
    .line 25
    if-eqz p0, :cond_1

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->p()V

    .line 28
    .line 29
    .line 30
    :cond_1
    return-void
.end method

.method public f0(F)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setAperture : "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "TECamera2"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget v0, p0, Lcom/ss/android/ttvecamera/b;->z:I

    .line 21
    .line 22
    const/4 v2, 0x1

    .line 23
    if-ne v0, v2, :cond_0

    .line 24
    .line 25
    const-string p0, "Camera is opening, ignore setAperture operation."

    .line 26
    .line 27
    invoke-static {v1, p0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/b;->I0()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 38
    .line 39
    if-nez v0, :cond_1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    invoke-virtual {v0, p1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->W(F)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_2
    :goto_0
    const-string p1, "setAperture : camera is null."

    .line 47
    .line 48
    invoke-static {v1, p1}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 52
    .line 53
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 54
    .line 55
    iget v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 56
    .line 57
    const/16 v2, -0x1b7

    .line 58
    .line 59
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 60
    .line 61
    invoke-interface {v0, v1, v2, p1, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public g()V
    .locals 22

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    const-string v0, "camera_id"

    .line 4
    .line 5
    const-string v2, "TECamera2-collectCameraCapabilities"

    .line 6
    .line 7
    invoke-static {v2}, Ll/dsh0;->a(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1}, Lcom/ss/android/ttvecamera/c;->S()Z

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    if-nez v2, :cond_0

    .line 15
    .line 16
    invoke-static {}, Ll/dsh0;->b()V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 21
    .line 22
    .line 23
    move-result-wide v2

    .line 24
    new-instance v4, Ljava/util/HashMap;

    .line 25
    .line 26
    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 27
    .line 28
    .line 29
    iget-object v5, v1, Lcom/ss/android/ttvecamera/b;->C:Landroid/hardware/camera2/CameraManager;

    .line 30
    .line 31
    const-string v6, "TECamera2"

    .line 32
    .line 33
    const/4 v7, 0x1

    .line 34
    if-eqz v5, :cond_24

    .line 35
    .line 36
    :try_start_0
    iget-object v5, v1, Lcom/ss/android/ttvecamera/c;->v:Lorg/json/JSONObject;

    .line 37
    .line 38
    iget-object v8, v1, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 39
    .line 40
    iget-object v8, v8, Lcom/ss/android/ttvecamera/TECameraSettings;->H:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v5, v0, v8}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 43
    .line 44
    .line 45
    iget-object v5, v1, Lcom/ss/android/ttvecamera/b;->y:Ll/crh0;

    .line 46
    .line 47
    if-eqz v5, :cond_1

    .line 48
    .line 49
    iget-object v8, v1, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 50
    .line 51
    iget-object v8, v8, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 52
    .line 53
    iget-object v9, v1, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 54
    .line 55
    iget v10, v9, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 56
    .line 57
    iget v9, v9, Lcom/ss/android/ttvecamera/TECameraSettings;->p:F

    .line 58
    .line 59
    invoke-virtual {v5, v8, v10, v9}, Ll/crh0;->e(Landroid/hardware/camera2/CameraCharacteristics;IF)F

    .line 60
    .line 61
    .line 62
    move-result v5

    .line 63
    iget-object v8, v1, Lcom/ss/android/ttvecamera/c;->v:Lorg/json/JSONObject;

    .line 64
    .line 65
    const-string v9, "camera_zoom_max_ability"

    .line 66
    .line 67
    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 68
    .line 69
    .line 70
    move-result-object v5

    .line 71
    invoke-virtual {v8, v9, v5}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 72
    .line 73
    .line 74
    goto :goto_0

    .line 75
    :catch_0
    move-exception v0

    .line 76
    move-wide/from16 v16, v2

    .line 77
    .line 78
    goto/16 :goto_11

    .line 79
    .line 80
    :catch_1
    move-exception v0

    .line 81
    move-wide/from16 v16, v2

    .line 82
    .line 83
    goto/16 :goto_12

    .line 84
    .line 85
    :cond_1
    :goto_0
    new-instance v5, Lorg/json/JSONArray;

    .line 86
    .line 87
    invoke-direct {v5}, Lorg/json/JSONArray;-><init>()V

    .line 88
    .line 89
    .line 90
    iget-object v8, v1, Lcom/ss/android/ttvecamera/b;->C:Landroid/hardware/camera2/CameraManager;

    .line 91
    .line 92
    invoke-virtual {v8}, Landroid/hardware/camera2/CameraManager;->getCameraIdList()[Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v8

    .line 96
    array-length v9, v8

    .line 97
    const/4 v11, 0x0

    .line 98
    :goto_1
    if-ge v11, v9, :cond_1c

    .line 99
    .line 100
    aget-object v12, v8, v11

    .line 101
    .line 102
    new-instance v13, Lorg/json/JSONObject;

    .line 103
    .line 104
    invoke-direct {v13}, Lorg/json/JSONObject;-><init>()V

    .line 105
    .line 106
    .line 107
    iget-object v14, v1, Lcom/ss/android/ttvecamera/b;->C:Landroid/hardware/camera2/CameraManager;

    .line 108
    .line 109
    invoke-virtual {v14, v12}, Landroid/hardware/camera2/CameraManager;->getCameraCharacteristics(Ljava/lang/String;)Landroid/hardware/camera2/CameraCharacteristics;

    .line 110
    .line 111
    .line 112
    move-result-object v14

    .line 113
    if-nez v14, :cond_2

    .line 114
    .line 115
    move-wide/from16 v16, v2

    .line 116
    .line 117
    move-object/from16 v20, v8

    .line 118
    .line 119
    move/from16 v21, v9

    .line 120
    .line 121
    goto/16 :goto_d

    .line 122
    .line 123
    :cond_2
    invoke-virtual {v13, v0, v12}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 124
    .line 125
    .line 126
    const-string v15, "camera_facing"

    .line 127
    .line 128
    sget-object v10, Landroid/hardware/camera2/CameraCharacteristics;->LENS_FACING:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 129
    .line 130
    invoke-virtual {v14, v10}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    move-result-object v10

    .line 134
    check-cast v10, Ljava/lang/Integer;

    .line 135
    .line 136
    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    .line 137
    .line 138
    .line 139
    move-result v10

    .line 140
    if-ne v10, v7, :cond_3

    .line 141
    .line 142
    const/4 v10, 0x0

    .line 143
    goto :goto_2

    .line 144
    :cond_3
    move v10, v7

    .line 145
    :goto_2
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 146
    .line 147
    .line 148
    move-result-object v10

    .line 149
    invoke-virtual {v13, v15, v10}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 150
    .line 151
    .line 152
    sget-object v10, Landroid/hardware/camera2/CameraCharacteristics;->REQUEST_AVAILABLE_CAPABILITIES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 153
    .line 154
    invoke-virtual {v14, v10}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    move-result-object v10

    .line 158
    check-cast v10, [I

    .line 159
    .line 160
    if-eqz v10, :cond_a

    .line 161
    .line 162
    new-instance v15, Ljava/util/ArrayList;

    .line 163
    .line 164
    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    .line 165
    .line 166
    .line 167
    array-length v7, v10
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 168
    move-wide/from16 v16, v2

    .line 169
    .line 170
    const/4 v2, 0x0

    .line 171
    :goto_3
    if-ge v2, v7, :cond_4

    .line 172
    .line 173
    :try_start_1
    aget v3, v10, v2

    .line 174
    .line 175
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 176
    .line 177
    .line 178
    move-result-object v3

    .line 179
    invoke-interface {v15, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 180
    .line 181
    .line 182
    add-int/lit8 v2, v2, 0x1

    .line 183
    .line 184
    goto :goto_3

    .line 185
    :catch_2
    move-exception v0

    .line 186
    goto/16 :goto_11

    .line 187
    .line 188
    :catch_3
    move-exception v0

    .line 189
    goto/16 :goto_12

    .line 190
    .line 191
    :cond_4
    sget-object v2, Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector;->d:Ljava/util/Map;

    .line 192
    .line 193
    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 194
    .line 195
    .line 196
    move-result-object v2

    .line 197
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 198
    .line 199
    .line 200
    move-result-object v2

    .line 201
    :goto_4
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 202
    .line 203
    .line 204
    move-result v3

    .line 205
    if-eqz v3, :cond_b

    .line 206
    .line 207
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 208
    .line 209
    .line 210
    move-result-object v3

    .line 211
    check-cast v3, Ljava/lang/Integer;

    .line 212
    .line 213
    sget-object v7, Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector;->d:Ljava/util/Map;

    .line 214
    .line 215
    invoke-interface {v7, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 216
    .line 217
    .line 218
    move-result-object v7

    .line 219
    check-cast v7, Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$Capability;

    .line 220
    .line 221
    if-eqz v7, :cond_8

    .line 222
    .line 223
    invoke-interface {v4, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 224
    .line 225
    .line 226
    move-result-object v10

    .line 227
    if-nez v10, :cond_5

    .line 228
    .line 229
    new-instance v10, Ljava/util/HashMap;

    .line 230
    .line 231
    invoke-direct {v10}, Ljava/util/HashMap;-><init>()V

    .line 232
    .line 233
    .line 234
    invoke-interface {v4, v7, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 235
    .line 236
    .line 237
    :cond_5
    invoke-interface {v4, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 238
    .line 239
    .line 240
    move-result-object v10

    .line 241
    check-cast v10, Ljava/util/Map;

    .line 242
    .line 243
    invoke-interface {v15, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 244
    .line 245
    .line 246
    move-result v18

    .line 247
    move-object/from16 v19, v2

    .line 248
    .line 249
    invoke-static/range {v18 .. v18}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 250
    .line 251
    .line 252
    move-result-object v2

    .line 253
    invoke-interface {v10, v12, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 254
    .line 255
    .line 256
    sget-object v2, Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$Capability;->DEPTH_OUTPUT:Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$Capability;

    .line 257
    .line 258
    invoke-virtual {v7, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 259
    .line 260
    .line 261
    move-result v2

    .line 262
    if-eqz v2, :cond_6

    .line 263
    .line 264
    const-string v2, "depth_out_put"

    .line 265
    .line 266
    invoke-interface {v15, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 267
    .line 268
    .line 269
    move-result v10

    .line 270
    invoke-static {v10}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 271
    .line 272
    .line 273
    move-result-object v10

    .line 274
    invoke-virtual {v13, v2, v10}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 275
    .line 276
    .line 277
    :cond_6
    sget-object v2, Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$Capability;->MANUAL_3A:Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$Capability;

    .line 278
    .line 279
    invoke-virtual {v7, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 280
    .line 281
    .line 282
    move-result v2

    .line 283
    if-eqz v2, :cond_7

    .line 284
    .line 285
    const-string v2, "manual_3A"

    .line 286
    .line 287
    invoke-interface {v15, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 288
    .line 289
    .line 290
    move-result v10

    .line 291
    invoke-virtual {v13, v2, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 292
    .line 293
    .line 294
    :cond_7
    sget-object v2, Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$Capability;->LOGICAL_MULTI_CAMERA:Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$Capability;

    .line 295
    .line 296
    invoke-virtual {v7, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 297
    .line 298
    .line 299
    move-result v2

    .line 300
    if-eqz v2, :cond_9

    .line 301
    .line 302
    const-string v2, "logical_multi_Camera"

    .line 303
    .line 304
    invoke-interface {v15, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 305
    .line 306
    .line 307
    move-result v3

    .line 308
    invoke-virtual {v13, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 309
    .line 310
    .line 311
    goto :goto_5

    .line 312
    :cond_8
    move-object/from16 v19, v2

    .line 313
    .line 314
    :cond_9
    :goto_5
    move-object/from16 v2, v19

    .line 315
    .line 316
    goto :goto_4

    .line 317
    :cond_a
    move-wide/from16 v16, v2

    .line 318
    .line 319
    :cond_b
    sget-object v2, Landroid/hardware/camera2/CameraCharacteristics;->SCALER_STREAM_CONFIGURATION_MAP:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 320
    .line 321
    invoke-virtual {v14, v2}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 322
    .line 323
    .line 324
    move-result-object v2

    .line 325
    check-cast v2, Landroid/hardware/camera2/params/StreamConfigurationMap;

    .line 326
    .line 327
    if-eqz v2, :cond_11

    .line 328
    .line 329
    invoke-virtual {v2}, Landroid/hardware/camera2/params/StreamConfigurationMap;->getHighSpeedVideoFpsRanges()[Landroid/util/Range;

    .line 330
    .line 331
    .line 332
    move-result-object v3

    .line 333
    if-eqz v3, :cond_e

    .line 334
    .line 335
    array-length v7, v3

    .line 336
    if-eqz v7, :cond_e

    .line 337
    .line 338
    sget-object v7, Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$Capability;->HIGH_SPEED_VIDEO_FPS_RANGE:Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$Capability;

    .line 339
    .line 340
    invoke-interface {v4, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 341
    .line 342
    .line 343
    move-result-object v10

    .line 344
    if-nez v10, :cond_c

    .line 345
    .line 346
    new-instance v10, Ljava/util/HashMap;

    .line 347
    .line 348
    invoke-direct {v10}, Ljava/util/HashMap;-><init>()V

    .line 349
    .line 350
    .line 351
    invoke-interface {v4, v7, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 352
    .line 353
    .line 354
    :cond_c
    invoke-interface {v4, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 355
    .line 356
    .line 357
    move-result-object v7

    .line 358
    check-cast v7, Ljava/util/Map;

    .line 359
    .line 360
    invoke-static {v3}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 361
    .line 362
    .line 363
    move-result-object v10

    .line 364
    invoke-interface {v7, v12, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 365
    .line 366
    .line 367
    new-instance v7, Lorg/json/JSONArray;

    .line 368
    .line 369
    invoke-direct {v7}, Lorg/json/JSONArray;-><init>()V

    .line 370
    .line 371
    .line 372
    array-length v10, v3

    .line 373
    const/4 v15, 0x0

    .line 374
    :goto_6
    if-ge v15, v10, :cond_d

    .line 375
    .line 376
    aget-object v18, v3, v15

    .line 377
    .line 378
    move-object/from16 v19, v3

    .line 379
    .line 380
    new-instance v3, Lorg/json/JSONObject;

    .line 381
    .line 382
    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 383
    .line 384
    .line 385
    move-object/from16 v20, v8

    .line 386
    .line 387
    const-string v8, "high_fps_min"

    .line 388
    .line 389
    move/from16 v21, v9

    .line 390
    .line 391
    invoke-virtual/range {v18 .. v18}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    .line 392
    .line 393
    .line 394
    move-result-object v9

    .line 395
    invoke-virtual {v3, v8, v9}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 396
    .line 397
    .line 398
    const-string v8, "high_fps_max"

    .line 399
    .line 400
    invoke-virtual/range {v18 .. v18}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    .line 401
    .line 402
    .line 403
    move-result-object v9

    .line 404
    invoke-virtual {v3, v8, v9}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 405
    .line 406
    .line 407
    invoke-virtual {v7, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 408
    .line 409
    .line 410
    add-int/lit8 v15, v15, 0x1

    .line 411
    .line 412
    move-object/from16 v3, v19

    .line 413
    .line 414
    move-object/from16 v8, v20

    .line 415
    .line 416
    move/from16 v9, v21

    .line 417
    .line 418
    goto :goto_6

    .line 419
    :cond_d
    move-object/from16 v20, v8

    .line 420
    .line 421
    move/from16 v21, v9

    .line 422
    .line 423
    const-string v3, "high_speed_fps_range"

    .line 424
    .line 425
    invoke-virtual {v13, v3, v7}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 426
    .line 427
    .line 428
    goto :goto_7

    .line 429
    :cond_e
    move-object/from16 v20, v8

    .line 430
    .line 431
    move/from16 v21, v9

    .line 432
    .line 433
    :goto_7
    const-class v3, Landroid/graphics/SurfaceTexture;

    .line 434
    .line 435
    invoke-virtual {v2, v3}, Landroid/hardware/camera2/params/StreamConfigurationMap;->getOutputSizes(Ljava/lang/Class;)[Landroid/util/Size;

    .line 436
    .line 437
    .line 438
    move-result-object v2

    .line 439
    sget-object v3, Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$Capability;->PREVIEW_SIZE:Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$Capability;

    .line 440
    .line 441
    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 442
    .line 443
    .line 444
    move-result-object v7

    .line 445
    if-nez v7, :cond_f

    .line 446
    .line 447
    new-instance v7, Ljava/util/HashMap;

    .line 448
    .line 449
    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 450
    .line 451
    .line 452
    invoke-interface {v4, v3, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 453
    .line 454
    .line 455
    :cond_f
    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 456
    .line 457
    .line 458
    move-result-object v3

    .line 459
    check-cast v3, Ljava/util/Map;

    .line 460
    .line 461
    invoke-static {v2}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 462
    .line 463
    .line 464
    move-result-object v7

    .line 465
    invoke-interface {v3, v12, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 466
    .line 467
    .line 468
    new-instance v3, Lorg/json/JSONArray;

    .line 469
    .line 470
    invoke-direct {v3}, Lorg/json/JSONArray;-><init>()V

    .line 471
    .line 472
    .line 473
    if-eqz v2, :cond_12

    .line 474
    .line 475
    array-length v7, v2

    .line 476
    if-lez v7, :cond_12

    .line 477
    .line 478
    array-length v7, v2

    .line 479
    const/4 v8, 0x0

    .line 480
    :goto_8
    if-ge v8, v7, :cond_10

    .line 481
    .line 482
    aget-object v9, v2, v8

    .line 483
    .line 484
    new-instance v10, Lorg/json/JSONObject;

    .line 485
    .line 486
    invoke-direct {v10}, Lorg/json/JSONObject;-><init>()V

    .line 487
    .line 488
    .line 489
    const-string v15, "width"

    .line 490
    .line 491
    invoke-virtual {v9}, Landroid/util/Size;->getWidth()I

    .line 492
    .line 493
    .line 494
    move-result v18

    .line 495
    move-object/from16 v19, v2

    .line 496
    .line 497
    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 498
    .line 499
    .line 500
    move-result-object v2

    .line 501
    invoke-virtual {v10, v15, v2}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 502
    .line 503
    .line 504
    const-string v2, "height"

    .line 505
    .line 506
    invoke-virtual {v9}, Landroid/util/Size;->getHeight()I

    .line 507
    .line 508
    .line 509
    move-result v9

    .line 510
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 511
    .line 512
    .line 513
    move-result-object v9

    .line 514
    invoke-virtual {v10, v2, v9}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 515
    .line 516
    .line 517
    invoke-virtual {v3, v10}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 518
    .line 519
    .line 520
    add-int/lit8 v8, v8, 0x1

    .line 521
    .line 522
    move-object/from16 v2, v19

    .line 523
    .line 524
    goto :goto_8

    .line 525
    :cond_10
    const-string v2, "preview_size_list"

    .line 526
    .line 527
    invoke-virtual {v13, v2, v3}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 528
    .line 529
    .line 530
    goto :goto_9

    .line 531
    :cond_11
    move-object/from16 v20, v8

    .line 532
    .line 533
    move/from16 v21, v9

    .line 534
    .line 535
    :cond_12
    :goto_9
    sget-object v2, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_AE_AVAILABLE_TARGET_FPS_RANGES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 536
    .line 537
    invoke-virtual {v14, v2}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 538
    .line 539
    .line 540
    move-result-object v2

    .line 541
    check-cast v2, [Landroid/util/Range;

    .line 542
    .line 543
    sget-object v3, Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$Capability;->FPS_RANGE:Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$Capability;

    .line 544
    .line 545
    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 546
    .line 547
    .line 548
    move-result-object v7

    .line 549
    if-nez v7, :cond_13

    .line 550
    .line 551
    new-instance v7, Ljava/util/HashMap;

    .line 552
    .line 553
    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 554
    .line 555
    .line 556
    invoke-interface {v4, v3, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 557
    .line 558
    .line 559
    :cond_13
    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 560
    .line 561
    .line 562
    move-result-object v3

    .line 563
    check-cast v3, Ljava/util/Map;

    .line 564
    .line 565
    invoke-static {v2}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 566
    .line 567
    .line 568
    move-result-object v7

    .line 569
    invoke-interface {v3, v12, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 570
    .line 571
    .line 572
    new-instance v3, Lorg/json/JSONArray;

    .line 573
    .line 574
    invoke-direct {v3}, Lorg/json/JSONArray;-><init>()V

    .line 575
    .line 576
    .line 577
    if-eqz v2, :cond_15

    .line 578
    .line 579
    array-length v7, v2

    .line 580
    if-lez v7, :cond_15

    .line 581
    .line 582
    array-length v7, v2

    .line 583
    const/4 v8, 0x0

    .line 584
    :goto_a
    if-ge v8, v7, :cond_14

    .line 585
    .line 586
    aget-object v9, v2, v8

    .line 587
    .line 588
    new-instance v10, Lorg/json/JSONObject;

    .line 589
    .line 590
    invoke-direct {v10}, Lorg/json/JSONObject;-><init>()V

    .line 591
    .line 592
    .line 593
    const-string v15, "fps_min"

    .line 594
    .line 595
    move-object/from16 v18, v2

    .line 596
    .line 597
    invoke-virtual {v9}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    .line 598
    .line 599
    .line 600
    move-result-object v2

    .line 601
    invoke-virtual {v10, v15, v2}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 602
    .line 603
    .line 604
    const-string v2, "fps_high"

    .line 605
    .line 606
    invoke-virtual {v9}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    .line 607
    .line 608
    .line 609
    move-result-object v9

    .line 610
    invoke-virtual {v10, v2, v9}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 611
    .line 612
    .line 613
    invoke-virtual {v3, v10}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 614
    .line 615
    .line 616
    add-int/lit8 v8, v8, 0x1

    .line 617
    .line 618
    move-object/from16 v2, v18

    .line 619
    .line 620
    goto :goto_a

    .line 621
    :cond_14
    const-string v2, "fps_range_List"

    .line 622
    .line 623
    invoke-virtual {v13, v2, v3}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 624
    .line 625
    .line 626
    :cond_15
    sget-object v2, Landroid/hardware/camera2/CameraCharacteristics;->LENS_INFO_AVAILABLE_APERTURES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 627
    .line 628
    invoke-virtual {v14, v2}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 629
    .line 630
    .line 631
    move-result-object v2

    .line 632
    check-cast v2, [F

    .line 633
    .line 634
    sget-object v3, Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$Capability;->SUPPORT_APERTURES:Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$Capability;

    .line 635
    .line 636
    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 637
    .line 638
    .line 639
    move-result-object v7

    .line 640
    if-nez v7, :cond_16

    .line 641
    .line 642
    new-instance v7, Ljava/util/HashMap;

    .line 643
    .line 644
    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 645
    .line 646
    .line 647
    invoke-interface {v4, v3, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 648
    .line 649
    .line 650
    :cond_16
    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 651
    .line 652
    .line 653
    move-result-object v3

    .line 654
    check-cast v3, Ljava/util/Map;

    .line 655
    .line 656
    invoke-static {v2}, Ljava/util/Arrays;->toString([F)Ljava/lang/String;

    .line 657
    .line 658
    .line 659
    move-result-object v7

    .line 660
    invoke-interface {v3, v12, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 661
    .line 662
    .line 663
    new-instance v3, Lorg/json/JSONArray;

    .line 664
    .line 665
    invoke-direct {v3}, Lorg/json/JSONArray;-><init>()V

    .line 666
    .line 667
    .line 668
    if-eqz v2, :cond_18

    .line 669
    .line 670
    array-length v7, v2

    .line 671
    if-lez v7, :cond_18

    .line 672
    .line 673
    array-length v7, v2

    .line 674
    const/4 v8, 0x0

    .line 675
    :goto_b
    if-ge v8, v7, :cond_17

    .line 676
    .line 677
    aget v9, v2, v8

    .line 678
    .line 679
    float-to-double v9, v9

    .line 680
    invoke-virtual {v3, v9, v10}, Lorg/json/JSONArray;->put(D)Lorg/json/JSONArray;

    .line 681
    .line 682
    .line 683
    add-int/lit8 v8, v8, 0x1

    .line 684
    .line 685
    goto :goto_b

    .line 686
    :cond_17
    const-string v2, "support_apertures"

    .line 687
    .line 688
    invoke-virtual {v13, v2, v3}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 689
    .line 690
    .line 691
    :cond_18
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 692
    .line 693
    const/16 v3, 0x1f

    .line 694
    .line 695
    if-lt v2, v3, :cond_1b

    .line 696
    .line 697
    iget-object v2, v1, Lcom/ss/android/ttvecamera/b;->C:Landroid/hardware/camera2/CameraManager;

    .line 698
    .line 699
    invoke-static {v2, v12}, Ll/tqh0;->a(Landroid/hardware/camera2/CameraManager;Ljava/lang/String;)Landroid/hardware/camera2/CameraExtensionCharacteristics;

    .line 700
    .line 701
    .line 702
    move-result-object v2

    .line 703
    if-eqz v2, :cond_1b

    .line 704
    .line 705
    invoke-static {v2}, Ll/uqh0;->a(Landroid/hardware/camera2/CameraExtensionCharacteristics;)Ljava/util/List;

    .line 706
    .line 707
    .line 708
    move-result-object v2

    .line 709
    sget-object v3, Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$Capability;->SUPPORT_EXTENSIONS:Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$Capability;

    .line 710
    .line 711
    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 712
    .line 713
    .line 714
    move-result-object v7

    .line 715
    if-nez v7, :cond_19

    .line 716
    .line 717
    new-instance v7, Ljava/util/HashMap;

    .line 718
    .line 719
    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 720
    .line 721
    .line 722
    invoke-interface {v4, v3, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 723
    .line 724
    .line 725
    :cond_19
    if-eqz v2, :cond_1b

    .line 726
    .line 727
    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 728
    .line 729
    .line 730
    move-result-object v3

    .line 731
    check-cast v3, Ljava/util/Map;

    .line 732
    .line 733
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 734
    .line 735
    .line 736
    move-result-object v7

    .line 737
    invoke-interface {v3, v12, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 738
    .line 739
    .line 740
    new-instance v3, Lorg/json/JSONArray;

    .line 741
    .line 742
    invoke-direct {v3}, Lorg/json/JSONArray;-><init>()V

    .line 743
    .line 744
    .line 745
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 746
    .line 747
    .line 748
    move-result v7

    .line 749
    if-lez v7, :cond_1b

    .line 750
    .line 751
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 752
    .line 753
    .line 754
    move-result-object v2

    .line 755
    :goto_c
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 756
    .line 757
    .line 758
    move-result v7

    .line 759
    if-eqz v7, :cond_1a

    .line 760
    .line 761
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 762
    .line 763
    .line 764
    move-result-object v7

    .line 765
    check-cast v7, Ljava/lang/Integer;

    .line 766
    .line 767
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    .line 768
    .line 769
    .line 770
    move-result v7

    .line 771
    invoke-virtual {v3, v7}, Lorg/json/JSONArray;->put(I)Lorg/json/JSONArray;

    .line 772
    .line 773
    .line 774
    goto :goto_c

    .line 775
    :cond_1a
    const-string v2, "support_extensions"

    .line 776
    .line 777
    invoke-virtual {v13, v2, v3}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 778
    .line 779
    .line 780
    :cond_1b
    invoke-virtual {v5, v13}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 781
    .line 782
    .line 783
    :goto_d
    add-int/lit8 v11, v11, 0x1

    .line 784
    .line 785
    move-wide/from16 v2, v16

    .line 786
    .line 787
    move-object/from16 v8, v20

    .line 788
    .line 789
    move/from16 v9, v21

    .line 790
    .line 791
    const/4 v7, 0x1

    .line 792
    goto/16 :goto_1

    .line 793
    .line 794
    :cond_1c
    move-wide/from16 v16, v2

    .line 795
    .line 796
    iget-object v0, v1, Lcom/ss/android/ttvecamera/c;->v:Lorg/json/JSONObject;

    .line 797
    .line 798
    const-string v2, "camera_feature"

    .line 799
    .line 800
    invoke-virtual {v0, v2, v5}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 801
    .line 802
    .line 803
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 804
    .line 805
    const/16 v2, 0x1e

    .line 806
    .line 807
    if-lt v0, v2, :cond_25

    .line 808
    .line 809
    iget-object v0, v1, Lcom/ss/android/ttvecamera/b;->C:Landroid/hardware/camera2/CameraManager;

    .line 810
    .line 811
    invoke-static {v0}, Ll/vqh0;->a(Landroid/hardware/camera2/CameraManager;)Ljava/util/Set;

    .line 812
    .line 813
    .line 814
    move-result-object v0

    .line 815
    new-instance v2, Ljava/util/ArrayList;

    .line 816
    .line 817
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 818
    .line 819
    .line 820
    if-eqz v0, :cond_25

    .line 821
    .line 822
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 823
    .line 824
    .line 825
    move-result-object v0

    .line 826
    :cond_1d
    :goto_e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 827
    .line 828
    .line 829
    move-result v3

    .line 830
    if-eqz v3, :cond_22

    .line 831
    .line 832
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 833
    .line 834
    .line 835
    move-result-object v3

    .line 836
    check-cast v3, Ljava/util/Set;

    .line 837
    .line 838
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 839
    .line 840
    .line 841
    move-result-object v5

    .line 842
    const/4 v7, 0x0

    .line 843
    const/4 v8, 0x0

    .line 844
    :cond_1e
    :goto_f
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 845
    .line 846
    .line 847
    move-result v9

    .line 848
    if-eqz v9, :cond_21

    .line 849
    .line 850
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 851
    .line 852
    .line 853
    move-result-object v9

    .line 854
    check-cast v9, Ljava/lang/String;

    .line 855
    .line 856
    iget-object v10, v1, Lcom/ss/android/ttvecamera/b;->C:Landroid/hardware/camera2/CameraManager;

    .line 857
    .line 858
    invoke-virtual {v10, v9}, Landroid/hardware/camera2/CameraManager;->getCameraCharacteristics(Ljava/lang/String;)Landroid/hardware/camera2/CameraCharacteristics;

    .line 859
    .line 860
    .line 861
    move-result-object v9

    .line 862
    if-nez v9, :cond_1f

    .line 863
    .line 864
    goto :goto_f

    .line 865
    :cond_1f
    sget-object v10, Landroid/hardware/camera2/CameraCharacteristics;->LENS_FACING:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 866
    .line 867
    invoke-virtual {v9, v10}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 868
    .line 869
    .line 870
    move-result-object v11

    .line 871
    check-cast v11, Ljava/lang/Integer;

    .line 872
    .line 873
    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    .line 874
    .line 875
    .line 876
    move-result v11

    .line 877
    const/4 v12, 0x1

    .line 878
    if-ne v11, v12, :cond_20

    .line 879
    .line 880
    const/4 v8, 0x1

    .line 881
    goto :goto_f

    .line 882
    :cond_20
    invoke-virtual {v9, v10}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 883
    .line 884
    .line 885
    move-result-object v9

    .line 886
    check-cast v9, Ljava/lang/Integer;

    .line 887
    .line 888
    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    .line 889
    .line 890
    .line 891
    move-result v9

    .line 892
    if-nez v9, :cond_1e

    .line 893
    .line 894
    const/4 v7, 0x1

    .line 895
    goto :goto_f

    .line 896
    :cond_21
    if-eqz v7, :cond_1d

    .line 897
    .line 898
    if-eqz v8, :cond_1d

    .line 899
    .line 900
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 901
    .line 902
    .line 903
    goto :goto_e

    .line 904
    :cond_22
    sget-object v0, Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$Capability;->FRONT_BACK_MULTICAM_COMBOS:Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$Capability;

    .line 905
    .line 906
    iget-object v3, v1, Lcom/ss/android/ttvecamera/c;->u:Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector;

    .line 907
    .line 908
    new-instance v5, Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$a;

    .line 909
    .line 910
    invoke-virtual {v3, v0}, Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector;->b(Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$Capability;)Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$DataType;

    .line 911
    .line 912
    .line 913
    move-result-object v7

    .line 914
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 915
    .line 916
    .line 917
    move-result-object v8

    .line 918
    invoke-direct {v5, v0, v7, v8}, Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$a;-><init>(Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$Capability;Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$DataType;Ljava/lang/Object;)V

    .line 919
    .line 920
    .line 921
    invoke-virtual {v3, v5}, Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector;->a(Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$a;)V

    .line 922
    .line 923
    .line 924
    new-instance v0, Lorg/json/JSONArray;

    .line 925
    .line 926
    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 927
    .line 928
    .line 929
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 930
    .line 931
    .line 932
    move-result v3

    .line 933
    if-lez v3, :cond_25

    .line 934
    .line 935
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 936
    .line 937
    .line 938
    move-result-object v2

    .line 939
    :goto_10
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 940
    .line 941
    .line 942
    move-result v3

    .line 943
    if-eqz v3, :cond_23

    .line 944
    .line 945
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 946
    .line 947
    .line 948
    move-result-object v3

    .line 949
    check-cast v3, Ljava/util/Set;

    .line 950
    .line 951
    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 952
    .line 953
    .line 954
    goto :goto_10

    .line 955
    :cond_23
    iget-object v2, v1, Lcom/ss/android/ttvecamera/c;->v:Lorg/json/JSONObject;

    .line 956
    .line 957
    const-string v3, "camera_front_back_multicam_combos"

    .line 958
    .line 959
    invoke-virtual {v2, v3, v0}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_2

    .line 960
    .line 961
    .line 962
    goto :goto_13

    .line 963
    :goto_11
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 964
    .line 965
    .line 966
    goto :goto_13

    .line 967
    :goto_12
    const-string v2, "Get Camera Capbilities failed!"

    .line 968
    .line 969
    invoke-static {v6, v2}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 970
    .line 971
    .line 972
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 973
    .line 974
    .line 975
    goto :goto_13

    .line 976
    :cond_24
    move-wide/from16 v16, v2

    .line 977
    .line 978
    :cond_25
    :goto_13
    invoke-interface {v4}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 979
    .line 980
    .line 981
    move-result-object v0

    .line 982
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 983
    .line 984
    .line 985
    move-result-object v0

    .line 986
    :goto_14
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 987
    .line 988
    .line 989
    move-result v2

    .line 990
    if-eqz v2, :cond_26

    .line 991
    .line 992
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 993
    .line 994
    .line 995
    move-result-object v2

    .line 996
    check-cast v2, Ljava/util/Map$Entry;

    .line 997
    .line 998
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 999
    .line 1000
    .line 1001
    move-result-object v3

    .line 1002
    check-cast v3, Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$Capability;

    .line 1003
    .line 1004
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 1005
    .line 1006
    .line 1007
    move-result-object v2

    .line 1008
    iget-object v4, v1, Lcom/ss/android/ttvecamera/c;->u:Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector;

    .line 1009
    .line 1010
    new-instance v5, Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$a;

    .line 1011
    .line 1012
    invoke-virtual {v4, v3}, Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector;->b(Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$Capability;)Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$DataType;

    .line 1013
    .line 1014
    .line 1015
    move-result-object v7

    .line 1016
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 1017
    .line 1018
    .line 1019
    move-result-object v2

    .line 1020
    invoke-direct {v5, v3, v7, v2}, Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$a;-><init>(Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$Capability;Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$DataType;Ljava/lang/Object;)V

    .line 1021
    .line 1022
    .line 1023
    invoke-virtual {v4, v5}, Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector;->a(Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector$a;)V

    .line 1024
    .line 1025
    .line 1026
    goto :goto_14

    .line 1027
    :cond_26
    iget-object v0, v1, Lcom/ss/android/ttvecamera/c;->u:Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector;

    .line 1028
    .line 1029
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/cameracapabilitycollector/TECameraCapabilityCollector;->d()V

    .line 1030
    .line 1031
    .line 1032
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 1033
    .line 1034
    .line 1035
    move-result-wide v2

    .line 1036
    sub-long v2, v2, v16

    .line 1037
    .line 1038
    new-instance v0, Ljava/lang/StringBuilder;

    .line 1039
    .line 1040
    const-string v4, "collectCameraCapabilities consume: "

    .line 1041
    .line 1042
    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1043
    .line 1044
    .line 1045
    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 1046
    .line 1047
    .line 1048
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1049
    .line 1050
    .line 1051
    move-result-object v0

    .line 1052
    invoke-static {v6, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 1053
    .line 1054
    .line 1055
    const-string v0, "te_record_camera_collect_capbilities_cost"

    .line 1056
    .line 1057
    invoke-static {v0, v2, v3}, Ll/hrh0;->b(Ljava/lang/String;J)V

    .line 1058
    .line 1059
    .line 1060
    const/4 v12, 0x1

    .line 1061
    iput-boolean v12, v1, Lcom/ss/android/ttvecamera/c;->w:Z

    .line 1062
    .line 1063
    invoke-static {}, Ll/dsh0;->b()V

    .line 1064
    .line 1065
    .line 1066
    return-void
.end method

.method public g0(Z)V
    .locals 3

    .line 1
    const-string v0, "setAutoExposureLock..."

    .line 2
    .line 3
    const-string v1, "TECamera2"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v0, p0, Lcom/ss/android/ttvecamera/b;->z:I

    .line 9
    .line 10
    const/4 v2, 0x1

    .line 11
    if-ne v0, v2, :cond_0

    .line 12
    .line 13
    const-string p0, "Camera is opening, ignore setAutoExposureLock operation."

    .line 14
    .line 15
    invoke-static {v1, p0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/b;->I0()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_4

    .line 24
    .line 25
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 26
    .line 27
    if-eqz v0, :cond_4

    .line 28
    .line 29
    iget-object v0, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 30
    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_1
    sget-object v2, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_AE_LOCK_AVAILABLE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 35
    .line 36
    invoke-virtual {v0, v2}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Ljava/lang/Boolean;

    .line 41
    .line 42
    if-eqz v0, :cond_3

    .line 43
    .line 44
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-nez v0, :cond_2

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_2
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 52
    .line 53
    invoke-virtual {p0, p1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->X(Z)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_3
    :goto_0
    const-string p1, "Current camera doesn\'t support auto exposure lock."

    .line 58
    .line 59
    invoke-static {v1, p1}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 63
    .line 64
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 65
    .line 66
    const/16 v1, -0x1aa

    .line 67
    .line 68
    invoke-interface {v0, v1, v1, p1, p0}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_4
    :goto_1
    const-string p1, "setAutoExposureLock : camera is null."

    .line 73
    .line 74
    invoke-static {v1, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 78
    .line 79
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 80
    .line 81
    iget v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 82
    .line 83
    const/16 v2, -0x1b7

    .line 84
    .line 85
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 86
    .line 87
    invoke-interface {v0, v1, v2, p1, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public h0(Z)V
    .locals 3

    .line 1
    const-string v0, "setAutoFocusLock..."

    .line 2
    .line 3
    const-string v1, "TECamera2"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v0, p0, Lcom/ss/android/ttvecamera/b;->z:I

    .line 9
    .line 10
    const/4 v2, 0x1

    .line 11
    if-ne v0, v2, :cond_0

    .line 12
    .line 13
    const-string p0, "Camera is opening, ignore setAutoFocusLock operation."

    .line 14
    .line 15
    invoke-static {v1, p0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/b;->I0()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 26
    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    iget-object v2, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 30
    .line 31
    if-nez v2, :cond_1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    invoke-virtual {v0, p1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->Y(Z)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_2
    :goto_0
    const-string p1, "setAutoFocusLock : camera is null."

    .line 39
    .line 40
    invoke-static {v1, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 44
    .line 45
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 46
    .line 47
    iget v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 48
    .line 49
    const/16 v2, -0x1b7

    .line 50
    .line 51
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 52
    .line 53
    invoke-interface {v0, v1, v2, p1, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public i()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/ss/android/ttvecamera/c;->i()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/b;->Y0()V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->H:Ll/lwk;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/lwk;->g()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public j()V
    .locals 4

    .line 1
    iget v0, p0, Lcom/ss/android/ttvecamera/b;->z:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const-string v2, "TECamera2"

    .line 5
    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    const-string p0, "Camera is opening, ignore cancelAutoFocus operation."

    .line 9
    .line 10
    invoke-static {v2, p0}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/b;->I0()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_2

    .line 19
    .line 20
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 21
    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->w()I

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_2
    :goto_0
    const-string v0, "enableCaf : camera is null."

    .line 30
    .line 31
    invoke-static {v2, v0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 35
    .line 36
    iget-object v2, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 37
    .line 38
    iget v2, v2, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 39
    .line 40
    const/16 v3, -0x1b7

    .line 41
    .line 42
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 43
    .line 44
    invoke-interface {v1, v2, v3, v0, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public j0(I)Z
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setExposureCompensation... value: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "TECamera2"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget v0, p0, Lcom/ss/android/ttvecamera/b;->z:I

    .line 21
    .line 22
    const/4 v2, 0x1

    .line 23
    const/4 v3, 0x0

    .line 24
    if-ne v0, v2, :cond_0

    .line 25
    .line 26
    const-string p0, "Camera is opening, ignore setExposureCompensation operation."

    .line 27
    .line 28
    invoke-static {v1, p0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return v3

    .line 32
    :cond_0
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/b;->I0()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_5

    .line 37
    .line 38
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 39
    .line 40
    if-eqz v0, :cond_5

    .line 41
    .line 42
    iget-object v0, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 43
    .line 44
    if-nez v0, :cond_1

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 48
    .line 49
    iget-object v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->K:Lcom/ss/android/ttvecamera/TECameraSettings$d;

    .line 50
    .line 51
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/TECameraSettings$d;->a()Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-nez v0, :cond_2

    .line 56
    .line 57
    const-string p1, "Current camera doesn\'t support setting exposure compensation."

    .line 58
    .line 59
    invoke-static {v1, p1}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 63
    .line 64
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 65
    .line 66
    const/16 v1, -0x19e

    .line 67
    .line 68
    invoke-interface {v0, v1, v1, p1, p0}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 69
    .line 70
    .line 71
    return v3

    .line 72
    :cond_2
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 73
    .line 74
    iget-object v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->K:Lcom/ss/android/ttvecamera/TECameraSettings$d;

    .line 75
    .line 76
    iget v2, v0, Lcom/ss/android/ttvecamera/TECameraSettings$d;->a:I

    .line 77
    .line 78
    if-gt p1, v2, :cond_4

    .line 79
    .line 80
    iget v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings$d;->c:I

    .line 81
    .line 82
    if-ge p1, v0, :cond_3

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_3
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 86
    .line 87
    invoke-virtual {p0, p1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a0(I)Z

    .line 88
    .line 89
    .line 90
    move-result p0

    .line 91
    return p0

    .line 92
    :cond_4
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 93
    .line 94
    const-string v2, "Invalid exposure compensation value: "

    .line 95
    .line 96
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    const-string p1, ", it must between ["

    .line 103
    .line 104
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    iget-object p1, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 108
    .line 109
    iget-object p1, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->K:Lcom/ss/android/ttvecamera/TECameraSettings$d;

    .line 110
    .line 111
    iget p1, p1, Lcom/ss/android/ttvecamera/TECameraSettings$d;->c:I

    .line 112
    .line 113
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    const-string p1, ", "

    .line 117
    .line 118
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    iget-object p1, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 122
    .line 123
    iget-object p1, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->K:Lcom/ss/android/ttvecamera/TECameraSettings$d;

    .line 124
    .line 125
    iget p1, p1, Lcom/ss/android/ttvecamera/TECameraSettings$d;->a:I

    .line 126
    .line 127
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    const-string p1, "]."

    .line 131
    .line 132
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    invoke-static {v1, p1}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 143
    .line 144
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 145
    .line 146
    const/16 v1, -0x19f

    .line 147
    .line 148
    invoke-interface {v0, v1, v1, p1, p0}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 149
    .line 150
    .line 151
    return v3

    .line 152
    :cond_5
    :goto_1
    const-string p1, "setExposureCompensation : camera is null."

    .line 153
    .line 154
    invoke-static {v1, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 158
    .line 159
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 160
    .line 161
    iget v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 162
    .line 163
    const/16 v2, -0x191

    .line 164
    .line 165
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 166
    .line 167
    invoke-interface {v0, v1, v2, p1, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 168
    .line 169
    .line 170
    return v3
.end method

.method public k(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, "TECamera2"

    .line 6
    .line 7
    const-string p1, "enableMulticamZoom failed, mode is null..."

    .line 8
    .line 9
    invoke-static {p0, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {p0, p1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->x(Z)V

    .line 14
    .line 15
    .line 16
    return-void
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
    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

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
    .locals 3

    .line 1
    const-string v0, "TECamera2-fillFeatures"

    .line 2
    .line 3
    invoke-static {v0}, Ll/dsh0;->a(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Lcom/ss/android/ttvecamera/c;->l()Landroid/os/Bundle;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-eqz v0, :cond_2

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/b;->O()Ljava/util/List;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Ljava/util/ArrayList;

    .line 17
    .line 18
    const-string v2, "support_preview_sizes"

    .line 19
    .line 20
    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/b;->N()Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Ljava/util/ArrayList;

    .line 28
    .line 29
    const-string v2, "support_picture_sizes"

    .line 30
    .line 31
    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 32
    .line 33
    .line 34
    invoke-direct {p0}, Lcom/ss/android/ttvecamera/b;->V0()Ljava/util/List;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    check-cast v1, Ljava/util/ArrayList;

    .line 39
    .line 40
    const-string v2, "camera_support_fps_range"

    .line 41
    .line 42
    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 43
    .line 44
    .line 45
    iget-object v1, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 46
    .line 47
    if-eqz v1, :cond_1

    .line 48
    .line 49
    iget-object v1, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 50
    .line 51
    if-eqz v1, :cond_1

    .line 52
    .line 53
    iget-object v2, p0, Lcom/ss/android/ttvecamera/b;->y:Ll/crh0;

    .line 54
    .line 55
    if-eqz v2, :cond_1

    .line 56
    .line 57
    invoke-virtual {v2, v1}, Ll/crh0;->o(Landroid/hardware/camera2/CameraCharacteristics;)Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-eqz v1, :cond_0

    .line 62
    .line 63
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 64
    .line 65
    const/16 v2, 0x1e

    .line 66
    .line 67
    if-lt v1, v2, :cond_0

    .line 68
    .line 69
    const/4 v1, 0x1

    .line 70
    goto :goto_0

    .line 71
    :cond_0
    const/4 v1, 0x0

    .line 72
    :goto_0
    const-string v2, "device_support_multicamera_zoom"

    .line 73
    .line 74
    invoke-virtual {v0, v2, v1}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 75
    .line 76
    .line 77
    iget-object v1, p0, Lcom/ss/android/ttvecamera/b;->y:Ll/crh0;

    .line 78
    .line 79
    iget-object v2, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 80
    .line 81
    iget-object v2, v2, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 82
    .line 83
    invoke-virtual {v1, v2}, Ll/crh0;->t(Landroid/hardware/camera2/CameraCharacteristics;)Z

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    const-string v2, "camera_torch_supported"

    .line 88
    .line 89
    invoke-virtual {v0, v2, v1}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 90
    .line 91
    .line 92
    :cond_1
    const-string v1, "device_support_wide_angle_mode"

    .line 93
    .line 94
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/b;->W0()Z

    .line 95
    .line 96
    .line 97
    move-result p0

    .line 98
    invoke-virtual {v0, v1, p0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 99
    .line 100
    .line 101
    :cond_2
    invoke-static {}, Ll/dsh0;->b()V

    .line 102
    .line 103
    .line 104
    return-object v0
.end method

.method public l0(I)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setISO : "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "TECamera2"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget v0, p0, Lcom/ss/android/ttvecamera/b;->z:I

    .line 21
    .line 22
    const/4 v2, 0x1

    .line 23
    if-ne v0, v2, :cond_0

    .line 24
    .line 25
    const-string p0, "Camera is opening, ignore setISO operation."

    .line 26
    .line 27
    invoke-static {v1, p0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/b;->I0()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 38
    .line 39
    if-nez v0, :cond_1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    invoke-virtual {v0, p1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->d0(I)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_2
    :goto_0
    const-string p1, "setISO : camera is null."

    .line 47
    .line 48
    invoke-static {v1, p1}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 52
    .line 53
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 54
    .line 55
    iget v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 56
    .line 57
    const/16 v2, -0x1b7

    .line 58
    .line 59
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 60
    .line 61
    invoke-interface {v0, v1, v2, p1, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public m(Lcom/ss/android/ttvecamera/TEFocusSettings;)V
    .locals 3

    .line 1
    const-string v0, "setFocusAreas..."

    .line 2
    .line 3
    const-string v1, "TECamera2"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v0, p0, Lcom/ss/android/ttvecamera/b;->z:I

    .line 9
    .line 10
    const/4 v2, 0x3

    .line 11
    if-eq v0, v2, :cond_0

    .line 12
    .line 13
    const-string v0, "Camera is not previewing, ignore setFocusAreas operation."

    .line 14
    .line 15
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/TEFocusSettings;->g()Lcom/ss/android/ttvecamera/TEFocusSettings$b;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iget-object p0, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 23
    .line 24
    iget p0, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    invoke-interface {p1, v1, p0, v0}, Lcom/ss/android/ttvecamera/TEFocusSettings$b;->a(IILjava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/b;->I0()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_3

    .line 36
    .line 37
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 38
    .line 39
    if-nez v0, :cond_1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    invoke-virtual {v0, p1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->z(Lcom/ss/android/ttvecamera/TEFocusSettings;)I

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-eqz p1, :cond_2

    .line 47
    .line 48
    const-string v0, "focusAtPoint : something wrong."

    .line 49
    .line 50
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 54
    .line 55
    const/16 v2, -0x19b

    .line 56
    .line 57
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 58
    .line 59
    invoke-interface {v1, v2, p1, v0, p0}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    :cond_2
    return-void

    .line 63
    :cond_3
    :goto_0
    const-string v0, "focusAtPoint : camera is null."

    .line 64
    .line 65
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/TEFocusSettings;->g()Lcom/ss/android/ttvecamera/TEFocusSettings$b;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 73
    .line 74
    iget v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 75
    .line 76
    const/16 v2, -0x1b7

    .line 77
    .line 78
    invoke-interface {p1, v2, v1, v0}, Lcom/ss/android/ttvecamera/TEFocusSettings$b;->a(IILjava/lang/String;)V

    .line 79
    .line 80
    .line 81
    iget-object p1, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 82
    .line 83
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 84
    .line 85
    iget v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 86
    .line 87
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 88
    .line 89
    invoke-interface {p1, v1, v2, v0, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public m0(F)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/ss/android/ttvecamera/b;->z:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const-string v2, "TECamera2"

    .line 5
    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    const-string p0, "Camera is opening, ignore setManualFocusDistance operation."

    .line 9
    .line 10
    invoke-static {v2, p0}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/b;->I0()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_2

    .line 19
    .line 20
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 21
    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    invoke-virtual {v0, p1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->e0(F)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_2
    :goto_0
    const-string p1, "setManualFocusDistance : camera is null."

    .line 30
    .line 31
    invoke-static {v2, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 35
    .line 36
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 37
    .line 38
    iget v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 39
    .line 40
    const/16 v2, -0x1b7

    .line 41
    .line 42
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 43
    .line 44
    invoke-interface {v0, v1, v2, p1, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 45
    .line 46
    .line 47
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
    iget-object v1, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

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
    const-string v1, "TECamera2"

    .line 21
    .line 22
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 26
    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 30
    .line 31
    invoke-static {p1, v0}, Ll/wqh0;->b(Lcom/bytedance/bpea/basics/Cert;Landroid/hardware/camera2/CameraDevice;)V

    .line 32
    .line 33
    .line 34
    const/4 p1, 0x0

    .line 35
    iput-object p1, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method public n0(II)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, "TECamera2"

    .line 6
    .line 7
    const-string p1, "set picture size failed, no mode..."

    .line 8
    .line 9
    invoke-static {p0, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f0(II)I

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public o()[F
    .locals 5

    .line 1
    const-string v0, "getApertureRange..."

    .line 2
    .line 3
    const-string v1, "TECamera2"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v0, p0, Lcom/ss/android/ttvecamera/b;->z:I

    .line 9
    .line 10
    const/4 v2, 0x1

    .line 11
    const/4 v3, 0x2

    .line 12
    if-ne v0, v2, :cond_0

    .line 13
    .line 14
    const-string p0, "Camera is opening, ignore getApertureRange operation."

    .line 15
    .line 16
    invoke-static {v1, p0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    new-array p0, v3, [F

    .line 20
    .line 21
    fill-array-data p0, :array_0

    .line 22
    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_0
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/b;->I0()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 32
    .line 33
    if-nez v0, :cond_1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->A()[F

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0

    .line 41
    :cond_2
    :goto_0
    const-string v0, "getApertureRange : camera is null."

    .line 42
    .line 43
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 47
    .line 48
    iget-object v2, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 49
    .line 50
    iget v2, v2, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 51
    .line 52
    const/16 v4, -0x1b7

    .line 53
    .line 54
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 55
    .line 56
    invoke-interface {v1, v2, v4, v0, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    new-array p0, v3, [F

    .line 60
    .line 61
    fill-array-data p0, :array_1

    .line 62
    .line 63
    .line 64
    return-object p0

    .line 65
    :array_0
    .array-data 4
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
    .end array-data

    .line 66
    .line 67
    .line 68
    .line 69
    .line 70
    .line 71
    .line 72
    .line 73
    :array_1
    .array-data 4
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
    .end array-data
.end method

.method public p(FLcom/ss/android/ttvecamera/TEFrameSizei;)Lcom/ss/android/ttvecamera/TEFrameSizei;
    .locals 8

    .line 1
    iget v0, p0, Lcom/ss/android/ttvecamera/b;->z:I

    .line 2
    .line 3
    const-string v1, "TECamera2"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-eqz v0, :cond_7

    .line 7
    .line 8
    iget v0, p0, Lcom/ss/android/ttvecamera/b;->z:I

    .line 9
    .line 10
    const/4 v3, 0x1

    .line 11
    if-ne v0, v3, :cond_0

    .line 12
    .line 13
    goto :goto_1

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 15
    .line 16
    iget-object v3, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->l:Landroid/hardware/camera2/params/StreamConfigurationMap;

    .line 17
    .line 18
    if-nez v3, :cond_1

    .line 19
    .line 20
    iget-object v3, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 21
    .line 22
    sget-object v4, Landroid/hardware/camera2/CameraCharacteristics;->SCALER_STREAM_CONFIGURATION_MAP:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 23
    .line 24
    invoke-virtual {v3, v4}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    check-cast v3, Landroid/hardware/camera2/params/StreamConfigurationMap;

    .line 29
    .line 30
    iput-object v3, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->l:Landroid/hardware/camera2/params/StreamConfigurationMap;

    .line 31
    .line 32
    :cond_1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 33
    .line 34
    iget-object v0, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->l:Landroid/hardware/camera2/params/StreamConfigurationMap;

    .line 35
    .line 36
    const-class v3, Landroid/graphics/SurfaceTexture;

    .line 37
    .line 38
    invoke-static {v3}, Landroid/hardware/camera2/params/StreamConfigurationMap;->isOutputSupportedFor(Ljava/lang/Class;)Z

    .line 39
    .line 40
    .line 41
    move-result v4

    .line 42
    if-nez v4, :cond_2

    .line 43
    .line 44
    const-string p0, "Output is not supported, ignore getBestPreviewSize operation."

    .line 45
    .line 46
    invoke-static {v1, p0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    return-object v2

    .line 50
    :cond_2
    invoke-virtual {v0, v3}, Landroid/hardware/camera2/params/StreamConfigurationMap;->getOutputSizes(Ljava/lang/Class;)[Landroid/util/Size;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    new-instance v1, Ljava/util/ArrayList;

    .line 55
    .line 56
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 57
    .line 58
    .line 59
    array-length v3, v0

    .line 60
    const/4 v4, 0x0

    .line 61
    :goto_0
    if-ge v4, v3, :cond_3

    .line 62
    .line 63
    aget-object v5, v0, v4

    .line 64
    .line 65
    new-instance v6, Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 66
    .line 67
    invoke-virtual {v5}, Landroid/util/Size;->getWidth()I

    .line 68
    .line 69
    .line 70
    move-result v7

    .line 71
    invoke-virtual {v5}, Landroid/util/Size;->getHeight()I

    .line 72
    .line 73
    .line 74
    move-result v5

    .line 75
    invoke-direct {v6, v7, v5}, Lcom/ss/android/ttvecamera/TEFrameSizei;-><init>(II)V

    .line 76
    .line 77
    .line 78
    invoke-interface {v1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    add-int/lit8 v4, v4, 0x1

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_3
    iget-object p0, p0, Lcom/ss/android/ttvecamera/c;->o:Lcom/ss/android/ttvecamera/c$e;

    .line 85
    .line 86
    if-eqz p0, :cond_4

    .line 87
    .line 88
    invoke-interface {p0, v1}, Lcom/ss/android/ttvecamera/c$e;->getPreviewSize(Ljava/util/List;)Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    :cond_4
    if-nez v2, :cond_6

    .line 93
    .line 94
    if-eqz p2, :cond_5

    .line 95
    .line 96
    invoke-static {v1, p2}, Lcom/ss/android/ttvecamera/f;->b(Ljava/util/List;Lcom/ss/android/ttvecamera/TEFrameSizei;)Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    return-object p0

    .line 101
    :cond_5
    invoke-static {v1, p1}, Lcom/ss/android/ttvecamera/f;->c(Ljava/util/List;F)Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    return-object p0

    .line 106
    :cond_6
    return-object v2

    .line 107
    :cond_7
    :goto_1
    const-string p0, "Camera is not opened, ignore getBestPreviewSize operation."

    .line 108
    .line 109
    invoke-static {v1, p0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    return-object v2
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
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

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
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->B()[I

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public r0(I)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/ss/android/ttvecamera/c;->r0(I)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 5
    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    const-string p0, "TECamera2"

    .line 9
    .line 10
    const-string p1, "set scene failed, no mode..."

    .line 11
    .line 12
    invoke-static {p0, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-virtual {p0, p1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->i0(I)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public s0(J)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setShutterTime : "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "TECamera2"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget v0, p0, Lcom/ss/android/ttvecamera/b;->z:I

    .line 21
    .line 22
    const/4 v2, 0x1

    .line 23
    if-ne v0, v2, :cond_0

    .line 24
    .line 25
    const-string p0, "Camera is opening, ignore setShutterTime operation."

    .line 26
    .line 27
    invoke-static {v1, p0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/b;->I0()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 38
    .line 39
    if-nez v0, :cond_1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    invoke-virtual {v0, p1, p2}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j0(J)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_2
    :goto_0
    const-string p1, "setISO : camera is null."

    .line 47
    .line 48
    invoke-static {v1, p1}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    iget-object p2, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 52
    .line 53
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 54
    .line 55
    iget v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 56
    .line 57
    const/16 v1, -0x1b7

    .line 58
    .line 59
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 60
    .line 61
    invoke-interface {p2, v0, v1, p1, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public t0(ZLjava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setWhileBalance: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "TECamera2"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget v0, p0, Lcom/ss/android/ttvecamera/b;->z:I

    .line 21
    .line 22
    const/4 v2, 0x1

    .line 23
    if-ne v0, v2, :cond_0

    .line 24
    .line 25
    const-string p0, "Camera is opening, ignore setWhileBalance operation."

    .line 26
    .line 27
    invoke-static {v1, p0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/b;->I0()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 38
    .line 39
    if-nez v0, :cond_1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    invoke-virtual {v0, p1, p2}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->k0(ZLjava/lang/String;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_2
    :goto_0
    const-string p1, "setWhileBalance : camera is null."

    .line 47
    .line 48
    invoke-static {v1, p1}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    iget-object p2, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 52
    .line 53
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 54
    .line 55
    iget v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 56
    .line 57
    const/16 v1, -0x1b7

    .line 58
    .line 59
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 60
    .line 61
    invoke-interface {p2, v0, v1, p1, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public u0()V
    .locals 5

    .line 1
    const-string v0, "Camera rotation = "

    .line 2
    .line 3
    const-string v1, "TECamera2-startCapture"

    .line 4
    .line 5
    invoke-static {v1}, Ll/dsh0;->a(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const-string v1, "startCapture..."

    .line 9
    .line 10
    const-string v2, "TECamera2"

    .line 11
    .line 12
    invoke-static {v2, v1}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/b;->I0()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_3

    .line 20
    .line 21
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->g:Ll/jrh0;

    .line 22
    .line 23
    if-nez v1, :cond_0

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_0
    iget v1, p0, Lcom/ss/android/ttvecamera/b;->z:I

    .line 27
    .line 28
    const/4 v3, 0x2

    .line 29
    if-eq v1, v3, :cond_1

    .line 30
    .line 31
    iget v1, p0, Lcom/ss/android/ttvecamera/b;->z:I

    .line 32
    .line 33
    const/4 v3, 0x3

    .line 34
    if-eq v1, v3, :cond_1

    .line 35
    .line 36
    new-instance v0, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    const-string v1, "startCapture, Invalid state: "

    .line 39
    .line 40
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    iget p0, p0, Lcom/ss/android/ttvecamera/b;->z:I

    .line 44
    .line 45
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-static {v2, p0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_1
    :try_start_0
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 57
    .line 58
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/b;->C()I

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    iput v3, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->e:I

    .line 63
    .line 64
    new-instance v1, Ljava/lang/StringBuilder;

    .line 65
    .line 66
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 70
    .line 71
    iget v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->e:I

    .line 72
    .line 73
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-static {v2, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 81
    .line 82
    .line 83
    goto :goto_0

    .line 84
    :catch_0
    move-exception v0

    .line 85
    invoke-static {v0}, Lcom/ss/android/ttvecamera/e;->a(Ljava/lang/Throwable;)V

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->t:Lcom/bytedance/bpea/basics/Cert;

    .line 89
    .line 90
    invoke-virtual {p0, v0}, Lcom/ss/android/ttvecamera/b;->K0(Lcom/bytedance/bpea/basics/Cert;)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 94
    .line 95
    if-eqz v0, :cond_2

    .line 96
    .line 97
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 98
    .line 99
    iget v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 100
    .line 101
    const/4 v2, 0x0

    .line 102
    iget-object v3, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 103
    .line 104
    const/16 v4, -0x1a9

    .line 105
    .line 106
    invoke-interface {v0, v1, v4, v2, v3}, Lcom/ss/android/ttvecamera/c$a;->f(IILcom/ss/android/ttvecamera/c;Ljava/lang/Object;)V

    .line 107
    .line 108
    .line 109
    :cond_2
    :goto_0
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/b;->L0()I

    .line 110
    .line 111
    .line 112
    invoke-static {}, Ll/dsh0;->b()V

    .line 113
    .line 114
    .line 115
    return-void

    .line 116
    :cond_3
    :goto_1
    const-string p0, "startCapture, Device is not ready."

    .line 117
    .line 118
    invoke-static {v2, p0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    return-void
.end method

.method public v()I
    .locals 0

    .line 1
    const/4 p0, 0x2

    return p0
.end method

.method public v0()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->n0()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public w0(FLcom/ss/android/ttvecamera/TECameraSettings$p;)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/ss/android/ttvecamera/b;->z:I

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    const-string v2, "TECamera2"

    .line 5
    .line 6
    if-eq v0, v1, :cond_0

    .line 7
    .line 8
    const-string p1, "[VE_UI_TEST]Failed event: START_ZOOM. Code: -420. Reason: session is not running"

    .line 9
    .line 10
    invoke-static {v2, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    new-instance p1, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string p2, "Invalid state, state = "

    .line 16
    .line 17
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget p2, p0, Lcom/ss/android/ttvecamera/b;->z:I

    .line 21
    .line 22
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iget-object p2, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 32
    .line 33
    const/16 v0, -0x1a4

    .line 34
    .line 35
    invoke-interface {p2, v0, v0, p1, p0}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/b;->I0()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_2

    .line 44
    .line 45
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 46
    .line 47
    if-nez v0, :cond_1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    invoke-virtual {v0, p1, p2}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->o0(FLcom/ss/android/ttvecamera/TECameraSettings$p;)I

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_2
    :goto_0
    const-string p1, "[VE_UI_TEST]Failed event: START_ZOOM. Code: -439. Reason: camera is null"

    .line 55
    .line 56
    invoke-static {v2, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    iget-object p1, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 60
    .line 61
    iget-object p2, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 62
    .line 63
    iget p2, p2, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 64
    .line 65
    const/16 v0, -0x1b7

    .line 66
    .line 67
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 68
    .line 69
    const-string v1, "startZoom : Camera is null."

    .line 70
    .line 71
    invoke-interface {p1, p2, v0, v1, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public x()[F
    .locals 5

    .line 1
    const-string v0, "getVFOV..."

    .line 2
    .line 3
    const-string v1, "TECamera2"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v0, p0, Lcom/ss/android/ttvecamera/b;->z:I

    .line 9
    .line 10
    const/4 v2, 0x1

    .line 11
    const/4 v3, 0x2

    .line 12
    if-ne v0, v2, :cond_0

    .line 13
    .line 14
    const-string p0, "Camera is opening, ignore getVFOV operation."

    .line 15
    .line 16
    invoke-static {v1, p0}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    new-array p0, v3, [F

    .line 20
    .line 21
    fill-array-data p0, :array_0

    .line 22
    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_0
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/b;->I0()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 32
    .line 33
    if-nez v0, :cond_1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->F()[F

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0

    .line 41
    :cond_2
    :goto_0
    const-string v0, "getFOV : camera is null."

    .line 42
    .line 43
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iget-object v1, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 47
    .line 48
    iget-object v2, p0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 49
    .line 50
    iget v2, v2, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 51
    .line 52
    const/16 v4, -0x1b7

    .line 53
    .line 54
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 55
    .line 56
    invoke-interface {v1, v2, v4, v0, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    new-array p0, v3, [F

    .line 60
    .line 61
    fill-array-data p0, :array_1

    .line 62
    .line 63
    .line 64
    return-object p0

    .line 65
    :array_0
    .array-data 4
        -0x40000000    # -2.0f
        -0x40000000    # -2.0f
    .end array-data

    .line 66
    .line 67
    .line 68
    .line 69
    .line 70
    .line 71
    .line 72
    .line 73
    :array_1
    .array-data 4
        -0x40000000    # -2.0f
        -0x40000000    # -2.0f
    .end array-data
.end method

.method public x0()V
    .locals 3

    .line 1
    const-string v0, "stopCapture..."

    .line 2
    .line 3
    const-string v1, "TECamera2"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/b;->I0()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    const-string p0, "Device is not ready."

    .line 15
    .line 16
    invoke-static {v1, p0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iget v0, p0, Lcom/ss/android/ttvecamera/b;->z:I

    .line 21
    .line 22
    const/4 v2, 0x3

    .line 23
    if-eq v0, v2, :cond_1

    .line 24
    .line 25
    new-instance v0, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    const-string v2, "Invalid state: "

    .line 28
    .line 29
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget v2, p0, Lcom/ss/android/ttvecamera/b;->z:I

    .line 33
    .line 34
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    :cond_1
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/b;->M0()I

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public y0()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->p0()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
