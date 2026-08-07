.class public Ll/ciw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/xpl;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/ciw$h;
    }
.end annotation


# instance fields
.field A:[B

.field B:Landroid/media/ImageReader$OnImageAvailableListener;

.field private C:Ljava/lang/Boolean;

.field private D:Landroid/hardware/camera2/CaptureRequest;

.field private E:Ll/xpl$c;

.field private F:Ljava/util/concurrent/Semaphore;

.field private G:Z

.field private H:Landroid/hardware/camera2/CameraCaptureSession$StateCallback;

.field private I:Ll/row;

.field private J:Z

.field private K:Z

.field private L:Ljava/lang/Integer;

.field private M:Ljava/lang/Runnable;

.field private N:J

.field private O:Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

.field private P:Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

.field private a:Ll/tow;

.field private b:Ll/xpl$a;

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

.field private r:Ll/erf0;

.field private s:Landroid/graphics/Rect;

.field private t:I

.field private u:Landroid/os/HandlerThread;

.field v:Ll/ciw$h;

.field private w:Landroid/content/Context;

.field private x:I

.field private final y:Ljava/lang/Object;

.field z:Landroid/hardware/camera2/CameraDevice$StateCallback;


# direct methods
.method public constructor <init>(Ll/tow;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Ll/ciw;->e:I

    .line 6
    .line 7
    iput v0, p0, Ll/ciw;->j:I

    .line 8
    .line 9
    const/4 v1, 0x2

    .line 10
    iput v1, p0, Ll/ciw;->k:I

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    iput v1, p0, Ll/ciw;->m:I

    .line 14
    .line 15
    iput v1, p0, Ll/ciw;->n:I

    .line 16
    .line 17
    iput v0, p0, Ll/ciw;->o:I

    .line 18
    .line 19
    iput v1, p0, Ll/ciw;->p:I

    .line 20
    .line 21
    iput v1, p0, Ll/ciw;->q:I

    .line 22
    .line 23
    new-instance v2, Landroid/graphics/Rect;

    .line 24
    .line 25
    invoke-direct {v2, v1, v1, v0, v0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 26
    .line 27
    .line 28
    iput-object v2, p0, Ll/ciw;->s:Landroid/graphics/Rect;

    .line 29
    .line 30
    iput v1, p0, Ll/ciw;->t:I

    .line 31
    .line 32
    const/4 v2, 0x0

    .line 33
    iput-object v2, p0, Ll/ciw;->u:Landroid/os/HandlerThread;

    .line 34
    .line 35
    iput-object v2, p0, Ll/ciw;->v:Ll/ciw$h;

    .line 36
    .line 37
    iput-object v2, p0, Ll/ciw;->w:Landroid/content/Context;

    .line 38
    .line 39
    iput v1, p0, Ll/ciw;->x:I

    .line 40
    .line 41
    new-instance v3, Ljava/lang/Object;

    .line 42
    .line 43
    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    .line 44
    .line 45
    .line 46
    iput-object v3, p0, Ll/ciw;->y:Ljava/lang/Object;

    .line 47
    .line 48
    new-instance v3, Ll/ciw$a;

    .line 49
    .line 50
    invoke-direct {v3, p0}, Ll/ciw$a;-><init>(Ll/ciw;)V

    .line 51
    .line 52
    .line 53
    iput-object v3, p0, Ll/ciw;->z:Landroid/hardware/camera2/CameraDevice$StateCallback;

    .line 54
    .line 55
    iput-object v2, p0, Ll/ciw;->A:[B

    .line 56
    .line 57
    new-instance v3, Ll/ciw$b;

    .line 58
    .line 59
    invoke-direct {v3, p0}, Ll/ciw$b;-><init>(Ll/ciw;)V

    .line 60
    .line 61
    .line 62
    iput-object v3, p0, Ll/ciw;->B:Landroid/media/ImageReader$OnImageAvailableListener;

    .line 63
    .line 64
    iput-object v2, p0, Ll/ciw;->E:Ll/xpl$c;

    .line 65
    .line 66
    new-instance v3, Ljava/util/concurrent/Semaphore;

    .line 67
    .line 68
    invoke-direct {v3, v0}, Ljava/util/concurrent/Semaphore;-><init>(I)V

    .line 69
    .line 70
    .line 71
    iput-object v3, p0, Ll/ciw;->F:Ljava/util/concurrent/Semaphore;

    .line 72
    .line 73
    iput-boolean v1, p0, Ll/ciw;->G:Z

    .line 74
    .line 75
    new-instance v3, Ll/ciw$c;

    .line 76
    .line 77
    invoke-direct {v3, p0}, Ll/ciw$c;-><init>(Ll/ciw;)V

    .line 78
    .line 79
    .line 80
    iput-object v3, p0, Ll/ciw;->H:Landroid/hardware/camera2/CameraCaptureSession$StateCallback;

    .line 81
    .line 82
    iput-boolean v1, p0, Ll/ciw;->J:Z

    .line 83
    .line 84
    iput-boolean v0, p0, Ll/ciw;->K:Z

    .line 85
    .line 86
    iput-object v2, p0, Ll/ciw;->L:Ljava/lang/Integer;

    .line 87
    .line 88
    new-instance v0, Ll/ciw$d;

    .line 89
    .line 90
    invoke-direct {v0, p0}, Ll/ciw$d;-><init>(Ll/ciw;)V

    .line 91
    .line 92
    .line 93
    iput-object v0, p0, Ll/ciw;->M:Ljava/lang/Runnable;

    .line 94
    .line 95
    const-wide/16 v0, 0x0

    .line 96
    .line 97
    iput-wide v0, p0, Ll/ciw;->N:J

    .line 98
    .line 99
    new-instance v0, Ll/ciw$f;

    .line 100
    .line 101
    invoke-direct {v0, p0}, Ll/ciw$f;-><init>(Ll/ciw;)V

    .line 102
    .line 103
    .line 104
    iput-object v0, p0, Ll/ciw;->O:Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    .line 105
    .line 106
    new-instance v0, Ll/ciw$g;

    .line 107
    .line 108
    invoke-direct {v0, p0}, Ll/ciw$g;-><init>(Ll/ciw;)V

    .line 109
    .line 110
    .line 111
    iput-object v0, p0, Ll/ciw;->P:Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    .line 112
    .line 113
    iput-object p1, p0, Ll/ciw;->a:Ll/tow;

    .line 114
    .line 115
    invoke-static {}, Lcom/core/glcore/util/Camera2Helpler;->getCameraCnt()I

    .line 116
    .line 117
    .line 118
    move-result p1

    .line 119
    iput p1, p0, Ll/ciw;->m:I

    .line 120
    .line 121
    return-void
.end method

.method public static synthetic A(Ll/ciw;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ciw;->R()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic B(Ll/ciw;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/ciw;->K:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic C(Ll/ciw;)Z
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ciw;->T()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic D(Ll/ciw;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ciw;->U()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic M(Ll/ciw;ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/ciw;->a0(ILjava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic N(Ll/ciw;)Ll/xpl$c;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ciw;->E:Ll/xpl$c;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic O(Ll/ciw;)Ll/xpl$a;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ciw;->b:Ll/xpl$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic P(Ll/ciw;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ciw;->J:Z

    .line 2
    .line 3
    return p0
.end method

.method private R()V
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
    iget-object v5, p0, Ll/ciw;->g:Landroid/hardware/camera2/CameraDevice;

    .line 13
    .line 14
    invoke-virtual {v5, v2}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 15
    .line 16
    .line 17
    move-result-object v5

    .line 18
    iput-object v5, p0, Ll/ciw;->l:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 19
    .line 20
    iget-object v6, p0, Ll/ciw;->f:Landroid/media/ImageReader;

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
    iget-object v5, p0, Ll/ciw;->g:Landroid/hardware/camera2/CameraDevice;

    .line 30
    .line 31
    iget-object v6, p0, Ll/ciw;->f:Landroid/media/ImageReader;

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
    iget-object v7, p0, Ll/ciw;->H:Landroid/hardware/camera2/CameraCaptureSession$StateCallback;

    .line 46
    .line 47
    iget-object v8, p0, Ll/ciw;->c:Landroid/os/Handler;

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
    sget-object v0, Ll/s94;->a:Ljava/util/Map;

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
    invoke-direct {p0, v2, v0}, Ll/ciw;->a0(ILjava/lang/String;)V

    .line 85
    .line 86
    .line 87
    iget-object p0, p0, Ll/ciw;->E:Ll/xpl$c;

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
    invoke-interface {p0, v4, v0}, Ll/xpl$c;->onFail(ILjava/lang/String;)V

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
    sget-object v0, Ll/s94;->a:Ljava/util/Map;

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
    invoke-direct {p0, v2, v0}, Ll/ciw;->a0(ILjava/lang/String;)V

    .line 139
    .line 140
    .line 141
    iget-object p0, p0, Ll/ciw;->E:Ll/xpl$c;

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
    invoke-interface {p0, v4, v0}, Ll/xpl$c;->onFail(ILjava/lang/String;)V

    .line 162
    .line 163
    .line 164
    :cond_0
    :goto_2
    return-void
.end method

.method private S()V
    .locals 4

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/ciw;->g:Landroid/hardware/camera2/CameraDevice;

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
    iget-object v1, p0, Ll/ciw;->f:Landroid/media/ImageReader;

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
    invoke-direct {p0, v0}, Ll/ciw;->d0(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 31
    .line 32
    .line 33
    new-instance v1, Ll/ciw$e;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/ciw$e;-><init>(Ll/ciw;)V

    .line 36
    .line 37
    .line 38
    iget-object v2, p0, Ll/ciw;->i:Landroid/hardware/camera2/CameraCaptureSession;

    .line 39
    .line 40
    invoke-virtual {v2}, Landroid/hardware/camera2/CameraCaptureSession;->stopRepeating()V

    .line 41
    .line 42
    .line 43
    iget-object v2, p0, Ll/ciw;->i:Landroid/hardware/camera2/CameraCaptureSession;

    .line 44
    .line 45
    invoke-virtual {v2}, Landroid/hardware/camera2/CameraCaptureSession;->abortCaptures()V

    .line 46
    .line 47
    .line 48
    iget-object v2, p0, Ll/ciw;->i:Landroid/hardware/camera2/CameraCaptureSession;

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
    iget-object p0, p0, Ll/ciw;->E:Ll/xpl$c;

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
    invoke-interface {p0, v1, v0}, Ll/xpl$c;->onFail(ILjava/lang/String;)V

    .line 106
    .line 107
    .line 108
    :cond_1
    :goto_0
    return-void
.end method

.method private T()Z
    .locals 7
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x15
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ciw;->h:Landroid/hardware/camera2/CameraManager;

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
    iget-object v5, p0, Ll/ciw;->h:Landroid/hardware/camera2/CameraManager;

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
    iget v5, p0, Ll/ciw;->e:I

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
    iget v5, p0, Ll/ciw;->e:I

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
    sget-object v0, Ll/s94;->a:Ljava/util/Map;

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
    invoke-direct {p0, v2, v0}, Ll/ciw;->a0(ILjava/lang/String;)V

    .line 111
    .line 112
    .line 113
    iget-object p0, p0, Ll/ciw;->E:Ll/xpl$c;

    .line 114
    .line 115
    if-eqz p0, :cond_2

    .line 116
    .line 117
    const/16 v0, 0xfa7

    .line 118
    .line 119
    invoke-interface {p0, v0, v3}, Ll/xpl$c;->onFail(ILjava/lang/String;)V

    .line 120
    .line 121
    .line 122
    :cond_2
    return v1
.end method

.method private U()V
    .locals 0

    .line 1
    return-void
.end method

.method private W()F
    .locals 2
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x15
    .end annotation

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/ciw;->h:Landroid/hardware/camera2/CameraManager;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    iget p0, p0, Ll/ciw;->e:I

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

.method private X()Z
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-direct {p0, v0}, Ll/ciw;->Y(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-nez v0, :cond_1

    .line 7
    .line 8
    invoke-direct {p0}, Ll/ciw;->W()F

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

.method private Y(I)Z
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
    iget-object v3, p0, Ll/ciw;->h:Landroid/hardware/camera2/CameraManager;

    .line 7
    .line 8
    new-instance v4, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 11
    .line 12
    .line 13
    iget p0, p0, Ll/ciw;->e:I

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

.method private a0(ILjava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ciw;->v:Ll/ciw$h;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Ll/ciw$h;->a(ILjava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method private b0()V
    .locals 1
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x15
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/ciw;->a()I

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p0, v0}, Ll/ciw;->j(Landroid/graphics/SurfaceTexture;)Z

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private c0()V
    .locals 3

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/ciw;->l:Landroid/hardware/camera2/CaptureRequest$Builder;

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
    iput v0, p0, Ll/ciw;->x:I

    .line 15
    .line 16
    iget-object v0, p0, Ll/ciw;->i:Landroid/hardware/camera2/CameraCaptureSession;

    .line 17
    .line 18
    iget-object v1, p0, Ll/ciw;->l:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 19
    .line 20
    invoke-virtual {v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iget-object v2, p0, Ll/ciw;->O:Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    .line 25
    .line 26
    iget-object p0, p0, Ll/ciw;->c:Landroid/os/Handler;

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

.method private d0(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ciw;->C:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic f(Ll/ciw;)Ljava/util/concurrent/Semaphore;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ciw;->F:Ljava/util/concurrent/Semaphore;

    .line 2
    .line 3
    return-object p0
.end method

.method private declared-synchronized g0()V
    .locals 6

    .line 1
    const-string v0, "Camera2 startNormalPreview failed !"

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/ciw;->l:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    iget-object v2, p0, Ll/ciw;->i:Landroid/hardware/camera2/CameraCaptureSession;

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
    iget-object v1, p0, Ll/ciw;->l:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 23
    .line 24
    sget-object v2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_TARGET_FPS_RANGE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 25
    .line 26
    new-instance v3, Landroid/util/Range;

    .line 27
    .line 28
    iget-object v4, p0, Ll/ciw;->a:Ll/tow;

    .line 29
    .line 30
    iget v4, v4, Ll/tow;->U:I

    .line 31
    .line 32
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    iget-object v5, p0, Ll/ciw;->a:Ll/tow;

    .line 37
    .line 38
    iget v5, v5, Ll/tow;->T:I

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
    iget-object v1, p0, Ll/ciw;->l:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 51
    .line 52
    invoke-virtual {v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    iput-object v1, p0, Ll/ciw;->D:Landroid/hardware/camera2/CaptureRequest;

    .line 57
    .line 58
    iget-object v2, p0, Ll/ciw;->i:Landroid/hardware/camera2/CameraCaptureSession;

    .line 59
    .line 60
    iget-object v3, p0, Ll/ciw;->O:Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    .line 61
    .line 62
    iget-object v4, p0, Ll/ciw;->c:Landroid/os/Handler;

    .line 63
    .line 64
    invoke-virtual {v2, v1, v3, v4}, Landroid/hardware/camera2/CameraCaptureSession;->setRepeatingRequest(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I

    .line 65
    .line 66
    .line 67
    const/4 v1, 0x0

    .line 68
    iput-boolean v1, p0, Ll/ciw;->J:Z
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

.method private i0()V
    .locals 4

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/ciw;->l:Landroid/hardware/camera2/CaptureRequest$Builder;

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
    iget-object v0, p0, Ll/ciw;->l:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 14
    .line 15
    invoke-direct {p0, v0}, Ll/ciw;->d0(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/ciw;->i:Landroid/hardware/camera2/CameraCaptureSession;

    .line 19
    .line 20
    iget-object v1, p0, Ll/ciw;->l:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 21
    .line 22
    invoke-virtual {v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iget-object v2, p0, Ll/ciw;->O:Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    .line 27
    .line 28
    iget-object v3, p0, Ll/ciw;->c:Landroid/os/Handler;

    .line 29
    .line 30
    invoke-virtual {v0, v1, v2, v3}, Landroid/hardware/camera2/CameraCaptureSession;->capture(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I

    .line 31
    .line 32
    .line 33
    const/4 v0, 0x0

    .line 34
    iput v0, p0, Ll/ciw;->x:I

    .line 35
    .line 36
    iget-object v0, p0, Ll/ciw;->i:Landroid/hardware/camera2/CameraCaptureSession;

    .line 37
    .line 38
    iget-object v1, p0, Ll/ciw;->D:Landroid/hardware/camera2/CaptureRequest;

    .line 39
    .line 40
    iget-object v2, p0, Ll/ciw;->O:Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    .line 41
    .line 42
    iget-object v3, p0, Ll/ciw;->c:Landroid/os/Handler;

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
    iget-object p0, p0, Ll/ciw;->E:Ll/xpl$c;

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
    invoke-interface {p0, v1, v0}, Ll/xpl$c;->onFail(ILjava/lang/String;)V

    .line 95
    .line 96
    .line 97
    :cond_0
    return-void
.end method

.method public static synthetic l(Ll/ciw;)Landroid/hardware/camera2/CameraDevice;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ciw;->g:Landroid/hardware/camera2/CameraDevice;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic n(Ll/ciw;Landroid/hardware/camera2/CameraCaptureSession;)Landroid/hardware/camera2/CameraCaptureSession;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ciw;->i:Landroid/hardware/camera2/CameraCaptureSession;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic o(Ll/ciw;Landroid/hardware/camera2/CameraDevice;)Landroid/hardware/camera2/CameraDevice;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ciw;->g:Landroid/hardware/camera2/CameraDevice;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic p(Ll/ciw;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ciw;->g0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic q(Ll/ciw;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ciw;->i0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic r(Ll/ciw;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/ciw;->x:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic s(Ll/ciw;I)I
    .locals 0

    .line 1
    iput p1, p0, Ll/ciw;->x:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic t(Ll/ciw;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/ciw;->N:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic u(Ll/ciw;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/ciw;->N:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic v(Ll/ciw;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ciw;->L:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic w(Ll/ciw;Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ciw;->L:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic x(Ll/ciw;)Landroid/hardware/camera2/CaptureRequest$Builder;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ciw;->l:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic y(Ll/ciw;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ciw;->S()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic z(Ll/ciw;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ciw;->c0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public declared-synchronized E(ILl/row;)Z
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
    iget-object p2, p0, Ll/ciw;->h:Landroid/hardware/camera2/CameraManager;

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
    iget-object v3, p0, Ll/ciw;->h:Landroid/hardware/camera2/CameraManager;

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
    iget v3, p0, Ll/ciw;->e:I

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
    iput-boolean v4, p0, Ll/ciw;->J:Z

    .line 56
    .line 57
    iput p1, p0, Ll/ciw;->e:I

    .line 58
    .line 59
    invoke-direct {p0}, Ll/ciw;->b0()V

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
    iget v3, p0, Ll/ciw;->e:I

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
    iput-boolean v4, p0, Ll/ciw;->J:Z

    .line 86
    .line 87
    iput v4, p0, Ll/ciw;->e:I

    .line 88
    .line 89
    invoke-direct {p0}, Ll/ciw;->b0()V
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
    sget-object p2, Ll/s94;->a:Ljava/util/Map;

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
    invoke-direct {p0, v0, p2}, Ll/ciw;->a0(ILjava/lang/String;)V

    .line 136
    .line 137
    .line 138
    iget-object p2, p0, Ll/ciw;->E:Ll/xpl$c;

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
    invoke-interface {p2, v1, v0}, Ll/xpl$c;->onFail(ILjava/lang/String;)V
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

.method public F(ILl/row;)Z
    .locals 0
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x15
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/ciw;->a()I

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1, p2}, Ll/ciw;->G(ILl/row;)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    return p0
.end method

.method public declared-synchronized G(ILl/row;)Z
    .locals 7
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x13
    .end annotation

    .line 1
    const-string v0, "Camera2 prepare mrCoreParameters.encodeWidth = "

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    iput-object p2, p0, Ll/ciw;->I:Ll/row;

    .line 5
    .line 6
    iget v1, p0, Ll/ciw;->m:I

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    sub-int/2addr v1, v2

    .line 10
    invoke-virtual {p2}, Ll/row;->a()I

    .line 11
    .line 12
    .line 13
    move-result v3

    .line 14
    if-lt v1, v3, :cond_0

    .line 15
    .line 16
    invoke-virtual {p2}, Ll/row;->a()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    iput v1, p0, Ll/ciw;->e:I

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
    iget-object v1, p0, Ll/ciw;->c:Landroid/os/Handler;

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
    iput-object v1, p0, Ll/ciw;->u:Landroid/os/HandlerThread;

    .line 38
    .line 39
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 40
    .line 41
    .line 42
    new-instance v1, Landroid/os/Handler;

    .line 43
    .line 44
    iget-object v3, p0, Ll/ciw;->u:Landroid/os/HandlerThread;

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
    iput-object v1, p0, Ll/ciw;->c:Landroid/os/Handler;

    .line 54
    .line 55
    :cond_1
    iget-object v1, p0, Ll/ciw;->d:Landroid/os/Handler;

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
    iput-object v1, p0, Ll/ciw;->d:Landroid/os/Handler;

    .line 69
    .line 70
    :cond_2
    iput p1, p0, Ll/ciw;->t:I

    .line 71
    .line 72
    invoke-virtual {p0, p1}, Ll/ciw;->Q(I)V

    .line 73
    .line 74
    .line 75
    iget-object p1, p0, Ll/ciw;->a:Ll/tow;

    .line 76
    .line 77
    invoke-virtual {p2}, Ll/row;->f()Ll/erf0;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-virtual {v1}, Ll/erf0;->b()I

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    iput v1, p1, Ll/tow;->e:I

    .line 86
    .line 87
    iget-object p1, p0, Ll/ciw;->a:Ll/tow;

    .line 88
    .line 89
    invoke-virtual {p2}, Ll/row;->f()Ll/erf0;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    invoke-virtual {v1}, Ll/erf0;->a()I

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    iput v1, p1, Ll/tow;->f:I

    .line 98
    .line 99
    iget-object p1, p0, Ll/ciw;->h:Landroid/hardware/camera2/CameraManager;

    .line 100
    .line 101
    if-eqz p1, :cond_4

    .line 102
    .line 103
    invoke-virtual {p0}, Ll/ciw;->V()Landroid/hardware/camera2/CameraCharacteristics;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    iget-object v1, p0, Ll/ciw;->a:Ll/tow;

    .line 108
    .line 109
    new-instance v3, Landroid/util/Size;

    .line 110
    .line 111
    invoke-virtual {p2}, Ll/row;->f()Ll/erf0;

    .line 112
    .line 113
    .line 114
    move-result-object v4

    .line 115
    invoke-virtual {v4}, Ll/erf0;->b()I

    .line 116
    .line 117
    .line 118
    move-result v4

    .line 119
    invoke-virtual {p2}, Ll/row;->f()Ll/erf0;

    .line 120
    .line 121
    .line 122
    move-result-object v5

    .line 123
    invoke-virtual {v5}, Ll/erf0;->a()I

    .line 124
    .line 125
    .line 126
    move-result v5

    .line 127
    invoke-direct {v3, v4, v5}, Landroid/util/Size;-><init>(II)V

    .line 128
    .line 129
    .line 130
    invoke-static {p1, v1, v3}, Lcom/core/glcore/util/Camera2Helpler;->selectCameraPreviewWH(Landroid/hardware/camera2/CameraCharacteristics;Ll/tow;Landroid/util/Size;)Landroid/util/Size;

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
    iget-object v1, p0, Ll/ciw;->a:Ll/tow;

    .line 140
    .line 141
    invoke-virtual {p1}, Landroid/util/Size;->getWidth()I

    .line 142
    .line 143
    .line 144
    move-result v3

    .line 145
    iput v3, v1, Ll/tow;->e:I

    .line 146
    .line 147
    iget-object v1, p0, Ll/ciw;->a:Ll/tow;

    .line 148
    .line 149
    invoke-virtual {p1}, Landroid/util/Size;->getHeight()I

    .line 150
    .line 151
    .line 152
    move-result p1

    .line 153
    iput p1, v1, Ll/tow;->f:I

    .line 154
    .line 155
    :cond_4
    iget-object p1, p0, Ll/ciw;->a:Ll/tow;

    .line 156
    .line 157
    iget v1, p1, Ll/tow;->e:I

    .line 158
    .line 159
    iget p1, p1, Ll/tow;->f:I

    .line 160
    .line 161
    new-instance v3, Ll/erf0;

    .line 162
    .line 163
    invoke-direct {v3, v1, p1}, Ll/erf0;-><init>(II)V

    .line 164
    .line 165
    .line 166
    iput-object v3, p0, Ll/ciw;->r:Ll/erf0;

    .line 167
    .line 168
    iget-object v3, p0, Ll/ciw;->f:Landroid/media/ImageReader;

    .line 169
    .line 170
    const/4 v4, 0x3

    .line 171
    if-nez v3, :cond_5

    .line 172
    .line 173
    iget-object v3, p0, Ll/ciw;->a:Ll/tow;

    .line 174
    .line 175
    iget v5, v3, Ll/tow;->e:I

    .line 176
    .line 177
    iget v3, v3, Ll/tow;->f:I

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
    iput-object v3, p0, Ll/ciw;->f:Landroid/media/ImageReader;

    .line 186
    .line 187
    iget-object v5, p0, Ll/ciw;->B:Landroid/media/ImageReader$OnImageAvailableListener;

    .line 188
    .line 189
    iget-object v6, p0, Ll/ciw;->c:Landroid/os/Handler;

    .line 190
    .line 191
    invoke-virtual {v3, v5, v6}, Landroid/media/ImageReader;->setOnImageAvailableListener(Landroid/media/ImageReader$OnImageAvailableListener;Landroid/os/Handler;)V

    .line 192
    .line 193
    .line 194
    :cond_5
    invoke-virtual {p2}, Ll/row;->d()I

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
    invoke-virtual {p2}, Ll/row;->e()F

    .line 202
    .line 203
    .line 204
    move-result v3

    .line 205
    mul-float/2addr v1, v3

    .line 206
    float-to-int v1, v1

    .line 207
    iget-object v3, p0, Ll/ciw;->a:Ll/tow;

    .line 208
    .line 209
    iget v3, v3, Ll/tow;->e:I

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
    invoke-virtual {p2}, Ll/row;->d()I

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
    invoke-virtual {p2}, Ll/row;->e()F

    .line 226
    .line 227
    .line 228
    move-result v3

    .line 229
    div-float/2addr p1, v3

    .line 230
    float-to-int p1, p1

    .line 231
    iget-object v3, p0, Ll/ciw;->a:Ll/tow;

    .line 232
    .line 233
    iget v3, v3, Ll/tow;->f:I

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
    iget v3, p0, Ll/ciw;->p:I

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
    new-instance v3, Ll/erf0;

    .line 249
    .line 250
    invoke-direct {v3, v1, p1}, Ll/erf0;-><init>(II)V

    .line 251
    .line 252
    .line 253
    goto :goto_3

    .line 254
    :cond_9
    :goto_2
    new-instance v3, Ll/erf0;

    .line 255
    .line 256
    invoke-direct {v3, p1, v1}, Ll/erf0;-><init>(II)V

    .line 257
    .line 258
    .line 259
    :goto_3
    iget-object p1, p0, Ll/ciw;->a:Ll/tow;

    .line 260
    .line 261
    iget-boolean p1, p1, Ll/tow;->Z:Z

    .line 262
    .line 263
    if-eqz p1, :cond_a

    .line 264
    .line 265
    invoke-virtual {v3}, Ll/erf0;->b()I

    .line 266
    .line 267
    .line 268
    move-result p1

    .line 269
    if-lez p1, :cond_b

    .line 270
    .line 271
    invoke-virtual {v3}, Ll/erf0;->a()I

    .line 272
    .line 273
    .line 274
    move-result p1

    .line 275
    if-lez p1, :cond_b

    .line 276
    .line 277
    iget-object p1, p0, Ll/ciw;->a:Ll/tow;

    .line 278
    .line 279
    invoke-virtual {v3}, Ll/erf0;->b()I

    .line 280
    .line 281
    .line 282
    move-result v1

    .line 283
    iput v1, p1, Ll/tow;->m:I

    .line 284
    .line 285
    iget-object p1, p0, Ll/ciw;->a:Ll/tow;

    .line 286
    .line 287
    invoke-virtual {v3}, Ll/erf0;->a()I

    .line 288
    .line 289
    .line 290
    move-result v1

    .line 291
    iput v1, p1, Ll/tow;->n:I

    .line 292
    .line 293
    invoke-virtual {p2, v3}, Ll/row;->r(Ll/erf0;)V

    .line 294
    .line 295
    .line 296
    goto :goto_4

    .line 297
    :cond_a
    invoke-virtual {p2}, Ll/row;->b()Ll/erf0;

    .line 298
    .line 299
    .line 300
    move-result-object p1

    .line 301
    if-eqz p1, :cond_b

    .line 302
    .line 303
    invoke-virtual {p1}, Ll/erf0;->b()I

    .line 304
    .line 305
    .line 306
    move-result p2

    .line 307
    if-lez p2, :cond_b

    .line 308
    .line 309
    invoke-virtual {p1}, Ll/erf0;->a()I

    .line 310
    .line 311
    .line 312
    move-result p2

    .line 313
    if-lez p2, :cond_b

    .line 314
    .line 315
    iget-object p2, p0, Ll/ciw;->a:Ll/tow;

    .line 316
    .line 317
    invoke-virtual {p1}, Ll/erf0;->b()I

    .line 318
    .line 319
    .line 320
    move-result v1

    .line 321
    iput v1, p2, Ll/tow;->m:I

    .line 322
    .line 323
    iget-object p2, p0, Ll/ciw;->a:Ll/tow;

    .line 324
    .line 325
    invoke-virtual {p1}, Ll/erf0;->a()I

    .line 326
    .line 327
    .line 328
    move-result p1

    .line 329
    iput p1, p2, Ll/tow;->n:I

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
    iget-object v0, p0, Ll/ciw;->a:Ll/tow;

    .line 339
    .line 340
    iget v0, v0, Ll/tow;->m:I

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
    iget-object v0, p0, Ll/ciw;->a:Ll/tow;

    .line 351
    .line 352
    iget v0, v0, Ll/tow;->n:I

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

.method public declared-synchronized H()V
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
    invoke-virtual {p0, v0}, Ll/ciw;->j(Landroid/graphics/SurfaceTexture;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 4
    .line 5
    .line 6
    monitor-exit p0

    .line 7
    return-void

    .line 8
    :catchall_0
    move-exception v0

    .line 9
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 10
    throw v0
.end method

.method public I(Ll/xpl$d;)V
    .locals 0

    .line 1
    return-void
.end method

.method public J(Ll/xpl$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ciw;->E:Ll/xpl$c;

    .line 2
    .line 3
    return-void
.end method

.method public K(Ll/xpl$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ciw;->b:Ll/xpl$a;

    .line 2
    .line 3
    return-void
.end method

.method public declared-synchronized L()V
    .locals 1
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
    invoke-virtual {p0}, Ll/ciw;->a()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    .line 5
    monitor-exit p0

    .line 6
    return-void

    .line 7
    :catchall_0
    move-exception v0

    .line 8
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 9
    throw v0
.end method

.method public Q(I)V
    .locals 3
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x15
    .end annotation

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/ciw;->h:Landroid/hardware/camera2/CameraManager;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    iget v2, p0, Ll/ciw;->e:I

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
    invoke-virtual {p0}, Ll/ciw;->i()Z

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
    iput p1, p0, Ll/ciw;->q:I

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
    iput v0, p0, Ll/ciw;->q:I

    .line 62
    .line 63
    :goto_0
    sget-object p1, Lcom/core/glcore/config/Rotation;->NORMAL:Lcom/core/glcore/config/Rotation;

    .line 64
    .line 65
    iget v0, p0, Ll/ciw;->q:I

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
    sget-object p1, Lcom/core/glcore/config/Rotation;->ROTATION_270:Lcom/core/glcore/config/Rotation;

    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_2
    sget-object p1, Lcom/core/glcore/config/Rotation;->ROTATION_180:Lcom/core/glcore/config/Rotation;

    .line 84
    .line 85
    goto :goto_1

    .line 86
    :cond_3
    sget-object p1, Lcom/core/glcore/config/Rotation;->ROTATION_90:Lcom/core/glcore/config/Rotation;

    .line 87
    .line 88
    :goto_1
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    iput p1, p0, Ll/ciw;->p:I
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
    sget-object p1, Ll/s94;->a:Ljava/util/Map;

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
    invoke-direct {p0, v0, p1}, Ll/ciw;->a0(ILjava/lang/String;)V

    .line 132
    .line 133
    .line 134
    iget-object p0, p0, Ll/ciw;->E:Ll/xpl$c;

    .line 135
    .line 136
    if-eqz p0, :cond_4

    .line 137
    .line 138
    const/16 p1, 0xfa5

    .line 139
    .line 140
    invoke-interface {p0, p1, v1}, Ll/xpl$c;->onFail(ILjava/lang/String;)V

    .line 141
    .line 142
    .line 143
    :cond_4
    return-void
.end method

.method public V()Landroid/hardware/camera2/CameraCharacteristics;
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/ciw;->h:Landroid/hardware/camera2/CameraManager;

    .line 2
    .line 3
    iget p0, p0, Ll/ciw;->e:I

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

.method public Z()V
    .locals 5

    .line 1
    const-string v0, "Camera"

    .line 2
    .line 3
    :try_start_0
    iget-object v1, p0, Ll/ciw;->l:Landroid/hardware/camera2/CaptureRequest$Builder;

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
    iget-object v1, p0, Ll/ciw;->l:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 16
    .line 17
    invoke-virtual {v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iget-object v3, p0, Ll/ciw;->l:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 22
    .line 23
    const/4 v4, 0x0

    .line 24
    invoke-virtual {v3, v2, v4}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    iget-object v2, p0, Ll/ciw;->i:Landroid/hardware/camera2/CameraCaptureSession;

    .line 28
    .line 29
    iget-object v3, p0, Ll/ciw;->O:Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    .line 30
    .line 31
    iget-object v4, p0, Ll/ciw;->c:Landroid/os/Handler;

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
    iget-object p0, p0, Ll/ciw;->E:Ll/xpl$c;

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
    invoke-interface {p0, v2, v1}, Ll/xpl$c;->onFail(ILjava/lang/String;)V

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
    iget-object v0, p0, Ll/ciw;->i:Landroid/hardware/camera2/CameraCaptureSession;

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
    iput-object v1, p0, Ll/ciw;->i:Landroid/hardware/camera2/CameraCaptureSession;

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
    iget-object v0, p0, Ll/ciw;->g:Landroid/hardware/camera2/CameraDevice;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/hardware/camera2/CameraDevice;->close()V

    .line 20
    .line 21
    .line 22
    iput-object v1, p0, Ll/ciw;->g:Landroid/hardware/camera2/CameraDevice;

    .line 23
    .line 24
    :cond_1
    const/4 v0, 0x0

    .line 25
    iput-boolean v0, p0, Ll/ciw;->G:Z

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

.method public e0(Landroid/content/Context;)V
    .locals 1
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x15
    .end annotation

    .line 1
    iput-object p1, p0, Ll/ciw;->w:Landroid/content/Context;

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
    iput-object p1, p0, Ll/ciw;->h:Landroid/hardware/camera2/CameraManager;

    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public f0(Ll/ciw$h;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ciw;->v:Ll/ciw$h;

    .line 2
    .line 3
    return-void
.end method

.method public g()I
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ciw;->V()Landroid/hardware/camera2/CameraCharacteristics;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_AE_COMPENSATION_RANGE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 9
    .line 10
    invoke-virtual {p0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Landroid/util/Range;

    .line 15
    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Ljava/lang/Integer;

    .line 23
    .line 24
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    return p0

    .line 29
    :cond_0
    return v0
.end method

.method public h()I
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ciw;->V()Landroid/hardware/camera2/CameraCharacteristics;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_AE_COMPENSATION_RANGE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 9
    .line 10
    invoke-virtual {p0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Landroid/util/Range;

    .line 15
    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Ljava/lang/Integer;

    .line 23
    .line 24
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    return p0

    .line 29
    :cond_0
    return v0
.end method

.method public h0(Landroid/graphics/SurfaceTexture;Ll/wje;)Z
    .locals 10
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
    iget-boolean v2, p0, Ll/ciw;->G:Z

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
    iget-object v2, p0, Ll/ciw;->w:Landroid/content/Context;

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
    iput-object v2, p0, Ll/ciw;->h:Landroid/hardware/camera2/CameraManager;

    .line 32
    .line 33
    const/16 v5, 0xfa2

    .line 34
    .line 35
    :try_start_0
    new-instance v6, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 38
    .line 39
    .line 40
    iget v7, p0, Ll/ciw;->e:I

    .line 41
    .line 42
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v6

    .line 52
    invoke-virtual {v2, v6}, Landroid/hardware/camera2/CameraManager;->getCameraCharacteristics(Ljava/lang/String;)Landroid/hardware/camera2/CameraCharacteristics;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    sget-object v6, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_INFO_ACTIVE_ARRAY_SIZE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 57
    .line 58
    invoke-virtual {v2, v6}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v6

    .line 62
    check-cast v6, Landroid/graphics/Rect;

    .line 63
    .line 64
    iput-object v6, p0, Ll/ciw;->s:Landroid/graphics/Rect;

    .line 65
    .line 66
    sget-object v6, Landroid/hardware/camera2/CameraCharacteristics;->FLASH_INFO_AVAILABLE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 67
    .line 68
    invoke-virtual {v2, v6}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v6

    .line 72
    check-cast v6, Ljava/lang/Boolean;

    .line 73
    .line 74
    iput-object v6, p0, Ll/ciw;->C:Ljava/lang/Boolean;

    .line 75
    .line 76
    iget-object v6, p0, Ll/ciw;->a:Ll/tow;

    .line 77
    .line 78
    invoke-static {v2, v6}, Lcom/core/glcore/util/Camera2Helpler;->selectCameraFpsRange(Landroid/hardware/camera2/CameraCharacteristics;Ll/tow;)V

    .line 79
    .line 80
    .line 81
    invoke-direct {p0}, Ll/ciw;->T()Z

    .line 82
    .line 83
    .line 84
    move-result v6

    .line 85
    iput-boolean v6, p0, Ll/ciw;->K:Z

    .line 86
    .line 87
    iget-object v6, p0, Ll/ciw;->a:Ll/tow;

    .line 88
    .line 89
    new-instance v7, Landroid/util/Size;

    .line 90
    .line 91
    iget-object v8, p0, Ll/ciw;->I:Ll/row;

    .line 92
    .line 93
    invoke-virtual {v8}, Ll/row;->f()Ll/erf0;

    .line 94
    .line 95
    .line 96
    move-result-object v8

    .line 97
    invoke-virtual {v8}, Ll/erf0;->b()I

    .line 98
    .line 99
    .line 100
    move-result v8

    .line 101
    iget-object v9, p0, Ll/ciw;->I:Ll/row;

    .line 102
    .line 103
    invoke-virtual {v9}, Ll/row;->f()Ll/erf0;

    .line 104
    .line 105
    .line 106
    move-result-object v9

    .line 107
    invoke-virtual {v9}, Ll/erf0;->a()I

    .line 108
    .line 109
    .line 110
    move-result v9

    .line 111
    invoke-direct {v7, v8, v9}, Landroid/util/Size;-><init>(II)V

    .line 112
    .line 113
    .line 114
    invoke-static {v2, v6, v7}, Lcom/core/glcore/util/Camera2Helpler;->selectCameraPreviewWH(Landroid/hardware/camera2/CameraCharacteristics;Ll/tow;Landroid/util/Size;)Landroid/util/Size;

    .line 115
    .line 116
    .line 117
    move-result-object v2

    .line 118
    if-eqz v2, :cond_0

    .line 119
    .line 120
    iget-object v6, p0, Ll/ciw;->a:Ll/tow;

    .line 121
    .line 122
    invoke-virtual {v2}, Landroid/util/Size;->getWidth()I

    .line 123
    .line 124
    .line 125
    move-result v7

    .line 126
    iput v7, v6, Ll/tow;->e:I

    .line 127
    .line 128
    iget-object v6, p0, Ll/ciw;->a:Ll/tow;

    .line 129
    .line 130
    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    .line 131
    .line 132
    .line 133
    move-result v2

    .line 134
    iput v2, v6, Ll/tow;->f:I

    .line 135
    .line 136
    goto :goto_0

    .line 137
    :catch_0
    move-exception p1

    .line 138
    goto :goto_1

    .line 139
    :catch_1
    move-exception p1

    .line 140
    goto :goto_2

    .line 141
    :cond_0
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 142
    .line 143
    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    iget-object v1, p0, Ll/ciw;->F:Ljava/util/concurrent/Semaphore;

    .line 147
    .line 148
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object v1

    .line 155
    invoke-static {v4, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    iget-object v1, p0, Ll/ciw;->F:Ljava/util/concurrent/Semaphore;

    .line 159
    .line 160
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 161
    .line 162
    const-wide/16 v6, 0x9c4

    .line 163
    .line 164
    invoke-virtual {v1, v6, v7, v2}, Ljava/util/concurrent/Semaphore;->tryAcquire(JLjava/util/concurrent/TimeUnit;)Z

    .line 165
    .line 166
    .line 167
    move-result v1

    .line 168
    if-eqz v1, :cond_1

    .line 169
    .line 170
    iget-object p1, p0, Ll/ciw;->h:Landroid/hardware/camera2/CameraManager;

    .line 171
    .line 172
    new-instance v1, Ljava/lang/StringBuilder;

    .line 173
    .line 174
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 175
    .line 176
    .line 177
    iget v2, p0, Ll/ciw;->e:I

    .line 178
    .line 179
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 180
    .line 181
    .line 182
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 183
    .line 184
    .line 185
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object p2

    .line 189
    iget-object v1, p0, Ll/ciw;->z:Landroid/hardware/camera2/CameraDevice$StateCallback;

    .line 190
    .line 191
    iget-object v2, p0, Ll/ciw;->c:Landroid/os/Handler;

    .line 192
    .line 193
    invoke-virtual {p1, p2, v1, v2}, Landroid/hardware/camera2/CameraManager;->openCamera(Ljava/lang/String;Landroid/hardware/camera2/CameraDevice$StateCallback;Landroid/os/Handler;)V

    .line 194
    .line 195
    .line 196
    goto :goto_3

    .line 197
    :cond_1
    invoke-static {v4, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 198
    .line 199
    .line 200
    new-instance p2, Ljava/lang/RuntimeException;

    .line 201
    .line 202
    invoke-direct {p2, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 203
    .line 204
    .line 205
    throw p2
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_2

    .line 206
    :catch_2
    iget-object p1, p0, Ll/ciw;->E:Ll/xpl$c;

    .line 207
    .line 208
    if-eqz p1, :cond_2

    .line 209
    .line 210
    invoke-interface {p1, v5, v0}, Ll/xpl$c;->onFail(ILjava/lang/String;)V

    .line 211
    .line 212
    .line 213
    goto :goto_3

    .line 214
    :goto_1
    new-instance p2, Ljava/lang/StringBuilder;

    .line 215
    .line 216
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 217
    .line 218
    .line 219
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 220
    .line 221
    .line 222
    move-result-object p1

    .line 223
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 224
    .line 225
    .line 226
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 227
    .line 228
    .line 229
    move-result-object p1

    .line 230
    invoke-static {v4, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 231
    .line 232
    .line 233
    goto :goto_3

    .line 234
    :goto_2
    new-instance p2, Ljava/lang/StringBuilder;

    .line 235
    .line 236
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 237
    .line 238
    .line 239
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 240
    .line 241
    .line 242
    move-result-object p1

    .line 243
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 244
    .line 245
    .line 246
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object p1

    .line 250
    invoke-static {v4, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 251
    .line 252
    .line 253
    sget-object p1, Ll/s94;->a:Ljava/util/Map;

    .line 254
    .line 255
    const/4 p2, 0x2

    .line 256
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 257
    .line 258
    .line 259
    move-result-object v1

    .line 260
    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 261
    .line 262
    .line 263
    move-result-object p1

    .line 264
    check-cast p1, Ljava/lang/String;

    .line 265
    .line 266
    invoke-direct {p0, p2, p1}, Ll/ciw;->a0(ILjava/lang/String;)V

    .line 267
    .line 268
    .line 269
    iget-object p1, p0, Ll/ciw;->E:Ll/xpl$c;

    .line 270
    .line 271
    if-eqz p1, :cond_2

    .line 272
    .line 273
    invoke-interface {p1, v5, v0}, Ll/xpl$c;->onFail(ILjava/lang/String;)V

    .line 274
    .line 275
    .line 276
    :cond_2
    :goto_3
    iput-boolean v3, p0, Ll/ciw;->G:Z

    .line 277
    .line 278
    :cond_3
    return v3
.end method

.method public i()Z
    .locals 0
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x15
    .end annotation

    .line 1
    iget-boolean p0, p0, Ll/ciw;->K:Z

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
    invoke-virtual {p0, p1, v0}, Ll/ciw;->h0(Landroid/graphics/SurfaceTexture;Ll/wje;)Z

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
    iget-object v0, p0, Ll/ciw;->i:Landroid/hardware/camera2/CameraCaptureSession;

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object v0, p0, Ll/ciw;->l:Landroid/hardware/camera2/CaptureRequest$Builder;

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
    iget-object v0, p0, Ll/ciw;->l:Landroid/hardware/camera2/CaptureRequest$Builder;

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
    invoke-direct {p0}, Ll/ciw;->X()Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    iget-object v0, p0, Ll/ciw;->l:Landroid/hardware/camera2/CaptureRequest$Builder;

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
    iget-object p1, p0, Ll/ciw;->l:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 70
    .line 71
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 72
    .line 73
    invoke-virtual {p1, v0, p2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 74
    .line 75
    .line 76
    iget-object p1, p0, Ll/ciw;->l:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 77
    .line 78
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_PRECAPTURE_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 79
    .line 80
    invoke-virtual {p1, v0, p2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 81
    .line 82
    .line 83
    iget-object p1, p0, Ll/ciw;->l:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 84
    .line 85
    invoke-virtual {p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    iget-object p2, p0, Ll/ciw;->l:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 90
    .line 91
    const/4 v2, 0x0

    .line 92
    invoke-virtual {p2, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 93
    .line 94
    .line 95
    iget-object p2, p0, Ll/ciw;->l:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 96
    .line 97
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 98
    .line 99
    invoke-virtual {p2, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 100
    .line 101
    .line 102
    iget-object p2, p0, Ll/ciw;->l:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 103
    .line 104
    invoke-virtual {p2, v0, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 105
    .line 106
    .line 107
    :try_start_0
    iget-object p2, p0, Ll/ciw;->i:Landroid/hardware/camera2/CameraCaptureSession;

    .line 108
    .line 109
    iget-object v0, p0, Ll/ciw;->O:Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    .line 110
    .line 111
    iget-object p0, p0, Ll/ciw;->c:Landroid/os/Handler;

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

.method public m()I
    .locals 0

    .line 1
    iget p0, p0, Ll/ciw;->p:I

    .line 2
    .line 3
    mul-int/lit8 p0, p0, 0x5a

    .line 4
    .line 5
    return p0
.end method

.method public declared-synchronized release()V
    .locals 2
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
    iget-object v0, p0, Ll/ciw;->f:Landroid/media/ImageReader;

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/media/ImageReader;->close()V

    .line 8
    .line 9
    .line 10
    iput-object v1, p0, Ll/ciw;->f:Landroid/media/ImageReader;

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
    iget-object v0, p0, Ll/ciw;->i:Landroid/hardware/camera2/CameraCaptureSession;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/hardware/camera2/CameraCaptureSession;->close()V

    .line 20
    .line 21
    .line 22
    iput-object v1, p0, Ll/ciw;->i:Landroid/hardware/camera2/CameraCaptureSession;

    .line 23
    .line 24
    :cond_1
    iget-object v0, p0, Ll/ciw;->g:Landroid/hardware/camera2/CameraDevice;

    .line 25
    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    invoke-virtual {v0}, Landroid/hardware/camera2/CameraDevice;->close()V

    .line 29
    .line 30
    .line 31
    :cond_2
    iput-object v1, p0, Ll/ciw;->l:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 32
    .line 33
    iput-object v1, p0, Ll/ciw;->h:Landroid/hardware/camera2/CameraManager;

    .line 34
    .line 35
    iget-object v0, p0, Ll/ciw;->u:Landroid/os/HandlerThread;

    .line 36
    .line 37
    if-eqz v0, :cond_3

    .line 38
    .line 39
    iput-object v1, p0, Ll/ciw;->c:Landroid/os/Handler;

    .line 40
    .line 41
    iput-object v1, p0, Ll/ciw;->d:Landroid/os/Handler;

    .line 42
    .line 43
    invoke-virtual {v0}, Landroid/os/HandlerThread;->quitSafely()Z

    .line 44
    .line 45
    .line 46
    :cond_3
    const-string v0, "Camera"

    .line 47
    .line 48
    const-string v1, "Camera2 release !!!"

    .line 49
    .line 50
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 51
    .line 52
    .line 53
    monitor-exit p0

    .line 54
    return-void

    .line 55
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 56
    throw v0
.end method

.method public setExposureCompensation(I)V
    .locals 2

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/ciw;->l:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_EXPOSURE_COMPENSATION:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 6
    .line 7
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {v0, v1, p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ll/ciw;->l:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iget-object v0, p0, Ll/ciw;->i:Landroid/hardware/camera2/CameraCaptureSession;

    .line 21
    .line 22
    iget-object p0, p0, Ll/ciw;->c:Landroid/os/Handler;

    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    invoke-virtual {v0, p1, v1, p0}, Landroid/hardware/camera2/CameraCaptureSession;->capture(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void

    .line 29
    :catch_0
    move-exception p0

    .line 30
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 31
    .line 32
    .line 33
    return-void
.end method
