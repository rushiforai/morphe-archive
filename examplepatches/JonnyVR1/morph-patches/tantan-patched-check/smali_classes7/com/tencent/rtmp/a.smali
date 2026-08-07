.class public Lcom/tencent/rtmp/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/liteav/basic/b/b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/rtmp/a$a;
    }
.end annotation


# instance fields
.field private A:J

.field private B:Ljava/lang/String;

.field private C:I

.field private D:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private E:J

.field private F:Lcom/tencent/rtmp/TXLivePlayer$ITXAudioVolumeEvaluationListener;

.field private G:I

.field private H:Lcom/tencent/rtmp/a$a;

.field private I:Lcom/tencent/rtmp/TXLivePlayer$ITXAudioRawDataListener;

.field private a:Lcom/tencent/rtmp/ui/TXCloudVideoView;

.field private b:Landroid/view/Surface;

.field private c:I

.field private d:I

.field private e:Lcom/tencent/rtmp/ITXLivePlayListener;

.field private f:Lcom/tencent/rtmp/TXLivePlayConfig;

.field private g:Z

.field private h:Z

.field private i:I

.field private j:I

.field private k:Ljava/lang/String;

.field private l:Z

.field private m:I

.field private n:Lcom/tencent/rtmp/TXLivePlayer$ITXVideoRawDataListener;

.field private o:[B

.field private p:Ljava/lang/Object;

.field private q:Lcom/tencent/rtmp/TXLivePlayer$ITXLivePlayVideoRenderListener;

.field private r:Landroid/content/Context;

.field private s:Landroid/os/Handler;

.field private t:Lcom/tencent/liteav/n;

.field private u:Z

.field private v:F

.field private w:Z

.field private x:I

.field private y:Lcom/tencent/liteav/j;

.field private z:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/tencent/rtmp/a;->g:Z

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    iput-boolean v1, p0, Lcom/tencent/rtmp/a;->h:Z

    .line 9
    .line 10
    const-string v2, ""

    .line 11
    .line 12
    iput-object v2, p0, Lcom/tencent/rtmp/a;->k:Ljava/lang/String;

    .line 13
    .line 14
    iput-boolean v0, p0, Lcom/tencent/rtmp/a;->l:Z

    .line 15
    .line 16
    const/16 v2, 0x64

    .line 17
    .line 18
    iput v2, p0, Lcom/tencent/rtmp/a;->m:I

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    iput-object v2, p0, Lcom/tencent/rtmp/a;->n:Lcom/tencent/rtmp/TXLivePlayer$ITXVideoRawDataListener;

    .line 22
    .line 23
    iput-object v2, p0, Lcom/tencent/rtmp/a;->o:[B

    .line 24
    .line 25
    iput-object v2, p0, Lcom/tencent/rtmp/a;->p:Ljava/lang/Object;

    .line 26
    .line 27
    iput-object v2, p0, Lcom/tencent/rtmp/a;->q:Lcom/tencent/rtmp/TXLivePlayer$ITXLivePlayVideoRenderListener;

    .line 28
    .line 29
    iput-boolean v1, p0, Lcom/tencent/rtmp/a;->u:Z

    .line 30
    .line 31
    const/high16 v1, 0x3f800000    # 1.0f

    .line 32
    .line 33
    iput v1, p0, Lcom/tencent/rtmp/a;->v:F

    .line 34
    .line 35
    iput-boolean v0, p0, Lcom/tencent/rtmp/a;->w:Z

    .line 36
    .line 37
    iput v0, p0, Lcom/tencent/rtmp/a;->x:I

    .line 38
    .line 39
    const/4 v1, -0x1

    .line 40
    iput v1, p0, Lcom/tencent/rtmp/a;->C:I

    .line 41
    .line 42
    new-instance v1, Ljava/util/Vector;

    .line 43
    .line 44
    invoke-direct {v1}, Ljava/util/Vector;-><init>()V

    .line 45
    .line 46
    .line 47
    iput-object v1, p0, Lcom/tencent/rtmp/a;->D:Ljava/util/Vector;

    .line 48
    .line 49
    const-wide/16 v3, 0x0

    .line 50
    .line 51
    iput-wide v3, p0, Lcom/tencent/rtmp/a;->E:J

    .line 52
    .line 53
    iput-object v2, p0, Lcom/tencent/rtmp/a;->F:Lcom/tencent/rtmp/TXLivePlayer$ITXAudioVolumeEvaluationListener;

    .line 54
    .line 55
    iput v0, p0, Lcom/tencent/rtmp/a;->G:I

    .line 56
    .line 57
    iput-object v2, p0, Lcom/tencent/rtmp/a;->H:Lcom/tencent/rtmp/a$a;

    .line 58
    .line 59
    iput-object v2, p0, Lcom/tencent/rtmp/a;->e:Lcom/tencent/rtmp/ITXLivePlayListener;

    .line 60
    .line 61
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    iput-object p1, p0, Lcom/tencent/rtmp/a;->r:Landroid/content/Context;

    .line 66
    .line 67
    invoke-static {p1}, Lcom/tencent/liteav/basic/util/TXCCommonUtil;->setAppContext(Landroid/content/Context;)V

    .line 68
    .line 69
    .line 70
    invoke-static {}, Lcom/tencent/liteav/basic/log/TXCLog;->init()Z

    .line 71
    .line 72
    .line 73
    new-instance p1, Landroid/os/Handler;

    .line 74
    .line 75
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-direct {p1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 80
    .line 81
    .line 82
    iput-object p1, p0, Lcom/tencent/rtmp/a;->s:Landroid/os/Handler;

    .line 83
    .line 84
    iget-object p0, p0, Lcom/tencent/rtmp/a;->r:Landroid/content/Context;

    .line 85
    .line 86
    invoke-static {p0}, Lcom/tencent/liteav/basic/util/TXCCommonUtil;->setAppContext(Landroid/content/Context;)V

    .line 87
    .line 88
    .line 89
    invoke-static {}, Lcom/tencent/liteav/basic/log/TXCLog;->init()Z

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public static synthetic a(Lcom/tencent/rtmp/a;J)J
    .locals 0

    .line 430
    iput-wide p1, p0, Lcom/tencent/rtmp/a;->A:J

    return-wide p1
.end method

.method public static synthetic a(Lcom/tencent/rtmp/a;)Lcom/tencent/liteav/n;
    .locals 0

    .line 397
    iget-object p0, p0, Lcom/tencent/rtmp/a;->t:Lcom/tencent/liteav/n;

    return-object p0
.end method

.method private a(Lcom/tencent/rtmp/TXLivePlayer$ITXSnapshotListener;Landroid/graphics/Bitmap;)V
    .locals 2

    if-nez p1, :cond_0

    return-void

    .line 496
    :cond_0
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 497
    new-instance v1, Lcom/tencent/rtmp/a$5;

    invoke-direct {v1, p0, p1, p2}, Lcom/tencent/rtmp/a$5;-><init>(Lcom/tencent/rtmp/a;Lcom/tencent/rtmp/TXLivePlayer$ITXSnapshotListener;Landroid/graphics/Bitmap;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public static synthetic a(Lcom/tencent/rtmp/a;Lcom/tencent/rtmp/TXLivePlayer$ITXSnapshotListener;Landroid/graphics/Bitmap;)V
    .locals 0

    .line 398
    invoke-direct {p0, p1, p2}, Lcom/tencent/rtmp/a;->a(Lcom/tencent/rtmp/TXLivePlayer$ITXSnapshotListener;Landroid/graphics/Bitmap;)V

    return-void
.end method

.method public static synthetic a(Lcom/tencent/rtmp/a;Z)Z
    .locals 0

    .line 399
    iput-boolean p1, p0, Lcom/tencent/rtmp/a;->w:Z

    return p1
.end method

.method public static synthetic a(Lcom/tencent/rtmp/a;[B)[B
    .locals 0

    .line 400
    iput-object p1, p0, Lcom/tencent/rtmp/a;->o:[B

    return-object p1
.end method

.method public static synthetic b(Lcom/tencent/rtmp/a;)Lcom/tencent/rtmp/TXLivePlayer$ITXAudioVolumeEvaluationListener;
    .locals 0

    .line 144
    iget-object p0, p0, Lcom/tencent/rtmp/a;->F:Lcom/tencent/rtmp/TXLivePlayer$ITXAudioVolumeEvaluationListener;

    return-object p0
.end method

.method public static synthetic c(Lcom/tencent/rtmp/a;)Landroid/os/Handler;
    .locals 0

    .line 143
    iget-object p0, p0, Lcom/tencent/rtmp/a;->s:Landroid/os/Handler;

    return-object p0
.end method

.method private c(Ljava/lang/String;I)Ljava/lang/String;
    .locals 3

    .line 1
    const/4 p0, 0x6

    .line 2
    if-eq p2, p0, :cond_4

    .line 3
    .line 4
    :try_start_0
    const-string p0, "UTF-8"

    .line 5
    .line 6
    invoke-virtual {p1, p0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    new-instance p2, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    array-length v0, p0

    .line 13
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 14
    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    :goto_0
    array-length v1, p0

    .line 18
    if-ge v0, v1, :cond_3

    .line 19
    .line 20
    aget-byte v1, p0, v0

    .line 21
    .line 22
    if-gez v1, :cond_0

    .line 23
    .line 24
    add-int/lit16 v1, v1, 0x100

    .line 25
    .line 26
    :cond_0
    const/16 v2, 0x20

    .line 27
    .line 28
    if-le v1, v2, :cond_2

    .line 29
    .line 30
    const/16 v2, 0x7f

    .line 31
    .line 32
    if-ge v1, v2, :cond_2

    .line 33
    .line 34
    const/16 v2, 0x22

    .line 35
    .line 36
    if-eq v1, v2, :cond_2

    .line 37
    .line 38
    const/16 v2, 0x25

    .line 39
    .line 40
    if-eq v1, v2, :cond_2

    .line 41
    .line 42
    const/16 v2, 0x3c

    .line 43
    .line 44
    if-eq v1, v2, :cond_2

    .line 45
    .line 46
    const/16 v2, 0x3e

    .line 47
    .line 48
    if-eq v1, v2, :cond_2

    .line 49
    .line 50
    const/16 v2, 0x5b

    .line 51
    .line 52
    if-eq v1, v2, :cond_2

    .line 53
    .line 54
    const/16 v2, 0x7d

    .line 55
    .line 56
    if-eq v1, v2, :cond_2

    .line 57
    .line 58
    const/16 v2, 0x5c

    .line 59
    .line 60
    if-eq v1, v2, :cond_2

    .line 61
    .line 62
    const/16 v2, 0x5d

    .line 63
    .line 64
    if-eq v1, v2, :cond_2

    .line 65
    .line 66
    const/16 v2, 0x5e

    .line 67
    .line 68
    if-eq v1, v2, :cond_2

    .line 69
    .line 70
    const/16 v2, 0x60

    .line 71
    .line 72
    if-eq v1, v2, :cond_2

    .line 73
    .line 74
    const/16 v2, 0x7b

    .line 75
    .line 76
    if-eq v1, v2, :cond_2

    .line 77
    .line 78
    const/16 v2, 0x7c

    .line 79
    .line 80
    if-ne v1, v2, :cond_1

    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_1
    int-to-char v1, v1

    .line 84
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    goto :goto_2

    .line 88
    :catch_0
    move-exception p0

    .line 89
    goto :goto_3

    .line 90
    :cond_2
    :goto_1
    const-string v2, "%%%02X"

    .line 91
    .line 92
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    :goto_2
    add-int/lit8 v0, v0, 0x1

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_3
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 114
    goto :goto_4

    .line 115
    :goto_3
    const-string p2, "TXLivePlayer"

    .line 116
    .line 117
    const-string v0, "check play url failed."

    .line 118
    .line 119
    invoke-static {p2, v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 120
    .line 121
    .line 122
    :cond_4
    :goto_4
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    return-object p0
.end method

.method public static synthetic d(Lcom/tencent/rtmp/a;)Lcom/tencent/rtmp/a$a;
    .locals 0

    .line 32
    iget-object p0, p0, Lcom/tencent/rtmp/a;->H:Lcom/tencent/rtmp/a$a;

    return-object p0
.end method

.method public static synthetic e(Lcom/tencent/rtmp/a;)Lcom/tencent/rtmp/TXLivePlayer$ITXLivePlayVideoRenderListener;
    .locals 0

    .line 40
    iget-object p0, p0, Lcom/tencent/rtmp/a;->q:Lcom/tencent/rtmp/TXLivePlayer$ITXLivePlayVideoRenderListener;

    return-object p0
.end method

.method private f()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tencent/rtmp/a;->t:Lcom/tencent/liteav/n;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget v1, p0, Lcom/tencent/rtmp/a;->G:I

    .line 6
    .line 7
    if-lez v1, :cond_0

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 v2, 0x0

    .line 12
    :goto_0
    invoke-virtual {v0, v2, v1}, Lcom/tencent/liteav/n;->a(ZI)V

    .line 13
    .line 14
    .line 15
    iget v0, p0, Lcom/tencent/rtmp/a;->G:I

    .line 16
    .line 17
    if-lez v0, :cond_2

    .line 18
    .line 19
    iget-object v0, p0, Lcom/tencent/rtmp/a;->H:Lcom/tencent/rtmp/a$a;

    .line 20
    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    new-instance v0, Lcom/tencent/rtmp/a$a;

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-direct {v0, p0, v1}, Lcom/tencent/rtmp/a$a;-><init>(Lcom/tencent/rtmp/a;Lcom/tencent/rtmp/a$1;)V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Lcom/tencent/rtmp/a;->H:Lcom/tencent/rtmp/a$a;

    .line 30
    .line 31
    :cond_1
    iget-object v0, p0, Lcom/tencent/rtmp/a;->H:Lcom/tencent/rtmp/a$a;

    .line 32
    .line 33
    iget v1, p0, Lcom/tencent/rtmp/a;->G:I

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Lcom/tencent/rtmp/a$a;->a(I)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/tencent/rtmp/a;->s:Landroid/os/Handler;

    .line 39
    .line 40
    if-eqz v0, :cond_2

    .line 41
    .line 42
    iget-object v1, p0, Lcom/tencent/rtmp/a;->H:Lcom/tencent/rtmp/a$a;

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/tencent/rtmp/a;->s:Landroid/os/Handler;

    .line 48
    .line 49
    iget-object v1, p0, Lcom/tencent/rtmp/a;->H:Lcom/tencent/rtmp/a$a;

    .line 50
    .line 51
    iget p0, p0, Lcom/tencent/rtmp/a;->G:I

    .line 52
    .line 53
    int-to-long v2, p0

    .line 54
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 55
    .line 56
    .line 57
    :cond_2
    return-void
.end method

.method public static synthetic f(Lcom/tencent/rtmp/a;)[B
    .locals 0

    .line 58
    iget-object p0, p0, Lcom/tencent/rtmp/a;->o:[B

    return-object p0
.end method

.method public static synthetic g(Lcom/tencent/rtmp/a;)Lcom/tencent/rtmp/TXLivePlayer$ITXVideoRawDataListener;
    .locals 0

    .line 100
    iget-object p0, p0, Lcom/tencent/rtmp/a;->n:Lcom/tencent/rtmp/TXLivePlayer$ITXVideoRawDataListener;

    return-object p0
.end method

.method private g()V
    .locals 3

    .line 94
    iget-object v0, p0, Lcom/tencent/rtmp/a;->t:Lcom/tencent/liteav/n;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 95
    invoke-virtual {v0, v1, v1}, Lcom/tencent/liteav/n;->a(ZI)V

    .line 96
    :cond_0
    iget-object v0, p0, Lcom/tencent/rtmp/a;->s:Landroid/os/Handler;

    if-eqz v0, :cond_1

    .line 97
    iget-object v2, p0, Lcom/tencent/rtmp/a;->H:Lcom/tencent/rtmp/a$a;

    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    :cond_1
    const/4 v0, 0x0

    .line 98
    iput-object v0, p0, Lcom/tencent/rtmp/a;->H:Lcom/tencent/rtmp/a$a;

    .line 99
    iput v1, p0, Lcom/tencent/rtmp/a;->G:I

    return-void
.end method

.method private h()Z
    .locals 1

    .line 1
    sget-object p0, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "HUAWEI"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    sget-object p0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 12
    .line 13
    const-string v0, "Che2-TL00"

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method


# virtual methods
.method public a(Lcom/tencent/rtmp/TXLivePlayer$ITXLivePlayVideoRenderListener;Ljava/lang/Object;)I
    .locals 3

    .line 474
    const-string v0, "TXLivePlayer"

    if-eqz p2, :cond_0

    .line 475
    instance-of v1, p2, Ljavax/microedition/khronos/egl/EGLContext;

    if-nez v1, :cond_0

    instance-of v1, p2, Landroid/opengl/EGLContext;

    if-nez v1, :cond_0

    .line 476
    new-instance p0, Ljava/lang/StringBuilder;

    const-string p1, "liteav_api setVideoRenderListener error when glContext error "

    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, -0x1

    return p0

    .line 477
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "liteav_api setVideoRenderListener "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ", context "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 478
    iput-object p2, p0, Lcom/tencent/rtmp/a;->p:Ljava/lang/Object;

    .line 479
    iput-object p1, p0, Lcom/tencent/rtmp/a;->q:Lcom/tencent/rtmp/TXLivePlayer$ITXLivePlayVideoRenderListener;

    .line 480
    iget-object v0, p0, Lcom/tencent/rtmp/a;->t:Lcom/tencent/liteav/n;

    if-eqz v0, :cond_2

    if-eqz p1, :cond_1

    .line 481
    new-instance p1, Lcom/tencent/rtmp/a$2;

    invoke-direct {p1, p0}, Lcom/tencent/rtmp/a$2;-><init>(Lcom/tencent/rtmp/a;)V

    sget-object p0, Lcom/tencent/liteav/basic/a/b;->c:Lcom/tencent/liteav/basic/a/b;

    invoke-virtual {v0, p1, p0, p2}, Lcom/tencent/liteav/n;->a(Lcom/tencent/liteav/o;Lcom/tencent/liteav/basic/a/b;Ljava/lang/Object;)V

    goto :goto_0

    .line 482
    :cond_1
    sget-object p0, Lcom/tencent/liteav/basic/a/b;->a:Lcom/tencent/liteav/basic/a/b;

    const/4 p1, 0x0

    invoke-virtual {v0, p1, p0, p1}, Lcom/tencent/liteav/n;->a(Lcom/tencent/liteav/o;Lcom/tencent/liteav/basic/a/b;Ljava/lang/Object;)V

    :cond_2
    :goto_0
    const/4 p0, 0x0

    return p0
.end method

.method public a(Ljava/lang/String;)I
    .locals 0

    .line 456
    iget-object p0, p0, Lcom/tencent/rtmp/a;->t:Lcom/tencent/liteav/n;

    if-eqz p0, :cond_0

    .line 457
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/n;->a(Ljava/lang/String;)I

    move-result p0

    return p0

    :cond_0
    const/4 p0, -0x1

    return p0
.end method

.method public a(Ljava/lang/String;I)I
    .locals 6

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "liteav_api startPlay "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "TXLivePlayer"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    const/4 v2, -0x1

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    new-instance p1, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    const-string p2, "start play error when url is empty "

    .line 30
    .line 31
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return v2

    .line 45
    :cond_0
    iget-object v0, p0, Lcom/tencent/rtmp/a;->k:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    const/4 v3, 0x0

    .line 52
    if-nez v0, :cond_5

    .line 53
    .line 54
    iget-object v0, p0, Lcom/tencent/rtmp/a;->k:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_3

    .line 61
    .line 62
    invoke-virtual {p0}, Lcom/tencent/rtmp/a;->a()Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-eqz v0, :cond_3

    .line 67
    .line 68
    new-instance p1, Ljava/lang/StringBuilder;

    .line 69
    .line 70
    const-string p2, "start play error when new url is the same with old url  "

    .line 71
    .line 72
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    invoke-static {v1, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    iget-boolean p1, p0, Lcom/tencent/rtmp/a;->z:Z

    .line 86
    .line 87
    if-eqz p1, :cond_1

    .line 88
    .line 89
    new-instance p1, Landroid/os/Bundle;

    .line 90
    .line 91
    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    .line 92
    .line 93
    .line 94
    const/16 p2, 0x7d4

    .line 95
    .line 96
    invoke-virtual {p0, p2, p1}, Lcom/tencent/rtmp/a;->onNotifyEvent(ILandroid/os/Bundle;)V

    .line 97
    .line 98
    .line 99
    :cond_1
    iget-boolean p0, p0, Lcom/tencent/rtmp/a;->z:Z

    .line 100
    .line 101
    if-eqz p0, :cond_2

    .line 102
    .line 103
    return v3

    .line 104
    :cond_2
    return v2

    .line 105
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 106
    .line 107
    const-string v4, " stop old play when new url is not the same with old url  "

    .line 108
    .line 109
    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    iget-object v0, p0, Lcom/tencent/rtmp/a;->t:Lcom/tencent/liteav/n;

    .line 123
    .line 124
    if-eqz v0, :cond_4

    .line 125
    .line 126
    invoke-virtual {v0, v3}, Lcom/tencent/liteav/n;->a(Z)I

    .line 127
    .line 128
    .line 129
    :cond_4
    const-string v0, ""

    .line 130
    .line 131
    iput-object v0, p0, Lcom/tencent/rtmp/a;->k:Ljava/lang/String;

    .line 132
    .line 133
    :cond_5
    iget-object v0, p0, Lcom/tencent/rtmp/a;->r:Landroid/content/Context;

    .line 134
    .line 135
    invoke-static {v0}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->initCrashReport(Landroid/content/Context;)V

    .line 136
    .line 137
    .line 138
    const-string v0, "==========================================================================================================================================================="

    .line 139
    .line 140
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    new-instance v4, Ljava/lang/StringBuilder;

    .line 147
    .line 148
    const-string v5, "=====  StartPlay url = "

    .line 149
    .line 150
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    const-string v5, " playType = "

    .line 157
    .line 158
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 162
    .line 163
    .line 164
    const-string v5, " SDKVersion = "

    .line 165
    .line 166
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCCommonUtil;->getSDKID()I

    .line 170
    .line 171
    .line 172
    move-result v5

    .line 173
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    const-string v5, " , "

    .line 177
    .line 178
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 179
    .line 180
    .line 181
    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCCommonUtil;->getSDKVersionStr()Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object v5

    .line 185
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    const-string v5, "    ======"

    .line 189
    .line 190
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 191
    .line 192
    .line 193
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v4

    .line 197
    invoke-static {v1, v4}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 198
    .line 199
    .line 200
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 201
    .line 202
    .line 203
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 204
    .line 205
    .line 206
    iget v0, p0, Lcom/tencent/rtmp/a;->C:I

    .line 207
    .line 208
    if-eq v0, v2, :cond_6

    .line 209
    .line 210
    if-eq v0, p2, :cond_7

    .line 211
    .line 212
    :cond_6
    iget-object v0, p0, Lcom/tencent/rtmp/a;->r:Landroid/content/Context;

    .line 213
    .line 214
    invoke-static {v0, p2}, Lcom/tencent/liteav/p;->a(Landroid/content/Context;I)Lcom/tencent/liteav/n;

    .line 215
    .line 216
    .line 217
    move-result-object v0

    .line 218
    iput-object v0, p0, Lcom/tencent/rtmp/a;->t:Lcom/tencent/liteav/n;

    .line 219
    .line 220
    :cond_7
    iput p2, p0, Lcom/tencent/rtmp/a;->C:I

    .line 221
    .line 222
    iget-object v0, p0, Lcom/tencent/rtmp/a;->t:Lcom/tencent/liteav/n;

    .line 223
    .line 224
    if-nez v0, :cond_8

    .line 225
    .line 226
    const/4 p0, -0x2

    .line 227
    return p0

    .line 228
    :cond_8
    invoke-direct {p0, p1, p2}, Lcom/tencent/rtmp/a;->c(Ljava/lang/String;I)Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object p1

    .line 232
    iput-object p1, p0, Lcom/tencent/rtmp/a;->k:Ljava/lang/String;

    .line 233
    .line 234
    iget-object p1, p0, Lcom/tencent/rtmp/a;->f:Lcom/tencent/rtmp/TXLivePlayConfig;

    .line 235
    .line 236
    invoke-virtual {p0, p1}, Lcom/tencent/rtmp/a;->a(Lcom/tencent/rtmp/TXLivePlayConfig;)V

    .line 237
    .line 238
    .line 239
    iget-object p1, p0, Lcom/tencent/rtmp/a;->a:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 240
    .line 241
    if-eqz p1, :cond_9

    .line 242
    .line 243
    invoke-virtual {p1}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->clearLog()V

    .line 244
    .line 245
    .line 246
    iget-object p1, p0, Lcom/tencent/rtmp/a;->a:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 247
    .line 248
    invoke-virtual {p1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 249
    .line 250
    .line 251
    :cond_9
    iget-object p1, p0, Lcom/tencent/rtmp/a;->t:Lcom/tencent/liteav/n;

    .line 252
    .line 253
    iget-object v0, p0, Lcom/tencent/rtmp/a;->a:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 254
    .line 255
    invoke-virtual {p1, v0}, Lcom/tencent/liteav/n;->a(Lcom/tencent/rtmp/ui/TXCloudVideoView;)V

    .line 256
    .line 257
    .line 258
    iget-object p1, p0, Lcom/tencent/rtmp/a;->t:Lcom/tencent/liteav/n;

    .line 259
    .line 260
    invoke-virtual {p1, p0}, Lcom/tencent/liteav/n;->a(Lcom/tencent/liteav/basic/b/b;)V

    .line 261
    .line 262
    .line 263
    iget-object p1, p0, Lcom/tencent/rtmp/a;->t:Lcom/tencent/liteav/n;

    .line 264
    .line 265
    iget-boolean v0, p0, Lcom/tencent/rtmp/a;->u:Z

    .line 266
    .line 267
    invoke-virtual {p1, v0}, Lcom/tencent/liteav/n;->d(Z)V

    .line 268
    .line 269
    .line 270
    iget-object p1, p0, Lcom/tencent/rtmp/a;->b:Landroid/view/Surface;

    .line 271
    .line 272
    if-eqz p1, :cond_a

    .line 273
    .line 274
    iget-object v0, p0, Lcom/tencent/rtmp/a;->t:Lcom/tencent/liteav/n;

    .line 275
    .line 276
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/n;->a(Landroid/view/Surface;)V

    .line 277
    .line 278
    .line 279
    iget-object p1, p0, Lcom/tencent/rtmp/a;->t:Lcom/tencent/liteav/n;

    .line 280
    .line 281
    iget v0, p0, Lcom/tencent/rtmp/a;->c:I

    .line 282
    .line 283
    iget v1, p0, Lcom/tencent/rtmp/a;->d:I

    .line 284
    .line 285
    invoke-virtual {p1, v0, v1}, Lcom/tencent/liteav/n;->a(II)V

    .line 286
    .line 287
    .line 288
    :cond_a
    iget-object p1, p0, Lcom/tencent/rtmp/a;->t:Lcom/tencent/liteav/n;

    .line 289
    .line 290
    iget-object v0, p0, Lcom/tencent/rtmp/a;->k:Ljava/lang/String;

    .line 291
    .line 292
    invoke-virtual {p1, v0, p2}, Lcom/tencent/liteav/n;->a(Ljava/lang/String;I)I

    .line 293
    .line 294
    .line 295
    iget-object p1, p0, Lcom/tencent/rtmp/a;->t:Lcom/tencent/liteav/n;

    .line 296
    .line 297
    iget-boolean p2, p0, Lcom/tencent/rtmp/a;->l:Z

    .line 298
    .line 299
    invoke-virtual {p1, p2}, Lcom/tencent/liteav/n;->b(Z)V

    .line 300
    .line 301
    .line 302
    iget-object p1, p0, Lcom/tencent/rtmp/a;->t:Lcom/tencent/liteav/n;

    .line 303
    .line 304
    iget p2, p0, Lcom/tencent/rtmp/a;->m:I

    .line 305
    .line 306
    invoke-virtual {p1, p2}, Lcom/tencent/liteav/n;->c(I)V

    .line 307
    .line 308
    .line 309
    iget-object p1, p0, Lcom/tencent/rtmp/a;->t:Lcom/tencent/liteav/n;

    .line 310
    .line 311
    iget p2, p0, Lcom/tencent/rtmp/a;->v:F

    .line 312
    .line 313
    invoke-virtual {p1, p2}, Lcom/tencent/liteav/n;->a(F)V

    .line 314
    .line 315
    .line 316
    iget-object p1, p0, Lcom/tencent/rtmp/a;->t:Lcom/tencent/liteav/n;

    .line 317
    .line 318
    iget p2, p0, Lcom/tencent/rtmp/a;->j:I

    .line 319
    .line 320
    invoke-virtual {p1, p2}, Lcom/tencent/liteav/n;->b(I)V

    .line 321
    .line 322
    .line 323
    iget-object p1, p0, Lcom/tencent/rtmp/a;->t:Lcom/tencent/liteav/n;

    .line 324
    .line 325
    iget p2, p0, Lcom/tencent/rtmp/a;->i:I

    .line 326
    .line 327
    invoke-virtual {p1, p2}, Lcom/tencent/liteav/n;->a(I)V

    .line 328
    .line 329
    .line 330
    iget p1, p0, Lcom/tencent/rtmp/a;->x:I

    .line 331
    .line 332
    invoke-virtual {p0, p1}, Lcom/tencent/rtmp/a;->d(I)V

    .line 333
    .line 334
    .line 335
    iget-object p1, p0, Lcom/tencent/rtmp/a;->t:Lcom/tencent/liteav/n;

    .line 336
    .line 337
    iget-object p2, p0, Lcom/tencent/rtmp/a;->I:Lcom/tencent/rtmp/TXLivePlayer$ITXAudioRawDataListener;

    .line 338
    .line 339
    invoke-virtual {p1, p2}, Lcom/tencent/liteav/n;->a(Lcom/tencent/rtmp/TXLivePlayer$ITXAudioRawDataListener;)V

    .line 340
    .line 341
    .line 342
    iget-object p1, p0, Lcom/tencent/rtmp/a;->n:Lcom/tencent/rtmp/TXLivePlayer$ITXVideoRawDataListener;

    .line 343
    .line 344
    if-eqz p1, :cond_b

    .line 345
    .line 346
    invoke-virtual {p0, p1}, Lcom/tencent/rtmp/a;->a(Lcom/tencent/rtmp/TXLivePlayer$ITXVideoRawDataListener;)V

    .line 347
    .line 348
    .line 349
    :cond_b
    iget-object p1, p0, Lcom/tencent/rtmp/a;->q:Lcom/tencent/rtmp/TXLivePlayer$ITXLivePlayVideoRenderListener;

    .line 350
    .line 351
    if-eqz p1, :cond_c

    .line 352
    .line 353
    iget-object p2, p0, Lcom/tencent/rtmp/a;->p:Ljava/lang/Object;

    .line 354
    .line 355
    invoke-virtual {p0, p1, p2}, Lcom/tencent/rtmp/a;->a(Lcom/tencent/rtmp/TXLivePlayer$ITXLivePlayVideoRenderListener;Ljava/lang/Object;)I

    .line 356
    .line 357
    .line 358
    :cond_c
    iget-object p1, p0, Lcom/tencent/rtmp/a;->t:Lcom/tencent/liteav/n;

    .line 359
    .line 360
    invoke-virtual {p1}, Lcom/tencent/liteav/n;->e()Z

    .line 361
    .line 362
    .line 363
    move-result p1

    .line 364
    if-eqz p1, :cond_e

    .line 365
    .line 366
    iget-object p1, p0, Lcom/tencent/rtmp/a;->k:Ljava/lang/String;

    .line 367
    .line 368
    iput-object p1, p0, Lcom/tencent/rtmp/a;->B:Ljava/lang/String;

    .line 369
    .line 370
    iget-object p1, p0, Lcom/tencent/rtmp/a;->y:Lcom/tencent/liteav/j;

    .line 371
    .line 372
    const-wide/16 v0, 0x0

    .line 373
    .line 374
    if-eqz p1, :cond_d

    .line 375
    .line 376
    invoke-virtual {p1}, Lcom/tencent/liteav/j;->a()J

    .line 377
    .line 378
    .line 379
    move-result-wide p1

    .line 380
    goto :goto_0

    .line 381
    :cond_d
    move-wide p1, v0

    .line 382
    :goto_0
    iput-wide p1, p0, Lcom/tencent/rtmp/a;->A:J

    .line 383
    .line 384
    cmp-long p1, p1, v0

    .line 385
    .line 386
    if-lez p1, :cond_e

    .line 387
    .line 388
    iget-object p1, p0, Lcom/tencent/rtmp/a;->t:Lcom/tencent/liteav/n;

    .line 389
    .line 390
    invoke-virtual {p1}, Lcom/tencent/liteav/n;->f()V

    .line 391
    .line 392
    .line 393
    :cond_e
    invoke-direct {p0}, Lcom/tencent/rtmp/a;->f()V

    .line 394
    .line 395
    .line 396
    return v3
.end method

.method public a(Z)I
    .locals 2

    .line 431
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "liteav_api stopPlay "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "TXLivePlayer"

    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p1, :cond_0

    .line 432
    iget-object v0, p0, Lcom/tencent/rtmp/a;->a:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    if-eqz v0, :cond_0

    const/16 v1, 0x8

    .line 433
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 434
    :cond_0
    invoke-direct {p0}, Lcom/tencent/rtmp/a;->g()V

    .line 435
    iget-object v0, p0, Lcom/tencent/rtmp/a;->t:Lcom/tencent/liteav/n;

    if-eqz v0, :cond_1

    .line 436
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/n;->a(Z)I

    .line 437
    :cond_1
    const-string p1, ""

    iput-object p1, p0, Lcom/tencent/rtmp/a;->k:Ljava/lang/String;

    const-wide/16 v0, 0x0

    .line 438
    iput-wide v0, p0, Lcom/tencent/rtmp/a;->A:J

    const/4 p1, 0x0

    .line 439
    iput-object p1, p0, Lcom/tencent/rtmp/a;->y:Lcom/tencent/liteav/j;

    const/4 p1, 0x0

    .line 440
    iput-boolean p1, p0, Lcom/tencent/rtmp/a;->z:Z

    return p1
.end method

.method public a(F)V
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 492
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "liteav_api setRate "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "TXLivePlayer"

    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 493
    iput p1, p0, Lcom/tencent/rtmp/a;->v:F

    .line 494
    iget-object p0, p0, Lcom/tencent/rtmp/a;->t:Lcom/tencent/liteav/n;

    if-eqz p0, :cond_0

    .line 495
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/n;->a(F)V

    :cond_0
    return-void
.end method

.method public a(I)V
    .locals 2

    .line 452
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "liteav_api setRenderMode "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "TXLivePlayer"

    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 453
    iput p1, p0, Lcom/tencent/rtmp/a;->i:I

    .line 454
    iget-object p0, p0, Lcom/tencent/rtmp/a;->t:Lcom/tencent/liteav/n;

    if-eqz p0, :cond_0

    .line 455
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/n;->a(I)V

    :cond_0
    return-void
.end method

.method public a(II)V
    .locals 2

    .line 447
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "liteav_api setSurfaceSize "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "TXLivePlayer"

    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 448
    iput p1, p0, Lcom/tencent/rtmp/a;->c:I

    .line 449
    iput p2, p0, Lcom/tencent/rtmp/a;->d:I

    .line 450
    iget-object p0, p0, Lcom/tencent/rtmp/a;->t:Lcom/tencent/liteav/n;

    if-eqz p0, :cond_0

    .line 451
    invoke-virtual {p0, p1, p2}, Lcom/tencent/liteav/n;->a(II)V

    :cond_0
    return-void
.end method

.method public a(Landroid/view/Surface;)V
    .locals 2

    .line 443
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "liteav_api setSurface old : "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/tencent/rtmp/a;->b:Landroid/view/Surface;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", new : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "TXLivePlayer"

    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 444
    iput-object p1, p0, Lcom/tencent/rtmp/a;->b:Landroid/view/Surface;

    .line 445
    iget-object p0, p0, Lcom/tencent/rtmp/a;->t:Lcom/tencent/liteav/n;

    if-eqz p0, :cond_0

    .line 446
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/n;->a(Landroid/view/Surface;)V

    :cond_0
    return-void
.end method

.method public a(Lcom/tencent/rtmp/ITXLivePlayListener;)V
    .locals 2

    .line 424
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "liteav_api setPlayListener "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "TXLivePlayer"

    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 425
    iput-object p1, p0, Lcom/tencent/rtmp/a;->e:Lcom/tencent/rtmp/ITXLivePlayListener;

    return-void
.end method

.method public a(Lcom/tencent/rtmp/TXLivePlayConfig;)V
    .locals 2

    .line 401
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "liteav_api setConfig "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "TXLivePlayer"

    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 402
    iput-object p1, p0, Lcom/tencent/rtmp/a;->f:Lcom/tencent/rtmp/TXLivePlayConfig;

    if-nez p1, :cond_0

    .line 403
    new-instance p1, Lcom/tencent/rtmp/TXLivePlayConfig;

    invoke-direct {p1}, Lcom/tencent/rtmp/TXLivePlayConfig;-><init>()V

    iput-object p1, p0, Lcom/tencent/rtmp/a;->f:Lcom/tencent/rtmp/TXLivePlayConfig;

    .line 404
    :cond_0
    iget-object p1, p0, Lcom/tencent/rtmp/a;->t:Lcom/tencent/liteav/n;

    if-eqz p1, :cond_2

    .line 405
    invoke-virtual {p1}, Lcom/tencent/liteav/n;->i()Lcom/tencent/liteav/h;

    move-result-object p1

    if-nez p1, :cond_1

    .line 406
    new-instance p1, Lcom/tencent/liteav/h;

    invoke-direct {p1}, Lcom/tencent/liteav/h;-><init>()V

    .line 407
    :cond_1
    iget-object v0, p0, Lcom/tencent/rtmp/a;->f:Lcom/tencent/rtmp/TXLivePlayConfig;

    iget v1, v0, Lcom/tencent/rtmp/TXLivePlayConfig;->mCacheTime:F

    iput v1, p1, Lcom/tencent/liteav/h;->a:F

    .line 408
    iget-boolean v1, v0, Lcom/tencent/rtmp/TXLivePlayConfig;->mAutoAdjustCacheTime:Z

    iput-boolean v1, p1, Lcom/tencent/liteav/h;->g:Z

    .line 409
    iget v1, v0, Lcom/tencent/rtmp/TXLivePlayConfig;->mMinAutoAdjustCacheTime:F

    iput v1, p1, Lcom/tencent/liteav/h;->c:F

    .line 410
    iget v1, v0, Lcom/tencent/rtmp/TXLivePlayConfig;->mMaxAutoAdjustCacheTime:F

    iput v1, p1, Lcom/tencent/liteav/h;->b:F

    .line 411
    iget v1, v0, Lcom/tencent/rtmp/TXLivePlayConfig;->mVideoBlockThreshold:I

    iput v1, p1, Lcom/tencent/liteav/h;->d:I

    .line 412
    iget v1, v0, Lcom/tencent/rtmp/TXLivePlayConfig;->mConnectRetryCount:I

    iput v1, p1, Lcom/tencent/liteav/h;->e:I

    .line 413
    iget v1, v0, Lcom/tencent/rtmp/TXLivePlayConfig;->mConnectRetryInterval:I

    iput v1, p1, Lcom/tencent/liteav/h;->f:I

    .line 414
    iget-boolean v1, v0, Lcom/tencent/rtmp/TXLivePlayConfig;->mEnableNearestIP:Z

    iput-boolean v1, p1, Lcom/tencent/liteav/h;->i:Z

    .line 415
    iget v1, v0, Lcom/tencent/rtmp/TXLivePlayConfig;->mRtmpChannelType:I

    iput v1, p1, Lcom/tencent/liteav/h;->m:I

    .line 416
    iget-boolean v1, p0, Lcom/tencent/rtmp/a;->g:Z

    iput-boolean v1, p1, Lcom/tencent/liteav/h;->h:Z

    .line 417
    iget-object v1, v0, Lcom/tencent/rtmp/TXLivePlayConfig;->mCacheFolderPath:Ljava/lang/String;

    iput-object v1, p1, Lcom/tencent/liteav/h;->n:Ljava/lang/String;

    .line 418
    iget v1, v0, Lcom/tencent/rtmp/TXLivePlayConfig;->mMaxCacheItems:I

    iput v1, p1, Lcom/tencent/liteav/h;->o:I

    .line 419
    iget-boolean v1, v0, Lcom/tencent/rtmp/TXLivePlayConfig;->mEnableMessage:Z

    iput-boolean v1, p1, Lcom/tencent/liteav/h;->j:Z

    .line 420
    iget-boolean v1, v0, Lcom/tencent/rtmp/TXLivePlayConfig;->mEnableMetaData:Z

    iput-boolean v1, p1, Lcom/tencent/liteav/h;->k:Z

    .line 421
    iget-object v1, v0, Lcom/tencent/rtmp/TXLivePlayConfig;->mFlvSessionKey:Ljava/lang/String;

    iput-object v1, p1, Lcom/tencent/liteav/h;->l:Ljava/lang/String;

    .line 422
    iget-object v0, v0, Lcom/tencent/rtmp/TXLivePlayConfig;->mHeaders:Ljava/util/Map;

    iput-object v0, p1, Lcom/tencent/liteav/h;->p:Ljava/util/Map;

    .line 423
    iget-object p0, p0, Lcom/tencent/rtmp/a;->t:Lcom/tencent/liteav/n;

    invoke-virtual {p0, p1}, Lcom/tencent/liteav/n;->a(Lcom/tencent/liteav/h;)V

    :cond_2
    return-void
.end method

.method public a(Lcom/tencent/rtmp/TXLivePlayer$ITXAudioRawDataListener;)V
    .locals 2

    .line 488
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "liteav_api setAudioRawDataListener "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "TXLivePlayer"

    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 489
    iput-object p1, p0, Lcom/tencent/rtmp/a;->I:Lcom/tencent/rtmp/TXLivePlayer$ITXAudioRawDataListener;

    .line 490
    iget-object p0, p0, Lcom/tencent/rtmp/a;->t:Lcom/tencent/liteav/n;

    if-eqz p0, :cond_0

    .line 491
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/n;->a(Lcom/tencent/rtmp/TXLivePlayer$ITXAudioRawDataListener;)V

    :cond_0
    return-void
.end method

.method public a(Lcom/tencent/rtmp/TXLivePlayer$ITXAudioVolumeEvaluationListener;)V
    .locals 0

    .line 458
    iput-object p1, p0, Lcom/tencent/rtmp/a;->F:Lcom/tencent/rtmp/TXLivePlayer$ITXAudioVolumeEvaluationListener;

    return-void
.end method

.method public a(Lcom/tencent/rtmp/TXLivePlayer$ITXSnapshotListener;)V
    .locals 2

    .line 462
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "liteav_api snapshot "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "TXLivePlayer"

    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 463
    iget-boolean v0, p0, Lcom/tencent/rtmp/a;->w:Z

    if-nez v0, :cond_2

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    .line 464
    iput-boolean v0, p0, Lcom/tencent/rtmp/a;->w:Z

    .line 465
    iget-object v0, p0, Lcom/tencent/rtmp/a;->t:Lcom/tencent/liteav/n;

    if-eqz v0, :cond_1

    .line 466
    new-instance v1, Lcom/tencent/rtmp/a$1;

    invoke-direct {v1, p0, p1}, Lcom/tencent/rtmp/a$1;-><init>(Lcom/tencent/rtmp/a;Lcom/tencent/rtmp/TXLivePlayer$ITXSnapshotListener;)V

    invoke-virtual {v0, v1}, Lcom/tencent/liteav/n;->a(Lcom/tencent/liteav/basic/c/o;)V

    return-void

    :cond_1
    const/4 p1, 0x0

    .line 467
    iput-boolean p1, p0, Lcom/tencent/rtmp/a;->w:Z

    :cond_2
    :goto_0
    return-void
.end method

.method public a(Lcom/tencent/rtmp/TXLivePlayer$ITXVideoRawDataListener;)V
    .locals 2

    .line 483
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "liteav_api setVideoRawDataListener "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "TXLivePlayer"

    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 484
    iput-object p1, p0, Lcom/tencent/rtmp/a;->n:Lcom/tencent/rtmp/TXLivePlayer$ITXVideoRawDataListener;

    .line 485
    iget-object v0, p0, Lcom/tencent/rtmp/a;->t:Lcom/tencent/liteav/n;

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_1

    .line 486
    new-instance p1, Lcom/tencent/rtmp/a$3;

    invoke-direct {p1, p0}, Lcom/tencent/rtmp/a$3;-><init>(Lcom/tencent/rtmp/a;)V

    sget-object p0, Lcom/tencent/liteav/basic/a/b;->b:Lcom/tencent/liteav/basic/a/b;

    invoke-virtual {v0, p1, p0, v1}, Lcom/tencent/liteav/n;->a(Lcom/tencent/liteav/o;Lcom/tencent/liteav/basic/a/b;Ljava/lang/Object;)V

    return-void

    .line 487
    :cond_1
    sget-object p0, Lcom/tencent/liteav/basic/a/b;->a:Lcom/tencent/liteav/basic/a/b;

    invoke-virtual {v0, v1, p0, v1}, Lcom/tencent/liteav/n;->a(Lcom/tencent/liteav/o;Lcom/tencent/liteav/basic/a/b;Ljava/lang/Object;)V

    return-void
.end method

.method public a(Lcom/tencent/rtmp/ui/TXCloudVideoView;)V
    .locals 2

    .line 426
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "liteav_api setPlayerView old view : "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/tencent/rtmp/a;->a:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", new view : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "TXLivePlayer"

    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 427
    iput-object p1, p0, Lcom/tencent/rtmp/a;->a:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 428
    iget-object p0, p0, Lcom/tencent/rtmp/a;->t:Lcom/tencent/liteav/n;

    if-eqz p0, :cond_0

    .line 429
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/n;->a(Lcom/tencent/rtmp/ui/TXCloudVideoView;)V

    :cond_0
    return-void
.end method

.method public a(Lcom/tencent/ugc/TXRecordCommon$ITXVideoRecordListener;)V
    .locals 2

    .line 459
    const-string v0, "TXLivePlayer"

    const-string v1, "liteav_api setVideoRecordListener"

    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 460
    iget-object p0, p0, Lcom/tencent/rtmp/a;->t:Lcom/tencent/liteav/n;

    if-eqz p0, :cond_0

    .line 461
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/n;->a(Lcom/tencent/ugc/TXRecordCommon$ITXVideoRecordListener;)V

    :cond_0
    return-void
.end method

.method public a()Z
    .locals 0

    .line 441
    iget-object p0, p0, Lcom/tencent/rtmp/a;->t:Lcom/tencent/liteav/n;

    if-eqz p0, :cond_0

    .line 442
    invoke-virtual {p0}, Lcom/tencent/liteav/n;->c()Z

    move-result p0

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public a([B)Z
    .locals 3

    .line 468
    iget-object v0, p0, Lcom/tencent/rtmp/a;->k:Ljava/lang/String;

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 469
    :cond_0
    iget-boolean v0, p0, Lcom/tencent/rtmp/a;->g:Z

    const-string v2, "TXLivePlayer"

    if-eqz v0, :cond_1

    .line 470
    const-string p0, "can not addVideoRawData because of hw decode has set!"

    invoke-static {v2, p0}, Lcom/tencent/rtmp/TXLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    .line 471
    :cond_1
    iget-object v0, p0, Lcom/tencent/rtmp/a;->t:Lcom/tencent/liteav/n;

    if-nez v0, :cond_2

    .line 472
    const-string p0, "player hasn\'t created or not instanceof live player"

    invoke-static {v2, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    .line 473
    :cond_2
    iput-object p1, p0, Lcom/tencent/rtmp/a;->o:[B

    const/4 p0, 0x1

    return p0

    :cond_3
    :goto_0
    return v1
.end method

.method public b(Ljava/lang/String;I)I
    .locals 3

    .line 145
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "liteav_api prepareLiveSeek "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "TXLivePlayer"

    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 146
    iget-object v0, p0, Lcom/tencent/rtmp/a;->y:Lcom/tencent/liteav/j;

    if-nez v0, :cond_0

    new-instance v0, Lcom/tencent/liteav/j;

    invoke-direct {v0}, Lcom/tencent/liteav/j;-><init>()V

    iput-object v0, p0, Lcom/tencent/rtmp/a;->y:Lcom/tencent/liteav/j;

    .line 147
    :cond_0
    iget-object v0, p0, Lcom/tencent/rtmp/a;->y:Lcom/tencent/liteav/j;

    if-eqz v0, :cond_1

    .line 148
    iget-object v1, p0, Lcom/tencent/rtmp/a;->k:Ljava/lang/String;

    new-instance v2, Lcom/tencent/rtmp/a$4;

    invoke-direct {v2, p0}, Lcom/tencent/rtmp/a$4;-><init>(Lcom/tencent/rtmp/a;)V

    invoke-virtual {v0, v1, p1, p2, v2}, Lcom/tencent/liteav/j;->a(Ljava/lang/String;Ljava/lang/String;ILcom/tencent/liteav/j$a;)I

    move-result p0

    return p0

    :cond_1
    const/4 p0, -0x1

    return p0
.end method

.method public b()V
    .locals 2

    .line 127
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "liteav_api pause "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "TXLivePlayer"

    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 128
    iget-object v0, p0, Lcom/tencent/rtmp/a;->t:Lcom/tencent/liteav/n;

    if-eqz v0, :cond_0

    .line 129
    const-string v0, "pause play"

    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 130
    iget-object p0, p0, Lcom/tencent/rtmp/a;->t:Lcom/tencent/liteav/n;

    invoke-virtual {p0}, Lcom/tencent/liteav/n;->a()V

    :cond_0
    return-void
.end method

.method public b(I)V
    .locals 2

    .line 131
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "liteav_api setRenderRotation "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "TXLivePlayer"

    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    iput p1, p0, Lcom/tencent/rtmp/a;->j:I

    .line 133
    iget-object p0, p0, Lcom/tencent/rtmp/a;->t:Lcom/tencent/liteav/n;

    if-eqz p0, :cond_0

    .line 134
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/n;->b(I)V

    :cond_0
    return-void
.end method

.method public b(Ljava/lang/String;)V
    .locals 8

    .line 1
    const-string v0, "enable"

    .line 2
    .line 3
    const-string v1, "params"

    .line 4
    .line 5
    const-string v2, "api"

    .line 6
    .line 7
    const-string v3, "TXLivePlayer"

    .line 8
    .line 9
    const-string v4, "callExperimentalAPI[illegal api]: "

    .line 10
    .line 11
    const-string v5, "callExperimentalAPI[lack api or illegal type]: "

    .line 12
    .line 13
    :try_start_0
    new-instance v6, Lorg/json/JSONObject;

    .line 14
    .line 15
    invoke-direct {v6, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v6, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 19
    .line 20
    .line 21
    move-result v7

    .line 22
    if-nez v7, :cond_0

    .line 23
    .line 24
    new-instance p0, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {p0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-static {v3, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    invoke-virtual {v6, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {v6, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 45
    .line 46
    .line 47
    move-result v5

    .line 48
    if-eqz v5, :cond_1

    .line 49
    .line 50
    invoke-virtual {v6, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    goto :goto_0

    .line 55
    :cond_1
    const/4 v1, 0x0

    .line 56
    :goto_0
    const-string v5, "muteRemoteAudioInSpeaker"

    .line 57
    .line 58
    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v5

    .line 62
    if-eqz v5, :cond_6

    .line 63
    .line 64
    if-nez v1, :cond_2

    .line 65
    .line 66
    const-string p0, "muteRemoteAudioInSpeaker[lack parameter]"

    .line 67
    .line 68
    invoke-static {v3, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_2
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    if-nez v2, :cond_3

    .line 77
    .line 78
    const-string p0, "muteRemoteAudioInSpeaker[lack parameter]: enable"

    .line 79
    .line 80
    invoke-static {v3, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_3
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    iget-object p0, p0, Lcom/tencent/rtmp/a;->t:Lcom/tencent/liteav/n;

    .line 89
    .line 90
    if-eqz p0, :cond_5

    .line 91
    .line 92
    const/4 v1, 0x1

    .line 93
    if-ne v0, v1, :cond_4

    .line 94
    .line 95
    goto :goto_1

    .line 96
    :cond_4
    const/4 v1, 0x0

    .line 97
    :goto_1
    invoke-virtual {p0, v1}, Lcom/tencent/liteav/n;->c(Z)V

    .line 98
    .line 99
    .line 100
    :cond_5
    return-void

    .line 101
    :cond_6
    invoke-virtual {v4, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    invoke-static {v3, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 106
    .line 107
    .line 108
    return-void

    .line 109
    :catch_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 110
    .line 111
    const-string v0, "callExperimentalAPI[failed]: "

    .line 112
    .line 113
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    invoke-static {v3, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    return-void
.end method

.method public b(Z)Z
    .locals 2

    .line 135
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "liteav_api enableHardwareDecode "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "TXLivePlayer"

    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p1, :cond_0

    .line 136
    invoke-direct {p0}, Lcom/tencent/rtmp/a;->h()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 137
    new-instance p0, Ljava/lang/StringBuilder;

    const-string p1, "enableHardwareDecode failed, MANUFACTURER = "

    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object p1, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ", MODEL"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object p1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "HardwareDecode"

    invoke-static {p1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0

    .line 138
    :cond_0
    iput-boolean p1, p0, Lcom/tencent/rtmp/a;->g:Z

    .line 139
    iget-object p1, p0, Lcom/tencent/rtmp/a;->t:Lcom/tencent/liteav/n;

    if-eqz p1, :cond_2

    .line 140
    invoke-virtual {p1}, Lcom/tencent/liteav/n;->i()Lcom/tencent/liteav/h;

    move-result-object p1

    if-nez p1, :cond_1

    .line 141
    new-instance p1, Lcom/tencent/liteav/h;

    invoke-direct {p1}, Lcom/tencent/liteav/h;-><init>()V

    .line 142
    :cond_1
    iget-boolean v0, p0, Lcom/tencent/rtmp/a;->g:Z

    iput-boolean v0, p1, Lcom/tencent/liteav/h;->h:Z

    .line 143
    iget-object p0, p0, Lcom/tencent/rtmp/a;->t:Lcom/tencent/liteav/n;

    invoke-virtual {p0, p1}, Lcom/tencent/liteav/n;->a(Lcom/tencent/liteav/h;)V

    :cond_2
    const/4 p0, 0x1

    return p0
.end method

.method public c()V
    .locals 5

    .line 127
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "liteav_api resume "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "TXLivePlayer"

    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 128
    iget-object v0, p0, Lcom/tencent/rtmp/a;->t:Lcom/tencent/liteav/n;

    if-eqz v0, :cond_2

    .line 129
    const-string v0, "resume play"

    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 130
    iget-object v0, p0, Lcom/tencent/rtmp/a;->t:Lcom/tencent/liteav/n;

    invoke-virtual {v0}, Lcom/tencent/liteav/n;->b()V

    .line 131
    iget-object v0, p0, Lcom/tencent/rtmp/a;->t:Lcom/tencent/liteav/n;

    invoke-virtual {v0}, Lcom/tencent/liteav/n;->e()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 132
    iget-object v0, p0, Lcom/tencent/rtmp/a;->y:Lcom/tencent/liteav/j;

    const-wide/16 v1, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/tencent/liteav/j;->a()J

    move-result-wide v3

    goto :goto_0

    :cond_0
    move-wide v3, v1

    :goto_0
    iput-wide v3, p0, Lcom/tencent/rtmp/a;->A:J

    cmp-long v0, v3, v1

    if-lez v0, :cond_1

    .line 133
    iget-object v0, p0, Lcom/tencent/rtmp/a;->t:Lcom/tencent/liteav/n;

    invoke-virtual {v0}, Lcom/tencent/liteav/n;->f()V

    .line 134
    :cond_1
    iget v0, p0, Lcom/tencent/rtmp/a;->x:I

    invoke-virtual {p0, v0}, Lcom/tencent/rtmp/a;->d(I)V

    :cond_2
    return-void
.end method

.method public c(I)V
    .locals 2

    if-gez p1, :cond_0

    const/4 p1, 0x0

    :cond_0
    const/16 v0, 0x64

    if-le p1, v0, :cond_1

    move p1, v0

    .line 139
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "liteav_api setVolume volume = "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "TXLivePlayer"

    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 140
    iput p1, p0, Lcom/tencent/rtmp/a;->m:I

    .line 141
    iget-object p0, p0, Lcom/tencent/rtmp/a;->t:Lcom/tencent/liteav/n;

    if-eqz p0, :cond_2

    .line 142
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/n;->c(I)V

    :cond_2
    return-void
.end method

.method public c(Z)V
    .locals 2

    .line 135
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "liteav_api setMute "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "TXLivePlayer"

    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 136
    iput-boolean p1, p0, Lcom/tencent/rtmp/a;->l:Z

    .line 137
    iget-object p0, p0, Lcom/tencent/rtmp/a;->t:Lcom/tencent/liteav/n;

    if-eqz p0, :cond_0

    .line 138
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/n;->b(Z)V

    :cond_0
    return-void
.end method

.method public d()I
    .locals 2

    .line 33
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "liteav_api stopRecord "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "TXLivePlayer"

    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    iget-object p0, p0, Lcom/tencent/rtmp/a;->t:Lcom/tencent/liteav/n;

    if-eqz p0, :cond_0

    .line 35
    invoke-virtual {p0}, Lcom/tencent/liteav/n;->d()I

    move-result p0

    return p0

    :cond_0
    const/4 p0, -0x1

    return p0
.end method

.method public d(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "liteav_api setAudioRoute "

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
    const-string v1, "TXLivePlayer"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iput p1, p0, Lcom/tencent/rtmp/a;->x:I

    .line 21
    .line 22
    iget-object v0, p0, Lcom/tencent/rtmp/a;->t:Lcom/tencent/liteav/n;

    .line 23
    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    iget-object p0, p0, Lcom/tencent/rtmp/a;->r:Landroid/content/Context;

    .line 27
    .line 28
    invoke-virtual {v0, p0, p1}, Lcom/tencent/liteav/n;->a(Landroid/content/Context;I)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public d(Z)V
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 36
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "liteav_api setAutoPlay "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "TXLivePlayer"

    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    iput-boolean p1, p0, Lcom/tencent/rtmp/a;->u:Z

    return-void
.end method

.method public e()I
    .locals 2

    .line 41
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "liteav_api resumeLive "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "TXLivePlayer"

    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    iget-boolean v0, p0, Lcom/tencent/rtmp/a;->z:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 43
    iput-boolean v0, p0, Lcom/tencent/rtmp/a;->z:Z

    .line 44
    iget-object v0, p0, Lcom/tencent/rtmp/a;->B:Ljava/lang/String;

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/tencent/rtmp/a;->a(Ljava/lang/String;I)I

    move-result p0

    return p0

    :cond_0
    const/4 p0, -0x1

    return p0
.end method

.method public e(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "liteav_api enableAudioVolumeEvaluation intervalMs = "

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
    const-string v1, "TXLivePlayer"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    if-lez p1, :cond_1

    .line 21
    .line 22
    const/16 v0, 0x64

    .line 23
    .line 24
    if-ge p1, v0, :cond_0

    .line 25
    .line 26
    move p1, v0

    .line 27
    :cond_0
    iput p1, p0, Lcom/tencent/rtmp/a;->G:I

    .line 28
    .line 29
    invoke-direct {p0}, Lcom/tencent/rtmp/a;->f()V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    const/4 p1, 0x0

    .line 34
    iput p1, p0, Lcom/tencent/rtmp/a;->G:I

    .line 35
    .line 36
    invoke-direct {p0}, Lcom/tencent/rtmp/a;->g()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public f(I)I
    .locals 3

    .line 59
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "liteav_api startRecord "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "TXLivePlayer"

    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    invoke-virtual {p0}, Lcom/tencent/rtmp/a;->a()Z

    move-result v0

    const/4 v2, -0x1

    if-nez v0, :cond_0

    .line 61
    const-string p0, "startRecord: there is no playing stream"

    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    return v2

    .line 62
    :cond_0
    iget-object p0, p0, Lcom/tencent/rtmp/a;->t:Lcom/tencent/liteav/n;

    if-eqz p0, :cond_1

    .line 63
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/n;->d(I)I

    move-result p0

    return p0

    :cond_1
    return v2
.end method

.method public g(I)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "liteav_api seek "

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
    const-string v1, "TXLivePlayer"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/tencent/rtmp/a;->t:Lcom/tencent/liteav/n;

    .line 21
    .line 22
    if-eqz v0, :cond_5

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/tencent/liteav/n;->e()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_1

    .line 29
    .line 30
    iget-boolean v0, p0, Lcom/tencent/rtmp/a;->z:Z

    .line 31
    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    iget-object p0, p0, Lcom/tencent/rtmp/a;->t:Lcom/tencent/liteav/n;

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/n;->e(I)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/tencent/rtmp/a;->y:Lcom/tencent/liteav/j;

    .line 42
    .line 43
    if-eqz v0, :cond_2

    .line 44
    .line 45
    int-to-long v1, p1

    .line 46
    invoke-virtual {v0, v1, v2}, Lcom/tencent/liteav/j;->a(J)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    goto :goto_1

    .line 51
    :cond_2
    const-string v0, ""

    .line 52
    .line 53
    :goto_1
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-nez v1, :cond_4

    .line 58
    .line 59
    const/4 v1, 0x3

    .line 60
    invoke-virtual {p0, v0, v1}, Lcom/tencent/rtmp/a;->a(Ljava/lang/String;I)I

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-nez v0, :cond_3

    .line 65
    .line 66
    const/4 v0, 0x1

    .line 67
    goto :goto_2

    .line 68
    :cond_3
    const/4 v0, 0x0

    .line 69
    :goto_2
    iput-boolean v0, p0, Lcom/tencent/rtmp/a;->z:Z

    .line 70
    .line 71
    if-eqz v0, :cond_5

    .line 72
    .line 73
    mul-int/lit16 p1, p1, 0x3e8

    .line 74
    .line 75
    int-to-long v0, p1

    .line 76
    iput-wide v0, p0, Lcom/tencent/rtmp/a;->A:J

    .line 77
    .line 78
    return-void

    .line 79
    :cond_4
    iget-object p0, p0, Lcom/tencent/rtmp/a;->e:Lcom/tencent/rtmp/ITXLivePlayListener;

    .line 80
    .line 81
    if-eqz p0, :cond_5

    .line 82
    .line 83
    new-instance p1, Landroid/os/Bundle;

    .line 84
    .line 85
    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    .line 86
    .line 87
    .line 88
    const/16 v0, -0x8fd

    .line 89
    .line 90
    invoke-interface {p0, v0, p1}, Lcom/tencent/rtmp/ITXLivePlayListener;->onPlayEvent(ILandroid/os/Bundle;)V

    .line 91
    .line 92
    .line 93
    :cond_5
    return-void
.end method

.method public onNotifyEvent(ILandroid/os/Bundle;)V
    .locals 5

    .line 1
    const/16 v0, 0x3a99

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-ne p1, v0, :cond_1

    .line 5
    .line 6
    iget-object p1, p0, Lcom/tencent/rtmp/a;->a:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-virtual {p1, p2, v1, v0}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->setLogText(Landroid/os/Bundle;Landroid/os/Bundle;I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object p0, p0, Lcom/tencent/rtmp/a;->e:Lcom/tencent/rtmp/ITXLivePlayListener;

    .line 15
    .line 16
    if-eqz p0, :cond_a

    .line 17
    .line 18
    invoke-interface {p0, p2}, Lcom/tencent/rtmp/ITXLivePlayListener;->onNetStatus(Landroid/os/Bundle;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_1
    const/16 v0, 0x7d5

    .line 23
    .line 24
    if-ne p1, v0, :cond_2

    .line 25
    .line 26
    const-string v0, "EVT_PLAY_PROGRESS_MS"

    .line 27
    .line 28
    invoke-virtual {p2, v0}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    int-to-long v1, v1

    .line 33
    iget-wide v3, p0, Lcom/tencent/rtmp/a;->A:J

    .line 34
    .line 35
    add-long/2addr v1, v3

    .line 36
    const-wide/16 v3, 0x0

    .line 37
    .line 38
    cmp-long v3, v1, v3

    .line 39
    .line 40
    if-lez v3, :cond_a

    .line 41
    .line 42
    const-wide/16 v3, 0x3e8

    .line 43
    .line 44
    div-long v3, v1, v3

    .line 45
    .line 46
    long-to-int v3, v3

    .line 47
    const-string v4, "EVT_PLAY_PROGRESS"

    .line 48
    .line 49
    invoke-virtual {p2, v4, v3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 50
    .line 51
    .line 52
    long-to-int v1, v1

    .line 53
    invoke-virtual {p2, v0, v1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 54
    .line 55
    .line 56
    iget-object p0, p0, Lcom/tencent/rtmp/a;->e:Lcom/tencent/rtmp/ITXLivePlayListener;

    .line 57
    .line 58
    if-eqz p0, :cond_a

    .line 59
    .line 60
    invoke-interface {p0, p1, p2}, Lcom/tencent/rtmp/ITXLivePlayListener;->onPlayEvent(ILandroid/os/Bundle;)V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_2
    const/16 v2, 0x7ea

    .line 65
    .line 66
    if-ne p1, v2, :cond_3

    .line 67
    .line 68
    goto/16 :goto_1

    .line 69
    .line 70
    :cond_3
    const/16 v2, -0x905

    .line 71
    .line 72
    const/16 v3, -0x8fd

    .line 73
    .line 74
    if-eq p1, v2, :cond_4

    .line 75
    .line 76
    const/16 v2, -0x903

    .line 77
    .line 78
    if-eq p1, v2, :cond_6

    .line 79
    .line 80
    const/16 v2, -0x900

    .line 81
    .line 82
    if-eq p1, v2, :cond_6

    .line 83
    .line 84
    const/16 v2, 0x7df

    .line 85
    .line 86
    if-eq p1, v2, :cond_6

    .line 87
    .line 88
    const/16 v2, 0x7ec

    .line 89
    .line 90
    if-eq p1, v2, :cond_6

    .line 91
    .line 92
    const/16 v2, 0x7ef

    .line 93
    .line 94
    if-eq p1, v2, :cond_6

    .line 95
    .line 96
    const/16 v2, 0x835

    .line 97
    .line 98
    if-eq p1, v2, :cond_6

    .line 99
    .line 100
    const/16 v2, 0x837

    .line 101
    .line 102
    if-eq p1, v2, :cond_6

    .line 103
    .line 104
    const/16 v2, 0xbbb

    .line 105
    .line 106
    if-eq p1, v2, :cond_6

    .line 107
    .line 108
    const/16 v2, -0x8fe

    .line 109
    .line 110
    if-eq p1, v2, :cond_6

    .line 111
    .line 112
    if-eq p1, v3, :cond_4

    .line 113
    .line 114
    const/16 v2, 0x7dc

    .line 115
    .line 116
    if-eq p1, v2, :cond_6

    .line 117
    .line 118
    const/16 v2, 0x7dd

    .line 119
    .line 120
    if-eq p1, v2, :cond_6

    .line 121
    .line 122
    const/16 v2, 0x7e5

    .line 123
    .line 124
    if-eq p1, v2, :cond_7

    .line 125
    .line 126
    const/16 v2, 0x7e6

    .line 127
    .line 128
    if-eq p1, v2, :cond_7

    .line 129
    .line 130
    const/16 v2, 0x839

    .line 131
    .line 132
    if-eq p1, v2, :cond_8

    .line 133
    .line 134
    const/16 v2, 0x83a

    .line 135
    .line 136
    if-eq p1, v2, :cond_6

    .line 137
    .line 138
    const/16 v2, 0xbbe

    .line 139
    .line 140
    if-eq p1, v2, :cond_5

    .line 141
    .line 142
    const/16 v2, 0xbbf

    .line 143
    .line 144
    if-eq p1, v2, :cond_5

    .line 145
    .line 146
    const/16 v2, 0xbc1

    .line 147
    .line 148
    const/16 v3, 0xbba

    .line 149
    .line 150
    if-eq p1, v2, :cond_4

    .line 151
    .line 152
    const/16 v2, 0xbc2

    .line 153
    .line 154
    if-eq p1, v2, :cond_4

    .line 155
    .line 156
    packed-switch p1, :pswitch_data_0

    .line 157
    .line 158
    .line 159
    packed-switch p1, :pswitch_data_1

    .line 160
    .line 161
    .line 162
    goto :goto_1

    .line 163
    :pswitch_0
    const/16 p1, 0x7d9

    .line 164
    .line 165
    goto :goto_0

    .line 166
    :pswitch_1
    const/16 p1, 0x7d7

    .line 167
    .line 168
    goto :goto_0

    .line 169
    :pswitch_2
    move p1, v0

    .line 170
    goto :goto_0

    .line 171
    :pswitch_3
    const/16 p1, 0x7d4

    .line 172
    .line 173
    goto :goto_0

    .line 174
    :pswitch_4
    const/16 p1, 0x7d2

    .line 175
    .line 176
    goto :goto_0

    .line 177
    :pswitch_5
    const/16 p1, 0x7d1

    .line 178
    .line 179
    goto :goto_0

    .line 180
    :cond_4
    move p1, v3

    .line 181
    goto :goto_0

    .line 182
    :cond_5
    const/16 p1, 0xbbd

    .line 183
    .line 184
    goto :goto_0

    .line 185
    :cond_6
    move p1, v2

    .line 186
    goto :goto_0

    .line 187
    :cond_7
    :pswitch_6
    const/16 p1, 0x7d8

    .line 188
    .line 189
    :cond_8
    :goto_0
    :pswitch_7
    iget-object v0, p0, Lcom/tencent/rtmp/a;->a:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 190
    .line 191
    if-eqz v0, :cond_9

    .line 192
    .line 193
    invoke-virtual {v0, v1, p2, p1}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->setLogText(Landroid/os/Bundle;Landroid/os/Bundle;I)V

    .line 194
    .line 195
    .line 196
    :cond_9
    iget-object p0, p0, Lcom/tencent/rtmp/a;->e:Lcom/tencent/rtmp/ITXLivePlayListener;

    .line 197
    .line 198
    if-eqz p0, :cond_a

    .line 199
    .line 200
    invoke-interface {p0, p1, p2}, Lcom/tencent/rtmp/ITXLivePlayListener;->onPlayEvent(ILandroid/os/Bundle;)V

    .line 201
    .line 202
    .line 203
    :cond_a
    :goto_1
    return-void

    .line 204
    nop

    .line 205
    :pswitch_data_0
    .packed-switch 0x7d1
        :pswitch_5
        :pswitch_4
        :pswitch_7
        :pswitch_3
        :pswitch_2
    .end packed-switch

    .line 206
    .line 207
    .line 208
    .line 209
    .line 210
    .line 211
    .line 212
    .line 213
    .line 214
    .line 215
    .line 216
    .line 217
    .line 218
    .line 219
    :pswitch_data_1
    .packed-switch 0x7d7
        :pswitch_1
        :pswitch_6
        :pswitch_0
    .end packed-switch
.end method
