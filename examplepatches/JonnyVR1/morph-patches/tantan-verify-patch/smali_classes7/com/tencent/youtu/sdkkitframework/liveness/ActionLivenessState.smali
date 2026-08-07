.class public Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;
.super Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;
.source "SourceFile"


# instance fields
.field public A:I

.field public B:I

.field public C:Ljava/lang/String;

.field public D:I

.field public E:I

.field public F:Ljava/lang/String;

.field public G:I

.field public H:Z

.field public I:Z

.field public J:I

.field public K:I

.field public L:Z

.field public M:F

.field public N:F

.field public O:F

.field public P:I

.field public Q:I

.field public R:I

.field public S:I

.field public T:F

.field public U:Z

.field public V:I

.field public W:Z

.field public X:Z

.field public Y:Z

.field public a:Ljava/lang/String;

.field public b:I

.field public c:[Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;

.field public d:I

.field public e:I

.field public f:Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface$b;

.field public g:I

.field public h:[Ljava/lang/String;

.field public i:I

.field public j:I

.field public k:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

.field public l:Z

.field public m:Lcom/tencent/youtu/sdkkitframework/liveness/p;

.field public n:Ljava/lang/String;

.field public o:I

.field public p:Lcom/tencent/youtu/ytposedetect/data/YTActRefData;

.field public q:Z

.field public r:I

.field public s:I

.field public t:I

.field public u:Ljava/lang/String;

.field public v:Ljava/lang/String;

.field public w:Ljava/lang/String;

.field public x:Z

.field public y:Lcom/tencent/youtu/liveness/YTFaceTracker$Param;

.field public z:Lcom/tencent/youtu/liveness/YTFaceTracker;


# direct methods
.method public constructor <init>()V
    .locals 5

    .line 1
    invoke-direct {p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "3.7.5"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->a:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->b:I

    .line 10
    .line 11
    const/4 v1, -0x1

    .line 12
    iput v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->d:I

    .line 13
    .line 14
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->e:I

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    iput v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->g:I

    .line 18
    .line 19
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->j:I

    .line 20
    .line 21
    iput-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->l:Z

    .line 22
    .line 23
    new-instance v3, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    .line 29
    .line 30
    .line 31
    move-result-object v4

    .line 32
    invoke-virtual {v4}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string v4, "/temp.mp4"

    .line 40
    .line 41
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    iput-object v3, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->n:Ljava/lang/String;

    .line 49
    .line 50
    iput v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->o:I

    .line 51
    .line 52
    iput-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->q:Z

    .line 53
    .line 54
    const/high16 v3, 0x200000

    .line 55
    .line 56
    iput v3, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->r:I

    .line 57
    .line 58
    const/16 v3, 0x1e

    .line 59
    .line 60
    iput v3, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->s:I

    .line 61
    .line 62
    iput v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->t:I

    .line 63
    .line 64
    const-string v2, ""

    .line 65
    .line 66
    iput-object v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->u:Ljava/lang/String;

    .line 67
    .line 68
    iput-object v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->v:Ljava/lang/String;

    .line 69
    .line 70
    const-string v3, "pass"

    .line 71
    .line 72
    iput-object v3, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->w:Ljava/lang/String;

    .line 73
    .line 74
    iput-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->x:Z

    .line 75
    .line 76
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->A:I

    .line 77
    .line 78
    const/4 v3, 0x5

    .line 79
    iput v3, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->B:I

    .line 80
    .line 81
    iput-object v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->C:Ljava/lang/String;

    .line 82
    .line 83
    const/16 v2, 0x14

    .line 84
    .line 85
    iput v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->D:I

    .line 86
    .line 87
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->G:I

    .line 88
    .line 89
    iput-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->H:Z

    .line 90
    .line 91
    iput-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->I:Z

    .line 92
    .line 93
    const/high16 v2, 0x42480000    # 50.0f

    .line 94
    .line 95
    iput v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->M:F

    .line 96
    .line 97
    iput v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->N:F

    .line 98
    .line 99
    iput v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->O:F

    .line 100
    .line 101
    iput v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->P:I

    .line 102
    .line 103
    iput v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->Q:I

    .line 104
    .line 105
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->R:I

    .line 106
    .line 107
    const v1, 0x3ec28f5c    # 0.38f

    .line 108
    .line 109
    .line 110
    iput v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->T:F

    .line 111
    .line 112
    iput-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->U:Z

    .line 113
    .line 114
    const/16 v1, 0xa

    .line 115
    .line 116
    iput v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->V:I

    .line 117
    .line 118
    iput-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->W:Z

    .line 119
    .line 120
    return-void
.end method

.method public static synthetic a(Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;)Ljava/lang/String;
    .locals 0

    .line 140
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->a:Ljava/lang/String;

    return-object p0
.end method

.method public static synthetic a(Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;Z)Z
    .locals 0

    .line 126
    iput-boolean p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->l:Z

    return p1
.end method

.method public static synthetic b(Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->u:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c(Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->v:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d(Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;)[Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->h:[Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic e(Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->g:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic f(Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->i:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic g(Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->w:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public final a()V
    .locals 3

    const/4 v0, 0x0

    .line 127
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->j:I

    .line 128
    iput-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->l:Z

    .line 129
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->A:I

    const/4 v1, -0x1

    .line 130
    iput v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->d:I

    .line 131
    iput-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->L:Z

    .line 132
    iput-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->W:Z

    .line 133
    iget-object v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->h:[Ljava/lang/String;

    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->i:I

    invoke-virtual {p0, v1, v0}, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->a([Ljava/lang/String;I)Z

    .line 134
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;->SILENT_STATE:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    iput-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->k:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 135
    :try_start_0
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->m:Lcom/tencent/youtu/sdkkitframework/liveness/p;

    if-eqz v0, :cond_0

    .line 136
    iget-object v0, v0, Lcom/tencent/youtu/sdkkitframework/liveness/p;->a:Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;

    invoke-virtual {v0}, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->abortEncoding()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "ActionLivenessState"

    const-string v2, "video error:"

    .line 137
    invoke-static {v1, v2, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 138
    :cond_0
    :goto_0
    new-instance v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$j;

    invoke-direct {v0, p0}, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$j;-><init>(Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;)V

    iput-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->f:Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface$b;

    .line 139
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    move-result-object v0

    invoke-virtual {v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getContext()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;

    move-result-object v0

    iget-object v0, v0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;->currentAppContext:Landroid/content/Context;

    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    move-result-object v1

    invoke-virtual {v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getContext()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;

    move-result-object v1

    iget v1, v1, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;->currentRotateState:I

    new-instance v2, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$k;

    invoke-direct {v2, p0}, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$k;-><init>(Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;)V

    invoke-static {v0, v1, v2}, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface;->start(Landroid/content/Context;ILcom/tencent/youtu/ytposedetect/YTPoseDetectInterface$c;)I

    return-void
.end method

.method public final a([Ljava/lang/String;I)Z
    .locals 3

    .line 1
    array-length v0, p1

    .line 2
    const/4 v1, 0x0

    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return v1

    .line 6
    :cond_0
    iput p2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->i:I

    .line 7
    .line 8
    array-length v0, p1

    .line 9
    if-lt p2, v0, :cond_1

    .line 10
    .line 11
    return v1

    .line 12
    :cond_1
    aget-object p1, p1, p2

    .line 13
    .line 14
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;->getInstance()Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    invoke-virtual {p2, p1}, Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;->reportEvent(I)V

    .line 23
    .line 24
    .line 25
    const/4 p2, 0x1

    .line 26
    if-eqz p1, :cond_6

    .line 27
    .line 28
    if-eq p1, p2, :cond_6

    .line 29
    .line 30
    const/4 v0, 0x2

    .line 31
    if-eq p1, v0, :cond_5

    .line 32
    .line 33
    const/4 v0, 0x3

    .line 34
    if-eq p1, v0, :cond_4

    .line 35
    .line 36
    const/4 v0, 0x4

    .line 37
    if-eq p1, v0, :cond_3

    .line 38
    .line 39
    const/4 v0, 0x5

    .line 40
    if-eq p1, v0, :cond_2

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_2
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->g:I

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_3
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->g:I

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_4
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->g:I

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_5
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->g:I

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_6
    iput p2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->g:I

    .line 56
    .line 57
    :goto_0
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->stateData:Ljava/util/HashMap;

    .line 58
    .line 59
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    const-string v2, "current_action_type"

    .line 64
    .line 65
    invoke-virtual {v0, v2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    new-instance p1, Ljava/lang/StringBuilder;

    .line 69
    .line 70
    const-string v0, "action check rounds: "

    .line 71
    .line 72
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    iget v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->i:I

    .line 76
    .line 77
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    const-string v0, "start check pose: "

    .line 81
    .line 82
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    iget v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->g:I

    .line 86
    .line 87
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    const-string v0, "ActionLivenessState"

    .line 95
    .line 96
    invoke-static {v0, p1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->o(Ljava/lang/String;Ljava/lang/Object;)V

    .line 97
    .line 98
    .line 99
    iget-boolean p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->I:Z

    .line 100
    .line 101
    if-nez p1, :cond_7

    .line 102
    .line 103
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;->SILENT_STATE:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 108
    .line 109
    invoke-static {v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper;->classNameOfState(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;)Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-virtual {p1, v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getStateByName(Ljava/lang/String;)Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    const-string v0, "reset_timeout"

    .line 118
    .line 119
    const/4 v2, 0x0

    .line 120
    invoke-virtual {p1, v0, v2}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->handleStateAction(Ljava/lang/String;Ljava/lang/Object;)V

    .line 121
    .line 122
    .line 123
    :cond_7
    iput v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->A:I

    .line 124
    .line 125
    return p2
.end method

.method public enter()V
    .locals 7

    .line 1
    const-string v0, "NULL"

    .line 2
    .line 3
    invoke-super {p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->enter()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    sget-object v2, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;->SILENT_STATE:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 11
    .line 12
    invoke-static {v2}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper;->classNameOfState(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-virtual {v1, v2}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getStateByName(Ljava/lang/String;)Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    const-string v2, "continuous_detect_count"

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->getStateDataBy(Ljava/lang/String;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    check-cast v2, Ljava/lang/Integer;

    .line 27
    .line 28
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    iput v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->b:I

    .line 33
    .line 34
    const-string v2, "face_status"

    .line 35
    .line 36
    invoke-virtual {v1, v2}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->getStateDataBy(Ljava/lang/String;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    check-cast v2, [Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;

    .line 41
    .line 42
    iput-object v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->c:[Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;

    .line 43
    .line 44
    const-string v2, "pose_state"

    .line 45
    .line 46
    invoke-virtual {v1, v2}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->getStateDataBy(Ljava/lang/String;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    check-cast v2, Ljava/lang/Integer;

    .line 51
    .line 52
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    iput v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->d:I

    .line 57
    .line 58
    const-string v2, "shelter_state"

    .line 59
    .line 60
    invoke-virtual {v1, v2}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->getStateDataBy(Ljava/lang/String;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    check-cast v1, Ljava/lang/Integer;

    .line 65
    .line 66
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    iput v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->e:I

    .line 71
    .line 72
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    sget-object v2, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;->NET_FETCH_STATE:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 77
    .line 78
    invoke-static {v2}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper;->classNameOfState(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    invoke-virtual {v1, v2}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getStateByName(Ljava/lang/String;)Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    const/4 v2, 0x5

    .line 87
    const/4 v3, 0x1

    .line 88
    if-eqz v1, :cond_1

    .line 89
    .line 90
    iget-boolean v4, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->q:Z

    .line 91
    .line 92
    if-nez v4, :cond_1

    .line 93
    .line 94
    const-string v4, "action_data"

    .line 95
    .line 96
    invoke-virtual {v1, v4}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->getStateDataBy(Ljava/lang/String;)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object v4

    .line 100
    check-cast v4, Ljava/lang/String;

    .line 101
    .line 102
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 103
    .line 104
    .line 105
    move-result v5

    .line 106
    if-nez v5, :cond_0

    .line 107
    .line 108
    const-string v5, ","

    .line 109
    .line 110
    invoke-virtual {v4, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v4

    .line 114
    iput-object v4, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->h:[Ljava/lang/String;

    .line 115
    .line 116
    array-length v5, v4

    .line 117
    iget v6, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->i:I

    .line 118
    .line 119
    if-le v5, v6, :cond_1

    .line 120
    .line 121
    aget-object v4, v4, v6

    .line 122
    .line 123
    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 124
    .line 125
    .line 126
    move-result v4

    .line 127
    packed-switch v4, :pswitch_data_0

    .line 128
    .line 129
    .line 130
    goto :goto_0

    .line 131
    :pswitch_0
    const/16 v5, 0x9

    .line 132
    .line 133
    iput v5, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->g:I

    .line 134
    .line 135
    goto :goto_0

    .line 136
    :pswitch_1
    const/16 v5, 0x8

    .line 137
    .line 138
    iput v5, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->g:I

    .line 139
    .line 140
    goto :goto_0

    .line 141
    :pswitch_2
    const/4 v5, 0x7

    .line 142
    iput v5, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->g:I

    .line 143
    .line 144
    goto :goto_0

    .line 145
    :pswitch_3
    const/4 v5, 0x6

    .line 146
    iput v5, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->g:I

    .line 147
    .line 148
    goto :goto_0

    .line 149
    :pswitch_4
    iput v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->g:I

    .line 150
    .line 151
    goto :goto_0

    .line 152
    :pswitch_5
    const/4 v5, 0x4

    .line 153
    iput v5, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->g:I

    .line 154
    .line 155
    goto :goto_0

    .line 156
    :pswitch_6
    const/4 v5, 0x3

    .line 157
    iput v5, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->g:I

    .line 158
    .line 159
    goto :goto_0

    .line 160
    :pswitch_7
    const/4 v5, 0x2

    .line 161
    iput v5, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->g:I

    .line 162
    .line 163
    goto :goto_0

    .line 164
    :pswitch_8
    iput v3, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->g:I

    .line 165
    .line 166
    :goto_0
    iget-object v5, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->stateData:Ljava/util/HashMap;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 167
    .line 168
    const-string v6, "current_action_type"

    .line 169
    .line 170
    :try_start_1
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 171
    .line 172
    .line 173
    move-result-object v4

    .line 174
    invoke-virtual {v5, v6, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 175
    .line 176
    .line 177
    goto :goto_1

    .line 178
    :cond_0
    new-instance p0, Ljava/lang/Exception;

    .line 179
    .line 180
    const-string v0, "action_data is empty"

    .line 181
    .line 182
    invoke-direct {p0, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 183
    .line 184
    .line 185
    throw p0

    .line 186
    :cond_1
    :goto_1
    iget v4, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->G:I

    .line 187
    .line 188
    if-ne v4, v3, :cond_2

    .line 189
    .line 190
    iput v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->g:I

    .line 191
    .line 192
    const-string v2, "5"

    .line 193
    .line 194
    filled-new-array {v2}, [Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v2

    .line 198
    iput-object v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->h:[Ljava/lang/String;

    .line 199
    .line 200
    :cond_2
    iget-object v2, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->stateData:Ljava/util/HashMap;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 201
    .line 202
    const-string v4, "action_seq"

    .line 203
    .line 204
    :try_start_2
    iget-object v5, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->h:[Ljava/lang/String;

    .line 205
    .line 206
    invoke-virtual {v2, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 207
    .line 208
    .line 209
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 210
    .line 211
    .line 212
    move-result-object v2

    .line 213
    invoke-virtual {v2}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getWorkMode()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKKitFrameworkWorkMode;

    .line 214
    .line 215
    .line 216
    move-result-object v2

    .line 217
    sget-object v4, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKKitFrameworkWorkMode;->YT_FW_ACTREFLECT_TYPE:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKKitFrameworkWorkMode;

    .line 218
    .line 219
    if-ne v2, v4, :cond_4

    .line 220
    .line 221
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;

    .line 222
    .line 223
    .line 224
    move-result-object v0

    .line 225
    invoke-virtual {v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->version()Ljava/lang/String;

    .line 226
    .line 227
    .line 228
    move-result-object v0

    .line 229
    const-string v2, "-"

    .line 230
    .line 231
    invoke-virtual {v0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 232
    .line 233
    .line 234
    move-result-object v0

    .line 235
    iget-object v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->h:[Ljava/lang/String;

    .line 236
    .line 237
    invoke-static {v2}, Lcom/tencent/could/huiyansdk/api/e;->a([Ljava/lang/String;)Ljava/lang/String;

    .line 238
    .line 239
    .line 240
    move-result-object v2

    .line 241
    if-eqz v1, :cond_5

    .line 242
    .line 243
    iget-boolean v4, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->W:Z

    .line 244
    .line 245
    if-nez v4, :cond_5

    .line 246
    .line 247
    const-string v4, "color_data"

    .line 248
    .line 249
    invoke-virtual {v1, v4}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->getStateDataBy(Ljava/lang/String;)Ljava/lang/Object;

    .line 250
    .line 251
    .line 252
    move-result-object v4

    .line 253
    check-cast v4, Ljava/lang/String;

    .line 254
    .line 255
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 256
    .line 257
    .line 258
    move-result v5

    .line 259
    if-nez v5, :cond_3

    .line 260
    .line 261
    const/4 v5, 0x0

    .line 262
    aget-object v0, v0, v5

    .line 263
    .line 264
    iget-object v5, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->n:Ljava/lang/String;

    .line 265
    .line 266
    const-string v6, "sd_data"

    .line 267
    .line 268
    invoke-virtual {v1, v6}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->getStateDataBy(Ljava/lang/String;)Ljava/lang/Object;

    .line 269
    .line 270
    .line 271
    move-result-object v1

    .line 272
    check-cast v1, Ljava/lang/String;

    .line 273
    .line 274
    invoke-static {v4, v0, v2, v5, v1}, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;->setColorData(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 275
    .line 276
    .line 277
    iput-boolean v3, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->W:Z

    .line 278
    .line 279
    goto :goto_2

    .line 280
    :cond_3
    new-instance p0, Ljava/lang/Exception;

    .line 281
    .line 282
    const-string v0, "color_data is empty"

    .line 283
    .line 284
    invoke-direct {p0, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 285
    .line 286
    .line 287
    throw p0

    .line 288
    :cond_4
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->n:Ljava/lang/String;

    .line 289
    .line 290
    invoke-static {v0, v0, v0, p0, v0}, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;->setColorData(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 291
    .line 292
    .line 293
    goto :goto_2

    .line 294
    :catch_0
    move-exception p0

    .line 295
    const-string v0, "ActionLivenessState"

    .line 296
    .line 297
    const-string v1, "action enter failed "

    .line 298
    .line 299
    invoke-static {v0, v1, p0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 300
    .line 301
    .line 302
    invoke-static {v1, p0}, Lcom/tencent/youtu/sdkkitframework/common/CommonUtils;->reportException(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 303
    .line 304
    .line 305
    :cond_5
    :goto_2
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 306
    .line 307
    .line 308
    move-result-object p0

    .line 309
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMUpdateStrategy;->CacheStrategy:Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMUpdateStrategy;

    .line 310
    .line 311
    invoke-virtual {p0, v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->updateCacheStrategy(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMUpdateStrategy;)V

    .line 312
    .line 313
    .line 314
    return-void

    .line 315
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_8
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public enterFirst()V
    .locals 11

    .line 1
    const-string v1, "ActionLivenessState"

    .line 2
    .line 3
    const/4 v2, 0x1

    .line 4
    invoke-virtual {p0, v1, v2}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->makeStateInfo(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-static {v1, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->o(Ljava/lang/String;Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget-object v3, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;->SILENT_STATE:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 16
    .line 17
    invoke-static {v3}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper;->classNameOfState(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    invoke-virtual {v0, v3}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getStateByName(Ljava/lang/String;)Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    const-string v0, "reset_timeout"

    .line 26
    .line 27
    const/4 v4, 0x0

    .line 28
    invoke-virtual {v3, v0, v4}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->handleStateAction(Ljava/lang/String;Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sget-object v4, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;->NET_FETCH_STATE:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 36
    .line 37
    invoke-static {v4}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper;->classNameOfState(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    invoke-virtual {v0, v4}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getStateByName(Ljava/lang/String;)Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    if-eqz v0, :cond_3

    .line 46
    .line 47
    :try_start_0
    const-string v4, "video_bitrate"

    .line 48
    .line 49
    invoke-virtual {v0, v4}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->getStateDataBy(Ljava/lang/String;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    if-eqz v4, :cond_0

    .line 54
    .line 55
    check-cast v4, Ljava/lang/Integer;

    .line 56
    .line 57
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 58
    .line 59
    .line 60
    move-result v4

    .line 61
    iput v4, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->r:I

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :catch_0
    move-exception v0

    .line 65
    goto :goto_1

    .line 66
    :cond_0
    :goto_0
    const-string v4, "video_framerate"

    .line 67
    .line 68
    invoke-virtual {v0, v4}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->getStateDataBy(Ljava/lang/String;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v4

    .line 72
    if-eqz v4, :cond_1

    .line 73
    .line 74
    check-cast v4, Ljava/lang/Integer;

    .line 75
    .line 76
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 77
    .line 78
    .line 79
    move-result v4

    .line 80
    iput v4, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->s:I

    .line 81
    .line 82
    :cond_1
    const-string v4, "video_iframeinterval"

    .line 83
    .line 84
    invoke-virtual {v0, v4}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->getStateDataBy(Ljava/lang/String;)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v4

    .line 88
    if-eqz v4, :cond_2

    .line 89
    .line 90
    check-cast v4, Ljava/lang/Integer;

    .line 91
    .line 92
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 93
    .line 94
    .line 95
    move-result v4

    .line 96
    iput v4, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->t:I

    .line 97
    .line 98
    :cond_2
    const-string v4, "control_config"

    .line 99
    .line 100
    invoke-virtual {v0, v4}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->getStateDataBy(Ljava/lang/String;)Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    check-cast v0, Ljava/lang/String;

    .line 105
    .line 106
    if-eqz v0, :cond_3

    .line 107
    .line 108
    iput-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->C:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 109
    .line 110
    goto :goto_2

    .line 111
    :goto_1
    const-string v4, "action enter first failed:"

    .line 112
    .line 113
    invoke-static {v1, v4, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 114
    .line 115
    .line 116
    :cond_3
    :goto_2
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->C:Ljava/lang/String;

    .line 117
    .line 118
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    const/4 v4, 0x0

    .line 123
    if-nez v0, :cond_9

    .line 124
    .line 125
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->C:Ljava/lang/String;

    .line 126
    .line 127
    const-string v5, "&"

    .line 128
    .line 129
    invoke-virtual {v0, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    array-length v5, v0

    .line 134
    if-lez v5, :cond_9

    .line 135
    .line 136
    array-length v5, v0

    .line 137
    move v6, v4

    .line 138
    :goto_3
    if-ge v6, v5, :cond_9

    .line 139
    .line 140
    aget-object v7, v0, v6

    .line 141
    .line 142
    const-string v8, "="

    .line 143
    .line 144
    invoke-virtual {v7, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v7

    .line 148
    array-length v8, v7

    .line 149
    if-le v8, v2, :cond_4

    .line 150
    .line 151
    aget-object v8, v7, v4

    .line 152
    .line 153
    const-string v9, "actref_ux_mode"

    .line 154
    .line 155
    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    move-result v8

    .line 159
    if-eqz v8, :cond_4

    .line 160
    .line 161
    aget-object v8, v7, v2

    .line 162
    .line 163
    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 164
    .line 165
    .line 166
    move-result v8

    .line 167
    iput v8, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->G:I

    .line 168
    .line 169
    :cond_4
    array-length v8, v7

    .line 170
    if-le v8, v2, :cond_5

    .line 171
    .line 172
    aget-object v8, v7, v4

    .line 173
    .line 174
    const-string v9, "action_video_shorten_strategy"

    .line 175
    .line 176
    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 177
    .line 178
    .line 179
    move-result v8

    .line 180
    if-eqz v8, :cond_5

    .line 181
    .line 182
    aget-object v8, v7, v2

    .line 183
    .line 184
    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 185
    .line 186
    .line 187
    move-result v8

    .line 188
    iput v8, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->K:I

    .line 189
    .line 190
    invoke-static {v8}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object v8

    .line 194
    invoke-static {v9, v8}, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;->updateParam(Ljava/lang/String;Ljava/lang/String;)I

    .line 195
    .line 196
    .line 197
    :cond_5
    array-length v8, v7

    .line 198
    if-le v8, v2, :cond_8

    .line 199
    .line 200
    aget-object v8, v7, v4

    .line 201
    .line 202
    const-string v9, "compress_pose_image_score"

    .line 203
    .line 204
    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 205
    .line 206
    .line 207
    move-result v8

    .line 208
    if-eqz v8, :cond_8

    .line 209
    .line 210
    aget-object v7, v7, v2

    .line 211
    .line 212
    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 213
    .line 214
    .line 215
    move-result v7

    .line 216
    const/16 v8, 0x50

    .line 217
    .line 218
    if-ge v7, v8, :cond_6

    .line 219
    .line 220
    :goto_4
    move v7, v8

    .line 221
    goto :goto_5

    .line 222
    :cond_6
    const/16 v8, 0x63

    .line 223
    .line 224
    if-le v7, v8, :cond_7

    .line 225
    .line 226
    goto :goto_4

    .line 227
    :cond_7
    :goto_5
    new-instance v8, Ljava/lang/StringBuilder;

    .line 228
    .line 229
    const-string v9, "compress pose image score:"

    .line 230
    .line 231
    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 232
    .line 233
    .line 234
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 235
    .line 236
    .line 237
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 238
    .line 239
    .line 240
    move-result-object v8

    .line 241
    invoke-static {v1, v8}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->o(Ljava/lang/String;Ljava/lang/Object;)V

    .line 242
    .line 243
    .line 244
    sput v7, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;->compressPoseImageScore:I

    .line 245
    .line 246
    :cond_8
    add-int/lit8 v6, v6, 0x1

    .line 247
    .line 248
    goto :goto_3

    .line 249
    :cond_9
    const-string v0, "detect_instance"

    .line 250
    .line 251
    invoke-virtual {v3, v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->getStateDataBy(Ljava/lang/String;)Ljava/lang/Object;

    .line 252
    .line 253
    .line 254
    move-result-object v0

    .line 255
    check-cast v0, Lcom/tencent/youtu/liveness/YTFaceTracker;

    .line 256
    .line 257
    iput-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->z:Lcom/tencent/youtu/liveness/YTFaceTracker;

    .line 258
    .line 259
    if-eqz v0, :cond_a

    .line 260
    .line 261
    invoke-virtual {v0}, Lcom/tencent/youtu/liveness/YTFaceTracker;->getParam()Lcom/tencent/youtu/liveness/YTFaceTracker$Param;

    .line 262
    .line 263
    .line 264
    move-result-object v0

    .line 265
    iput-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->y:Lcom/tencent/youtu/liveness/YTFaceTracker$Param;

    .line 266
    .line 267
    if-eqz v0, :cond_b

    .line 268
    .line 269
    iget v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->D:I

    .line 270
    .line 271
    iput v1, v0, Lcom/tencent/youtu/liveness/YTFaceTracker$Param;->detInterval:I

    .line 272
    .line 273
    iget-object v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->z:Lcom/tencent/youtu/liveness/YTFaceTracker;

    .line 274
    .line 275
    invoke-virtual {v1, v0}, Lcom/tencent/youtu/liveness/YTFaceTracker;->setParam(Lcom/tencent/youtu/liveness/YTFaceTracker$Param;)V

    .line 276
    .line 277
    .line 278
    goto :goto_6

    .line 279
    :cond_a
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;->getInstance()Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;

    .line 280
    .line 281
    .line 282
    move-result-object v0

    .line 283
    const v1, 0x49445

    .line 284
    .line 285
    .line 286
    const-string v2, "\u6a21\u5f0f\u521d\u59cb\u5316\u5931\u8d25"

    .line 287
    .line 288
    invoke-virtual {v0, v1, v2}, Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;->reportError(ILjava/lang/String;)V

    .line 289
    .line 290
    .line 291
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 292
    .line 293
    .line 294
    move-result-object v0

    .line 295
    new-instance v1, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$i;

    .line 296
    .line 297
    invoke-direct {v1, p0}, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$i;-><init>(Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;)V

    .line 298
    .line 299
    .line 300
    invoke-virtual {v0, v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->sendFSMEvent(Ljava/util/HashMap;)V

    .line 301
    .line 302
    .line 303
    :cond_b
    :goto_6
    new-instance v5, Lcom/tencent/youtu/sdkkitframework/liveness/p;

    .line 304
    .line 305
    iget-object v6, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->n:Ljava/lang/String;

    .line 306
    .line 307
    iget v7, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->r:I

    .line 308
    .line 309
    iget v8, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->s:I

    .line 310
    .line 311
    iget v9, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->t:I

    .line 312
    .line 313
    iget-object v10, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->C:Ljava/lang/String;

    .line 314
    .line 315
    invoke-direct/range {v5 .. v10}, Lcom/tencent/youtu/sdkkitframework/liveness/p;-><init>(Ljava/lang/String;IIILjava/lang/String;)V

    .line 316
    .line 317
    .line 318
    iput-object v5, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->m:Lcom/tencent/youtu/sdkkitframework/liveness/p;

    .line 319
    .line 320
    iget v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->R:I

    .line 321
    .line 322
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 323
    .line 324
    .line 325
    move-result-object v0

    .line 326
    const-string v1, "screen_orientation"

    .line 327
    .line 328
    invoke-static {v1, v0}, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;->updateParam(Ljava/lang/String;Ljava/lang/String;)I

    .line 329
    .line 330
    .line 331
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->m:Lcom/tencent/youtu/sdkkitframework/liveness/p;

    .line 332
    .line 333
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/p;->a:Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;

    .line 334
    .line 335
    invoke-virtual {p0}, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->getColorFormat()I

    .line 336
    .line 337
    .line 338
    move-result p0

    .line 339
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 340
    .line 341
    .line 342
    move-result-object p0

    .line 343
    const-string v0, "video_color_format_type"

    .line 344
    .line 345
    invoke-static {v0, p0}, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;->updateParam(Ljava/lang/String;Ljava/lang/String;)I

    .line 346
    .line 347
    .line 348
    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 349
    .line 350
    .line 351
    move-result-object p0

    .line 352
    const-string v0, "out_image_type"

    .line 353
    .line 354
    invoke-static {v0, p0}, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;->updateParam(Ljava/lang/String;Ljava/lang/String;)I

    .line 355
    .line 356
    .line 357
    return-void
.end method

.method public exit()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->exit()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public handleEvent(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtFrameworkFireEventType;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->handleEvent(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtFrameworkFireEventType;Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    iget-boolean p2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->x:Z

    .line 5
    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    sget-object p2, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtFrameworkFireEventType;->YT_EVENT_TRIGGER_CANCEL_LIVENESS:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtFrameworkFireEventType;

    .line 9
    .line 10
    if-ne p1, p2, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->a()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public loadStateWith(Ljava/lang/String;Lorg/json/JSONObject;Lcom/tencent/youtu/sdkkitframework/common/YtSdkConfig;)V
    .locals 9

    .line 1
    const-string v0, "action_inner_settings"

    .line 2
    .line 3
    const-string v1, "action_default_seq"

    .line 4
    .line 5
    const-string v2, "action_security_level"

    .line 6
    .line 7
    invoke-super {p0, p1, p2, p3}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->loadStateWith(Ljava/lang/String;Lorg/json/JSONObject;Lcom/tencent/youtu/sdkkitframework/common/YtSdkConfig;)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;->getVersion()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    new-instance p3, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string v3, "YTPose Version: "

    .line 17
    .line 18
    invoke-direct {p3, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p3

    .line 28
    const-string v3, "ActionLivenessState"

    .line 29
    .line 30
    invoke-static {v3, p3}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    const-string p3, "\\."

    .line 34
    .line 35
    invoke-virtual {p1, p3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    iget-object v5, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->a:Ljava/lang/String;

    .line 40
    .line 41
    new-instance v6, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    const-string v7, "Wanted YTPose Version: "

    .line 44
    .line 45
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v6

    .line 55
    invoke-static {v3, v6}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v5, p3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p3

    .line 62
    const/4 v5, 0x0

    .line 63
    aget-object v6, v4, v5

    .line 64
    .line 65
    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 66
    .line 67
    .line 68
    move-result v6

    .line 69
    aget-object v7, p3, v5

    .line 70
    .line 71
    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 72
    .line 73
    .line 74
    move-result v7

    .line 75
    const/4 v8, 0x1

    .line 76
    if-eq v6, v7, :cond_0

    .line 77
    .line 78
    new-instance p3, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$d;

    .line 79
    .line 80
    invoke-direct {p3, p0, p1}, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$d;-><init>(Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    invoke-virtual {p1, p3}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->sendFSMEvent(Ljava/util/HashMap;)V

    .line 88
    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_0
    aget-object v6, v4, v8

    .line 92
    .line 93
    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 94
    .line 95
    .line 96
    move-result v6

    .line 97
    aget-object v7, p3, v8

    .line 98
    .line 99
    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 100
    .line 101
    .line 102
    move-result v7

    .line 103
    if-eq v6, v7, :cond_1

    .line 104
    .line 105
    new-instance p3, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$e;

    .line 106
    .line 107
    invoke-direct {p3, p0, p1}, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$e;-><init>(Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    invoke-virtual {p1, p3}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->sendFSMEvent(Ljava/util/HashMap;)V

    .line 115
    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_1
    const/4 v6, 0x2

    .line 119
    aget-object v4, v4, v6

    .line 120
    .line 121
    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 122
    .line 123
    .line 124
    move-result v4

    .line 125
    aget-object p3, p3, v6

    .line 126
    .line 127
    invoke-static {p3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 128
    .line 129
    .line 130
    move-result p3

    .line 131
    if-ge v4, p3, :cond_2

    .line 132
    .line 133
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 134
    .line 135
    .line 136
    move-result-object p3

    .line 137
    new-instance v4, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$f;

    .line 138
    .line 139
    invoke-direct {v4, p0, p1}, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$f;-><init>(Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {p3, v4}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->sendFSMEvent(Ljava/util/HashMap;)V

    .line 143
    .line 144
    .line 145
    :cond_2
    :goto_0
    invoke-static {}, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface;->initModel()I

    .line 146
    .line 147
    .line 148
    move-result p1

    .line 149
    if-eqz p1, :cond_3

    .line 150
    .line 151
    new-instance p2, Ljava/lang/StringBuilder;

    .line 152
    .line 153
    const-string p3, "action load failed2: "

    .line 154
    .line 155
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object p2

    .line 165
    const/4 p3, 0x0

    .line 166
    invoke-static {v3, p2, p3}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 167
    .line 168
    .line 169
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 170
    .line 171
    .line 172
    move-result-object p2

    .line 173
    new-instance p3, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$g;

    .line 174
    .line 175
    invoke-direct {p3, p0, p1}, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$g;-><init>(Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;I)V

    .line 176
    .line 177
    .line 178
    invoke-virtual {p2, p3}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->sendFSMEvent(Ljava/util/HashMap;)V

    .line 179
    .line 180
    .line 181
    return-void

    .line 182
    :cond_3
    iput v5, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->b:I

    .line 183
    .line 184
    iget-object p1, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->stateData:Ljava/util/HashMap;

    .line 185
    .line 186
    iget p3, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->g:I

    .line 187
    .line 188
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 189
    .line 190
    .line 191
    move-result-object p3

    .line 192
    const-string v4, "action_type"

    .line 193
    .line 194
    invoke-virtual {p1, v4, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 195
    .line 196
    .line 197
    :try_start_0
    invoke-virtual {p2, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 198
    .line 199
    .line 200
    move-result p1

    .line 201
    if-eqz p1, :cond_4

    .line 202
    .line 203
    invoke-virtual {p2, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 204
    .line 205
    .line 206
    move-result p1

    .line 207
    iput p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->o:I

    .line 208
    .line 209
    goto :goto_1

    .line 210
    :catch_0
    move-exception p1

    .line 211
    goto :goto_3

    .line 212
    :cond_4
    :goto_1
    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 213
    .line 214
    .line 215
    move-result-object p1

    .line 216
    if-nez p1, :cond_5

    .line 217
    .line 218
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;->getInstance()Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;

    .line 219
    .line 220
    .line 221
    move-result-object p1

    .line 222
    const-string p3, "yt_param_error"

    .line 223
    .line 224
    const/high16 v1, 0x300000

    .line 225
    .line 226
    invoke-virtual {p1, v1, p3}, Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;->reportError(ILjava/lang/String;)V

    .line 227
    .line 228
    .line 229
    return-void

    .line 230
    :cond_5
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    .line 231
    .line 232
    .line 233
    move-result p3

    .line 234
    new-array p3, p3, [Ljava/lang/String;

    .line 235
    .line 236
    iput-object p3, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->h:[Ljava/lang/String;

    .line 237
    .line 238
    :goto_2
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    .line 239
    .line 240
    .line 241
    move-result p3

    .line 242
    if-ge v5, p3, :cond_6

    .line 243
    .line 244
    iget-object p3, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->h:[Ljava/lang/String;

    .line 245
    .line 246
    invoke-virtual {p1, v5}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object v2

    .line 250
    aput-object v2, p3, v5

    .line 251
    .line 252
    add-int/lit8 v5, v5, 0x1

    .line 253
    .line 254
    goto :goto_2

    .line 255
    :cond_6
    new-instance p1, Ljava/lang/StringBuilder;

    .line 256
    .line 257
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 258
    .line 259
    .line 260
    const-string p3, "load action sequence from sdkconfig "

    .line 261
    .line 262
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 263
    .line 264
    .line 265
    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 266
    .line 267
    .line 268
    move-result-object p3

    .line 269
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 270
    .line 271
    .line 272
    const-string p3, " size :"

    .line 273
    .line 274
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 275
    .line 276
    .line 277
    iget-object p3, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->h:[Ljava/lang/String;

    .line 278
    .line 279
    array-length p3, p3

    .line 280
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 281
    .line 282
    .line 283
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 284
    .line 285
    .line 286
    move-result-object p1

    .line 287
    invoke-static {v3, p1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 288
    .line 289
    .line 290
    goto :goto_4

    .line 291
    :goto_3
    const-string p3, "action load failed3: "

    .line 292
    .line 293
    invoke-static {v3, p3, p1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 294
    .line 295
    .line 296
    const-string p1, "0"

    .line 297
    .line 298
    const-string p3, " "

    .line 299
    .line 300
    invoke-virtual {p1, p3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 301
    .line 302
    .line 303
    move-result-object p1

    .line 304
    iput-object p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->h:[Ljava/lang/String;

    .line 305
    .line 306
    :goto_4
    :try_start_1
    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 307
    .line 308
    .line 309
    move-result p1

    .line 310
    if-eqz p1, :cond_7

    .line 311
    .line 312
    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 313
    .line 314
    .line 315
    move-result-object p1

    .line 316
    invoke-virtual {p1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    .line 317
    .line 318
    .line 319
    move-result-object p2

    .line 320
    :goto_5
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 321
    .line 322
    .line 323
    move-result p3

    .line 324
    if-eqz p3, :cond_7

    .line 325
    .line 326
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 327
    .line 328
    .line 329
    move-result-object p3

    .line 330
    check-cast p3, Ljava/lang/String;

    .line 331
    .line 332
    invoke-virtual {p1, p3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 333
    .line 334
    .line 335
    move-result-object v0

    .line 336
    invoke-static {p3, v0}, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;->updateParam(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 337
    .line 338
    .line 339
    goto :goto_5

    .line 340
    :catch_1
    move-exception p1

    .line 341
    const-string p2, "action load failed4: "

    .line 342
    .line 343
    invoke-static {v3, p2, p1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 344
    .line 345
    .line 346
    :cond_7
    new-instance p1, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$h;

    .line 347
    .line 348
    invoke-direct {p1, p0}, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$h;-><init>(Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;)V

    .line 349
    .line 350
    .line 351
    invoke-static {p1}, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;->setLoggerListener(Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface$IYtLoggerListener;)V

    .line 352
    .line 353
    .line 354
    invoke-static {v8}, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;->configNativeLog(Z)V

    .line 355
    .line 356
    .line 357
    const-string p1, "log_level"

    .line 358
    .line 359
    const-string p2, "3"

    .line 360
    .line 361
    invoke-static {p1, p2}, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;->updateParam(Ljava/lang/String;Ljava/lang/String;)I

    .line 362
    .line 363
    .line 364
    new-instance p1, Ljava/lang/StringBuilder;

    .line 365
    .line 366
    const-string p2, ""

    .line 367
    .line 368
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 369
    .line 370
    .line 371
    iget p3, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->D:I

    .line 372
    .line 373
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 374
    .line 375
    .line 376
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 377
    .line 378
    .line 379
    move-result-object p1

    .line 380
    const-string p3, "frame_num"

    .line 381
    .line 382
    invoke-static {p3, p1}, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;->updateParam(Ljava/lang/String;Ljava/lang/String;)I

    .line 383
    .line 384
    .line 385
    new-instance p1, Ljava/lang/StringBuilder;

    .line 386
    .line 387
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 388
    .line 389
    .line 390
    iget p2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->E:I

    .line 391
    .line 392
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 393
    .line 394
    .line 395
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 396
    .line 397
    .line 398
    move-result-object p1

    .line 399
    const-string p2, "last_frame_num"

    .line 400
    .line 401
    invoke-static {p2, p1}, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;->updateParam(Ljava/lang/String;Ljava/lang/String;)I

    .line 402
    .line 403
    .line 404
    iget-object p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->F:Ljava/lang/String;

    .line 405
    .line 406
    const-string p2, "anchor_widths"

    .line 407
    .line 408
    invoke-static {p2, p1}, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;->updateParam(Ljava/lang/String;Ljava/lang/String;)I

    .line 409
    .line 410
    .line 411
    iget p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->S:I

    .line 412
    .line 413
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 414
    .line 415
    .line 416
    move-result-object p1

    .line 417
    const-string p2, "need_best_original_size"

    .line 418
    .line 419
    invoke-static {p2, p1}, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;->updateParam(Ljava/lang/String;Ljava/lang/String;)I

    .line 420
    .line 421
    .line 422
    iget p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->T:F

    .line 423
    .line 424
    invoke-static {p1}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    .line 425
    .line 426
    .line 427
    move-result-object p1

    .line 428
    const-string p2, "action_close_mouth_threshold"

    .line 429
    .line 430
    invoke-static {p2, p1}, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;->updateParam(Ljava/lang/String;Ljava/lang/String;)I

    .line 431
    .line 432
    .line 433
    iget-boolean p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->U:Z

    .line 434
    .line 435
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 436
    .line 437
    .line 438
    move-result-object p1

    .line 439
    const-string p2, "need_frame_quality"

    .line 440
    .line 441
    invoke-static {p2, p1}, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;->updateParam(Ljava/lang/String;Ljava/lang/String;)I

    .line 442
    .line 443
    .line 444
    iget p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->V:I

    .line 445
    .line 446
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 447
    .line 448
    .line 449
    move-result-object p1

    .line 450
    const-string p2, "continuous_quality_num_threshold"

    .line 451
    .line 452
    invoke-static {p2, p1}, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;->updateParam(Ljava/lang/String;Ljava/lang/String;)I

    .line 453
    .line 454
    .line 455
    iget p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->M:F

    .line 456
    .line 457
    invoke-static {p1}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    .line 458
    .line 459
    .line 460
    move-result-object p1

    .line 461
    const-string p2, "secondary_yaw_threshold"

    .line 462
    .line 463
    invoke-static {p2, p1}, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;->updateParam(Ljava/lang/String;Ljava/lang/String;)I

    .line 464
    .line 465
    .line 466
    iget p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->N:F

    .line 467
    .line 468
    invoke-static {p1}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    .line 469
    .line 470
    .line 471
    move-result-object p1

    .line 472
    const-string p2, "secondary_pitch_threshold"

    .line 473
    .line 474
    invoke-static {p2, p1}, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;->updateParam(Ljava/lang/String;Ljava/lang/String;)I

    .line 475
    .line 476
    .line 477
    iget p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->O:F

    .line 478
    .line 479
    invoke-static {p1}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    .line 480
    .line 481
    .line 482
    move-result-object p1

    .line 483
    const-string p2, "secondary_roll_threshold"

    .line 484
    .line 485
    invoke-static {p2, p1}, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;->updateParam(Ljava/lang/String;Ljava/lang/String;)I

    .line 486
    .line 487
    .line 488
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 489
    .line 490
    .line 491
    move-result-object p1

    .line 492
    invoke-virtual {p1}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getContext()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;

    .line 493
    .line 494
    .line 495
    move-result-object p1

    .line 496
    iget p1, p1, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;->currentRotateState:I

    .line 497
    .line 498
    sget-object p1, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;->SILENT_STATE:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 499
    .line 500
    iput-object p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->k:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 501
    .line 502
    iget p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->o:I

    .line 503
    .line 504
    invoke-static {p1}, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;->setSafetyLevel(I)V

    .line 505
    .line 506
    .line 507
    invoke-virtual {p0}, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->reset()V

    .line 508
    .line 509
    .line 510
    return-void
.end method

.method public moveToNextState()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->moveToNextState()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->k:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 5
    .line 6
    sget-object v1, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;->SILENT_STATE:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 7
    .line 8
    if-ne v0, v1, :cond_1

    .line 9
    .line 10
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->k:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 15
    .line 16
    invoke-static {v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper;->classNameOfState(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->transitNextRound(Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    const/4 v1, -0x1

    .line 25
    if-ne v0, v1, :cond_0

    .line 26
    .line 27
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->k:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 28
    .line 29
    invoke-static {v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper;->classNameOfState(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p0, v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->sendFSMTransitError(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void

    .line 37
    :cond_1
    const/4 v0, 0x1

    .line 38
    iput-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->L:Z

    .line 39
    .line 40
    invoke-static {}, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface;->stop()V

    .line 41
    .line 42
    .line 43
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->k:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 48
    .line 49
    invoke-static {p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper;->classNameOfState(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {v0, p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->transitNow(Ljava/lang/String;)I

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public reset()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->a()V

    .line 2
    .line 3
    .line 4
    invoke-super {p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->reset()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public unload()V
    .locals 4

    .line 1
    invoke-super {p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->unload()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface;->isDetecting()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-static {}, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface;->stop()V

    .line 11
    .line 12
    .line 13
    :cond_0
    invoke-static {}, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface;->releaseModel()V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->m:Lcom/tencent/youtu/sdkkitframework/liveness/p;

    .line 17
    .line 18
    if-eqz p0, :cond_1

    .line 19
    .line 20
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/p;->a:Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;

    .line 21
    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    iput-boolean v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/p;->i:Z

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    :try_start_0
    invoke-virtual {v0}, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->abortEncoding()V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/p;->a:Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->stopEncoding()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :catchall_0
    move-exception v0

    .line 38
    goto :goto_1

    .line 39
    :catch_0
    move-exception v0

    .line 40
    const-string v2, "p"

    .line 41
    .line 42
    :try_start_1
    const-string v3, "video release error:"

    .line 43
    .line 44
    invoke-static {v2, v3, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 45
    .line 46
    .line 47
    :goto_0
    iput-object v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/p;->a:Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;

    .line 48
    .line 49
    return-void

    .line 50
    :goto_1
    iput-object v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/p;->a:Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;

    .line 51
    .line 52
    throw v0

    .line 53
    :cond_1
    return-void
.end method

.method public update(Lcom/tencent/youtu/sdkkitframework/common/YTImageData;J)V
    .locals 22

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    invoke-super/range {p0 .. p3}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->update(Lcom/tencent/youtu/sdkkitframework/common/YTImageData;J)V

    .line 6
    .line 7
    .line 8
    iget-boolean v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->I:Z

    .line 9
    .line 10
    const-string v3, "ActionLivenessState"

    .line 11
    .line 12
    if-eqz v2, :cond_0

    .line 13
    .line 14
    iget-object v2, v0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->isPause:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 15
    .line 16
    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-eqz v2, :cond_0

    .line 21
    .line 22
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    new-instance v2, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$l;

    .line 27
    .line 28
    invoke-direct {v2, v0}, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$l;-><init>(Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1, v2}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->sendFSMEvent(Ljava/util/HashMap;)V

    .line 32
    .line 33
    .line 34
    const-wide/16 v0, 0x1e

    .line 35
    .line 36
    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :catch_0
    move-exception v0

    .line 41
    const-string v1, "Thread sleep error"

    .line 42
    .line 43
    invoke-static {v3, v1, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_0
    iget-object v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->c:[Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;

    .line 48
    .line 49
    const/4 v4, 0x0

    .line 50
    if-eqz v2, :cond_15

    .line 51
    .line 52
    array-length v5, v2

    .line 53
    if-lez v5, :cond_15

    .line 54
    .line 55
    iget v5, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->b:I

    .line 56
    .line 57
    if-lez v5, :cond_15

    .line 58
    .line 59
    const/4 v2, 0x7

    .line 60
    const/4 v6, 0x1

    .line 61
    const/4 v7, 0x0

    .line 62
    if-le v5, v6, :cond_1

    .line 63
    .line 64
    iget-boolean v5, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->H:Z

    .line 65
    .line 66
    if-eqz v5, :cond_2

    .line 67
    .line 68
    iget v5, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->d:I

    .line 69
    .line 70
    if-ne v5, v2, :cond_2

    .line 71
    .line 72
    :cond_1
    iget v5, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->B:I

    .line 73
    .line 74
    iput v5, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->A:I

    .line 75
    .line 76
    invoke-static {}, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface;->reset()V

    .line 77
    .line 78
    .line 79
    iput-boolean v7, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->l:Z

    .line 80
    .line 81
    :cond_2
    iget-object v5, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->f:Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface$b;

    .line 82
    .line 83
    if-nez v5, :cond_3

    .line 84
    .line 85
    const-string v0, "FrameHandle is null, check init first"

    .line 86
    .line 87
    invoke-static {v3, v0, v4}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :cond_3
    new-instance v5, Ljava/lang/StringBuilder;

    .line 92
    .line 93
    const-string v8, "pose count"

    .line 94
    .line 95
    invoke-direct {v5, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    iget v8, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->A:I

    .line 99
    .line 100
    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    const-string v8, " stable "

    .line 104
    .line 105
    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    iget v8, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->B:I

    .line 109
    .line 110
    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    const-string v8, " isAction"

    .line 114
    .line 115
    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    iget-boolean v8, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->l:Z

    .line 119
    .line 120
    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v5

    .line 127
    invoke-static {v3, v5}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 128
    .line 129
    .line 130
    iget v5, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->J:I

    .line 131
    .line 132
    iget v8, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->g:I

    .line 133
    .line 134
    if-eq v5, v8, :cond_4

    .line 135
    .line 136
    iget-boolean v5, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->I:Z

    .line 137
    .line 138
    if-eqz v5, :cond_4

    .line 139
    .line 140
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 141
    .line 142
    .line 143
    move-result-object v5

    .line 144
    new-instance v8, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$a;

    .line 145
    .line 146
    invoke-direct {v8, v0}, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$a;-><init>(Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {v5, v8}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->sendFSMEvent(Ljava/util/HashMap;)V

    .line 150
    .line 151
    .line 152
    iget v5, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->g:I

    .line 153
    .line 154
    iput v5, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->J:I

    .line 155
    .line 156
    :cond_4
    iget v5, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->g:I

    .line 157
    .line 158
    iget v8, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->P:I

    .line 159
    .line 160
    const-string v9, "fl_pose_incorrect"

    .line 161
    .line 162
    const-string v10, "ui_tips"

    .line 163
    .line 164
    const-string v11, "not_pass"

    .line 165
    .line 166
    const-string v12, "ui_action"

    .line 167
    .line 168
    if-eq v5, v8, :cond_5

    .line 169
    .line 170
    iget v8, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->Q:I

    .line 171
    .line 172
    if-ne v5, v8, :cond_6

    .line 173
    .line 174
    :cond_5
    iget-object v5, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->c:[Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;

    .line 175
    .line 176
    aget-object v5, v5, v7

    .line 177
    .line 178
    iget v8, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->M:F

    .line 179
    .line 180
    iget v13, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->N:F

    .line 181
    .line 182
    iget v14, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->O:F

    .line 183
    .line 184
    invoke-static {v5, v8, v13, v14}, Lcom/tencent/youtu/sdkkitframework/liveness/o;->a(Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;FFF)Z

    .line 185
    .line 186
    .line 187
    move-result v5

    .line 188
    if-nez v5, :cond_6

    .line 189
    .line 190
    iget v5, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->B:I

    .line 191
    .line 192
    iput v5, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->A:I

    .line 193
    .line 194
    invoke-static {}, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface;->reset()V

    .line 195
    .line 196
    .line 197
    iput-boolean v7, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->l:Z

    .line 198
    .line 199
    new-instance v5, Ljava/lang/StringBuilder;

    .line 200
    .line 201
    const-string v8, "action correction face failure:"

    .line 202
    .line 203
    invoke-direct {v5, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 204
    .line 205
    .line 206
    iget v8, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->g:I

    .line 207
    .line 208
    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 209
    .line 210
    .line 211
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 212
    .line 213
    .line 214
    move-result-object v5

    .line 215
    invoke-static {v3, v5}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->o(Ljava/lang/String;Ljava/lang/Object;)V

    .line 216
    .line 217
    .line 218
    new-instance v5, Ljava/util/HashMap;

    .line 219
    .line 220
    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 221
    .line 222
    .line 223
    invoke-virtual {v5, v12, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 224
    .line 225
    .line 226
    invoke-virtual {v5, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 227
    .line 228
    .line 229
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 230
    .line 231
    .line 232
    move-result-object v8

    .line 233
    invoke-virtual {v8, v5}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->sendFSMEvent(Ljava/util/HashMap;)V

    .line 234
    .line 235
    .line 236
    move v5, v7

    .line 237
    goto :goto_0

    .line 238
    :cond_6
    move v5, v6

    .line 239
    :goto_0
    iget v8, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->g:I

    .line 240
    .line 241
    const/4 v13, 0x3

    .line 242
    if-ne v8, v13, :cond_7

    .line 243
    .line 244
    iget-object v8, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->c:[Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;

    .line 245
    .line 246
    aget-object v8, v8, v7

    .line 247
    .line 248
    iget v8, v8, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->yaw:F

    .line 249
    .line 250
    invoke-static {v8}, Ljava/lang/Math;->abs(F)F

    .line 251
    .line 252
    .line 253
    move-result v8

    .line 254
    const/high16 v14, 0x41a00000    # 20.0f

    .line 255
    .line 256
    cmpl-float v8, v8, v14

    .line 257
    .line 258
    if-lez v8, :cond_7

    .line 259
    .line 260
    iget v5, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->B:I

    .line 261
    .line 262
    iput v5, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->A:I

    .line 263
    .line 264
    iput-boolean v7, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->l:Z

    .line 265
    .line 266
    new-instance v5, Ljava/util/HashMap;

    .line 267
    .line 268
    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 269
    .line 270
    .line 271
    invoke-virtual {v5, v12, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 272
    .line 273
    .line 274
    invoke-virtual {v5, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 275
    .line 276
    .line 277
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 278
    .line 279
    .line 280
    move-result-object v8

    .line 281
    invoke-virtual {v8, v5}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->sendFSMEvent(Ljava/util/HashMap;)V

    .line 282
    .line 283
    .line 284
    move v5, v7

    .line 285
    :cond_7
    iget-boolean v8, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->Y:Z

    .line 286
    .line 287
    const/4 v9, 0x2

    .line 288
    if-eqz v8, :cond_9

    .line 289
    .line 290
    iget v8, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->g:I

    .line 291
    .line 292
    if-eq v8, v9, :cond_9

    .line 293
    .line 294
    iget-object v8, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->c:[Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;

    .line 295
    .line 296
    aget-object v8, v8, v7

    .line 297
    .line 298
    iget-object v8, v8, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->faceShape:[F

    .line 299
    .line 300
    const/16 v14, 0x81

    .line 301
    .line 302
    aget v14, v8, v14

    .line 303
    .line 304
    const/16 v15, 0x6d

    .line 305
    .line 306
    aget v15, v8, v15

    .line 307
    .line 308
    add-float/2addr v14, v15

    .line 309
    const/high16 v15, 0x40000000    # 2.0f

    .line 310
    .line 311
    div-float/2addr v14, v15

    .line 312
    const/16 v16, 0x77

    .line 313
    .line 314
    aget v16, v8, v16

    .line 315
    .line 316
    const/16 v17, 0x61

    .line 317
    .line 318
    aget v17, v8, v17

    .line 319
    .line 320
    add-float v16, v16, v17

    .line 321
    .line 322
    div-float v16, v16, v15

    .line 323
    .line 324
    sub-float v14, v14, v16

    .line 325
    .line 326
    invoke-static {v14}, Ljava/lang/Math;->abs(F)F

    .line 327
    .line 328
    .line 329
    move-result v14

    .line 330
    const/16 v15, 0x5a

    .line 331
    .line 332
    aget v15, v8, v15

    .line 333
    .line 334
    const/16 v16, 0x66

    .line 335
    .line 336
    aget v8, v8, v16

    .line 337
    .line 338
    sub-float/2addr v15, v8

    .line 339
    invoke-static {v15}, Ljava/lang/Math;->abs(F)F

    .line 340
    .line 341
    .line 342
    move-result v8

    .line 343
    div-float/2addr v14, v8

    .line 344
    new-instance v8, Ljava/lang/StringBuilder;

    .line 345
    .line 346
    const-string v15, "action nod head mouth not close!ret:"

    .line 347
    .line 348
    invoke-direct {v8, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 349
    .line 350
    .line 351
    invoke-virtual {v8, v14}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 352
    .line 353
    .line 354
    const-string v15, "|threshold="

    .line 355
    .line 356
    invoke-virtual {v8, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 357
    .line 358
    .line 359
    iget v4, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->T:F

    .line 360
    .line 361
    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 362
    .line 363
    .line 364
    const-string v4, ",action type:"

    .line 365
    .line 366
    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 367
    .line 368
    .line 369
    iget v4, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->g:I

    .line 370
    .line 371
    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 372
    .line 373
    .line 374
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 375
    .line 376
    .line 377
    move-result-object v4

    .line 378
    invoke-static {v3, v4}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->o(Ljava/lang/String;Ljava/lang/Object;)V

    .line 379
    .line 380
    .line 381
    new-instance v4, Ljava/lang/StringBuilder;

    .line 382
    .line 383
    const-string v8, "isMouthCLose  rat="

    .line 384
    .line 385
    invoke-direct {v4, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 386
    .line 387
    .line 388
    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 389
    .line 390
    .line 391
    invoke-virtual {v4, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 392
    .line 393
    .line 394
    iget v8, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->T:F

    .line 395
    .line 396
    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 397
    .line 398
    .line 399
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 400
    .line 401
    .line 402
    move-result-object v4

    .line 403
    invoke-static {v3, v4}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 404
    .line 405
    .line 406
    iget v4, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->T:F

    .line 407
    .line 408
    cmpg-float v4, v14, v4

    .line 409
    .line 410
    if-gez v4, :cond_8

    .line 411
    .line 412
    goto :goto_1

    .line 413
    :cond_8
    iget v4, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->B:I

    .line 414
    .line 415
    iput v4, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->A:I

    .line 416
    .line 417
    iput-boolean v7, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->l:Z

    .line 418
    .line 419
    new-instance v4, Ljava/util/HashMap;

    .line 420
    .line 421
    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 422
    .line 423
    .line 424
    invoke-virtual {v4, v12, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 425
    .line 426
    .line 427
    const-string v5, "fl_close_mouth"

    .line 428
    .line 429
    invoke-virtual {v4, v10, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 430
    .line 431
    .line 432
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 433
    .line 434
    .line 435
    move-result-object v5

    .line 436
    invoke-virtual {v5, v4}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->sendFSMEvent(Ljava/util/HashMap;)V

    .line 437
    .line 438
    .line 439
    move v5, v7

    .line 440
    :cond_9
    :goto_1
    if-eqz v5, :cond_14

    .line 441
    .line 442
    iget v4, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->A:I

    .line 443
    .line 444
    iget v5, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->B:I

    .line 445
    .line 446
    add-int/lit8 v5, v5, 0xa

    .line 447
    .line 448
    if-le v4, v5, :cond_14

    .line 449
    .line 450
    iget-boolean v4, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->l:Z

    .line 451
    .line 452
    if-nez v4, :cond_13

    .line 453
    .line 454
    iget-boolean v4, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->L:Z

    .line 455
    .line 456
    if-nez v4, :cond_13

    .line 457
    .line 458
    iget v4, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->g:I

    .line 459
    .line 460
    if-ne v4, v6, :cond_a

    .line 461
    .line 462
    const-string v2, "fl_act_blink"

    .line 463
    .line 464
    goto :goto_3

    .line 465
    :cond_a
    if-ne v4, v9, :cond_b

    .line 466
    .line 467
    const-string v2, "fl_act_open_mouth"

    .line 468
    .line 469
    goto :goto_3

    .line 470
    :cond_b
    const/4 v5, 0x4

    .line 471
    if-ne v4, v5, :cond_c

    .line 472
    .line 473
    const-string v2, "fl_act_shake_head"

    .line 474
    .line 475
    goto :goto_3

    .line 476
    :cond_c
    if-ne v4, v13, :cond_d

    .line 477
    .line 478
    const-string v2, "fl_act_nod_head"

    .line 479
    .line 480
    goto :goto_3

    .line 481
    :cond_d
    const/4 v5, 0x5

    .line 482
    const-string v8, "fl_pose_keep"

    .line 483
    .line 484
    if-ne v4, v5, :cond_e

    .line 485
    .line 486
    :goto_2
    move-object v2, v8

    .line 487
    goto :goto_3

    .line 488
    :cond_e
    const/4 v5, 0x6

    .line 489
    if-ne v4, v5, :cond_f

    .line 490
    .line 491
    const-string v2, "fl_act_turn_left"

    .line 492
    .line 493
    goto :goto_3

    .line 494
    :cond_f
    if-ne v4, v2, :cond_10

    .line 495
    .line 496
    const-string v2, "fl_act_turn_right"

    .line 497
    .line 498
    goto :goto_3

    .line 499
    :cond_10
    const/16 v2, 0x8

    .line 500
    .line 501
    if-ne v4, v2, :cond_11

    .line 502
    .line 503
    const-string v2, "fl_act_closer_far"

    .line 504
    .line 505
    goto :goto_3

    .line 506
    :cond_11
    const/16 v2, 0x9

    .line 507
    .line 508
    if-ne v4, v2, :cond_12

    .line 509
    .line 510
    const-string v2, "fl_act_far_closer"

    .line 511
    .line 512
    goto :goto_3

    .line 513
    :cond_12
    const-string v2, "Action liveness state getTipsByPoseType action error"

    .line 514
    .line 515
    const/4 v4, 0x0

    .line 516
    invoke-static {v3, v2, v4}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 517
    .line 518
    .line 519
    goto :goto_2

    .line 520
    :goto_3
    new-instance v3, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$b;

    .line 521
    .line 522
    invoke-direct {v3, v0, v2}, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$b;-><init>(Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;Ljava/lang/String;)V

    .line 523
    .line 524
    .line 525
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 526
    .line 527
    .line 528
    move-result-object v2

    .line 529
    invoke-virtual {v2, v3}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->sendFSMEvent(Ljava/util/HashMap;)V

    .line 530
    .line 531
    .line 532
    :cond_13
    new-instance v8, Lcom/tencent/youtu/ytposedetect/data/PoseDetectData;

    .line 533
    .line 534
    iget-object v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->c:[Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;

    .line 535
    .line 536
    aget-object v2, v2, v7

    .line 537
    .line 538
    iget-object v9, v2, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->faceShape:[F

    .line 539
    .line 540
    iget-object v10, v2, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->faceVisible:[F

    .line 541
    .line 542
    iget v11, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->g:I

    .line 543
    .line 544
    iget-object v12, v1, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->imgData:[B

    .line 545
    .line 546
    iget v13, v2, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->pitch:F

    .line 547
    .line 548
    iget v14, v2, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->yaw:F

    .line 549
    .line 550
    iget v15, v2, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->roll:F

    .line 551
    .line 552
    iget v3, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->d:I

    .line 553
    .line 554
    iget v4, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->e:I

    .line 555
    .line 556
    iget-object v2, v2, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->faceRect:Landroid/graphics/Rect;

    .line 557
    .line 558
    iget v5, v1, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->width:I

    .line 559
    .line 560
    iget v1, v1, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->height:I

    .line 561
    .line 562
    const/16 v21, 0x0

    .line 563
    .line 564
    move/from16 v20, v1

    .line 565
    .line 566
    move-object/from16 v18, v2

    .line 567
    .line 568
    move/from16 v16, v3

    .line 569
    .line 570
    move/from16 v17, v4

    .line 571
    .line 572
    move/from16 v19, v5

    .line 573
    .line 574
    invoke-direct/range {v8 .. v21}, Lcom/tencent/youtu/ytposedetect/data/PoseDetectData;-><init>([F[FI[BFFFIILandroid/graphics/Rect;IIZ)V

    .line 575
    .line 576
    .line 577
    iget-object v1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->f:Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface$b;

    .line 578
    .line 579
    invoke-static {v8, v1, v6}, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface;->poseDetect(Lcom/tencent/youtu/ytposedetect/data/PoseDetectData;Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface$b;I)V

    .line 580
    .line 581
    .line 582
    :cond_14
    iget v1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->A:I

    .line 583
    .line 584
    add-int/2addr v1, v6

    .line 585
    iput v1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->A:I

    .line 586
    .line 587
    goto :goto_4

    .line 588
    :cond_15
    if-eqz v2, :cond_16

    .line 589
    .line 590
    array-length v1, v2

    .line 591
    if-nez v1, :cond_18

    .line 592
    .line 593
    :cond_16
    iget-boolean v1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->X:Z

    .line 594
    .line 595
    if-eqz v1, :cond_18

    .line 596
    .line 597
    iget-object v1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->k:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 598
    .line 599
    sget-object v2, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;->SILENT_STATE:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 600
    .line 601
    if-ne v1, v2, :cond_18

    .line 602
    .line 603
    invoke-virtual {v0}, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->reset()V

    .line 604
    .line 605
    .line 606
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 607
    .line 608
    .line 609
    move-result-object v1

    .line 610
    sget-object v3, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;->QUALITY_STATE:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 611
    .line 612
    invoke-static {v3}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper;->classNameOfState(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;)Ljava/lang/String;

    .line 613
    .line 614
    .line 615
    move-result-object v3

    .line 616
    invoke-virtual {v1, v3}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getStateByName(Ljava/lang/String;)Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;

    .line 617
    .line 618
    .line 619
    move-result-object v1

    .line 620
    check-cast v1, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;

    .line 621
    .line 622
    invoke-virtual {v1}, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState;->reset()V

    .line 623
    .line 624
    .line 625
    invoke-static {}, Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface;->reset()V

    .line 626
    .line 627
    .line 628
    iget-boolean v1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->I:Z

    .line 629
    .line 630
    if-nez v1, :cond_17

    .line 631
    .line 632
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 633
    .line 634
    .line 635
    move-result-object v1

    .line 636
    invoke-static {v2}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper;->classNameOfState(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;)Ljava/lang/String;

    .line 637
    .line 638
    .line 639
    move-result-object v2

    .line 640
    invoke-virtual {v1, v2}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getStateByName(Ljava/lang/String;)Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;

    .line 641
    .line 642
    .line 643
    move-result-object v1

    .line 644
    const-string v2, "reset_timeout"

    .line 645
    .line 646
    const/4 v4, 0x0

    .line 647
    invoke-virtual {v1, v2, v4}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->handleStateAction(Ljava/lang/String;Ljava/lang/Object;)V

    .line 648
    .line 649
    .line 650
    goto :goto_4

    .line 651
    :cond_17
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 652
    .line 653
    .line 654
    move-result-object v1

    .line 655
    new-instance v2, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$c;

    .line 656
    .line 657
    invoke-direct {v2, v0}, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$c;-><init>(Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;)V

    .line 658
    .line 659
    .line 660
    invoke-virtual {v1, v2}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->sendFSMEvent(Ljava/util/HashMap;)V

    .line 661
    .line 662
    .line 663
    :cond_18
    :goto_4
    invoke-virtual {v0}, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->moveToNextState()V

    .line 664
    .line 665
    .line 666
    return-void
.end method

.method public updateSDKSetting(Lorg/json/JSONObject;)V
    .locals 25

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    const-string v2, "correction_angle_action_type"

    .line 6
    .line 7
    const-string v3, "need_local_face_best_image"

    .line 8
    .line 9
    const-string v4, "action_close_mouth_threshold"

    .line 10
    .line 11
    const-string v5, "need_best_original_size"

    .line 12
    .line 13
    const-string v6, "screen_orientation"

    .line 14
    .line 15
    const-string v7, "continuous_quality_num_threshold"

    .line 16
    .line 17
    const-string v8, "secondary_roll_threshold"

    .line 18
    .line 19
    const-string v9, "secondary_pitch_threshold"

    .line 20
    .line 21
    const-string v10, "secondary_yaw_threshold"

    .line 22
    .line 23
    const-string v11, "need_close_timeout"

    .line 24
    .line 25
    const-string v12, "control_config"

    .line 26
    .line 27
    const-string v13, "stable_frame_num"

    .line 28
    .line 29
    const-string v14, "manual_trigger"

    .line 30
    .line 31
    const-string v15, "video_iframeinterval"

    .line 32
    .line 33
    move-object/from16 v16, v2

    .line 34
    .line 35
    const-string v2, "video_framerate"

    .line 36
    .line 37
    move-object/from16 v17, v3

    .line 38
    .line 39
    const-string v3, "video_bitrate"

    .line 40
    .line 41
    move-object/from16 v18, v4

    .line 42
    .line 43
    const-string v4, "local_config_flag"

    .line 44
    .line 45
    move-object/from16 v19, v5

    .line 46
    .line 47
    const-string v5, "video_path"

    .line 48
    .line 49
    move-object/from16 v20, v6

    .line 50
    .line 51
    const-string v6, "need_face_quality"

    .line 52
    .line 53
    move-object/from16 v21, v7

    .line 54
    .line 55
    const-string v7, "quality_close_mouth_threshold"

    .line 56
    .line 57
    move-object/from16 v22, v8

    .line 58
    .line 59
    const-string v8, "quality_close_eye_right_threshold"

    .line 60
    .line 61
    move-object/from16 v23, v9

    .line 62
    .line 63
    const-string v9, "quality_close_eye_left_threshold"

    .line 64
    .line 65
    :try_start_0
    invoke-virtual {v1, v9}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 66
    .line 67
    .line 68
    move-result v24

    .line 69
    if-eqz v24, :cond_0

    .line 70
    .line 71
    invoke-virtual {v1, v9}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 72
    .line 73
    .line 74
    :cond_0
    invoke-virtual {v1, v8}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 75
    .line 76
    .line 77
    move-result v9

    .line 78
    if-eqz v9, :cond_1

    .line 79
    .line 80
    invoke-virtual {v1, v8}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 81
    .line 82
    .line 83
    :cond_1
    invoke-virtual {v1, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 84
    .line 85
    .line 86
    move-result v8

    .line 87
    if-eqz v8, :cond_2

    .line 88
    .line 89
    invoke-virtual {v1, v7}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 90
    .line 91
    .line 92
    :cond_2
    invoke-virtual {v1, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 93
    .line 94
    .line 95
    move-result v7

    .line 96
    if-eqz v7, :cond_3

    .line 97
    .line 98
    invoke-virtual {v1, v6}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    .line 99
    .line 100
    .line 101
    move-result v6

    .line 102
    iput-boolean v6, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->U:Z

    .line 103
    .line 104
    :cond_3
    invoke-virtual {v1, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 105
    .line 106
    .line 107
    move-result v6

    .line 108
    if-eqz v6, :cond_4

    .line 109
    .line 110
    invoke-virtual {v1, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v5

    .line 114
    iput-object v5, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->n:Ljava/lang/String;

    .line 115
    .line 116
    goto :goto_0

    .line 117
    :cond_4
    new-instance v5, Ljava/lang/StringBuilder;

    .line 118
    .line 119
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 120
    .line 121
    .line 122
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 123
    .line 124
    .line 125
    move-result-object v6

    .line 126
    invoke-virtual {v6}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getContext()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;

    .line 127
    .line 128
    .line 129
    move-result-object v6

    .line 130
    iget-object v6, v6, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;->currentAppContext:Landroid/content/Context;

    .line 131
    .line 132
    invoke-virtual {v6}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 133
    .line 134
    .line 135
    move-result-object v6

    .line 136
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    const-string v6, "/temp.mp4"

    .line 140
    .line 141
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v5

    .line 148
    iput-object v5, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->n:Ljava/lang/String;

    .line 149
    .line 150
    :goto_0
    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 151
    .line 152
    .line 153
    move-result v5

    .line 154
    if-eqz v5, :cond_5

    .line 155
    .line 156
    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    .line 157
    .line 158
    .line 159
    move-result v4

    .line 160
    iput-boolean v4, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->q:Z

    .line 161
    .line 162
    :cond_5
    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 163
    .line 164
    .line 165
    move-result v4

    .line 166
    if-eqz v4, :cond_6

    .line 167
    .line 168
    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 169
    .line 170
    .line 171
    move-result v3

    .line 172
    iput v3, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->r:I

    .line 173
    .line 174
    :cond_6
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 175
    .line 176
    .line 177
    move-result v3

    .line 178
    if-eqz v3, :cond_7

    .line 179
    .line 180
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 181
    .line 182
    .line 183
    move-result v2

    .line 184
    iput v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->s:I

    .line 185
    .line 186
    :cond_7
    invoke-virtual {v1, v15}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 187
    .line 188
    .line 189
    move-result v2

    .line 190
    if-eqz v2, :cond_8

    .line 191
    .line 192
    invoke-virtual {v1, v15}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 193
    .line 194
    .line 195
    move-result v2

    .line 196
    iput v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->t:I

    .line 197
    .line 198
    :cond_8
    invoke-virtual {v1, v14}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 199
    .line 200
    .line 201
    move-result v2

    .line 202
    if-eqz v2, :cond_9

    .line 203
    .line 204
    invoke-virtual {v1, v14}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    .line 205
    .line 206
    .line 207
    move-result v2

    .line 208
    iput-boolean v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->x:Z

    .line 209
    .line 210
    :cond_9
    invoke-virtual {v1, v13}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 211
    .line 212
    .line 213
    move-result v2

    .line 214
    if-eqz v2, :cond_a

    .line 215
    .line 216
    invoke-virtual {v1, v13}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 217
    .line 218
    .line 219
    move-result v2

    .line 220
    iput v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->B:I

    .line 221
    .line 222
    :cond_a
    invoke-virtual {v1, v12}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 223
    .line 224
    .line 225
    move-result v2

    .line 226
    if-eqz v2, :cond_b

    .line 227
    .line 228
    invoke-virtual {v1, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object v2

    .line 232
    iput-object v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->C:Ljava/lang/String;

    .line 233
    .line 234
    :cond_b
    invoke-virtual {v1, v11}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 235
    .line 236
    .line 237
    move-result v2

    .line 238
    if-eqz v2, :cond_c

    .line 239
    .line 240
    invoke-virtual {v1, v11}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    .line 241
    .line 242
    .line 243
    move-result v2

    .line 244
    iput-boolean v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->I:Z

    .line 245
    .line 246
    :cond_c
    invoke-virtual {v1, v10}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 247
    .line 248
    .line 249
    move-result v2

    .line 250
    if-eqz v2, :cond_d

    .line 251
    .line 252
    invoke-virtual {v1, v10}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 253
    .line 254
    .line 255
    move-result-wide v2

    .line 256
    double-to-float v2, v2

    .line 257
    iput v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->M:F

    .line 258
    .line 259
    :cond_d
    move-object/from16 v2, v23

    .line 260
    .line 261
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 262
    .line 263
    .line 264
    move-result v3

    .line 265
    if-eqz v3, :cond_e

    .line 266
    .line 267
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 268
    .line 269
    .line 270
    move-result-wide v2

    .line 271
    double-to-float v2, v2

    .line 272
    iput v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->N:F

    .line 273
    .line 274
    :cond_e
    move-object/from16 v2, v22

    .line 275
    .line 276
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 277
    .line 278
    .line 279
    move-result v3

    .line 280
    if-eqz v3, :cond_f

    .line 281
    .line 282
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 283
    .line 284
    .line 285
    move-result-wide v2

    .line 286
    double-to-float v2, v2

    .line 287
    iput v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->O:F

    .line 288
    .line 289
    :cond_f
    move-object/from16 v2, v21

    .line 290
    .line 291
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 292
    .line 293
    .line 294
    move-result v3

    .line 295
    if-eqz v3, :cond_10

    .line 296
    .line 297
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 298
    .line 299
    .line 300
    move-result v2

    .line 301
    iput v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->V:I

    .line 302
    .line 303
    :cond_10
    move-object/from16 v2, v20

    .line 304
    .line 305
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 306
    .line 307
    .line 308
    move-result v3

    .line 309
    if-eqz v3, :cond_11

    .line 310
    .line 311
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 312
    .line 313
    .line 314
    move-result v2

    .line 315
    iput v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->R:I

    .line 316
    .line 317
    :cond_11
    move-object/from16 v2, v19

    .line 318
    .line 319
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 320
    .line 321
    .line 322
    move-result v3

    .line 323
    if-eqz v3, :cond_12

    .line 324
    .line 325
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 326
    .line 327
    .line 328
    move-result v2

    .line 329
    iput v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->S:I

    .line 330
    .line 331
    :cond_12
    move-object/from16 v2, v18

    .line 332
    .line 333
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 334
    .line 335
    .line 336
    move-result v3

    .line 337
    if-eqz v3, :cond_13

    .line 338
    .line 339
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 340
    .line 341
    .line 342
    move-result-wide v2

    .line 343
    double-to-float v2, v2

    .line 344
    iput v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->T:F

    .line 345
    .line 346
    :cond_13
    move-object/from16 v2, v17

    .line 347
    .line 348
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 349
    .line 350
    .line 351
    move-result v3

    .line 352
    if-eqz v3, :cond_14

    .line 353
    .line 354
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    .line 355
    .line 356
    .line 357
    move-result v2

    .line 358
    iput-boolean v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->X:Z

    .line 359
    .line 360
    :cond_14
    move-object/from16 v2, v16

    .line 361
    .line 362
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 363
    .line 364
    .line 365
    move-result v3

    .line 366
    const/4 v4, 0x0

    .line 367
    if-eqz v3, :cond_17

    .line 368
    .line 369
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 370
    .line 371
    .line 372
    move-result-object v2

    .line 373
    const-string v3, ","

    .line 374
    .line 375
    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 376
    .line 377
    .line 378
    move-result-object v2

    .line 379
    if-eqz v2, :cond_17

    .line 380
    .line 381
    array-length v3, v2

    .line 382
    if-lez v3, :cond_17

    .line 383
    .line 384
    move v3, v4

    .line 385
    :goto_1
    array-length v5, v2

    .line 386
    if-ge v3, v5, :cond_17

    .line 387
    .line 388
    if-nez v3, :cond_15

    .line 389
    .line 390
    aget-object v5, v2, v3

    .line 391
    .line 392
    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 393
    .line 394
    .line 395
    move-result v5

    .line 396
    iput v5, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->P:I

    .line 397
    .line 398
    goto :goto_2

    .line 399
    :cond_15
    const/4 v5, 0x1

    .line 400
    if-ne v3, v5, :cond_16

    .line 401
    .line 402
    aget-object v5, v2, v3

    .line 403
    .line 404
    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 405
    .line 406
    .line 407
    move-result v5

    .line 408
    iput v5, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->Q:I

    .line 409
    .line 410
    :cond_16
    :goto_2
    add-int/lit8 v3, v3, 0x1

    .line 411
    .line 412
    goto :goto_1

    .line 413
    :cond_17
    const-string v2, "action_frame_num"

    .line 414
    .line 415
    const/16 v3, 0x14

    .line 416
    .line 417
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 418
    .line 419
    .line 420
    move-result v2

    .line 421
    iput v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->D:I

    .line 422
    .line 423
    const-string v2, "last_action_frame_num"

    .line 424
    .line 425
    const/4 v3, 0x3

    .line 426
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 427
    .line 428
    .line 429
    move-result v2

    .line 430
    iput v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->E:I

    .line 431
    .line 432
    const-string v2, "anchor_widths"

    .line 433
    .line 434
    const-string v3, "480,240,240"

    .line 435
    .line 436
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 437
    .line 438
    .line 439
    move-result-object v2

    .line 440
    iput-object v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->F:Ljava/lang/String;

    .line 441
    .line 442
    const-string v2, "need_check_multiface"

    .line 443
    .line 444
    invoke-virtual {v1, v2, v4}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    .line 445
    .line 446
    .line 447
    move-result v2

    .line 448
    iput-boolean v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->H:Z

    .line 449
    .line 450
    const-string v2, "need_pose_check_mouth_open"

    .line 451
    .line 452
    invoke-virtual {v1, v2, v4}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    .line 453
    .line 454
    .line 455
    move-result v1

    .line 456
    iput-boolean v1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->Y:Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 457
    .line 458
    return-void

    .line 459
    :catch_0
    move-exception v0

    .line 460
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 461
    .line 462
    .line 463
    const-string v1, "ActionLivenessState"

    .line 464
    .line 465
    const-string v2, "action load failed1:"

    .line 466
    .line 467
    invoke-static {v1, v2, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 468
    .line 469
    .line 470
    return-void
.end method
