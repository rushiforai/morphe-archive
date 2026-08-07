.class public Ll/diw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ypl;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/diw$h;
    }
.end annotation


# instance fields
.field A:Landroid/media/ImageReader$OnImageAvailableListener;

.field private B:Ljava/lang/Boolean;

.field private C:Landroid/hardware/camera2/CaptureRequest;

.field private D:Ll/ypl$e;

.field private E:Ljava/util/concurrent/Semaphore;

.field private F:Z

.field private G:Landroid/hardware/camera2/CameraCaptureSession$StateCallback;

.field private H:Ll/qow;

.field private I:Z

.field private J:Z

.field private K:Ljava/lang/Integer;

.field private L:Ljava/lang/Runnable;

.field private M:J

.field private N:Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

.field private O:Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

.field private a:Ll/sow;

.field private b:Ll/ypl$a;

.field private c:Landroid/os/Handler;

.field private d:Landroid/os/Handler;

.field private e:I

.field private f:Landroid/media/ImageReader;

.field private g:Landroid/hardware/camera2/CameraDevice;

.field private h:Landroid/hardware/camera2/CameraManager;

.field private i:Landroid/hardware/camera2/CameraCaptureSession;

.field public final j:I

.field public final k:I

.field private l:Landroid/hardware/camera2/CaptureRequest$Builder;

.field private m:I

.field public final n:I

.field public final o:I

.field p:I

.field private q:I

.field private r:Ll/crf0;

.field private s:Landroid/graphics/Rect;

.field private t:I

.field private u:Landroid/os/HandlerThread;

.field v:Ll/diw$h;

.field private w:Landroid/content/Context;

.field private x:I

.field y:Landroid/hardware/camera2/CameraDevice$StateCallback;

.field z:[B


# direct methods
.method public constructor <init>(Ll/sow;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Ll/diw;->e:I

    .line 6
    .line 7
    iput v0, p0, Ll/diw;->j:I

    .line 8
    .line 9
    const/4 v1, 0x2

    .line 10
    iput v1, p0, Ll/diw;->k:I

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    iput v1, p0, Ll/diw;->m:I

    .line 14
    .line 15
    iput v1, p0, Ll/diw;->n:I

    .line 16
    .line 17
    iput v0, p0, Ll/diw;->o:I

    .line 18
    .line 19
    iput v1, p0, Ll/diw;->p:I

    .line 20
    .line 21
    iput v1, p0, Ll/diw;->q:I

    .line 22
    .line 23
    new-instance v2, Landroid/graphics/Rect;

    .line 24
    .line 25
    invoke-direct {v2, v1, v1, v0, v0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 26
    .line 27
    .line 28
    iput-object v2, p0, Ll/diw;->s:Landroid/graphics/Rect;

    .line 29
    .line 30
    iput v1, p0, Ll/diw;->t:I

    .line 31
    .line 32
    const/4 v2, 0x0

    .line 33
    iput-object v2, p0, Ll/diw;->u:Landroid/os/HandlerThread;

    .line 34
    .line 35
    iput-object v2, p0, Ll/diw;->v:Ll/diw$h;

    .line 36
    .line 37
    iput-object v2, p0, Ll/diw;->w:Landroid/content/Context;

    .line 38
    .line 39
    iput v1, p0, Ll/diw;->x:I

    .line 40
    .line 41
    new-instance v3, Ll/diw$b;

    .line 42
    .line 43
    invoke-direct {v3, p0}, Ll/diw$b;-><init>(Ll/diw;)V

    .line 44
    .line 45
    .line 46
    iput-object v3, p0, Ll/diw;->y:Landroid/hardware/camera2/CameraDevice$StateCallback;

    .line 47
    .line 48
    iput-object v2, p0, Ll/diw;->z:[B

    .line 49
    .line 50
    new-instance v3, Ll/diw$c;

    .line 51
    .line 52
    invoke-direct {v3, p0}, Ll/diw$c;-><init>(Ll/diw;)V

    .line 53
    .line 54
    .line 55
    iput-object v3, p0, Ll/diw;->A:Landroid/media/ImageReader$OnImageAvailableListener;

    .line 56
    .line 57
    iput-object v2, p0, Ll/diw;->D:Ll/ypl$e;

    .line 58
    .line 59
    new-instance v3, Ljava/util/concurrent/Semaphore;

    .line 60
    .line 61
    invoke-direct {v3, v0}, Ljava/util/concurrent/Semaphore;-><init>(I)V

    .line 62
    .line 63
    .line 64
    iput-object v3, p0, Ll/diw;->E:Ljava/util/concurrent/Semaphore;

    .line 65
    .line 66
    iput-boolean v1, p0, Ll/diw;->F:Z

    .line 67
    .line 68
    new-instance v3, Ll/diw$d;

    .line 69
    .line 70
    invoke-direct {v3, p0}, Ll/diw$d;-><init>(Ll/diw;)V

    .line 71
    .line 72
    .line 73
    iput-object v3, p0, Ll/diw;->G:Landroid/hardware/camera2/CameraCaptureSession$StateCallback;

    .line 74
    .line 75
    iput-boolean v1, p0, Ll/diw;->I:Z

    .line 76
    .line 77
    iput-boolean v0, p0, Ll/diw;->J:Z

    .line 78
    .line 79
    iput-object v2, p0, Ll/diw;->K:Ljava/lang/Integer;

    .line 80
    .line 81
    new-instance v0, Ll/diw$e;

    .line 82
    .line 83
    invoke-direct {v0, p0}, Ll/diw$e;-><init>(Ll/diw;)V

    .line 84
    .line 85
    .line 86
    iput-object v0, p0, Ll/diw;->L:Ljava/lang/Runnable;

    .line 87
    .line 88
    const-wide/16 v0, 0x0

    .line 89
    .line 90
    iput-wide v0, p0, Ll/diw;->M:J

    .line 91
    .line 92
    new-instance v0, Ll/diw$f;

    .line 93
    .line 94
    invoke-direct {v0, p0}, Ll/diw$f;-><init>(Ll/diw;)V

    .line 95
    .line 96
    .line 97
    iput-object v0, p0, Ll/diw;->N:Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    .line 98
    .line 99
    new-instance v0, Ll/diw$g;

    .line 100
    .line 101
    invoke-direct {v0, p0}, Ll/diw$g;-><init>(Ll/diw;)V

    .line 102
    .line 103
    .line 104
    iput-object v0, p0, Ll/diw;->O:Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    .line 105
    .line 106
    iput-object p1, p0, Ll/diw;->a:Ll/sow;

    .line 107
    .line 108
    invoke-static {}, Ll/j94;->b()I

    .line 109
    .line 110
    .line 111
    move-result p1

    .line 112
    iput p1, p0, Ll/diw;->m:I

    .line 113
    .line 114
    return-void
.end method

.method public static synthetic B(Ll/diw;Landroid/hardware/camera2/CameraDevice;)Landroid/hardware/camera2/CameraDevice;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/diw;->g:Landroid/hardware/camera2/CameraDevice;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic D(Ll/diw;Landroid/hardware/camera2/CameraCaptureSession;)Landroid/hardware/camera2/CameraCaptureSession;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/diw;->i:Landroid/hardware/camera2/CameraCaptureSession;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic G(Ll/diw;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/diw;->r0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic H(Ll/diw;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/diw;->s0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic I(Ll/diw;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/diw;->x:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic J(Ll/diw;I)I
    .locals 0

    .line 1
    iput p1, p0, Ll/diw;->x:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic K(Ll/diw;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/diw;->M:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic L(Ll/diw;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/diw;->M:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic M(Ll/diw;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/diw;->K:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic N(Ll/diw;Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/diw;->K:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic O(Ll/diw;)Landroid/hardware/camera2/CaptureRequest$Builder;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/diw;->l:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic P(Ll/diw;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/diw;->b0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Q(Ll/diw;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/diw;->a0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic R(Ll/diw;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/diw;->n0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic S(Ll/diw;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/diw;->J:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic T(Ll/diw;)Z
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/diw;->c0()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic U(Ll/diw;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/diw;->d0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic V(Ll/diw;ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/diw;->l0(ILjava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic W(Ll/diw;)Ll/ypl$e;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/diw;->D:Ll/ypl$e;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic X(Ll/diw;)Ll/ypl$a;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/diw;->b:Ll/ypl$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic Y(Ll/diw;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/diw;->I:Z

    .line 2
    .line 3
    return p0
.end method

.method private a0()V
    .locals 9
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x15
    .end annotation

    .line 1
    const-string v0, "Camera"

    .line 2
    .line 3
    const-string v1, "Camera2 start preview failed !"

    .line 4
    .line 5
    const/4 v2, 0x3

    .line 6
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 7
    .line 8
    .line 9
    move-result-object v3

    .line 10
    const/16 v4, 0xfa2

    .line 11
    .line 12
    :try_start_0
    iget-object v5, p0, Ll/diw;->g:Landroid/hardware/camera2/CameraDevice;

    .line 13
    .line 14
    invoke-virtual {v5, v2}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 15
    .line 16
    .line 17
    move-result-object v5

    .line 18
    iput-object v5, p0, Ll/diw;->l:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 19
    .line 20
    iget-object v6, p0, Ll/diw;->f:Landroid/media/ImageReader;

    .line 21
    .line 22
    invoke-virtual {v6}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    .line 23
    .line 24
    .line 25
    move-result-object v6

    .line 26
    invoke-virtual {v5, v6}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 27
    .line 28
    .line 29
    iget-object v5, p0, Ll/diw;->g:Landroid/hardware/camera2/CameraDevice;

    .line 30
    .line 31
    iget-object v6, p0, Ll/diw;->f:Landroid/media/ImageReader;

    .line 32
    .line 33
    invoke-virtual {v6}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    .line 34
    .line 35
    .line 36
    move-result-object v6

    .line 37
    filled-new-array {v6}, [Landroid/view/Surface;

    .line 38
    .line 39
    .line 40
    move-result-object v6

    .line 41
    invoke-static {v6}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 42
    .line 43
    .line 44
    move-result-object v6

    .line 45
    iget-object v7, p0, Ll/diw;->G:Landroid/hardware/camera2/CameraCaptureSession$StateCallback;

    .line 46
    .line 47
    iget-object v8, p0, Ll/diw;->c:Landroid/os/Handler;

    .line 48
    .line 49
    invoke-virtual {v5, v6, v7, v8}, Landroid/hardware/camera2/CameraDevice;->createCaptureSession(Ljava/util/List;Landroid/hardware/camera2/CameraCaptureSession$StateCallback;Landroid/os/Handler;)V
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :catch_0
    move-exception v5

    .line 54
    goto :goto_0

    .line 55
    :catch_1
    move-exception v5

    .line 56
    goto :goto_1

    .line 57
    :goto_0
    new-instance v6, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    invoke-direct {v6, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v5}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v7

    .line 66
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v6

    .line 73
    invoke-static {v0, v6}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    sget-object v0, Ll/r94;->a:Ljava/util/Map;

    .line 77
    .line 78
    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    check-cast v0, Ljava/lang/String;

    .line 83
    .line 84
    invoke-direct {p0, v2, v0}, Ll/diw;->l0(ILjava/lang/String;)V

    .line 85
    .line 86
    .line 87
    iget-object p0, p0, Ll/diw;->D:Ll/ypl$e;

    .line 88
    .line 89
    if-eqz p0, :cond_0

    .line 90
    .line 91
    new-instance v0, Ljava/lang/StringBuilder;

    .line 92
    .line 93
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v5}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-interface {p0, v4, v0}, Ll/ypl$e;->onFail(ILjava/lang/String;)V

    .line 108
    .line 109
    .line 110
    goto :goto_2

    .line 111
    :goto_1
    new-instance v6, Ljava/lang/StringBuilder;

    .line 112
    .line 113
    invoke-direct {v6, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {v5}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v7

    .line 120
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v6

    .line 127
    invoke-static {v0, v6}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    sget-object v0, Ll/r94;->a:Ljava/util/Map;

    .line 131
    .line 132
    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    check-cast v0, Ljava/lang/String;

    .line 137
    .line 138
    invoke-direct {p0, v2, v0}, Ll/diw;->l0(ILjava/lang/String;)V

    .line 139
    .line 140
    .line 141
    iget-object p0, p0, Ll/diw;->D:Ll/ypl$e;

    .line 142
    .line 143
    if-eqz p0, :cond_0

    .line 144
    .line 145
    new-instance v0, Ljava/lang/StringBuilder;

    .line 146
    .line 147
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {v5}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v1

    .line 154
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    invoke-interface {p0, v4, v0}, Ll/ypl$e;->onFail(ILjava/lang/String;)V

    .line 162
    .line 163
    .line 164
    :cond_0
    :goto_2
    return-void
.end method

.method private b0()V
    .locals 4

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/diw;->g:Landroid/hardware/camera2/CameraDevice;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 v1, 0x2

    .line 7
    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Ll/diw;->f:Landroid/media/ImageReader;

    .line 12
    .line 13
    invoke-virtual {v1}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 18
    .line 19
    .line 20
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 21
    .line 22
    const/4 v2, 0x1

    .line 23
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    invoke-direct {p0, v0}, Ll/diw;->o0(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 31
    .line 32
    .line 33
    new-instance v1, Ll/diw$a;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/diw$a;-><init>(Ll/diw;)V

    .line 36
    .line 37
    .line 38
    iget-object v2, p0, Ll/diw;->i:Landroid/hardware/camera2/CameraCaptureSession;

    .line 39
    .line 40
    invoke-virtual {v2}, Landroid/hardware/camera2/CameraCaptureSession;->stopRepeating()V

    .line 41
    .line 42
    .line 43
    iget-object v2, p0, Ll/diw;->i:Landroid/hardware/camera2/CameraCaptureSession;

    .line 44
    .line 45
    invoke-virtual {v2}, Landroid/hardware/camera2/CameraCaptureSession;->abortCaptures()V

    .line 46
    .line 47
    .line 48
    iget-object v2, p0, Ll/diw;->i:Landroid/hardware/camera2/CameraCaptureSession;

    .line 49
    .line 50
    invoke-virtual {v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    const/4 v3, 0x0

    .line 55
    invoke-virtual {v2, v0, v1, v3}, Landroid/hardware/camera2/CameraCaptureSession;->capture(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :catch_0
    move-exception v0

    .line 60
    new-instance v1, Ljava/lang/StringBuilder;

    .line 61
    .line 62
    const-string v2, "Camera2 take photo error!"

    .line 63
    .line 64
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    const-string v3, "Camera"

    .line 79
    .line 80
    invoke-static {v3, v1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    iget-object p0, p0, Ll/diw;->D:Ll/ypl$e;

    .line 84
    .line 85
    if-eqz p0, :cond_1

    .line 86
    .line 87
    new-instance v1, Ljava/lang/StringBuilder;

    .line 88
    .line 89
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    const/16 v1, 0xfa9

    .line 104
    .line 105
    invoke-interface {p0, v1, v0}, Ll/ypl$e;->onFail(ILjava/lang/String;)V

    .line 106
    .line 107
    .line 108
    :cond_1
    :goto_0
    return-void
.end method

.method private c0()Z
    .locals 7
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x15
    .end annotation

    .line 1
    iget-object v0, p0, Ll/diw;->h:Landroid/hardware/camera2/CameraManager;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_2

    .line 5
    .line 6
    :try_start_0
    invoke-virtual {v0}, Landroid/hardware/camera2/CameraManager;->getCameraIdList()[Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    array-length v2, v0

    .line 11
    move v3, v1

    .line 12
    :goto_0
    if-ge v3, v2, :cond_2

    .line 13
    .line 14
    aget-object v4, v0, v3

    .line 15
    .line 16
    iget-object v5, p0, Ll/diw;->h:Landroid/hardware/camera2/CameraManager;

    .line 17
    .line 18
    invoke-virtual {v5, v4}, Landroid/hardware/camera2/CameraManager;->getCameraCharacteristics(Ljava/lang/String;)Landroid/hardware/camera2/CameraCharacteristics;

    .line 19
    .line 20
    .line 21
    move-result-object v4

    .line 22
    sget-object v5, Landroid/hardware/camera2/CameraCharacteristics;->SCALER_STREAM_CONFIGURATION_MAP:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 23
    .line 24
    invoke-virtual {v4, v5}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v5

    .line 28
    check-cast v5, Landroid/hardware/camera2/params/StreamConfigurationMap;

    .line 29
    .line 30
    iget v5, p0, Ll/diw;->e:I

    .line 31
    .line 32
    const/4 v6, 0x1

    .line 33
    if-ne v5, v6, :cond_0

    .line 34
    .line 35
    sget-object v5, Landroid/hardware/camera2/CameraCharacteristics;->LENS_FACING:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 36
    .line 37
    invoke-virtual {v4, v5}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v5

    .line 41
    check-cast v5, Ljava/lang/Integer;

    .line 42
    .line 43
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 44
    .line 45
    .line 46
    move-result v5

    .line 47
    if-nez v5, :cond_0

    .line 48
    .line 49
    return v6

    .line 50
    :catch_0
    move-exception v0

    .line 51
    goto :goto_1

    .line 52
    :cond_0
    iget v5, p0, Ll/diw;->e:I

    .line 53
    .line 54
    if-nez v5, :cond_1

    .line 55
    .line 56
    sget-object v5, Landroid/hardware/camera2/CameraCharacteristics;->LENS_FACING:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 57
    .line 58
    invoke-virtual {v4, v5}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v4

    .line 62
    check-cast v4, Ljava/lang/Integer;

    .line 63
    .line 64
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 65
    .line 66
    .line 67
    move-result v4
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 68
    if-ne v4, v6, :cond_1

    .line 69
    .line 70
    return v1

    .line 71
    :cond_1
    add-int/lit8 v3, v3, 0x1

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :goto_1
    new-instance v2, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    const-string v3, "Get Camera2 is front failed !"

    .line 77
    .line 78
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    const-string v2, "Camera"

    .line 93
    .line 94
    invoke-static {v2, v0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    sget-object v0, Ll/r94;->a:Ljava/util/Map;

    .line 98
    .line 99
    const/4 v2, 0x6

    .line 100
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 101
    .line 102
    .line 103
    move-result-object v4

    .line 104
    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    check-cast v0, Ljava/lang/String;

    .line 109
    .line 110
    invoke-direct {p0, v2, v0}, Ll/diw;->l0(ILjava/lang/String;)V

    .line 111
    .line 112
    .line 113
    iget-object p0, p0, Ll/diw;->D:Ll/ypl$e;

    .line 114
    .line 115
    if-eqz p0, :cond_2

    .line 116
    .line 117
    const/16 v0, 0xfa7

    .line 118
    .line 119
    invoke-interface {p0, v0, v3}, Ll/ypl$e;->onFail(ILjava/lang/String;)V

    .line 120
    .line 121
    .line 122
    :cond_2
    return v1
.end method

.method private d0()V
    .locals 0

    .line 1
    return-void
.end method

.method private f0()F
    .locals 2
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x15
    .end annotation

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/diw;->h:Landroid/hardware/camera2/CameraManager;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    iget p0, p0, Ll/diw;->e:I

    .line 9
    .line 10
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string p0, ""

    .line 14
    .line 15
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {v0, p0}, Landroid/hardware/camera2/CameraManager;->getCameraCharacteristics(Ljava/lang/String;)Landroid/hardware/camera2/CameraCharacteristics;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    sget-object v0, Landroid/hardware/camera2/CameraCharacteristics;->LENS_INFO_MINIMUM_FOCUS_DISTANCE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    check-cast p0, Ljava/lang/Float;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :catch_0
    move-exception p0

    .line 36
    new-instance v0, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    const-string v1, "isHardwareLevelSupported Error"

    .line 39
    .line 40
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    const-string v0, "Camera"

    .line 55
    .line 56
    invoke-static {v0, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    const/4 p0, 0x0

    .line 60
    :goto_0
    if-eqz p0, :cond_0

    .line 61
    .line 62
    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    return p0

    .line 67
    :cond_0
    const/4 p0, 0x0

    .line 68
    return p0
.end method

.method public static synthetic g(Ll/diw;)Ljava/util/concurrent/Semaphore;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/diw;->E:Ljava/util/concurrent/Semaphore;

    .line 2
    .line 3
    return-object p0
.end method

.method private g0()Z
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-direct {p0, v0}, Ll/diw;->h0(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-nez v0, :cond_1

    .line 7
    .line 8
    invoke-direct {p0}, Ll/diw;->f0()F

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    const/4 v0, 0x0

    .line 13
    cmpl-float p0, p0, v0

    .line 14
    .line 15
    if-lez p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0

    .line 20
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 21
    return p0
.end method

.method public static synthetic h(Ll/diw;)Landroid/hardware/camera2/CameraDevice;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/diw;->g:Landroid/hardware/camera2/CameraDevice;

    .line 2
    .line 3
    return-object p0
.end method

.method private h0(I)Z
    .locals 6
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .line 1
    const-string v0, "Camera"

    .line 2
    .line 3
    const-string v1, "Unknown INFO_SUPPORTED_HARDWARE_LEVEL: "

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    :try_start_0
    iget-object v3, p0, Ll/diw;->h:Landroid/hardware/camera2/CameraManager;

    .line 7
    .line 8
    new-instance v4, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 11
    .line 12
    .line 13
    iget p0, p0, Ll/diw;->e:I

    .line 14
    .line 15
    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string p0, ""

    .line 19
    .line 20
    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v3, p0}, Landroid/hardware/camera2/CameraManager;->getCameraCharacteristics(Ljava/lang/String;)Landroid/hardware/camera2/CameraCharacteristics;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    sget-object v3, Landroid/hardware/camera2/CameraCharacteristics;->INFO_SUPPORTED_HARDWARE_LEVEL:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 32
    .line 33
    invoke-virtual {p0, v3}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    check-cast p0, Ljava/lang/Integer;

    .line 38
    .line 39
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    const/4 v3, 0x2

    .line 44
    const/4 v4, 0x1

    .line 45
    if-eqz p0, :cond_3

    .line 46
    .line 47
    if-eq p0, v4, :cond_2

    .line 48
    .line 49
    if-eq p0, v3, :cond_1

    .line 50
    .line 51
    const/4 v5, 0x3

    .line 52
    if-eq p0, v5, :cond_0

    .line 53
    .line 54
    new-instance v5, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    invoke-direct {v5, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :catch_0
    move-exception p0

    .line 71
    goto :goto_1

    .line 72
    :cond_0
    const-string v1, "Camera support level: INFO_SUPPORTED_HARDWARE_LEVEL_3"

    .line 73
    .line 74
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_1
    const-string v1, "Camera support level: INFO_SUPPORTED_HARDWARE_LEVEL_LEGACY"

    .line 79
    .line 80
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_2
    const-string v1, "Camera support level: INFO_SUPPORTED_HARDWARE_LEVEL_FULL"

    .line 85
    .line 86
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_3
    const-string v1, "Camera support level: INFO_SUPPORTED_HARDWARE_LEVEL_LIMITED"

    .line 91
    .line 92
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 93
    .line 94
    .line 95
    :goto_0
    if-ne p0, v3, :cond_5

    .line 96
    .line 97
    if-ne p1, p0, :cond_4

    .line 98
    .line 99
    return v4

    .line 100
    :cond_4
    return v2

    .line 101
    :cond_5
    if-gt p1, p0, :cond_6

    .line 102
    .line 103
    return v4

    .line 104
    :cond_6
    return v2

    .line 105
    :goto_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 106
    .line 107
    const-string v1, "isHardwareLevelSupported Error"

    .line 108
    .line 109
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    invoke-static {v0, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    return v2
.end method

.method private i0(I)Z
    .locals 5
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x15
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    iget-object v1, p0, Ll/diw;->h:Landroid/hardware/camera2/CameraManager;

    .line 3
    .line 4
    if-eqz v1, :cond_1

    .line 5
    .line 6
    iget v2, p0, Ll/diw;->e:I

    .line 7
    .line 8
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {v1, v2}, Landroid/hardware/camera2/CameraManager;->getCameraCharacteristics(Ljava/lang/String;)Landroid/hardware/camera2/CameraCharacteristics;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    sget-object v2, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_AE_AVAILABLE_MODES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 17
    .line 18
    invoke-virtual {v1, v2}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, [I

    .line 23
    .line 24
    array-length v2, v1

    .line 25
    move v3, v0

    .line 26
    :goto_0
    if-ge v3, v2, :cond_1

    .line 27
    .line 28
    aget v4, v1, v3
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 29
    .line 30
    if-ne v4, p1, :cond_0

    .line 31
    .line 32
    const/4 p0, 0x1

    .line 33
    return p0

    .line 34
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :catch_0
    move-exception p1

    .line 38
    new-instance v1, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    const-string v2, "Get Camera2 is support flash AE mode error!"

    .line 41
    .line 42
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    const-string v3, "Camera"

    .line 57
    .line 58
    invoke-static {v3, v1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    sget-object v1, Ll/r94;->a:Ljava/util/Map;

    .line 62
    .line 63
    const/16 v3, 0xa

    .line 64
    .line 65
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    check-cast v1, Ljava/lang/String;

    .line 74
    .line 75
    invoke-direct {p0, v3, v1}, Ll/diw;->l0(ILjava/lang/String;)V

    .line 76
    .line 77
    .line 78
    iget-object p0, p0, Ll/diw;->D:Ll/ypl$e;

    .line 79
    .line 80
    if-eqz p0, :cond_1

    .line 81
    .line 82
    new-instance v1, Ljava/lang/StringBuilder;

    .line 83
    .line 84
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    const/16 v1, 0xfa7

    .line 99
    .line 100
    invoke-interface {p0, v1, p1}, Ll/ypl$e;->onFail(ILjava/lang/String;)V

    .line 101
    .line 102
    .line 103
    :cond_1
    return v0
.end method

.method private k0()V
    .locals 6

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/diw;->l:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 2
    .line 3
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 4
    .line 5
    const/4 v2, 0x4

    .line 6
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 7
    .line 8
    .line 9
    move-result-object v2

    .line 10
    invoke-virtual {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/diw;->l:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 14
    .line 15
    sget-object v2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 16
    .line 17
    const/4 v3, 0x1

    .line 18
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 19
    .line 20
    .line 21
    move-result-object v4

    .line 22
    invoke-virtual {v0, v2, v4}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    iput v3, p0, Ll/diw;->x:I

    .line 26
    .line 27
    iget-object v0, p0, Ll/diw;->i:Landroid/hardware/camera2/CameraCaptureSession;

    .line 28
    .line 29
    iget-object v3, p0, Ll/diw;->l:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 30
    .line 31
    invoke-virtual {v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    iget-object v4, p0, Ll/diw;->N:Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    .line 36
    .line 37
    iget-object v5, p0, Ll/diw;->c:Landroid/os/Handler;

    .line 38
    .line 39
    invoke-virtual {v0, v3, v4, v5}, Landroid/hardware/camera2/CameraCaptureSession;->capture(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Ll/diw;->l:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 43
    .line 44
    const/4 v3, 0x0

    .line 45
    invoke-virtual {v0, v2, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Ll/diw;->l:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 49
    .line 50
    invoke-virtual {p0, v1, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :catch_0
    move-exception p0

    .line 55
    new-instance v0, Ljava/lang/StringBuilder;

    .line 56
    .line 57
    const-string v1, "Camera2 lockFocus failed !!!"

    .line 58
    .line 59
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    const-string v0, "Camera"

    .line 74
    .line 75
    invoke-static {v0, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method private l0(ILjava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/diw;->v:Ll/diw$h;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Ll/diw$h;->a(ILjava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method private m0()V
    .locals 1
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x15
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/diw;->a()I

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p0, v0}, Ll/diw;->j(Landroid/graphics/SurfaceTexture;)Z

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private n0()V
    .locals 3

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/diw;->l:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 2
    .line 3
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_PRECAPTURE_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 7
    .line 8
    .line 9
    move-result-object v2

    .line 10
    invoke-virtual {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    iput v0, p0, Ll/diw;->x:I

    .line 15
    .line 16
    iget-object v0, p0, Ll/diw;->i:Landroid/hardware/camera2/CameraCaptureSession;

    .line 17
    .line 18
    iget-object v1, p0, Ll/diw;->l:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 19
    .line 20
    invoke-virtual {v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iget-object v2, p0, Ll/diw;->N:Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    .line 25
    .line 26
    iget-object p0, p0, Ll/diw;->c:Landroid/os/Handler;

    .line 27
    .line 28
    invoke-virtual {v0, v1, v2, p0}, Landroid/hardware/camera2/CameraCaptureSession;->capture(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :catch_0
    move-exception p0

    .line 33
    new-instance v0, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    const-string v1, "Camera2 runPrecaptureSequence failed !!!"

    .line 36
    .line 37
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    const-string v0, "Camera"

    .line 52
    .line 53
    invoke-static {v0, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method private o0(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/diw;->B:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private declared-synchronized r0()V
    .locals 6

    .line 1
    const-string v0, "Camera2 startNormalPreview failed !"

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/diw;->l:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    iget-object v2, p0, Ll/diw;->i:Landroid/hardware/camera2/CameraCaptureSession;

    .line 9
    .line 10
    if-eqz v2, :cond_0

    .line 11
    .line 12
    sget-object v2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 13
    .line 14
    const/4 v3, 0x3

    .line 15
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    invoke-virtual {v1, v2, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Ll/diw;->l:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 23
    .line 24
    sget-object v2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_TARGET_FPS_RANGE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 25
    .line 26
    new-instance v3, Landroid/util/Range;

    .line 27
    .line 28
    iget-object v4, p0, Ll/diw;->a:Ll/sow;

    .line 29
    .line 30
    iget v4, v4, Ll/sow;->H:I

    .line 31
    .line 32
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    iget-object v5, p0, Ll/diw;->a:Ll/sow;

    .line 37
    .line 38
    iget v5, v5, Ll/sow;->G:I

    .line 39
    .line 40
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 41
    .line 42
    .line 43
    move-result-object v5

    .line 44
    invoke-direct {v3, v4, v5}, Landroid/util/Range;-><init>(Ljava/lang/Comparable;Ljava/lang/Comparable;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v1, v2, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    iget-object v1, p0, Ll/diw;->l:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 51
    .line 52
    invoke-virtual {v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    iput-object v1, p0, Ll/diw;->C:Landroid/hardware/camera2/CaptureRequest;

    .line 57
    .line 58
    iget-object v2, p0, Ll/diw;->i:Landroid/hardware/camera2/CameraCaptureSession;

    .line 59
    .line 60
    iget-object v3, p0, Ll/diw;->N:Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    .line 61
    .line 62
    iget-object v4, p0, Ll/diw;->c:Landroid/os/Handler;

    .line 63
    .line 64
    invoke-virtual {v2, v1, v3, v4}, Landroid/hardware/camera2/CameraCaptureSession;->setRepeatingRequest(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I

    .line 65
    .line 66
    .line 67
    const/4 v1, 0x0

    .line 68
    iput-boolean v1, p0, Ll/diw;->I:Z
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :catchall_0
    move-exception v0

    .line 72
    goto :goto_1

    .line 73
    :catch_0
    move-exception v1

    .line 74
    :try_start_1
    const-string v2, "Camera"

    .line 75
    .line 76
    new-instance v3, Ljava/lang/StringBuilder;

    .line 77
    .line 78
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-static {v2, v0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 93
    .line 94
    .line 95
    :cond_0
    :goto_0
    monitor-exit p0

    .line 96
    return-void

    .line 97
    :goto_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 98
    throw v0
.end method

.method private s0()V
    .locals 4

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/diw;->l:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 2
    .line 3
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 7
    .line 8
    .line 9
    move-result-object v2

    .line 10
    invoke-virtual {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/diw;->l:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 14
    .line 15
    invoke-direct {p0, v0}, Ll/diw;->o0(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/diw;->i:Landroid/hardware/camera2/CameraCaptureSession;

    .line 19
    .line 20
    iget-object v1, p0, Ll/diw;->l:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 21
    .line 22
    invoke-virtual {v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iget-object v2, p0, Ll/diw;->N:Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    .line 27
    .line 28
    iget-object v3, p0, Ll/diw;->c:Landroid/os/Handler;

    .line 29
    .line 30
    invoke-virtual {v0, v1, v2, v3}, Landroid/hardware/camera2/CameraCaptureSession;->capture(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I

    .line 31
    .line 32
    .line 33
    const/4 v0, 0x0

    .line 34
    iput v0, p0, Ll/diw;->x:I

    .line 35
    .line 36
    iget-object v0, p0, Ll/diw;->i:Landroid/hardware/camera2/CameraCaptureSession;

    .line 37
    .line 38
    iget-object v1, p0, Ll/diw;->C:Landroid/hardware/camera2/CaptureRequest;

    .line 39
    .line 40
    iget-object v2, p0, Ll/diw;->N:Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    .line 41
    .line 42
    iget-object v3, p0, Ll/diw;->c:Landroid/os/Handler;

    .line 43
    .line 44
    invoke-virtual {v0, v1, v2, v3}, Landroid/hardware/camera2/CameraCaptureSession;->setRepeatingRequest(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :catch_0
    move-exception v0

    .line 49
    new-instance v1, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    const-string v2, "Cancel Camera2 lock auto focus mode error!"

    .line 52
    .line 53
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    const-string v3, "Camera"

    .line 68
    .line 69
    invoke-static {v3, v1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    iget-object p0, p0, Ll/diw;->D:Ll/ypl$e;

    .line 73
    .line 74
    if-eqz p0, :cond_0

    .line 75
    .line 76
    new-instance v1, Ljava/lang/StringBuilder;

    .line 77
    .line 78
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    const/16 v1, 0xfa5

    .line 93
    .line 94
    invoke-interface {p0, v1, v0}, Ll/ypl$e;->onFail(ILjava/lang/String;)V

    .line 95
    .line 96
    .line 97
    :cond_0
    return-void
.end method

.method public static synthetic z(Ll/diw;)Ll/gql;
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


# virtual methods
.method public declared-synchronized A(ILl/qow;)Z
    .locals 5
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x15
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    const/4 p1, 0x0

    .line 3
    :try_start_0
    const-string p2, "Camera"

    .line 4
    .line 5
    const-string v0, "Camera2 switchCamera !!!"

    .line 6
    .line 7
    invoke-static {p2, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object p2, p0, Ll/diw;->h:Landroid/hardware/camera2/CameraManager;

    .line 11
    .line 12
    invoke-virtual {p2}, Landroid/hardware/camera2/CameraManager;->getCameraIdList()[Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    array-length v0, p2

    .line 17
    move v1, p1

    .line 18
    :goto_0
    if-ge v1, v0, :cond_2

    .line 19
    .line 20
    aget-object v2, p2, v1

    .line 21
    .line 22
    iget-object v3, p0, Ll/diw;->h:Landroid/hardware/camera2/CameraManager;

    .line 23
    .line 24
    invoke-virtual {v3, v2}, Landroid/hardware/camera2/CameraManager;->getCameraCharacteristics(Ljava/lang/String;)Landroid/hardware/camera2/CameraCharacteristics;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    sget-object v3, Landroid/hardware/camera2/CameraCharacteristics;->SCALER_STREAM_CONFIGURATION_MAP:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 29
    .line 30
    invoke-virtual {v2, v3}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    check-cast v3, Landroid/hardware/camera2/params/StreamConfigurationMap;

    .line 35
    .line 36
    iget v3, p0, Ll/diw;->e:I

    .line 37
    .line 38
    const/4 v4, 0x1

    .line 39
    if-ne v3, v4, :cond_0

    .line 40
    .line 41
    sget-object v3, Landroid/hardware/camera2/CameraCharacteristics;->LENS_FACING:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 42
    .line 43
    invoke-virtual {v2, v3}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    check-cast v3, Ljava/lang/Integer;

    .line 48
    .line 49
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    if-nez v3, :cond_0

    .line 54
    .line 55
    iput-boolean v4, p0, Ll/diw;->I:Z

    .line 56
    .line 57
    iput p1, p0, Ll/diw;->e:I

    .line 58
    .line 59
    invoke-direct {p0}, Ll/diw;->m0()V

    .line 60
    .line 61
    .line 62
    goto :goto_2

    .line 63
    :catchall_0
    move-exception p1

    .line 64
    goto :goto_3

    .line 65
    :catch_0
    move-exception p2

    .line 66
    goto :goto_1

    .line 67
    :cond_0
    iget v3, p0, Ll/diw;->e:I

    .line 68
    .line 69
    if-nez v3, :cond_1

    .line 70
    .line 71
    sget-object v3, Landroid/hardware/camera2/CameraCharacteristics;->LENS_FACING:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 72
    .line 73
    invoke-virtual {v2, v3}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    check-cast v2, Ljava/lang/Integer;

    .line 78
    .line 79
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    if-ne v2, v4, :cond_1

    .line 84
    .line 85
    iput-boolean v4, p0, Ll/diw;->I:Z

    .line 86
    .line 87
    iput v4, p0, Ll/diw;->e:I

    .line 88
    .line 89
    invoke-direct {p0}, Ll/diw;->m0()V
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 90
    .line 91
    .line 92
    goto :goto_2

    .line 93
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :goto_1
    :try_start_1
    const-string v0, "Camera"

    .line 97
    .line 98
    new-instance v1, Ljava/lang/StringBuilder;

    .line 99
    .line 100
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 101
    .line 102
    .line 103
    const-string v2, "Camera2 switch Camera failed !"

    .line 104
    .line 105
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object p2

    .line 112
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p2

    .line 119
    invoke-static {v0, p2}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    sget-object p2, Ll/r94;->a:Ljava/util/Map;

    .line 123
    .line 124
    const/4 v0, 0x5

    .line 125
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    invoke-interface {p2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    move-result-object p2

    .line 133
    check-cast p2, Ljava/lang/String;

    .line 134
    .line 135
    invoke-direct {p0, v0, p2}, Ll/diw;->l0(ILjava/lang/String;)V

    .line 136
    .line 137
    .line 138
    iget-object p2, p0, Ll/diw;->D:Ll/ypl$e;

    .line 139
    .line 140
    if-eqz p2, :cond_2

    .line 141
    .line 142
    const-string v0, "Camera2 switch Camera failed !"

    .line 143
    .line 144
    const/16 v1, 0xfa8

    .line 145
    .line 146
    invoke-interface {p2, v1, v0}, Ll/ypl$e;->onFail(ILjava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 147
    .line 148
    .line 149
    :cond_2
    :goto_2
    monitor-exit p0

    .line 150
    return p1

    .line 151
    :goto_3
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 152
    throw p1
.end method

.method public declared-synchronized C(ILl/qow;)Z
    .locals 7

    .line 1
    const-string v0, "Camera2 prepare mrCoreParameters.encodeWidth = "

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    iput-object p2, p0, Ll/diw;->H:Ll/qow;

    .line 5
    .line 6
    iget v1, p0, Ll/diw;->m:I

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    sub-int/2addr v1, v2

    .line 10
    invoke-virtual {p2}, Ll/qow;->d()I

    .line 11
    .line 12
    .line 13
    move-result v3

    .line 14
    if-lt v1, v3, :cond_0

    .line 15
    .line 16
    invoke-virtual {p2}, Ll/qow;->d()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    iput v1, p0, Ll/diw;->e:I

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :catchall_0
    move-exception p1

    .line 24
    goto/16 :goto_5

    .line 25
    .line 26
    :cond_0
    :goto_0
    iget-object v1, p0, Ll/diw;->c:Landroid/os/Handler;

    .line 27
    .line 28
    if-nez v1, :cond_1

    .line 29
    .line 30
    new-instance v1, Landroid/os/HandlerThread;

    .line 31
    .line 32
    const-string v3, "Camera2"

    .line 33
    .line 34
    invoke-direct {v1, v3}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iput-object v1, p0, Ll/diw;->u:Landroid/os/HandlerThread;

    .line 38
    .line 39
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 40
    .line 41
    .line 42
    new-instance v1, Landroid/os/Handler;

    .line 43
    .line 44
    iget-object v3, p0, Ll/diw;->u:Landroid/os/HandlerThread;

    .line 45
    .line 46
    invoke-virtual {v3}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    invoke-direct {v1, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 51
    .line 52
    .line 53
    iput-object v1, p0, Ll/diw;->c:Landroid/os/Handler;

    .line 54
    .line 55
    :cond_1
    iget-object v1, p0, Ll/diw;->d:Landroid/os/Handler;

    .line 56
    .line 57
    if-nez v1, :cond_2

    .line 58
    .line 59
    new-instance v1, Landroid/os/Handler;

    .line 60
    .line 61
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    invoke-direct {v1, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 66
    .line 67
    .line 68
    iput-object v1, p0, Ll/diw;->d:Landroid/os/Handler;

    .line 69
    .line 70
    :cond_2
    iput p1, p0, Ll/diw;->t:I

    .line 71
    .line 72
    invoke-virtual {p0, p1}, Ll/diw;->Z(I)V

    .line 73
    .line 74
    .line 75
    iget-object p1, p0, Ll/diw;->a:Ll/sow;

    .line 76
    .line 77
    invoke-virtual {p2}, Ll/qow;->q()Ll/crf0;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-virtual {v1}, Ll/crf0;->b()I

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    iput v1, p1, Ll/sow;->b:I

    .line 86
    .line 87
    iget-object p1, p0, Ll/diw;->a:Ll/sow;

    .line 88
    .line 89
    invoke-virtual {p2}, Ll/qow;->q()Ll/crf0;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    invoke-virtual {v1}, Ll/crf0;->a()I

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    iput v1, p1, Ll/sow;->c:I

    .line 98
    .line 99
    iget-object p1, p0, Ll/diw;->h:Landroid/hardware/camera2/CameraManager;

    .line 100
    .line 101
    if-eqz p1, :cond_4

    .line 102
    .line 103
    invoke-virtual {p0}, Ll/diw;->e0()Landroid/hardware/camera2/CameraCharacteristics;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    iget-object v1, p0, Ll/diw;->a:Ll/sow;

    .line 108
    .line 109
    new-instance v3, Landroid/util/Size;

    .line 110
    .line 111
    invoke-virtual {p2}, Ll/qow;->q()Ll/crf0;

    .line 112
    .line 113
    .line 114
    move-result-object v4

    .line 115
    invoke-virtual {v4}, Ll/crf0;->b()I

    .line 116
    .line 117
    .line 118
    move-result v4

    .line 119
    invoke-virtual {p2}, Ll/qow;->q()Ll/crf0;

    .line 120
    .line 121
    .line 122
    move-result-object v5

    .line 123
    invoke-virtual {v5}, Ll/crf0;->a()I

    .line 124
    .line 125
    .line 126
    move-result v5

    .line 127
    invoke-direct {v3, v4, v5}, Landroid/util/Size;-><init>(II)V

    .line 128
    .line 129
    .line 130
    invoke-static {p1, v1, v3}, Ll/j94;->d(Landroid/hardware/camera2/CameraCharacteristics;Ll/sow;Landroid/util/Size;)Landroid/util/Size;

    .line 131
    .line 132
    .line 133
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 134
    if-nez p1, :cond_3

    .line 135
    .line 136
    monitor-exit p0

    .line 137
    const/4 p0, 0x0

    .line 138
    return p0

    .line 139
    :cond_3
    :try_start_1
    iget-object v1, p0, Ll/diw;->a:Ll/sow;

    .line 140
    .line 141
    invoke-virtual {p1}, Landroid/util/Size;->getWidth()I

    .line 142
    .line 143
    .line 144
    move-result v3

    .line 145
    iput v3, v1, Ll/sow;->b:I

    .line 146
    .line 147
    iget-object v1, p0, Ll/diw;->a:Ll/sow;

    .line 148
    .line 149
    invoke-virtual {p1}, Landroid/util/Size;->getHeight()I

    .line 150
    .line 151
    .line 152
    move-result p1

    .line 153
    iput p1, v1, Ll/sow;->c:I

    .line 154
    .line 155
    :cond_4
    iget-object p1, p0, Ll/diw;->a:Ll/sow;

    .line 156
    .line 157
    iget v1, p1, Ll/sow;->b:I

    .line 158
    .line 159
    iget p1, p1, Ll/sow;->c:I

    .line 160
    .line 161
    new-instance v3, Ll/crf0;

    .line 162
    .line 163
    invoke-direct {v3, v1, p1}, Ll/crf0;-><init>(II)V

    .line 164
    .line 165
    .line 166
    iput-object v3, p0, Ll/diw;->r:Ll/crf0;

    .line 167
    .line 168
    iget-object v3, p0, Ll/diw;->f:Landroid/media/ImageReader;

    .line 169
    .line 170
    const/4 v4, 0x3

    .line 171
    if-nez v3, :cond_5

    .line 172
    .line 173
    iget-object v3, p0, Ll/diw;->a:Ll/sow;

    .line 174
    .line 175
    iget v5, v3, Ll/sow;->b:I

    .line 176
    .line 177
    iget v3, v3, Ll/sow;->c:I

    .line 178
    .line 179
    const/16 v6, 0x23

    .line 180
    .line 181
    invoke-static {v5, v3, v6, v4}, Landroid/media/ImageReader;->newInstance(IIII)Landroid/media/ImageReader;

    .line 182
    .line 183
    .line 184
    move-result-object v3

    .line 185
    iput-object v3, p0, Ll/diw;->f:Landroid/media/ImageReader;

    .line 186
    .line 187
    iget-object v5, p0, Ll/diw;->A:Landroid/media/ImageReader$OnImageAvailableListener;

    .line 188
    .line 189
    iget-object v6, p0, Ll/diw;->c:Landroid/os/Handler;

    .line 190
    .line 191
    invoke-virtual {v3, v5, v6}, Landroid/media/ImageReader;->setOnImageAvailableListener(Landroid/media/ImageReader$OnImageAvailableListener;Landroid/os/Handler;)V

    .line 192
    .line 193
    .line 194
    :cond_5
    invoke-virtual {p2}, Ll/qow;->o()I

    .line 195
    .line 196
    .line 197
    move-result v3

    .line 198
    if-ne v3, v2, :cond_6

    .line 199
    .line 200
    int-to-float v1, p1

    .line 201
    invoke-virtual {p2}, Ll/qow;->p()F

    .line 202
    .line 203
    .line 204
    move-result v3

    .line 205
    mul-float/2addr v1, v3

    .line 206
    float-to-int v1, v1

    .line 207
    iget-object v3, p0, Ll/diw;->a:Ll/sow;

    .line 208
    .line 209
    iget v3, v3, Ll/sow;->b:I

    .line 210
    .line 211
    if-eq v1, v3, :cond_7

    .line 212
    .line 213
    shr-int/lit8 v1, v1, 0x4

    .line 214
    .line 215
    shl-int/lit8 v1, v1, 0x4

    .line 216
    .line 217
    goto :goto_1

    .line 218
    :cond_6
    invoke-virtual {p2}, Ll/qow;->o()I

    .line 219
    .line 220
    .line 221
    move-result v3

    .line 222
    if-nez v3, :cond_7

    .line 223
    .line 224
    int-to-float p1, v1

    .line 225
    invoke-virtual {p2}, Ll/qow;->p()F

    .line 226
    .line 227
    .line 228
    move-result v3

    .line 229
    div-float/2addr p1, v3

    .line 230
    float-to-int p1, p1

    .line 231
    iget-object v3, p0, Ll/diw;->a:Ll/sow;

    .line 232
    .line 233
    iget v3, v3, Ll/sow;->c:I

    .line 234
    .line 235
    if-eq p1, v3, :cond_7

    .line 236
    .line 237
    shr-int/lit8 p1, p1, 0x4

    .line 238
    .line 239
    shl-int/lit8 p1, p1, 0x4

    .line 240
    .line 241
    :cond_7
    :goto_1
    iget v3, p0, Ll/diw;->p:I

    .line 242
    .line 243
    if-eq v3, v2, :cond_9

    .line 244
    .line 245
    if-ne v3, v4, :cond_8

    .line 246
    .line 247
    goto :goto_2

    .line 248
    :cond_8
    new-instance v3, Ll/crf0;

    .line 249
    .line 250
    invoke-direct {v3, v1, p1}, Ll/crf0;-><init>(II)V

    .line 251
    .line 252
    .line 253
    goto :goto_3

    .line 254
    :cond_9
    :goto_2
    new-instance v3, Ll/crf0;

    .line 255
    .line 256
    invoke-direct {v3, p1, v1}, Ll/crf0;-><init>(II)V

    .line 257
    .line 258
    .line 259
    :goto_3
    iget-object p1, p0, Ll/diw;->a:Ll/sow;

    .line 260
    .line 261
    iget-boolean p1, p1, Ll/sow;->M:Z

    .line 262
    .line 263
    if-eqz p1, :cond_a

    .line 264
    .line 265
    invoke-virtual {v3}, Ll/crf0;->b()I

    .line 266
    .line 267
    .line 268
    move-result p1

    .line 269
    if-lez p1, :cond_b

    .line 270
    .line 271
    invoke-virtual {v3}, Ll/crf0;->a()I

    .line 272
    .line 273
    .line 274
    move-result p1

    .line 275
    if-lez p1, :cond_b

    .line 276
    .line 277
    iget-object p1, p0, Ll/diw;->a:Ll/sow;

    .line 278
    .line 279
    invoke-virtual {v3}, Ll/crf0;->b()I

    .line 280
    .line 281
    .line 282
    move-result v1

    .line 283
    iput v1, p1, Ll/sow;->h:I

    .line 284
    .line 285
    iget-object p1, p0, Ll/diw;->a:Ll/sow;

    .line 286
    .line 287
    invoke-virtual {v3}, Ll/crf0;->a()I

    .line 288
    .line 289
    .line 290
    move-result v1

    .line 291
    iput v1, p1, Ll/sow;->i:I

    .line 292
    .line 293
    invoke-virtual {p2, v3}, Ll/qow;->F(Ll/crf0;)V

    .line 294
    .line 295
    .line 296
    goto :goto_4

    .line 297
    :cond_a
    invoke-virtual {p2}, Ll/qow;->e()Ll/crf0;

    .line 298
    .line 299
    .line 300
    move-result-object p1

    .line 301
    if-eqz p1, :cond_b

    .line 302
    .line 303
    invoke-virtual {p1}, Ll/crf0;->b()I

    .line 304
    .line 305
    .line 306
    move-result p2

    .line 307
    if-lez p2, :cond_b

    .line 308
    .line 309
    invoke-virtual {p1}, Ll/crf0;->a()I

    .line 310
    .line 311
    .line 312
    move-result p2

    .line 313
    if-lez p2, :cond_b

    .line 314
    .line 315
    iget-object p2, p0, Ll/diw;->a:Ll/sow;

    .line 316
    .line 317
    invoke-virtual {p1}, Ll/crf0;->b()I

    .line 318
    .line 319
    .line 320
    move-result v1

    .line 321
    iput v1, p2, Ll/sow;->h:I

    .line 322
    .line 323
    iget-object p2, p0, Ll/diw;->a:Ll/sow;

    .line 324
    .line 325
    invoke-virtual {p1}, Ll/crf0;->a()I

    .line 326
    .line 327
    .line 328
    move-result p1

    .line 329
    iput p1, p2, Ll/sow;->i:I

    .line 330
    .line 331
    :cond_b
    :goto_4
    const-string p1, "Camera"

    .line 332
    .line 333
    new-instance p2, Ljava/lang/StringBuilder;

    .line 334
    .line 335
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 336
    .line 337
    .line 338
    iget-object v0, p0, Ll/diw;->a:Ll/sow;

    .line 339
    .line 340
    iget v0, v0, Ll/sow;->h:I

    .line 341
    .line 342
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 343
    .line 344
    .line 345
    const-string v0, " mrCoreParameters.encodeHeight = "

    .line 346
    .line 347
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 348
    .line 349
    .line 350
    iget-object v0, p0, Ll/diw;->a:Ll/sow;

    .line 351
    .line 352
    iget v0, v0, Ll/sow;->i:I

    .line 353
    .line 354
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 355
    .line 356
    .line 357
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 358
    .line 359
    .line 360
    move-result-object p2

    .line 361
    invoke-static {p1, p2}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 362
    .line 363
    .line 364
    monitor-exit p0

    .line 365
    return v2

    .line 366
    :goto_5
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 367
    throw p1
.end method

.method public E(Ljava/lang/String;)V
    .locals 7
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x15
    .end annotation

    .line 1
    const-string v0, "Camera"

    .line 2
    .line 3
    const-string v1, "Set Camera2 is flash mode error!"

    .line 4
    .line 5
    const/16 v2, 0xb

    .line 6
    .line 7
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object v3

    .line 11
    iget-object v4, p0, Ll/diw;->B:Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v4

    .line 17
    if-eqz v4, :cond_3

    .line 18
    .line 19
    const-string v4, "on"

    .line 20
    .line 21
    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v4

    .line 25
    if-eqz v4, :cond_0

    .line 26
    .line 27
    iget-object p1, p0, Ll/diw;->l:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 28
    .line 29
    sget-object v4, Landroid/hardware/camera2/CaptureRequest;->FLASH_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 30
    .line 31
    const/4 v5, 0x2

    .line 32
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 33
    .line 34
    .line 35
    move-result-object v5

    .line 36
    invoke-virtual {p1, v4, v5}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    const-string v4, "off"

    .line 41
    .line 42
    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v4

    .line 46
    if-eqz v4, :cond_1

    .line 47
    .line 48
    iget-object p1, p0, Ll/diw;->l:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 49
    .line 50
    sget-object v4, Landroid/hardware/camera2/CaptureRequest;->FLASH_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 51
    .line 52
    const/4 v5, 0x0

    .line 53
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 54
    .line 55
    .line 56
    move-result-object v5

    .line 57
    invoke-virtual {p1, v4, v5}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    const-string v4, "auto"

    .line 62
    .line 63
    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    if-eqz p1, :cond_2

    .line 68
    .line 69
    iget-object p1, p0, Ll/diw;->l:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 70
    .line 71
    sget-object v4, Landroid/hardware/camera2/CaptureRequest;->CONTROL_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 72
    .line 73
    const/4 v5, 0x1

    .line 74
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 75
    .line 76
    .line 77
    move-result-object v5

    .line 78
    invoke-virtual {p1, v4, v5}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 79
    .line 80
    .line 81
    :cond_2
    :goto_0
    :try_start_0
    iget-object p1, p0, Ll/diw;->l:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 82
    .line 83
    invoke-virtual {p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    iget-object v4, p0, Ll/diw;->i:Landroid/hardware/camera2/CameraCaptureSession;

    .line 88
    .line 89
    if-eqz v4, :cond_3

    .line 90
    .line 91
    iget-object v5, p0, Ll/diw;->c:Landroid/os/Handler;

    .line 92
    .line 93
    const/4 v6, 0x0

    .line 94
    invoke-virtual {v4, p1, v6, v5}, Landroid/hardware/camera2/CameraCaptureSession;->setRepeatingRequest(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    :catch_0
    move-exception p1

    .line 99
    goto :goto_1

    .line 100
    :catch_1
    move-exception p1

    .line 101
    goto :goto_2

    .line 102
    :goto_1
    new-instance v4, Ljava/lang/StringBuilder;

    .line 103
    .line 104
    invoke-direct {v4, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    invoke-static {v0, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    sget-object p1, Ll/r94;->a:Ljava/util/Map;

    .line 122
    .line 123
    invoke-interface {p1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    check-cast p1, Ljava/lang/String;

    .line 128
    .line 129
    invoke-direct {p0, v2, p1}, Ll/diw;->l0(ILjava/lang/String;)V

    .line 130
    .line 131
    .line 132
    goto :goto_3

    .line 133
    :goto_2
    new-instance v4, Ljava/lang/StringBuilder;

    .line 134
    .line 135
    invoke-direct {v4, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v5

    .line 142
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object v4

    .line 149
    invoke-static {v0, v4}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 150
    .line 151
    .line 152
    sget-object v0, Ll/r94;->a:Ljava/util/Map;

    .line 153
    .line 154
    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    check-cast v0, Ljava/lang/String;

    .line 159
    .line 160
    invoke-direct {p0, v2, v0}, Ll/diw;->l0(ILjava/lang/String;)V

    .line 161
    .line 162
    .line 163
    iget-object p0, p0, Ll/diw;->D:Ll/ypl$e;

    .line 164
    .line 165
    if-eqz p0, :cond_3

    .line 166
    .line 167
    new-instance v0, Ljava/lang/StringBuilder;

    .line 168
    .line 169
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 170
    .line 171
    .line 172
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object p1

    .line 183
    const/16 v0, 0xfa5

    .line 184
    .line 185
    invoke-interface {p0, v0, p1}, Ll/ypl$e;->onFail(ILjava/lang/String;)V

    .line 186
    .line 187
    .line 188
    :cond_3
    :goto_3
    return-void
.end method

.method public F()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public Z(I)V
    .locals 3
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x15
    .end annotation

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/diw;->h:Landroid/hardware/camera2/CameraManager;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    iget v2, p0, Ll/diw;->e:I

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v2, ""

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraManager;->getCameraCharacteristics(Ljava/lang/String;)Landroid/hardware/camera2/CameraCharacteristics;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_ORIENTATION:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Ljava/lang/Integer;

    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    invoke-virtual {p0}, Ll/diw;->i()Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-eqz v1, :cond_0

    .line 43
    .line 44
    add-int/2addr v0, p1

    .line 45
    rem-int/lit16 v0, v0, 0x168

    .line 46
    .line 47
    rsub-int p1, v0, 0x168

    .line 48
    .line 49
    rem-int/lit16 p1, p1, 0x168

    .line 50
    .line 51
    iput p1, p0, Ll/diw;->q:I

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :catch_0
    move-exception p1

    .line 55
    goto :goto_2

    .line 56
    :cond_0
    sub-int/2addr v0, p1

    .line 57
    add-int/lit16 v0, v0, 0x168

    .line 58
    .line 59
    rem-int/lit16 v0, v0, 0x168

    .line 60
    .line 61
    iput v0, p0, Ll/diw;->q:I

    .line 62
    .line 63
    :goto_0
    sget-object p1, Lcom/immomo/moment/camera/config/Rotation;->NORMAL:Lcom/immomo/moment/camera/config/Rotation;

    .line 64
    .line 65
    iget v0, p0, Ll/diw;->q:I

    .line 66
    .line 67
    const/16 v1, 0x5a

    .line 68
    .line 69
    if-eq v0, v1, :cond_3

    .line 70
    .line 71
    const/16 v1, 0xb4

    .line 72
    .line 73
    if-eq v0, v1, :cond_2

    .line 74
    .line 75
    const/16 v1, 0x10e

    .line 76
    .line 77
    if-eq v0, v1, :cond_1

    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_1
    sget-object p1, Lcom/immomo/moment/camera/config/Rotation;->ROTATION_270:Lcom/immomo/moment/camera/config/Rotation;

    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_2
    sget-object p1, Lcom/immomo/moment/camera/config/Rotation;->ROTATION_180:Lcom/immomo/moment/camera/config/Rotation;

    .line 84
    .line 85
    goto :goto_1

    .line 86
    :cond_3
    sget-object p1, Lcom/immomo/moment/camera/config/Rotation;->ROTATION_90:Lcom/immomo/moment/camera/config/Rotation;

    .line 87
    .line 88
    :goto_1
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    iput p1, p0, Ll/diw;->p:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 93
    .line 94
    return-void

    .line 95
    :goto_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 96
    .line 97
    const-string v1, "Camera2 config Camera Orientation failed !"

    .line 98
    .line 99
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    const-string v0, "Camera"

    .line 114
    .line 115
    invoke-static {v0, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    sget-object p1, Ll/r94;->a:Ljava/util/Map;

    .line 119
    .line 120
    const/4 v0, 0x4

    .line 121
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 122
    .line 123
    .line 124
    move-result-object v2

    .line 125
    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    check-cast p1, Ljava/lang/String;

    .line 130
    .line 131
    invoke-direct {p0, v0, p1}, Ll/diw;->l0(ILjava/lang/String;)V

    .line 132
    .line 133
    .line 134
    iget-object p0, p0, Ll/diw;->D:Ll/ypl$e;

    .line 135
    .line 136
    if-eqz p0, :cond_4

    .line 137
    .line 138
    const/16 p1, 0xfa5

    .line 139
    .line 140
    invoke-interface {p0, p1, v1}, Ll/ypl$e;->onFail(ILjava/lang/String;)V

    .line 141
    .line 142
    .line 143
    :cond_4
    return-void
.end method

.method public declared-synchronized a()I
    .locals 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x15
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/diw;->i:Landroid/hardware/camera2/CameraCaptureSession;

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/hardware/camera2/CameraCaptureSession;->close()V

    .line 8
    .line 9
    .line 10
    iput-object v1, p0, Ll/diw;->i:Landroid/hardware/camera2/CameraCaptureSession;

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :catchall_0
    move-exception v0

    .line 14
    goto :goto_1

    .line 15
    :cond_0
    :goto_0
    iget-object v0, p0, Ll/diw;->g:Landroid/hardware/camera2/CameraDevice;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/hardware/camera2/CameraDevice;->close()V

    .line 20
    .line 21
    .line 22
    iput-object v1, p0, Ll/diw;->g:Landroid/hardware/camera2/CameraDevice;

    .line 23
    .line 24
    :cond_1
    const/4 v0, 0x0

    .line 25
    iput-boolean v0, p0, Ll/diw;->F:Z

    .line 26
    .line 27
    const-string v1, "Camera"

    .line 28
    .line 29
    const-string v2, "Camera2 stopPreview !"

    .line 30
    .line 31
    invoke-static {v1, v2}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    .line 33
    .line 34
    monitor-exit p0

    .line 35
    return v0

    .line 36
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 37
    throw v0
.end method

.method public b(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public c()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public d()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public e(Landroid/hardware/Camera$ErrorCallback;)V
    .locals 0

    .line 1
    return-void
.end method

.method public e0()Landroid/hardware/camera2/CameraCharacteristics;
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/diw;->h:Landroid/hardware/camera2/CameraManager;

    .line 2
    .line 3
    iget p0, p0, Ll/diw;->e:I

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {v0, p0}, Landroid/hardware/camera2/CameraManager;->getCameraCharacteristics(Ljava/lang/String;)Landroid/hardware/camera2/CameraCharacteristics;

    .line 10
    .line 11
    .line 12
    move-result-object p0
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    return-object p0

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
    return-object p0
.end method

.method public f(IILandroid/graphics/Rect;Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public getTextureSize()Ll/crf0;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public i()Z
    .locals 0
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x15
    .end annotation

    .line 1
    iget-boolean p0, p0, Ll/diw;->J:Z

    .line 2
    .line 3
    return p0
.end method

.method public declared-synchronized j(Landroid/graphics/SurfaceTexture;)Z
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MissingPermission"
        }
    .end annotation

    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x15
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x0

    .line 3
    :try_start_0
    invoke-virtual {p0, p1, v0}, Ll/diw;->o(Landroid/graphics/SurfaceTexture;Ll/uje;)Z

    .line 4
    .line 5
    .line 6
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    monitor-exit p0

    .line 8
    return p1

    .line 9
    :catchall_0
    move-exception p1

    .line 10
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 11
    throw p1
.end method

.method public j0()V
    .locals 5

    .line 1
    const-string v0, "Camera"

    .line 2
    .line 3
    :try_start_0
    iget-object v1, p0, Ll/diw;->l:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 4
    .line 5
    sget-object v2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 6
    .line 7
    const/4 v3, 0x1

    .line 8
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 9
    .line 10
    .line 11
    move-result-object v3

    .line 12
    invoke-virtual {v1, v2, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    iget-object v1, p0, Ll/diw;->l:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 16
    .line 17
    invoke-virtual {v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iget-object v3, p0, Ll/diw;->l:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 22
    .line 23
    const/4 v4, 0x0

    .line 24
    invoke-virtual {v3, v2, v4}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    iget-object v2, p0, Ll/diw;->i:Landroid/hardware/camera2/CameraCaptureSession;

    .line 28
    .line 29
    iget-object v3, p0, Ll/diw;->N:Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    .line 30
    .line 31
    iget-object v4, p0, Ll/diw;->c:Landroid/os/Handler;

    .line 32
    .line 33
    invoke-virtual {v2, v1, v3, v4}, Landroid/hardware/camera2/CameraCaptureSession;->capture(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :catch_0
    move-exception v1

    .line 38
    new-instance v2, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    const-string v3, "Set Camera2 lock auto focus mode error!"

    .line 41
    .line 42
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-static {v0, v2}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Ll/diw;->D:Ll/ypl$e;

    .line 60
    .line 61
    if-eqz p0, :cond_0

    .line 62
    .line 63
    new-instance v2, Ljava/lang/StringBuilder;

    .line 64
    .line 65
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    const/16 v2, 0xfa5

    .line 80
    .line 81
    invoke-interface {p0, v2, v1}, Ll/ypl$e;->onFail(ILjava/lang/String;)V

    .line 82
    .line 83
    .line 84
    :cond_0
    :goto_0
    const-string p0, "Camera2 lockAutoFocus !!!"

    .line 85
    .line 86
    invoke-static {v0, p0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public k(Landroid/graphics/Rect;Landroid/hardware/Camera$AutoFocusCallback;)V
    .locals 4
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x15
    .end annotation

    .line 1
    const/4 p2, 0x1

    .line 2
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object p2

    .line 6
    iget-object v0, p0, Ll/diw;->i:Landroid/hardware/camera2/CameraCaptureSession;

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object v0, p0, Ll/diw;->l:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 12
    .line 13
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_REGIONS:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 14
    .line 15
    new-instance v2, Landroid/hardware/camera2/params/MeteringRectangle;

    .line 16
    .line 17
    const/16 v3, 0x3e8

    .line 18
    .line 19
    invoke-direct {v2, p1, v3}, Landroid/hardware/camera2/params/MeteringRectangle;-><init>(Landroid/graphics/Rect;I)V

    .line 20
    .line 21
    .line 22
    filled-new-array {v2}, [Landroid/hardware/camera2/params/MeteringRectangle;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/diw;->l:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 30
    .line 31
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_REGIONS:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 32
    .line 33
    new-instance v2, Landroid/hardware/camera2/params/MeteringRectangle;

    .line 34
    .line 35
    invoke-direct {v2, p1, v3}, Landroid/hardware/camera2/params/MeteringRectangle;-><init>(Landroid/graphics/Rect;I)V

    .line 36
    .line 37
    .line 38
    filled-new-array {v2}, [Landroid/hardware/camera2/params/MeteringRectangle;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {v0, v1, p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    invoke-direct {p0}, Ll/diw;->g0()Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    iget-object v0, p0, Ll/diw;->l:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 50
    .line 51
    if-eqz p1, :cond_1

    .line 52
    .line 53
    sget-object p1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 54
    .line 55
    invoke-virtual {v0, p1, p2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_1
    sget-object p1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 60
    .line 61
    const/4 v2, 0x4

    .line 62
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-virtual {v0, p1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 67
    .line 68
    .line 69
    :goto_0
    iget-object p1, p0, Ll/diw;->l:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 70
    .line 71
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 72
    .line 73
    invoke-virtual {p1, v0, p2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 74
    .line 75
    .line 76
    iget-object p1, p0, Ll/diw;->l:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 77
    .line 78
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_PRECAPTURE_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 79
    .line 80
    invoke-virtual {p1, v0, p2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 81
    .line 82
    .line 83
    iget-object p1, p0, Ll/diw;->l:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 84
    .line 85
    invoke-virtual {p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    iget-object p2, p0, Ll/diw;->l:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 90
    .line 91
    const/4 v2, 0x0

    .line 92
    invoke-virtual {p2, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 93
    .line 94
    .line 95
    iget-object p2, p0, Ll/diw;->l:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 96
    .line 97
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 98
    .line 99
    invoke-virtual {p2, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 100
    .line 101
    .line 102
    iget-object p2, p0, Ll/diw;->l:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 103
    .line 104
    invoke-virtual {p2, v0, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 105
    .line 106
    .line 107
    :try_start_0
    iget-object p2, p0, Ll/diw;->i:Landroid/hardware/camera2/CameraCaptureSession;

    .line 108
    .line 109
    iget-object v0, p0, Ll/diw;->N:Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    .line 110
    .line 111
    iget-object p0, p0, Ll/diw;->c:Landroid/os/Handler;

    .line 112
    .line 113
    invoke-virtual {p2, p1, v0, p0}, Landroid/hardware/camera2/CameraCaptureSession;->setRepeatingRequest(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 114
    .line 115
    .line 116
    return-void

    .line 117
    :catch_0
    move-exception p0

    .line 118
    new-instance p1, Ljava/lang/StringBuilder;

    .line 119
    .line 120
    const-string p2, "setRepeatingRequest failed, "

    .line 121
    .line 122
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    const-string p1, "ContentValues"

    .line 137
    .line 138
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 139
    .line 140
    .line 141
    return-void
.end method

.method public l(Ll/ypl$f;)V
    .locals 0

    .line 1
    return-void
.end method

.method public m()I
    .locals 0

    .line 1
    iget p0, p0, Ll/diw;->p:I

    .line 2
    .line 3
    mul-int/lit8 p0, p0, 0x5a

    .line 4
    .line 5
    return p0
.end method

.method public n()[I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public o(Landroid/graphics/SurfaceTexture;Ll/uje;)Z
    .locals 9
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MissingPermission"
        }
    .end annotation

    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x15
    .end annotation

    .line 1
    const-string p1, "Time out waiting to lock camera opening."

    .line 2
    .line 3
    const-string p2, ""

    .line 4
    .line 5
    const-string v0, "Camera2 start preview failed !"

    .line 6
    .line 7
    const-string v1, "sem is "

    .line 8
    .line 9
    iget-boolean v2, p0, Ll/diw;->F:Z

    .line 10
    .line 11
    const/4 v3, 0x1

    .line 12
    if-nez v2, :cond_3

    .line 13
    .line 14
    const-string v2, "Camera2 startPreview !!!"

    .line 15
    .line 16
    const-string v4, "Camera"

    .line 17
    .line 18
    invoke-static {v4, v2}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v2, p0, Ll/diw;->w:Landroid/content/Context;

    .line 22
    .line 23
    const-string v5, "camera"

    .line 24
    .line 25
    invoke-virtual {v2, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Landroid/hardware/camera2/CameraManager;

    .line 30
    .line 31
    iput-object v2, p0, Ll/diw;->h:Landroid/hardware/camera2/CameraManager;

    .line 32
    .line 33
    :try_start_0
    new-instance v5, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 36
    .line 37
    .line 38
    iget v6, p0, Ll/diw;->e:I

    .line 39
    .line 40
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v5

    .line 50
    invoke-virtual {v2, v5}, Landroid/hardware/camera2/CameraManager;->getCameraCharacteristics(Ljava/lang/String;)Landroid/hardware/camera2/CameraCharacteristics;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    sget-object v5, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_INFO_ACTIVE_ARRAY_SIZE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 55
    .line 56
    invoke-virtual {v2, v5}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v5

    .line 60
    check-cast v5, Landroid/graphics/Rect;

    .line 61
    .line 62
    iput-object v5, p0, Ll/diw;->s:Landroid/graphics/Rect;

    .line 63
    .line 64
    sget-object v5, Landroid/hardware/camera2/CameraCharacteristics;->FLASH_INFO_AVAILABLE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 65
    .line 66
    invoke-virtual {v2, v5}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v5

    .line 70
    check-cast v5, Ljava/lang/Boolean;

    .line 71
    .line 72
    iput-object v5, p0, Ll/diw;->B:Ljava/lang/Boolean;

    .line 73
    .line 74
    iget-object v5, p0, Ll/diw;->a:Ll/sow;

    .line 75
    .line 76
    invoke-static {v2, v5}, Ll/j94;->c(Landroid/hardware/camera2/CameraCharacteristics;Ll/sow;)V

    .line 77
    .line 78
    .line 79
    invoke-direct {p0}, Ll/diw;->c0()Z

    .line 80
    .line 81
    .line 82
    move-result v5

    .line 83
    iput-boolean v5, p0, Ll/diw;->J:Z

    .line 84
    .line 85
    iget-object v5, p0, Ll/diw;->a:Ll/sow;

    .line 86
    .line 87
    new-instance v6, Landroid/util/Size;

    .line 88
    .line 89
    iget-object v7, p0, Ll/diw;->H:Ll/qow;

    .line 90
    .line 91
    invoke-virtual {v7}, Ll/qow;->q()Ll/crf0;

    .line 92
    .line 93
    .line 94
    move-result-object v7

    .line 95
    invoke-virtual {v7}, Ll/crf0;->b()I

    .line 96
    .line 97
    .line 98
    move-result v7

    .line 99
    iget-object v8, p0, Ll/diw;->H:Ll/qow;

    .line 100
    .line 101
    invoke-virtual {v8}, Ll/qow;->q()Ll/crf0;

    .line 102
    .line 103
    .line 104
    move-result-object v8

    .line 105
    invoke-virtual {v8}, Ll/crf0;->a()I

    .line 106
    .line 107
    .line 108
    move-result v8

    .line 109
    invoke-direct {v6, v7, v8}, Landroid/util/Size;-><init>(II)V

    .line 110
    .line 111
    .line 112
    invoke-static {v2, v5, v6}, Ll/j94;->d(Landroid/hardware/camera2/CameraCharacteristics;Ll/sow;Landroid/util/Size;)Landroid/util/Size;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    if-eqz v2, :cond_0

    .line 117
    .line 118
    iget-object v5, p0, Ll/diw;->a:Ll/sow;

    .line 119
    .line 120
    invoke-virtual {v2}, Landroid/util/Size;->getWidth()I

    .line 121
    .line 122
    .line 123
    move-result v6

    .line 124
    iput v6, v5, Ll/sow;->b:I

    .line 125
    .line 126
    iget-object v5, p0, Ll/diw;->a:Ll/sow;

    .line 127
    .line 128
    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    .line 129
    .line 130
    .line 131
    move-result v2

    .line 132
    iput v2, v5, Ll/sow;->c:I

    .line 133
    .line 134
    goto :goto_0

    .line 135
    :catch_0
    move-exception p1

    .line 136
    goto :goto_1

    .line 137
    :catch_1
    move-exception p1

    .line 138
    goto :goto_2

    .line 139
    :cond_0
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 140
    .line 141
    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    iget-object v1, p0, Ll/diw;->E:Ljava/util/concurrent/Semaphore;

    .line 145
    .line 146
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    invoke-static {v4, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    iget-object v1, p0, Ll/diw;->E:Ljava/util/concurrent/Semaphore;

    .line 157
    .line 158
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 159
    .line 160
    const-wide/16 v5, 0x9c4

    .line 161
    .line 162
    invoke-virtual {v1, v5, v6, v2}, Ljava/util/concurrent/Semaphore;->tryAcquire(JLjava/util/concurrent/TimeUnit;)Z

    .line 163
    .line 164
    .line 165
    move-result v1

    .line 166
    if-eqz v1, :cond_1

    .line 167
    .line 168
    iget-object p1, p0, Ll/diw;->h:Landroid/hardware/camera2/CameraManager;

    .line 169
    .line 170
    new-instance v1, Ljava/lang/StringBuilder;

    .line 171
    .line 172
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 173
    .line 174
    .line 175
    iget v2, p0, Ll/diw;->e:I

    .line 176
    .line 177
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object p2

    .line 187
    iget-object v1, p0, Ll/diw;->y:Landroid/hardware/camera2/CameraDevice$StateCallback;

    .line 188
    .line 189
    iget-object v2, p0, Ll/diw;->c:Landroid/os/Handler;

    .line 190
    .line 191
    invoke-virtual {p1, p2, v1, v2}, Landroid/hardware/camera2/CameraManager;->openCamera(Ljava/lang/String;Landroid/hardware/camera2/CameraDevice$StateCallback;Landroid/os/Handler;)V

    .line 192
    .line 193
    .line 194
    goto :goto_3

    .line 195
    :cond_1
    invoke-static {v4, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 196
    .line 197
    .line 198
    new-instance p2, Ljava/lang/RuntimeException;

    .line 199
    .line 200
    invoke-direct {p2, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 201
    .line 202
    .line 203
    throw p2
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 204
    :goto_1
    new-instance p2, Ljava/lang/StringBuilder;

    .line 205
    .line 206
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 207
    .line 208
    .line 209
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 210
    .line 211
    .line 212
    move-result-object p1

    .line 213
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 214
    .line 215
    .line 216
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object p1

    .line 220
    invoke-static {v4, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 221
    .line 222
    .line 223
    goto :goto_3

    .line 224
    :goto_2
    new-instance p2, Ljava/lang/StringBuilder;

    .line 225
    .line 226
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 227
    .line 228
    .line 229
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 230
    .line 231
    .line 232
    move-result-object p1

    .line 233
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 234
    .line 235
    .line 236
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 237
    .line 238
    .line 239
    move-result-object p1

    .line 240
    invoke-static {v4, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 241
    .line 242
    .line 243
    sget-object p1, Ll/r94;->a:Ljava/util/Map;

    .line 244
    .line 245
    const/4 p2, 0x2

    .line 246
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 247
    .line 248
    .line 249
    move-result-object v1

    .line 250
    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 251
    .line 252
    .line 253
    move-result-object p1

    .line 254
    check-cast p1, Ljava/lang/String;

    .line 255
    .line 256
    invoke-direct {p0, p2, p1}, Ll/diw;->l0(ILjava/lang/String;)V

    .line 257
    .line 258
    .line 259
    iget-object p1, p0, Ll/diw;->D:Ll/ypl$e;

    .line 260
    .line 261
    if-eqz p1, :cond_2

    .line 262
    .line 263
    const/16 p2, 0xfa2

    .line 264
    .line 265
    invoke-interface {p1, p2, v0}, Ll/ypl$e;->onFail(ILjava/lang/String;)V

    .line 266
    .line 267
    .line 268
    :cond_2
    :goto_3
    iput-boolean v3, p0, Ll/diw;->F:Z

    .line 269
    .line 270
    :cond_3
    return v3
.end method

.method public p(Ll/ypl$e;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/diw;->D:Ll/ypl$e;

    .line 2
    .line 3
    return-void
.end method

.method public p0(Landroid/content/Context;)V
    .locals 1
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x15
    .end annotation

    .line 1
    iput-object p1, p0, Ll/diw;->w:Landroid/content/Context;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const-string v0, "camera"

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Landroid/hardware/camera2/CameraManager;

    .line 12
    .line 13
    iput-object p1, p0, Ll/diw;->h:Landroid/hardware/camera2/CameraManager;

    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public q(Ll/ypl$d;)V
    .locals 0

    .line 1
    return-void
.end method

.method public q0(Ll/diw$h;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/diw;->v:Ll/diw$h;

    .line 2
    .line 3
    return-void
.end method

.method public r(Ll/ypl$c;)V
    .locals 0

    .line 1
    return-void
.end method

.method public s(I)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public t(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/diw;->k0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public u(ILl/qow;)Z
    .locals 0
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x15
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/diw;->a()I

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1, p2}, Ll/diw;->C(ILl/qow;)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    return p0
.end method

.method public v()Z
    .locals 0
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x15
    .end annotation

    .line 1
    iget-object p0, p0, Ll/diw;->B:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public w(Ll/ypl$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/diw;->b:Ll/ypl$a;

    .line 2
    .line 3
    return-void
.end method

.method public x()Ll/crf0;
    .locals 2

    .line 1
    new-instance v0, Ll/crf0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/diw;->a:Ll/sow;

    .line 4
    .line 5
    iget v1, p0, Ll/sow;->b:I

    .line 6
    .line 7
    iget p0, p0, Ll/sow;->c:I

    .line 8
    .line 9
    invoke-direct {v0, v1, p0}, Ll/crf0;-><init>(II)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method public y()Z
    .locals 1
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x15
    .end annotation

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-direct {p0, v0}, Ll/diw;->i0(I)Z

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    return p0
.end method
