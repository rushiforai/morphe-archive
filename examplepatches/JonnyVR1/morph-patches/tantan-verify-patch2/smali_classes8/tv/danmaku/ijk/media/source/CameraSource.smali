.class public Ltv/danmaku/ijk/media/source/CameraSource;
.super Ltv/danmaku/ijk/media/source/SourceBase;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ltv/danmaku/ijk/media/source/CameraSource$OnCameraErrorListener;
    }
.end annotation


# instance fields
.field private A:Z

.field private B:Z

.field private final C:I

.field private D:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnVideoPreviewSizeSetListener;

.field private E:Ltv/danmaku/ijk/media/streamer/MomoSurface;

.field private F:Z

.field private G:I

.field private H:F

.field private I:F

.field private J:Z

.field private K:Z

.field private L:Lcom/momocv/videoprocessor/VideoProcessor;

.field private M:Ll/umw;

.field private N:Ll/lnw;

.field private O:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private P:I

.field private Q:J

.field private R:Landroid/os/Handler;

.field private S:Landroid/os/HandlerThread;

.field final T:Landroid/hardware/Camera$PreviewCallback;

.field protected a:I

.field protected b:I

.field c:Landroid/hardware/Camera$Parameters;

.field private d:Landroid/app/Activity;

.field private e:Lcom/immomo/mediacore/strinf/NotifyCenter;

.field private volatile f:Landroid/hardware/Camera;

.field g:Landroid/graphics/SurfaceTexture;

.field private h:I

.field private i:Ljava/lang/Object;

.field j:I

.field k:I

.field private l:I

.field protected m:Lcom/immomo/mediacore/strinf/VideoQuality;

.field protected n:Lcom/immomo/mediacore/strinf/VideoQuality;

.field private o:Z

.field p:I

.field private q:Z

.field private r:I

.field s:I

.field t:I

.field private u:I

.field v:I

.field private w:I

.field x:I

.field public y:I

.field public z:I


# direct methods
.method public constructor <init>(Landroid/app/Activity;Lcom/immomo/mediacore/strinf/NotifyCenter;)V
    .locals 5

    .line 1
    invoke-direct {p0}, Ltv/danmaku/ijk/media/source/SourceBase;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->a:I

    .line 6
    .line 7
    iput v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->b:I

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    iput-object v1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->c:Landroid/hardware/Camera$Parameters;

    .line 11
    .line 12
    iput-object v1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->e:Lcom/immomo/mediacore/strinf/NotifyCenter;

    .line 13
    .line 14
    iput-object v1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->g:Landroid/graphics/SurfaceTexture;

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    iput v2, p0, Ltv/danmaku/ijk/media/source/CameraSource;->h:I

    .line 18
    .line 19
    new-instance v3, Ljava/lang/Object;

    .line 20
    .line 21
    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v3, p0, Ltv/danmaku/ijk/media/source/CameraSource;->i:Ljava/lang/Object;

    .line 25
    .line 26
    iput v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->j:I

    .line 27
    .line 28
    iput v2, p0, Ltv/danmaku/ijk/media/source/CameraSource;->k:I

    .line 29
    .line 30
    const/16 v3, 0x19

    .line 31
    .line 32
    iput v3, p0, Ltv/danmaku/ijk/media/source/CameraSource;->l:I

    .line 33
    .line 34
    sget-object v3, Lcom/immomo/mediacore/strinf/VideoQuality;->DEFAULT_VIDEO_QUALITY:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 35
    .line 36
    invoke-virtual {v3}, Lcom/immomo/mediacore/strinf/VideoQuality;->clone()Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    iput-object v3, p0, Ltv/danmaku/ijk/media/source/CameraSource;->m:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 41
    .line 42
    invoke-virtual {v3}, Lcom/immomo/mediacore/strinf/VideoQuality;->clone()Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    iput-object v3, p0, Ltv/danmaku/ijk/media/source/CameraSource;->n:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 47
    .line 48
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->o:Z

    .line 49
    .line 50
    iput v2, p0, Ltv/danmaku/ijk/media/source/CameraSource;->p:I

    .line 51
    .line 52
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->q:Z

    .line 53
    .line 54
    iput v2, p0, Ltv/danmaku/ijk/media/source/CameraSource;->r:I

    .line 55
    .line 56
    iput v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->s:I

    .line 57
    .line 58
    iput v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->t:I

    .line 59
    .line 60
    const/16 v3, 0x1e0

    .line 61
    .line 62
    iput v3, p0, Ltv/danmaku/ijk/media/source/CameraSource;->u:I

    .line 63
    .line 64
    iput v3, p0, Ltv/danmaku/ijk/media/source/CameraSource;->v:I

    .line 65
    .line 66
    const/16 v4, 0x280

    .line 67
    .line 68
    iput v4, p0, Ltv/danmaku/ijk/media/source/CameraSource;->w:I

    .line 69
    .line 70
    iput v4, p0, Ltv/danmaku/ijk/media/source/CameraSource;->x:I

    .line 71
    .line 72
    iput v3, p0, Ltv/danmaku/ijk/media/source/CameraSource;->y:I

    .line 73
    .line 74
    iput v4, p0, Ltv/danmaku/ijk/media/source/CameraSource;->z:I

    .line 75
    .line 76
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->A:Z

    .line 77
    .line 78
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->B:Z

    .line 79
    .line 80
    const/16 v0, 0xa

    .line 81
    .line 82
    iput v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->C:I

    .line 83
    .line 84
    const/16 v0, 0x9

    .line 85
    .line 86
    iput v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->G:I

    .line 87
    .line 88
    iput-boolean v2, p0, Ltv/danmaku/ijk/media/source/CameraSource;->J:Z

    .line 89
    .line 90
    new-instance v0, Ll/umw;

    .line 91
    .line 92
    invoke-direct {v0}, Ll/umw;-><init>()V

    .line 93
    .line 94
    .line 95
    iput-object v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->M:Ll/umw;

    .line 96
    .line 97
    new-instance v0, Ll/lnw;

    .line 98
    .line 99
    invoke-direct {v0, v2}, Ll/lnw;-><init>(I)V

    .line 100
    .line 101
    .line 102
    iput-object v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->N:Ll/lnw;

    .line 103
    .line 104
    iput-object v1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->O:Ljava/util/List;

    .line 105
    .line 106
    iput v2, p0, Ltv/danmaku/ijk/media/source/CameraSource;->P:I

    .line 107
    .line 108
    const-wide/16 v2, 0x0

    .line 109
    .line 110
    iput-wide v2, p0, Ltv/danmaku/ijk/media/source/CameraSource;->Q:J

    .line 111
    .line 112
    iput-object v1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->R:Landroid/os/Handler;

    .line 113
    .line 114
    iput-object v1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->S:Landroid/os/HandlerThread;

    .line 115
    .line 116
    new-instance v0, Ltv/danmaku/ijk/media/source/CameraSource$4;

    .line 117
    .line 118
    invoke-direct {v0, p0}, Ltv/danmaku/ijk/media/source/CameraSource$4;-><init>(Ltv/danmaku/ijk/media/source/CameraSource;)V

    .line 119
    .line 120
    .line 121
    iput-object v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->T:Landroid/hardware/Camera$PreviewCallback;

    .line 122
    .line 123
    iput-object p1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->d:Landroid/app/Activity;

    .line 124
    .line 125
    iput-object p2, p0, Ltv/danmaku/ijk/media/source/CameraSource;->e:Lcom/immomo/mediacore/strinf/NotifyCenter;

    .line 126
    .line 127
    iput-wide v2, p0, Ltv/danmaku/ijk/media/source/CameraSource;->Q:J

    .line 128
    .line 129
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->S:Landroid/os/HandlerThread;

    .line 130
    .line 131
    if-nez p1, :cond_0

    .line 132
    .line 133
    new-instance p1, Landroid/os/HandlerThread;

    .line 134
    .line 135
    const-string p2, "ijkStrMonitor"

    .line 136
    .line 137
    invoke-direct {p1, p2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    iput-object p1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->S:Landroid/os/HandlerThread;

    .line 141
    .line 142
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 143
    .line 144
    .line 145
    new-instance p1, Landroid/os/Handler;

    .line 146
    .line 147
    iget-object p2, p0, Ltv/danmaku/ijk/media/source/CameraSource;->S:Landroid/os/HandlerThread;

    .line 148
    .line 149
    invoke-virtual {p2}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 150
    .line 151
    .line 152
    move-result-object p2

    .line 153
    invoke-direct {p1, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 154
    .line 155
    .line 156
    iput-object p1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->R:Landroid/os/Handler;

    .line 157
    .line 158
    :cond_0
    return-void
.end method

.method private C0(Ll/omw;[B)V
    .locals 7

    .line 1
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->A:Z

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ll/omw;->z(Z)V

    .line 4
    .line 5
    .line 6
    iget v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->t:I

    .line 7
    .line 8
    mul-int/lit8 v0, v0, 0x5a

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Ll/omw;->w(I)V

    .line 11
    .line 12
    .line 13
    iget v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->t:I

    .line 14
    .line 15
    mul-int/lit8 v0, v0, 0x5a

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Ll/omw;->C(I)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, p2}, Ll/omw;->y([B)V

    .line 21
    .line 22
    .line 23
    iget v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->y:I

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Ll/omw;->E(I)V

    .line 26
    .line 27
    .line 28
    iget v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->z:I

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Ll/omw;->A(I)V

    .line 31
    .line 32
    .line 33
    iget-object v1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->E:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 34
    .line 35
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/CameraSource;->f:Landroid/hardware/Camera;

    .line 36
    .line 37
    iget v4, p0, Ltv/danmaku/ijk/media/source/CameraSource;->y:I

    .line 38
    .line 39
    iget v5, p0, Ltv/danmaku/ijk/media/source/CameraSource;->z:I

    .line 40
    .line 41
    move-object v6, p1

    .line 42
    move-object v3, p2

    .line 43
    invoke-virtual/range {v1 .. v6}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->j1(Landroid/hardware/Camera;[BIILl/omw;)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->f:Landroid/hardware/Camera;

    .line 47
    .line 48
    if-eqz p1, :cond_0

    .line 49
    .line 50
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->f:Landroid/hardware/Camera;

    .line 51
    .line 52
    invoke-virtual {p0, v3}, Landroid/hardware/Camera;->addCallbackBuffer([B)V

    .line 53
    .line 54
    .line 55
    :cond_0
    return-void
.end method

.method public static synthetic S(Ltv/danmaku/ijk/media/source/CameraSource;)I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->G:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic T(Ltv/danmaku/ijk/media/source/CameraSource;)F
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->H:F

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic U(Ltv/danmaku/ijk/media/source/CameraSource;)F
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->I:F

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic V(Ltv/danmaku/ijk/media/source/CameraSource;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->J:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic W(Ltv/danmaku/ijk/media/source/CameraSource;)Lcom/momocv/videoprocessor/VideoProcessor;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->L:Lcom/momocv/videoprocessor/VideoProcessor;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic X(Ltv/danmaku/ijk/media/source/CameraSource;Lcom/momocv/videoprocessor/VideoProcessor;)Lcom/momocv/videoprocessor/VideoProcessor;
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->L:Lcom/momocv/videoprocessor/VideoProcessor;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic Y(Ltv/danmaku/ijk/media/source/CameraSource;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->O:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic Z(Ltv/danmaku/ijk/media/source/CameraSource;Ll/omw;[B)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ltv/danmaku/ijk/media/source/CameraSource;->C0(Ll/omw;[B)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a0(Ltv/danmaku/ijk/media/source/CameraSource;)Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->R:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b0(Ltv/danmaku/ijk/media/source/CameraSource;)Z
    .locals 0

    .line 1
    invoke-direct {p0}, Ltv/danmaku/ijk/media/source/CameraSource;->x0()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic c0(Ltv/danmaku/ijk/media/source/CameraSource;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->o:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic d0(Ltv/danmaku/ijk/media/source/CameraSource;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->o:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic e0(Ltv/danmaku/ijk/media/source/CameraSource;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->Q:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic f0(Ltv/danmaku/ijk/media/source/CameraSource;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ltv/danmaku/ijk/media/source/CameraSource;->s0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g0(Ltv/danmaku/ijk/media/source/CameraSource;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->Q:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic h0(Ltv/danmaku/ijk/media/source/CameraSource;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ltv/danmaku/ijk/media/source/CameraSource;->y0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i0(Ltv/danmaku/ijk/media/source/CameraSource;)Lcom/immomo/mediacore/strinf/NotifyCenter;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->e:Lcom/immomo/mediacore/strinf/NotifyCenter;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic j0(Ltv/danmaku/ijk/media/source/CameraSource;)Landroid/hardware/Camera;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->f:Landroid/hardware/Camera;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic k0(Ltv/danmaku/ijk/media/source/CameraSource;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->i:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic l0(Ltv/danmaku/ijk/media/source/CameraSource;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->F:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic m0(Ltv/danmaku/ijk/media/source/CameraSource;)Ll/umw;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->M:Ll/umw;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic n0(Ltv/danmaku/ijk/media/source/CameraSource;)Ll/lnw;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->N:Ll/lnw;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic o0(Ltv/danmaku/ijk/media/source/CameraSource;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->A:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic p0(Ltv/danmaku/ijk/media/source/CameraSource;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->K:Z

    .line 2
    .line 3
    return p0
.end method

.method private r0()V
    .locals 1

    .line 1
    new-instance v0, Ltv/danmaku/ijk/media/source/CameraSource$5;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ltv/danmaku/ijk/media/source/CameraSource$5;-><init>(Ltv/danmaku/ijk/media/source/CameraSource;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "start"

    .line 7
    .line 8
    filled-new-array {p0}, [Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {v0, p0}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private s0()V
    .locals 10

    .line 1
    const-string v0, "auto"

    .line 2
    .line 3
    const-string v1, "mCamera.getPreviewFrameRate "

    .line 4
    .line 5
    const-string v2, "mCamera.setParameters frameRate "

    .line 6
    .line 7
    const-string v3, "initCameraPara "

    .line 8
    .line 9
    const-string v4, "VideoSource"

    .line 10
    .line 11
    invoke-static {v4, v3}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    iget-object v3, p0, Ltv/danmaku/ijk/media/source/CameraSource;->f:Landroid/hardware/Camera;

    .line 15
    .line 16
    if-nez v3, :cond_0

    .line 17
    .line 18
    const-string p0, "mCamera == null"

    .line 19
    .line 20
    invoke-static {v4, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    const/4 v3, 0x0

    .line 25
    :try_start_0
    iget-object v5, p0, Ltv/danmaku/ijk/media/source/CameraSource;->f:Landroid/hardware/Camera;

    .line 26
    .line 27
    invoke-static {v5}, Ltv/danmaku/ijk/media/streamer/Util;->a(Landroid/hardware/Camera;)Ljava/util/List;

    .line 28
    .line 29
    .line 30
    move-result-object v5

    .line 31
    if-eqz v5, :cond_1

    .line 32
    .line 33
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 34
    .line 35
    .line 36
    move-result v6

    .line 37
    if-lez v6, :cond_1

    .line 38
    .line 39
    iget v6, p0, Ltv/danmaku/ijk/media/source/CameraSource;->s:I

    .line 40
    .line 41
    invoke-virtual {p0, v5, v6}, Ltv/danmaku/ijk/media/source/CameraSource;->q0(Ljava/util/List;I)Landroid/hardware/Camera$Size;

    .line 42
    .line 43
    .line 44
    move-result-object v5

    .line 45
    goto :goto_0

    .line 46
    :cond_1
    move-object v5, v3

    .line 47
    :goto_0
    iget-object v6, p0, Ltv/danmaku/ijk/media/source/CameraSource;->c:Landroid/hardware/Camera$Parameters;

    .line 48
    .line 49
    invoke-virtual {v6}, Landroid/hardware/Camera$Parameters;->getPreviewSize()Landroid/hardware/Camera$Size;

    .line 50
    .line 51
    .line 52
    move-result-object v6

    .line 53
    invoke-direct {p0}, Ltv/danmaku/ijk/media/source/CameraSource;->t0()Z

    .line 54
    .line 55
    .line 56
    move-result v7

    .line 57
    const/4 v8, 0x0

    .line 58
    const/4 v9, 0x1

    .line 59
    if-eqz v7, :cond_2

    .line 60
    .line 61
    iget v7, p0, Ltv/danmaku/ijk/media/source/CameraSource;->k:I

    .line 62
    .line 63
    if-ne v7, v9, :cond_2

    .line 64
    .line 65
    move v7, v9

    .line 66
    goto :goto_1

    .line 67
    :cond_2
    move v7, v8

    .line 68
    :goto_1
    if-eqz v5, :cond_4

    .line 69
    .line 70
    if-nez v7, :cond_4

    .line 71
    .line 72
    iget v7, v5, Landroid/hardware/Camera$Size;->width:I

    .line 73
    .line 74
    iput v7, p0, Ltv/danmaku/ijk/media/source/CameraSource;->y:I

    .line 75
    .line 76
    iget v5, v5, Landroid/hardware/Camera$Size;->height:I

    .line 77
    .line 78
    iput v5, p0, Ltv/danmaku/ijk/media/source/CameraSource;->z:I

    .line 79
    .line 80
    if-eqz v7, :cond_3

    .line 81
    .line 82
    if-nez v5, :cond_5

    .line 83
    .line 84
    :cond_3
    iget v5, v6, Landroid/hardware/Camera$Size;->width:I

    .line 85
    .line 86
    iput v5, p0, Ltv/danmaku/ijk/media/source/CameraSource;->y:I

    .line 87
    .line 88
    iget v5, v6, Landroid/hardware/Camera$Size;->height:I

    .line 89
    .line 90
    iput v5, p0, Ltv/danmaku/ijk/media/source/CameraSource;->z:I

    .line 91
    .line 92
    goto :goto_2

    .line 93
    :cond_4
    iget v5, v6, Landroid/hardware/Camera$Size;->width:I

    .line 94
    .line 95
    iput v5, p0, Ltv/danmaku/ijk/media/source/CameraSource;->y:I

    .line 96
    .line 97
    iget v5, v6, Landroid/hardware/Camera$Size;->height:I

    .line 98
    .line 99
    iput v5, p0, Ltv/danmaku/ijk/media/source/CameraSource;->z:I

    .line 100
    .line 101
    :cond_5
    :goto_2
    iget-object v5, p0, Ltv/danmaku/ijk/media/source/CameraSource;->c:Landroid/hardware/Camera$Parameters;

    .line 102
    .line 103
    const/16 v6, 0x100

    .line 104
    .line 105
    invoke-virtual {v5, v6}, Landroid/hardware/Camera$Parameters;->setPictureFormat(I)V

    .line 106
    .line 107
    .line 108
    iget-object v5, p0, Ltv/danmaku/ijk/media/source/CameraSource;->c:Landroid/hardware/Camera$Parameters;

    .line 109
    .line 110
    iget v6, p0, Ltv/danmaku/ijk/media/source/CameraSource;->y:I

    .line 111
    .line 112
    iget v7, p0, Ltv/danmaku/ijk/media/source/CameraSource;->z:I

    .line 113
    .line 114
    invoke-virtual {v5, v6, v7}, Landroid/hardware/Camera$Parameters;->setPreviewSize(II)V

    .line 115
    .line 116
    .line 117
    new-instance v5, Ljava/lang/StringBuilder;

    .line 118
    .line 119
    invoke-direct {v5, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/CameraSource;->n:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 123
    .line 124
    iget v2, v2, Lcom/immomo/mediacore/strinf/VideoQuality;->framerate:I

    .line 125
    .line 126
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    invoke-static {v4, v2}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 134
    .line 135
    .line 136
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/CameraSource;->n:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 137
    .line 138
    iget v5, v2, Lcom/immomo/mediacore/strinf/VideoQuality;->framerate:I

    .line 139
    .line 140
    const/16 v6, 0x19

    .line 141
    .line 142
    if-gt v5, v6, :cond_6

    .line 143
    .line 144
    if-gtz v5, :cond_7

    .line 145
    .line 146
    :cond_6
    iput v6, v2, Lcom/immomo/mediacore/strinf/VideoQuality;->framerate:I

    .line 147
    .line 148
    :cond_7
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/CameraSource;->c:Landroid/hardware/Camera$Parameters;

    .line 149
    .line 150
    const/16 v5, 0x1e

    .line 151
    .line 152
    invoke-virtual {p0, v2, v5}, Ltv/danmaku/ijk/media/source/CameraSource;->w0(Landroid/hardware/Camera$Parameters;I)[I

    .line 153
    .line 154
    .line 155
    move-result-object v2

    .line 156
    iget-object v5, p0, Ltv/danmaku/ijk/media/source/CameraSource;->c:Landroid/hardware/Camera$Parameters;

    .line 157
    .line 158
    aget v6, v2, v8

    .line 159
    .line 160
    aget v2, v2, v9

    .line 161
    .line 162
    invoke-virtual {v5, v6, v2}, Landroid/hardware/Camera$Parameters;->setPreviewFpsRange(II)V

    .line 163
    .line 164
    .line 165
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/CameraSource;->c:Landroid/hardware/Camera$Parameters;

    .line 166
    .line 167
    iget-object v5, p0, Ltv/danmaku/ijk/media/source/CameraSource;->n:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 168
    .line 169
    iget v5, v5, Lcom/immomo/mediacore/strinf/VideoQuality;->framerate:I

    .line 170
    .line 171
    invoke-virtual {v2, v5}, Landroid/hardware/Camera$Parameters;->setPreviewFrameRate(I)V

    .line 172
    .line 173
    .line 174
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/CameraSource;->c:Landroid/hardware/Camera$Parameters;

    .line 175
    .line 176
    invoke-virtual {v2}, Landroid/hardware/Camera$Parameters;->getPreviewFrameRate()I

    .line 177
    .line 178
    .line 179
    move-result v2

    .line 180
    new-instance v5, Ljava/lang/StringBuilder;

    .line 181
    .line 182
    invoke-direct {v5, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 183
    .line 184
    .line 185
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object v1

    .line 192
    invoke-static {v4, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 193
    .line 194
    .line 195
    iget-object v1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->c:Landroid/hardware/Camera$Parameters;

    .line 196
    .line 197
    const/16 v2, 0x11

    .line 198
    .line 199
    invoke-virtual {v1, v2}, Landroid/hardware/Camera$Parameters;->setPreviewFormat(I)V

    .line 200
    .line 201
    .line 202
    iget-object v1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->c:Landroid/hardware/Camera$Parameters;

    .line 203
    .line 204
    invoke-virtual {v1, v0}, Landroid/hardware/Camera$Parameters;->setAntibanding(Ljava/lang/String;)V

    .line 205
    .line 206
    .line 207
    iget-object v1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->c:Landroid/hardware/Camera$Parameters;

    .line 208
    .line 209
    invoke-virtual {v1, v0}, Landroid/hardware/Camera$Parameters;->setWhiteBalance(Ljava/lang/String;)V

    .line 210
    .line 211
    .line 212
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->f:Landroid/hardware/Camera;

    .line 213
    .line 214
    iget-object v1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->c:Landroid/hardware/Camera$Parameters;

    .line 215
    .line 216
    invoke-virtual {v0, v1}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 217
    .line 218
    .line 219
    goto :goto_4

    .line 220
    :catchall_0
    move-exception p0

    .line 221
    throw p0

    .line 222
    :catch_0
    const-string v0, "mCamera.setParameters fail"

    .line 223
    .line 224
    invoke-static {v4, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 225
    .line 226
    .line 227
    invoke-direct {p0}, Ltv/danmaku/ijk/media/source/CameraSource;->x0()Z

    .line 228
    .line 229
    .line 230
    move-result v0

    .line 231
    const/4 v1, 0x2

    .line 232
    const/16 v2, -0x12f

    .line 233
    .line 234
    const/16 v4, 0x12c

    .line 235
    .line 236
    if-nez v0, :cond_8

    .line 237
    .line 238
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->e:Lcom/immomo/mediacore/strinf/NotifyCenter;

    .line 239
    .line 240
    if-eqz v0, :cond_9

    .line 241
    .line 242
    invoke-interface {v0, v4, v2, v1, v3}, Lcom/immomo/mediacore/strinf/NotifyCenter;->notify(IIILjava/lang/Object;)V

    .line 243
    .line 244
    .line 245
    goto :goto_3

    .line 246
    :cond_8
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->f:Landroid/hardware/Camera;

    .line 247
    .line 248
    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 249
    .line 250
    .line 251
    move-result-object v0

    .line 252
    iput-object v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->c:Landroid/hardware/Camera$Parameters;

    .line 253
    .line 254
    :cond_9
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->c:Landroid/hardware/Camera$Parameters;

    .line 255
    .line 256
    if-nez v0, :cond_a

    .line 257
    .line 258
    iget-object v5, p0, Ltv/danmaku/ijk/media/source/CameraSource;->e:Lcom/immomo/mediacore/strinf/NotifyCenter;

    .line 259
    .line 260
    if-eqz v5, :cond_a

    .line 261
    .line 262
    invoke-interface {v5, v4, v2, v1, v3}, Lcom/immomo/mediacore/strinf/NotifyCenter;->notify(IIILjava/lang/Object;)V

    .line 263
    .line 264
    .line 265
    :goto_3
    return-void

    .line 266
    :cond_a
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getPreviewSize()Landroid/hardware/Camera$Size;

    .line 267
    .line 268
    .line 269
    move-result-object v0

    .line 270
    iget v1, v0, Landroid/hardware/Camera$Size;->width:I

    .line 271
    .line 272
    iput v1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->y:I

    .line 273
    .line 274
    iget v0, v0, Landroid/hardware/Camera$Size;->height:I

    .line 275
    .line 276
    iput v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->z:I

    .line 277
    .line 278
    :goto_4
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/source/CameraSource;->A0()V

    .line 279
    .line 280
    .line 281
    return-void
.end method

.method private t0()Z
    .locals 14

    .line 1
    const-string v12, "HUAWEIG628-TL00"

    .line 2
    .line 3
    const-string v13, "DOOV_D910T"

    .line 4
    .line 5
    const-string v0, "GN9000"

    .line 6
    .line 7
    const-string v1, "GN9005"

    .line 8
    .line 9
    const-string v2, "F301"

    .line 10
    .line 11
    const-string v3, "F103"

    .line 12
    .line 13
    const-string v4, "GN5001"

    .line 14
    .line 15
    const-string v5, "Bird L5"

    .line 16
    .line 17
    const-string v6, "ATH-AL00"

    .line 18
    .line 19
    const-string v7, "Coolpad 8720L"

    .line 20
    .line 21
    const-string v8, "Coolpad 8705"

    .line 22
    .line 23
    const-string v9, "Che1-CL10"

    .line 24
    .line 25
    const-string v10, "V3MAX_L8"

    .line 26
    .line 27
    const-string v11, "HUAWEITIT-AL00"

    .line 28
    .line 29
    filled-new-array/range {v0 .. v13}, [Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const/4 v0, 0x0

    .line 34
    move v1, v0

    .line 35
    :goto_0
    const/16 v2, 0xe

    .line 36
    .line 37
    if-ge v1, v2, :cond_1

    .line 38
    .line 39
    aget-object v2, p0, v1

    .line 40
    .line 41
    if-eqz v2, :cond_0

    .line 42
    .line 43
    sget-object v3, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {v3, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    if-eqz v2, :cond_0

    .line 50
    .line 51
    const/4 p0, 0x1

    .line 52
    return p0

    .line 53
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    return v0
.end method

.method private u0(Landroid/hardware/Camera$Parameters;)Z
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/hardware/Camera$Parameters;->getSupportedFocusModes()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_1

    .line 14
    .line 15
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Ljava/lang/String;

    .line 20
    .line 21
    const-string v0, "auto"

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    return p0

    .line 31
    :cond_1
    const/4 p0, 0x0

    .line 32
    return p0
.end method

.method private v0(Landroid/hardware/Camera$Parameters;)Z
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/hardware/Camera$Parameters;->getSupportedFocusModes()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_1

    .line 14
    .line 15
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Ljava/lang/String;

    .line 20
    .line 21
    const-string v0, "fixed"

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    return p0

    .line 31
    :cond_1
    const/4 p0, 0x0

    .line 32
    return p0
.end method

.method private x0()Z
    .locals 9

    .line 1
    const-string v0, "continuous-video"

    .line 2
    .line 3
    const-string v1, "continuous-picture"

    .line 4
    .line 5
    const-string v2, "VideoSource"

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    :try_start_0
    invoke-static {}, Landroid/hardware/Camera;->getNumberOfCameras()I

    .line 9
    .line 10
    .line 11
    move-result v4

    .line 12
    iput v4, p0, Ltv/danmaku/ijk/media/source/CameraSource;->p:I

    .line 13
    .line 14
    new-instance v4, Landroid/hardware/Camera$CameraInfo;

    .line 15
    .line 16
    invoke-direct {v4}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    .line 17
    .line 18
    .line 19
    move v5, v3

    .line 20
    :goto_0
    iget v6, p0, Ltv/danmaku/ijk/media/source/CameraSource;->p:I

    .line 21
    .line 22
    const/4 v7, 0x1

    .line 23
    if-ge v5, v6, :cond_2

    .line 24
    .line 25
    invoke-static {v5, v4}, Landroid/hardware/Camera;->getCameraInfo(ILandroid/hardware/Camera$CameraInfo;)V

    .line 26
    .line 27
    .line 28
    iget v6, v4, Landroid/hardware/Camera$CameraInfo;->facing:I

    .line 29
    .line 30
    iget v8, p0, Ltv/danmaku/ijk/media/source/CameraSource;->k:I

    .line 31
    .line 32
    if-ne v6, v8, :cond_1

    .line 33
    .line 34
    iput v5, p0, Ltv/danmaku/ijk/media/source/CameraSource;->j:I

    .line 35
    .line 36
    if-ne v6, v7, :cond_0

    .line 37
    .line 38
    iput v7, p0, Ltv/danmaku/ijk/media/source/CameraSource;->r:I

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :catch_0
    move-exception p0

    .line 42
    goto/16 :goto_6

    .line 43
    .line 44
    :cond_0
    iput v3, p0, Ltv/danmaku/ijk/media/source/CameraSource;->r:I

    .line 45
    .line 46
    :cond_1
    :goto_1
    add-int/lit8 v5, v5, 0x1

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_2
    if-ne v6, v7, :cond_3

    .line 50
    .line 51
    iput v3, p0, Ltv/danmaku/ijk/media/source/CameraSource;->j:I

    .line 52
    .line 53
    iput v3, p0, Ltv/danmaku/ijk/media/source/CameraSource;->r:I

    .line 54
    .line 55
    :cond_3
    invoke-direct {p0}, Ltv/danmaku/ijk/media/source/CameraSource;->z0()V

    .line 56
    .line 57
    .line 58
    iget-object v4, p0, Ltv/danmaku/ijk/media/source/CameraSource;->f:Landroid/hardware/Camera;

    .line 59
    .line 60
    if-eqz v4, :cond_4

    .line 61
    .line 62
    iget-object v4, p0, Ltv/danmaku/ijk/media/source/CameraSource;->f:Landroid/hardware/Camera;

    .line 63
    .line 64
    const/4 v5, 0x0

    .line 65
    invoke-virtual {v4, v5}, Landroid/hardware/Camera;->setPreviewCallback(Landroid/hardware/Camera$PreviewCallback;)V

    .line 66
    .line 67
    .line 68
    iget-object v4, p0, Ltv/danmaku/ijk/media/source/CameraSource;->f:Landroid/hardware/Camera;

    .line 69
    .line 70
    invoke-virtual {v4, v5}, Landroid/hardware/Camera;->setPreviewCallbackWithBuffer(Landroid/hardware/Camera$PreviewCallback;)V

    .line 71
    .line 72
    .line 73
    iget-object v4, p0, Ltv/danmaku/ijk/media/source/CameraSource;->f:Landroid/hardware/Camera;

    .line 74
    .line 75
    invoke-virtual {v4}, Landroid/hardware/Camera;->release()V

    .line 76
    .line 77
    .line 78
    iput-object v5, p0, Ltv/danmaku/ijk/media/source/CameraSource;->f:Landroid/hardware/Camera;

    .line 79
    .line 80
    :cond_4
    iget v4, p0, Ltv/danmaku/ijk/media/source/CameraSource;->j:I

    .line 81
    .line 82
    if-ltz v4, :cond_5

    .line 83
    .line 84
    invoke-static {v4}, Landroid/hardware/Camera;->open(I)Landroid/hardware/Camera;

    .line 85
    .line 86
    .line 87
    move-result-object v4

    .line 88
    iput-object v4, p0, Ltv/danmaku/ijk/media/source/CameraSource;->f:Landroid/hardware/Camera;

    .line 89
    .line 90
    goto :goto_2

    .line 91
    :cond_5
    invoke-static {}, Landroid/hardware/Camera;->open()Landroid/hardware/Camera;

    .line 92
    .line 93
    .line 94
    move-result-object v4

    .line 95
    iput-object v4, p0, Ltv/danmaku/ijk/media/source/CameraSource;->f:Landroid/hardware/Camera;

    .line 96
    .line 97
    :goto_2
    iget-object v4, p0, Ltv/danmaku/ijk/media/source/CameraSource;->f:Landroid/hardware/Camera;

    .line 98
    .line 99
    if-nez v4, :cond_6

    .line 100
    .line 101
    return v3

    .line 102
    :cond_6
    iget-object v4, p0, Ltv/danmaku/ijk/media/source/CameraSource;->d:Landroid/app/Activity;

    .line 103
    .line 104
    iget v5, p0, Ltv/danmaku/ijk/media/source/CameraSource;->j:I

    .line 105
    .line 106
    invoke-static {v4, v5}, Ltv/danmaku/ijk/media/util/CameraUtils;->a(Landroid/app/Activity;I)I

    .line 107
    .line 108
    .line 109
    move-result v4

    .line 110
    iput v4, p0, Ltv/danmaku/ijk/media/source/CameraSource;->s:I

    .line 111
    .line 112
    new-instance v4, Ljava/lang/StringBuilder;

    .line 113
    .line 114
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 115
    .line 116
    .line 117
    const-string v5, "determineDisplayOrientation displayOrientation:"

    .line 118
    .line 119
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    iget v5, p0, Ltv/danmaku/ijk/media/source/CameraSource;->s:I

    .line 123
    .line 124
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    const-string v5, ";defaultCameraId "

    .line 128
    .line 129
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    iget v5, p0, Ltv/danmaku/ijk/media/source/CameraSource;->j:I

    .line 133
    .line 134
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    const-string v5, ";numberOfCameras:"

    .line 138
    .line 139
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    iget v5, p0, Ltv/danmaku/ijk/media/source/CameraSource;->p:I

    .line 143
    .line 144
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    const-string v5, ";mCameraSelection:"

    .line 148
    .line 149
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    iget v5, p0, Ltv/danmaku/ijk/media/source/CameraSource;->k:I

    .line 153
    .line 154
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    const-string v5, ";frontCamera:"

    .line 158
    .line 159
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    iget v5, p0, Ltv/danmaku/ijk/media/source/CameraSource;->r:I

    .line 163
    .line 164
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object v4

    .line 171
    invoke-static {v2, v4}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 172
    .line 173
    .line 174
    sget-object v4, Lcom/immomo/baseutil/Rotation;->NORMAL:Lcom/immomo/baseutil/Rotation;

    .line 175
    .line 176
    iget v5, p0, Ltv/danmaku/ijk/media/source/CameraSource;->s:I

    .line 177
    .line 178
    const/16 v6, 0x5a

    .line 179
    .line 180
    if-eq v5, v6, :cond_9

    .line 181
    .line 182
    const/16 v6, 0xb4

    .line 183
    .line 184
    if-eq v5, v6, :cond_8

    .line 185
    .line 186
    const/16 v6, 0x10e

    .line 187
    .line 188
    if-eq v5, v6, :cond_7

    .line 189
    .line 190
    goto :goto_3

    .line 191
    :cond_7
    sget-object v4, Lcom/immomo/baseutil/Rotation;->ROTATION_270:Lcom/immomo/baseutil/Rotation;

    .line 192
    .line 193
    goto :goto_3

    .line 194
    :cond_8
    sget-object v4, Lcom/immomo/baseutil/Rotation;->ROTATION_180:Lcom/immomo/baseutil/Rotation;

    .line 195
    .line 196
    goto :goto_3

    .line 197
    :cond_9
    sget-object v4, Lcom/immomo/baseutil/Rotation;->ROTATION_90:Lcom/immomo/baseutil/Rotation;

    .line 198
    .line 199
    :goto_3
    iget v5, p0, Ltv/danmaku/ijk/media/source/CameraSource;->r:I

    .line 200
    .line 201
    if-ne v5, v7, :cond_a

    .line 202
    .line 203
    iget v5, p0, Ltv/danmaku/ijk/media/source/CameraSource;->a:I

    .line 204
    .line 205
    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    .line 206
    .line 207
    .line 208
    move-result v4

    .line 209
    add-int/2addr v5, v4

    .line 210
    sget-object v4, Lcom/immomo/baseutil/Rotation;->ROTATION_270:Lcom/immomo/baseutil/Rotation;

    .line 211
    .line 212
    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    .line 213
    .line 214
    .line 215
    move-result v4

    .line 216
    add-int/2addr v4, v7

    .line 217
    rem-int/2addr v5, v4

    .line 218
    goto :goto_4

    .line 219
    :cond_a
    iget v5, p0, Ltv/danmaku/ijk/media/source/CameraSource;->b:I

    .line 220
    .line 221
    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    .line 222
    .line 223
    .line 224
    move-result v4

    .line 225
    add-int/2addr v5, v4

    .line 226
    sget-object v4, Lcom/immomo/baseutil/Rotation;->ROTATION_270:Lcom/immomo/baseutil/Rotation;

    .line 227
    .line 228
    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    .line 229
    .line 230
    .line 231
    move-result v4

    .line 232
    add-int/2addr v4, v7

    .line 233
    rem-int/2addr v5, v4

    .line 234
    :goto_4
    iput v5, p0, Ltv/danmaku/ijk/media/source/CameraSource;->t:I

    .line 235
    .line 236
    iget-object v4, p0, Ltv/danmaku/ijk/media/source/CameraSource;->f:Landroid/hardware/Camera;

    .line 237
    .line 238
    invoke-virtual {v4}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 239
    .line 240
    .line 241
    move-result-object v4

    .line 242
    iput-object v4, p0, Ltv/danmaku/ijk/media/source/CameraSource;->c:Landroid/hardware/Camera$Parameters;

    .line 243
    .line 244
    iget-object v4, p0, Ltv/danmaku/ijk/media/source/CameraSource;->f:Landroid/hardware/Camera;

    .line 245
    .line 246
    iget v5, p0, Ltv/danmaku/ijk/media/source/CameraSource;->s:I

    .line 247
    .line 248
    invoke-virtual {v4, v5}, Landroid/hardware/Camera;->setDisplayOrientation(I)V

    .line 249
    .line 250
    .line 251
    iget-object v4, p0, Ltv/danmaku/ijk/media/source/CameraSource;->c:Landroid/hardware/Camera$Parameters;

    .line 252
    .line 253
    invoke-virtual {v4}, Landroid/hardware/Camera$Parameters;->getSupportedFocusModes()Ljava/util/List;

    .line 254
    .line 255
    .line 256
    move-result-object v4

    .line 257
    if-eqz v4, :cond_e

    .line 258
    .line 259
    const-string v5, "video"

    .line 260
    .line 261
    sget-object v6, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 262
    .line 263
    invoke-static {v5, v6}, Ll/t9c;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 264
    .line 265
    .line 266
    const-string v5, "GT-I950"

    .line 267
    .line 268
    invoke-virtual {v6, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 269
    .line 270
    .line 271
    move-result v5

    .line 272
    if-nez v5, :cond_b

    .line 273
    .line 274
    const-string v5, "SCH-I959"

    .line 275
    .line 276
    invoke-virtual {v6, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 277
    .line 278
    .line 279
    move-result v5

    .line 280
    if-nez v5, :cond_b

    .line 281
    .line 282
    const-string v5, "MEIZU MX3"

    .line 283
    .line 284
    invoke-virtual {v6, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 285
    .line 286
    .line 287
    move-result v5

    .line 288
    if-eqz v5, :cond_c

    .line 289
    .line 290
    :cond_b
    invoke-interface {v4, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 291
    .line 292
    .line 293
    move-result v5

    .line 294
    if-eqz v5, :cond_c

    .line 295
    .line 296
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->c:Landroid/hardware/Camera$Parameters;

    .line 297
    .line 298
    invoke-virtual {v0, v1}, Landroid/hardware/Camera$Parameters;->setFocusMode(Ljava/lang/String;)V

    .line 299
    .line 300
    .line 301
    const-string v0, "FOCUS_MODE_CONTINUOUS_PICTURE"

    .line 302
    .line 303
    invoke-static {v2, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 304
    .line 305
    .line 306
    goto :goto_5

    .line 307
    :cond_c
    invoke-interface {v4, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 308
    .line 309
    .line 310
    move-result v1

    .line 311
    if-eqz v1, :cond_d

    .line 312
    .line 313
    const-string v1, "FOCUS_MODE_CONTINUOUS_VIDEO"

    .line 314
    .line 315
    invoke-static {v2, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 316
    .line 317
    .line 318
    iget-object v1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->c:Landroid/hardware/Camera$Parameters;

    .line 319
    .line 320
    invoke-virtual {v1, v0}, Landroid/hardware/Camera$Parameters;->setFocusMode(Ljava/lang/String;)V

    .line 321
    .line 322
    .line 323
    goto :goto_5

    .line 324
    :cond_d
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->c:Landroid/hardware/Camera$Parameters;

    .line 325
    .line 326
    const-string v1, "fixed"

    .line 327
    .line 328
    invoke-virtual {v0, v1}, Landroid/hardware/Camera$Parameters;->setFocusMode(Ljava/lang/String;)V

    .line 329
    .line 330
    .line 331
    const-string v0, "FOCUS_MODE_FIXED"

    .line 332
    .line 333
    invoke-static {v2, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 334
    .line 335
    .line 336
    :cond_e
    :goto_5
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->c:Landroid/hardware/Camera$Parameters;

    .line 337
    .line 338
    const-string v0, "auto"

    .line 339
    .line 340
    invoke-virtual {p0, v0}, Landroid/hardware/Camera$Parameters;->setWhiteBalance(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 341
    .line 342
    .line 343
    return v7

    .line 344
    :goto_6
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 345
    .line 346
    .line 347
    return v3
.end method

.method private y0()V
    .locals 5

    .line 1
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->B:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->f:Landroid/hardware/Camera;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->B:Z

    .line 11
    .line 12
    new-instance v0, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    const-string v1, "startPreview cameraSurface:"

    .line 15
    .line 16
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->g:Landroid/graphics/SurfaceTexture;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v1, "VideoSource"

    .line 29
    .line 30
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->g:Landroid/graphics/SurfaceTexture;

    .line 34
    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    :try_start_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->f:Landroid/hardware/Camera;

    .line 38
    .line 39
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/CameraSource;->g:Landroid/graphics/SurfaceTexture;

    .line 40
    .line 41
    invoke-virtual {v0, v2}, Landroid/hardware/Camera;->setPreviewTexture(Landroid/graphics/SurfaceTexture;)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->f:Landroid/hardware/Camera;

    .line 45
    .line 46
    invoke-virtual {v0}, Landroid/hardware/Camera;->startPreview()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 47
    .line 48
    .line 49
    const/4 v0, 0x0

    .line 50
    :goto_0
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/CameraSource;->f:Landroid/hardware/Camera;

    .line 51
    .line 52
    const/16 v3, 0xa

    .line 53
    .line 54
    if-ge v0, v3, :cond_0

    .line 55
    .line 56
    :try_start_1
    iget v3, p0, Ltv/danmaku/ijk/media/source/CameraSource;->y:I

    .line 57
    .line 58
    iget v4, p0, Ltv/danmaku/ijk/media/source/CameraSource;->z:I

    .line 59
    .line 60
    mul-int/2addr v3, v4

    .line 61
    mul-int/lit8 v3, v3, 0x3

    .line 62
    .line 63
    div-int/lit8 v3, v3, 0x2

    .line 64
    .line 65
    new-array v3, v3, [B

    .line 66
    .line 67
    invoke-virtual {v2, v3}, Landroid/hardware/Camera;->addCallbackBuffer([B)V

    .line 68
    .line 69
    .line 70
    new-instance v2, Ljava/lang/StringBuilder;

    .line 71
    .line 72
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 73
    .line 74
    .line 75
    const-string v3, "mCamera.addCallbackBuffer size:"

    .line 76
    .line 77
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    iget v3, p0, Ltv/danmaku/ijk/media/source/CameraSource;->y:I

    .line 81
    .line 82
    iget v4, p0, Ltv/danmaku/ijk/media/source/CameraSource;->z:I

    .line 83
    .line 84
    mul-int/2addr v3, v4

    .line 85
    mul-int/lit8 v3, v3, 0x3

    .line 86
    .line 87
    div-int/lit8 v3, v3, 0x2

    .line 88
    .line 89
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    invoke-static {v1, v2}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 97
    .line 98
    .line 99
    add-int/lit8 v0, v0, 0x1

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->T:Landroid/hardware/Camera$PreviewCallback;

    .line 103
    .line 104
    invoke-virtual {v2, p0}, Landroid/hardware/Camera;->setPreviewCallbackWithBuffer(Landroid/hardware/Camera$PreviewCallback;)V

    .line 105
    .line 106
    .line 107
    const-string p0, "mCamera.setPreviewTexture"

    .line 108
    .line 109
    invoke-static {v1, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 110
    .line 111
    .line 112
    return-void

    .line 113
    :catch_0
    const-string p0, "mCamera startPreview fail"

    .line 114
    .line 115
    invoke-static {v1, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 116
    .line 117
    .line 118
    :cond_1
    return-void
.end method

.method private z0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->i:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x0

    .line 5
    :try_start_0
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/CameraSource;->f:Landroid/hardware/Camera;

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/CameraSource;->f:Landroid/hardware/Camera;

    .line 10
    .line 11
    invoke-virtual {v2, v1}, Landroid/hardware/Camera;->setPreviewCallback(Landroid/hardware/Camera$PreviewCallback;)V

    .line 12
    .line 13
    .line 14
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/CameraSource;->f:Landroid/hardware/Camera;

    .line 15
    .line 16
    invoke-virtual {v2, v1}, Landroid/hardware/Camera;->setPreviewCallbackWithBuffer(Landroid/hardware/Camera$PreviewCallback;)V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    goto :goto_3

    .line 22
    :catch_0
    move-exception v2

    .line 23
    goto :goto_1

    .line 24
    :cond_0
    :goto_0
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/CameraSource;->f:Landroid/hardware/Camera;

    .line 25
    .line 26
    if-eqz v2, :cond_1

    .line 27
    .line 28
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/CameraSource;->f:Landroid/hardware/Camera;

    .line 29
    .line 30
    invoke-virtual {v2}, Landroid/hardware/Camera;->stopPreview()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    .line 32
    .line 33
    goto :goto_2

    .line 34
    :goto_1
    :try_start_1
    invoke-virtual {v2}, Ljava/lang/Throwable;->printStackTrace()V

    .line 35
    .line 36
    .line 37
    :cond_1
    :goto_2
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/CameraSource;->f:Landroid/hardware/Camera;

    .line 38
    .line 39
    if-eqz v2, :cond_2

    .line 40
    .line 41
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/CameraSource;->f:Landroid/hardware/Camera;

    .line 42
    .line 43
    invoke-virtual {v2}, Landroid/hardware/Camera;->release()V

    .line 44
    .line 45
    .line 46
    iput-object v1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->f:Landroid/hardware/Camera;

    .line 47
    .line 48
    :cond_2
    const/4 v2, 0x0

    .line 49
    iput-boolean v2, p0, Ltv/danmaku/ijk/media/source/CameraSource;->B:Z

    .line 50
    .line 51
    iput-boolean v2, p0, Ltv/danmaku/ijk/media/source/CameraSource;->q:Z

    .line 52
    .line 53
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/CameraSource;->L:Lcom/momocv/videoprocessor/VideoProcessor;

    .line 54
    .line 55
    if-eqz v2, :cond_3

    .line 56
    .line 57
    invoke-virtual {v2}, Lcom/momocv/videoprocessor/VideoProcessor;->Release()V

    .line 58
    .line 59
    .line 60
    iput-object v1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->L:Lcom/momocv/videoprocessor/VideoProcessor;

    .line 61
    .line 62
    :cond_3
    monitor-exit v0

    .line 63
    return-void

    .line 64
    :goto_3
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 65
    throw p0
.end method


# virtual methods
.method public A(F)V
    .locals 1

    .line 1
    const/high16 v0, 0x3f000000    # 0.5f

    .line 2
    .line 3
    mul-float/2addr p1, v0

    .line 4
    iput p1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->H:F

    .line 5
    .line 6
    return-void
.end method

.method public A0()V
    .locals 14

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->e:Lcom/immomo/mediacore/strinf/NotifyCenter;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/immomo/mediacore/strinf/NotifyCenter;->getPreviewScale()Landroid/graphics/PointF;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget v0, v0, Landroid/graphics/PointF;->x:F

    .line 8
    .line 9
    iget-object v1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->e:Lcom/immomo/mediacore/strinf/NotifyCenter;

    .line 10
    .line 11
    invoke-interface {v1}, Lcom/immomo/mediacore/strinf/NotifyCenter;->getPreviewScale()Landroid/graphics/PointF;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget v1, v1, Landroid/graphics/PointF;->y:F

    .line 16
    .line 17
    div-float v2, v1, v0

    .line 18
    .line 19
    iget v3, p0, Ltv/danmaku/ijk/media/source/CameraSource;->z:I

    .line 20
    .line 21
    int-to-float v4, v3

    .line 22
    iget v5, p0, Ltv/danmaku/ijk/media/source/CameraSource;->y:I

    .line 23
    .line 24
    int-to-float v6, v5

    .line 25
    div-float/2addr v4, v6

    .line 26
    cmpg-float v2, v2, v4

    .line 27
    .line 28
    iget-object v4, p0, Ltv/danmaku/ijk/media/source/CameraSource;->n:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 29
    .line 30
    const/high16 v6, 0x41800000    # 16.0f

    .line 31
    .line 32
    if-gtz v2, :cond_0

    .line 33
    .line 34
    iput v5, v4, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 35
    .line 36
    int-to-float v2, v5

    .line 37
    mul-float/2addr v2, v1

    .line 38
    div-float/2addr v2, v0

    .line 39
    div-float/2addr v2, v6

    .line 40
    float-to-int v0, v2

    .line 41
    mul-int/lit8 v0, v0, 0x10

    .line 42
    .line 43
    iput v0, v4, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    iput v3, v4, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 47
    .line 48
    int-to-float v2, v3

    .line 49
    mul-float/2addr v2, v0

    .line 50
    div-float/2addr v2, v1

    .line 51
    div-float/2addr v2, v6

    .line 52
    float-to-int v0, v2

    .line 53
    mul-int/lit8 v0, v0, 0x10

    .line 54
    .line 55
    iput v0, v4, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 56
    .line 57
    :goto_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->n:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 58
    .line 59
    iget v1, v0, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 60
    .line 61
    int-to-double v1, v1

    .line 62
    const-wide/high16 v3, 0x3ff0000000000000L    # 1.0

    .line 63
    .line 64
    mul-double/2addr v1, v3

    .line 65
    iget-object v5, p0, Ltv/danmaku/ijk/media/source/CameraSource;->e:Lcom/immomo/mediacore/strinf/NotifyCenter;

    .line 66
    .line 67
    invoke-interface {v5}, Lcom/immomo/mediacore/strinf/NotifyCenter;->getPreviewZoom()F

    .line 68
    .line 69
    .line 70
    move-result v5

    .line 71
    float-to-double v5, v5

    .line 72
    mul-double/2addr v1, v5

    .line 73
    double-to-int v1, v1

    .line 74
    iput v1, v0, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 75
    .line 76
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->n:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 77
    .line 78
    iget v1, v0, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 79
    .line 80
    int-to-double v1, v1

    .line 81
    mul-double/2addr v1, v3

    .line 82
    iget-object v3, p0, Ltv/danmaku/ijk/media/source/CameraSource;->e:Lcom/immomo/mediacore/strinf/NotifyCenter;

    .line 83
    .line 84
    invoke-interface {v3}, Lcom/immomo/mediacore/strinf/NotifyCenter;->getPreviewZoom()F

    .line 85
    .line 86
    .line 87
    move-result v3

    .line 88
    float-to-double v3, v3

    .line 89
    mul-double/2addr v1, v3

    .line 90
    double-to-int v1, v1

    .line 91
    iput v1, v0, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 92
    .line 93
    new-instance v0, Ljava/lang/StringBuilder;

    .line 94
    .line 95
    const-string v1, "----previewWidth:"

    .line 96
    .line 97
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    iget v1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->y:I

    .line 101
    .line 102
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    const-string v1, ";previewHeight"

    .line 106
    .line 107
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    iget v1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->z:I

    .line 111
    .line 112
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    const-string v1, ";mVideoQuality.resX"

    .line 116
    .line 117
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    iget-object v1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->n:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 121
    .line 122
    iget v1, v1, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 123
    .line 124
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    const-string v1, ";mVideoQuality.resY"

    .line 128
    .line 129
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    iget-object v1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->n:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 133
    .line 134
    iget v1, v1, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 135
    .line 136
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    const-string v1, ","

    .line 140
    .line 141
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    iget v2, p0, Ltv/danmaku/ijk/media/source/CameraSource;->P:I

    .line 145
    .line 146
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    const-string v2, "VideoSource"

    .line 154
    .line 155
    invoke-static {v2, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 156
    .line 157
    .line 158
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->n:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 159
    .line 160
    iget v3, v0, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 161
    .line 162
    const/16 v4, 0xb0

    .line 163
    .line 164
    if-ge v3, v4, :cond_1

    .line 165
    .line 166
    iput v4, v0, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 167
    .line 168
    :cond_1
    iget v3, v0, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 169
    .line 170
    if-ge v3, v4, :cond_2

    .line 171
    .line 172
    iput v4, v0, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 173
    .line 174
    :cond_2
    iget-object v5, p0, Ltv/danmaku/ijk/media/source/CameraSource;->E:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 175
    .line 176
    if-eqz v5, :cond_8

    .line 177
    .line 178
    iget v3, p0, Ltv/danmaku/ijk/media/source/CameraSource;->k:I

    .line 179
    .line 180
    const/4 v4, 0x0

    .line 181
    const/4 v6, 0x1

    .line 182
    if-ne v3, v6, :cond_3

    .line 183
    .line 184
    iput-boolean v6, p0, Ltv/danmaku/ijk/media/source/CameraSource;->A:Z

    .line 185
    .line 186
    goto :goto_1

    .line 187
    :cond_3
    iput-boolean v4, p0, Ltv/danmaku/ijk/media/source/CameraSource;->A:Z

    .line 188
    .line 189
    :goto_1
    iget v3, p0, Ltv/danmaku/ijk/media/source/CameraSource;->p:I

    .line 190
    .line 191
    if-ne v3, v6, :cond_4

    .line 192
    .line 193
    iput-boolean v4, p0, Ltv/danmaku/ijk/media/source/CameraSource;->A:Z

    .line 194
    .line 195
    :cond_4
    iget v10, p0, Ltv/danmaku/ijk/media/source/CameraSource;->P:I

    .line 196
    .line 197
    const/4 v3, 0x2

    .line 198
    if-ne v10, v3, :cond_5

    .line 199
    .line 200
    iget v6, p0, Ltv/danmaku/ijk/media/source/CameraSource;->y:I

    .line 201
    .line 202
    iget v7, p0, Ltv/danmaku/ijk/media/source/CameraSource;->z:I

    .line 203
    .line 204
    iget-boolean v8, p0, Ltv/danmaku/ijk/media/source/CameraSource;->A:Z

    .line 205
    .line 206
    iget v3, p0, Ltv/danmaku/ijk/media/source/CameraSource;->t:I

    .line 207
    .line 208
    mul-int/lit8 v9, v3, 0x5a

    .line 209
    .line 210
    iget v12, v0, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 211
    .line 212
    iget v13, v0, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 213
    .line 214
    const/4 v11, 0x0

    .line 215
    invoke-virtual/range {v5 .. v13}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->e1(IIZIIIII)V

    .line 216
    .line 217
    .line 218
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->n:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 219
    .line 220
    iget v3, v0, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 221
    .line 222
    iget v4, v0, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 223
    .line 224
    if-le v3, v4, :cond_7

    .line 225
    .line 226
    iput v4, v0, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 227
    .line 228
    iput v3, v0, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 229
    .line 230
    goto :goto_2

    .line 231
    :cond_5
    iget v3, v0, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 232
    .line 233
    iget v4, v0, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 234
    .line 235
    if-le v3, v4, :cond_6

    .line 236
    .line 237
    iput v3, v0, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 238
    .line 239
    iput v4, v0, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 240
    .line 241
    :cond_6
    iget v6, p0, Ltv/danmaku/ijk/media/source/CameraSource;->y:I

    .line 242
    .line 243
    iget v7, p0, Ltv/danmaku/ijk/media/source/CameraSource;->z:I

    .line 244
    .line 245
    iget-boolean v8, p0, Ltv/danmaku/ijk/media/source/CameraSource;->A:Z

    .line 246
    .line 247
    iget v3, p0, Ltv/danmaku/ijk/media/source/CameraSource;->t:I

    .line 248
    .line 249
    mul-int/lit8 v9, v3, 0x5a

    .line 250
    .line 251
    iget v12, v0, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 252
    .line 253
    iget v13, v0, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 254
    .line 255
    const/4 v11, 0x0

    .line 256
    invoke-virtual/range {v5 .. v13}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->e1(IIZIIIII)V

    .line 257
    .line 258
    .line 259
    :cond_7
    :goto_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 260
    .line 261
    const-string v3, "updateResolution call setVideoQuality():"

    .line 262
    .line 263
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 264
    .line 265
    .line 266
    iget-object v3, p0, Ltv/danmaku/ijk/media/source/CameraSource;->n:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 267
    .line 268
    iget v3, v3, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 269
    .line 270
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 271
    .line 272
    .line 273
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 274
    .line 275
    .line 276
    iget-object v1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->n:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 277
    .line 278
    iget v1, v1, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 279
    .line 280
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 281
    .line 282
    .line 283
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 284
    .line 285
    .line 286
    move-result-object v0

    .line 287
    invoke-static {v2, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 288
    .line 289
    .line 290
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->E:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 291
    .line 292
    iget-object v1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->n:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 293
    .line 294
    invoke-virtual {v0, v1}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->Y0(Lcom/immomo/mediacore/strinf/VideoQuality;)V

    .line 295
    .line 296
    .line 297
    :cond_8
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->e:Lcom/immomo/mediacore/strinf/NotifyCenter;

    .line 298
    .line 299
    if-eqz v0, :cond_9

    .line 300
    .line 301
    invoke-interface {v0}, Lcom/immomo/mediacore/strinf/NotifyCenter;->notifyUpdateResolution()V

    .line 302
    .line 303
    .line 304
    :cond_9
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->D:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnVideoPreviewSizeSetListener;

    .line 305
    .line 306
    if-eqz v0, :cond_a

    .line 307
    .line 308
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->n:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 309
    .line 310
    iget v1, p0, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 311
    .line 312
    iget p0, p0, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 313
    .line 314
    invoke-interface {v0, v1, p0}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnVideoPreviewSizeSetListener;->a(II)V

    .line 315
    .line 316
    .line 317
    :cond_a
    return-void
.end method

.method public B(II)V
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->v:I

    .line 2
    .line 3
    iput p2, p0, Ltv/danmaku/ijk/media/source/CameraSource;->x:I

    .line 4
    .line 5
    iput p1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->u:I

    .line 6
    .line 7
    iput p2, p0, Ltv/danmaku/ijk/media/source/CameraSource;->w:I

    .line 8
    .line 9
    return-void
.end method

.method public B0(Lcom/immomo/mediacore/strinf/VideoQuality;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_3

    .line 2
    .line 3
    iget v0, p1, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 4
    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    iget v0, p1, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->E:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->Y0(Lcom/immomo/mediacore/strinf/VideoQuality;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->e:Lcom/immomo/mediacore/strinf/NotifyCenter;

    .line 20
    .line 21
    if-eqz p1, :cond_2

    .line 22
    .line 23
    invoke-interface {p1}, Lcom/immomo/mediacore/strinf/NotifyCenter;->notifyUpdateResolution()V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->e:Lcom/immomo/mediacore/strinf/NotifyCenter;

    .line 27
    .line 28
    invoke-interface {p1}, Lcom/immomo/mediacore/strinf/NotifyCenter;->notifyResumeRecording()V

    .line 29
    .line 30
    .line 31
    :cond_2
    new-instance p1, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    const-string v0, "updateVideoVideoQuality:"

    .line 34
    .line 35
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->n:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 39
    .line 40
    iget v0, v0, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 41
    .line 42
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string v0, ","

    .line 46
    .line 47
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->n:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 51
    .line 52
    iget p0, p0, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 53
    .line 54
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    const-string p1, "VideoSource"

    .line 62
    .line 63
    invoke-static {p1, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 64
    .line 65
    .line 66
    :cond_3
    :goto_0
    return-void
.end method

.method public C(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnVideoPreviewSizeSetListener;

    .line 2
    .line 3
    iput-object p1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->D:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnVideoPreviewSizeSetListener;

    .line 4
    .line 5
    return-void
.end method

.method public D(F)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/source/CameraSource;->A0()V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0, p1, v0}, Ltv/danmaku/ijk/media/source/CameraSource;->E(II)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public E(II)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v7, p1

    .line 4
    .line 5
    move/from16 v1, p2

    .line 6
    .line 7
    iget-object v2, v0, Ltv/danmaku/ijk/media/source/CameraSource;->e:Lcom/immomo/mediacore/strinf/NotifyCenter;

    .line 8
    .line 9
    if-nez v2, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-interface {v2, v7}, Lcom/immomo/mediacore/strinf/NotifyCenter;->getStreamerCaptureType(I)I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    const-string v3, ", uid="

    .line 17
    .line 18
    const-string v10, "VideoSource"

    .line 19
    .line 20
    if-ne v2, v1, :cond_1

    .line 21
    .line 22
    new-instance v0, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    const-string v2, "----setStreamerCaptureType repeat, captureType="

    .line 25
    .line 26
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-static {v10, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    const-string v4, "----setStreamerCaptureType, captureType="

    .line 49
    .line 50
    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-static {v10, v2}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    .line 68
    .line 69
    iget-object v11, v0, Ltv/danmaku/ijk/media/source/CameraSource;->E:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 70
    .line 71
    if-eqz v11, :cond_2

    .line 72
    .line 73
    const/high16 v15, 0x3f800000    # 1.0f

    .line 74
    .line 75
    const/16 v16, 0x1

    .line 76
    .line 77
    const/4 v12, 0x0

    .line 78
    const/4 v13, 0x0

    .line 79
    const/4 v14, 0x0

    .line 80
    invoke-virtual/range {v11 .. v16}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->h0(FFFFZ)V

    .line 81
    .line 82
    .line 83
    :cond_2
    iget-object v2, v0, Ltv/danmaku/ijk/media/source/CameraSource;->e:Lcom/immomo/mediacore/strinf/NotifyCenter;

    .line 84
    .line 85
    invoke-interface {v2, v7, v1}, Lcom/immomo/mediacore/strinf/NotifyCenter;->setStreamerCaptureType(II)V

    .line 86
    .line 87
    .line 88
    iget-object v1, v0, Ltv/danmaku/ijk/media/source/CameraSource;->E:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 89
    .line 90
    if-eqz v1, :cond_6

    .line 91
    .line 92
    iget-object v1, v0, Ltv/danmaku/ijk/media/source/CameraSource;->e:Lcom/immomo/mediacore/strinf/NotifyCenter;

    .line 93
    .line 94
    invoke-interface {v1, v7}, Lcom/immomo/mediacore/strinf/NotifyCenter;->getStreamerCaptureType(I)I

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    iget-object v2, v0, Ltv/danmaku/ijk/media/source/CameraSource;->e:Lcom/immomo/mediacore/strinf/NotifyCenter;

    .line 99
    .line 100
    const/4 v3, 0x1

    .line 101
    if-ne v1, v3, :cond_4

    .line 102
    .line 103
    invoke-interface {v2, v7}, Lcom/immomo/mediacore/strinf/NotifyCenter;->getStreamerCaptureType(I)I

    .line 104
    .line 105
    .line 106
    move-result v1

    .line 107
    iput v1, v0, Ltv/danmaku/ijk/media/source/CameraSource;->P:I

    .line 108
    .line 109
    iget-object v11, v0, Ltv/danmaku/ijk/media/source/CameraSource;->E:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 110
    .line 111
    const/high16 v15, 0x3f800000    # 1.0f

    .line 112
    .line 113
    const/16 v16, 0x0

    .line 114
    .line 115
    const/4 v12, 0x0

    .line 116
    const/4 v13, 0x0

    .line 117
    const/4 v14, 0x0

    .line 118
    invoke-virtual/range {v11 .. v16}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->h0(FFFFZ)V

    .line 119
    .line 120
    .line 121
    iget-object v1, v0, Ltv/danmaku/ijk/media/source/CameraSource;->n:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 122
    .line 123
    iget v2, v1, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 124
    .line 125
    iget v3, v1, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 126
    .line 127
    if-le v2, v3, :cond_3

    .line 128
    .line 129
    iput v2, v1, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 130
    .line 131
    iput v3, v1, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 132
    .line 133
    :cond_3
    iget-object v2, v0, Ltv/danmaku/ijk/media/source/CameraSource;->E:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 134
    .line 135
    move-object v3, v2

    .line 136
    iget v2, v0, Ltv/danmaku/ijk/media/source/CameraSource;->y:I

    .line 137
    .line 138
    move-object v4, v3

    .line 139
    iget v3, v0, Ltv/danmaku/ijk/media/source/CameraSource;->z:I

    .line 140
    .line 141
    move-object v5, v4

    .line 142
    iget-boolean v4, v0, Ltv/danmaku/ijk/media/source/CameraSource;->A:Z

    .line 143
    .line 144
    iget v6, v0, Ltv/danmaku/ijk/media/source/CameraSource;->t:I

    .line 145
    .line 146
    mul-int/lit8 v6, v6, 0x5a

    .line 147
    .line 148
    move-object v8, v5

    .line 149
    move v5, v6

    .line 150
    iget v6, v0, Ltv/danmaku/ijk/media/source/CameraSource;->P:I

    .line 151
    .line 152
    move-object v9, v8

    .line 153
    iget v8, v1, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 154
    .line 155
    iget v1, v1, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 156
    .line 157
    move-object/from16 v17, v9

    .line 158
    .line 159
    move v9, v1

    .line 160
    move-object/from16 v1, v17

    .line 161
    .line 162
    invoke-virtual/range {v1 .. v9}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->e1(IIZIIIII)V

    .line 163
    .line 164
    .line 165
    goto :goto_0

    .line 166
    :cond_4
    invoke-interface {v2, v7}, Lcom/immomo/mediacore/strinf/NotifyCenter;->getStreamerCaptureType(I)I

    .line 167
    .line 168
    .line 169
    move-result v1

    .line 170
    iput v1, v0, Ltv/danmaku/ijk/media/source/CameraSource;->P:I

    .line 171
    .line 172
    iget-object v11, v0, Ltv/danmaku/ijk/media/source/CameraSource;->E:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 173
    .line 174
    const/high16 v15, 0x3f800000    # 1.0f

    .line 175
    .line 176
    const/16 v16, 0x0

    .line 177
    .line 178
    const/4 v12, 0x0

    .line 179
    const/4 v13, 0x0

    .line 180
    const/4 v14, 0x0

    .line 181
    invoke-virtual/range {v11 .. v16}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->h0(FFFFZ)V

    .line 182
    .line 183
    .line 184
    iget-object v1, v0, Ltv/danmaku/ijk/media/source/CameraSource;->E:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 185
    .line 186
    iget v2, v0, Ltv/danmaku/ijk/media/source/CameraSource;->y:I

    .line 187
    .line 188
    iget v3, v0, Ltv/danmaku/ijk/media/source/CameraSource;->z:I

    .line 189
    .line 190
    iget-boolean v4, v0, Ltv/danmaku/ijk/media/source/CameraSource;->A:Z

    .line 191
    .line 192
    iget v5, v0, Ltv/danmaku/ijk/media/source/CameraSource;->t:I

    .line 193
    .line 194
    mul-int/lit8 v5, v5, 0x5a

    .line 195
    .line 196
    iget v6, v0, Ltv/danmaku/ijk/media/source/CameraSource;->P:I

    .line 197
    .line 198
    iget-object v8, v0, Ltv/danmaku/ijk/media/source/CameraSource;->n:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 199
    .line 200
    iget v9, v8, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 201
    .line 202
    iget v8, v8, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 203
    .line 204
    move/from16 v17, v9

    .line 205
    .line 206
    move v9, v8

    .line 207
    move/from16 v8, v17

    .line 208
    .line 209
    invoke-virtual/range {v1 .. v9}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->e1(IIZIIIII)V

    .line 210
    .line 211
    .line 212
    iget-object v1, v0, Ltv/danmaku/ijk/media/source/CameraSource;->n:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 213
    .line 214
    iget v2, v1, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 215
    .line 216
    iget v3, v1, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 217
    .line 218
    if-le v2, v3, :cond_5

    .line 219
    .line 220
    iput v3, v1, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 221
    .line 222
    iput v2, v1, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 223
    .line 224
    :cond_5
    :goto_0
    iget-object v1, v0, Ltv/danmaku/ijk/media/source/CameraSource;->E:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 225
    .line 226
    iget-object v2, v0, Ltv/danmaku/ijk/media/source/CameraSource;->n:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 227
    .line 228
    invoke-virtual {v1, v2}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->Y0(Lcom/immomo/mediacore/strinf/VideoQuality;)V

    .line 229
    .line 230
    .line 231
    :cond_6
    iget-object v1, v0, Ltv/danmaku/ijk/media/source/CameraSource;->e:Lcom/immomo/mediacore/strinf/NotifyCenter;

    .line 232
    .line 233
    invoke-interface {v1}, Lcom/immomo/mediacore/strinf/NotifyCenter;->notifyUpdateResolution()V

    .line 234
    .line 235
    .line 236
    iget-object v1, v0, Ltv/danmaku/ijk/media/source/CameraSource;->D:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnVideoPreviewSizeSetListener;

    .line 237
    .line 238
    if-eqz v1, :cond_7

    .line 239
    .line 240
    iget-object v2, v0, Ltv/danmaku/ijk/media/source/CameraSource;->n:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 241
    .line 242
    iget v3, v2, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 243
    .line 244
    iget v2, v2, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 245
    .line 246
    invoke-interface {v1, v3, v2}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnVideoPreviewSizeSetListener;->a(II)V

    .line 247
    .line 248
    .line 249
    :cond_7
    iget-object v1, v0, Ltv/danmaku/ijk/media/source/CameraSource;->e:Lcom/immomo/mediacore/strinf/NotifyCenter;

    .line 250
    .line 251
    invoke-interface {v1}, Lcom/immomo/mediacore/strinf/NotifyCenter;->notifyResumeRecording()V

    .line 252
    .line 253
    .line 254
    new-instance v1, Ljava/lang/StringBuilder;

    .line 255
    .line 256
    const-string v2, "----setStreamerCaptureType, mCurrentScreenOrient="

    .line 257
    .line 258
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 259
    .line 260
    .line 261
    iget v2, v0, Ltv/danmaku/ijk/media/source/CameraSource;->P:I

    .line 262
    .line 263
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 264
    .line 265
    .line 266
    const-string v2, ";"

    .line 267
    .line 268
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 269
    .line 270
    .line 271
    iget-object v2, v0, Ltv/danmaku/ijk/media/source/CameraSource;->n:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 272
    .line 273
    iget v2, v2, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 274
    .line 275
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 276
    .line 277
    .line 278
    const-string v2, ","

    .line 279
    .line 280
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 281
    .line 282
    .line 283
    iget-object v0, v0, Ltv/danmaku/ijk/media/source/CameraSource;->n:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 284
    .line 285
    iget v0, v0, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 286
    .line 287
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 288
    .line 289
    .line 290
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 291
    .line 292
    .line 293
    move-result-object v0

    .line 294
    invoke-static {v10, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 295
    .line 296
    .line 297
    return-void
.end method

.method public F(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->n:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 2
    .line 3
    iput p1, p0, Lcom/immomo/mediacore/strinf/VideoQuality;->framerate:I

    .line 4
    .line 5
    return-void
.end method

.method public G(I)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->q:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    goto/16 :goto_1

    .line 7
    .line 8
    :cond_0
    iput p1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->h:I

    .line 9
    .line 10
    new-instance v0, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    const-string v2, "setVideoResolution:"

    .line 13
    .line 14
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    const-string v0, "VideoSource"

    .line 25
    .line 26
    invoke-static {v0, p1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    iget p1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->h:I

    .line 30
    .line 31
    const/4 v2, 0x2

    .line 32
    const/16 v3, 0x2d0

    .line 33
    .line 34
    if-ne p1, v2, :cond_1

    .line 35
    .line 36
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->n:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 37
    .line 38
    const/16 v1, 0x180

    .line 39
    .line 40
    iput v1, p1, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 41
    .line 42
    iput v3, p1, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    const/4 v2, 0x3

    .line 46
    if-ne p1, v2, :cond_2

    .line 47
    .line 48
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->n:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 49
    .line 50
    iput v3, p1, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 51
    .line 52
    const/16 v1, 0x500

    .line 53
    .line 54
    iput v1, p1, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_2
    if-ne p1, v1, :cond_3

    .line 58
    .line 59
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->n:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 60
    .line 61
    const/16 v1, 0x160

    .line 62
    .line 63
    iput v1, p1, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 64
    .line 65
    const/16 v1, 0x280

    .line 66
    .line 67
    iput v1, p1, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_3
    iget-object v1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->n:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 71
    .line 72
    const/4 v2, 0x5

    .line 73
    if-ne p1, v2, :cond_4

    .line 74
    .line 75
    const/16 p1, 0x210

    .line 76
    .line 77
    iput p1, v1, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 78
    .line 79
    const/16 p1, 0x3c0

    .line 80
    .line 81
    iput p1, v1, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_4
    const/16 p1, 0xb4

    .line 85
    .line 86
    iput p1, v1, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 87
    .line 88
    const/16 p1, 0x140

    .line 89
    .line 90
    iput p1, v1, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 91
    .line 92
    :goto_0
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->E:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 93
    .line 94
    if-eqz p1, :cond_5

    .line 95
    .line 96
    new-instance p1, Ljava/lang/StringBuilder;

    .line 97
    .line 98
    const-string v1, "setVideoResolution call setVideoQuality():"

    .line 99
    .line 100
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    iget-object v1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->n:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 104
    .line 105
    iget v1, v1, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 106
    .line 107
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    const-string v1, ","

    .line 111
    .line 112
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    iget-object v1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->n:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 116
    .line 117
    iget v1, v1, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 118
    .line 119
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    invoke-static {v0, p1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 127
    .line 128
    .line 129
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->E:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 130
    .line 131
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->n:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 132
    .line 133
    invoke-virtual {p1, p0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->Y0(Lcom/immomo/mediacore/strinf/VideoQuality;)V

    .line 134
    .line 135
    .line 136
    :cond_5
    :goto_1
    return-void
.end method

.method public H(I)V
    .locals 1

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->G:I

    .line 2
    .line 3
    const/4 v0, 0x5

    .line 4
    if-lt p1, v0, :cond_0

    .line 5
    .line 6
    const/16 v0, 0x8

    .line 7
    .line 8
    if-gt p1, v0, :cond_0

    .line 9
    .line 10
    const/4 p1, 0x1

    .line 11
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->J:Z

    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public I(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->c:Landroid/hardware/Camera$Parameters;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->f:Landroid/hardware/Camera;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    :try_start_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->c:Landroid/hardware/Camera$Parameters;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getMaxZoom()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-lt p1, v0, :cond_1

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    :cond_1
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->c:Landroid/hardware/Camera$Parameters;

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->isSmoothZoomSupported()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->f:Landroid/hardware/Camera;

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Landroid/hardware/Camera;->startSmoothZoom(I)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_2
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->c:Landroid/hardware/Camera$Parameters;

    .line 34
    .line 35
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->isZoomSupported()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_3

    .line 40
    .line 41
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->c:Landroid/hardware/Camera$Parameters;

    .line 42
    .line 43
    invoke-virtual {v0, p1}, Landroid/hardware/Camera$Parameters;->setZoom(I)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->f:Landroid/hardware/Camera;

    .line 47
    .line 48
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->c:Landroid/hardware/Camera$Parameters;

    .line 49
    .line 50
    invoke-virtual {p1, p0}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :catch_0
    move-exception p0

    .line 55
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :catch_1
    move-exception p0

    .line 60
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 61
    .line 62
    .line 63
    :cond_3
    :goto_0
    return-void
.end method

.method public N()V
    .locals 5

    .line 1
    iget v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->k:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 v0, 0x0

    .line 8
    :goto_0
    iput v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->k:I

    .line 9
    .line 10
    const-string v0, "VideoSource"

    .line 11
    .line 12
    const-string v1, "switchCamera"

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->i:Ljava/lang/Object;

    .line 18
    .line 19
    monitor-enter v0

    .line 20
    :try_start_0
    iget-object v1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->E:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 21
    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    iget v2, p0, Ltv/danmaku/ijk/media/source/CameraSource;->k:I

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->K0(I)V

    .line 27
    .line 28
    .line 29
    goto :goto_1

    .line 30
    :catchall_0
    move-exception p0

    .line 31
    goto :goto_2

    .line 32
    :cond_1
    :goto_1
    iget v1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->h:I

    .line 33
    .line 34
    invoke-virtual {p0, v1}, Ltv/danmaku/ijk/media/source/CameraSource;->G(I)V

    .line 35
    .line 36
    .line 37
    invoke-direct {p0}, Ltv/danmaku/ijk/media/source/CameraSource;->r0()V

    .line 38
    .line 39
    .line 40
    iget-object v1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->i:Ljava/lang/Object;

    .line 41
    .line 42
    const-wide/16 v2, 0xfa0

    .line 43
    .line 44
    invoke-virtual {v1, v2, v3}, Ljava/lang/Object;->wait(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 45
    .line 46
    .line 47
    :try_start_1
    const-string p0, "VideoSource"

    .line 48
    .line 49
    const-string v1, "switchCamera end"

    .line 50
    .line 51
    invoke-static {p0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    .line 53
    .line 54
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 55
    return-void

    .line 56
    :catchall_1
    move-exception p0

    .line 57
    goto :goto_3

    .line 58
    :catch_0
    :try_start_2
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->e:Lcom/immomo/mediacore/strinf/NotifyCenter;

    .line 59
    .line 60
    if-eqz p0, :cond_2

    .line 61
    .line 62
    const/4 v1, 0x2

    .line 63
    const/4 v2, 0x0

    .line 64
    const/16 v3, 0x12c

    .line 65
    .line 66
    const/16 v4, -0x12f

    .line 67
    .line 68
    invoke-interface {p0, v3, v4, v1, v2}, Lcom/immomo/mediacore/strinf/NotifyCenter;->notify(IIILjava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 69
    .line 70
    .line 71
    :cond_2
    :try_start_3
    monitor-exit v0

    .line 72
    return-void

    .line 73
    :goto_2
    throw p0

    .line 74
    :goto_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 75
    throw p0
.end method

.method public O(Landroid/content/Context;Ll/jt2;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->E:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->c1(Landroid/content/Context;Ll/jt2;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public P()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ltv/danmaku/ijk/media/source/CameraSource;->z0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public R(Lcom/immomo/mediacore/strinf/VideoQuality;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/source/CameraSource;->B0(Lcom/immomo/mediacore/strinf/VideoQuality;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public a(Ll/jt2;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->E:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->Y(Ll/jt2;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public b(Landroid/graphics/Rect;Landroid/hardware/Camera$AutoFocusCallback;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->f:Landroid/hardware/Camera;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_2

    .line 6
    :cond_0
    :try_start_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->f:Landroid/hardware/Camera;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 9
    .line 10
    .line 11
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    goto :goto_0

    .line 13
    :catch_0
    const/4 v0, 0x0

    .line 14
    :goto_0
    if-nez v0, :cond_1

    .line 15
    .line 16
    goto :goto_2

    .line 17
    :cond_1
    invoke-direct {p0, v0}, Ltv/danmaku/ijk/media/source/CameraSource;->u0(Landroid/hardware/Camera$Parameters;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-nez v1, :cond_3

    .line 22
    .line 23
    invoke-direct {p0, v0}, Ltv/danmaku/ijk/media/source/CameraSource;->v0(Landroid/hardware/Camera$Parameters;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-nez v1, :cond_2

    .line 28
    .line 29
    goto :goto_2

    .line 30
    :cond_2
    const-string v1, "continuous-video"

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_3
    const-string v1, "auto"

    .line 34
    .line 35
    :goto_1
    invoke-virtual {v0, v1}, Landroid/hardware/Camera$Parameters;->setFocusMode(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    new-instance v1, Ljava/util/ArrayList;

    .line 39
    .line 40
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 41
    .line 42
    .line 43
    new-instance v2, Ljava/util/ArrayList;

    .line 44
    .line 45
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 46
    .line 47
    .line 48
    new-instance v3, Landroid/hardware/Camera$Area;

    .line 49
    .line 50
    const/16 v4, 0x3e8

    .line 51
    .line 52
    invoke-direct {v3, p1, v4}, Landroid/hardware/Camera$Area;-><init>(Landroid/graphics/Rect;I)V

    .line 53
    .line 54
    .line 55
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    new-instance v3, Landroid/hardware/Camera$Area;

    .line 59
    .line 60
    invoke-direct {v3, p1, v4}, Landroid/hardware/Camera$Area;-><init>(Landroid/graphics/Rect;I)V

    .line 61
    .line 62
    .line 63
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0, v1}, Landroid/hardware/Camera$Parameters;->setFocusAreas(Ljava/util/List;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getMaxNumMeteringAreas()I

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-lez p1, :cond_4

    .line 74
    .line 75
    invoke-virtual {v0, v2}, Landroid/hardware/Camera$Parameters;->setMeteringAreas(Ljava/util/List;)V

    .line 76
    .line 77
    .line 78
    :cond_4
    :try_start_1
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->f:Landroid/hardware/Camera;

    .line 79
    .line 80
    invoke-virtual {p1, v0}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 81
    .line 82
    .line 83
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->f:Landroid/hardware/Camera;

    .line 84
    .line 85
    invoke-virtual {p0, p2}, Landroid/hardware/Camera;->autoFocus(Landroid/hardware/Camera$AutoFocusCallback;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 86
    .line 87
    .line 88
    goto :goto_2

    .line 89
    :catch_1
    move-exception p0

    .line 90
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 91
    .line 92
    .line 93
    :goto_2
    return-void
.end method

.method public c()J
    .locals 2

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->E:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->l0()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public d()J
    .locals 2

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->E:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->m0()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public e()Landroid/hardware/Camera;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->f:Landroid/hardware/Camera;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->P:I

    .line 2
    .line 3
    return p0
.end method

.method public g()I
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->c:Landroid/hardware/Camera$Parameters;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getZoom()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public h()J
    .locals 2

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->E:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->o0()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public i()J
    .locals 2

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->E:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->p0()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public j()J
    .locals 2

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->E:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->q0()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public k()J
    .locals 2

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->E:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->r0()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public l()I
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->c:Landroid/hardware/Camera$Parameters;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getMaxZoom()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    add-int/lit8 p0, p0, -0x1

    .line 10
    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method public m()I
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->E:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->x0()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public n()Lcom/immomo/mediacore/strinf/VideoQuality;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "getVideoQuality: width"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->n:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 9
    .line 10
    iget v1, v1, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, ";heigh:"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->n:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 21
    .line 22
    iget v1, v1, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "VideoSource"

    .line 32
    .line 33
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->n:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 37
    .line 38
    return-object p0
.end method

.method public o()Z
    .locals 1

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->k:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public p()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method

.method public q()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ltv/danmaku/ijk/media/source/CameraSource;->z0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->i:Ljava/lang/Object;

    .line 5
    .line 6
    monitor-enter v0

    .line 7
    :try_start_0
    iget-object v1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->R:Landroid/os/Handler;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    iget-object v1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->S:Landroid/os/HandlerThread;

    .line 16
    .line 17
    invoke-virtual {v1}, Landroid/os/HandlerThread;->quit()Z

    .line 18
    .line 19
    .line 20
    iput-object v2, p0, Ltv/danmaku/ijk/media/source/CameraSource;->S:Landroid/os/HandlerThread;

    .line 21
    .line 22
    iput-object v2, p0, Ltv/danmaku/ijk/media/source/CameraSource;->R:Landroid/os/Handler;

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
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/source/SourceBase;->M()V

    .line 28
    .line 29
    .line 30
    iput-object v2, p0, Ltv/danmaku/ijk/media/source/CameraSource;->D:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnVideoPreviewSizeSetListener;

    .line 31
    .line 32
    iput-object v2, p0, Ltv/danmaku/ijk/media/source/CameraSource;->d:Landroid/app/Activity;

    .line 33
    .line 34
    monitor-exit v0

    .line 35
    return-void

    .line 36
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 37
    throw p0
.end method

.method public q0(Ljava/util/List;I)Landroid/hardware/Camera$Size;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/hardware/Camera$Size;",
            ">;I)",
            "Landroid/hardware/Camera$Size;"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_8

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_4

    .line 10
    .line 11
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    new-array v0, v0, [Landroid/hardware/Camera$Size;

    .line 16
    .line 17
    invoke-interface {p1, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    check-cast p1, [Landroid/hardware/Camera$Size;

    .line 22
    .line 23
    add-int/lit16 v0, p2, 0x168

    .line 24
    .line 25
    rem-int/lit16 v0, v0, 0xb4

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    const/16 v2, 0x5a

    .line 29
    .line 30
    if-ne v0, v2, :cond_1

    .line 31
    .line 32
    array-length v0, p1

    .line 33
    move v3, v1

    .line 34
    :goto_0
    if-ge v3, v0, :cond_1

    .line 35
    .line 36
    aget-object v4, p1, v3

    .line 37
    .line 38
    iget v5, v4, Landroid/hardware/Camera$Size;->width:I

    .line 39
    .line 40
    iget v6, v4, Landroid/hardware/Camera$Size;->height:I

    .line 41
    .line 42
    iput v6, v4, Landroid/hardware/Camera$Size;->width:I

    .line 43
    .line 44
    iput v5, v4, Landroid/hardware/Camera$Size;->height:I

    .line 45
    .line 46
    add-int/lit8 v3, v3, 0x1

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    new-instance v0, Ltv/danmaku/ijk/media/source/CameraSource$2;

    .line 50
    .line 51
    invoke-direct {v0, p0}, Ltv/danmaku/ijk/media/source/CameraSource$2;-><init>(Ltv/danmaku/ijk/media/source/CameraSource;)V

    .line 52
    .line 53
    .line 54
    invoke-static {p1, v0}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 55
    .line 56
    .line 57
    :goto_1
    array-length v0, p1

    .line 58
    const-string v3, "VideoSource"

    .line 59
    .line 60
    if-ge v1, v0, :cond_3

    .line 61
    .line 62
    new-instance v0, Ljava/lang/StringBuilder;

    .line 63
    .line 64
    const-string v4, "Support Preview Size: width:"

    .line 65
    .line 66
    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    aget-object v4, p1, v1

    .line 70
    .line 71
    iget v4, v4, Landroid/hardware/Camera$Size;->width:I

    .line 72
    .line 73
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    const-string v4, ", height:"

    .line 77
    .line 78
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    aget-object v4, p1, v1

    .line 82
    .line 83
    iget v4, v4, Landroid/hardware/Camera$Size;->height:I

    .line 84
    .line 85
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-static {v3, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 93
    .line 94
    .line 95
    aget-object v0, p1, v1

    .line 96
    .line 97
    iget v4, v0, Landroid/hardware/Camera$Size;->width:I

    .line 98
    .line 99
    iget v5, p0, Ltv/danmaku/ijk/media/source/CameraSource;->v:I

    .line 100
    .line 101
    if-lt v4, v5, :cond_2

    .line 102
    .line 103
    iget v0, v0, Landroid/hardware/Camera$Size;->height:I

    .line 104
    .line 105
    iget v4, p0, Ltv/danmaku/ijk/media/source/CameraSource;->x:I

    .line 106
    .line 107
    if-lt v0, v4, :cond_2

    .line 108
    .line 109
    goto :goto_2

    .line 110
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 111
    .line 112
    goto :goto_1

    .line 113
    :cond_3
    :goto_2
    array-length v0, p1

    .line 114
    if-eq v1, v0, :cond_4

    .line 115
    .line 116
    aget-object p1, p1, v1

    .line 117
    .line 118
    iget v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->v:I

    .line 119
    .line 120
    iput v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->u:I

    .line 121
    .line 122
    iget v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->x:I

    .line 123
    .line 124
    iput v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->w:I

    .line 125
    .line 126
    goto :goto_3

    .line 127
    :cond_4
    const-string v0, "preferred preview size not in the preview size list"

    .line 128
    .line 129
    invoke-static {v3, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 130
    .line 131
    .line 132
    add-int/lit8 v1, v1, -0x1

    .line 133
    .line 134
    aget-object p1, p1, v1

    .line 135
    .line 136
    iget v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->v:I

    .line 137
    .line 138
    iget v1, p1, Landroid/hardware/Camera$Size;->height:I

    .line 139
    .line 140
    mul-int v4, v0, v1

    .line 141
    .line 142
    iget v5, p0, Ltv/danmaku/ijk/media/source/CameraSource;->x:I

    .line 143
    .line 144
    iget v6, p1, Landroid/hardware/Camera$Size;->width:I

    .line 145
    .line 146
    mul-int v7, v5, v6

    .line 147
    .line 148
    if-lt v4, v7, :cond_5

    .line 149
    .line 150
    iput v6, p0, Ltv/danmaku/ijk/media/source/CameraSource;->u:I

    .line 151
    .line 152
    mul-int/2addr v5, v6

    .line 153
    div-int/2addr v5, v0

    .line 154
    iput v5, p0, Ltv/danmaku/ijk/media/source/CameraSource;->w:I

    .line 155
    .line 156
    goto :goto_3

    .line 157
    :cond_5
    iput v1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->w:I

    .line 158
    .line 159
    mul-int/2addr v0, v1

    .line 160
    div-int/2addr v0, v5

    .line 161
    iput v0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->u:I

    .line 162
    .line 163
    :goto_3
    if-eq p2, v2, :cond_6

    .line 164
    .line 165
    const/16 v0, 0x10e

    .line 166
    .line 167
    if-ne p2, v0, :cond_7

    .line 168
    .line 169
    :cond_6
    iget p2, p1, Landroid/hardware/Camera$Size;->width:I

    .line 170
    .line 171
    iget v0, p1, Landroid/hardware/Camera$Size;->height:I

    .line 172
    .line 173
    iput v0, p1, Landroid/hardware/Camera$Size;->width:I

    .line 174
    .line 175
    iput p2, p1, Landroid/hardware/Camera$Size;->height:I

    .line 176
    .line 177
    :cond_7
    new-instance p2, Ljava/lang/StringBuilder;

    .line 178
    .line 179
    const-string v0, "preview size:"

    .line 180
    .line 181
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 182
    .line 183
    .line 184
    iget v0, p1, Landroid/hardware/Camera$Size;->width:I

    .line 185
    .line 186
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 187
    .line 188
    .line 189
    const-string v0, "*"

    .line 190
    .line 191
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 192
    .line 193
    .line 194
    iget v1, p1, Landroid/hardware/Camera$Size;->height:I

    .line 195
    .line 196
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 197
    .line 198
    .line 199
    const-string v1, "process Size"

    .line 200
    .line 201
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 202
    .line 203
    .line 204
    iget v1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->u:I

    .line 205
    .line 206
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 207
    .line 208
    .line 209
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 210
    .line 211
    .line 212
    iget p0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->w:I

    .line 213
    .line 214
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 215
    .line 216
    .line 217
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object p0

    .line 221
    invoke-static {v3, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 222
    .line 223
    .line 224
    return-object p1

    .line 225
    :cond_8
    :goto_4
    const/4 p0, 0x0

    .line 226
    return-object p0
.end method

.method public declared-synchronized r(Landroid/app/Activity;ILtv/danmaku/ijk/media/streamer/MomoSurface;)V
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    const-string v0, "VideoSource"

    .line 3
    .line 4
    const-string v1, "selectCamera"

    .line 5
    .line 6
    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 7
    .line 8
    .line 9
    iput-object p3, p0, Ltv/danmaku/ijk/media/source/CameraSource;->E:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 10
    .line 11
    invoke-virtual {p3}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->v0()Landroid/graphics/SurfaceTexture;

    .line 12
    .line 13
    .line 14
    move-result-object p3

    .line 15
    iput-object p3, p0, Ltv/danmaku/ijk/media/source/CameraSource;->g:Landroid/graphics/SurfaceTexture;

    .line 16
    .line 17
    iput-object p1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->d:Landroid/app/Activity;

    .line 18
    .line 19
    iput p2, p0, Ltv/danmaku/ijk/media/source/CameraSource;->k:I

    .line 20
    .line 21
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->E:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 22
    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    invoke-virtual {p1, p2}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->K0(I)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->E:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 29
    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    new-instance p2, Ltv/danmaku/ijk/media/source/CameraSource$1;

    .line 33
    .line 34
    invoke-direct {p2, p0}, Ltv/danmaku/ijk/media/source/CameraSource$1;-><init>(Ltv/danmaku/ijk/media/source/CameraSource;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1, p2}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->N0(Ltv/danmaku/ijk/media/streamer/MomoSurface$FrameRateUpdateListener;)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :catchall_0
    move-exception p1

    .line 42
    goto :goto_4

    .line 43
    :cond_0
    :goto_0
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->i:Ljava/lang/Object;

    .line 44
    .line 45
    monitor-enter p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 46
    :try_start_1
    iget p2, p0, Ltv/danmaku/ijk/media/source/CameraSource;->h:I

    .line 47
    .line 48
    invoke-virtual {p0, p2}, Ltv/danmaku/ijk/media/source/CameraSource;->G(I)V

    .line 49
    .line 50
    .line 51
    invoke-direct {p0}, Ltv/danmaku/ijk/media/source/CameraSource;->r0()V

    .line 52
    .line 53
    .line 54
    iget-object p2, p0, Ltv/danmaku/ijk/media/source/CameraSource;->i:Ljava/lang/Object;

    .line 55
    .line 56
    const-wide/16 v0, 0xfa0

    .line 57
    .line 58
    invoke-virtual {p2, v0, v1}, Ljava/lang/Object;->wait(J)V

    .line 59
    .line 60
    .line 61
    iget-object p2, p0, Ltv/danmaku/ijk/media/source/CameraSource;->e:Lcom/immomo/mediacore/strinf/NotifyCenter;

    .line 62
    .line 63
    if-eqz p2, :cond_1

    .line 64
    .line 65
    invoke-interface {p2}, Lcom/immomo/mediacore/strinf/NotifyCenter;->setSourceSucess()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 66
    .line 67
    .line 68
    goto :goto_1

    .line 69
    :catchall_1
    move-exception p2

    .line 70
    goto :goto_2

    .line 71
    :cond_1
    :goto_1
    :try_start_2
    monitor-exit p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 72
    const/4 p1, 0x1

    .line 73
    :try_start_3
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->q:Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 74
    .line 75
    monitor-exit p0

    .line 76
    return-void

    .line 77
    :catchall_2
    move-exception p2

    .line 78
    goto :goto_3

    .line 79
    :catch_0
    :try_start_4
    iget-object p2, p0, Ltv/danmaku/ijk/media/source/CameraSource;->e:Lcom/immomo/mediacore/strinf/NotifyCenter;

    .line 80
    .line 81
    if-eqz p2, :cond_2

    .line 82
    .line 83
    const/4 p3, 0x2

    .line 84
    const/4 v0, 0x0

    .line 85
    const/16 v1, 0x12c

    .line 86
    .line 87
    const/16 v2, -0x12f

    .line 88
    .line 89
    invoke-interface {p2, v1, v2, p3, v0}, Lcom/immomo/mediacore/strinf/NotifyCenter;->notify(IIILjava/lang/Object;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 90
    .line 91
    .line 92
    :cond_2
    :try_start_5
    monitor-exit p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 93
    monitor-exit p0

    .line 94
    return-void

    .line 95
    :goto_2
    :try_start_6
    throw p2

    .line 96
    :goto_3
    monitor-exit p1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 97
    :try_start_7
    throw p2

    .line 98
    :goto_4
    monitor-exit p0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 99
    throw p1
.end method

.method public s(Landroid/content/Context;Ll/jt2;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->E:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->H0(Landroid/content/Context;Ll/jt2;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public t(Landroid/content/Context;Ll/jt2;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/CameraSource;->E:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->I0(Landroid/content/Context;Ll/jt2;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public u(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->K:Z

    .line 2
    .line 3
    return-void
.end method

.method public v(I)V
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->P:I

    .line 2
    .line 3
    return-void
.end method

.method public w(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->F:Z

    .line 2
    .line 3
    return-void
.end method

.method public w0(Landroid/hardware/Camera$Parameters;I)[I
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewFpsRange()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Ltv/danmaku/ijk/media/source/CameraSource$3;

    .line 6
    .line 7
    invoke-direct {v0, p0, p2}, Ltv/danmaku/ijk/media/source/CameraSource$3;-><init>(Ltv/danmaku/ijk/media/source/CameraSource;I)V

    .line 8
    .line 9
    .line 10
    invoke-static {p1, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    move p2, p0

    .line 15
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/4 v1, 0x1

    .line 20
    if-ge p2, v0, :cond_0

    .line 21
    .line 22
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, [I

    .line 27
    .line 28
    aget v0, v0, p0

    .line 29
    .line 30
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    check-cast v2, [I

    .line 35
    .line 36
    aget v2, v2, v1

    .line 37
    .line 38
    if-ne v0, v2, :cond_0

    .line 39
    .line 40
    add-int/lit8 p2, p2, 0x1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-lt p2, v0, :cond_1

    .line 48
    .line 49
    move p2, p0

    .line 50
    :cond_1
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    check-cast v0, [I

    .line 55
    .line 56
    aget p0, v0, p0

    .line 57
    .line 58
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    check-cast p1, [I

    .line 63
    .line 64
    aget p1, p1, v1

    .line 65
    .line 66
    filled-new-array {p0, p1}, [I

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    return-object p0
.end method

.method public x(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public y(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->O:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public z(F)V
    .locals 1

    .line 1
    const v0, 0x3f4ccccd    # 0.8f

    .line 2
    .line 3
    .line 4
    mul-float/2addr p1, v0

    .line 5
    iput p1, p0, Ltv/danmaku/ijk/media/source/CameraSource;->I:F

    .line 6
    .line 7
    return-void
.end method
