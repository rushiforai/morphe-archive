.class public abstract Lcom/ss/android/ttvecamera/framework/TECameraModeBase;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/o6m;
.implements Ll/p6m$a;


# annotations
.annotation build Landroidx/annotation/RequiresApi;
    api = 0x15
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;
    }
.end annotation


# instance fields
.field protected A:Lcom/ss/android/ttvecamera/TEFocusSettings;

.field protected B:Lcom/ss/android/ttvecamera/TEFrameRateRange;

.field protected C:I

.field protected D:Landroid/os/Handler;

.field private E:Landroid/os/HandlerThread;

.field private F:Landroid/graphics/Rect;

.field protected volatile G:Z

.field protected H:J

.field protected I:J

.field protected J:J

.field protected K:I

.field protected L:Z

.field private M:Z

.field protected volatile N:Z

.field private O:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field protected P:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected Q:Z

.field protected R:Z

.field protected S:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/hardware/camera2/params/OutputConfiguration;",
            ">;"
        }
    .end annotation
.end field

.field private T:Ljava/lang/Runnable;

.field private final U:Ll/lwk$b;

.field protected V:Landroid/hardware/camera2/CameraCaptureSession$StateCallback;

.field protected W:Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

.field public a:Landroid/hardware/camera2/CameraCharacteristics;

.field protected b:Ll/crh0;

.field protected c:Landroid/hardware/camera2/CaptureRequest$Builder;

.field protected volatile d:Landroid/hardware/camera2/CameraCaptureSession;

.field protected e:Landroid/hardware/camera2/CameraManager;

.field protected f:Lcom/ss/android/ttvecamera/c$a;

.field protected g:Lcom/ss/android/ttvecamera/b;

.field protected h:Lcom/ss/android/ttvecamera/TECameraSettings;

.field protected i:Ll/orh0;

.field protected j:Landroid/hardware/camera2/CameraDevice;

.field protected k:Landroid/os/Handler;

.field public l:Landroid/hardware/camera2/params/StreamConfigurationMap;

.field public m:Landroid/hardware/camera2/CaptureRequest;

.field protected n:Ljava/util/concurrent/atomic/AtomicBoolean;

.field protected o:Z

.field protected p:F

.field protected q:F

.field protected r:Landroid/util/Range;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Range<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field protected s:I

.field protected t:Landroid/graphics/Rect;

.field protected u:Lcom/ss/android/ttvecamera/c$d;

.field protected v:Lcom/ss/android/ttvecamera/c$e;

.field protected w:Lcom/ss/android/ttvecamera/c$b;

.field protected x:[I

.field protected y:I

.field protected z:Landroid/hardware/camera2/CaptureRequest$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/CaptureRequest$Key<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/ss/android/ttvecamera/b;Landroid/content/Context;Landroid/os/Handler;)V
    .locals 5
    .param p1    # Lcom/ss/android/ttvecamera/b;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->l:Landroid/hardware/camera2/params/StreamConfigurationMap;

    .line 6
    .line 7
    new-instance v1, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-direct {v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 11
    .line 12
    .line 13
    iput-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->n:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->o:Z

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    iput v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->p:F

    .line 20
    .line 21
    const/high16 v1, 0x3f800000    # 1.0f

    .line 22
    .line 23
    iput v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->q:F

    .line 24
    .line 25
    iput-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->r:Landroid/util/Range;

    .line 26
    .line 27
    iput v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->s:I

    .line 28
    .line 29
    iput-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->t:Landroid/graphics/Rect;

    .line 30
    .line 31
    iput-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->v:Lcom/ss/android/ttvecamera/c$e;

    .line 32
    .line 33
    iput v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->y:I

    .line 34
    .line 35
    iput-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->z:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 36
    .line 37
    new-instance v1, Lcom/ss/android/ttvecamera/TEFrameRateRange;

    .line 38
    .line 39
    const/4 v3, 0x7

    .line 40
    const/16 v4, 0x1e

    .line 41
    .line 42
    invoke-direct {v1, v3, v4}, Lcom/ss/android/ttvecamera/TEFrameRateRange;-><init>(II)V

    .line 43
    .line 44
    .line 45
    iput-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->B:Lcom/ss/android/ttvecamera/TEFrameRateRange;

    .line 46
    .line 47
    iput-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->D:Landroid/os/Handler;

    .line 48
    .line 49
    iput-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->E:Landroid/os/HandlerThread;

    .line 50
    .line 51
    iput-boolean v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->G:Z

    .line 52
    .line 53
    const-wide/16 v0, 0x0

    .line 54
    .line 55
    iput-wide v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->H:J

    .line 56
    .line 57
    iput-wide v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->I:J

    .line 58
    .line 59
    iput-wide v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->J:J

    .line 60
    .line 61
    iput v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->K:I

    .line 62
    .line 63
    iput-boolean v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->L:Z

    .line 64
    .line 65
    iput-boolean v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->M:Z

    .line 66
    .line 67
    iput-boolean v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->N:Z

    .line 68
    .line 69
    new-instance v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$1;

    .line 70
    .line 71
    invoke-direct {v0, p0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$1;-><init>(Lcom/ss/android/ttvecamera/framework/TECameraModeBase;)V

    .line 72
    .line 73
    .line 74
    iput-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->O:Ljava/util/Map;

    .line 75
    .line 76
    new-instance v0, Ljava/util/HashMap;

    .line 77
    .line 78
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 79
    .line 80
    .line 81
    iput-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->P:Ljava/util/HashMap;

    .line 82
    .line 83
    iput-boolean v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->Q:Z

    .line 84
    .line 85
    iput-boolean v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->R:Z

    .line 86
    .line 87
    new-instance v0, Ljava/util/ArrayList;

    .line 88
    .line 89
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 90
    .line 91
    .line 92
    iput-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->S:Ljava/util/List;

    .line 93
    .line 94
    new-instance v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$b;

    .line 95
    .line 96
    invoke-direct {v0, p0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$b;-><init>(Lcom/ss/android/ttvecamera/framework/TECameraModeBase;)V

    .line 97
    .line 98
    .line 99
    iput-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->T:Ljava/lang/Runnable;

    .line 100
    .line 101
    new-instance v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$c;

    .line 102
    .line 103
    invoke-direct {v0, p0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$c;-><init>(Lcom/ss/android/ttvecamera/framework/TECameraModeBase;)V

    .line 104
    .line 105
    .line 106
    iput-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->U:Ll/lwk$b;

    .line 107
    .line 108
    new-instance v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$d;

    .line 109
    .line 110
    invoke-direct {v0, p0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$d;-><init>(Lcom/ss/android/ttvecamera/framework/TECameraModeBase;)V

    .line 111
    .line 112
    .line 113
    iput-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->V:Landroid/hardware/camera2/CameraCaptureSession$StateCallback;

    .line 114
    .line 115
    new-instance v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$e;

    .line 116
    .line 117
    invoke-direct {v0, p0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$e;-><init>(Lcom/ss/android/ttvecamera/framework/TECameraModeBase;)V

    .line 118
    .line 119
    .line 120
    iput-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->W:Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    .line 121
    .line 122
    iput-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->g:Lcom/ss/android/ttvecamera/b;

    .line 123
    .line 124
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/c;->u()Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    iput-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 129
    .line 130
    iget p1, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 131
    .line 132
    invoke-static {p2, p1}, Ll/crh0;->c(Landroid/content/Context;I)Ll/crh0;

    .line 133
    .line 134
    .line 135
    move-result-object p1

    .line 136
    iput-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->b:Ll/crh0;

    .line 137
    .line 138
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->g:Lcom/ss/android/ttvecamera/b;

    .line 139
    .line 140
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/c;->t()Lcom/ss/android/ttvecamera/c$a;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    iput-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 145
    .line 146
    iput-object p3, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->k:Landroid/os/Handler;

    .line 147
    .line 148
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 149
    .line 150
    iget-boolean p1, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->j:Z

    .line 151
    .line 152
    iput-boolean p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->o:Z

    .line 153
    .line 154
    iput-boolean v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->L:Z

    .line 155
    .line 156
    return-void
.end method

.method private b0()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->b:Ll/crh0;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 6
    .line 7
    iget-object v3, v2, Lcom/ss/android/ttvecamera/TECameraSettings;->c:Lcom/ss/android/ttvecamera/TEFrameRateRange;

    .line 8
    .line 9
    move-object v4, v2

    .line 10
    iget v2, v3, Lcom/ss/android/ttvecamera/TEFrameRateRange;->min:I

    .line 11
    .line 12
    iget v3, v3, Lcom/ss/android/ttvecamera/TEFrameRateRange;->max:I

    .line 13
    .line 14
    move-object v5, v4

    .line 15
    iget v4, v5, Lcom/ss/android/ttvecamera/TECameraSettings;->O:I

    .line 16
    .line 17
    iget v5, v5, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 18
    .line 19
    invoke-virtual/range {v0 .. v5}, Ll/crh0;->d(Landroid/hardware/camera2/CameraCharacteristics;IIII)Lcom/ss/android/ttvecamera/TEFrameRateRange;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->B:Lcom/ss/android/ttvecamera/TEFrameRateRange;

    .line 24
    .line 25
    new-instance v0, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    const-string v1, "Set Fps Range: "

    .line 28
    .line 29
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->B:Lcom/ss/android/ttvecamera/TEFrameRateRange;

    .line 33
    .line 34
    invoke-virtual {v1}, Lcom/ss/android/ttvecamera/TEFrameRateRange;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string v1, ", strategy: "

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 47
    .line 48
    iget p0, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->O:I

    .line 49
    .line 50
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    const-string v0, "TECameraModeBase"

    .line 58
    .line 59
    invoke-static {v0, p0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public static synthetic g(Lcom/ss/android/ttvecamera/framework/TECameraModeBase;)Ll/lwk$b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->U:Ll/lwk$b;

    .line 2
    .line 3
    return-object p0
.end method

.method private l0(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 5

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    iget-object v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->x:[I

    .line 7
    .line 8
    const-string v3, "FaceDetect is not supported!"

    .line 9
    .line 10
    const-string v4, "TECameraModeBase"

    .line 11
    .line 12
    if-eqz v2, :cond_3

    .line 13
    .line 14
    invoke-static {v2, v0}, Lcom/ss/android/ttvecamera/f;->f([II)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    sget-object p0, Landroid/hardware/camera2/CaptureRequest;->STATISTICS_FACE_DETECT_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 21
    .line 22
    invoke-virtual {p1, p0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    sget-object p0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_SCENE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 26
    .line 27
    invoke-virtual {p1, p0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->x:[I

    .line 32
    .line 33
    const/4 v2, 0x2

    .line 34
    invoke-static {v0, v2}, Lcom/ss/android/ttvecamera/f;->f([II)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    sget-object p0, Landroid/hardware/camera2/CaptureRequest;->STATISTICS_FACE_DETECT_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 41
    .line 42
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {p1, p0, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    sget-object p0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_SCENE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 50
    .line 51
    invoke-virtual {p1, p0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->x:[I

    .line 56
    .line 57
    const/4 p1, 0x0

    .line 58
    invoke-static {p0, p1}, Lcom/ss/android/ttvecamera/f;->f([II)Z

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    if-eqz p0, :cond_2

    .line 63
    .line 64
    invoke-static {v4, v3}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    :cond_2
    return-void

    .line 68
    :cond_3
    invoke-static {v4, v3}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method private v(Lcom/ss/android/ttvecamera/TEFocusSettings;)I
    .locals 20

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v9, p1

    .line 4
    .line 5
    const/4 v10, 0x1

    .line 6
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 7
    .line 8
    .line 9
    move-result-object v11

    .line 10
    const/4 v12, 0x0

    .line 11
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object v13

    .line 15
    new-instance v0, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const-string v2, "settings = "

    .line 18
    .line 19
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v14, "TECameraModeBase"

    .line 30
    .line 31
    invoke-static {v14, v0}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    iput-object v9, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->A:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 35
    .line 36
    iget-object v0, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->i:Ll/orh0;

    .line 37
    .line 38
    invoke-virtual {v0, v9}, Ll/orh0;->h(Lcom/ss/android/ttvecamera/TEFocusSettings;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->i:Ll/orh0;

    .line 42
    .line 43
    iget-object v2, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 44
    .line 45
    invoke-virtual {v0, v2}, Ll/orh0;->g(Lcom/ss/android/ttvecamera/TECameraSettings;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->b:Ll/crh0;

    .line 49
    .line 50
    const/16 v15, -0x64

    .line 51
    .line 52
    if-eqz v0, :cond_14

    .line 53
    .line 54
    iget-object v0, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->d:Landroid/hardware/camera2/CameraCaptureSession;

    .line 55
    .line 56
    if-eqz v0, :cond_14

    .line 57
    .line 58
    iget-object v0, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 59
    .line 60
    if-eqz v0, :cond_14

    .line 61
    .line 62
    iget-object v0, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->A:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 63
    .line 64
    if-nez v0, :cond_0

    .line 65
    .line 66
    goto/16 :goto_8

    .line 67
    .line 68
    :cond_0
    iget-object v0, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->b:Ll/crh0;

    .line 69
    .line 70
    iget-object v2, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 71
    .line 72
    invoke-virtual {v0, v2}, Ll/crh0;->p(Landroid/hardware/camera2/CameraCharacteristics;)Z

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    iget-object v0, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->b:Ll/crh0;

    .line 77
    .line 78
    iget-object v3, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 79
    .line 80
    invoke-virtual {v0, v3}, Ll/crh0;->m(Landroid/hardware/camera2/CameraCharacteristics;)Z

    .line 81
    .line 82
    .line 83
    move-result v16

    .line 84
    const/16 v3, -0x19c

    .line 85
    .line 86
    if-nez v16, :cond_1

    .line 87
    .line 88
    if-nez v2, :cond_1

    .line 89
    .line 90
    const-string v0, "not support focus and meter!"

    .line 91
    .line 92
    invoke-static {v14, v0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    iget-object v2, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->A:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 96
    .line 97
    invoke-virtual {v2}, Lcom/ss/android/ttvecamera/TEFocusSettings;->g()Lcom/ss/android/ttvecamera/TEFocusSettings$b;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    iget-object v1, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 102
    .line 103
    iget v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 104
    .line 105
    invoke-interface {v2, v3, v1, v0}, Lcom/ss/android/ttvecamera/TEFocusSettings$b;->a(IILjava/lang/String;)V

    .line 106
    .line 107
    .line 108
    return v3

    .line 109
    :cond_1
    iget-object v0, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->n:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 110
    .line 111
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    if-eqz v16, :cond_3

    .line 116
    .line 117
    iget-object v4, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->A:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 118
    .line 119
    invoke-virtual {v4}, Lcom/ss/android/ttvecamera/TEFocusSettings;->o()Z

    .line 120
    .line 121
    .line 122
    move-result v4

    .line 123
    if-nez v4, :cond_2

    .line 124
    .line 125
    goto :goto_0

    .line 126
    :cond_2
    move/from16 v17, v12

    .line 127
    .line 128
    goto :goto_1

    .line 129
    :cond_3
    :goto_0
    move/from16 v17, v10

    .line 130
    .line 131
    :goto_1
    if-eqz v0, :cond_4

    .line 132
    .line 133
    if-nez v17, :cond_4

    .line 134
    .line 135
    iget-object v0, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->T:Ljava/lang/Runnable;

    .line 136
    .line 137
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 138
    .line 139
    .line 140
    const-wide/16 v4, 0x32

    .line 141
    .line 142
    :try_start_0
    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 143
    .line 144
    .line 145
    goto :goto_2

    .line 146
    :catch_0
    move-exception v0

    .line 147
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 148
    .line 149
    .line 150
    :goto_2
    const-string v0, "cancel previous touch af.."

    .line 151
    .line 152
    invoke-static {v14, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    :cond_4
    if-eqz v2, :cond_5

    .line 156
    .line 157
    iget-object v0, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->A:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 158
    .line 159
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/TEFocusSettings;->p()Z

    .line 160
    .line 161
    .line 162
    move-result v0

    .line 163
    if-eqz v0, :cond_5

    .line 164
    .line 165
    move v0, v10

    .line 166
    goto :goto_3

    .line 167
    :cond_5
    move v0, v12

    .line 168
    :goto_3
    const/4 v2, 0x0

    .line 169
    if-eqz v0, :cond_9

    .line 170
    .line 171
    iget-object v0, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->A:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 172
    .line 173
    iget-object v4, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 174
    .line 175
    iget v5, v4, Lcom/ss/android/ttvecamera/TECameraSettings;->e:I

    .line 176
    .line 177
    iget v4, v4, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 178
    .line 179
    if-ne v4, v10, :cond_6

    .line 180
    .line 181
    move v4, v10

    .line 182
    goto :goto_4

    .line 183
    :cond_6
    move v4, v12

    .line 184
    :goto_4
    invoke-virtual {v0, v5, v4}, Lcom/ss/android/ttvecamera/TEFocusSettings;->b(IZ)Landroid/graphics/Rect;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    if-nez v0, :cond_7

    .line 189
    .line 190
    iget-object v0, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->A:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 191
    .line 192
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/TEFocusSettings;->j()I

    .line 193
    .line 194
    .line 195
    move-result v0

    .line 196
    iget-object v4, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->A:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 197
    .line 198
    invoke-virtual {v4}, Lcom/ss/android/ttvecamera/TEFocusSettings;->i()I

    .line 199
    .line 200
    .line 201
    move-result v4

    .line 202
    iget-object v5, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->A:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 203
    .line 204
    invoke-virtual {v5}, Lcom/ss/android/ttvecamera/TEFocusSettings;->k()I

    .line 205
    .line 206
    .line 207
    move-result v5

    .line 208
    int-to-float v5, v5

    .line 209
    iget-object v6, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->A:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 210
    .line 211
    invoke-virtual {v6}, Lcom/ss/android/ttvecamera/TEFocusSettings;->l()I

    .line 212
    .line 213
    .line 214
    move-result v6

    .line 215
    int-to-float v6, v6

    .line 216
    iget-object v7, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 217
    .line 218
    iget v7, v7, Lcom/ss/android/ttvecamera/TECameraSettings;->e:I

    .line 219
    .line 220
    iget-object v8, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->A:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 221
    .line 222
    invoke-virtual {v8}, Lcom/ss/android/ttvecamera/TEFocusSettings;->e()Lcom/ss/android/ttvecamera/TEFocusSettings$CoordinatesMode;

    .line 223
    .line 224
    .line 225
    move-result-object v8

    .line 226
    move/from16 v18, v3

    .line 227
    .line 228
    move v3, v4

    .line 229
    move v4, v5

    .line 230
    move v5, v6

    .line 231
    move v6, v7

    .line 232
    const/4 v7, 0x1

    .line 233
    move-object/from16 v19, v2

    .line 234
    .line 235
    move v2, v0

    .line 236
    move-object/from16 v0, v19

    .line 237
    .line 238
    invoke-virtual/range {v1 .. v8}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->e(IIFFIILcom/ss/android/ttvecamera/TEFocusSettings$CoordinatesMode;)Landroid/graphics/Rect;

    .line 239
    .line 240
    .line 241
    move-result-object v2

    .line 242
    move-object/from16 v19, v2

    .line 243
    .line 244
    move-object v2, v0

    .line 245
    move-object/from16 v0, v19

    .line 246
    .line 247
    goto :goto_5

    .line 248
    :cond_7
    move/from16 v18, v3

    .line 249
    .line 250
    :goto_5
    invoke-static {v0}, Lcom/ss/android/ttvecamera/f;->v(Landroid/graphics/Rect;)Z

    .line 251
    .line 252
    .line 253
    move-result v3

    .line 254
    if-nez v3, :cond_8

    .line 255
    .line 256
    const-string v0, "meteringRect is not valid!"

    .line 257
    .line 258
    invoke-static {v14, v0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 259
    .line 260
    .line 261
    iget-object v2, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->A:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 262
    .line 263
    invoke-virtual {v2}, Lcom/ss/android/ttvecamera/TEFocusSettings;->g()Lcom/ss/android/ttvecamera/TEFocusSettings$b;

    .line 264
    .line 265
    .line 266
    move-result-object v2

    .line 267
    iget-object v1, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 268
    .line 269
    iget v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 270
    .line 271
    invoke-interface {v2, v15, v1, v0}, Lcom/ss/android/ttvecamera/TEFocusSettings$b;->a(IILjava/lang/String;)V

    .line 272
    .line 273
    .line 274
    return v15

    .line 275
    :cond_8
    iget-object v3, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->i:Ll/orh0;

    .line 276
    .line 277
    iget-object v4, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 278
    .line 279
    invoke-virtual {v3, v4, v0}, Ll/orh0;->f(Landroid/hardware/camera2/CaptureRequest$Builder;Landroid/graphics/Rect;)V

    .line 280
    .line 281
    .line 282
    if-eqz v17, :cond_a

    .line 283
    .line 284
    iget-object v0, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 285
    .line 286
    iget-object v2, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->i:Ll/orh0;

    .line 287
    .line 288
    invoke-interface {v2, v0, v12}, Ll/p6m;->c(Landroid/hardware/camera2/CaptureRequest$Builder;Z)Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    .line 289
    .line 290
    .line 291
    move-result-object v2

    .line 292
    iget-object v3, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->k:Landroid/os/Handler;

    .line 293
    .line 294
    invoke-virtual {v1, v0, v2, v3}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->x0(Landroid/hardware/camera2/CaptureRequest$Builder;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 295
    .line 296
    .line 297
    iget-object v0, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->n:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 298
    .line 299
    invoke-virtual {v0, v12}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 300
    .line 301
    .line 302
    return v12

    .line 303
    :cond_9
    move/from16 v18, v3

    .line 304
    .line 305
    move-object v0, v2

    .line 306
    :cond_a
    if-eqz v16, :cond_13

    .line 307
    .line 308
    iget-object v3, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->A:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 309
    .line 310
    invoke-virtual {v3}, Lcom/ss/android/ttvecamera/TEFocusSettings;->o()Z

    .line 311
    .line 312
    .line 313
    move-result v3

    .line 314
    if-eqz v3, :cond_13

    .line 315
    .line 316
    iget-object v3, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->A:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 317
    .line 318
    iget-object v4, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 319
    .line 320
    iget v5, v4, Lcom/ss/android/ttvecamera/TECameraSettings;->e:I

    .line 321
    .line 322
    iget v4, v4, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 323
    .line 324
    if-ne v4, v10, :cond_b

    .line 325
    .line 326
    move v4, v10

    .line 327
    goto :goto_6

    .line 328
    :cond_b
    move v4, v12

    .line 329
    :goto_6
    invoke-virtual {v3, v5, v4}, Lcom/ss/android/ttvecamera/TEFocusSettings;->a(IZ)Landroid/graphics/Rect;

    .line 330
    .line 331
    .line 332
    move-result-object v3

    .line 333
    if-nez v3, :cond_c

    .line 334
    .line 335
    iget-object v3, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->A:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 336
    .line 337
    invoke-virtual {v3}, Lcom/ss/android/ttvecamera/TEFocusSettings;->j()I

    .line 338
    .line 339
    .line 340
    move-result v3

    .line 341
    iget-object v4, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->A:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 342
    .line 343
    invoke-virtual {v4}, Lcom/ss/android/ttvecamera/TEFocusSettings;->i()I

    .line 344
    .line 345
    .line 346
    move-result v4

    .line 347
    iget-object v5, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->A:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 348
    .line 349
    invoke-virtual {v5}, Lcom/ss/android/ttvecamera/TEFocusSettings;->k()I

    .line 350
    .line 351
    .line 352
    move-result v5

    .line 353
    int-to-float v5, v5

    .line 354
    iget-object v6, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->A:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 355
    .line 356
    invoke-virtual {v6}, Lcom/ss/android/ttvecamera/TEFocusSettings;->l()I

    .line 357
    .line 358
    .line 359
    move-result v6

    .line 360
    int-to-float v6, v6

    .line 361
    iget-object v7, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 362
    .line 363
    iget v7, v7, Lcom/ss/android/ttvecamera/TECameraSettings;->e:I

    .line 364
    .line 365
    iget-object v8, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->A:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 366
    .line 367
    invoke-virtual {v8}, Lcom/ss/android/ttvecamera/TEFocusSettings;->e()Lcom/ss/android/ttvecamera/TEFocusSettings$CoordinatesMode;

    .line 368
    .line 369
    .line 370
    move-result-object v8

    .line 371
    move-object/from16 v16, v2

    .line 372
    .line 373
    move v2, v3

    .line 374
    move v3, v4

    .line 375
    move v4, v5

    .line 376
    move v5, v6

    .line 377
    move v6, v7

    .line 378
    const/4 v7, 0x0

    .line 379
    invoke-virtual/range {v1 .. v8}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->e(IIFFIILcom/ss/android/ttvecamera/TEFocusSettings$CoordinatesMode;)Landroid/graphics/Rect;

    .line 380
    .line 381
    .line 382
    move-result-object v3

    .line 383
    :cond_c
    invoke-static {v3}, Lcom/ss/android/ttvecamera/f;->v(Landroid/graphics/Rect;)Z

    .line 384
    .line 385
    .line 386
    move-result v2

    .line 387
    if-nez v2, :cond_d

    .line 388
    .line 389
    const-string v0, "focusRect is not valid!"

    .line 390
    .line 391
    invoke-static {v14, v0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 392
    .line 393
    .line 394
    iget-object v2, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->A:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 395
    .line 396
    invoke-virtual {v2}, Lcom/ss/android/ttvecamera/TEFocusSettings;->g()Lcom/ss/android/ttvecamera/TEFocusSettings$b;

    .line 397
    .line 398
    .line 399
    move-result-object v2

    .line 400
    iget-object v1, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 401
    .line 402
    iget v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 403
    .line 404
    invoke-interface {v2, v15, v1, v0}, Lcom/ss/android/ttvecamera/TEFocusSettings$b;->a(IILjava/lang/String;)V

    .line 405
    .line 406
    .line 407
    return v15

    .line 408
    :cond_d
    iget-object v2, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->n:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 409
    .line 410
    invoke-virtual {v2, v10}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 411
    .line 412
    .line 413
    iget-boolean v2, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->L:Z

    .line 414
    .line 415
    if-eqz v2, :cond_f

    .line 416
    .line 417
    invoke-virtual {v9}, Lcom/ss/android/ttvecamera/TEFocusSettings;->m()Z

    .line 418
    .line 419
    .line 420
    move-result v2

    .line 421
    iget-object v4, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 422
    .line 423
    if-eqz v2, :cond_e

    .line 424
    .line 425
    sget-object v2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 426
    .line 427
    const/4 v5, 0x3

    .line 428
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 429
    .line 430
    .line 431
    move-result-object v5

    .line 432
    invoke-virtual {v4, v2, v5}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 433
    .line 434
    .line 435
    iget-object v2, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 436
    .line 437
    sget-object v4, Landroid/hardware/camera2/CaptureRequest;->FLASH_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 438
    .line 439
    invoke-virtual {v2, v4, v11}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 440
    .line 441
    .line 442
    goto :goto_7

    .line 443
    :cond_e
    sget-object v2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 444
    .line 445
    invoke-virtual {v4, v2, v11}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 446
    .line 447
    .line 448
    iget-object v2, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 449
    .line 450
    sget-object v4, Landroid/hardware/camera2/CaptureRequest;->FLASH_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 451
    .line 452
    invoke-virtual {v2, v4, v13}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 453
    .line 454
    .line 455
    :cond_f
    :goto_7
    iget-object v2, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->i:Ll/orh0;

    .line 456
    .line 457
    iget-object v4, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 458
    .line 459
    invoke-virtual {v2, v4, v3}, Ll/orh0;->e(Landroid/hardware/camera2/CaptureRequest$Builder;Landroid/graphics/Rect;)V

    .line 460
    .line 461
    .line 462
    iget-object v2, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 463
    .line 464
    invoke-virtual {v1, v2}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->k(Landroid/hardware/camera2/CaptureRequest$Builder;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 465
    .line 466
    .line 467
    iget-object v2, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 468
    .line 469
    sget-object v4, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 470
    .line 471
    invoke-virtual {v2, v4, v13}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 472
    .line 473
    .line 474
    iget-object v2, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 475
    .line 476
    sget-object v4, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_REGIONS:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 477
    .line 478
    new-instance v5, Landroid/hardware/camera2/params/MeteringRectangle;

    .line 479
    .line 480
    const/16 v6, 0x3e7

    .line 481
    .line 482
    invoke-direct {v5, v3, v6}, Landroid/hardware/camera2/params/MeteringRectangle;-><init>(Landroid/graphics/Rect;I)V

    .line 483
    .line 484
    .line 485
    filled-new-array {v5}, [Landroid/hardware/camera2/params/MeteringRectangle;

    .line 486
    .line 487
    .line 488
    move-result-object v3

    .line 489
    invoke-virtual {v2, v4, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 490
    .line 491
    .line 492
    if-eqz v0, :cond_10

    .line 493
    .line 494
    iget-object v2, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 495
    .line 496
    sget-object v3, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_REGIONS:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 497
    .line 498
    new-instance v4, Landroid/hardware/camera2/params/MeteringRectangle;

    .line 499
    .line 500
    invoke-direct {v4, v0, v6}, Landroid/hardware/camera2/params/MeteringRectangle;-><init>(Landroid/graphics/Rect;I)V

    .line 501
    .line 502
    .line 503
    filled-new-array {v4}, [Landroid/hardware/camera2/params/MeteringRectangle;

    .line 504
    .line 505
    .line 506
    move-result-object v0

    .line 507
    invoke-virtual {v2, v3, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 508
    .line 509
    .line 510
    :cond_10
    iget-object v0, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 511
    .line 512
    sget-object v2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_PRECAPTURE_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 513
    .line 514
    invoke-virtual {v0, v2, v13}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 515
    .line 516
    .line 517
    iget-object v0, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 518
    .line 519
    iget-object v2, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->i:Ll/orh0;

    .line 520
    .line 521
    iget-object v3, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->n:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 522
    .line 523
    invoke-virtual {v9}, Lcom/ss/android/ttvecamera/TEFocusSettings;->n()Z

    .line 524
    .line 525
    .line 526
    move-result v4

    .line 527
    invoke-interface {v2, v0, v3, v4}, Ll/p6m;->b(Landroid/hardware/camera2/CaptureRequest$Builder;Ljava/util/concurrent/atomic/AtomicBoolean;Z)Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    .line 528
    .line 529
    .line 530
    move-result-object v2

    .line 531
    iget-object v3, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->k:Landroid/os/Handler;

    .line 532
    .line 533
    invoke-virtual {v1, v0, v2, v3}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->x0(Landroid/hardware/camera2/CaptureRequest$Builder;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 534
    .line 535
    .line 536
    move-result-object v0

    .line 537
    iget-boolean v2, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->a:Z

    .line 538
    .line 539
    if-nez v2, :cond_12

    .line 540
    .line 541
    iget-object v2, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->n:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 542
    .line 543
    invoke-virtual {v2, v12}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 544
    .line 545
    .line 546
    iget-object v2, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->A:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 547
    .line 548
    const/16 v3, -0x6c

    .line 549
    .line 550
    if-eqz v2, :cond_11

    .line 551
    .line 552
    invoke-virtual {v2}, Lcom/ss/android/ttvecamera/TEFocusSettings;->g()Lcom/ss/android/ttvecamera/TEFocusSettings$b;

    .line 553
    .line 554
    .line 555
    move-result-object v2

    .line 556
    iget-object v4, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 557
    .line 558
    iget v4, v4, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 559
    .line 560
    iget-object v5, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->b:Ljava/lang/String;

    .line 561
    .line 562
    invoke-interface {v2, v3, v4, v5}, Lcom/ss/android/ttvecamera/TEFocusSettings$b;->a(IILjava/lang/String;)V

    .line 563
    .line 564
    .line 565
    :cond_11
    iget-object v1, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 566
    .line 567
    iget-object v0, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->b:Ljava/lang/String;

    .line 568
    .line 569
    const/16 v2, -0x19b

    .line 570
    .line 571
    const/4 v4, 0x0

    .line 572
    invoke-interface {v1, v2, v2, v0, v4}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 573
    .line 574
    .line 575
    return v3

    .line 576
    :cond_12
    return v12

    .line 577
    :cond_13
    return v18

    .line 578
    :cond_14
    :goto_8
    const-string v0, "Env is null"

    .line 579
    .line 580
    invoke-static {v14, v0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 581
    .line 582
    .line 583
    iget-object v2, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->A:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 584
    .line 585
    if-eqz v2, :cond_15

    .line 586
    .line 587
    invoke-virtual {v2}, Lcom/ss/android/ttvecamera/TEFocusSettings;->g()Lcom/ss/android/ttvecamera/TEFocusSettings$b;

    .line 588
    .line 589
    .line 590
    move-result-object v2

    .line 591
    iget-object v1, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 592
    .line 593
    iget v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 594
    .line 595
    invoke-interface {v2, v15, v1, v0}, Lcom/ss/android/ttvecamera/TEFocusSettings$b;->a(IILjava/lang/String;)V

    .line 596
    .line 597
    .line 598
    :cond_15
    return v15
.end method


# virtual methods
.method public A()[F
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->d:Landroid/hardware/camera2/CameraCaptureSession;

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 10
    .line 11
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 12
    .line 13
    const/16 v2, -0x1b0

    .line 14
    .line 15
    const-string v3, "Capture Session is null"

    .line 16
    .line 17
    invoke-interface {v0, v2, v2, v3, v1}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    :cond_1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 21
    .line 22
    sget-object v0, Landroid/hardware/camera2/CameraCharacteristics;->LENS_INFO_AVAILABLE_APERTURES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    check-cast p0, [F

    .line 29
    .line 30
    if-nez p0, :cond_2

    .line 31
    .line 32
    const/4 p0, 0x2

    .line 33
    new-array p0, p0, [F

    .line 34
    .line 35
    fill-array-data p0, :array_0

    .line 36
    .line 37
    .line 38
    :cond_2
    return-object p0

    .line 39
    :array_0
    .array-data 4
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
    .end array-data
.end method

.method public A0(FLcom/ss/android/ttvecamera/TECameraSettings$p;)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->d:Landroid/hardware/camera2/CameraCaptureSession;

    .line 2
    .line 3
    const/16 v1, -0x1a4

    .line 4
    .line 5
    const-string v2, "TECameraModeBase"

    .line 6
    .line 7
    if-eqz v0, :cond_c

    .line 8
    .line 9
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->m:Landroid/hardware/camera2/CaptureRequest;

    .line 10
    .line 11
    if-eqz v0, :cond_c

    .line 12
    .line 13
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    goto/16 :goto_3

    .line 18
    .line 19
    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 20
    .line 21
    const/16 v3, 0x1e

    .line 22
    .line 23
    const-string v4, "[VE_UI_TEST]Failed event: START_ZOOM. Code: -420. Reason: "

    .line 24
    .line 25
    const/high16 v5, 0x3f800000    # 1.0f

    .line 26
    .line 27
    if-lt v0, v3, :cond_5

    .line 28
    .line 29
    iget-boolean v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->M:Z

    .line 30
    .line 31
    if-eqz v0, :cond_5

    .line 32
    .line 33
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->b:Ll/crh0;

    .line 34
    .line 35
    iget-object v3, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 36
    .line 37
    invoke-virtual {v0, v3}, Ll/crh0;->o(Landroid/hardware/camera2/CameraCharacteristics;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-nez v0, :cond_1

    .line 42
    .line 43
    goto/16 :goto_1

    .line 44
    .line 45
    :cond_1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->r:Landroid/util/Range;

    .line 46
    .line 47
    if-eqz v0, :cond_4

    .line 48
    .line 49
    invoke-virtual {v0}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    check-cast v0, Ljava/lang/Float;

    .line 54
    .line 55
    iget-object v3, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->r:Landroid/util/Range;

    .line 56
    .line 57
    invoke-virtual {v3}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    check-cast v3, Ljava/lang/Float;

    .line 62
    .line 63
    iget v6, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->q:F

    .line 64
    .line 65
    mul-float/2addr v6, p1

    .line 66
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 67
    .line 68
    .line 69
    move-result v7

    .line 70
    cmpl-float v6, v6, v7

    .line 71
    .line 72
    if-ltz v6, :cond_2

    .line 73
    .line 74
    cmpl-float v6, p1, v5

    .line 75
    .line 76
    if-lez v6, :cond_2

    .line 77
    .line 78
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    iput p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->q:F

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_2
    iget v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->q:F

    .line 86
    .line 87
    mul-float/2addr v0, p1

    .line 88
    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    .line 89
    .line 90
    .line 91
    move-result v6

    .line 92
    cmpg-float v0, v0, v6

    .line 93
    .line 94
    if-gtz v0, :cond_3

    .line 95
    .line 96
    cmpg-float v0, p1, v5

    .line 97
    .line 98
    if-gtz v0, :cond_3

    .line 99
    .line 100
    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    iput p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->q:F

    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_3
    iget v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->q:F

    .line 108
    .line 109
    mul-float/2addr v0, p1

    .line 110
    iput v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->q:F

    .line 111
    .line 112
    new-instance p1, Ljava/lang/StringBuilder;

    .line 113
    .line 114
    const-string v0, "zoom ratio = "

    .line 115
    .line 116
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    iget v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->q:F

    .line 120
    .line 121
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    invoke-static {v2, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    :cond_4
    :goto_0
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 132
    .line 133
    invoke-static {}, Ll/erh0;->a()Landroid/hardware/camera2/CaptureRequest$Key;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    iget v3, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->q:F

    .line 138
    .line 139
    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 140
    .line 141
    .line 142
    move-result-object v3

    .line 143
    invoke-virtual {p1, v0, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 144
    .line 145
    .line 146
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 147
    .line 148
    invoke-virtual {p0, p1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->v0(Landroid/hardware/camera2/CaptureRequest$Builder;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    iget-boolean v0, p1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->a:Z

    .line 153
    .line 154
    if-nez v0, :cond_a

    .line 155
    .line 156
    new-instance p2, Ljava/lang/StringBuilder;

    .line 157
    .line 158
    invoke-direct {p2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->a()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object p2

    .line 172
    invoke-static {v2, p2}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 173
    .line 174
    .line 175
    iget-object p2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 176
    .line 177
    iget-object p1, p1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->b:Ljava/lang/String;

    .line 178
    .line 179
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 180
    .line 181
    invoke-interface {p2, v1, v1, p1, p0}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 182
    .line 183
    .line 184
    return-void

    .line 185
    :cond_5
    :goto_1
    iget v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->q:F

    .line 186
    .line 187
    iget v3, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->p:F

    .line 188
    .line 189
    cmpl-float v0, v0, v3

    .line 190
    .line 191
    const-string v3, ";factor = "

    .line 192
    .line 193
    const-string v6, "mNowZoom = "

    .line 194
    .line 195
    if-ltz v0, :cond_6

    .line 196
    .line 197
    cmpl-float v0, p1, v5

    .line 198
    .line 199
    if-lez v0, :cond_6

    .line 200
    .line 201
    new-instance v0, Ljava/lang/StringBuilder;

    .line 202
    .line 203
    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 204
    .line 205
    .line 206
    iget v5, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->q:F

    .line 207
    .line 208
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 209
    .line 210
    .line 211
    const-string v5, ";mMaxZoom = "

    .line 212
    .line 213
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 214
    .line 215
    .line 216
    iget v5, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->p:F

    .line 217
    .line 218
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 219
    .line 220
    .line 221
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 222
    .line 223
    .line 224
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 225
    .line 226
    .line 227
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 228
    .line 229
    .line 230
    move-result-object p1

    .line 231
    invoke-static {v2, p1}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 232
    .line 233
    .line 234
    iget p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->p:F

    .line 235
    .line 236
    iput p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->q:F

    .line 237
    .line 238
    goto :goto_2

    .line 239
    :cond_6
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->t:Landroid/graphics/Rect;

    .line 240
    .line 241
    if-eqz v0, :cond_7

    .line 242
    .line 243
    iget-object v7, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->F:Landroid/graphics/Rect;

    .line 244
    .line 245
    invoke-virtual {v0, v7}, Landroid/graphics/Rect;->equals(Ljava/lang/Object;)Z

    .line 246
    .line 247
    .line 248
    move-result v0

    .line 249
    if-eqz v0, :cond_7

    .line 250
    .line 251
    cmpg-float v0, p1, v5

    .line 252
    .line 253
    if-gtz v0, :cond_7

    .line 254
    .line 255
    new-instance v0, Ljava/lang/StringBuilder;

    .line 256
    .line 257
    const-string v6, "mZoomSize = "

    .line 258
    .line 259
    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 260
    .line 261
    .line 262
    iget-object v6, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->t:Landroid/graphics/Rect;

    .line 263
    .line 264
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 265
    .line 266
    .line 267
    const-string v6, ";mActiveArraySize = "

    .line 268
    .line 269
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 270
    .line 271
    .line 272
    iget-object v6, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->F:Landroid/graphics/Rect;

    .line 273
    .line 274
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 275
    .line 276
    .line 277
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 278
    .line 279
    .line 280
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 281
    .line 282
    .line 283
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 284
    .line 285
    .line 286
    move-result-object p1

    .line 287
    invoke-static {v2, p1}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 288
    .line 289
    .line 290
    iput v5, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->q:F

    .line 291
    .line 292
    goto :goto_2

    .line 293
    :cond_7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 294
    .line 295
    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 296
    .line 297
    .line 298
    iget v3, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->q:F

    .line 299
    .line 300
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 301
    .line 302
    .line 303
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 304
    .line 305
    .line 306
    move-result-object v0

    .line 307
    invoke-static {v2, v0}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 308
    .line 309
    .line 310
    iget v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->q:F

    .line 311
    .line 312
    mul-float/2addr v0, p1

    .line 313
    iput v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->q:F

    .line 314
    .line 315
    :goto_2
    iget p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->q:F

    .line 316
    .line 317
    invoke-virtual {p0, p1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->i(F)Landroid/graphics/Rect;

    .line 318
    .line 319
    .line 320
    move-result-object p1

    .line 321
    if-nez p1, :cond_8

    .line 322
    .line 323
    return-void

    .line 324
    :cond_8
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 325
    .line 326
    sget-object v3, Landroid/hardware/camera2/CaptureRequest;->SCALER_CROP_REGION:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 327
    .line 328
    invoke-virtual {v0, v3, p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 329
    .line 330
    .line 331
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 332
    .line 333
    invoke-virtual {p0, v0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->v0(Landroid/hardware/camera2/CaptureRequest$Builder;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 334
    .line 335
    .line 336
    move-result-object v0

    .line 337
    iget-boolean v3, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->a:Z

    .line 338
    .line 339
    if-nez v3, :cond_9

    .line 340
    .line 341
    new-instance p1, Ljava/lang/StringBuilder;

    .line 342
    .line 343
    invoke-direct {p1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 344
    .line 345
    .line 346
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->a()Ljava/lang/String;

    .line 347
    .line 348
    .line 349
    move-result-object p2

    .line 350
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 351
    .line 352
    .line 353
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 354
    .line 355
    .line 356
    move-result-object p1

    .line 357
    invoke-static {v2, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 358
    .line 359
    .line 360
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 361
    .line 362
    iget-object p2, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->b:Ljava/lang/String;

    .line 363
    .line 364
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 365
    .line 366
    invoke-interface {p1, v1, v1, p2, p0}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 367
    .line 368
    .line 369
    return-void

    .line 370
    :cond_9
    iput-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->t:Landroid/graphics/Rect;

    .line 371
    .line 372
    :cond_a
    if-eqz p2, :cond_b

    .line 373
    .line 374
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 375
    .line 376
    iget p1, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 377
    .line 378
    iget v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->q:F

    .line 379
    .line 380
    const/4 v1, 0x1

    .line 381
    invoke-interface {p2, p1, v0, v1}, Lcom/ss/android/ttvecamera/TECameraSettings$p;->onChange(IFZ)V

    .line 382
    .line 383
    .line 384
    :cond_b
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->y()V

    .line 385
    .line 386
    .line 387
    return-void

    .line 388
    :cond_c
    :goto_3
    const-string p1, "[VE_UI_TEST]Failed event: START_ZOOM. Code: -420. Reason: camera is null"

    .line 389
    .line 390
    invoke-static {v2, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 391
    .line 392
    .line 393
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 394
    .line 395
    iget-object p2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 396
    .line 397
    iget p2, p2, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 398
    .line 399
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 400
    .line 401
    const-string v0, "Camera info is null, may be you need reopen camera."

    .line 402
    .line 403
    invoke-interface {p1, p2, v1, v0, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 404
    .line 405
    .line 406
    return-void
.end method

.method public B()[I
    .locals 0

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public C()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 2
    .line 3
    return-object p0
.end method

.method public D()Landroid/os/Handler;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->E:Landroid/os/HandlerThread;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/os/HandlerThread;

    .line 6
    .line 7
    const-string v1, "camera thread"

    .line 8
    .line 9
    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->E:Landroid/os/HandlerThread;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 15
    .line 16
    .line 17
    const-string v0, "TECameraModeBase"

    .line 18
    .line 19
    const-string v1, "getCameraHandler, init camera thread"

    .line 20
    .line 21
    invoke-static {v0, v1}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->D:Landroid/os/Handler;

    .line 25
    .line 26
    if-nez v0, :cond_1

    .line 27
    .line 28
    new-instance v0, Landroid/os/Handler;

    .line 29
    .line 30
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->E:Landroid/os/HandlerThread;

    .line 31
    .line 32
    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 37
    .line 38
    .line 39
    iput-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->D:Landroid/os/Handler;

    .line 40
    .line 41
    :cond_1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->D:Landroid/os/Handler;

    .line 42
    .line 43
    return-object p0
.end method

.method public E()I
    .locals 0

    .line 1
    const/4 p0, 0x3

    return p0
.end method

.method public F()[F
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->b:Ll/crh0;

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    const-string v3, "TECameraModeBase"

    .line 7
    .line 8
    if-eqz v1, :cond_2

    .line 9
    .line 10
    iget-object v1, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->m:Landroid/hardware/camera2/CaptureRequest;

    .line 11
    .line 12
    if-eqz v1, :cond_2

    .line 13
    .line 14
    iget-object v1, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->d:Landroid/hardware/camera2/CameraCaptureSession;

    .line 15
    .line 16
    if-eqz v1, :cond_2

    .line 17
    .line 18
    iget-object v1, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 19
    .line 20
    if-nez v1, :cond_0

    .line 21
    .line 22
    goto/16 :goto_1

    .line 23
    .line 24
    :cond_0
    new-array v1, v2, [D

    .line 25
    .line 26
    iget-object v4, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 27
    .line 28
    sget-object v5, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_INFO_PHYSICAL_SIZE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 29
    .line 30
    invoke-virtual {v4, v5}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v4

    .line 34
    check-cast v4, Landroid/util/SizeF;

    .line 35
    .line 36
    iget-object v5, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 37
    .line 38
    sget-object v6, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_INFO_ACTIVE_ARRAY_SIZE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 39
    .line 40
    invoke-virtual {v5, v6}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v5

    .line 44
    check-cast v5, Landroid/graphics/Rect;

    .line 45
    .line 46
    iget-object v6, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 47
    .line 48
    sget-object v7, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_INFO_PIXEL_ARRAY_SIZE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 49
    .line 50
    invoke-virtual {v6, v7}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v6

    .line 54
    check-cast v6, Landroid/util/Size;

    .line 55
    .line 56
    iget-object v7, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 57
    .line 58
    sget-object v8, Landroid/hardware/camera2/CaptureRequest;->LENS_FOCAL_LENGTH:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 59
    .line 60
    invoke-virtual {v7, v8}, Landroid/hardware/camera2/CaptureRequest$Builder;->get(Landroid/hardware/camera2/CaptureRequest$Key;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v7

    .line 64
    check-cast v7, Ljava/lang/Float;

    .line 65
    .line 66
    iget v8, v5, Landroid/graphics/Rect;->right:I

    .line 67
    .line 68
    iget v9, v5, Landroid/graphics/Rect;->left:I

    .line 69
    .line 70
    sub-int/2addr v8, v9

    .line 71
    invoke-static {v8}, Ljava/lang/StrictMath;->abs(I)I

    .line 72
    .line 73
    .line 74
    move-result v8

    .line 75
    iget v9, v5, Landroid/graphics/Rect;->top:I

    .line 76
    .line 77
    iget v5, v5, Landroid/graphics/Rect;->bottom:I

    .line 78
    .line 79
    sub-int/2addr v9, v5

    .line 80
    invoke-static {v9}, Ljava/lang/StrictMath;->abs(I)I

    .line 81
    .line 82
    .line 83
    move-result v5

    .line 84
    iget-object v0, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 85
    .line 86
    iget-object v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->q:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 87
    .line 88
    iget v9, v0, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 89
    .line 90
    iget v0, v0, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 91
    .line 92
    mul-int v10, v8, v0

    .line 93
    .line 94
    div-int v11, v9, v5

    .line 95
    .line 96
    const/4 v12, 0x1

    .line 97
    const/high16 v13, 0x40000000    # 2.0f

    .line 98
    .line 99
    const-wide/high16 v14, 0x4000000000000000L    # 2.0

    .line 100
    .line 101
    const/16 v16, 0x0

    .line 102
    .line 103
    if-lt v10, v11, :cond_1

    .line 104
    .line 105
    invoke-virtual {v4}, Landroid/util/SizeF;->getWidth()F

    .line 106
    .line 107
    .line 108
    move-result v10

    .line 109
    int-to-float v11, v8

    .line 110
    mul-float/2addr v10, v11

    .line 111
    invoke-virtual {v6}, Landroid/util/Size;->getWidth()I

    .line 112
    .line 113
    .line 114
    move-result v11

    .line 115
    int-to-float v11, v11

    .line 116
    div-float/2addr v10, v11

    .line 117
    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    .line 118
    .line 119
    .line 120
    move-result v11

    .line 121
    mul-float/2addr v11, v13

    .line 122
    div-float/2addr v10, v11

    .line 123
    float-to-double v10, v10

    .line 124
    invoke-static {v10, v11}, Ljava/lang/StrictMath;->atan(D)D

    .line 125
    .line 126
    .line 127
    move-result-wide v10

    .line 128
    mul-double/2addr v10, v14

    .line 129
    aput-wide v10, v1, v16

    .line 130
    .line 131
    invoke-virtual {v4}, Landroid/util/SizeF;->getHeight()F

    .line 132
    .line 133
    .line 134
    move-result v4

    .line 135
    int-to-float v10, v5

    .line 136
    mul-float/2addr v4, v10

    .line 137
    invoke-virtual {v6}, Landroid/util/Size;->getHeight()I

    .line 138
    .line 139
    .line 140
    move-result v6

    .line 141
    int-to-float v6, v6

    .line 142
    div-float/2addr v4, v6

    .line 143
    div-int/2addr v9, v0

    .line 144
    int-to-float v0, v9

    .line 145
    mul-float/2addr v4, v0

    .line 146
    div-int/2addr v8, v5

    .line 147
    int-to-float v0, v8

    .line 148
    div-float/2addr v4, v0

    .line 149
    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    mul-float/2addr v0, v13

    .line 154
    div-float/2addr v4, v0

    .line 155
    float-to-double v4, v4

    .line 156
    invoke-static {v4, v5}, Ljava/lang/StrictMath;->atan(D)D

    .line 157
    .line 158
    .line 159
    move-result-wide v4

    .line 160
    mul-double/2addr v4, v14

    .line 161
    aput-wide v4, v1, v12

    .line 162
    .line 163
    goto :goto_0

    .line 164
    :cond_1
    invoke-virtual {v4}, Landroid/util/SizeF;->getHeight()F

    .line 165
    .line 166
    .line 167
    move-result v10

    .line 168
    int-to-float v11, v5

    .line 169
    mul-float/2addr v10, v11

    .line 170
    invoke-virtual {v6}, Landroid/util/Size;->getHeight()I

    .line 171
    .line 172
    .line 173
    move-result v11

    .line 174
    int-to-float v11, v11

    .line 175
    div-float/2addr v10, v11

    .line 176
    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    .line 177
    .line 178
    .line 179
    move-result v11

    .line 180
    mul-float/2addr v11, v13

    .line 181
    div-float/2addr v10, v11

    .line 182
    float-to-double v10, v10

    .line 183
    invoke-static {v10, v11}, Ljava/lang/StrictMath;->atan(D)D

    .line 184
    .line 185
    .line 186
    move-result-wide v10

    .line 187
    mul-double/2addr v10, v14

    .line 188
    aput-wide v10, v1, v12

    .line 189
    .line 190
    invoke-virtual {v4}, Landroid/util/SizeF;->getWidth()F

    .line 191
    .line 192
    .line 193
    move-result v4

    .line 194
    int-to-float v10, v8

    .line 195
    mul-float/2addr v4, v10

    .line 196
    invoke-virtual {v6}, Landroid/util/Size;->getWidth()I

    .line 197
    .line 198
    .line 199
    move-result v6

    .line 200
    int-to-float v6, v6

    .line 201
    div-float/2addr v4, v6

    .line 202
    div-int/2addr v0, v9

    .line 203
    int-to-float v0, v0

    .line 204
    mul-float/2addr v4, v0

    .line 205
    div-int/2addr v5, v8

    .line 206
    int-to-float v0, v5

    .line 207
    div-float/2addr v4, v0

    .line 208
    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    .line 209
    .line 210
    .line 211
    move-result v0

    .line 212
    mul-float/2addr v0, v13

    .line 213
    div-float/2addr v4, v0

    .line 214
    float-to-double v4, v4

    .line 215
    invoke-static {v4, v5}, Ljava/lang/StrictMath;->atan(D)D

    .line 216
    .line 217
    .line 218
    move-result-wide v4

    .line 219
    mul-double/2addr v4, v14

    .line 220
    aput-wide v4, v1, v16

    .line 221
    .line 222
    :goto_0
    aget-wide v4, v1, v12

    .line 223
    .line 224
    const-wide v6, 0x4066800000000000L    # 180.0

    .line 225
    .line 226
    .line 227
    .line 228
    .line 229
    mul-double/2addr v4, v6

    .line 230
    const-wide v8, 0x400921fb54442d18L    # Math.PI

    .line 231
    .line 232
    .line 233
    .line 234
    .line 235
    div-double/2addr v4, v8

    .line 236
    double-to-float v0, v4

    .line 237
    aget-wide v4, v1, v16

    .line 238
    .line 239
    mul-double/2addr v4, v6

    .line 240
    div-double/2addr v4, v8

    .line 241
    double-to-float v1, v4

    .line 242
    new-array v2, v2, [F

    .line 243
    .line 244
    aput v0, v2, v16

    .line 245
    .line 246
    aput v1, v2, v12

    .line 247
    .line 248
    new-instance v0, Ljava/lang/StringBuilder;

    .line 249
    .line 250
    const-string v1, "Camera2:verticalFOV = "

    .line 251
    .line 252
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 253
    .line 254
    .line 255
    aget v1, v2, v16

    .line 256
    .line 257
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 258
    .line 259
    .line 260
    const-string v1, ",horizontalFOV = "

    .line 261
    .line 262
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 263
    .line 264
    .line 265
    aget v1, v2, v12

    .line 266
    .line 267
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 268
    .line 269
    .line 270
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 271
    .line 272
    .line 273
    move-result-object v0

    .line 274
    invoke-static {v3, v0}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 275
    .line 276
    .line 277
    return-object v2

    .line 278
    :cond_2
    :goto_1
    const-string v0, "Env is null"

    .line 279
    .line 280
    invoke-static {v3, v0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 281
    .line 282
    .line 283
    new-array v0, v2, [F

    .line 284
    .line 285
    fill-array-data v0, :array_0

    .line 286
    .line 287
    .line 288
    return-object v0

    .line 289
    :array_0
    .array-data 4
        -0x40000000    # -2.0f
        -0x40000000    # -2.0f
    .end array-data
.end method

.method public G()I
    .locals 0

    .line 1
    const/4 p0, -0x1

    return p0
.end method

.method public H()I
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->d:Landroid/hardware/camera2/CameraCaptureSession;

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 10
    .line 11
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 12
    .line 13
    const/16 v2, -0x1ae

    .line 14
    .line 15
    const-string v3, "Capture Session is null"

    .line 16
    .line 17
    invoke-interface {v0, v2, v2, v3, v1}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    :cond_1
    iget p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->C:I

    .line 21
    .line 22
    return p0
.end method

.method public I()[I
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->d:Landroid/hardware/camera2/CameraCaptureSession;

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 10
    .line 11
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 12
    .line 13
    const/16 v2, -0x1ae

    .line 14
    .line 15
    const-string v3, "Capture Session is null"

    .line 16
    .line 17
    invoke-interface {v0, v2, v2, v3, v1}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    :cond_1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 21
    .line 22
    sget-object v0, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_INFO_SENSITIVITY_RANGE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    check-cast p0, Landroid/util/Range;

    .line 29
    .line 30
    if-eqz p0, :cond_3

    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Ljava/lang/Integer;

    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    const/16 v1, 0x320

    .line 43
    .line 44
    if-lt v0, v1, :cond_3

    .line 45
    .line 46
    invoke-virtual {p0}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Ljava/lang/Integer;

    .line 51
    .line 52
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    const/16 v1, 0x64

    .line 57
    .line 58
    if-le v0, v1, :cond_2

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_2
    invoke-virtual {p0}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    check-cast v0, Ljava/lang/Integer;

    .line 66
    .line 67
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    invoke-virtual {p0}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    check-cast p0, Ljava/lang/Integer;

    .line 76
    .line 77
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 78
    .line 79
    .line 80
    move-result p0

    .line 81
    filled-new-array {v0, p0}, [I

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    return-object p0

    .line 86
    :cond_3
    :goto_0
    const/4 p0, -0x1

    .line 87
    filled-new-array {p0, p0}, [I

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    return-object p0
.end method

.method public J()F
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 2
    .line 3
    const/16 v1, -0x1b3

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->d:Landroid/hardware/camera2/CameraCaptureSession;

    .line 8
    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 12
    .line 13
    iget-object v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 14
    .line 15
    const-string v3, "Capture Session is null"

    .line 16
    .line 17
    invoke-interface {v0, v1, v1, v3, v2}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    :cond_1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 21
    .line 22
    sget-object v2, Landroid/hardware/camera2/CameraCharacteristics;->LENS_INFO_MINIMUM_FOCUS_DISTANCE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 23
    .line 24
    invoke-virtual {v0, v2}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const/high16 v3, -0x40800000    # -1.0f

    .line 29
    .line 30
    if-nez v0, :cond_2

    .line 31
    .line 32
    move v0, v3

    .line 33
    goto :goto_0

    .line 34
    :cond_2
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 35
    .line 36
    invoke-virtual {v0, v2}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Ljava/lang/Float;

    .line 41
    .line 42
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    :goto_0
    const/4 v2, 0x0

    .line 47
    cmpg-float v2, v0, v2

    .line 48
    .line 49
    if-gez v2, :cond_3

    .line 50
    .line 51
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 52
    .line 53
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 54
    .line 55
    const-string v2, "can not get manual focus ability"

    .line 56
    .line 57
    invoke-interface {v0, v1, v1, v2, p0}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 58
    .line 59
    .line 60
    return v3

    .line 61
    :cond_3
    return v0
.end method

.method public K()[I
    .locals 0

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public L()[I
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    return-object v0

    .line 7
    :cond_0
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_TARGET_FPS_RANGE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 8
    .line 9
    invoke-virtual {p0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->get(Landroid/hardware/camera2/CaptureRequest$Key;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Landroid/util/Range;

    .line 14
    .line 15
    if-nez p0, :cond_1

    .line 16
    .line 17
    return-object v0

    .line 18
    :cond_1
    invoke-virtual {p0}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Ljava/lang/Integer;

    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    invoke-virtual {p0}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    check-cast p0, Ljava/lang/Integer;

    .line 33
    .line 34
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    filled-new-array {v0, p0}, [I

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0
.end method

.method public M(Ljava/util/List;)I
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/view/Surface;",
            ">;)I"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public N()[J
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->d:Landroid/hardware/camera2/CameraCaptureSession;

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 10
    .line 11
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 12
    .line 13
    const/16 v2, -0x1af

    .line 14
    .line 15
    const-string v3, "Capture Session is null"

    .line 16
    .line 17
    invoke-interface {v0, v2, v2, v3, v1}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    :cond_1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 21
    .line 22
    sget-object v0, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_INFO_EXPOSURE_TIME_RANGE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    check-cast p0, Landroid/util/Range;

    .line 29
    .line 30
    const/4 v0, 0x2

    .line 31
    if-nez p0, :cond_2

    .line 32
    .line 33
    new-array p0, v0, [J

    .line 34
    .line 35
    fill-array-data p0, :array_0

    .line 36
    .line 37
    .line 38
    return-object p0

    .line 39
    :cond_2
    invoke-virtual {p0}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    check-cast v1, Ljava/lang/Long;

    .line 44
    .line 45
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 46
    .line 47
    .line 48
    move-result-wide v1

    .line 49
    invoke-virtual {p0}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    check-cast p0, Ljava/lang/Long;

    .line 54
    .line 55
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 56
    .line 57
    .line 58
    move-result-wide v3

    .line 59
    new-array p0, v0, [J

    .line 60
    .line 61
    const/4 v0, 0x0

    .line 62
    aput-wide v1, p0, v0

    .line 63
    .line 64
    const/4 v0, 0x1

    .line 65
    aput-wide v3, p0, v0

    .line 66
    .line 67
    return-object p0

    .line 68
    nop

    .line 69
    :array_0
    .array-data 8
        -0x1
        -0x1
    .end array-data
.end method

.method public O()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method

.method public P(Ljava/lang/String;I)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/hardware/camera2/CameraAccessException;
        }
    .end annotation

    .line 1
    const-string p1, "TECameraModeBase-openCamera"

    .line 2
    .line 3
    invoke-static {p1}, Ll/dsh0;->a(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 7
    .line 8
    const/16 v0, -0x1b7

    .line 9
    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    const-string p0, "TECameraModeBase"

    .line 13
    .line 14
    const-string p1, "open failed, mCameraCharacteristics = null"

    .line 15
    .line 16
    invoke-static {p0, p1}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return v0

    .line 20
    :cond_0
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->b:Ll/crh0;

    .line 21
    .line 22
    invoke-virtual {v1, p1, p2}, Ll/crh0;->n(Landroid/hardware/camera2/CameraCharacteristics;I)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-nez p1, :cond_1

    .line 27
    .line 28
    const/16 p0, -0x193

    .line 29
    .line 30
    return p0

    .line 31
    :cond_1
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 32
    .line 33
    iget-object p2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 34
    .line 35
    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_ORIENTATION:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 36
    .line 37
    invoke-virtual {p2, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    check-cast p2, Ljava/lang/Integer;

    .line 42
    .line 43
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 44
    .line 45
    .line 46
    move-result p2

    .line 47
    iput p2, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->e:I

    .line 48
    .line 49
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 50
    .line 51
    sget-object p2, Landroid/hardware/camera2/CameraCharacteristics;->SCALER_STREAM_CONFIGURATION_MAP:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 52
    .line 53
    invoke-virtual {p1, p2}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    check-cast p1, Landroid/hardware/camera2/params/StreamConfigurationMap;

    .line 58
    .line 59
    iput-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->l:Landroid/hardware/camera2/params/StreamConfigurationMap;

    .line 60
    .line 61
    if-nez p1, :cond_2

    .line 62
    .line 63
    return v0

    .line 64
    :cond_2
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->b:Ll/crh0;

    .line 65
    .line 66
    iget-object p2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 67
    .line 68
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 69
    .line 70
    iget v1, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 71
    .line 72
    iget v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->p:F

    .line 73
    .line 74
    invoke-virtual {p1, p2, v1, v0}, Ll/crh0;->e(Landroid/hardware/camera2/CameraCharacteristics;IF)F

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    iput p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->p:F

    .line 79
    .line 80
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 81
    .line 82
    iget p2, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->t0:F

    .line 83
    .line 84
    const/high16 v0, -0x40800000    # -1.0f

    .line 85
    .line 86
    cmpl-float p2, p2, v0

    .line 87
    .line 88
    if-eqz p2, :cond_4

    .line 89
    .line 90
    iget p1, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->u0:F

    .line 91
    .line 92
    cmpl-float p1, p1, v0

    .line 93
    .line 94
    if-nez p1, :cond_3

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_3
    new-instance p1, Landroid/util/Range;

    .line 98
    .line 99
    iget-object p2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 100
    .line 101
    iget p2, p2, Lcom/ss/android/ttvecamera/TECameraSettings;->u0:F

    .line 102
    .line 103
    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 104
    .line 105
    .line 106
    move-result-object p2

    .line 107
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 108
    .line 109
    iget v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->t0:F

    .line 110
    .line 111
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-direct {p1, p2, v0}, Landroid/util/Range;-><init>(Ljava/lang/Comparable;Ljava/lang/Comparable;)V

    .line 116
    .line 117
    .line 118
    iput-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->r:Landroid/util/Range;

    .line 119
    .line 120
    goto :goto_1

    .line 121
    :cond_4
    :goto_0
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->b:Ll/crh0;

    .line 122
    .line 123
    iget-object p2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 124
    .line 125
    invoke-virtual {p1, p2}, Ll/crh0;->j(Landroid/hardware/camera2/CameraCharacteristics;)Landroid/util/Range;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    iput-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->r:Landroid/util/Range;

    .line 130
    .line 131
    :goto_1
    const/high16 p1, 0x3f800000    # 1.0f

    .line 132
    .line 133
    iput p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->q:F

    .line 134
    .line 135
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 136
    .line 137
    sget-object p2, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_INFO_ACTIVE_ARRAY_SIZE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 138
    .line 139
    invoke-virtual {p1, p2}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    check-cast p1, Landroid/graphics/Rect;

    .line 144
    .line 145
    iput-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->F:Landroid/graphics/Rect;

    .line 146
    .line 147
    invoke-direct {p0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->b0()V

    .line 148
    .line 149
    .line 150
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 151
    .line 152
    iget-object p1, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->E:Landroid/os/Bundle;

    .line 153
    .line 154
    const-string p2, "useCameraFaceDetect"

    .line 155
    .line 156
    invoke-virtual {p1, p2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 157
    .line 158
    .line 159
    move-result p1

    .line 160
    iput p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->y:I

    .line 161
    .line 162
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 163
    .line 164
    sget-object p2, Landroid/hardware/camera2/CameraCharacteristics;->STATISTICS_INFO_AVAILABLE_FACE_DETECT_MODES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 165
    .line 166
    invoke-virtual {p1, p2}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 167
    .line 168
    .line 169
    move-result-object p1

    .line 170
    check-cast p1, [I

    .line 171
    .line 172
    iput-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->x:[I

    .line 173
    .line 174
    const/4 p1, 0x0

    .line 175
    iput p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->s:I

    .line 176
    .line 177
    invoke-static {}, Ll/dsh0;->b()V

    .line 178
    .line 179
    .line 180
    return p1
.end method

.method public Q()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->g:Lcom/ss/android/ttvecamera/b;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/b;->X0()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v0, "openCameraLock failed, "

    .line 12
    .line 13
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Lcom/ss/android/ttvecamera/g;->d()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string v0, "TECameraModeBase"

    .line 28
    .line 29
    invoke-static {v0, p0}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public R()I
    .locals 8

    .line 1
    const-string v0, "TECameraModeBase-prepareProvider"

    .line 2
    .line 3
    invoke-static {v0}, Ll/dsh0;->a(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->g:Lcom/ss/android/ttvecamera/b;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/c;->K()Ll/jrh0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->C()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const/16 v2, -0x64

    .line 17
    .line 18
    const-string v3, "TECameraModeBase"

    .line 19
    .line 20
    if-eqz v1, :cond_9

    .line 21
    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    goto/16 :goto_3

    .line 25
    .line 26
    :cond_0
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->l:Landroid/hardware/camera2/params/StreamConfigurationMap;

    .line 27
    .line 28
    if-nez v1, :cond_1

    .line 29
    .line 30
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 31
    .line 32
    sget-object v4, Landroid/hardware/camera2/CameraCharacteristics;->SCALER_STREAM_CONFIGURATION_MAP:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 33
    .line 34
    invoke-virtual {v1, v4}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    check-cast v1, Landroid/hardware/camera2/params/StreamConfigurationMap;

    .line 39
    .line 40
    iput-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->l:Landroid/hardware/camera2/params/StreamConfigurationMap;

    .line 41
    .line 42
    :cond_1
    invoke-virtual {v0}, Ll/jrh0;->f()Ll/irh0;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v1}, Ll/irh0;->j()Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    const/4 v4, 0x0

    .line 51
    if-eqz v1, :cond_2

    .line 52
    .line 53
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->v:Lcom/ss/android/ttvecamera/c$e;

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ll/jrh0;->l(Lcom/ss/android/ttvecamera/c$e;)V

    .line 56
    .line 57
    .line 58
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->l:Landroid/hardware/camera2/params/StreamConfigurationMap;

    .line 59
    .line 60
    const/4 v5, 0x0

    .line 61
    invoke-virtual {v0, v1, v5}, Ll/jrh0;->i(Landroid/hardware/camera2/params/StreamConfigurationMap;Lcom/ss/android/ttvecamera/TEFrameSizei;)I

    .line 62
    .line 63
    .line 64
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 65
    .line 66
    invoke-virtual {v0}, Ll/jrh0;->c()Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 67
    .line 68
    .line 69
    move-result-object v5

    .line 70
    iput-object v5, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->q:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 71
    .line 72
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 73
    .line 74
    iget-object v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->q:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 75
    .line 76
    if-eqz v1, :cond_3

    .line 77
    .line 78
    iget-object v5, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 79
    .line 80
    invoke-virtual {v1}, Lcom/ss/android/ttvecamera/TEFrameSizei;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    iget-object v6, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 85
    .line 86
    const/16 v7, 0x32

    .line 87
    .line 88
    invoke-interface {v5, v7, v4, v1, v6}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 89
    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_2
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->l:Landroid/hardware/camera2/params/StreamConfigurationMap;

    .line 93
    .line 94
    iget-object v5, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 95
    .line 96
    iget-object v5, v5, Lcom/ss/android/ttvecamera/TECameraSettings;->q:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 97
    .line 98
    invoke-virtual {v0, v1, v5}, Ll/jrh0;->i(Landroid/hardware/camera2/params/StreamConfigurationMap;Lcom/ss/android/ttvecamera/TEFrameSizei;)I

    .line 99
    .line 100
    .line 101
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 102
    .line 103
    invoke-virtual {v0}, Ll/jrh0;->b()Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 104
    .line 105
    .line 106
    move-result-object v5

    .line 107
    iput-object v5, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->r:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 108
    .line 109
    :cond_3
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 110
    .line 111
    const-string v5, "Camera provider type: "

    .line 112
    .line 113
    invoke-direct {v1, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {v0}, Ll/jrh0;->g()I

    .line 117
    .line 118
    .line 119
    move-result v5

    .line 120
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    invoke-static {v3, v1}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    invoke-virtual {v0}, Ll/jrh0;->g()I

    .line 131
    .line 132
    .line 133
    move-result v1

    .line 134
    const/4 v5, 0x1

    .line 135
    if-eq v1, v5, :cond_7

    .line 136
    .line 137
    invoke-virtual {v0}, Ll/jrh0;->g()I

    .line 138
    .line 139
    .line 140
    move-result v1

    .line 141
    const/16 v5, 0x10

    .line 142
    .line 143
    if-ne v1, v5, :cond_4

    .line 144
    .line 145
    goto :goto_1

    .line 146
    :cond_4
    invoke-virtual {v0}, Ll/jrh0;->g()I

    .line 147
    .line 148
    .line 149
    move-result v1

    .line 150
    const/4 v2, 0x2

    .line 151
    if-ne v1, v2, :cond_5

    .line 152
    .line 153
    goto :goto_2

    .line 154
    :cond_5
    invoke-virtual {v0}, Ll/jrh0;->g()I

    .line 155
    .line 156
    .line 157
    move-result v1

    .line 158
    const/16 v2, 0x8

    .line 159
    .line 160
    if-ne v1, v2, :cond_6

    .line 161
    .line 162
    invoke-virtual {v0}, Ll/jrh0;->h()Landroid/graphics/SurfaceTexture;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 167
    .line 168
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->q:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 169
    .line 170
    iget v1, p0, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 171
    .line 172
    iget p0, p0, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 173
    .line 174
    invoke-virtual {v0, v1, p0}, Landroid/graphics/SurfaceTexture;->setDefaultBufferSize(II)V

    .line 175
    .line 176
    .line 177
    goto :goto_2

    .line 178
    :cond_6
    new-instance p0, Ljava/lang/StringBuilder;

    .line 179
    .line 180
    const-string v1, "Unsupported camera provider type : "

    .line 181
    .line 182
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 183
    .line 184
    .line 185
    invoke-virtual {v0}, Ll/jrh0;->g()I

    .line 186
    .line 187
    .line 188
    move-result v0

    .line 189
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 190
    .line 191
    .line 192
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object p0

    .line 196
    invoke-static {v3, p0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 197
    .line 198
    .line 199
    const/16 p0, -0xc8

    .line 200
    .line 201
    return p0

    .line 202
    :cond_7
    :goto_1
    invoke-virtual {v0}, Ll/jrh0;->h()Landroid/graphics/SurfaceTexture;

    .line 203
    .line 204
    .line 205
    move-result-object v1

    .line 206
    if-nez v1, :cond_8

    .line 207
    .line 208
    const-string p0, "SurfaceTexture is null."

    .line 209
    .line 210
    invoke-static {v3, p0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 211
    .line 212
    .line 213
    return v2

    .line 214
    :cond_8
    invoke-virtual {v0}, Ll/jrh0;->h()Landroid/graphics/SurfaceTexture;

    .line 215
    .line 216
    .line 217
    move-result-object v0

    .line 218
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 219
    .line 220
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->q:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 221
    .line 222
    iget v1, p0, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 223
    .line 224
    iget p0, p0, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 225
    .line 226
    invoke-virtual {v0, v1, p0}, Landroid/graphics/SurfaceTexture;->setDefaultBufferSize(II)V

    .line 227
    .line 228
    .line 229
    :goto_2
    invoke-static {}, Ll/dsh0;->b()V

    .line 230
    .line 231
    .line 232
    return v4

    .line 233
    :cond_9
    :goto_3
    const-string p0, "CameraDevice or ProviderManager is null!"

    .line 234
    .line 235
    invoke-static {v3, p0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 236
    .line 237
    .line 238
    return v2
.end method

.method public S()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->E:Landroid/os/HandlerThread;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/os/HandlerThread;->quitSafely()Z

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->E:Landroid/os/HandlerThread;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->D:Landroid/os/Handler;

    .line 12
    .line 13
    const-string p0, "TECameraModeBase"

    .line 14
    .line 15
    const-string v0, "releaseCameraThread"

    .line 16
    .line 17
    invoke-static {p0, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public T()V
    .locals 2

    .line 1
    const-string v0, "TECameraModeBase"

    .line 2
    .line 3
    const-string v1, "removeFocusSettings"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->i:Ll/orh0;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {v0, v1}, Ll/orh0;->h(Lcom/ss/android/ttvecamera/TEFocusSettings;)V

    .line 14
    .line 15
    .line 16
    iput-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->A:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public U()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->t:Landroid/graphics/Rect;

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->K:I

    .line 6
    .line 7
    return-void
.end method

.method public V(I)Ljava/lang/String;
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/hardware/camera2/CameraAccessException;
        }
    .end annotation

    .line 1
    const-string v0, "TECameraModeBase-selectCamera"

    .line 2
    .line 3
    invoke-static {v0}, Ll/dsh0;->a(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->e:Landroid/hardware/camera2/CameraManager;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/hardware/camera2/CameraManager;->getCameraIdList()[Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x0

    .line 13
    const-string v2, "TECameraModeBase"

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    const-string p0, "cameraList is null"

    .line 18
    .line 19
    invoke-static {v2, p0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-object v1

    .line 23
    :cond_0
    array-length v3, v0

    .line 24
    int-to-long v3, v3

    .line 25
    const-string v5, "te_record_camera_size"

    .line 26
    .line 27
    invoke-static {v5, v3, v4}, Ll/hrh0;->b(Ljava/lang/String;J)V

    .line 28
    .line 29
    .line 30
    iget-object v3, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 31
    .line 32
    iget-object v3, v3, Lcom/ss/android/ttvecamera/TECameraSettings;->E:Landroid/os/Bundle;

    .line 33
    .line 34
    const-string v4, "ve_enable_camera_devices_cache"

    .line 35
    .line 36
    invoke-virtual {v3, v4}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    if-eqz v3, :cond_1

    .line 41
    .line 42
    const-string v1, "Enable CameraDeviceCache"

    .line 43
    .line 44
    invoke-static {v2, v1}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->P:Ljava/util/HashMap;

    .line 48
    .line 49
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    check-cast v1, Ljava/lang/String;

    .line 58
    .line 59
    :cond_1
    const/4 v3, 0x0

    .line 60
    if-eqz v1, :cond_2

    .line 61
    .line 62
    const-string v4, ""

    .line 63
    .line 64
    if-ne v1, v4, :cond_f

    .line 65
    .line 66
    :cond_2
    const/4 v4, 0x2

    .line 67
    if-ne p1, v4, :cond_6

    .line 68
    .line 69
    iget-object v4, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 70
    .line 71
    iget-object v4, v4, Lcom/ss/android/ttvecamera/TECameraSettings;->J:Ljava/lang/String;

    .line 72
    .line 73
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 74
    .line 75
    .line 76
    move-result v4

    .line 77
    if-lez v4, :cond_4

    .line 78
    .line 79
    iget-object v4, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 80
    .line 81
    iget-object v4, v4, Lcom/ss/android/ttvecamera/TECameraSettings;->J:Ljava/lang/String;

    .line 82
    .line 83
    const-string v5, "-1"

    .line 84
    .line 85
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result v4

    .line 89
    if-nez v4, :cond_4

    .line 90
    .line 91
    new-instance v4, Ljava/lang/StringBuilder;

    .line 92
    .line 93
    const-string v5, "Wide-angle camera id: "

    .line 94
    .line 95
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    iget-object v5, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 99
    .line 100
    iget-object v5, v5, Lcom/ss/android/ttvecamera/TECameraSettings;->J:Ljava/lang/String;

    .line 101
    .line 102
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v4

    .line 109
    invoke-static {v2, v4}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    iget-object v4, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 113
    .line 114
    iget-object v4, v4, Lcom/ss/android/ttvecamera/TECameraSettings;->J:Ljava/lang/String;

    .line 115
    .line 116
    invoke-static {v0, v4}, Lcom/ss/android/ttvecamera/f;->g([Ljava/lang/String;Ljava/lang/String;)Z

    .line 117
    .line 118
    .line 119
    move-result v4

    .line 120
    iget-object v5, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 121
    .line 122
    if-eqz v4, :cond_3

    .line 123
    .line 124
    iget-object v1, v5, Lcom/ss/android/ttvecamera/TECameraSettings;->J:Ljava/lang/String;

    .line 125
    .line 126
    goto :goto_0

    .line 127
    :cond_3
    new-instance v4, Ljava/lang/StringBuilder;

    .line 128
    .line 129
    const-string v6, "Maybe this is not validate camera id: "

    .line 130
    .line 131
    invoke-direct {v4, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    iget-object v5, v5, Lcom/ss/android/ttvecamera/TECameraSettings;->J:Ljava/lang/String;

    .line 135
    .line 136
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v4

    .line 143
    invoke-static {v2, v4}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    goto :goto_0

    .line 147
    :cond_4
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 148
    .line 149
    iget v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 150
    .line 151
    const/16 v4, 0x8

    .line 152
    .line 153
    if-ne v1, v4, :cond_5

    .line 154
    .line 155
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->g:Lcom/ss/android/ttvecamera/b;

    .line 156
    .line 157
    invoke-virtual {v1}, Lcom/ss/android/ttvecamera/c;->P()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v1

    .line 161
    goto :goto_0

    .line 162
    :cond_5
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->b:Ll/crh0;

    .line 163
    .line 164
    iget-object v4, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->e:Landroid/hardware/camera2/CameraManager;

    .line 165
    .line 166
    invoke-virtual {v1, v0, v4}, Ll/crh0;->i([Ljava/lang/String;Landroid/hardware/camera2/CameraManager;)Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v1

    .line 170
    :goto_0
    iget-object v4, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 171
    .line 172
    const-string v5, "enable wide angle"

    .line 173
    .line 174
    iget-object v6, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 175
    .line 176
    const/16 v7, 0x70

    .line 177
    .line 178
    invoke-interface {v4, v7, v3, v5, v6}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 179
    .line 180
    .line 181
    goto/16 :goto_4

    .line 182
    .line 183
    :cond_6
    const/4 v5, 0x3

    .line 184
    if-ne p1, v5, :cond_7

    .line 185
    .line 186
    iget-object v5, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 187
    .line 188
    iget v5, v5, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 189
    .line 190
    if-ne v5, v4, :cond_e

    .line 191
    .line 192
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->b:Ll/crh0;

    .line 193
    .line 194
    iget-object v4, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->e:Landroid/hardware/camera2/CameraManager;

    .line 195
    .line 196
    invoke-virtual {v1, v0, v4}, Ll/crh0;->g([Ljava/lang/String;Landroid/hardware/camera2/CameraManager;)Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object v1

    .line 200
    goto/16 :goto_4

    .line 201
    .line 202
    :cond_7
    array-length v4, v0

    .line 203
    const/4 v5, 0x1

    .line 204
    if-ge p1, v4, :cond_8

    .line 205
    .line 206
    if-gez p1, :cond_9

    .line 207
    .line 208
    :cond_8
    move p1, v5

    .line 209
    :cond_9
    iget-object v4, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 210
    .line 211
    iput p1, v4, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 212
    .line 213
    iget-boolean v6, v4, Lcom/ss/android/ttvecamera/TECameraSettings;->l0:Z

    .line 214
    .line 215
    if-eqz v6, :cond_a

    .line 216
    .line 217
    iget-object v4, v4, Lcom/ss/android/ttvecamera/TECameraSettings;->J:Ljava/lang/String;

    .line 218
    .line 219
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 220
    .line 221
    .line 222
    move-result v4

    .line 223
    if-nez v4, :cond_a

    .line 224
    .line 225
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 226
    .line 227
    iget-object v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->J:Ljava/lang/String;

    .line 228
    .line 229
    goto :goto_1

    .line 230
    :cond_a
    iget-object v4, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 231
    .line 232
    iget-boolean v4, v4, Lcom/ss/android/ttvecamera/TECameraSettings;->l:Z

    .line 233
    .line 234
    if-eqz v4, :cond_b

    .line 235
    .line 236
    invoke-static {}, Ll/arh0;->d()Z

    .line 237
    .line 238
    .line 239
    move-result v4

    .line 240
    if-eqz v4, :cond_b

    .line 241
    .line 242
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->b:Ll/crh0;

    .line 243
    .line 244
    check-cast v1, Ll/lrh0;

    .line 245
    .line 246
    iget-object v4, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->e:Landroid/hardware/camera2/CameraManager;

    .line 247
    .line 248
    invoke-virtual {v1, v4, p1, v0}, Ll/lrh0;->w(Landroid/hardware/camera2/CameraManager;I[Ljava/lang/String;)Ljava/lang/String;

    .line 249
    .line 250
    .line 251
    move-result-object v1

    .line 252
    :cond_b
    :goto_1
    if-nez v1, :cond_e

    .line 253
    .line 254
    array-length v4, v0

    .line 255
    move v6, v3

    .line 256
    :goto_2
    if-ge v6, v4, :cond_e

    .line 257
    .line 258
    aget-object v7, v0, v6

    .line 259
    .line 260
    iget-object v8, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->e:Landroid/hardware/camera2/CameraManager;

    .line 261
    .line 262
    invoke-virtual {v8, v7}, Landroid/hardware/camera2/CameraManager;->getCameraCharacteristics(Ljava/lang/String;)Landroid/hardware/camera2/CameraCharacteristics;

    .line 263
    .line 264
    .line 265
    move-result-object v8

    .line 266
    sget-object v9, Landroid/hardware/camera2/CameraCharacteristics;->LENS_FACING:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 267
    .line 268
    invoke-virtual {v8, v9}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 269
    .line 270
    .line 271
    move-result-object v8

    .line 272
    check-cast v8, Ljava/lang/Integer;

    .line 273
    .line 274
    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    .line 275
    .line 276
    .line 277
    move-result v8

    .line 278
    if-ne v8, v5, :cond_c

    .line 279
    .line 280
    move v8, v3

    .line 281
    goto :goto_3

    .line 282
    :cond_c
    move v8, v5

    .line 283
    :goto_3
    iget-object v9, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->P:Ljava/util/HashMap;

    .line 284
    .line 285
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 286
    .line 287
    .line 288
    move-result-object v10

    .line 289
    invoke-virtual {v9, v10, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 290
    .line 291
    .line 292
    if-ne v8, p1, :cond_d

    .line 293
    .line 294
    move-object v1, v7

    .line 295
    goto :goto_4

    .line 296
    :cond_d
    add-int/lit8 v6, v6, 0x1

    .line 297
    .line 298
    goto :goto_2

    .line 299
    :cond_e
    :goto_4
    if-eqz v1, :cond_f

    .line 300
    .line 301
    iget-object v4, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->P:Ljava/util/HashMap;

    .line 302
    .line 303
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 304
    .line 305
    .line 306
    move-result-object p1

    .line 307
    invoke-virtual {v4, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 308
    .line 309
    .line 310
    :cond_f
    if-nez v1, :cond_10

    .line 311
    .line 312
    const-string p1, "selectCamera: camera tag is null, set 0 for default"

    .line 313
    .line 314
    invoke-static {v2, p1}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 315
    .line 316
    .line 317
    const-string v1, "0"

    .line 318
    .line 319
    :cond_10
    new-instance p1, Ljava/lang/StringBuilder;

    .line 320
    .line 321
    const-string v4, "selectCamera size: "

    .line 322
    .line 323
    invoke-direct {p1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 324
    .line 325
    .line 326
    array-length v0, v0

    .line 327
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 328
    .line 329
    .line 330
    const-string v0, ", mFacing: "

    .line 331
    .line 332
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 333
    .line 334
    .line 335
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 336
    .line 337
    iget v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 338
    .line 339
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 340
    .line 341
    .line 342
    const-string v0, ", cameraTag: "

    .line 343
    .line 344
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 345
    .line 346
    .line 347
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 348
    .line 349
    .line 350
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 351
    .line 352
    .line 353
    move-result-object p1

    .line 354
    invoke-static {v2, p1}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 355
    .line 356
    .line 357
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->e:Landroid/hardware/camera2/CameraManager;

    .line 358
    .line 359
    invoke-virtual {p1, v1}, Landroid/hardware/camera2/CameraManager;->getCameraCharacteristics(Ljava/lang/String;)Landroid/hardware/camera2/CameraCharacteristics;

    .line 360
    .line 361
    .line 362
    move-result-object p1

    .line 363
    iput-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 364
    .line 365
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 366
    .line 367
    const/16 v4, 0x1c

    .line 368
    .line 369
    if-lt v0, v4, :cond_11

    .line 370
    .line 371
    invoke-static {p1}, Ll/prh0;->a(Landroid/hardware/camera2/CameraCharacteristics;)Ljava/util/List;

    .line 372
    .line 373
    .line 374
    move-result-object p1

    .line 375
    new-instance v0, Ljava/lang/StringBuilder;

    .line 376
    .line 377
    const-string v4, "selectCamera sessionKeys: "

    .line 378
    .line 379
    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 380
    .line 381
    .line 382
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 383
    .line 384
    .line 385
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 386
    .line 387
    .line 388
    move-result-object p1

    .line 389
    invoke-static {v2, p1}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 390
    .line 391
    .line 392
    :cond_11
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 393
    .line 394
    sget-object v0, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_AE_COMPENSATION_RANGE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 395
    .line 396
    invoke-virtual {p1, v0}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 397
    .line 398
    .line 399
    move-result-object p1

    .line 400
    check-cast p1, Landroid/util/Range;

    .line 401
    .line 402
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 403
    .line 404
    sget-object v2, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_AE_COMPENSATION_STEP:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 405
    .line 406
    invoke-virtual {v0, v2}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 407
    .line 408
    .line 409
    move-result-object v0

    .line 410
    check-cast v0, Landroid/util/Rational;

    .line 411
    .line 412
    if-eqz p1, :cond_12

    .line 413
    .line 414
    if-eqz v0, :cond_12

    .line 415
    .line 416
    iget-object v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 417
    .line 418
    iget-object v2, v2, Lcom/ss/android/ttvecamera/TECameraSettings;->K:Lcom/ss/android/ttvecamera/TECameraSettings$d;

    .line 419
    .line 420
    invoke-virtual {p1}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    .line 421
    .line 422
    .line 423
    move-result-object v4

    .line 424
    check-cast v4, Ljava/lang/Integer;

    .line 425
    .line 426
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 427
    .line 428
    .line 429
    move-result v4

    .line 430
    iput v4, v2, Lcom/ss/android/ttvecamera/TECameraSettings$d;->c:I

    .line 431
    .line 432
    iget-object v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 433
    .line 434
    iget-object v2, v2, Lcom/ss/android/ttvecamera/TECameraSettings;->K:Lcom/ss/android/ttvecamera/TECameraSettings$d;

    .line 435
    .line 436
    invoke-virtual {p1}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    .line 437
    .line 438
    .line 439
    move-result-object p1

    .line 440
    check-cast p1, Ljava/lang/Integer;

    .line 441
    .line 442
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 443
    .line 444
    .line 445
    move-result p1

    .line 446
    iput p1, v2, Lcom/ss/android/ttvecamera/TECameraSettings$d;->a:I

    .line 447
    .line 448
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 449
    .line 450
    iget-object p1, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->K:Lcom/ss/android/ttvecamera/TECameraSettings$d;

    .line 451
    .line 452
    invoke-virtual {v0}, Landroid/util/Rational;->getNumerator()I

    .line 453
    .line 454
    .line 455
    move-result v2

    .line 456
    int-to-float v2, v2

    .line 457
    const/high16 v4, 0x3f800000    # 1.0f

    .line 458
    .line 459
    mul-float/2addr v2, v4

    .line 460
    invoke-virtual {v0}, Landroid/util/Rational;->getDenominator()I

    .line 461
    .line 462
    .line 463
    move-result v0

    .line 464
    int-to-float v0, v0

    .line 465
    div-float/2addr v2, v0

    .line 466
    iput v2, p1, Lcom/ss/android/ttvecamera/TECameraSettings$d;->d:F

    .line 467
    .line 468
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 469
    .line 470
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->K:Lcom/ss/android/ttvecamera/TECameraSettings$d;

    .line 471
    .line 472
    iput v3, p0, Lcom/ss/android/ttvecamera/TECameraSettings$d;->b:I

    .line 473
    .line 474
    :cond_12
    invoke-static {}, Ll/dsh0;->b()V

    .line 475
    .line 476
    .line 477
    return-object v1
.end method

.method public W(F)V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 7
    .line 8
    const/16 v2, -0x1b0

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->d:Landroid/hardware/camera2/CameraCaptureSession;

    .line 13
    .line 14
    if-nez v1, :cond_1

    .line 15
    .line 16
    :cond_0
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 17
    .line 18
    iget-object v3, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 19
    .line 20
    const-string v4, "Capture Session is null"

    .line 21
    .line 22
    invoke-interface {v1, v2, v2, v4, v3}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    :cond_1
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->A()[F

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    array-length v1, v1

    .line 30
    const/4 v3, 0x1

    .line 31
    if-ne v1, v3, :cond_2

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->A()[F

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    filled-new-array {v1}, [[F

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    invoke-interface {v1, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-nez v1, :cond_2

    .line 54
    .line 55
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 56
    .line 57
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 58
    .line 59
    const-string v0, "invalid aperture"

    .line 60
    .line 61
    invoke-interface {p1, v2, v2, v0, p0}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_2
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 66
    .line 67
    sget-object v3, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 68
    .line 69
    invoke-virtual {v1, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->get(Landroid/hardware/camera2/CaptureRequest$Key;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    check-cast v1, Ljava/lang/Integer;

    .line 74
    .line 75
    invoke-virtual {v1, v0}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    if-nez v1, :cond_3

    .line 80
    .line 81
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 82
    .line 83
    invoke-virtual {v1, v3, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 84
    .line 85
    .line 86
    :cond_3
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 87
    .line 88
    sget-object v3, Landroid/hardware/camera2/CaptureRequest;->CONTROL_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 89
    .line 90
    invoke-virtual {v1, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->get(Landroid/hardware/camera2/CaptureRequest$Key;)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    check-cast v1, Ljava/lang/Integer;

    .line 95
    .line 96
    invoke-virtual {v1, v0}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    if-nez v1, :cond_4

    .line 101
    .line 102
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 103
    .line 104
    invoke-virtual {v1, v3, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 105
    .line 106
    .line 107
    :cond_4
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 108
    .line 109
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->LENS_APERTURE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 110
    .line 111
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    invoke-virtual {v0, v1, p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 116
    .line 117
    .line 118
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 119
    .line 120
    invoke-virtual {p0, p1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->v0(Landroid/hardware/camera2/CaptureRequest$Builder;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    iget-boolean v0, p1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->a:Z

    .line 125
    .line 126
    if-nez v0, :cond_5

    .line 127
    .line 128
    new-instance v0, Ljava/lang/StringBuilder;

    .line 129
    .line 130
    const-string v1, "setAperture exception: "

    .line 131
    .line 132
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    iget-object v1, p1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->b:Ljava/lang/String;

    .line 136
    .line 137
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    const-string v1, "TECameraModeBase"

    .line 145
    .line 146
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 150
    .line 151
    iget-object p1, p1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->b:Ljava/lang/String;

    .line 152
    .line 153
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 154
    .line 155
    invoke-interface {v0, v2, v2, p1, p0}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 156
    .line 157
    .line 158
    :cond_5
    return-void
.end method

.method public X(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->d:Landroid/hardware/camera2/CameraCaptureSession;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 11
    .line 12
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_LOCK:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 13
    .line 14
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {v0, v1, p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->v0(Landroid/hardware/camera2/CaptureRequest$Builder;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :catch_0
    move-exception p1

    .line 28
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 32
    .line 33
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 38
    .line 39
    const/16 v1, -0x1ab

    .line 40
    .line 41
    invoke-interface {v0, v1, v1, p1, p0}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 46
    .line 47
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 48
    .line 49
    iget v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 50
    .line 51
    const/16 v1, -0x64

    .line 52
    .line 53
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 54
    .line 55
    const-string v2, "setExposureCompensation : Capture Session is null"

    .line 56
    .line 57
    invoke-interface {p1, v0, v1, v2, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public Y(Z)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 2
    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->d:Landroid/hardware/camera2/CameraCaptureSession;

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    :try_start_0
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 11
    .line 12
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 13
    .line 14
    const/4 v1, 0x2

    .line 15
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->v0(Landroid/hardware/camera2/CaptureRequest$Builder;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :catch_0
    move-exception p1

    .line 29
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 33
    .line 34
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 39
    .line 40
    const/16 v1, -0x1b2

    .line 41
    .line 42
    invoke-interface {v0, v1, v1, p1, p0}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 47
    .line 48
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 49
    .line 50
    iget v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 51
    .line 52
    const/16 v1, -0x64

    .line 53
    .line 54
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 55
    .line 56
    const-string v2, "setAutoFocusLock : Capture Session is null"

    .line 57
    .line 58
    invoke-interface {p1, v0, v1, v2, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public Z(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassCastException;
        }
    .end annotation

    .line 1
    check-cast p1, Landroid/hardware/camera2/CameraDevice;

    .line 2
    .line 3
    iput-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 4
    .line 5
    return-void
.end method

.method public a()I
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
    const-string v2, "rollbackNormalSessionRequest : param is null."

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
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

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
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 32
    .line 33
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->E()I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-virtual {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 47
    .line 48
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 49
    .line 50
    const/4 v2, 0x1

    .line 51
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-virtual {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 59
    .line 60
    iget-boolean v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->n:Z

    .line 61
    .line 62
    if-eqz v0, :cond_1

    .line 63
    .line 64
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 65
    .line 66
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_REGIONS:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 67
    .line 68
    sget-object v2, Ll/p6m;->a:[Landroid/hardware/camera2/params/MeteringRectangle;

    .line 69
    .line 70
    invoke-virtual {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 74
    .line 75
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_REGIONS:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 76
    .line 77
    invoke-virtual {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 78
    .line 79
    .line 80
    :cond_1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 81
    .line 82
    invoke-virtual {p0, v0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->v0(Landroid/hardware/camera2/CaptureRequest$Builder;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 83
    .line 84
    .line 85
    const-string p0, "TECameraModeBase"

    .line 86
    .line 87
    const-string v0, "rollbackNormalSessionRequest"

    .line 88
    .line 89
    invoke-static {p0, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    const/4 p0, 0x0

    .line 93
    return p0
.end method

.method public a0(I)Z
    .locals 4

    .line 1
    iput p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->s:I

    .line 2
    .line 3
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_4

    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->d:Landroid/hardware/camera2/CameraCaptureSession;

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 14
    .line 15
    sget-object v2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 16
    .line 17
    invoke-virtual {v0, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->get(Landroid/hardware/camera2/CaptureRequest$Key;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Ljava/lang/Integer;

    .line 22
    .line 23
    const-string v2, "TECameraModeBase"

    .line 24
    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    const-string p0, "Can\'t set exposure compensation when ae mode is off."

    .line 34
    .line 35
    invoke-static {v2, p0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return v1

    .line 39
    :cond_1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->K:Lcom/ss/android/ttvecamera/TECameraSettings$d;

    .line 42
    .line 43
    iget v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings$d;->b:I

    .line 44
    .line 45
    if-ne v0, p1, :cond_2

    .line 46
    .line 47
    const-string p0, "setExposureCompensation return, no need to set"

    .line 48
    .line 49
    invoke-static {v2, p0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    return v1

    .line 53
    :cond_2
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 54
    .line 55
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_EXPOSURE_COMPENSATION:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 56
    .line 57
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    invoke-virtual {v0, v1, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 65
    .line 66
    iget-object v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->K:Lcom/ss/android/ttvecamera/TECameraSettings$d;

    .line 67
    .line 68
    iput p1, v0, Lcom/ss/android/ttvecamera/TECameraSettings$d;->b:I

    .line 69
    .line 70
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 71
    .line 72
    invoke-virtual {p0, p1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->v0(Landroid/hardware/camera2/CaptureRequest$Builder;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    iget-boolean v0, p1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->a:Z

    .line 77
    .line 78
    if-nez v0, :cond_3

    .line 79
    .line 80
    new-instance v0, Ljava/lang/StringBuilder;

    .line 81
    .line 82
    const-string v1, "setExposureCompensation failed: "

    .line 83
    .line 84
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    iget-object v1, p1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->b:Ljava/lang/String;

    .line 88
    .line 89
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-static {v2, v0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 100
    .line 101
    iget-object v1, p1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->b:Ljava/lang/String;

    .line 102
    .line 103
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 104
    .line 105
    const/16 v2, -0x19d

    .line 106
    .line 107
    invoke-interface {v0, v2, v2, v1, p0}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 108
    .line 109
    .line 110
    :cond_3
    iget-boolean p0, p1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->a:Z

    .line 111
    .line 112
    return p0

    .line 113
    :cond_4
    :goto_0
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 114
    .line 115
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 116
    .line 117
    iget v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 118
    .line 119
    const/16 v2, -0x64

    .line 120
    .line 121
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 122
    .line 123
    const-string v3, "setExposureCompensation : Capture Session is null"

    .line 124
    .line 125
    invoke-interface {p1, v0, v2, v3, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 126
    .line 127
    .line 128
    return v1
.end method

.method public b(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->d:Landroid/hardware/camera2/CameraCaptureSession;

    .line 2
    .line 3
    const-string v1, "TECameraModeBase"

    .line 4
    .line 5
    if-ne p1, v0, :cond_2

    .line 6
    .line 7
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 8
    .line 9
    if-eq p2, p1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p0, p2}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->v0(Landroid/hardware/camera2/CaptureRequest$Builder;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    iget-boolean p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->a:Z

    .line 17
    .line 18
    if-nez p1, :cond_1

    .line 19
    .line 20
    new-instance p1, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    const-string p2, "updateRequestRepeating failed: "

    .line 23
    .line 24
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->b:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-static {v1, p0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    :cond_1
    return-void

    .line 40
    :cond_2
    :goto_0
    const-string p0, "updateRequestRepeating failed, session changed..."

    .line 41
    .line 42
    invoke-static {v1, p0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public c0(Lcom/ss/android/ttvecamera/c$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->w:Lcom/ss/android/ttvecamera/c$b;

    .line 2
    .line 3
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
    iget v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->y:I

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->y0(I)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 27
    .line 28
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 29
    .line 30
    const/4 v2, 0x1

    .line 31
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-virtual {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 39
    .line 40
    iget-boolean v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->n:Z

    .line 41
    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 45
    .line 46
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_REGIONS:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 47
    .line 48
    sget-object v2, Ll/p6m;->a:[Landroid/hardware/camera2/params/MeteringRectangle;

    .line 49
    .line 50
    invoke-virtual {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    :cond_1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 54
    .line 55
    invoke-virtual {p0, v0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->v0(Landroid/hardware/camera2/CaptureRequest$Builder;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 56
    .line 57
    .line 58
    const-string p0, "TECameraModeBase"

    .line 59
    .line 60
    const-string v0, "rollbackMeteringSessionRequest"

    .line 61
    .line 62
    invoke-static {p0, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    const/4 p0, 0x0

    .line 66
    return p0
.end method

.method public d0(I)V
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    iget-object v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 7
    .line 8
    const/16 v3, -0x1ae

    .line 9
    .line 10
    if-eqz v2, :cond_0

    .line 11
    .line 12
    iget-object v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->d:Landroid/hardware/camera2/CameraCaptureSession;

    .line 13
    .line 14
    if-nez v2, :cond_1

    .line 15
    .line 16
    :cond_0
    iget-object v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 17
    .line 18
    iget-object v4, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 19
    .line 20
    const-string v5, "Capture Session is null"

    .line 21
    .line 22
    invoke-interface {v2, v3, v3, v5, v4}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    :cond_1
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->I()[I

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    const/4 v4, 0x1

    .line 30
    aget v2, v2, v4

    .line 31
    .line 32
    if-gt p1, v2, :cond_6

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->I()[I

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    aget v0, v2, v0

    .line 39
    .line 40
    if-ge p1, v0, :cond_2

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_2
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 44
    .line 45
    sget-object v2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 46
    .line 47
    invoke-virtual {v0, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->get(Landroid/hardware/camera2/CaptureRequest$Key;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    check-cast v0, Ljava/lang/Integer;

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-nez v0, :cond_3

    .line 58
    .line 59
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 60
    .line 61
    invoke-virtual {v0, v2, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    :cond_3
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 65
    .line 66
    sget-object v2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 67
    .line 68
    invoke-virtual {v0, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->get(Landroid/hardware/camera2/CaptureRequest$Key;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    check-cast v0, Ljava/lang/Integer;

    .line 73
    .line 74
    invoke-virtual {v0, v1}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-nez v0, :cond_4

    .line 79
    .line 80
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 81
    .line 82
    invoke-virtual {v0, v2, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 83
    .line 84
    .line 85
    :cond_4
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 86
    .line 87
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->SENSOR_SENSITIVITY:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 88
    .line 89
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-virtual {v0, v1, p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 94
    .line 95
    .line 96
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 97
    .line 98
    invoke-virtual {p0, p1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->v0(Landroid/hardware/camera2/CaptureRequest$Builder;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    iget-boolean v0, p1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->a:Z

    .line 103
    .line 104
    if-nez v0, :cond_5

    .line 105
    .line 106
    new-instance v0, Ljava/lang/StringBuilder;

    .line 107
    .line 108
    const-string v1, "setISO exception: "

    .line 109
    .line 110
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    iget-object v1, p1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->b:Ljava/lang/String;

    .line 114
    .line 115
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    const-string v1, "TECameraModeBase"

    .line 123
    .line 124
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 128
    .line 129
    iget-object p1, p1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->b:Ljava/lang/String;

    .line 130
    .line 131
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 132
    .line 133
    invoke-interface {v0, v3, v3, p1, p0}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 134
    .line 135
    .line 136
    :cond_5
    return-void

    .line 137
    :cond_6
    :goto_0
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 138
    .line 139
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 140
    .line 141
    const-string v0, "invalid iso"

    .line 142
    .line 143
    invoke-interface {p1, v3, v3, v0, p0}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 144
    .line 145
    .line 146
    return-void
.end method

.method public e(IIFFIILcom/ss/android/ttvecamera/TEFocusSettings$CoordinatesMode;)Landroid/graphics/Rect;
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p1

    .line 4
    .line 5
    move/from16 v2, p2

    .line 6
    .line 7
    move/from16 v3, p5

    .line 8
    .line 9
    move-object/from16 v4, p7

    .line 10
    .line 11
    iget-object v5, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->m:Landroid/hardware/camera2/CaptureRequest;

    .line 12
    .line 13
    const-string v6, "TECameraModeBase"

    .line 14
    .line 15
    if-nez v5, :cond_0

    .line 16
    .line 17
    const-string v0, "_calculateFocusRect, capture request is null, return"

    .line 18
    .line 19
    invoke-static {v6, v0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    return-object v0

    .line 24
    :cond_0
    iget-object v5, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 25
    .line 26
    sget-object v7, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_INFO_ACTIVE_ARRAY_SIZE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 27
    .line 28
    invoke-virtual {v5, v7}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v5

    .line 32
    check-cast v5, Landroid/graphics/Rect;

    .line 33
    .line 34
    new-instance v7, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    const-string v8, "SENSOR_INFO_ACTIVE_ARRAY_SIZE: [left, top, right, bottom] = ["

    .line 37
    .line 38
    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    iget v8, v5, Landroid/graphics/Rect;->left:I

    .line 42
    .line 43
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string v8, ", "

    .line 47
    .line 48
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    iget v9, v5, Landroid/graphics/Rect;->top:I

    .line 52
    .line 53
    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    iget v9, v5, Landroid/graphics/Rect;->right:I

    .line 60
    .line 61
    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    iget v9, v5, Landroid/graphics/Rect;->bottom:I

    .line 68
    .line 69
    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    const-string v9, "]"

    .line 73
    .line 74
    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v7

    .line 81
    invoke-static {v6, v7}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    iget-object v7, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 85
    .line 86
    sget-object v10, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_INFO_PIXEL_ARRAY_SIZE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 87
    .line 88
    invoke-virtual {v7, v10}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v7

    .line 92
    check-cast v7, Landroid/util/Size;

    .line 93
    .line 94
    new-instance v10, Ljava/lang/StringBuilder;

    .line 95
    .line 96
    const-string v11, "mCameraCharacteristics:[width, height]: ["

    .line 97
    .line 98
    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {v7}, Landroid/util/Size;->getWidth()I

    .line 102
    .line 103
    .line 104
    move-result v11

    .line 105
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    invoke-virtual {v7}, Landroid/util/Size;->getHeight()I

    .line 112
    .line 113
    .line 114
    move-result v7

    .line 115
    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v7

    .line 125
    const-string v9, "onAreaTouchEvent"

    .line 126
    .line 127
    invoke-static {v9, v7}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    iget-object v7, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 131
    .line 132
    iget-object v9, v7, Lcom/ss/android/ttvecamera/TECameraSettings;->q:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 133
    .line 134
    iget v10, v9, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 135
    .line 136
    iget v9, v9, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 137
    .line 138
    sget-object v11, Lcom/ss/android/ttvecamera/TEFocusSettings$CoordinatesMode;->VIEW:Lcom/ss/android/ttvecamera/TEFocusSettings$CoordinatesMode;

    .line 139
    .line 140
    const/16 v12, 0x10e

    .line 141
    .line 142
    const/16 v13, 0x5a

    .line 143
    .line 144
    if-ne v4, v11, :cond_2

    .line 145
    .line 146
    iget v7, v7, Lcom/ss/android/ttvecamera/TECameraSettings;->e:I

    .line 147
    .line 148
    if-eq v13, v7, :cond_1

    .line 149
    .line 150
    if-ne v12, v7, :cond_2

    .line 151
    .line 152
    :cond_1
    move v14, v9

    .line 153
    move v7, v10

    .line 154
    goto :goto_0

    .line 155
    :cond_2
    move v7, v9

    .line 156
    move v14, v10

    .line 157
    :goto_0
    mul-int v15, v7, v1

    .line 158
    .line 159
    mul-int v12, v14, v2

    .line 160
    .line 161
    const/high16 v16, 0x40000000    # 2.0f

    .line 162
    .line 163
    const/high16 v17, 0x3f800000    # 1.0f

    .line 164
    .line 165
    const/16 v18, 0x0

    .line 166
    .line 167
    if-lt v15, v12, :cond_3

    .line 168
    .line 169
    int-to-float v1, v1

    .line 170
    mul-float v1, v1, v17

    .line 171
    .line 172
    int-to-float v12, v14

    .line 173
    div-float/2addr v1, v12

    .line 174
    int-to-float v7, v7

    .line 175
    mul-float/2addr v7, v1

    .line 176
    int-to-float v2, v2

    .line 177
    sub-float/2addr v7, v2

    .line 178
    div-float v7, v7, v16

    .line 179
    .line 180
    move v2, v7

    .line 181
    move/from16 v7, v18

    .line 182
    .line 183
    goto :goto_1

    .line 184
    :cond_3
    int-to-float v2, v2

    .line 185
    mul-float v2, v2, v17

    .line 186
    .line 187
    int-to-float v7, v7

    .line 188
    div-float/2addr v2, v7

    .line 189
    int-to-float v7, v14

    .line 190
    mul-float/2addr v7, v2

    .line 191
    int-to-float v1, v1

    .line 192
    sub-float/2addr v7, v1

    .line 193
    div-float v7, v7, v16

    .line 194
    .line 195
    move v1, v2

    .line 196
    move/from16 v2, v18

    .line 197
    .line 198
    :goto_1
    add-float v7, p3, v7

    .line 199
    .line 200
    div-float/2addr v7, v1

    .line 201
    add-float v2, p4, v2

    .line 202
    .line 203
    div-float/2addr v2, v1

    .line 204
    if-ne v4, v11, :cond_5

    .line 205
    .line 206
    if-ne v13, v3, :cond_4

    .line 207
    .line 208
    int-to-float v1, v9

    .line 209
    sub-float v7, v1, v7

    .line 210
    .line 211
    move/from16 v19, v7

    .line 212
    .line 213
    move v7, v2

    .line 214
    move/from16 v2, v19

    .line 215
    .line 216
    goto :goto_2

    .line 217
    :cond_4
    const/16 v1, 0x10e

    .line 218
    .line 219
    if-ne v1, v3, :cond_5

    .line 220
    .line 221
    int-to-float v1, v10

    .line 222
    sub-float/2addr v1, v2

    .line 223
    move v2, v7

    .line 224
    move v7, v1

    .line 225
    :cond_5
    :goto_2
    iget-object v1, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->m:Landroid/hardware/camera2/CaptureRequest;

    .line 226
    .line 227
    sget-object v3, Landroid/hardware/camera2/CaptureRequest;->SCALER_CROP_REGION:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 228
    .line 229
    invoke-virtual {v1, v3}, Landroid/hardware/camera2/CaptureRequest;->get(Landroid/hardware/camera2/CaptureRequest$Key;)Ljava/lang/Object;

    .line 230
    .line 231
    .line 232
    move-result-object v1

    .line 233
    check-cast v1, Landroid/graphics/Rect;

    .line 234
    .line 235
    if-eqz v1, :cond_7

    .line 236
    .line 237
    invoke-virtual {v1}, Landroid/graphics/Rect;->isEmpty()Z

    .line 238
    .line 239
    .line 240
    move-result v3

    .line 241
    if-eqz v3, :cond_6

    .line 242
    .line 243
    goto :goto_3

    .line 244
    :cond_6
    move-object v5, v1

    .line 245
    goto :goto_4

    .line 246
    :cond_7
    :goto_3
    const-string v1, "can\'t get crop region"

    .line 247
    .line 248
    invoke-static {v6, v1}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 249
    .line 250
    .line 251
    :goto_4
    new-instance v1, Ljava/lang/StringBuilder;

    .line 252
    .line 253
    const-string v3, "cropRegion Rect: [left, top, right, bottom] = ["

    .line 254
    .line 255
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 256
    .line 257
    .line 258
    iget v3, v5, Landroid/graphics/Rect;->left:I

    .line 259
    .line 260
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 261
    .line 262
    .line 263
    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 264
    .line 265
    .line 266
    iget v3, v5, Landroid/graphics/Rect;->top:I

    .line 267
    .line 268
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 269
    .line 270
    .line 271
    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 272
    .line 273
    .line 274
    iget v3, v5, Landroid/graphics/Rect;->right:I

    .line 275
    .line 276
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 277
    .line 278
    .line 279
    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 280
    .line 281
    .line 282
    iget v3, v5, Landroid/graphics/Rect;->bottom:I

    .line 283
    .line 284
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 285
    .line 286
    .line 287
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 288
    .line 289
    .line 290
    move-result-object v1

    .line 291
    invoke-static {v6, v1}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 292
    .line 293
    .line 294
    invoke-virtual {v5}, Landroid/graphics/Rect;->width()I

    .line 295
    .line 296
    .line 297
    move-result v1

    .line 298
    invoke-virtual {v5}, Landroid/graphics/Rect;->height()I

    .line 299
    .line 300
    .line 301
    move-result v3

    .line 302
    iget-object v0, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 303
    .line 304
    iget-object v9, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->q:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 305
    .line 306
    iget v10, v9, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 307
    .line 308
    mul-int v12, v10, v1

    .line 309
    .line 310
    iget v9, v9, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 311
    .line 312
    mul-int v13, v9, v3

    .line 313
    .line 314
    if-le v12, v13, :cond_8

    .line 315
    .line 316
    int-to-float v3, v3

    .line 317
    mul-float v3, v3, v17

    .line 318
    .line 319
    int-to-float v10, v10

    .line 320
    div-float/2addr v3, v10

    .line 321
    int-to-float v1, v1

    .line 322
    int-to-float v9, v9

    .line 323
    mul-float/2addr v9, v3

    .line 324
    sub-float/2addr v1, v9

    .line 325
    div-float v1, v1, v16

    .line 326
    .line 327
    move/from16 v19, v18

    .line 328
    .line 329
    move/from16 v18, v1

    .line 330
    .line 331
    :goto_5
    move/from16 v1, v19

    .line 332
    .line 333
    goto :goto_6

    .line 334
    :cond_8
    int-to-float v1, v1

    .line 335
    mul-float v1, v1, v17

    .line 336
    .line 337
    int-to-float v9, v9

    .line 338
    div-float/2addr v1, v9

    .line 339
    int-to-float v3, v3

    .line 340
    int-to-float v9, v10

    .line 341
    mul-float/2addr v9, v1

    .line 342
    sub-float/2addr v3, v9

    .line 343
    div-float v3, v3, v16

    .line 344
    .line 345
    move/from16 v19, v3

    .line 346
    .line 347
    move v3, v1

    .line 348
    goto :goto_5

    .line 349
    :goto_6
    mul-float/2addr v7, v3

    .line 350
    add-float v7, v7, v18

    .line 351
    .line 352
    iget v9, v5, Landroid/graphics/Rect;->left:I

    .line 353
    .line 354
    int-to-float v9, v9

    .line 355
    add-float/2addr v7, v9

    .line 356
    mul-float/2addr v2, v3

    .line 357
    add-float/2addr v2, v1

    .line 358
    iget v1, v5, Landroid/graphics/Rect;->top:I

    .line 359
    .line 360
    int-to-float v1, v1

    .line 361
    add-float/2addr v2, v1

    .line 362
    if-ne v4, v11, :cond_9

    .line 363
    .line 364
    iget v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 365
    .line 366
    const/4 v1, 0x1

    .line 367
    if-ne v0, v1, :cond_9

    .line 368
    .line 369
    invoke-virtual {v5}, Landroid/graphics/Rect;->height()I

    .line 370
    .line 371
    .line 372
    move-result v0

    .line 373
    int-to-float v0, v0

    .line 374
    sub-float v2, v0, v2

    .line 375
    .line 376
    :cond_9
    new-instance v0, Landroid/graphics/Rect;

    .line 377
    .line 378
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 379
    .line 380
    .line 381
    if-nez p6, :cond_a

    .line 382
    .line 383
    float-to-double v3, v7

    .line 384
    invoke-virtual {v5}, Landroid/graphics/Rect;->width()I

    .line 385
    .line 386
    .line 387
    move-result v1

    .line 388
    int-to-double v9, v1

    .line 389
    const-wide v11, 0x3fa999999999999aL    # 0.05

    .line 390
    .line 391
    .line 392
    .line 393
    .line 394
    mul-double/2addr v9, v11

    .line 395
    sub-double v9, v3, v9

    .line 396
    .line 397
    double-to-int v1, v9

    .line 398
    iput v1, v0, Landroid/graphics/Rect;->left:I

    .line 399
    .line 400
    invoke-virtual {v5}, Landroid/graphics/Rect;->width()I

    .line 401
    .line 402
    .line 403
    move-result v1

    .line 404
    int-to-double v9, v1

    .line 405
    mul-double/2addr v9, v11

    .line 406
    add-double/2addr v3, v9

    .line 407
    double-to-int v1, v3

    .line 408
    iput v1, v0, Landroid/graphics/Rect;->right:I

    .line 409
    .line 410
    float-to-double v3, v2

    .line 411
    invoke-virtual {v5}, Landroid/graphics/Rect;->height()I

    .line 412
    .line 413
    .line 414
    move-result v1

    .line 415
    int-to-double v9, v1

    .line 416
    mul-double/2addr v9, v11

    .line 417
    sub-double v9, v3, v9

    .line 418
    .line 419
    double-to-int v1, v9

    .line 420
    iput v1, v0, Landroid/graphics/Rect;->top:I

    .line 421
    .line 422
    invoke-virtual {v5}, Landroid/graphics/Rect;->height()I

    .line 423
    .line 424
    .line 425
    move-result v1

    .line 426
    int-to-double v9, v1

    .line 427
    mul-double/2addr v11, v9

    .line 428
    add-double/2addr v3, v11

    .line 429
    double-to-int v1, v3

    .line 430
    iput v1, v0, Landroid/graphics/Rect;->bottom:I

    .line 431
    .line 432
    goto :goto_7

    .line 433
    :cond_a
    float-to-double v3, v7

    .line 434
    invoke-virtual {v5}, Landroid/graphics/Rect;->width()I

    .line 435
    .line 436
    .line 437
    move-result v1

    .line 438
    int-to-double v9, v1

    .line 439
    const-wide v11, 0x3fb999999999999aL    # 0.1

    .line 440
    .line 441
    .line 442
    .line 443
    .line 444
    mul-double/2addr v9, v11

    .line 445
    sub-double v9, v3, v9

    .line 446
    .line 447
    double-to-int v1, v9

    .line 448
    iput v1, v0, Landroid/graphics/Rect;->left:I

    .line 449
    .line 450
    invoke-virtual {v5}, Landroid/graphics/Rect;->width()I

    .line 451
    .line 452
    .line 453
    move-result v1

    .line 454
    int-to-double v9, v1

    .line 455
    mul-double/2addr v9, v11

    .line 456
    add-double/2addr v3, v9

    .line 457
    double-to-int v1, v3

    .line 458
    iput v1, v0, Landroid/graphics/Rect;->right:I

    .line 459
    .line 460
    float-to-double v3, v2

    .line 461
    invoke-virtual {v5}, Landroid/graphics/Rect;->height()I

    .line 462
    .line 463
    .line 464
    move-result v1

    .line 465
    int-to-double v9, v1

    .line 466
    mul-double/2addr v9, v11

    .line 467
    sub-double v9, v3, v9

    .line 468
    .line 469
    double-to-int v1, v9

    .line 470
    iput v1, v0, Landroid/graphics/Rect;->top:I

    .line 471
    .line 472
    invoke-virtual {v5}, Landroid/graphics/Rect;->height()I

    .line 473
    .line 474
    .line 475
    move-result v1

    .line 476
    int-to-double v9, v1

    .line 477
    mul-double/2addr v9, v11

    .line 478
    add-double/2addr v3, v9

    .line 479
    double-to-int v1, v3

    .line 480
    iput v1, v0, Landroid/graphics/Rect;->bottom:I

    .line 481
    .line 482
    :goto_7
    iget v1, v0, Landroid/graphics/Rect;->left:I

    .line 483
    .line 484
    if-ltz v1, :cond_b

    .line 485
    .line 486
    iget v3, v5, Landroid/graphics/Rect;->left:I

    .line 487
    .line 488
    if-ge v1, v3, :cond_c

    .line 489
    .line 490
    :cond_b
    iget v1, v5, Landroid/graphics/Rect;->left:I

    .line 491
    .line 492
    iput v1, v0, Landroid/graphics/Rect;->left:I

    .line 493
    .line 494
    :cond_c
    iget v1, v0, Landroid/graphics/Rect;->top:I

    .line 495
    .line 496
    if-ltz v1, :cond_d

    .line 497
    .line 498
    iget v3, v5, Landroid/graphics/Rect;->top:I

    .line 499
    .line 500
    if-ge v1, v3, :cond_e

    .line 501
    .line 502
    :cond_d
    iget v1, v5, Landroid/graphics/Rect;->top:I

    .line 503
    .line 504
    iput v1, v0, Landroid/graphics/Rect;->top:I

    .line 505
    .line 506
    :cond_e
    iget v1, v0, Landroid/graphics/Rect;->right:I

    .line 507
    .line 508
    if-ltz v1, :cond_f

    .line 509
    .line 510
    iget v3, v5, Landroid/graphics/Rect;->right:I

    .line 511
    .line 512
    if-le v1, v3, :cond_10

    .line 513
    .line 514
    :cond_f
    iget v1, v5, Landroid/graphics/Rect;->right:I

    .line 515
    .line 516
    iput v1, v0, Landroid/graphics/Rect;->right:I

    .line 517
    .line 518
    :cond_10
    iget v1, v0, Landroid/graphics/Rect;->bottom:I

    .line 519
    .line 520
    if-ltz v1, :cond_11

    .line 521
    .line 522
    iget v3, v5, Landroid/graphics/Rect;->bottom:I

    .line 523
    .line 524
    if-le v1, v3, :cond_12

    .line 525
    .line 526
    :cond_11
    iget v1, v5, Landroid/graphics/Rect;->bottom:I

    .line 527
    .line 528
    iput v1, v0, Landroid/graphics/Rect;->bottom:I

    .line 529
    .line 530
    :cond_12
    new-instance v1, Ljava/lang/StringBuilder;

    .line 531
    .line 532
    const-string v3, "Focus Rect: [left, top, right, bottom] = ["

    .line 533
    .line 534
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 535
    .line 536
    .line 537
    iget v3, v0, Landroid/graphics/Rect;->left:I

    .line 538
    .line 539
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 540
    .line 541
    .line 542
    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 543
    .line 544
    .line 545
    iget v3, v0, Landroid/graphics/Rect;->top:I

    .line 546
    .line 547
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 548
    .line 549
    .line 550
    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 551
    .line 552
    .line 553
    iget v3, v0, Landroid/graphics/Rect;->right:I

    .line 554
    .line 555
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 556
    .line 557
    .line 558
    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 559
    .line 560
    .line 561
    iget v3, v0, Landroid/graphics/Rect;->bottom:I

    .line 562
    .line 563
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 564
    .line 565
    .line 566
    const-string v3, "] x: "

    .line 567
    .line 568
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 569
    .line 570
    .line 571
    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 572
    .line 573
    .line 574
    const-string v3, " y: "

    .line 575
    .line 576
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 577
    .line 578
    .line 579
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 580
    .line 581
    .line 582
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 583
    .line 584
    .line 585
    move-result-object v1

    .line 586
    invoke-static {v6, v1}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 587
    .line 588
    .line 589
    return-object v0
.end method

.method public e0(F)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 2
    .line 3
    const/16 v1, -0x1b4

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->d:Landroid/hardware/camera2/CameraCaptureSession;

    .line 8
    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 12
    .line 13
    iget-object v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 14
    .line 15
    const-string v3, "Capture Session is null"

    .line 16
    .line 17
    invoke-interface {v0, v1, v1, v3, v2}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    :cond_1
    const/4 v0, 0x0

    .line 21
    cmpg-float v0, p1, v0

    .line 22
    .line 23
    if-gez v0, :cond_2

    .line 24
    .line 25
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 28
    .line 29
    const-string v0, "invalid distance"

    .line 30
    .line 31
    invoke-interface {p1, v1, v1, v0, p0}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_2
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 36
    .line 37
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->LENS_FOCUS_DISTANCE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 38
    .line 39
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {v0, v1, p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 47
    .line 48
    invoke-virtual {p0, p1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->v0(Landroid/hardware/camera2/CaptureRequest$Builder;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    iget-boolean v0, p1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->a:Z

    .line 53
    .line 54
    if-nez v0, :cond_3

    .line 55
    .line 56
    new-instance v0, Ljava/lang/StringBuilder;

    .line 57
    .line 58
    const-string v1, "setManualFocusDistance exception: "

    .line 59
    .line 60
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    iget-object v1, p1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->b:Ljava/lang/String;

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    const-string v1, "TECameraModeBase"

    .line 73
    .line 74
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 78
    .line 79
    iget-object p1, p1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->b:Ljava/lang/String;

    .line 80
    .line 81
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 82
    .line 83
    const/16 v1, -0x1ae

    .line 84
    .line 85
    invoke-interface {v0, v1, v1, p1, p0}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 86
    .line 87
    .line 88
    :cond_3
    return-void
.end method

.method public f()V
    .locals 5

    .line 1
    const-string v0, "TECameraModeBase"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->d:Landroid/hardware/camera2/CameraCaptureSession;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 8
    .line 9
    const/16 v2, 0x1c

    .line 10
    .line 11
    if-lt v1, v2, :cond_0

    .line 12
    .line 13
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 14
    .line 15
    .line 16
    move-result-wide v1

    .line 17
    :try_start_0
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->d:Landroid/hardware/camera2/CameraCaptureSession;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/hardware/camera2/CameraCaptureSession;->abortCaptures()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :catch_0
    move-exception p0

    .line 24
    new-instance v3, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    const-string v4, "abort session failed, e: "

    .line 27
    .line 28
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-static {v0, p0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    :goto_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    const-string v3, "abort session...consume = "

    .line 48
    .line 49
    invoke-direct {p0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 53
    .line 54
    .line 55
    move-result-wide v3

    .line 56
    sub-long/2addr v3, v1

    .line 57
    invoke-virtual {p0, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-static {v0, p0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    :cond_0
    return-void
.end method

.method public f0(II)I
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public g0(Lcom/ss/android/ttvecamera/c$d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->u:Lcom/ss/android/ttvecamera/c$d;

    .line 2
    .line 3
    return-void
.end method

.method public h(F)Landroid/graphics/Rect;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->SCALER_AVAILABLE_MAX_DIGITAL_ZOOM:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ljava/lang/Float;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 23
    .line 24
    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_INFO_ACTIVE_ARRAY_SIZE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 25
    .line 26
    invoke-virtual {p0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    check-cast p0, Landroid/graphics/Rect;

    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/graphics/Rect;->width()I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    int-to-float v1, v1

    .line 37
    div-float/2addr v1, v0

    .line 38
    float-to-int v1, v1

    .line 39
    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    int-to-float v2, v2

    .line 44
    div-float/2addr v2, v0

    .line 45
    float-to-int v2, v2

    .line 46
    invoke-virtual {p0}, Landroid/graphics/Rect;->width()I

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    sub-int/2addr v3, v1

    .line 51
    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    sub-int/2addr v1, v2

    .line 56
    int-to-float v2, v3

    .line 57
    div-float/2addr v2, v0

    .line 58
    mul-float/2addr v2, p1

    .line 59
    float-to-int v2, v2

    .line 60
    int-to-float v1, v1

    .line 61
    div-float/2addr v1, v0

    .line 62
    mul-float/2addr v1, p1

    .line 63
    float-to-int p1, v1

    .line 64
    and-int/lit8 v0, v2, 0x3

    .line 65
    .line 66
    sub-int/2addr v2, v0

    .line 67
    and-int/lit8 v0, p1, 0x3

    .line 68
    .line 69
    sub-int/2addr p1, v0

    .line 70
    new-instance v0, Landroid/graphics/Rect;

    .line 71
    .line 72
    invoke-virtual {p0}, Landroid/graphics/Rect;->width()I

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    sub-int/2addr v1, v2

    .line 77
    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    .line 78
    .line 79
    .line 80
    move-result p0

    .line 81
    sub-int/2addr p0, p1

    .line 82
    invoke-direct {v0, v2, p1, v1, p0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 83
    .line 84
    .line 85
    return-object v0

    .line 86
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 87
    .line 88
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 89
    .line 90
    iget v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 91
    .line 92
    const/16 v1, -0x1a4

    .line 93
    .line 94
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 95
    .line 96
    const-string v2, "Camera info is null, may be you need reopen camera."

    .line 97
    .line 98
    invoke-interface {p1, v0, v1, v2, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 99
    .line 100
    .line 101
    const/4 p0, 0x0

    .line 102
    return-object p0
.end method

.method public h0(Lcom/ss/android/ttvecamera/c$e;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->v:Lcom/ss/android/ttvecamera/c$e;

    .line 2
    .line 3
    return-void
.end method

.method public i(F)Landroid/graphics/Rect;
    .locals 7

    .line 1
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->F:Landroid/graphics/Rect;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const/16 v1, -0x1a4

    .line 5
    .line 6
    const-string v2, "TECameraModeBase"

    .line 7
    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    const-string p1, "[VE_UI_TEST]Failed event: START_ZOOM. Code: -420. Reason: mActiveArraySize is null"

    .line 11
    .line 12
    invoke-static {v2, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    const-string p1, "ActiveArraySize == null"

    .line 16
    .line 17
    invoke-static {v2, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 23
    .line 24
    const-string v2, "ActiveArraySize == null."

    .line 25
    .line 26
    invoke-interface {p1, v1, v1, v2, p0}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    return-object v0

    .line 30
    :cond_0
    iget v3, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->q:F

    .line 31
    .line 32
    const/4 v4, 0x0

    .line 33
    cmpg-float v4, v3, v4

    .line 34
    .line 35
    if-lez v4, :cond_3

    .line 36
    .line 37
    iget v4, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->p:F

    .line 38
    .line 39
    cmpl-float v4, v3, v4

    .line 40
    .line 41
    if-lez v4, :cond_1

    .line 42
    .line 43
    goto/16 :goto_0

    .line 44
    .line 45
    :cond_1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 46
    .line 47
    div-float/2addr v0, v3

    .line 48
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->F:Landroid/graphics/Rect;

    .line 53
    .line 54
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    int-to-float v1, v1

    .line 59
    mul-float/2addr v1, v0

    .line 60
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    sub-int/2addr p1, v1

    .line 65
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->F:Landroid/graphics/Rect;

    .line 66
    .line 67
    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    iget-object v3, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->F:Landroid/graphics/Rect;

    .line 72
    .line 73
    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    .line 74
    .line 75
    .line 76
    move-result v3

    .line 77
    int-to-float v3, v3

    .line 78
    mul-float/2addr v3, v0

    .line 79
    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    sub-int/2addr v1, v0

    .line 84
    new-instance v0, Landroid/graphics/Rect;

    .line 85
    .line 86
    div-int/lit8 p1, p1, 0x2

    .line 87
    .line 88
    iget-object v3, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->F:Landroid/graphics/Rect;

    .line 89
    .line 90
    iget v4, v3, Landroid/graphics/Rect;->left:I

    .line 91
    .line 92
    iget v3, v3, Landroid/graphics/Rect;->right:I

    .line 93
    .line 94
    invoke-static {p1, v4, v3}, Lcom/ss/android/ttvecamera/f;->e(III)I

    .line 95
    .line 96
    .line 97
    move-result v3

    .line 98
    div-int/lit8 v1, v1, 0x2

    .line 99
    .line 100
    iget-object v4, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->F:Landroid/graphics/Rect;

    .line 101
    .line 102
    iget v5, v4, Landroid/graphics/Rect;->top:I

    .line 103
    .line 104
    iget v4, v4, Landroid/graphics/Rect;->bottom:I

    .line 105
    .line 106
    invoke-static {v1, v5, v4}, Lcom/ss/android/ttvecamera/f;->e(III)I

    .line 107
    .line 108
    .line 109
    move-result v4

    .line 110
    iget-object v5, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->F:Landroid/graphics/Rect;

    .line 111
    .line 112
    invoke-virtual {v5}, Landroid/graphics/Rect;->width()I

    .line 113
    .line 114
    .line 115
    move-result v5

    .line 116
    sub-int/2addr v5, p1

    .line 117
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->F:Landroid/graphics/Rect;

    .line 118
    .line 119
    iget v6, p1, Landroid/graphics/Rect;->left:I

    .line 120
    .line 121
    iget p1, p1, Landroid/graphics/Rect;->right:I

    .line 122
    .line 123
    invoke-static {v5, v6, p1}, Lcom/ss/android/ttvecamera/f;->e(III)I

    .line 124
    .line 125
    .line 126
    move-result p1

    .line 127
    iget-object v5, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->F:Landroid/graphics/Rect;

    .line 128
    .line 129
    invoke-virtual {v5}, Landroid/graphics/Rect;->height()I

    .line 130
    .line 131
    .line 132
    move-result v5

    .line 133
    sub-int/2addr v5, v1

    .line 134
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->F:Landroid/graphics/Rect;

    .line 135
    .line 136
    iget v6, v1, Landroid/graphics/Rect;->top:I

    .line 137
    .line 138
    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    .line 139
    .line 140
    invoke-static {v5, v6, v1}, Lcom/ss/android/ttvecamera/f;->e(III)I

    .line 141
    .line 142
    .line 143
    move-result v1

    .line 144
    invoke-direct {v0, v3, v4, p1, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 145
    .line 146
    .line 147
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->m:Landroid/hardware/camera2/CaptureRequest;

    .line 148
    .line 149
    if-eqz p0, :cond_2

    .line 150
    .line 151
    sget-object p1, Landroid/hardware/camera2/CaptureRequest;->SCALER_CROP_REGION:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 152
    .line 153
    invoke-virtual {p0, p1}, Landroid/hardware/camera2/CaptureRequest;->get(Landroid/hardware/camera2/CaptureRequest$Key;)Ljava/lang/Object;

    .line 154
    .line 155
    .line 156
    move-result-object p0

    .line 157
    check-cast p0, Landroid/graphics/Rect;

    .line 158
    .line 159
    invoke-virtual {v0, p0}, Landroid/graphics/Rect;->equals(Ljava/lang/Object;)Z

    .line 160
    .line 161
    .line 162
    move-result p0

    .line 163
    if-eqz p0, :cond_2

    .line 164
    .line 165
    const-string p0, "same SCALER_CROP_REGION, no need to set"

    .line 166
    .line 167
    invoke-static {v2, p0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    :cond_2
    return-object v0

    .line 171
    :cond_3
    :goto_0
    const-string p1, "[VE_UI_TEST]Failed event: START_ZOOM. Code: -420. Reason: invalid factor"

    .line 172
    .line 173
    invoke-static {v2, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 174
    .line 175
    .line 176
    const-string p1, "factor invalid"

    .line 177
    .line 178
    invoke-static {v2, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 179
    .line 180
    .line 181
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 182
    .line 183
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 184
    .line 185
    const-string v2, "factor invalid."

    .line 186
    .line 187
    invoke-interface {p1, v1, v1, v2, p0}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 188
    .line 189
    .line 190
    return-object v0
.end method

.method public i0(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public j()I
    .locals 3

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
    const-string v1, "rollbackNormalSessionRequest : param is null."

    .line 8
    .line 9
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 10
    .line 11
    const/16 v2, -0x64

    .line 12
    .line 13
    invoke-interface {v0, v2, v2, v1, p0}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return v2

    .line 17
    :cond_0
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->i:Ll/orh0;

    .line 18
    .line 19
    invoke-interface {p0}, Ll/p6m;->d()I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0
.end method

.method public j0(J)V
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    iget-object v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 7
    .line 8
    const/16 v3, -0x1af

    .line 9
    .line 10
    if-eqz v2, :cond_0

    .line 11
    .line 12
    iget-object v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->d:Landroid/hardware/camera2/CameraCaptureSession;

    .line 13
    .line 14
    if-nez v2, :cond_1

    .line 15
    .line 16
    :cond_0
    iget-object v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 17
    .line 18
    iget-object v4, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 19
    .line 20
    const-string v5, "Capture Session is null"

    .line 21
    .line 22
    invoke-interface {v2, v3, v3, v5, v4}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    :cond_1
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->N()[J

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    const/4 v4, 0x1

    .line 30
    aget-wide v4, v2, v4

    .line 31
    .line 32
    cmp-long v2, p1, v4

    .line 33
    .line 34
    if-gtz v2, :cond_6

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->N()[J

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    aget-wide v4, v2, v0

    .line 41
    .line 42
    cmp-long v0, p1, v4

    .line 43
    .line 44
    if-gez v0, :cond_2

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 48
    .line 49
    sget-object v2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 50
    .line 51
    invoke-virtual {v0, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->get(Landroid/hardware/camera2/CaptureRequest$Key;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    check-cast v0, Ljava/lang/Integer;

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-nez v0, :cond_3

    .line 62
    .line 63
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 64
    .line 65
    invoke-virtual {v0, v2, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 66
    .line 67
    .line 68
    :cond_3
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 69
    .line 70
    sget-object v2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 71
    .line 72
    invoke-virtual {v0, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->get(Landroid/hardware/camera2/CaptureRequest$Key;)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    check-cast v0, Ljava/lang/Integer;

    .line 77
    .line 78
    invoke-virtual {v0, v1}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-nez v0, :cond_4

    .line 83
    .line 84
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 85
    .line 86
    invoke-virtual {v0, v2, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 87
    .line 88
    .line 89
    :cond_4
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 90
    .line 91
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->SENSOR_EXPOSURE_TIME:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 92
    .line 93
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    invoke-virtual {v0, v1, p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 98
    .line 99
    .line 100
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 101
    .line 102
    invoke-virtual {p0, p1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->v0(Landroid/hardware/camera2/CaptureRequest$Builder;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    iget-boolean p2, p1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->a:Z

    .line 107
    .line 108
    if-nez p2, :cond_5

    .line 109
    .line 110
    new-instance p2, Ljava/lang/StringBuilder;

    .line 111
    .line 112
    const-string v0, "setShutterTime exception: "

    .line 113
    .line 114
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    iget-object v0, p1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->b:Ljava/lang/String;

    .line 118
    .line 119
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object p2

    .line 126
    const-string v0, "TECameraModeBase"

    .line 127
    .line 128
    invoke-static {v0, p2}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    iget-object p2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 132
    .line 133
    iget-object p1, p1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->b:Ljava/lang/String;

    .line 134
    .line 135
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 136
    .line 137
    invoke-interface {p2, v3, v3, p1, p0}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 138
    .line 139
    .line 140
    :cond_5
    return-void

    .line 141
    :cond_6
    :goto_0
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 142
    .line 143
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 144
    .line 145
    const-string p2, "invalid shutter time"

    .line 146
    .line 147
    invoke-interface {p1, v3, v3, p2, p0}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 148
    .line 149
    .line 150
    return-void
.end method

.method public k(Landroid/hardware/camera2/CaptureRequest$Builder;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->W:Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->D()Landroid/os/Handler;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {p0, p1, v0, v1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->l(Landroid/hardware/camera2/CaptureRequest$Builder;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public k0(ZLjava/lang/String;)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 2
    .line 3
    const/16 v0, -0x1a8

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->d:Landroid/hardware/camera2/CameraCaptureSession;

    .line 8
    .line 9
    if-nez p1, :cond_1

    .line 10
    .line 11
    :cond_0
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 14
    .line 15
    const-string v2, "Capture Session is null"

    .line 16
    .line 17
    invoke-interface {p1, v0, v0, v2, v1}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    :cond_1
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->O:Ljava/util/Map;

    .line 21
    .line 22
    invoke-interface {p1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    if-nez p1, :cond_2

    .line 27
    .line 28
    const/4 p1, 0x1

    .line 29
    goto :goto_0

    .line 30
    :cond_2
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->O:Ljava/util/Map;

    .line 31
    .line 32
    invoke-interface {p1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    check-cast p1, Ljava/lang/Integer;

    .line 37
    .line 38
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    :goto_0
    iget-object p2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 43
    .line 44
    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_AWB_AVAILABLE_MODES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 45
    .line 46
    invoke-virtual {p2, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    check-cast p2, [I

    .line 51
    .line 52
    filled-new-array {p2}, [[I

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-interface {p2, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    if-nez p1, :cond_3

    .line 69
    .line 70
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 71
    .line 72
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 73
    .line 74
    const-string p2, "invalid white balance"

    .line 75
    .line 76
    invoke-interface {p1, v0, v0, p2, p0}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :cond_3
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 81
    .line 82
    invoke-virtual {p0, p1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->v0(Landroid/hardware/camera2/CaptureRequest$Builder;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    iget-boolean p2, p1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->a:Z

    .line 87
    .line 88
    if-nez p2, :cond_4

    .line 89
    .line 90
    new-instance p2, Ljava/lang/StringBuilder;

    .line 91
    .line 92
    const-string v1, "setWhiteBalance exception: "

    .line 93
    .line 94
    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    iget-object v1, p1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->b:Ljava/lang/String;

    .line 98
    .line 99
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p2

    .line 106
    const-string v1, "TECameraModeBase"

    .line 107
    .line 108
    invoke-static {v1, p2}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    iget-object p2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 112
    .line 113
    iget-object p1, p1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->b:Ljava/lang/String;

    .line 114
    .line 115
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 116
    .line 117
    invoke-interface {p2, v0, v0, p1, p0}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 118
    .line 119
    .line 120
    :cond_4
    return-void
.end method

.method public l(Landroid/hardware/camera2/CaptureRequest$Builder;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;
    .locals 4

    .line 1
    new-instance v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "capture: "

    .line 7
    .line 8
    const-string v2, "TECameraModeBase"

    .line 9
    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    const-string p0, "CaptureRequest.Builder is null"

    .line 13
    .line 14
    iput-object p0, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->b:Ljava/lang/String;

    .line 15
    .line 16
    new-instance p0, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->b:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-static {v2, p0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-object v0

    .line 34
    :cond_0
    iget-object v3, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->d:Landroid/hardware/camera2/CameraCaptureSession;

    .line 35
    .line 36
    if-nez v3, :cond_1

    .line 37
    .line 38
    const-string p0, "Capture Session is null"

    .line 39
    .line 40
    iput-object p0, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->b:Ljava/lang/String;

    .line 41
    .line 42
    new-instance p0, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iget-object p1, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->b:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-static {v2, p0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    return-object v0

    .line 60
    :cond_1
    :try_start_0
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->d:Landroid/hardware/camera2/CameraCaptureSession;

    .line 61
    .line 62
    invoke-virtual {p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-virtual {p0, p1, p2, p3}, Landroid/hardware/camera2/CameraCaptureSession;->capture(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I

    .line 67
    .line 68
    .line 69
    const/4 p0, 0x1

    .line 70
    iput-boolean p0, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->a:Z
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 71
    .line 72
    return-object v0

    .line 73
    :catch_0
    move-exception p0

    .line 74
    goto :goto_0

    .line 75
    :catch_1
    move-exception p0

    .line 76
    goto :goto_1

    .line 77
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    iput-object p0, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->b:Ljava/lang/String;

    .line 85
    .line 86
    goto :goto_2

    .line 87
    :goto_1
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    iput-object p0, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->b:Ljava/lang/String;

    .line 95
    .line 96
    :goto_2
    return-object v0
.end method

.method public m(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;
    .locals 4

    .line 1
    new-instance v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "capture: "

    .line 7
    .line 8
    const-string v2, "TECameraModeBase"

    .line 9
    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    const-string p0, "CaptureRequest is null"

    .line 13
    .line 14
    iput-object p0, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->b:Ljava/lang/String;

    .line 15
    .line 16
    new-instance p0, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->b:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-static {v2, p0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-object v0

    .line 34
    :cond_0
    iget-object v3, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->d:Landroid/hardware/camera2/CameraCaptureSession;

    .line 35
    .line 36
    if-nez v3, :cond_1

    .line 37
    .line 38
    const-string p0, "Capture Session is null"

    .line 39
    .line 40
    iput-object p0, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->b:Ljava/lang/String;

    .line 41
    .line 42
    new-instance p0, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iget-object p1, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->b:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-static {v2, p0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    return-object v0

    .line 60
    :cond_1
    :try_start_0
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->d:Landroid/hardware/camera2/CameraCaptureSession;

    .line 61
    .line 62
    invoke-virtual {p0, p1, p2, p3}, Landroid/hardware/camera2/CameraCaptureSession;->capture(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I

    .line 63
    .line 64
    .line 65
    const/4 p0, 0x1

    .line 66
    iput-boolean p0, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->a:Z
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 67
    .line 68
    return-object v0

    .line 69
    :catch_0
    move-exception p0

    .line 70
    goto :goto_0

    .line 71
    :catch_1
    move-exception p0

    .line 72
    goto :goto_1

    .line 73
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    iput-object p0, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->b:Ljava/lang/String;

    .line 81
    .line 82
    goto :goto_2

    .line 83
    :goto_1
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    iput-object p0, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->b:Ljava/lang/String;

    .line 91
    .line 92
    :goto_2
    return-object v0
.end method

.method public abstract m0()I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method public n(Ljava/util/List;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/hardware/camera2/CaptureRequest;",
            ">;",
            "Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;",
            "Landroid/os/Handler;",
            ")",
            "Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->d:Landroid/hardware/camera2/CameraCaptureSession;

    .line 7
    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    const-string p0, "Capture Session is null"

    .line 11
    .line 12
    iput-object p0, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->b:Ljava/lang/String;

    .line 13
    .line 14
    new-instance p0, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string p1, "capture: "

    .line 17
    .line 18
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->b:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const-string p1, "TECameraModeBase"

    .line 31
    .line 32
    invoke-static {p1, p0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-object v0

    .line 36
    :cond_0
    :try_start_0
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->d:Landroid/hardware/camera2/CameraCaptureSession;

    .line 37
    .line 38
    invoke-virtual {p0, p1, p2, p3}, Landroid/hardware/camera2/CameraCaptureSession;->captureBurst(Ljava/util/List;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I

    .line 39
    .line 40
    .line 41
    const/4 p0, 0x1

    .line 42
    iput-boolean p0, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->a:Z
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 43
    .line 44
    return-object v0

    .line 45
    :catch_0
    move-exception p0

    .line 46
    goto :goto_0

    .line 47
    :catch_1
    move-exception p0

    .line 48
    goto :goto_1

    .line 49
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    iput-object p0, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->b:Ljava/lang/String;

    .line 57
    .line 58
    goto :goto_2

    .line 59
    :goto_1
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    iput-object p0, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->b:Ljava/lang/String;

    .line 67
    .line 68
    :goto_2
    return-object v0
.end method

.method public n0()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public o(Ll/hj3;ILcom/ss/android/ttvecamera/TECameraSettings$c;)V
    .locals 0

    .line 1
    return-void
.end method

.method public o0(FLcom/ss/android/ttvecamera/TECameraSettings$p;)I
    .locals 5

    .line 1
    invoke-virtual {p0, p1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h(F)Landroid/graphics/Rect;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->b:Ll/crh0;

    .line 6
    .line 7
    const-string v2, "TECameraModeBase"

    .line 8
    .line 9
    const/16 v3, -0x1a4

    .line 10
    .line 11
    if-eqz v1, :cond_4

    .line 12
    .line 13
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->m:Landroid/hardware/camera2/CaptureRequest;

    .line 14
    .line 15
    if-eqz v1, :cond_4

    .line 16
    .line 17
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->d:Landroid/hardware/camera2/CameraCaptureSession;

    .line 18
    .line 19
    if-eqz v1, :cond_4

    .line 20
    .line 21
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 22
    .line 23
    if-nez v1, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    if-nez v0, :cond_1

    .line 27
    .line 28
    const-string p1, "[VE_UI_TEST]Failed event: START_ZOOM. Code: -420. Reason: zoomRect is null"

    .line 29
    .line 30
    invoke-static {v2, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 34
    .line 35
    const-string p2, "zoom rect is null."

    .line 36
    .line 37
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 38
    .line 39
    invoke-interface {p1, v3, v3, p2, p0}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    return v3

    .line 43
    :cond_1
    sget-object v4, Landroid/hardware/camera2/CaptureRequest;->SCALER_CROP_REGION:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 44
    .line 45
    invoke-virtual {v1, v4, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 49
    .line 50
    invoke-virtual {p0, v0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->v0(Landroid/hardware/camera2/CaptureRequest$Builder;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iget-boolean v1, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->a:Z

    .line 55
    .line 56
    if-nez v1, :cond_2

    .line 57
    .line 58
    new-instance p1, Ljava/lang/StringBuilder;

    .line 59
    .line 60
    const-string p2, "[VE_UI_TEST]Failed event: START_ZOOM. Code: -420. Reason: "

    .line 61
    .line 62
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->a()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p2

    .line 69
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-static {v2, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 80
    .line 81
    iget-object p2, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->b:Ljava/lang/String;

    .line 82
    .line 83
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 84
    .line 85
    invoke-interface {p1, v3, v3, p2, p0}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 86
    .line 87
    .line 88
    return v3

    .line 89
    :cond_2
    if-eqz p2, :cond_3

    .line 90
    .line 91
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 92
    .line 93
    iget v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 94
    .line 95
    const/4 v1, 0x1

    .line 96
    invoke-interface {p2, v0, p1, v1}, Lcom/ss/android/ttvecamera/TECameraSettings$p;->onChange(IFZ)V

    .line 97
    .line 98
    .line 99
    :cond_3
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->y()V

    .line 100
    .line 101
    .line 102
    const/4 p0, 0x0

    .line 103
    return p0

    .line 104
    :cond_4
    :goto_0
    const-string p1, "[VE_UI_TEST]Failed event: START_ZOOM. Code: -420. Reason: camera is null"

    .line 105
    .line 106
    invoke-static {v2, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 110
    .line 111
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 112
    .line 113
    const-string p2, "startZoom : Env is null"

    .line 114
    .line 115
    invoke-interface {p1, v3, v3, p2, p0}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 116
    .line 117
    .line 118
    const/16 p0, -0x64

    .line 119
    .line 120
    return p0
.end method

.method public p()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 2
    .line 3
    iget-boolean v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->n:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->g:Lcom/ss/android/ttvecamera/b;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/b;->T0()Ll/lwk;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->g:Lcom/ss/android/ttvecamera/b;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/b;->T0()Ll/lwk;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->U:Ll/lwk$b;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ll/lwk;->i(Ll/lwk$b;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->S()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public p0()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public q()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->g:Lcom/ss/android/ttvecamera/b;

    .line 2
    .line 3
    const-string v1, "TECameraModeBase"

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-boolean v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->k:Z

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    new-instance v0, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const-string v2, "close session process...state = "

    .line 18
    .line 19
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->g:Lcom/ss/android/ttvecamera/b;

    .line 23
    .line 24
    invoke-virtual {v2}, Lcom/ss/android/ttvecamera/b;->U0()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->g:Lcom/ss/android/ttvecamera/b;

    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/b;->U0()I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    const/4 v2, 0x2

    .line 45
    if-ne v0, v2, :cond_0

    .line 46
    .line 47
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->g:Lcom/ss/android/ttvecamera/b;

    .line 48
    .line 49
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/b;->b1()V

    .line 50
    .line 51
    .line 52
    :cond_0
    const/4 v0, 0x0

    .line 53
    iput-boolean v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->N:Z

    .line 54
    .line 55
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->C()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    if-nez v0, :cond_1

    .line 60
    .line 61
    const-string p0, "close session process...device is null"

    .line 62
    .line 63
    invoke-static {v1, p0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->d:Landroid/hardware/camera2/CameraCaptureSession;

    .line 68
    .line 69
    if-nez v0, :cond_2

    .line 70
    .line 71
    const-string p0, "close session process...session is null"

    .line 72
    .line 73
    invoke-static {v1, p0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 78
    .line 79
    .line 80
    move-result-wide v2

    .line 81
    :try_start_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->d:Landroid/hardware/camera2/CameraCaptureSession;

    .line 82
    .line 83
    invoke-virtual {v0}, Landroid/hardware/camera2/CameraCaptureSession;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 84
    .line 85
    .line 86
    goto :goto_0

    .line 87
    :catch_0
    move-exception v0

    .line 88
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 89
    .line 90
    .line 91
    :goto_0
    const/4 v0, 0x0

    .line 92
    iput-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->d:Landroid/hardware/camera2/CameraCaptureSession;

    .line 93
    .line 94
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 95
    .line 96
    .line 97
    move-result-wide v4

    .line 98
    sub-long/2addr v4, v2

    .line 99
    const-string p0, "te_record_camera2_close_session_cost"

    .line 100
    .line 101
    invoke-static {p0, v4, v5}, Ll/hrh0;->b(Ljava/lang/String;J)V

    .line 102
    .line 103
    .line 104
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-static {p0, v0}, Lcom/ss/android/ttvecamera/g;->f(Ljava/lang/String;Ljava/lang/Object;)V

    .line 109
    .line 110
    .line 111
    new-instance p0, Ljava/lang/StringBuilder;

    .line 112
    .line 113
    const-string v0, "close session...consume = "

    .line 114
    .line 115
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {p0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    invoke-static {v1, p0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    return-void
.end method

.method public q0()Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;
    .locals 2

    .line 1
    new-instance v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->d:Landroid/hardware/camera2/CameraCaptureSession;

    .line 7
    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    const-string p0, "Capture Session is null"

    .line 11
    .line 12
    iput-object p0, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->b:Ljava/lang/String;

    .line 13
    .line 14
    new-instance p0, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string v1, "stopRepeating: "

    .line 17
    .line 18
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v1, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->b:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const-string v1, "TECameraModeBase"

    .line 31
    .line 32
    invoke-static {v1, p0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-object v0

    .line 36
    :cond_0
    :try_start_0
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->d:Landroid/hardware/camera2/CameraCaptureSession;

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/hardware/camera2/CameraCaptureSession;->stopRepeating()V

    .line 39
    .line 40
    .line 41
    const/4 p0, 0x1

    .line 42
    iput-boolean p0, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->a:Z
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 43
    .line 44
    return-object v0

    .line 45
    :catch_0
    move-exception p0

    .line 46
    goto :goto_0

    .line 47
    :catch_1
    move-exception p0

    .line 48
    goto :goto_1

    .line 49
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    iput-object p0, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->b:Ljava/lang/String;

    .line 57
    .line 58
    goto :goto_2

    .line 59
    :goto_1
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    iput-object p0, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->b:Ljava/lang/String;

    .line 67
    .line 68
    :goto_2
    return-object v0
.end method

.method public r(Landroid/util/Range;)Landroid/util/Range;
    .locals 0
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
    return-object p1
.end method

.method public r0(IILcom/ss/android/ttvecamera/TECameraSettings$l;)V
    .locals 0

    .line 1
    return-void
.end method

.method public s(I)Landroid/hardware/camera2/CaptureRequest$Builder;
    .locals 2

    .line 1
    const/4 v0, 0x6

    .line 2
    const/4 v1, 0x0

    .line 3
    if-gt p1, v0, :cond_2

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    if-ge p1, v0, :cond_0

    .line 7
    .line 8
    goto :goto_1

    .line 9
    :cond_0
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    :try_start_0
    invoke-virtual {p0, p1}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 14
    .line 15
    .line 16
    move-result-object p0
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    return-object p0

    .line 18
    :catch_0
    move-exception p0

    .line 19
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :catch_1
    move-exception p0

    .line 24
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 25
    .line 26
    .line 27
    :cond_1
    :goto_0
    return-object v1

    .line 28
    :cond_2
    :goto_1
    const-string p0, "TECameraModeBase"

    .line 29
    .line 30
    const-string p1, "createCaptureRequestBuilder, template invalid, must be [1, 6]"

    .line 31
    .line 32
    invoke-static {p0, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-object v1
.end method

.method public s0(Lcom/ss/android/ttvecamera/TECameraSettings$l;I)V
    .locals 1

    .line 1
    iget-boolean p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->L:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 6
    .line 7
    sget-object p2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 8
    .line 9
    const/4 v0, 0x3

    .line 10
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p1, p2, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 18
    .line 19
    sget-object p1, Landroid/hardware/camera2/CaptureRequest;->FLASH_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 20
    .line 21
    const/4 p2, 0x1

    .line 22
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    invoke-virtual {p0, p1, p2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    :cond_0
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
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1c

    .line 4
    .line 5
    const-string v2, "TECameraModeBase"

    .line 6
    .line 7
    if-lt v0, v1, :cond_2

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 12
    .line 13
    iget-boolean v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->o0:Z

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->S:Ljava/util/List;

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    if-eqz v3, :cond_1

    .line 36
    .line 37
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    check-cast v3, Landroid/view/Surface;

    .line 42
    .line 43
    new-instance v4, Landroid/hardware/camera2/params/OutputConfiguration;

    .line 44
    .line 45
    invoke-direct {v4, v3}, Landroid/hardware/camera2/params/OutputConfiguration;-><init>(Landroid/view/Surface;)V

    .line 46
    .line 47
    .line 48
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    :goto_1
    invoke-static {}, Ll/trh0;->a()V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0, p1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->M(Ljava/util/List;)I

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    new-instance v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$a;

    .line 60
    .line 61
    invoke-direct {v1, p0, p3}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$a;-><init>(Lcom/ss/android/ttvecamera/framework/TECameraModeBase;Landroid/os/Handler;)V

    .line 62
    .line 63
    .line 64
    invoke-static {p1, v0, v1, p2}, Ll/srh0;->a(ILjava/util/List;Ljava/util/concurrent/Executor;Landroid/hardware/camera2/CameraCaptureSession$StateCallback;)Landroid/hardware/camera2/params/SessionConfiguration;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    iget-object p2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 69
    .line 70
    invoke-virtual {p2}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    .line 71
    .line 72
    .line 73
    move-result-object p2

    .line 74
    invoke-static {p1, p2}, Ll/qrh0;->a(Landroid/hardware/camera2/params/SessionConfiguration;Landroid/hardware/camera2/CaptureRequest;)V

    .line 75
    .line 76
    .line 77
    const-string p2, "createSession by sessionConfiguration"

    .line 78
    .line 79
    invoke-static {v2, p2}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 83
    .line 84
    invoke-static {p0, p1}, Ll/rrh0;->a(Landroid/hardware/camera2/CameraDevice;Landroid/hardware/camera2/params/SessionConfiguration;)V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :cond_2
    const-string v0, "createSession by normally"

    .line 89
    .line 90
    invoke-static {v2, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 94
    .line 95
    invoke-virtual {p0, p1, p2, p3}, Landroid/hardware/camera2/CameraDevice;->createCaptureSession(Ljava/util/List;Landroid/hardware/camera2/CameraCaptureSession$StateCallback;Landroid/os/Handler;)V

    .line 96
    .line 97
    .line 98
    return-void
.end method

.method public t0(Z)I
    .locals 9

    .line 1
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 2
    .line 3
    const-string v2, "TECameraModeBase"

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    const-string v1, "[VE_UI_TEST]Failed event: TOGGLE. Code: -100. Reason: mCaptureRequestBuilder is null"

    .line 8
    .line 9
    invoke-static {v2, v1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 13
    .line 14
    iget-object v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 15
    .line 16
    iget v2, v2, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 17
    .line 18
    iget-object v3, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 19
    .line 20
    const/16 v6, -0x64

    .line 21
    .line 22
    const-string v4, "toggleTorch : CaptureRequest.Builder is null"

    .line 23
    .line 24
    invoke-interface {v1, v2, v6, v4, v3}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 28
    .line 29
    iget-object v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 30
    .line 31
    iget v2, v2, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 32
    .line 33
    move-object v3, v1

    .line 34
    move v1, v2

    .line 35
    const/16 v2, -0x64

    .line 36
    .line 37
    iget-object v5, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 38
    .line 39
    move-object v0, v3

    .line 40
    move v3, p1

    .line 41
    invoke-interface/range {v0 .. v5}, Lcom/ss/android/ttvecamera/c$a;->g(IIILjava/lang/String;Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    return v6

    .line 45
    :cond_0
    sget-object v4, Landroid/hardware/camera2/CaptureRequest;->FLASH_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 46
    .line 47
    const/4 v6, 0x0

    .line 48
    if-eqz p1, :cond_1

    .line 49
    .line 50
    const/4 v5, 0x2

    .line 51
    goto :goto_0

    .line 52
    :cond_1
    move v5, v6

    .line 53
    :goto_0
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 54
    .line 55
    .line 56
    move-result-object v5

    .line 57
    invoke-virtual {v1, v4, v5}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 58
    .line 59
    .line 60
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 61
    .line 62
    new-instance v4, Ljava/lang/StringBuilder;

    .line 63
    .line 64
    const-string v5, "camera2 will change flash mode "

    .line 65
    .line 66
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v4

    .line 76
    const/16 v5, 0x68

    .line 77
    .line 78
    const/4 v7, 0x0

    .line 79
    invoke-interface {v1, v5, v6, v4, v7}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 80
    .line 81
    .line 82
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 83
    .line 84
    invoke-virtual {p0, v1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->v0(Landroid/hardware/camera2/CaptureRequest$Builder;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    iget-object v4, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 89
    .line 90
    new-instance v5, Ljava/lang/StringBuilder;

    .line 91
    .line 92
    const-string v8, "camera2 did change flash mode "

    .line 93
    .line 94
    invoke-direct {v5, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v5

    .line 104
    const/16 v8, 0x69

    .line 105
    .line 106
    invoke-interface {v4, v8, v6, v5, v7}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 107
    .line 108
    .line 109
    iget-boolean v4, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->a:Z

    .line 110
    .line 111
    if-nez v4, :cond_2

    .line 112
    .line 113
    new-instance v4, Ljava/lang/StringBuilder;

    .line 114
    .line 115
    const-string v5, "[VE_UI_TEST]Failed event: TOGGLE. Code: -417. Reason: "

    .line 116
    .line 117
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->a()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v5

    .line 124
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v4

    .line 131
    invoke-static {v2, v4}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    iget-object v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 135
    .line 136
    iget-object v4, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->b:Ljava/lang/String;

    .line 137
    .line 138
    iget-object v5, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 139
    .line 140
    const/16 v6, -0x1a1

    .line 141
    .line 142
    invoke-interface {v2, v6, v6, v4, v5}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 143
    .line 144
    .line 145
    iget-object v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 146
    .line 147
    iget-object v4, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 148
    .line 149
    iget v4, v4, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 150
    .line 151
    iget-object v1, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->b:Ljava/lang/String;

    .line 152
    .line 153
    iget-object v5, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 154
    .line 155
    move-object v0, v2

    .line 156
    const/16 v2, -0x1a1

    .line 157
    .line 158
    move v3, v4

    .line 159
    move-object v4, v1

    .line 160
    move v1, v3

    .line 161
    move v3, p1

    .line 162
    invoke-interface/range {v0 .. v5}, Lcom/ss/android/ttvecamera/c$a;->g(IIILjava/lang/String;Ljava/lang/Object;)V

    .line 163
    .line 164
    .line 165
    return v6

    .line 166
    :cond_2
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 167
    .line 168
    iget-object v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 169
    .line 170
    iget v2, v2, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 171
    .line 172
    const-string v4, "camera torch success"

    .line 173
    .line 174
    iget-object v5, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 175
    .line 176
    move-object v0, v1

    .line 177
    move v1, v2

    .line 178
    const/4 v2, 0x0

    .line 179
    move v3, p1

    .line 180
    invoke-interface/range {v0 .. v5}, Lcom/ss/android/ttvecamera/c$a;->h(IIILjava/lang/String;Ljava/lang/Object;)V

    .line 181
    .line 182
    .line 183
    return v6
.end method

.method public u()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1c

    .line 4
    .line 5
    if-lt v0, v1, :cond_4

    .line 6
    .line 7
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 8
    .line 9
    if-eqz v0, :cond_4

    .line 10
    .line 11
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->S:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 17
    .line 18
    iget v1, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->B:I

    .line 19
    .line 20
    if-nez v1, :cond_3

    .line 21
    .line 22
    iget v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 23
    .line 24
    const/4 v1, 0x2

    .line 25
    if-ne v0, v1, :cond_3

    .line 26
    .line 27
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->S:Ljava/util/List;

    .line 28
    .line 29
    invoke-static {}, Ll/grh0;->a()V

    .line 30
    .line 31
    .line 32
    new-instance v1, Landroid/util/Size;

    .line 33
    .line 34
    iget-object v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 35
    .line 36
    invoke-virtual {v2}, Lcom/ss/android/ttvecamera/TECameraSettings;->a()Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    iget v2, v2, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 41
    .line 42
    iget-object v3, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 43
    .line 44
    invoke-virtual {v3}, Lcom/ss/android/ttvecamera/TECameraSettings;->a()Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    iget v3, v3, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 49
    .line 50
    invoke-direct {v1, v2, v3}, Landroid/util/Size;-><init>(II)V

    .line 51
    .line 52
    .line 53
    const-class v2, Landroid/graphics/SurfaceTexture;

    .line 54
    .line 55
    invoke-static {v1, v2}, Ll/frh0;->a(Landroid/util/Size;Ljava/lang/Class;)Landroid/hardware/camera2/params/OutputConfiguration;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 63
    .line 64
    iget-boolean v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->k:Z

    .line 65
    .line 66
    if-eqz v0, :cond_0

    .line 67
    .line 68
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->D()Landroid/os/Handler;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    goto :goto_0

    .line 73
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->k:Landroid/os/Handler;

    .line 74
    .line 75
    :goto_0
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 76
    .line 77
    if-eqz v1, :cond_3

    .line 78
    .line 79
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 80
    .line 81
    if-nez v1, :cond_2

    .line 82
    .line 83
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 84
    .line 85
    iget-object v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->E:Landroid/os/Bundle;

    .line 86
    .line 87
    const-string v2, "enablePreviewTemplate"

    .line 88
    .line 89
    invoke-virtual {v1, v2}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    iget-object v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 94
    .line 95
    if-eqz v1, :cond_1

    .line 96
    .line 97
    const/4 v1, 0x1

    .line 98
    invoke-virtual {v2, v1}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    iput-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 103
    .line 104
    goto :goto_1

    .line 105
    :cond_1
    const/4 v1, 0x3

    .line 106
    invoke-virtual {v2, v1}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    iput-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 111
    .line 112
    :cond_2
    :goto_1
    new-instance v1, Landroid/util/Range;

    .line 113
    .line 114
    iget-object v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->B:Lcom/ss/android/ttvecamera/TEFrameRateRange;

    .line 115
    .line 116
    iget v2, v2, Lcom/ss/android/ttvecamera/TEFrameRateRange;->min:I

    .line 117
    .line 118
    iget-object v3, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 119
    .line 120
    iget-object v3, v3, Lcom/ss/android/ttvecamera/TECameraSettings;->c:Lcom/ss/android/ttvecamera/TEFrameRateRange;

    .line 121
    .line 122
    iget v3, v3, Lcom/ss/android/ttvecamera/TEFrameRateRange;->fpsUnitFactor:I

    .line 123
    .line 124
    div-int/2addr v2, v3

    .line 125
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 126
    .line 127
    .line 128
    move-result-object v2

    .line 129
    iget-object v3, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->B:Lcom/ss/android/ttvecamera/TEFrameRateRange;

    .line 130
    .line 131
    iget v3, v3, Lcom/ss/android/ttvecamera/TEFrameRateRange;->max:I

    .line 132
    .line 133
    iget-object v4, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 134
    .line 135
    iget-object v4, v4, Lcom/ss/android/ttvecamera/TECameraSettings;->c:Lcom/ss/android/ttvecamera/TEFrameRateRange;

    .line 136
    .line 137
    iget v4, v4, Lcom/ss/android/ttvecamera/TEFrameRateRange;->fpsUnitFactor:I

    .line 138
    .line 139
    div-int/2addr v3, v4

    .line 140
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 141
    .line 142
    .line 143
    move-result-object v3

    .line 144
    invoke-direct {v1, v2, v3}, Landroid/util/Range;-><init>(Ljava/lang/Comparable;Ljava/lang/Comparable;)V

    .line 145
    .line 146
    .line 147
    invoke-virtual {p0, v1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->r(Landroid/util/Range;)Landroid/util/Range;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    iget-object v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 152
    .line 153
    sget-object v3, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_TARGET_FPS_RANGE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 154
    .line 155
    invoke-virtual {v2, v3, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 156
    .line 157
    .line 158
    const/4 v1, 0x0

    .line 159
    iget-object v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->V:Landroid/hardware/camera2/CameraCaptureSession$StateCallback;

    .line 160
    .line 161
    invoke-virtual {p0, v1, v2, v0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->t(Ljava/util/List;Landroid/hardware/camera2/CameraCaptureSession$StateCallback;Landroid/os/Handler;)V

    .line 162
    .line 163
    .line 164
    :cond_3
    const/4 v0, 0x0

    .line 165
    iput-boolean v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->Q:Z

    .line 166
    .line 167
    iput-boolean v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->R:Z

    .line 168
    .line 169
    :cond_4
    return-void
.end method

.method public u0()I
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/hardware/camera2/CameraAccessException;
        }
    .end annotation

    .line 1
    const-string v0, "TECameraModeBase-updateCapture"

    .line 2
    .line 3
    invoke-static {v0}, Ll/dsh0;->a(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->g:Lcom/ss/android/ttvecamera/b;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/c;->K()Ll/jrh0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "TECameraModeBase"

    .line 13
    .line 14
    if-eqz v0, :cond_5

    .line 15
    .line 16
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 17
    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    goto/16 :goto_1

    .line 21
    .line 22
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->b:Ll/crh0;

    .line 23
    .line 24
    iget-object v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 25
    .line 26
    invoke-virtual {v0, v2}, Ll/crh0;->r(Landroid/hardware/camera2/CameraCharacteristics;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    const/4 v2, 0x1

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->O()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    new-instance v0, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    const-string v3, "Stabilization Supported, toggle = "

    .line 42
    .line 43
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iget-object v3, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 47
    .line 48
    iget-boolean v3, v3, Lcom/ss/android/ttvecamera/TECameraSettings;->U:Z

    .line 49
    .line 50
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->b:Ll/crh0;

    .line 61
    .line 62
    iget-object v3, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 63
    .line 64
    iget-object v4, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 65
    .line 66
    iget-object v5, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 67
    .line 68
    iget-boolean v5, v5, Lcom/ss/android/ttvecamera/TECameraSettings;->U:Z

    .line 69
    .line 70
    invoke-virtual {v0, v3, v4, v5}, Ll/crh0;->a(Landroid/hardware/camera2/CameraCharacteristics;Landroid/hardware/camera2/CaptureRequest$Builder;Z)I

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-nez v0, :cond_1

    .line 75
    .line 76
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 77
    .line 78
    iget-boolean v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->U:Z

    .line 79
    .line 80
    if-eqz v0, :cond_1

    .line 81
    .line 82
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 83
    .line 84
    const-string v3, "enable stablization"

    .line 85
    .line 86
    iget-object v4, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 87
    .line 88
    const/16 v5, 0x71

    .line 89
    .line 90
    invoke-interface {v0, v5, v2, v3, v4}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 91
    .line 92
    .line 93
    :cond_1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 94
    .line 95
    sget-object v3, Landroid/hardware/camera2/CaptureRequest;->CONTROL_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 96
    .line 97
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    invoke-virtual {v0, v3, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 102
    .line 103
    .line 104
    invoke-direct {p0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->b0()V

    .line 105
    .line 106
    .line 107
    new-instance v0, Landroid/util/Range;

    .line 108
    .line 109
    iget-object v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->B:Lcom/ss/android/ttvecamera/TEFrameRateRange;

    .line 110
    .line 111
    iget v2, v2, Lcom/ss/android/ttvecamera/TEFrameRateRange;->min:I

    .line 112
    .line 113
    iget-object v3, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 114
    .line 115
    iget-object v3, v3, Lcom/ss/android/ttvecamera/TECameraSettings;->c:Lcom/ss/android/ttvecamera/TEFrameRateRange;

    .line 116
    .line 117
    iget v3, v3, Lcom/ss/android/ttvecamera/TEFrameRateRange;->fpsUnitFactor:I

    .line 118
    .line 119
    div-int/2addr v2, v3

    .line 120
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 121
    .line 122
    .line 123
    move-result-object v2

    .line 124
    iget-object v3, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->B:Lcom/ss/android/ttvecamera/TEFrameRateRange;

    .line 125
    .line 126
    iget v3, v3, Lcom/ss/android/ttvecamera/TEFrameRateRange;->max:I

    .line 127
    .line 128
    iget-object v4, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 129
    .line 130
    iget-object v4, v4, Lcom/ss/android/ttvecamera/TECameraSettings;->c:Lcom/ss/android/ttvecamera/TEFrameRateRange;

    .line 131
    .line 132
    iget v4, v4, Lcom/ss/android/ttvecamera/TEFrameRateRange;->fpsUnitFactor:I

    .line 133
    .line 134
    div-int/2addr v3, v4

    .line 135
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 136
    .line 137
    .line 138
    move-result-object v3

    .line 139
    invoke-direct {v0, v2, v3}, Landroid/util/Range;-><init>(Ljava/lang/Comparable;Ljava/lang/Comparable;)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {p0, v0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->r(Landroid/util/Range;)Landroid/util/Range;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    iget-object v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 147
    .line 148
    sget-object v3, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_TARGET_FPS_RANGE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 149
    .line 150
    invoke-virtual {v2, v3, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 151
    .line 152
    .line 153
    iget-object v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 154
    .line 155
    invoke-virtual {v0}, Landroid/util/Range;->toString()Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    const/4 v3, 0x0

    .line 160
    const/16 v4, 0x79

    .line 161
    .line 162
    const/4 v5, 0x0

    .line 163
    invoke-interface {v2, v4, v5, v0, v3}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 164
    .line 165
    .line 166
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 167
    .line 168
    sget-object v2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_EXPOSURE_COMPENSATION:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 169
    .line 170
    iget v3, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->s:I

    .line 171
    .line 172
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 173
    .line 174
    .line 175
    move-result-object v3

    .line 176
    invoke-virtual {v0, v2, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 177
    .line 178
    .line 179
    iget v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->y:I

    .line 180
    .line 181
    invoke-virtual {p0, v0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->y0(I)V

    .line 182
    .line 183
    .line 184
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 185
    .line 186
    iget v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->x0:F

    .line 187
    .line 188
    iget v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->q:F

    .line 189
    .line 190
    invoke-static {v0, v2}, Ljava/lang/Float;->compare(FF)I

    .line 191
    .line 192
    .line 193
    move-result v0

    .line 194
    if-eqz v0, :cond_3

    .line 195
    .line 196
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 197
    .line 198
    iget v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->x0:F

    .line 199
    .line 200
    iget v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->p:F

    .line 201
    .line 202
    invoke-static {v0, v2}, Ljava/lang/Math;->min(FF)F

    .line 203
    .line 204
    .line 205
    move-result v0

    .line 206
    iput v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->q:F

    .line 207
    .line 208
    invoke-virtual {p0, v0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->i(F)Landroid/graphics/Rect;

    .line 209
    .line 210
    .line 211
    move-result-object v0

    .line 212
    if-nez v0, :cond_2

    .line 213
    .line 214
    const-string v0, "calculate default crop_region fail!"

    .line 215
    .line 216
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 217
    .line 218
    .line 219
    goto :goto_0

    .line 220
    :cond_2
    iget-object v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 221
    .line 222
    sget-object v3, Landroid/hardware/camera2/CaptureRequest;->SCALER_CROP_REGION:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 223
    .line 224
    invoke-virtual {v2, v3, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 225
    .line 226
    .line 227
    :cond_3
    :goto_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 228
    .line 229
    invoke-virtual {p0, v0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->v0(Landroid/hardware/camera2/CaptureRequest$Builder;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 230
    .line 231
    .line 232
    move-result-object v0

    .line 233
    iget-boolean v2, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->a:Z

    .line 234
    .line 235
    if-nez v2, :cond_4

    .line 236
    .line 237
    new-instance v2, Ljava/lang/StringBuilder;

    .line 238
    .line 239
    const-string v3, "first request failed: "

    .line 240
    .line 241
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 242
    .line 243
    .line 244
    iget-object v0, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->b:Ljava/lang/String;

    .line 245
    .line 246
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 247
    .line 248
    .line 249
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 250
    .line 251
    .line 252
    move-result-object v0

    .line 253
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 254
    .line 255
    .line 256
    :cond_4
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 257
    .line 258
    iget-object v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 259
    .line 260
    sget-object v3, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_ORIENTATION:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 261
    .line 262
    invoke-virtual {v2, v3}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 263
    .line 264
    .line 265
    move-result-object v2

    .line 266
    check-cast v2, Ljava/lang/Integer;

    .line 267
    .line 268
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 269
    .line 270
    .line 271
    move-result v2

    .line 272
    iput v2, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->e:I

    .line 273
    .line 274
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->g:Lcom/ss/android/ttvecamera/b;

    .line 275
    .line 276
    const/4 v2, 0x3

    .line 277
    invoke-virtual {v0, v2}, Lcom/ss/android/ttvecamera/b;->a1(I)V

    .line 278
    .line 279
    .line 280
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->y()V

    .line 281
    .line 282
    .line 283
    new-instance v0, Ljava/lang/StringBuilder;

    .line 284
    .line 285
    const-string v2, "send capture request..."

    .line 286
    .line 287
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 288
    .line 289
    .line 290
    iget-object v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->d:Landroid/hardware/camera2/CameraCaptureSession;

    .line 291
    .line 292
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 293
    .line 294
    .line 295
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 296
    .line 297
    .line 298
    move-result-object v0

    .line 299
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 300
    .line 301
    .line 302
    iget-object v6, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 303
    .line 304
    const-string v10, "TECamera2 preview"

    .line 305
    .line 306
    iget-object v11, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 307
    .line 308
    const/4 v7, 0x2

    .line 309
    const/4 v8, 0x0

    .line 310
    const/4 v9, 0x0

    .line 311
    invoke-interface/range {v6 .. v11}, Lcom/ss/android/ttvecamera/c$a;->a(IIILjava/lang/String;Ljava/lang/Object;)V

    .line 312
    .line 313
    .line 314
    invoke-static {}, Ll/dsh0;->b()V

    .line 315
    .line 316
    .line 317
    return v5

    .line 318
    :cond_5
    :goto_1
    const-string p0, "update capture failed"

    .line 319
    .line 320
    invoke-static {v1, p0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 321
    .line 322
    .line 323
    const/16 p0, -0x64

    .line 324
    .line 325
    return p0
.end method

.method public v0(Landroid/hardware/camera2/CaptureRequest$Builder;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->W:Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->w0(Landroid/hardware/camera2/CaptureRequest$Builder;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public w()I
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
    const-string v2, "rollbackNormalSessionRequest : param is null."

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
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->i:Ll/orh0;

    .line 22
    .line 23
    invoke-interface {v1, v0}, Ll/p6m;->a(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->d:Landroid/hardware/camera2/CameraCaptureSession;

    .line 27
    .line 28
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 29
    .line 30
    invoke-virtual {p0, v0, v1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->b(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 31
    .line 32
    .line 33
    const/4 p0, 0x0

    .line 34
    return p0
.end method

.method public w0(Landroid/hardware/camera2/CaptureRequest$Builder;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->D()Landroid/os/Handler;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, p1, p2, v0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->x0(Landroid/hardware/camera2/CaptureRequest$Builder;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public x(Z)V
    .locals 3

    .line 1
    if-nez p1, :cond_3

    .line 2
    .line 3
    iget v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->q:F

    .line 4
    .line 5
    const/high16 v1, 0x3f800000    # 1.0f

    .line 6
    .line 7
    cmpl-float v0, v0, v1

    .line 8
    .line 9
    if-eqz v0, :cond_3

    .line 10
    .line 11
    iput v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->q:F

    .line 12
    .line 13
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 14
    .line 15
    const/16 v1, 0x1e

    .line 16
    .line 17
    if-lt v0, v1, :cond_2

    .line 18
    .line 19
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->d:Landroid/hardware/camera2/CameraCaptureSession;

    .line 24
    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 29
    .line 30
    invoke-static {}, Ll/erh0;->a()Landroid/hardware/camera2/CaptureRequest$Key;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iget v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->q:F

    .line 35
    .line 36
    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 44
    .line 45
    invoke-virtual {p0, v0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->v0(Landroid/hardware/camera2/CaptureRequest$Builder;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iget-boolean v1, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->a:Z

    .line 50
    .line 51
    if-nez v1, :cond_2

    .line 52
    .line 53
    new-instance p1, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    const-string v1, "[VE_UI_TEST]Failed event: START_ZOOM. Code: -420. Reason: "

    .line 56
    .line 57
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->a()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    const-string v1, "TECameraModeBase"

    .line 72
    .line 73
    invoke-static {v1, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 77
    .line 78
    iget-object v0, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->b:Ljava/lang/String;

    .line 79
    .line 80
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 81
    .line 82
    const/16 v1, -0x1a4

    .line 83
    .line 84
    invoke-interface {p1, v1, v1, v0, p0}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 89
    .line 90
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 91
    .line 92
    iget v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 93
    .line 94
    const/16 v1, -0x64

    .line 95
    .line 96
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 97
    .line 98
    const-string v2, "enableMulticamZoom : Capture Session is null"

    .line 99
    .line 100
    invoke-interface {p1, v0, v1, v2, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 101
    .line 102
    .line 103
    return-void

    .line 104
    :cond_2
    iget v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->q:F

    .line 105
    .line 106
    invoke-virtual {p0, v0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->i(F)Landroid/graphics/Rect;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    iput-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->t:Landroid/graphics/Rect;

    .line 111
    .line 112
    :cond_3
    iput-boolean p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->M:Z

    .line 113
    .line 114
    return-void
.end method

.method public x0(Landroid/hardware/camera2/CaptureRequest$Builder;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;
    .locals 4

    .line 1
    const-string v0, "TECameraModeBase-updatePreview"

    .line 2
    .line 3
    invoke-static {v0}, Ll/dsh0;->a(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 7
    .line 8
    invoke-direct {v0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v1, "updatePreview: "

    .line 12
    .line 13
    const-string v2, "TECameraModeBase"

    .line 14
    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    const-string p0, "CaptureRequest.Builder is null"

    .line 18
    .line 19
    iput-object p0, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->b:Ljava/lang/String;

    .line 20
    .line 21
    new-instance p0, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object p1, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->b:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-static {v2, p0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-object v0

    .line 39
    :cond_0
    iget-object v3, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->d:Landroid/hardware/camera2/CameraCaptureSession;

    .line 40
    .line 41
    if-nez v3, :cond_1

    .line 42
    .line 43
    const-string p0, "Capture Session is null"

    .line 44
    .line 45
    iput-object p0, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->b:Ljava/lang/String;

    .line 46
    .line 47
    new-instance p0, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    iget-object p1, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->b:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-static {v2, p0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    return-object v0

    .line 65
    :cond_1
    invoke-virtual {p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    iput-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->m:Landroid/hardware/camera2/CaptureRequest;

    .line 70
    .line 71
    :try_start_0
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->d:Landroid/hardware/camera2/CameraCaptureSession;

    .line 72
    .line 73
    invoke-virtual {v1, p1, p2, p3}, Landroid/hardware/camera2/CameraCaptureSession;->setRepeatingRequest(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I

    .line 74
    .line 75
    .line 76
    const/4 p1, 0x1

    .line 77
    iput-boolean p1, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->a:Z

    .line 78
    .line 79
    iput-boolean p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->N:Z
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 80
    .line 81
    goto :goto_4

    .line 82
    :catch_0
    move-exception p0

    .line 83
    goto :goto_0

    .line 84
    :catch_1
    move-exception p0

    .line 85
    goto :goto_1

    .line 86
    :catch_2
    move-exception p1

    .line 87
    goto :goto_2

    .line 88
    :catch_3
    move-exception p0

    .line 89
    goto :goto_3

    .line 90
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    iput-object p0, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->b:Ljava/lang/String;

    .line 98
    .line 99
    goto :goto_4

    .line 100
    :goto_1
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 101
    .line 102
    .line 103
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    iput-object p0, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->b:Ljava/lang/String;

    .line 108
    .line 109
    goto :goto_4

    .line 110
    :goto_2
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    iput-object p1, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->b:Ljava/lang/String;

    .line 118
    .line 119
    const/4 p1, 0x0

    .line 120
    iput-boolean p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->N:Z

    .line 121
    .line 122
    goto :goto_4

    .line 123
    :goto_3
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 124
    .line 125
    .line 126
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    iput-object p0, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->b:Ljava/lang/String;

    .line 131
    .line 132
    :goto_4
    invoke-static {}, Ll/dsh0;->b()V

    .line 133
    .line 134
    .line 135
    return-object v0
.end method

.method public y()V
    .locals 4

    .line 1
    const-string v0, "TECameraModeBase-fillFeatures"

    .line 2
    .line 3
    invoke-static {v0}, Ll/dsh0;->a(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->g:Lcom/ss/android/ttvecamera/b;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/c;->A()Ljava/util/Map;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 13
    .line 14
    iget-object v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->H:Ljava/lang/String;

    .line 15
    .line 16
    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->g:Lcom/ss/android/ttvecamera/b;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/c;->A()Ljava/util/Map;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 29
    .line 30
    iget-object v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->H:Ljava/lang/String;

    .line 31
    .line 32
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Landroid/os/Bundle;

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    new-instance v0, Landroid/os/Bundle;

    .line 40
    .line 41
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 42
    .line 43
    .line 44
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->g:Lcom/ss/android/ttvecamera/b;

    .line 45
    .line 46
    invoke-virtual {v1}, Lcom/ss/android/ttvecamera/c;->A()Ljava/util/Map;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    iget-object v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 51
    .line 52
    iget-object v2, v2, Lcom/ss/android/ttvecamera/TECameraSettings;->H:Ljava/lang/String;

    .line 53
    .line 54
    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    :goto_0
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 58
    .line 59
    iget-object v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->q:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 60
    .line 61
    const-string v2, "camera_preview_size"

    .line 62
    .line 63
    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 64
    .line 65
    .line 66
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 67
    .line 68
    if-eqz v1, :cond_1

    .line 69
    .line 70
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->m:Landroid/hardware/camera2/CaptureRequest;

    .line 71
    .line 72
    if-eqz v1, :cond_1

    .line 73
    .line 74
    new-instance v1, Lcom/ss/android/ttvecamera/TEFocusParameters;

    .line 75
    .line 76
    invoke-direct {v1}, Lcom/ss/android/ttvecamera/TEFocusParameters;-><init>()V

    .line 77
    .line 78
    .line 79
    iget-object v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 80
    .line 81
    sget-object v3, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_INFO_ACTIVE_ARRAY_SIZE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 82
    .line 83
    invoke-virtual {v2, v3}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    check-cast v2, Landroid/graphics/Rect;

    .line 88
    .line 89
    iput-object v2, v1, Lcom/ss/android/ttvecamera/TEFocusParameters;->mActiveSize:Landroid/graphics/Rect;

    .line 90
    .line 91
    iget-object v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->m:Landroid/hardware/camera2/CaptureRequest;

    .line 92
    .line 93
    sget-object v3, Landroid/hardware/camera2/CaptureRequest;->SCALER_CROP_REGION:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 94
    .line 95
    invoke-virtual {v2, v3}, Landroid/hardware/camera2/CaptureRequest;->get(Landroid/hardware/camera2/CaptureRequest$Key;)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    check-cast v2, Landroid/graphics/Rect;

    .line 100
    .line 101
    iput-object v2, v1, Lcom/ss/android/ttvecamera/TEFocusParameters;->mCropSize:Landroid/graphics/Rect;

    .line 102
    .line 103
    iget-object v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 104
    .line 105
    sget-object v3, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_MAX_REGIONS_AE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 106
    .line 107
    invoke-virtual {v2, v3}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    check-cast v2, Ljava/lang/Integer;

    .line 112
    .line 113
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 114
    .line 115
    .line 116
    move-result v2

    .line 117
    iput v2, v1, Lcom/ss/android/ttvecamera/TEFocusParameters;->mMaxRegionsAE:I

    .line 118
    .line 119
    iget-object v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 120
    .line 121
    sget-object v3, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_MAX_REGIONS_AF:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 122
    .line 123
    invoke-virtual {v2, v3}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object v2

    .line 127
    check-cast v2, Ljava/lang/Integer;

    .line 128
    .line 129
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 130
    .line 131
    .line 132
    move-result v2

    .line 133
    iput v2, v1, Lcom/ss/android/ttvecamera/TEFocusParameters;->mMaxRegionsAF:I

    .line 134
    .line 135
    const-string v2, "camera_focus_parameters"

    .line 136
    .line 137
    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 138
    .line 139
    .line 140
    :cond_1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 141
    .line 142
    iget p0, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->e:I

    .line 143
    .line 144
    const-string v1, "camera_sensor_orientation"

    .line 145
    .line 146
    invoke-virtual {v0, v1, p0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 147
    .line 148
    .line 149
    invoke-static {}, Ll/dsh0;->b()V

    .line 150
    .line 151
    .line 152
    return-void
.end method

.method public y0(I)V
    .locals 2

    .line 1
    const-string v0, "TECameraModeBase"

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne p1, v1, :cond_0

    .line 5
    .line 6
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 7
    .line 8
    iget p1, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 9
    .line 10
    if-ne p1, v1, :cond_2

    .line 11
    .line 12
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 13
    .line 14
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->l0(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 15
    .line 16
    .line 17
    const-string p0, "use faceae for front"

    .line 18
    .line 19
    invoke-static {v0, p0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    const/4 v1, 0x2

    .line 24
    if-ne p1, v1, :cond_1

    .line 25
    .line 26
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 27
    .line 28
    iget p1, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 29
    .line 30
    if-nez p1, :cond_2

    .line 31
    .line 32
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 33
    .line 34
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->l0(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 35
    .line 36
    .line 37
    const-string p0, "use faceae for rear"

    .line 38
    .line 39
    invoke-static {v0, p0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_1
    const/4 v1, 0x3

    .line 44
    if-ne p1, v1, :cond_2

    .line 45
    .line 46
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 47
    .line 48
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->l0(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 49
    .line 50
    .line 51
    const-string p0, "use faceae for all"

    .line 52
    .line 53
    invoke-static {v0, p0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    :cond_2
    return-void
.end method

.method public z(Lcom/ss/android/ttvecamera/TEFocusSettings;)I
    .locals 17

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v0, p1

    .line 4
    .line 5
    iget-object v2, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 6
    .line 7
    iget-boolean v2, v2, Lcom/ss/android/ttvecamera/TECameraSettings;->m:Z

    .line 8
    .line 9
    if-eqz v2, :cond_0

    .line 10
    .line 11
    invoke-direct/range {p0 .. p1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->v(Lcom/ss/android/ttvecamera/TEFocusSettings;)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    return v0

    .line 16
    :cond_0
    iput-object v0, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->A:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 17
    .line 18
    iget-object v2, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->i:Ll/orh0;

    .line 19
    .line 20
    invoke-virtual {v2, v0}, Ll/orh0;->h(Lcom/ss/android/ttvecamera/TEFocusSettings;)V

    .line 21
    .line 22
    .line 23
    iget-object v2, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->i:Ll/orh0;

    .line 24
    .line 25
    iget-object v3, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 26
    .line 27
    invoke-virtual {v2, v3}, Ll/orh0;->g(Lcom/ss/android/ttvecamera/TECameraSettings;)V

    .line 28
    .line 29
    .line 30
    iget-object v2, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->b:Ll/crh0;

    .line 31
    .line 32
    const/16 v9, -0x64

    .line 33
    .line 34
    const-string v10, "TECameraModeBase"

    .line 35
    .line 36
    if-eqz v2, :cond_12

    .line 37
    .line 38
    iget-object v2, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->d:Landroid/hardware/camera2/CameraCaptureSession;

    .line 39
    .line 40
    if-eqz v2, :cond_12

    .line 41
    .line 42
    iget-object v2, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 43
    .line 44
    if-nez v2, :cond_1

    .line 45
    .line 46
    goto/16 :goto_6

    .line 47
    .line 48
    :cond_1
    iget-object v2, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->b:Ll/crh0;

    .line 49
    .line 50
    iget-object v3, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 51
    .line 52
    invoke-virtual {v2, v3}, Ll/crh0;->p(Landroid/hardware/camera2/CameraCharacteristics;)Z

    .line 53
    .line 54
    .line 55
    move-result v11

    .line 56
    iget-object v2, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->b:Ll/crh0;

    .line 57
    .line 58
    iget-object v3, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a:Landroid/hardware/camera2/CameraCharacteristics;

    .line 59
    .line 60
    invoke-virtual {v2, v3}, Ll/crh0;->m(Landroid/hardware/camera2/CameraCharacteristics;)Z

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    const/16 v12, -0x19c

    .line 65
    .line 66
    if-nez v2, :cond_2

    .line 67
    .line 68
    if-nez v11, :cond_2

    .line 69
    .line 70
    const-string v0, "do not support MeteringAreaAF!"

    .line 71
    .line 72
    invoke-static {v10, v0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    iget-object v2, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->A:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 76
    .line 77
    invoke-virtual {v2}, Lcom/ss/android/ttvecamera/TEFocusSettings;->g()Lcom/ss/android/ttvecamera/TEFocusSettings$b;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    iget-object v1, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 82
    .line 83
    iget v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 84
    .line 85
    invoke-interface {v2, v12, v1, v0}, Lcom/ss/android/ttvecamera/TEFocusSettings$b;->a(IILjava/lang/String;)V

    .line 86
    .line 87
    .line 88
    return v12

    .line 89
    :cond_2
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/TEFocusSettings;->n()Z

    .line 90
    .line 91
    .line 92
    move-result v13

    .line 93
    iget-object v0, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->n:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 94
    .line 95
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    const/4 v14, 0x1

    .line 100
    const/4 v15, 0x0

    .line 101
    if-eqz v2, :cond_4

    .line 102
    .line 103
    iget-object v2, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->A:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 104
    .line 105
    invoke-virtual {v2}, Lcom/ss/android/ttvecamera/TEFocusSettings;->o()Z

    .line 106
    .line 107
    .line 108
    move-result v2

    .line 109
    if-nez v2, :cond_3

    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_3
    move/from16 v16, v15

    .line 113
    .line 114
    goto :goto_1

    .line 115
    :cond_4
    :goto_0
    move/from16 v16, v14

    .line 116
    .line 117
    :goto_1
    const-string v2, "focusAtPoint++"

    .line 118
    .line 119
    invoke-static {v10, v2}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    if-eqz v0, :cond_5

    .line 123
    .line 124
    if-nez v16, :cond_5

    .line 125
    .line 126
    iget-object v0, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->T:Ljava/lang/Runnable;

    .line 127
    .line 128
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 129
    .line 130
    .line 131
    const-wide/16 v2, 0x32

    .line 132
    .line 133
    :try_start_0
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 134
    .line 135
    .line 136
    goto :goto_2

    .line 137
    :catch_0
    move-exception v0

    .line 138
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 139
    .line 140
    .line 141
    :goto_2
    const-string v0, "cancel previous touch af.."

    .line 142
    .line 143
    invoke-static {v10, v0}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    :cond_5
    iget-object v0, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->A:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 147
    .line 148
    iget-object v2, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 149
    .line 150
    iget v3, v2, Lcom/ss/android/ttvecamera/TECameraSettings;->e:I

    .line 151
    .line 152
    iget v2, v2, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 153
    .line 154
    if-ne v2, v14, :cond_6

    .line 155
    .line 156
    move v2, v14

    .line 157
    goto :goto_3

    .line 158
    :cond_6
    move v2, v15

    .line 159
    :goto_3
    invoke-virtual {v0, v3, v2}, Lcom/ss/android/ttvecamera/TEFocusSettings;->a(IZ)Landroid/graphics/Rect;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    if-nez v0, :cond_7

    .line 164
    .line 165
    iget-object v0, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->A:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 166
    .line 167
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/TEFocusSettings;->j()I

    .line 168
    .line 169
    .line 170
    move-result v2

    .line 171
    iget-object v0, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->A:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 172
    .line 173
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/TEFocusSettings;->i()I

    .line 174
    .line 175
    .line 176
    move-result v3

    .line 177
    iget-object v0, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->A:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 178
    .line 179
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/TEFocusSettings;->k()I

    .line 180
    .line 181
    .line 182
    move-result v0

    .line 183
    int-to-float v4, v0

    .line 184
    iget-object v0, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->A:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 185
    .line 186
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/TEFocusSettings;->l()I

    .line 187
    .line 188
    .line 189
    move-result v0

    .line 190
    int-to-float v5, v0

    .line 191
    iget-object v0, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 192
    .line 193
    iget v6, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->e:I

    .line 194
    .line 195
    iget-object v0, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->A:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 196
    .line 197
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/TEFocusSettings;->e()Lcom/ss/android/ttvecamera/TEFocusSettings$CoordinatesMode;

    .line 198
    .line 199
    .line 200
    move-result-object v8

    .line 201
    const/4 v7, 0x0

    .line 202
    invoke-virtual/range {v1 .. v8}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->e(IIFFIILcom/ss/android/ttvecamera/TEFocusSettings$CoordinatesMode;)Landroid/graphics/Rect;

    .line 203
    .line 204
    .line 205
    move-result-object v0

    .line 206
    :cond_7
    iget-object v2, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->A:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 207
    .line 208
    iget-object v3, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 209
    .line 210
    iget v4, v3, Lcom/ss/android/ttvecamera/TECameraSettings;->e:I

    .line 211
    .line 212
    iget v3, v3, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 213
    .line 214
    if-ne v3, v14, :cond_8

    .line 215
    .line 216
    move v3, v14

    .line 217
    goto :goto_4

    .line 218
    :cond_8
    move v3, v15

    .line 219
    :goto_4
    invoke-virtual {v2, v4, v3}, Lcom/ss/android/ttvecamera/TEFocusSettings;->b(IZ)Landroid/graphics/Rect;

    .line 220
    .line 221
    .line 222
    move-result-object v2

    .line 223
    if-nez v2, :cond_9

    .line 224
    .line 225
    iget-object v2, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->A:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 226
    .line 227
    invoke-virtual {v2}, Lcom/ss/android/ttvecamera/TEFocusSettings;->j()I

    .line 228
    .line 229
    .line 230
    move-result v2

    .line 231
    iget-object v3, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->A:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 232
    .line 233
    invoke-virtual {v3}, Lcom/ss/android/ttvecamera/TEFocusSettings;->i()I

    .line 234
    .line 235
    .line 236
    move-result v3

    .line 237
    iget-object v4, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->A:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 238
    .line 239
    invoke-virtual {v4}, Lcom/ss/android/ttvecamera/TEFocusSettings;->k()I

    .line 240
    .line 241
    .line 242
    move-result v4

    .line 243
    int-to-float v4, v4

    .line 244
    iget-object v5, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->A:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 245
    .line 246
    invoke-virtual {v5}, Lcom/ss/android/ttvecamera/TEFocusSettings;->l()I

    .line 247
    .line 248
    .line 249
    move-result v5

    .line 250
    int-to-float v5, v5

    .line 251
    iget-object v6, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 252
    .line 253
    iget v6, v6, Lcom/ss/android/ttvecamera/TECameraSettings;->e:I

    .line 254
    .line 255
    iget-object v7, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->A:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 256
    .line 257
    invoke-virtual {v7}, Lcom/ss/android/ttvecamera/TEFocusSettings;->e()Lcom/ss/android/ttvecamera/TEFocusSettings$CoordinatesMode;

    .line 258
    .line 259
    .line 260
    move-result-object v8

    .line 261
    const/4 v7, 0x1

    .line 262
    invoke-virtual/range {v1 .. v8}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->e(IIFFIILcom/ss/android/ttvecamera/TEFocusSettings$CoordinatesMode;)Landroid/graphics/Rect;

    .line 263
    .line 264
    .line 265
    move-result-object v2

    .line 266
    :cond_9
    invoke-static {v0}, Lcom/ss/android/ttvecamera/f;->v(Landroid/graphics/Rect;)Z

    .line 267
    .line 268
    .line 269
    move-result v3

    .line 270
    if-eqz v3, :cond_11

    .line 271
    .line 272
    invoke-static {v2}, Lcom/ss/android/ttvecamera/f;->v(Landroid/graphics/Rect;)Z

    .line 273
    .line 274
    .line 275
    move-result v3

    .line 276
    if-nez v3, :cond_a

    .line 277
    .line 278
    goto/16 :goto_5

    .line 279
    .line 280
    :cond_a
    iget-object v3, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->A:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 281
    .line 282
    invoke-virtual {v3}, Lcom/ss/android/ttvecamera/TEFocusSettings;->p()Z

    .line 283
    .line 284
    .line 285
    move-result v3

    .line 286
    if-eqz v3, :cond_b

    .line 287
    .line 288
    if-eqz v11, :cond_b

    .line 289
    .line 290
    iget-object v3, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->i:Ll/orh0;

    .line 291
    .line 292
    iget-object v4, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 293
    .line 294
    invoke-virtual {v3, v4, v2}, Ll/orh0;->f(Landroid/hardware/camera2/CaptureRequest$Builder;Landroid/graphics/Rect;)V

    .line 295
    .line 296
    .line 297
    :cond_b
    if-eqz v16, :cond_d

    .line 298
    .line 299
    if-eqz v11, :cond_c

    .line 300
    .line 301
    iget-object v0, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->A:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 302
    .line 303
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/TEFocusSettings;->p()Z

    .line 304
    .line 305
    .line 306
    move-result v0

    .line 307
    if-eqz v0, :cond_c

    .line 308
    .line 309
    iget-object v0, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 310
    .line 311
    iget-object v2, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->i:Ll/orh0;

    .line 312
    .line 313
    xor-int/lit8 v3, v16, 0x1

    .line 314
    .line 315
    invoke-interface {v2, v0, v3}, Ll/p6m;->c(Landroid/hardware/camera2/CaptureRequest$Builder;Z)Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    .line 316
    .line 317
    .line 318
    move-result-object v2

    .line 319
    iget-object v3, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->k:Landroid/os/Handler;

    .line 320
    .line 321
    invoke-virtual {v1, v0, v2, v3}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->x0(Landroid/hardware/camera2/CaptureRequest$Builder;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 322
    .line 323
    .line 324
    iget-object v0, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->n:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 325
    .line 326
    invoke-virtual {v0, v15}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 327
    .line 328
    .line 329
    iget-object v0, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 330
    .line 331
    iget-boolean v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->n:Z

    .line 332
    .line 333
    if-eqz v0, :cond_c

    .line 334
    .line 335
    iget-object v0, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->g:Lcom/ss/android/ttvecamera/b;

    .line 336
    .line 337
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/b;->T0()Ll/lwk;

    .line 338
    .line 339
    .line 340
    move-result-object v0

    .line 341
    iget-object v2, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->U:Ll/lwk$b;

    .line 342
    .line 343
    iget-object v1, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->k:Landroid/os/Handler;

    .line 344
    .line 345
    invoke-virtual {v0, v2, v1}, Ll/lwk;->h(Ll/lwk$b;Landroid/os/Handler;)V

    .line 346
    .line 347
    .line 348
    :cond_c
    return v12

    .line 349
    :cond_d
    iget-object v2, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->n:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 350
    .line 351
    invoke-virtual {v2, v14}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 352
    .line 353
    .line 354
    iget-object v2, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->i:Ll/orh0;

    .line 355
    .line 356
    iget-object v3, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 357
    .line 358
    invoke-virtual {v2, v3, v0}, Ll/orh0;->e(Landroid/hardware/camera2/CaptureRequest$Builder;Landroid/graphics/Rect;)V

    .line 359
    .line 360
    .line 361
    iget-object v0, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 362
    .line 363
    iget-boolean v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->n:Z

    .line 364
    .line 365
    if-eqz v0, :cond_e

    .line 366
    .line 367
    iget-object v0, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 368
    .line 369
    iget-object v2, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->i:Ll/orh0;

    .line 370
    .line 371
    iget-object v3, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->n:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 372
    .line 373
    invoke-interface {v2, v0, v3, v13}, Ll/p6m;->b(Landroid/hardware/camera2/CaptureRequest$Builder;Ljava/util/concurrent/atomic/AtomicBoolean;Z)Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    .line 374
    .line 375
    .line 376
    move-result-object v2

    .line 377
    iget-object v3, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->k:Landroid/os/Handler;

    .line 378
    .line 379
    invoke-virtual {v1, v0, v2, v3}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->l(Landroid/hardware/camera2/CaptureRequest$Builder;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 380
    .line 381
    .line 382
    move-result-object v0

    .line 383
    new-instance v2, Ljava/lang/StringBuilder;

    .line 384
    .line 385
    const-string v3, "focusAtPoint, capture to trigger focus, response = "

    .line 386
    .line 387
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 388
    .line 389
    .line 390
    iget-boolean v0, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->a:Z

    .line 391
    .line 392
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 393
    .line 394
    .line 395
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 396
    .line 397
    .line 398
    move-result-object v0

    .line 399
    invoke-static {v10, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 400
    .line 401
    .line 402
    iget-object v0, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 403
    .line 404
    sget-object v2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 405
    .line 406
    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 407
    .line 408
    .line 409
    move-result-object v3

    .line 410
    invoke-virtual {v0, v2, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 411
    .line 412
    .line 413
    :cond_e
    iget-object v0, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 414
    .line 415
    iget-object v2, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->i:Ll/orh0;

    .line 416
    .line 417
    iget-object v3, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->n:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 418
    .line 419
    invoke-interface {v2, v0, v3, v13}, Ll/p6m;->b(Landroid/hardware/camera2/CaptureRequest$Builder;Ljava/util/concurrent/atomic/AtomicBoolean;Z)Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    .line 420
    .line 421
    .line 422
    move-result-object v2

    .line 423
    iget-object v3, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->k:Landroid/os/Handler;

    .line 424
    .line 425
    invoke-virtual {v1, v0, v2, v3}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->x0(Landroid/hardware/camera2/CaptureRequest$Builder;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 426
    .line 427
    .line 428
    move-result-object v0

    .line 429
    iget-boolean v2, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->a:Z

    .line 430
    .line 431
    if-nez v2, :cond_f

    .line 432
    .line 433
    iget-object v2, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->n:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 434
    .line 435
    invoke-virtual {v2, v15}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 436
    .line 437
    .line 438
    iget-object v2, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->A:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 439
    .line 440
    invoke-virtual {v2}, Lcom/ss/android/ttvecamera/TEFocusSettings;->g()Lcom/ss/android/ttvecamera/TEFocusSettings$b;

    .line 441
    .line 442
    .line 443
    move-result-object v2

    .line 444
    iget-object v3, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 445
    .line 446
    iget v3, v3, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 447
    .line 448
    iget-object v4, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->b:Ljava/lang/String;

    .line 449
    .line 450
    const/16 v5, -0x6c

    .line 451
    .line 452
    invoke-interface {v2, v5, v3, v4}, Lcom/ss/android/ttvecamera/TEFocusSettings$b;->a(IILjava/lang/String;)V

    .line 453
    .line 454
    .line 455
    iget-object v2, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 456
    .line 457
    iget-object v0, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->b:Ljava/lang/String;

    .line 458
    .line 459
    iget-object v1, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 460
    .line 461
    const/16 v3, -0x19b

    .line 462
    .line 463
    invoke-interface {v2, v3, v3, v0, v1}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 464
    .line 465
    .line 466
    return v5

    .line 467
    :cond_f
    iget-object v0, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 468
    .line 469
    iget-boolean v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->n:Z

    .line 470
    .line 471
    if-eqz v0, :cond_10

    .line 472
    .line 473
    if-nez v13, :cond_10

    .line 474
    .line 475
    iget-object v0, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->g:Lcom/ss/android/ttvecamera/b;

    .line 476
    .line 477
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/b;->T0()Ll/lwk;

    .line 478
    .line 479
    .line 480
    move-result-object v0

    .line 481
    iget-object v2, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->U:Ll/lwk$b;

    .line 482
    .line 483
    iget-object v1, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->k:Landroid/os/Handler;

    .line 484
    .line 485
    invoke-virtual {v0, v2, v1}, Ll/lwk;->h(Ll/lwk$b;Landroid/os/Handler;)V

    .line 486
    .line 487
    .line 488
    :cond_10
    const-string v0, "focusAtPoint, done"

    .line 489
    .line 490
    invoke-static {v10, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 491
    .line 492
    .line 493
    return v15

    .line 494
    :cond_11
    :goto_5
    const-string v0, "focusRect or meteringRect is not valid!"

    .line 495
    .line 496
    invoke-static {v10, v0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 497
    .line 498
    .line 499
    iget-object v2, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->A:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 500
    .line 501
    invoke-virtual {v2}, Lcom/ss/android/ttvecamera/TEFocusSettings;->g()Lcom/ss/android/ttvecamera/TEFocusSettings$b;

    .line 502
    .line 503
    .line 504
    move-result-object v2

    .line 505
    iget-object v1, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 506
    .line 507
    iget v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 508
    .line 509
    invoke-interface {v2, v9, v1, v0}, Lcom/ss/android/ttvecamera/TEFocusSettings$b;->a(IILjava/lang/String;)V

    .line 510
    .line 511
    .line 512
    return v9

    .line 513
    :cond_12
    :goto_6
    const-string v0, "Env is null"

    .line 514
    .line 515
    invoke-static {v10, v0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 516
    .line 517
    .line 518
    iget-object v2, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->A:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 519
    .line 520
    invoke-virtual {v2}, Lcom/ss/android/ttvecamera/TEFocusSettings;->g()Lcom/ss/android/ttvecamera/TEFocusSettings$b;

    .line 521
    .line 522
    .line 523
    move-result-object v2

    .line 524
    iget-object v1, v1, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 525
    .line 526
    iget v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 527
    .line 528
    invoke-interface {v2, v9, v1, v0}, Lcom/ss/android/ttvecamera/TEFocusSettings$b;->a(IILjava/lang/String;)V

    .line 529
    .line 530
    .line 531
    return v9
.end method

.method public z0()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->g:Lcom/ss/android/ttvecamera/b;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/b;->b1()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v0, "waitCameraTaskDoneOrTimeout failed, "

    .line 12
    .line 13
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Lcom/ss/android/ttvecamera/g;->d()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string v0, "TECameraModeBase"

    .line 28
    .line 29
    invoke-static {v0, p0}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method
