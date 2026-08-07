.class public Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;
.super Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;
.source "SourceFile"


# instance fields
.field public A:F

.field public B:F

.field public C:F

.field public D:F

.field public E:F

.field public F:Z

.field public G:F

.field public H:F

.field public I:F

.field public J:F

.field public K:F

.field public L:F

.field public M:I

.field public N:Landroid/graphics/Rect;

.field public O:Z

.field public P:Z

.field public Q:I

.field public R:I

.field public S:F

.field public T:Lcom/tencent/youtu/liveness/YTFaceTracker;

.field public U:Lcom/tencent/youtu/sdkkitframework/liveness/o$a;

.field public V:I

.field public W:I

.field public X:I

.field public Y:I

.field public Z:I

.field public a:I

.field public a0:Ljava/lang/String;

.field public b:I

.field public b0:I

.field public c:F

.field public c0:Z

.field public d:F

.field public d0:Z

.field public e:I

.field public e0:Ljava/lang/String;

.field public f:I

.field public f0:F

.field public g:I

.field public g0:F

.field public h:Z

.field public h0:F

.field public i:Ljava/lang/String;

.field public i0:Z

.field public j:Z

.field public j0:I

.field public k:Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;

.field public k0:I

.field public l:Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;

.field public m:Z

.field public n:F

.field public o:Z

.field public p:I

.field public q:I

.field public r:I

.field public s:F

.field public t:F

.field public u:I

.field public v:I

.field public w:Z

.field public x:Z

.field public y:I

.field public z:I


# direct methods
.method public constructor <init>()V
    .locals 7

    .line 1
    invoke-direct {p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->e:I

    .line 6
    .line 7
    const/4 v1, -0x1

    .line 8
    iput v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->f:I

    .line 9
    .line 10
    iput v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->g:I

    .line 11
    .line 12
    iput-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->h:Z

    .line 13
    .line 14
    const-string v2, ""

    .line 15
    .line 16
    iput-object v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->i:Ljava/lang/String;

    .line 17
    .line 18
    iput-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->j:Z

    .line 19
    .line 20
    new-instance v3, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;

    .line 21
    .line 22
    const-string v4, "Liveness timeout counter"

    .line 23
    .line 24
    invoke-direct {v3, v4}, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iput-object v3, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->k:Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;

    .line 28
    .line 29
    new-instance v3, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;

    .line 30
    .line 31
    const-string v4, "Predetect timeout counter"

    .line 32
    .line 33
    invoke-direct {v3, v4}, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iput-object v3, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->l:Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;

    .line 37
    .line 38
    iput-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->m:Z

    .line 39
    .line 40
    const v3, 0x3e6147ae    # 0.22f

    .line 41
    .line 42
    .line 43
    iput v3, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->n:F

    .line 44
    .line 45
    iput-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->o:Z

    .line 46
    .line 47
    const/16 v3, 0x1e

    .line 48
    .line 49
    iput v3, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->p:I

    .line 50
    .line 51
    const/16 v3, 0x19

    .line 52
    .line 53
    iput v3, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->q:I

    .line 54
    .line 55
    iput v3, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->r:I

    .line 56
    .line 57
    const/high16 v3, 0x3f800000    # 1.0f

    .line 58
    .line 59
    iput v3, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->s:F

    .line 60
    .line 61
    const/high16 v3, 0x3f000000    # 0.5f

    .line 62
    .line 63
    iput v3, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->t:F

    .line 64
    .line 65
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->u:I

    .line 66
    .line 67
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->v:I

    .line 68
    .line 69
    iput-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->w:Z

    .line 70
    .line 71
    const/4 v3, 0x1

    .line 72
    iput-boolean v3, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->x:Z

    .line 73
    .line 74
    const/4 v4, 0x5

    .line 75
    iput v4, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->y:I

    .line 76
    .line 77
    iput v4, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->z:I

    .line 78
    .line 79
    const v5, -0x2feafd07    # -1.0E10f

    .line 80
    .line 81
    .line 82
    iput v5, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->A:F

    .line 83
    .line 84
    const v6, 0x501502f9    # 1.0E10f

    .line 85
    .line 86
    .line 87
    iput v6, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->B:F

    .line 88
    .line 89
    iput v5, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->C:F

    .line 90
    .line 91
    iput v6, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->D:F

    .line 92
    .line 93
    iput v5, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->E:F

    .line 94
    .line 95
    iput-boolean v3, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->F:Z

    .line 96
    .line 97
    const v6, 0x3f333333    # 0.7f

    .line 98
    .line 99
    .line 100
    iput v6, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->G:F

    .line 101
    .line 102
    iput v5, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->H:F

    .line 103
    .line 104
    const v6, 0x3d4ccccd    # 0.05f

    .line 105
    .line 106
    .line 107
    iput v6, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->I:F

    .line 108
    .line 109
    iput v6, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->J:F

    .line 110
    .line 111
    iput v6, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->K:F

    .line 112
    .line 113
    const v6, 0x3f666666    # 0.9f

    .line 114
    .line 115
    .line 116
    iput v6, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->L:F

    .line 117
    .line 118
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->M:I

    .line 119
    .line 120
    const/4 v6, 0x0

    .line 121
    iput-object v6, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->N:Landroid/graphics/Rect;

    .line 122
    .line 123
    iput-boolean v3, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->O:Z

    .line 124
    .line 125
    iput-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->P:Z

    .line 126
    .line 127
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->Q:I

    .line 128
    .line 129
    iput v4, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->R:I

    .line 130
    .line 131
    iput v5, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->S:F

    .line 132
    .line 133
    iput-object v6, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->T:Lcom/tencent/youtu/liveness/YTFaceTracker;

    .line 134
    .line 135
    iput-object v6, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->U:Lcom/tencent/youtu/sdkkitframework/liveness/o$a;

    .line 136
    .line 137
    iput v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->V:I

    .line 138
    .line 139
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->W:I

    .line 140
    .line 141
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->X:I

    .line 142
    .line 143
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->Z:I

    .line 144
    .line 145
    iput-object v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->a0:Ljava/lang/String;

    .line 146
    .line 147
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->b0:I

    .line 148
    .line 149
    iput-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->c0:Z

    .line 150
    .line 151
    iput-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->d0:Z

    .line 152
    .line 153
    const-string v1, "yt_model_config.ini"

    .line 154
    .line 155
    iput-object v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->e0:Ljava/lang/String;

    .line 156
    .line 157
    const/high16 v1, 0x42480000    # 50.0f

    .line 158
    .line 159
    iput v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->f0:F

    .line 160
    .line 161
    iput v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->g0:F

    .line 162
    .line 163
    iput v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->h0:F

    .line 164
    .line 165
    iput-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->i0:Z

    .line 166
    .line 167
    iput v3, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->j0:I

    .line 168
    .line 169
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->k0:I

    .line 170
    .line 171
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;ILjava/lang/String;)V
    .locals 1

    .line 1
    new-instance p0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "process_action"

    .line 7
    .line 8
    invoke-virtual {p0, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const-string p2, "error_code"

    .line 16
    .line 17
    invoke-virtual {p0, p2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    const-string p1, "message"

    .line 21
    .line 22
    invoke-virtual {p0, p1, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p1, p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->sendFSMEvent(Ljava/util/HashMap;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public enter()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->enter()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public enterFirst()V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    const-string v1, "SilentLivenessState"

    .line 3
    .line 4
    invoke-virtual {p0, v1, v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->makeStateInfo(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-static {v1, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->o(Ljava/lang/String;Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->stateData:Ljava/util/HashMap;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->T:Lcom/tencent/youtu/liveness/YTFaceTracker;

    .line 14
    .line 15
    const-string v2, "detect_instance"

    .line 16
    .line 17
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    iget-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->d0:Z

    .line 21
    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    iget-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->m:Z

    .line 25
    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->k:Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;->start()V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->l:Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;->start()V

    .line 37
    .line 38
    .line 39
    :cond_1
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
    .locals 1

    .line 1
    invoke-super {p0, p1, p2}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->handleEvent(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtFrameworkFireEventType;Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    iget-boolean p2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->m:Z

    .line 5
    .line 6
    if-eqz p2, :cond_1

    .line 7
    .line 8
    sget-object p2, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtFrameworkFireEventType;->YT_EVENT_TRIGGER_BEGIN_LIVENESS:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtFrameworkFireEventType;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    if-ne p1, p2, :cond_0

    .line 12
    .line 13
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->e:I

    .line 14
    .line 15
    const/4 p1, 0x1

    .line 16
    iput-boolean p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->w:Z

    .line 17
    .line 18
    iget-boolean p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->d0:Z

    .line 19
    .line 20
    if-nez p1, :cond_1

    .line 21
    .line 22
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->k:Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;->reset()V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    sget-object p2, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtFrameworkFireEventType;->YT_EVENT_TRIGGER_CANCEL_LIVENESS:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtFrameworkFireEventType;

    .line 29
    .line 30
    if-ne p1, p2, :cond_1

    .line 31
    .line 32
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->e:I

    .line 33
    .line 34
    iput-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->w:Z

    .line 35
    .line 36
    iget-boolean p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->d0:Z

    .line 37
    .line 38
    if-nez p1, :cond_1

    .line 39
    .line 40
    iget-object p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->k:Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;

    .line 41
    .line 42
    invoke-virtual {p1}, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;->cancel()V

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->l:Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;

    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;->reset()V

    .line 48
    .line 49
    .line 50
    :cond_1
    return-void
.end method

.method public handleStateAction(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0

    .line 1
    const/4 p2, 0x0

    .line 2
    invoke-super {p0, p1, p2}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->handleStateAction(Ljava/lang/String;Ljava/lang/Object;)V

    .line 3
    .line 4
    .line 5
    iget-boolean p2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->d0:Z

    .line 6
    .line 7
    if-nez p2, :cond_1

    .line 8
    .line 9
    const-string p2, "reset_timeout"

    .line 10
    .line 11
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    if-eqz p2, :cond_0

    .line 16
    .line 17
    new-instance p1, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    const-string p2, "predetect status:"

    .line 20
    .line 21
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object p2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->l:Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;

    .line 25
    .line 26
    invoke-virtual {p2}, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;->isRunning()Z

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    const-string p2, "SilentLivenessState"

    .line 38
    .line 39
    invoke-static {p2, p1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->l:Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;

    .line 43
    .line 44
    invoke-virtual {p1}, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;->isRunning()Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-nez p1, :cond_1

    .line 49
    .line 50
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->k:Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;

    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;->reset()V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_0
    const-string p2, "reset_manual_trigger"

    .line 57
    .line 58
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    if-eqz p1, :cond_1

    .line 63
    .line 64
    const/4 p1, 0x0

    .line 65
    iput-boolean p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->w:Z

    .line 66
    .line 67
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->k:Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;

    .line 68
    .line 69
    invoke-virtual {p0}, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;->cancel()V

    .line 70
    .line 71
    .line 72
    :cond_1
    return-void
.end method

.method public loadStateWith(Ljava/lang/String;Lorg/json/JSONObject;Lcom/tencent/youtu/sdkkitframework/common/YtSdkConfig;)V
    .locals 2

    .line 1
    const-string v0, "init from filesystem use local path : "

    .line 2
    .line 3
    invoke-super {p0, p1, p2, p3}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->loadStateWith(Ljava/lang/String;Lorg/json/JSONObject;Lcom/tencent/youtu/sdkkitframework/common/YtSdkConfig;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p1}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->getPreviewRect()Landroid/graphics/Rect;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    iput p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->b:I

    .line 19
    .line 20
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p1}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->getPreviewRect()Landroid/graphics/Rect;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    iput p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->a:I

    .line 33
    .line 34
    iget p2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->b:I

    .line 35
    .line 36
    if-eqz p2, :cond_1

    .line 37
    .line 38
    if-eqz p1, :cond_1

    .line 39
    .line 40
    sput p2, Lcom/tencent/youtu/sdkkitframework/liveness/o;->a:I

    .line 41
    .line 42
    sput p1, Lcom/tencent/youtu/sdkkitframework/liveness/o;->b:I

    .line 43
    .line 44
    const/high16 p1, 0x3f800000    # 1.0f

    .line 45
    .line 46
    iput p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->d:F

    .line 47
    .line 48
    iput p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->c:F

    .line 49
    .line 50
    new-instance p1, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    const-string p2, "Camera size:"

    .line 53
    .line 54
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    iget p2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->b:I

    .line 58
    .line 59
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    const-string p2, "*"

    .line 63
    .line 64
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    iget p3, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->a:I

    .line 68
    .line 69
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    const-string p3, "|mask size:"

    .line 73
    .line 74
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    iget p3, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->d:F

    .line 78
    .line 79
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    iget p2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->c:F

    .line 86
    .line 87
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    const-string p2, "SilentLivenessState"

    .line 95
    .line 96
    invoke-static {p2, p1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->o(Ljava/lang/String;Ljava/lang/Object;)V

    .line 97
    .line 98
    .line 99
    :try_start_0
    iget-boolean p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->h:Z

    .line 100
    .line 101
    if-nez p1, :cond_0

    .line 102
    .line 103
    const-string p1, "init from asset"

    .line 104
    .line 105
    invoke-static {p2, p1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    new-instance p1, Lcom/tencent/youtu/liveness/YTFaceTracker;

    .line 109
    .line 110
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 111
    .line 112
    .line 113
    move-result-object p3

    .line 114
    invoke-virtual {p3}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getContext()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;

    .line 115
    .line 116
    .line 117
    move-result-object p3

    .line 118
    iget-object p3, p3, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;->currentAppContext:Landroid/content/Context;

    .line 119
    .line 120
    invoke-virtual {p3}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    .line 121
    .line 122
    .line 123
    move-result-object p3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 124
    const-string v0, "models/face-tracker-v003"

    .line 125
    .line 126
    :try_start_1
    iget-object v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->e0:Ljava/lang/String;

    .line 127
    .line 128
    invoke-direct {p1, p3, v0, v1}, Lcom/tencent/youtu/liveness/YTFaceTracker;-><init>(Landroid/content/res/AssetManager;Ljava/lang/String;Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    iput-object p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->T:Lcom/tencent/youtu/liveness/YTFaceTracker;

    .line 132
    .line 133
    goto :goto_0

    .line 134
    :catchall_0
    move-exception p1

    .line 135
    goto :goto_1

    .line 136
    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 137
    .line 138
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    iget-object p3, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->i:Ljava/lang/String;

    .line 142
    .line 143
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    invoke-static {p2, p1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    new-instance p1, Lcom/tencent/youtu/liveness/YTFaceTracker;

    .line 154
    .line 155
    iget-object p3, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->i:Ljava/lang/String;

    .line 156
    .line 157
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->e0:Ljava/lang/String;

    .line 158
    .line 159
    invoke-direct {p1, p3, v0}, Lcom/tencent/youtu/liveness/YTFaceTracker;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 160
    .line 161
    .line 162
    iput-object p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->T:Lcom/tencent/youtu/liveness/YTFaceTracker;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 163
    .line 164
    :goto_0
    iget-object p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->T:Lcom/tencent/youtu/liveness/YTFaceTracker;

    .line 165
    .line 166
    invoke-virtual {p1}, Lcom/tencent/youtu/liveness/YTFaceTracker;->getParam()Lcom/tencent/youtu/liveness/YTFaceTracker$Param;

    .line 167
    .line 168
    .line 169
    move-result-object p1

    .line 170
    new-instance p3, Ljava/lang/StringBuilder;

    .line 171
    .line 172
    const-string v0, "big face mode"

    .line 173
    .line 174
    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 175
    .line 176
    .line 177
    iget-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->x:Z

    .line 178
    .line 179
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 180
    .line 181
    .line 182
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object p3

    .line 186
    invoke-static {p2, p3}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 187
    .line 188
    .line 189
    iget-boolean p3, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->x:Z

    .line 190
    .line 191
    iput p3, p1, Lcom/tencent/youtu/liveness/YTFaceTracker$Param;->biggerFaceMode:I

    .line 192
    .line 193
    iget p3, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->b:I

    .line 194
    .line 195
    iget v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->a:I

    .line 196
    .line 197
    invoke-static {p3, v0}, Ljava/lang/Math;->min(II)I

    .line 198
    .line 199
    .line 200
    move-result p3

    .line 201
    div-int/lit8 p3, p3, 0x5

    .line 202
    .line 203
    const/16 v0, 0x28

    .line 204
    .line 205
    invoke-static {p3, v0}, Ljava/lang/Math;->max(II)I

    .line 206
    .line 207
    .line 208
    move-result p3

    .line 209
    iput p3, p1, Lcom/tencent/youtu/liveness/YTFaceTracker$Param;->minFaceSize:I

    .line 210
    .line 211
    iget p3, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->y:I

    .line 212
    .line 213
    iput p3, p1, Lcom/tencent/youtu/liveness/YTFaceTracker$Param;->detInterval:I

    .line 214
    .line 215
    iget-object p3, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->T:Lcom/tencent/youtu/liveness/YTFaceTracker;

    .line 216
    .line 217
    invoke-virtual {p3, p1}, Lcom/tencent/youtu/liveness/YTFaceTracker;->setParam(Lcom/tencent/youtu/liveness/YTFaceTracker$Param;)V

    .line 218
    .line 219
    .line 220
    new-instance p1, Ljava/lang/StringBuilder;

    .line 221
    .line 222
    const-string p3, "Detect version:"

    .line 223
    .line 224
    invoke-direct {p1, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 225
    .line 226
    .line 227
    invoke-static {}, Lcom/tencent/youtu/liveness/YTFaceTracker;->getVersion()Ljava/lang/String;

    .line 228
    .line 229
    .line 230
    move-result-object p3

    .line 231
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 232
    .line 233
    .line 234
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object p1

    .line 238
    invoke-static {p2, p1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->o(Ljava/lang/String;Ljava/lang/Object;)V

    .line 239
    .line 240
    .line 241
    goto :goto_2

    .line 242
    :goto_1
    const-string p2, "msg_param_error"

    .line 243
    .line 244
    const-string p3, "Init YTFaceTrack SDK failed with "

    .line 245
    .line 246
    const v0, 0x500001

    .line 247
    .line 248
    .line 249
    invoke-static {v0, p2, p3}, Lcom/tencent/youtu/sdkkitframework/common/CommonUtils;->makeMessageJson(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 250
    .line 251
    .line 252
    move-result-object p2

    .line 253
    const-string p3, "failed"

    .line 254
    .line 255
    invoke-virtual {p0, p3, v0, p2}, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->a(Ljava/lang/String;ILjava/lang/String;)V

    .line 256
    .line 257
    .line 258
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 259
    .line 260
    .line 261
    :goto_2
    invoke-virtual {p0}, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->reset()V

    .line 262
    .line 263
    .line 264
    return-void

    .line 265
    :cond_1
    const-string p0, "Preview size is invalid!"

    .line 266
    .line 267
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 268
    .line 269
    .line 270
    return-void
.end method

.method public moveToNextState()V
    .locals 6

    .line 1
    const/high16 v0, 0x400000

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-super {p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->moveToNextState()V

    .line 8
    .line 9
    .line 10
    iget-boolean v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->m:Z

    .line 11
    .line 12
    const/4 v3, 0x1

    .line 13
    if-eqz v2, :cond_3

    .line 14
    .line 15
    iget-boolean v4, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->P:Z

    .line 16
    .line 17
    if-eqz v4, :cond_0

    .line 18
    .line 19
    iget v4, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->f:I

    .line 20
    .line 21
    if-eqz v4, :cond_0

    .line 22
    .line 23
    const/16 v5, 0x9

    .line 24
    .line 25
    if-ne v4, v5, :cond_2

    .line 26
    .line 27
    :cond_0
    iget-boolean v4, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->c0:Z

    .line 28
    .line 29
    if-eqz v4, :cond_1

    .line 30
    .line 31
    iget v4, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->f:I

    .line 32
    .line 33
    const/4 v5, 0x7

    .line 34
    if-eq v4, v5, :cond_2

    .line 35
    .line 36
    :cond_1
    iget v4, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->f:I

    .line 37
    .line 38
    const/16 v5, 0x8

    .line 39
    .line 40
    if-eq v4, v5, :cond_2

    .line 41
    .line 42
    if-ne v4, v3, :cond_3

    .line 43
    .line 44
    :cond_2
    iget v4, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->Q:I

    .line 45
    .line 46
    add-int/2addr v4, v3

    .line 47
    iput v4, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->Q:I

    .line 48
    .line 49
    iget v5, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->R:I

    .line 50
    .line 51
    if-le v4, v5, :cond_4

    .line 52
    .line 53
    iget p0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->f:I

    .line 54
    .line 55
    invoke-static {p0}, Lcom/tencent/youtu/sdkkitframework/liveness/o;->a(I)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    const-string v2, "action check failed"

    .line 60
    .line 61
    invoke-static {v0, p0, v2}, Lcom/tencent/youtu/sdkkitframework/common/CommonUtils;->makeMessageJson(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    new-instance v0, Ljava/util/HashMap;

    .line 66
    .line 67
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 68
    .line 69
    .line 70
    const-string v2, "ui_tips"

    .line 71
    .line 72
    const-string v3, "rst_failed"

    .line 73
    .line 74
    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    const-string v2, "ui_action"

    .line 78
    .line 79
    const-string v3, "process_finished"

    .line 80
    .line 81
    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    const-string v2, "process_action"

    .line 85
    .line 86
    const-string v3, "failed"

    .line 87
    .line 88
    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    const-string v2, "error_code"

    .line 92
    .line 93
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    const-string v2, "error_reason_code"

    .line 97
    .line 98
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    const-string v1, "message"

    .line 102
    .line 103
    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    invoke-virtual {p0, v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->sendFSMEvent(Ljava/util/HashMap;)V

    .line 111
    .line 112
    .line 113
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;->IDLE_STATE:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 118
    .line 119
    invoke-static {v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper;->classNameOfState(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-virtual {p0, v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->transitNow(Ljava/lang/String;)I

    .line 124
    .line 125
    .line 126
    return-void

    .line 127
    :cond_3
    const/4 v0, 0x0

    .line 128
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->Q:I

    .line 129
    .line 130
    :cond_4
    iget-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->d0:Z

    .line 131
    .line 132
    const-string v1, "yt_verify_step_timeout"

    .line 133
    .line 134
    const v4, 0x400003

    .line 135
    .line 136
    .line 137
    const-string v5, "SilentLivenessState"

    .line 138
    .line 139
    if-nez v0, :cond_5

    .line 140
    .line 141
    if-eqz v2, :cond_5

    .line 142
    .line 143
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->l:Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;

    .line 144
    .line 145
    invoke-virtual {v0}, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;->checkTimeout()Z

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    if-eqz v0, :cond_5

    .line 150
    .line 151
    new-instance v0, Ljava/lang/StringBuilder;

    .line 152
    .line 153
    const-string v2, "predectcountdowner.checkTimeout(): "

    .line 154
    .line 155
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    iget-object v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->l:Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;

    .line 159
    .line 160
    invoke-virtual {v2}, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;->checkTimeout()Z

    .line 161
    .line 162
    .line 163
    move-result v2

    .line 164
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    invoke-static {v5, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 172
    .line 173
    .line 174
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->l:Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;

    .line 175
    .line 176
    invoke-virtual {p0}, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;->cancel()V

    .line 177
    .line 178
    .line 179
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;->getInstance()Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;

    .line 180
    .line 181
    .line 182
    move-result-object p0

    .line 183
    invoke-virtual {p0, v4, v1}, Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;->reportError(ILjava/lang/String;)V

    .line 184
    .line 185
    .line 186
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 187
    .line 188
    .line 189
    move-result-object p0

    .line 190
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;->TIMEOUT_STATE:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 191
    .line 192
    invoke-static {v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper;->classNameOfState(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;)Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    invoke-virtual {p0, v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->transitNow(Ljava/lang/String;)I

    .line 197
    .line 198
    .line 199
    return-void

    .line 200
    :cond_5
    iget-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->d0:Z

    .line 201
    .line 202
    if-nez v0, :cond_6

    .line 203
    .line 204
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->k:Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;

    .line 205
    .line 206
    invoke-virtual {v0}, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;->checkTimeout()Z

    .line 207
    .line 208
    .line 209
    move-result v0

    .line 210
    if-eqz v0, :cond_6

    .line 211
    .line 212
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->k:Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;

    .line 213
    .line 214
    invoke-virtual {p0}, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;->cancel()V

    .line 215
    .line 216
    .line 217
    const-string p0, "liveness timeout"

    .line 218
    .line 219
    invoke-static {v5, p0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 220
    .line 221
    .line 222
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;->getInstance()Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;

    .line 223
    .line 224
    .line 225
    move-result-object p0

    .line 226
    invoke-virtual {p0, v4, v1}, Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;->reportError(ILjava/lang/String;)V

    .line 227
    .line 228
    .line 229
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 230
    .line 231
    .line 232
    move-result-object p0

    .line 233
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;->TIMEOUT_STATE:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 234
    .line 235
    invoke-static {v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper;->classNameOfState(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;)Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object v0

    .line 239
    invoke-virtual {p0, v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->transitNow(Ljava/lang/String;)I

    .line 240
    .line 241
    .line 242
    return-void

    .line 243
    :cond_6
    iget-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->m:Z

    .line 244
    .line 245
    if-eq v0, v3, :cond_7

    .line 246
    .line 247
    iget-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->j:Z

    .line 248
    .line 249
    if-nez v0, :cond_7

    .line 250
    .line 251
    iget v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->e:I

    .line 252
    .line 253
    iget v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->z:I

    .line 254
    .line 255
    if-le v0, v1, :cond_9

    .line 256
    .line 257
    :cond_7
    iput-boolean v3, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->j:Z

    .line 258
    .line 259
    iget-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->d0:Z

    .line 260
    .line 261
    if-nez v0, :cond_8

    .line 262
    .line 263
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->l:Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;

    .line 264
    .line 265
    invoke-virtual {p0}, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;->cancel()V

    .line 266
    .line 267
    .line 268
    :cond_8
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 269
    .line 270
    .line 271
    move-result-object p0

    .line 272
    invoke-virtual {p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getWorkMode()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKKitFrameworkWorkMode;

    .line 273
    .line 274
    .line 275
    move-result-object p0

    .line 276
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 277
    .line 278
    .line 279
    move-result p0

    .line 280
    const/4 v0, 0x2

    .line 281
    if-eq p0, v0, :cond_a

    .line 282
    .line 283
    const/4 v0, 0x3

    .line 284
    if-eq p0, v0, :cond_a

    .line 285
    .line 286
    const/4 v0, 0x4

    .line 287
    if-eq p0, v0, :cond_a

    .line 288
    .line 289
    const/4 v0, 0x5

    .line 290
    if-eq p0, v0, :cond_a

    .line 291
    .line 292
    :cond_9
    return-void

    .line 293
    :cond_a
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 294
    .line 295
    .line 296
    move-result-object p0

    .line 297
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;->QUALITY_STATE:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 298
    .line 299
    invoke-static {v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper;->classNameOfState(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;)Ljava/lang/String;

    .line 300
    .line 301
    .line 302
    move-result-object v0

    .line 303
    invoke-virtual {p0, v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->transitNow(Ljava/lang/String;)I

    .line 304
    .line 305
    .line 306
    return-void
.end method

.method public reset()V
    .locals 4

    .line 1
    const/4 v0, -0x1

    .line 2
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->f:I

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    iput v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->e:I

    .line 6
    .line 7
    iput v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->u:I

    .line 8
    .line 9
    iput v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->b0:I

    .line 10
    .line 11
    iput-boolean v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->w:Z

    .line 12
    .line 13
    iput v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->v:I

    .line 14
    .line 15
    const v2, -0x2feafd07    # -1.0E10f

    .line 16
    .line 17
    .line 18
    iput v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->A:F

    .line 19
    .line 20
    const v3, 0x501502f9    # 1.0E10f

    .line 21
    .line 22
    .line 23
    iput v3, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->D:F

    .line 24
    .line 25
    iput v3, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->B:F

    .line 26
    .line 27
    iput v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->C:F

    .line 28
    .line 29
    iput v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->H:F

    .line 30
    .line 31
    iput-boolean v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->j:Z

    .line 32
    .line 33
    iput v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->Q:I

    .line 34
    .line 35
    iput v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->Y:I

    .line 36
    .line 37
    iput v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->E:F

    .line 38
    .line 39
    iput v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->M:I

    .line 40
    .line 41
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->V:I

    .line 42
    .line 43
    const/4 v0, 0x0

    .line 44
    iput-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->N:Landroid/graphics/Rect;

    .line 45
    .line 46
    iput-boolean v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->i0:Z

    .line 47
    .line 48
    iput v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->k0:I

    .line 49
    .line 50
    iget-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->d0:Z

    .line 51
    .line 52
    if-nez v0, :cond_1

    .line 53
    .line 54
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->k:Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;

    .line 55
    .line 56
    invoke-virtual {v0}, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;->cancel()V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->l:Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;

    .line 60
    .line 61
    invoke-virtual {v0}, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;->cancel()V

    .line 62
    .line 63
    .line 64
    iget-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->m:Z

    .line 65
    .line 66
    if-nez v0, :cond_0

    .line 67
    .line 68
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->k:Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;

    .line 69
    .line 70
    invoke-virtual {v0}, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;->reset()V

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_0
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->l:Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;

    .line 75
    .line 76
    invoke-virtual {v0}, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;->reset()V

    .line 77
    .line 78
    .line 79
    :cond_1
    :goto_0
    invoke-super {p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->reset()V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->stateData:Ljava/util/HashMap;

    .line 83
    .line 84
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->T:Lcom/tencent/youtu/liveness/YTFaceTracker;

    .line 85
    .line 86
    const-string v1, "detect_instance"

    .line 87
    .line 88
    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method public unload()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->unload()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->T:Lcom/tencent/youtu/liveness/YTFaceTracker;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/tencent/youtu/liveness/YTFaceTracker;->destroy()V

    .line 9
    .line 10
    .line 11
    :cond_0
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->T:Lcom/tencent/youtu/liveness/YTFaceTracker;

    .line 13
    .line 14
    return-void
.end method

.method public update(Lcom/tencent/youtu/sdkkitframework/common/YTImageData;J)V
    .locals 21

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    .line 1
    invoke-super/range {p0 .. p3}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->update(Lcom/tencent/youtu/sdkkitframework/common/YTImageData;J)V

    .line 2
    iget-boolean v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->d0:Z

    const-string v3, "SilentLivenessState"

    if-eqz v2, :cond_0

    iget-object v2, v1, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->isPause:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 3
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    move-result-object v0

    new-instance v2, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState$a;

    invoke-direct {v2, v1}, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState$a;-><init>(Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;)V

    invoke-virtual {v0, v2}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->sendFSMEvent(Ljava/util/HashMap;)V

    const-wide/16 v0, 0x1e

    .line 4
    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    const-string v1, "Thread sleep error"

    .line 5
    invoke-static {v3, v1, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void

    :cond_0
    if-eqz v0, :cond_45

    .line 6
    iget-object v4, v0, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->imgData:[B

    if-nez v4, :cond_1

    goto/16 :goto_1c

    .line 7
    :cond_1
    iget-boolean v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->d0:Z

    if-nez v4, :cond_3

    iget-object v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->k:Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;

    invoke-virtual {v4}, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;->checkTimeout()Z

    move-result v4

    if-nez v4, :cond_2

    iget-boolean v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->m:Z

    if-eqz v4, :cond_3

    iget-object v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->l:Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;

    invoke-virtual {v4}, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;->checkTimeout()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 8
    :cond_2
    invoke-virtual {v1}, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->moveToNextState()V

    return-void

    .line 9
    :cond_3
    iget v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->b0:I

    const/4 v5, 0x1

    add-int/2addr v4, v5

    iput v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->b0:I

    .line 10
    const-string v4, "detect"

    invoke-static {v4}, Lcom/tencent/youtu/sdkkitframework/common/CommonUtils;->benchMarkBegin(Ljava/lang/String;)V

    .line 11
    :try_start_1
    iget-object v6, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->T:Lcom/tencent/youtu/liveness/YTFaceTracker;

    iget-object v8, v0, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->imgData:[B

    iget v9, v0, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->width:I

    iget v10, v0, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->height:I

    const/4 v11, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v6 .. v11}, Lcom/tencent/youtu/liveness/YTFaceTracker;->track(I[BIII)[Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;

    move-result-object v6
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 12
    invoke-static {v4}, Lcom/tencent/youtu/sdkkitframework/common/CommonUtils;->benchMarkEnd(Ljava/lang/String;)J

    .line 13
    invoke-static {v4}, Lcom/tencent/youtu/sdkkitframework/common/CommonUtils;->getBenchMarkTime(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    const/4 v4, 0x0

    if-eqz v6, :cond_7

    .line 14
    array-length v7, v6

    if-nez v7, :cond_4

    goto :goto_1

    .line 15
    :cond_4
    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "face status count "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    array-length v8, v6

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v3, v7}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    invoke-static {v6}, Lcom/tencent/youtu/sdkkitframework/liveness/o;->a([Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;)[Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;

    move-result-object v6

    const/high16 v7, -0x80000000

    move v8, v4

    move v9, v8

    .line 17
    :goto_0
    array-length v10, v6

    if-ge v8, v10, :cond_6

    .line 18
    aget-object v10, v6, v8

    invoke-static {v10}, Lcom/tencent/youtu/sdkkitframework/liveness/o;->a(Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;)Landroid/graphics/Rect;

    move-result-object v10

    .line 19
    invoke-virtual {v10}, Landroid/graphics/Rect;->width()I

    move-result v11

    invoke-virtual {v10}, Landroid/graphics/Rect;->height()I

    move-result v10

    mul-int/2addr v11, v10

    if-lt v11, v7, :cond_5

    move v9, v8

    move v7, v11

    :cond_5
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    :cond_6
    if-eqz v9, :cond_8

    .line 20
    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "Found max face id:"

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    const-string v8, "o"

    invoke-static {v8, v7}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    aget-object v7, v6, v9

    aput-object v7, v6, v4

    goto :goto_2

    :cond_7
    :goto_1
    const/4 v6, 0x0

    :cond_8
    :goto_2
    if-eqz v6, :cond_9

    .line 22
    array-length v7, v6

    if-lez v7, :cond_9

    .line 23
    aget-object v7, v6, v4

    invoke-static {v7}, Lcom/tencent/youtu/sdkkitframework/liveness/o;->a(Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;)Landroid/graphics/Rect;

    move-result-object v8

    iput-object v8, v7, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->faceRect:Landroid/graphics/Rect;

    :cond_9
    const-string v8, ""

    const-string v9, "not_pass"

    const-string v13, "ui_action"

    const/16 p3, 0x0

    const/4 v7, 0x7

    const-string v11, "ui_tips"

    if-nez v6, :cond_a

    .line 24
    iput v5, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->Z:I

    move v12, v5

    move/from16 v17, v12

    const/4 v10, -0x1

    const/16 v16, 0x2

    goto/16 :goto_13

    :cond_a
    const/16 v16, 0x2

    .line 25
    array-length v12, v6

    if-le v12, v5, :cond_c

    .line 26
    iget-boolean v12, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->c0:Z

    if-eqz v12, :cond_b

    .line 27
    iput v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->e:I

    .line 28
    iput v7, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->f:I

    move v12, v7

    goto :goto_3

    :cond_b
    const/4 v12, -0x1

    .line 29
    :goto_3
    iput v7, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->Z:I

    move/from16 v17, v5

    const/4 v10, -0x1

    goto/16 :goto_13

    .line 30
    :cond_c
    aget-object v12, v6, v4

    .line 31
    iget-boolean v14, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->i0:Z

    if-nez v14, :cond_e

    .line 32
    iget v14, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->f0:F

    iget v7, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->g0:F

    iget v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->h0:F

    invoke-static {v12, v14, v7, v2}, Lcom/tencent/youtu/sdkkitframework/liveness/o;->a(Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;FFF)Z

    move-result v2

    if-eqz v2, :cond_d

    .line 33
    iget v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->k0:I

    add-int/2addr v2, v5

    iput v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->k0:I

    .line 34
    iget v7, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->j0:I

    if-lt v2, v7, :cond_e

    .line 35
    iput-boolean v5, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->i0:Z

    goto :goto_4

    .line 36
    :cond_d
    iput v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->k0:I

    .line 37
    :cond_e
    :goto_4
    iget-boolean v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->i0:Z

    if-nez v2, :cond_f

    const-string v2, "correction face failure"

    .line 38
    invoke-static {v3, v2}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 39
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 40
    invoke-virtual {v2, v13, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v7, "fl_pose_incorrect"

    .line 41
    invoke-virtual {v2, v11, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    move-result-object v7

    invoke-virtual {v7, v2}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->sendFSMEvent(Ljava/util/HashMap;)V

    goto/16 :goto_18

    .line 43
    :cond_f
    invoke-static {v12}, Lcom/tencent/youtu/sdkkitframework/liveness/o;->a(Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;)Landroid/graphics/Rect;

    move-result-object v2

    .line 44
    iget-object v7, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->N:Landroid/graphics/Rect;

    if-nez v7, :cond_10

    .line 45
    iput-object v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->N:Landroid/graphics/Rect;

    .line 46
    iput v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->M:I

    move/from16 v17, v5

    goto :goto_6

    .line 47
    :cond_10
    invoke-static {v2, v7}, Lcom/tencent/youtu/sdkkitframework/liveness/o;->a(Landroid/graphics/Rect;Landroid/graphics/Rect;)Landroid/graphics/Rect;

    move-result-object v7

    .line 48
    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v14

    if-eqz v14, :cond_12

    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v14

    if-eqz v14, :cond_12

    .line 49
    invoke-virtual {v7}, Landroid/graphics/Rect;->width()I

    move-result v14

    int-to-float v14, v14

    invoke-virtual {v7}, Landroid/graphics/Rect;->height()I

    move-result v7

    int-to-float v7, v7

    mul-float/2addr v14, v7

    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v7

    int-to-float v7, v7

    div-float/2addr v14, v7

    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v7

    int-to-float v7, v7

    div-float/2addr v14, v7

    invoke-static {v14}, Ljava/lang/Math;->abs(F)F

    move-result v7

    .line 50
    iget v14, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->L:F

    cmpg-float v14, v7, v14

    if-gez v14, :cond_11

    .line 51
    new-instance v14, Ljava/lang/StringBuilder;

    move/from16 v17, v5

    const-string v5, "face shaking:"

    invoke-direct {v14, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->o(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v5, "fl_act_screen_shaking"

    .line 52
    iput-object v5, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->a0:Ljava/lang/String;

    .line 53
    iput v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->M:I

    goto :goto_5

    :cond_11
    move/from16 v17, v5

    .line 54
    iput-object v8, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->a0:Ljava/lang/String;

    .line 55
    iget v5, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->M:I

    add-int/lit8 v5, v5, 0x1

    iput v5, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->M:I

    goto :goto_5

    :cond_12
    move/from16 v17, v5

    .line 56
    :goto_5
    iput-object v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->N:Landroid/graphics/Rect;

    .line 57
    :goto_6
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;

    move-result-object v5

    invoke-virtual {v5}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->getDetectRect()Landroid/graphics/Rect;

    move-result-object v5

    .line 58
    new-instance v7, Landroid/graphics/Rect;

    invoke-direct {v7, v4, v4, v4, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 59
    new-instance v14, Ljava/lang/StringBuilder;

    const-string v15, "camera"

    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v15, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->b:I

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v15, "x"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v10, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->a:I

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v10, " ratio "

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v10, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->d:F

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v10, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->c:F

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v3, v10}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 60
    new-instance v10, Ljava/lang/StringBuilder;

    const-string v14, "detectrect :"

    invoke-direct {v10, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v14, v5, Landroid/graphics/Rect;->left:I

    invoke-virtual {v10, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v14, " "

    invoke-virtual {v10, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v15, v5, Landroid/graphics/Rect;->top:I

    invoke-virtual {v10, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v15, v5, Landroid/graphics/Rect;->right:I

    invoke-virtual {v10, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v15, v5, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v10, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v3, v10}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 61
    iget v10, v2, Landroid/graphics/Rect;->left:I

    int-to-float v10, v10

    iget v15, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->d:F

    mul-float/2addr v10, v15

    float-to-int v10, v10

    iput v10, v7, Landroid/graphics/Rect;->left:I

    .line 62
    iget v10, v2, Landroid/graphics/Rect;->right:I

    int-to-float v10, v10

    mul-float/2addr v10, v15

    float-to-int v10, v10

    iput v10, v7, Landroid/graphics/Rect;->right:I

    .line 63
    iget v10, v2, Landroid/graphics/Rect;->top:I

    int-to-float v10, v10

    iget v15, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->c:F

    mul-float/2addr v10, v15

    float-to-int v10, v10

    iput v10, v7, Landroid/graphics/Rect;->top:I

    .line 64
    iget v10, v2, Landroid/graphics/Rect;->bottom:I

    int-to-float v10, v10

    mul-float/2addr v10, v15

    float-to-int v10, v10

    iput v10, v7, Landroid/graphics/Rect;->bottom:I

    .line 65
    iput v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->Y:I

    move v10, v4

    .line 66
    :goto_7
    iget-object v15, v12, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->faceShape:[F

    array-length v4, v15

    div-int/lit8 v4, v4, 0x2

    if-ge v10, v4, :cond_15

    mul-int/lit8 v4, v10, 0x2

    .line 67
    aget v19, v15, v4

    move/from16 v20, v4

    iget v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->b:I

    int-to-float v4, v4

    cmpl-float v4, v19, v4

    if-gtz v4, :cond_13

    cmpg-float v4, v19, p3

    if-ltz v4, :cond_13

    add-int/lit8 v4, v20, 0x1

    aget v4, v15, v4

    cmpg-float v15, v4, p3

    if-ltz v15, :cond_13

    iget v15, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->a:I

    int-to-float v15, v15

    cmpl-float v4, v4, v15

    if-lez v4, :cond_14

    .line 68
    :cond_13
    iget v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->Y:I

    add-int/lit8 v4, v4, 0x1

    iput v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->Y:I

    :cond_14
    add-int/lit8 v10, v10, 0x1

    const/4 v4, 0x0

    goto :goto_7

    .line 69
    :cond_15
    invoke-static {v5, v7}, Lcom/tencent/youtu/sdkkitframework/liveness/o;->a(Landroid/graphics/Rect;Landroid/graphics/Rect;)Landroid/graphics/Rect;

    move-result-object v4

    .line 70
    invoke-virtual {v4}, Landroid/graphics/Rect;->width()I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {v4}, Landroid/graphics/Rect;->height()I

    move-result v4

    int-to-float v4, v4

    mul-float/2addr v5, v4

    invoke-virtual {v7}, Landroid/graphics/Rect;->width()I

    move-result v4

    int-to-float v4, v4

    div-float/2addr v5, v4

    invoke-virtual {v7}, Landroid/graphics/Rect;->height()I

    move-result v4

    int-to-float v4, v4

    div-float/2addr v5, v4

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v4

    iput v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->S:F

    .line 71
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "faceInMask : "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v5, v7, Landroid/graphics/Rect;->left:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v5, v7, Landroid/graphics/Rect;->top:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v5, v7, Landroid/graphics/Rect;->right:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v5, v7, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, " in rect ratio"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v5, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->S:F

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 72
    iget v4, v2, Landroid/graphics/Rect;->right:I

    iget v2, v2, Landroid/graphics/Rect;->left:I

    sub-int/2addr v4, v2

    int-to-float v2, v4

    iget v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->b:I

    int-to-float v4, v4

    const/high16 v5, 0x3f800000    # 1.0f

    mul-float/2addr v4, v5

    div-float/2addr v2, v4

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    .line 73
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    move-result-object v4

    sget-object v5, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;->ACTION_STATE:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    invoke-static {v5}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper;->classNameOfState(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getStateByName(Ljava/lang/String;)Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;

    move-result-object v4

    if-eqz v4, :cond_17

    .line 74
    const-string v5, "current_action_type"

    invoke-virtual {v4, v5}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->containsKey(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_17

    .line 75
    invoke-virtual {v4, v5}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->getStateDataBy(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const/4 v5, 0x3

    if-eq v4, v5, :cond_16

    const/4 v5, 0x4

    if-ne v4, v5, :cond_17

    :cond_16
    const/4 v4, 0x0

    goto :goto_8

    :cond_17
    move/from16 v4, v17

    .line 76
    :goto_8
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v7, "face area ratio:"

    invoke-direct {v5, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 77
    iget v5, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->Y:I

    const/4 v7, 0x3

    if-lt v5, v7, :cond_18

    .line 78
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v4, "face incomplete invalid point count:"

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->Y:I

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v5, 0x0

    invoke-static {v3, v2, v5}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    const/16 v2, 0x8

    :goto_9
    move v4, v2

    const/4 v2, 0x0

    :goto_a
    const/16 v18, 0x0

    goto/16 :goto_f

    :cond_18
    const/4 v5, 0x0

    .line 79
    iget v7, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->s:F

    cmpl-float v7, v2, v7

    if-lez v7, :cond_1a

    .line 80
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v7, "face too big:"

    invoke-direct {v4, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v5}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 81
    iget v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->s:F

    iget v5, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->I:F

    add-float/2addr v4, v5

    cmpg-float v2, v2, v4

    if-gtz v2, :cond_19

    const/4 v2, 0x3

    goto/16 :goto_b

    :cond_19
    const/4 v2, 0x3

    goto :goto_9

    .line 82
    :cond_1a
    iget v5, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->S:F

    iget v7, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->G:F

    cmpg-float v5, v5, v7

    if-gez v5, :cond_1b

    .line 83
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v4, "face not in rect ratio:"

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->S:F

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v5, 0x0

    invoke-static {v3, v2, v5}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 v2, 0x0

    const/4 v4, 0x4

    goto :goto_a

    :cond_1b
    const/4 v5, 0x0

    .line 84
    iget v7, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->t:F

    cmpg-float v7, v2, v7

    if-gez v7, :cond_1d

    .line 85
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v7, "face too small:"

    invoke-direct {v4, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v5}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 86
    iget v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->t:F

    iget v5, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->J:F

    sub-float/2addr v4, v5

    cmpl-float v2, v2, v4

    if-ltz v2, :cond_1c

    move/from16 v2, v16

    goto/16 :goto_b

    :cond_1c
    move/from16 v2, v16

    goto :goto_9

    :cond_1d
    if-eqz v4, :cond_20

    .line 87
    iget v2, v12, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->pitch:F

    .line 88
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    iget v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->p:I

    int-to-float v4, v4

    cmpl-float v2, v2, v4

    if-gtz v2, :cond_1e

    iget v2, v12, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->yaw:F

    .line 89
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    iget v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->q:I

    int-to-float v4, v4

    cmpl-float v2, v2, v4

    if-gtz v2, :cond_1e

    iget v2, v12, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->roll:F

    .line 90
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    iget v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->r:I

    int-to-float v4, v4

    cmpl-float v2, v2, v4

    if-lez v2, :cond_20

    .line 91
    :cond_1e
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v4, "face pose not right ("

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v4, v12, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->pitch:F

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v4, ","

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v5, v12, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->yaw:F

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v4, v12, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->roll:F

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v4, ")"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v5, 0x0

    invoke-static {v3, v2, v5}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 92
    iget v2, v12, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->pitch:F

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    iget v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->p:I

    int-to-float v4, v4

    iget v5, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->K:F

    add-float/2addr v4, v5

    cmpg-float v2, v2, v4

    if-gtz v2, :cond_1f

    iget v2, v12, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->yaw:F

    .line 93
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    iget v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->q:I

    int-to-float v4, v4

    iget v5, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->K:F

    add-float/2addr v4, v5

    cmpg-float v2, v2, v4

    if-gtz v2, :cond_1f

    iget v2, v12, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->roll:F

    .line 94
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    iget v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->r:I

    int-to-float v4, v4

    iget v5, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->K:F

    add-float/2addr v4, v5

    cmpg-float v2, v2, v4

    if-gtz v2, :cond_1f

    const/4 v2, 0x5

    :goto_b
    move v4, v2

    move/from16 v18, v17

    const/4 v2, 0x0

    goto/16 :goto_f

    :cond_1f
    const/4 v2, 0x0

    const/4 v4, 0x5

    goto/16 :goto_a

    .line 95
    :cond_20
    iget-boolean v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->o:Z

    if-eqz v2, :cond_25

    .line 96
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    move-result-object v2

    invoke-virtual {v2}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getWorkMode()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKKitFrameworkWorkMode;

    move-result-object v2

    sget-object v4, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKKitFrameworkWorkMode;->YT_FW_ACTION_TYPE:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKKitFrameworkWorkMode;

    if-eq v2, v4, :cond_25

    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    move-result-object v2

    invoke-virtual {v2}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getWorkMode()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKKitFrameworkWorkMode;

    move-result-object v2

    sget-object v4, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKKitFrameworkWorkMode;->YT_FW_ACTREFLECT_TYPE:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKKitFrameworkWorkMode;

    if-ne v2, v4, :cond_21

    goto :goto_e

    .line 97
    :cond_21
    iget-object v2, v12, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->faceShape:[F

    invoke-static {v2}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$ProcessHelper;->preCheckCloseEyeScore([F)F

    move-result v2

    .line 98
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "eye score:"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v5, " cnt:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v5, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->u:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 99
    iget v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->n:F

    cmpg-float v2, v2, v4

    if-gez v2, :cond_23

    .line 100
    iget v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->u:I

    add-int/lit8 v2, v2, 0x1

    iput v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->u:I

    .line 101
    iget v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->e:I

    add-int/lit8 v2, v2, -0x1

    iput v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->e:I

    if-gez v2, :cond_22

    const/4 v2, 0x0

    .line 102
    iput v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->e:I

    goto :goto_c

    :cond_22
    const/4 v2, 0x0

    goto :goto_c

    :cond_23
    const/4 v2, 0x0

    .line 103
    iput v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->u:I

    .line 104
    :goto_c
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    move-result-object v4

    invoke-virtual {v4}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getWorkMode()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKKitFrameworkWorkMode;

    move-result-object v4

    sget-object v5, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKKitFrameworkWorkMode;->YT_FW_SILENT_TYPE:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKKitFrameworkWorkMode;

    if-eq v4, v5, :cond_24

    const/16 v5, 0xa

    goto :goto_d

    :cond_24
    const/4 v5, 0x4

    .line 105
    :goto_d
    iget v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->u:I

    if-lt v4, v5, :cond_26

    .line 106
    iput v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->u:I

    move/from16 v18, v2

    const/4 v4, 0x6

    goto :goto_f

    :cond_25
    :goto_e
    const/4 v2, 0x0

    :cond_26
    move v4, v2

    move/from16 v18, v4

    .line 107
    :goto_f
    iput v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->Z:I

    if-eqz v18, :cond_27

    const/16 v12, 0x9

    goto :goto_10

    :cond_27
    move v12, v4

    .line 108
    :goto_10
    aget-object v4, v6, v2

    iget-object v4, v4, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->faceVisible:[F

    iget-object v5, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->U:Lcom/tencent/youtu/sdkkitframework/liveness/o$a;

    invoke-static {v4, v5}, Lcom/tencent/youtu/sdkkitframework/liveness/o;->a([FLcom/tencent/youtu/sdkkitframework/liveness/o$a;)I

    move-result v4

    .line 109
    iget v5, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->V:I

    if-eq v5, v4, :cond_28

    .line 110
    iput v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->X:I

    .line 111
    iput v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->V:I

    goto :goto_11

    .line 112
    :cond_28
    iget v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->X:I

    add-int/lit8 v2, v2, 0x1

    iput v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->X:I

    .line 113
    :goto_11
    iget v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->b0:I

    const/4 v5, 0x7

    if-lt v2, v5, :cond_29

    iget v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->X:I

    if-ge v2, v5, :cond_29

    .line 114
    iget v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->W:I

    move v10, v2

    goto :goto_12

    .line 115
    :cond_29
    iget v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->V:I

    iput v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->W:I

    move v10, v4

    .line 116
    :goto_12
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v4, "advise "

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, "|shelter "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 117
    :goto_13
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    if-eqz v12, :cond_2a

    const/16 v4, 0x9

    if-ne v12, v4, :cond_2b

    :cond_2a
    if-eqz v10, :cond_2c

    .line 118
    :cond_2b
    invoke-virtual {v2, v13, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v4, 0x0

    .line 119
    iput v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->e:I

    goto :goto_14

    .line 120
    :cond_2c
    iget v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->e:I

    add-int/lit8 v4, v4, 0x1

    iput v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->e:I

    .line 121
    :goto_14
    iget v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->f:I

    if-ne v12, v4, :cond_2d

    iget v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->g:I

    if-ne v10, v4, :cond_2d

    .line 122
    iget v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->v:I

    add-int/lit8 v4, v4, 0x1

    iput v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->v:I

    goto :goto_15

    :cond_2d
    const/4 v4, 0x0

    .line 123
    iput v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->v:I

    .line 124
    :goto_15
    iget-boolean v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->F:Z

    if-eqz v4, :cond_2e

    iget v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->v:I

    const/4 v5, 0x3

    if-le v4, v5, :cond_2e

    iget v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->Z:I

    if-ne v4, v12, :cond_2e

    goto/16 :goto_18

    .line 125
    :cond_2e
    iput v12, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->f:I

    .line 126
    iput v10, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->g:I

    .line 127
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, " tips:"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v5, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->Z:I

    invoke-static {v5}, Lcom/tencent/youtu/sdkkitframework/liveness/o;->a(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 128
    iget v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->Z:I

    if-eqz v4, :cond_2f

    const/16 v5, 0x9

    if-ne v4, v5, :cond_30

    :cond_2f
    move/from16 v4, v17

    goto :goto_16

    .line 129
    :cond_30
    invoke-static {v4}, Lcom/tencent/youtu/sdkkitframework/liveness/o;->a(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v11, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_17

    :goto_16
    if-ne v10, v4, :cond_31

    const-string v4, "fl_no_left_face"

    .line 130
    invoke-virtual {v2, v11, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_17

    :cond_31
    move/from16 v4, v16

    if-ne v10, v4, :cond_32

    const-string v4, "fl_no_chin"

    .line 131
    invoke-virtual {v2, v11, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_17

    :cond_32
    const/4 v5, 0x3

    if-ne v10, v5, :cond_33

    const-string v4, "fl_no_mouth"

    .line 132
    invoke-virtual {v2, v11, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_17

    :cond_33
    const/4 v5, 0x4

    if-ne v10, v5, :cond_34

    const-string v4, "fl_no_right_face"

    .line 133
    invoke-virtual {v2, v11, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_17

    :cond_34
    const/4 v4, 0x5

    if-ne v10, v4, :cond_35

    const-string v4, "fl_no_nose"

    .line 134
    invoke-virtual {v2, v11, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_17

    :cond_35
    const/4 v4, 0x6

    if-ne v10, v4, :cond_36

    const-string v4, "fl_no_right_eye"

    .line 135
    invoke-virtual {v2, v11, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_17

    :cond_36
    const/4 v5, 0x7

    if-ne v10, v5, :cond_37

    const-string v4, "fl_no_left_eye"

    .line 136
    invoke-virtual {v2, v11, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_17

    :cond_37
    if-nez v10, :cond_38

    .line 137
    iget v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->v:I

    const/4 v5, 0x2

    if-le v4, v5, :cond_38

    const/4 v5, 0x5

    if-ge v4, v5, :cond_38

    const-string v4, "fl_pose_keep"

    .line 138
    invoke-virtual {v2, v11, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v4, "pass"

    .line 139
    invoke-virtual {v2, v13, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 140
    :cond_38
    :goto_17
    iget-object v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->a0:Ljava/lang/String;

    if-eq v4, v8, :cond_39

    const-string v5, "ui_extra_tips"

    .line 141
    invoke-virtual {v2, v5, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    :cond_39
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    move-result-object v4

    invoke-virtual {v4, v2}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->sendFSMEvent(Ljava/util/HashMap;)V

    .line 143
    :goto_18
    iget-object v2, v1, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->stateData:Ljava/util/HashMap;

    iget v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->f:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const-string v5, "pose_state"

    invoke-virtual {v2, v5, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 144
    iget-object v2, v1, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->stateData:Ljava/util/HashMap;

    iget v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->g:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const-string v5, "shelter_state"

    invoke-virtual {v2, v5, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 145
    iget-object v2, v1, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->stateData:Ljava/util/HashMap;

    const-string v4, "face_status"

    invoke-virtual {v2, v4, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 146
    iget-object v2, v1, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->stateData:Ljava/util/HashMap;

    iget v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->e:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const-string v5, "continuous_detect_count"

    invoke-virtual {v2, v5, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 147
    iget-object v2, v1, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->stateData:Ljava/util/HashMap;

    const-string v4, "last_face_status"

    invoke-virtual {v2, v4, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 148
    iget-object v2, v1, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->stateData:Ljava/util/HashMap;

    const-string v4, "last_frame"

    invoke-virtual {v2, v4, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 149
    iget v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->g:I

    iget v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->f:I

    invoke-static {v6, v2, v4}, Lcom/tencent/youtu/sdkkitframework/liveness/o;->a([Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;II)Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->o(Ljava/lang/String;Ljava/lang/Object;)V

    .line 150
    iget v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->f:I

    const-string v4, "best_image"

    if-eqz v2, :cond_3a

    const/16 v5, 0x9

    if-ne v2, v5, :cond_42

    :cond_3a
    if-eqz v6, :cond_42

    .line 151
    array-length v2, v6

    if-lez v2, :cond_42

    const/16 v18, 0x0

    .line 152
    aget-object v2, v6, v18

    .line 153
    iget-object v5, v2, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->faceShape:[F

    invoke-static {v5}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$ProcessHelper;->calcEyeScore([F)[F

    move-result-object v5

    .line 154
    iget-object v6, v2, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->faceShape:[F

    invoke-static {v6}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$ProcessHelper;->calcMouthScore([F)F

    move-result v6

    .line 155
    aget v7, v5, v18

    const/16 v17, 0x1

    aget v5, v5, v17

    add-float/2addr v7, v5

    move/from16 v12, p3

    move/from16 v5, v18

    .line 156
    :goto_19
    iget-object v8, v2, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->faceVisible:[F

    array-length v9, v8

    if-ge v5, v9, :cond_3b

    .line 157
    aget v8, v8, v5

    add-float/2addr v12, v8

    add-int/lit8 v5, v5, 0x1

    goto :goto_19

    .line 158
    :cond_3b
    iget v5, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->M:I

    iget v8, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->z:I

    if-ge v5, v8, :cond_3c

    .line 159
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "stable count "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->M:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v5, 0x0

    invoke-static {v3, v0, v5}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_1b

    .line 160
    :cond_3c
    iget v5, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->S:F

    float-to-double v8, v5

    iget v10, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->E:F

    float-to-double v10, v10

    const-wide v13, 0x3fa999999999999aL    # 0.05

    sub-double/2addr v10, v13

    cmpl-double v8, v8, v10

    const-string v9, " mouth "

    const-string v10, " inRectThreshold "

    if-ltz v8, :cond_41

    .line 161
    iput v5, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->E:F

    .line 162
    iget-boolean v5, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->O:Z

    const-string v8, " eye "

    if-eqz v5, :cond_3e

    .line 163
    iget v5, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->H:F

    cmpg-float v5, v5, v12

    if-gtz v5, :cond_3d

    .line 164
    iput v12, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->H:F

    goto :goto_1a

    .line 165
    :cond_3d
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "test1 shelter score "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->S:F

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_1b

    .line 166
    :cond_3e
    :goto_1a
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v11, "test2 shelter score "

    invoke-direct {v5, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v12}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v11, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->S:F

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    float-to-double v8, v7

    .line 167
    iget v5, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->A:F

    move-wide/from16 p2, v13

    float-to-double v13, v5

    sub-double v13, v13, p2

    cmpl-double v5, v8, v13

    if-ltz v5, :cond_3f

    iget v5, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->D:F

    const/high16 v8, 0x41700000    # 15.0f

    invoke-static {v5, v8}, Ljava/lang/Math;->max(FF)F

    move-result v5

    cmpg-float v5, v6, v5

    if-gtz v5, :cond_3f

    iget v5, v2, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->yaw:F

    .line 168
    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    iget v8, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->f0:F

    cmpg-float v5, v5, v8

    if-gtz v5, :cond_3f

    iget v5, v2, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->pitch:F

    .line 169
    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    iget v8, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->g0:F

    cmpg-float v5, v5, v8

    if-gtz v5, :cond_3f

    iget v5, v2, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->roll:F

    .line 170
    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    iget v8, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->h0:F

    cmpg-float v5, v5, v8

    if-gtz v5, :cond_3f

    .line 171
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v8, "best shelter score "

    invoke-direct {v5, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v12}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v8, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->S:F

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 172
    iput v7, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->A:F

    .line 173
    iput v6, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->D:F

    .line 174
    iget-object v3, v1, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->stateData:Ljava/util/HashMap;

    invoke-virtual {v3, v4, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 175
    iget-object v3, v1, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->stateData:Ljava/util/HashMap;

    iget-object v5, v2, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->faceShape:[F

    const-string v8, "best_shape"

    invoke-virtual {v3, v8, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 176
    iget-object v3, v1, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->stateData:Ljava/util/HashMap;

    const-string v5, "best_face_status"

    invoke-virtual {v3, v5, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 177
    :cond_3f
    iget v3, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->B:F

    cmpg-float v3, v7, v3

    if-gez v3, :cond_40

    .line 178
    iput v7, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->B:F

    .line 179
    iget-object v3, v1, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->stateData:Ljava/util/HashMap;

    const-string v5, "closeeye_image"

    invoke-virtual {v3, v5, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 180
    iget-object v3, v1, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->stateData:Ljava/util/HashMap;

    iget-object v5, v2, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->faceShape:[F

    const-string v7, "closeeye_shape"

    invoke-virtual {v3, v7, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 181
    iget-object v3, v1, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->stateData:Ljava/util/HashMap;

    const-string v5, "closeeye_face_status"

    invoke-virtual {v3, v5, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 182
    :cond_40
    iget v3, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->C:F

    cmpl-float v3, v6, v3

    if-lez v3, :cond_42

    .line 183
    iput v6, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->C:F

    .line 184
    iget-object v3, v1, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->stateData:Ljava/util/HashMap;

    const-string v5, "openmouth_image"

    invoke-virtual {v3, v5, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 185
    iget-object v0, v1, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->stateData:Ljava/util/HashMap;

    iget-object v3, v2, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->faceShape:[F

    const-string v5, "openmouth_shape"

    invoke-virtual {v0, v5, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 186
    iget-object v0, v1, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->stateData:Ljava/util/HashMap;

    const-string v3, "openmouth_face_status"

    invoke-virtual {v0, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1b

    .line 187
    :cond_41
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "test3 shelter score "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->S:F

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, " ("

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->E:F

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, ") eye "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 188
    :cond_42
    :goto_1b
    iget v0, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->k0:I

    iget v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->j0:I

    if-lt v0, v2, :cond_44

    iget-object v0, v1, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->stateData:Ljava/util/HashMap;

    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_44

    iget-boolean v0, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->m:Z

    if-eqz v0, :cond_43

    if-eqz v0, :cond_44

    iget-boolean v0, v1, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->w:Z

    if-eqz v0, :cond_44

    .line 189
    :cond_43
    invoke-virtual {v1}, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->moveToNextState()V

    :cond_44
    return-void

    :catch_1
    move-exception v0

    const-string v2, "track error "

    .line 190
    invoke-static {v3, v2, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    const-string v2, "msg_facetrack_failed"

    const-string v3, "YTFaceTrack track failed"

    const v4, 0x400004

    .line 191
    invoke-static {v4, v2, v3}, Lcom/tencent/youtu/sdkkitframework/common/CommonUtils;->makeMessageJson(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "failed"

    .line 192
    invoke-virtual {v1, v3, v4, v2}, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->a(Ljava/lang/String;ILjava/lang/String;)V

    .line 193
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    return-void

    :cond_45
    :goto_1c
    const-string v0, "image data is null"

    const/4 v5, 0x0

    .line 194
    invoke-static {v3, v0, v5}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public updateSDKSetting(Lorg/json/JSONObject;)V
    .locals 31

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    const-string v2, "continuous_angle_num_threshold"

    .line 6
    .line 7
    const-string v3, "secondary_roll_threshold"

    .line 8
    .line 9
    const-string v4, "secondary_pitch_threshold"

    .line 10
    .line 11
    const-string v5, "secondary_yaw_threshold"

    .line 12
    .line 13
    const-string v6, "manual_trigger"

    .line 14
    .line 15
    const-string v7, "same_tips_filter"

    .line 16
    .line 17
    const-string v8, "predetect_countdown_ms"

    .line 18
    .line 19
    const-string v9, "timeout_countdown_ms"

    .line 20
    .line 21
    const-string v10, "resource_download_path"

    .line 22
    .line 23
    const-string v11, "resource_online"

    .line 24
    .line 25
    const-string v12, "need_close_timeout"

    .line 26
    .line 27
    const-string v13, "need_check_shelter"

    .line 28
    .line 29
    const-string v14, "in_rect_ratio_threshold"

    .line 30
    .line 31
    const-string v15, "novalid_face_count"

    .line 32
    .line 33
    move-object/from16 v16, v2

    .line 34
    .line 35
    const-string v2, "force_pose_check"

    .line 36
    .line 37
    move-object/from16 v17, v3

    .line 38
    .line 39
    const-string v3, "net_request_timeout_ms"

    .line 40
    .line 41
    move-object/from16 v18, v4

    .line 42
    .line 43
    const-string v4, "stable_frame_num"

    .line 44
    .line 45
    move-object/from16 v19, v5

    .line 46
    .line 47
    const-string v5, "detect_interval"

    .line 48
    .line 49
    move-object/from16 v20, v6

    .line 50
    .line 51
    const-string v6, "need_big_face_mode"

    .line 52
    .line 53
    move-object/from16 v21, v7

    .line 54
    .line 55
    const-string v7, "blur_detect_threshold"

    .line 56
    .line 57
    move-object/from16 v22, v8

    .line 58
    .line 59
    const-string v8, "bigface_ratio_threshold"

    .line 60
    .line 61
    move-object/from16 v23, v9

    .line 62
    .line 63
    const-string v9, "smallface_ratio_threshold"

    .line 64
    .line 65
    move-object/from16 v24, v10

    .line 66
    .line 67
    const-string v10, "roll_threshold"

    .line 68
    .line 69
    move-object/from16 v25, v11

    .line 70
    .line 71
    const-string v11, "yaw_threshold"

    .line 72
    .line 73
    move-object/from16 v26, v12

    .line 74
    .line 75
    const-string v12, "pitch_threshold"

    .line 76
    .line 77
    move-object/from16 v27, v13

    .line 78
    .line 79
    const-string v13, "open_eye_threshold"

    .line 80
    .line 81
    move-object/from16 v28, v14

    .line 82
    .line 83
    const-string v14, "check_eye_open"

    .line 84
    .line 85
    move-object/from16 v29, v15

    .line 86
    .line 87
    const-string v15, "stable_roi_threshold"

    .line 88
    .line 89
    :try_start_0
    invoke-virtual {v1, v14}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 90
    .line 91
    .line 92
    move-result v30

    .line 93
    if-eqz v30, :cond_0

    .line 94
    .line 95
    invoke-virtual {v1, v14}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    .line 96
    .line 97
    .line 98
    move-result v14

    .line 99
    iput-boolean v14, v0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->o:Z

    .line 100
    .line 101
    :cond_0
    invoke-virtual {v1, v13}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 102
    .line 103
    .line 104
    move-result v14

    .line 105
    if-eqz v14, :cond_1

    .line 106
    .line 107
    invoke-virtual {v1, v13}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 108
    .line 109
    .line 110
    move-result-wide v13

    .line 111
    double-to-float v13, v13

    .line 112
    iput v13, v0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->n:F

    .line 113
    .line 114
    :cond_1
    invoke-virtual {v1, v12}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 115
    .line 116
    .line 117
    move-result v13

    .line 118
    if-eqz v13, :cond_2

    .line 119
    .line 120
    invoke-virtual {v1, v12}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 121
    .line 122
    .line 123
    move-result v12

    .line 124
    iput v12, v0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->p:I

    .line 125
    .line 126
    :cond_2
    invoke-virtual {v1, v11}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 127
    .line 128
    .line 129
    move-result v12

    .line 130
    if-eqz v12, :cond_3

    .line 131
    .line 132
    invoke-virtual {v1, v11}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 133
    .line 134
    .line 135
    move-result v11

    .line 136
    iput v11, v0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->q:I

    .line 137
    .line 138
    :cond_3
    invoke-virtual {v1, v10}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 139
    .line 140
    .line 141
    move-result v11

    .line 142
    if-eqz v11, :cond_4

    .line 143
    .line 144
    invoke-virtual {v1, v10}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 145
    .line 146
    .line 147
    move-result v10

    .line 148
    iput v10, v0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->r:I

    .line 149
    .line 150
    :cond_4
    invoke-virtual {v1, v9}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 151
    .line 152
    .line 153
    move-result v10

    .line 154
    if-eqz v10, :cond_5

    .line 155
    .line 156
    invoke-virtual {v1, v9}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 157
    .line 158
    .line 159
    move-result-wide v9

    .line 160
    double-to-float v9, v9

    .line 161
    iput v9, v0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->t:F

    .line 162
    .line 163
    :cond_5
    invoke-virtual {v1, v8}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 164
    .line 165
    .line 166
    move-result v9

    .line 167
    if-eqz v9, :cond_6

    .line 168
    .line 169
    invoke-virtual {v1, v8}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 170
    .line 171
    .line 172
    move-result-wide v8

    .line 173
    double-to-float v8, v8

    .line 174
    iput v8, v0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->s:F

    .line 175
    .line 176
    :cond_6
    invoke-virtual {v1, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 177
    .line 178
    .line 179
    move-result v8

    .line 180
    if-eqz v8, :cond_7

    .line 181
    .line 182
    invoke-virtual {v1, v7}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 183
    .line 184
    .line 185
    :cond_7
    invoke-virtual {v1, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 186
    .line 187
    .line 188
    move-result v7

    .line 189
    if-eqz v7, :cond_8

    .line 190
    .line 191
    invoke-virtual {v1, v6}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    .line 192
    .line 193
    .line 194
    move-result v6

    .line 195
    iput-boolean v6, v0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->x:Z

    .line 196
    .line 197
    :cond_8
    invoke-virtual {v1, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 198
    .line 199
    .line 200
    move-result v6

    .line 201
    if-eqz v6, :cond_9

    .line 202
    .line 203
    invoke-virtual {v1, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 204
    .line 205
    .line 206
    move-result v5

    .line 207
    iput v5, v0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->y:I

    .line 208
    .line 209
    :cond_9
    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 210
    .line 211
    .line 212
    move-result v5

    .line 213
    if-eqz v5, :cond_a

    .line 214
    .line 215
    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 216
    .line 217
    .line 218
    move-result v4

    .line 219
    iput v4, v0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->z:I

    .line 220
    .line 221
    :cond_a
    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 222
    .line 223
    .line 224
    move-result v4

    .line 225
    if-eqz v4, :cond_b

    .line 226
    .line 227
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;

    .line 228
    .line 229
    .line 230
    move-result-object v4

    .line 231
    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 232
    .line 233
    .line 234
    move-result v3

    .line 235
    invoke-virtual {v4, v3}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->setNetworkRequestTimeoutMS(I)V

    .line 236
    .line 237
    .line 238
    :cond_b
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 239
    .line 240
    .line 241
    move-result v3

    .line 242
    if-eqz v3, :cond_c

    .line 243
    .line 244
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    .line 245
    .line 246
    .line 247
    move-result v2

    .line 248
    iput-boolean v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->P:Z

    .line 249
    .line 250
    :cond_c
    move-object/from16 v2, v29

    .line 251
    .line 252
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 253
    .line 254
    .line 255
    move-result v3

    .line 256
    if-eqz v3, :cond_d

    .line 257
    .line 258
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 259
    .line 260
    .line 261
    move-result v2

    .line 262
    iput v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->R:I

    .line 263
    .line 264
    :cond_d
    move-object/from16 v2, v28

    .line 265
    .line 266
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 267
    .line 268
    .line 269
    move-result v3

    .line 270
    if-eqz v3, :cond_e

    .line 271
    .line 272
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 273
    .line 274
    .line 275
    move-result-wide v2

    .line 276
    double-to-float v2, v2

    .line 277
    iput v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->G:F

    .line 278
    .line 279
    :cond_e
    move-object/from16 v2, v27

    .line 280
    .line 281
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 282
    .line 283
    .line 284
    move-result v3

    .line 285
    if-eqz v3, :cond_f

    .line 286
    .line 287
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    .line 288
    .line 289
    .line 290
    move-result v2

    .line 291
    iput-boolean v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->O:Z

    .line 292
    .line 293
    :cond_f
    invoke-virtual {v1, v15}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 294
    .line 295
    .line 296
    move-result v2

    .line 297
    if-eqz v2, :cond_10

    .line 298
    .line 299
    invoke-virtual {v1, v15}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 300
    .line 301
    .line 302
    move-result-wide v2

    .line 303
    double-to-float v2, v2

    .line 304
    iput v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->L:F

    .line 305
    .line 306
    :cond_10
    move-object/from16 v2, v26

    .line 307
    .line 308
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 309
    .line 310
    .line 311
    move-result v3

    .line 312
    if-eqz v3, :cond_11

    .line 313
    .line 314
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    .line 315
    .line 316
    .line 317
    move-result v2

    .line 318
    iput-boolean v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->d0:Z

    .line 319
    .line 320
    :cond_11
    move-object/from16 v2, v25

    .line 321
    .line 322
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 323
    .line 324
    .line 325
    move-result v3

    .line 326
    if-eqz v3, :cond_12

    .line 327
    .line 328
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    .line 329
    .line 330
    .line 331
    move-result v2

    .line 332
    iput-boolean v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->h:Z

    .line 333
    .line 334
    :cond_12
    move-object/from16 v2, v24

    .line 335
    .line 336
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 337
    .line 338
    .line 339
    move-result v3

    .line 340
    if-eqz v3, :cond_13

    .line 341
    .line 342
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 343
    .line 344
    .line 345
    move-result-object v2

    .line 346
    iput-object v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->i:Ljava/lang/String;

    .line 347
    .line 348
    :cond_13
    move-object/from16 v2, v23

    .line 349
    .line 350
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 351
    .line 352
    .line 353
    move-result v3

    .line 354
    const/4 v4, 0x1

    .line 355
    const/4 v5, 0x0

    .line 356
    if-eqz v3, :cond_14

    .line 357
    .line 358
    iget-object v3, v0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->k:Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;

    .line 359
    .line 360
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 361
    .line 362
    .line 363
    move-result v2

    .line 364
    const/16 v6, 0x7530

    .line 365
    .line 366
    invoke-static {v6, v2}, Ljava/lang/Math;->min(II)I

    .line 367
    .line 368
    .line 369
    move-result v2

    .line 370
    invoke-static {v5, v2}, Ljava/lang/Math;->max(II)I

    .line 371
    .line 372
    .line 373
    move-result v2

    .line 374
    int-to-long v6, v2

    .line 375
    invoke-virtual {v3, v6, v7, v4}, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;->init(JZ)V

    .line 376
    .line 377
    .line 378
    :cond_14
    move-object/from16 v2, v22

    .line 379
    .line 380
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 381
    .line 382
    .line 383
    move-result v3
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 384
    iget-object v6, v0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->l:Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;

    .line 385
    .line 386
    if-eqz v3, :cond_15

    .line 387
    .line 388
    :try_start_1
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 389
    .line 390
    .line 391
    move-result v2

    .line 392
    int-to-long v2, v2

    .line 393
    invoke-virtual {v6, v2, v3, v4}, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;->init(JZ)V

    .line 394
    .line 395
    .line 396
    :goto_0
    move-object/from16 v2, v21

    .line 397
    .line 398
    goto :goto_1

    .line 399
    :cond_15
    const-wide/16 v2, 0x61a8

    .line 400
    .line 401
    invoke-virtual {v6, v2, v3, v4}, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;->init(JZ)V

    .line 402
    .line 403
    .line 404
    goto :goto_0

    .line 405
    :goto_1
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 406
    .line 407
    .line 408
    move-result v3

    .line 409
    if-eqz v3, :cond_16

    .line 410
    .line 411
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    .line 412
    .line 413
    .line 414
    move-result v2

    .line 415
    iput-boolean v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->F:Z

    .line 416
    .line 417
    :cond_16
    move-object/from16 v2, v20

    .line 418
    .line 419
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 420
    .line 421
    .line 422
    move-result v3

    .line 423
    if-eqz v3, :cond_17

    .line 424
    .line 425
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    .line 426
    .line 427
    .line 428
    move-result v2

    .line 429
    iput-boolean v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->m:Z

    .line 430
    .line 431
    :cond_17
    move-object/from16 v2, v19

    .line 432
    .line 433
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 434
    .line 435
    .line 436
    move-result v3

    .line 437
    if-eqz v3, :cond_18

    .line 438
    .line 439
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 440
    .line 441
    .line 442
    move-result-wide v2

    .line 443
    double-to-float v2, v2

    .line 444
    iput v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->f0:F

    .line 445
    .line 446
    :cond_18
    move-object/from16 v2, v18

    .line 447
    .line 448
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 449
    .line 450
    .line 451
    move-result v3

    .line 452
    if-eqz v3, :cond_19

    .line 453
    .line 454
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 455
    .line 456
    .line 457
    move-result-wide v2

    .line 458
    double-to-float v2, v2

    .line 459
    iput v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->g0:F

    .line 460
    .line 461
    :cond_19
    move-object/from16 v2, v17

    .line 462
    .line 463
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 464
    .line 465
    .line 466
    move-result v3

    .line 467
    if-eqz v3, :cond_1a

    .line 468
    .line 469
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 470
    .line 471
    .line 472
    move-result-wide v2

    .line 473
    double-to-float v2, v2

    .line 474
    iput v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->h0:F

    .line 475
    .line 476
    :cond_1a
    move-object/from16 v2, v16

    .line 477
    .line 478
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 479
    .line 480
    .line 481
    move-result v3

    .line 482
    if-eqz v3, :cond_1b

    .line 483
    .line 484
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 485
    .line 486
    .line 487
    move-result v2

    .line 488
    iput v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->j0:I

    .line 489
    .line 490
    :cond_1b
    const-string v2, "need_local_face_best_image"

    .line 491
    .line 492
    invoke-virtual {v1, v2, v5}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    .line 493
    .line 494
    .line 495
    move-result v2

    .line 496
    const-string v3, "relaxed_shelter_threshold"

    .line 497
    .line 498
    invoke-virtual {v1, v3, v5}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    .line 499
    .line 500
    .line 501
    move-result v3

    .line 502
    const-string v6, "shelter_judge_level"

    .line 503
    .line 504
    invoke-virtual {v1, v6, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 505
    .line 506
    .line 507
    move-result v6

    .line 508
    if-nez v2, :cond_1c

    .line 509
    .line 510
    if-eqz v3, :cond_1d

    .line 511
    .line 512
    :cond_1c
    if-gt v6, v4, :cond_1d

    .line 513
    .line 514
    const/16 v6, 0xa

    .line 515
    .line 516
    :cond_1d
    new-instance v2, Lcom/tencent/youtu/sdkkitframework/liveness/o$a;

    .line 517
    .line 518
    invoke-direct {v2, v6}, Lcom/tencent/youtu/sdkkitframework/liveness/o$a;-><init>(I)V

    .line 519
    .line 520
    .line 521
    iput-object v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->U:Lcom/tencent/youtu/sdkkitframework/liveness/o$a;

    .line 522
    .line 523
    const-string v2, "model_config_ini_name"

    .line 524
    .line 525
    const-string v3, "yt_model_config.ini"

    .line 526
    .line 527
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 528
    .line 529
    .line 530
    move-result-object v2

    .line 531
    iput-object v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->e0:Ljava/lang/String;

    .line 532
    .line 533
    const-string v2, "need_check_multiface"

    .line 534
    .line 535
    invoke-virtual {v1, v2, v5}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    .line 536
    .line 537
    .line 538
    move-result v2

    .line 539
    iput-boolean v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->c0:Z

    .line 540
    .line 541
    const-string v2, "bigface_ratio_buffer"

    .line 542
    .line 543
    const-wide v3, 0x3fa99999a0000000L    # 0.05000000074505806

    .line 544
    .line 545
    .line 546
    .line 547
    .line 548
    invoke-virtual {v1, v2, v3, v4}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;D)D

    .line 549
    .line 550
    .line 551
    move-result-wide v5

    .line 552
    double-to-float v2, v5

    .line 553
    iput v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->I:F

    .line 554
    .line 555
    const-string v2, "smallface_ratio_buffer"

    .line 556
    .line 557
    invoke-virtual {v1, v2, v3, v4}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;D)D

    .line 558
    .line 559
    .line 560
    move-result-wide v5

    .line 561
    double-to-float v2, v5

    .line 562
    iput v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->J:F

    .line 563
    .line 564
    const-string v2, "pose_ratio_buffer"

    .line 565
    .line 566
    invoke-virtual {v1, v2, v3, v4}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;D)D

    .line 567
    .line 568
    .line 569
    move-result-wide v2

    .line 570
    double-to-float v2, v2

    .line 571
    iput v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->K:F

    .line 572
    .line 573
    const-wide v2, 0x3fecccccc0000000L    # 0.8999999761581421

    .line 574
    .line 575
    .line 576
    .line 577
    .line 578
    invoke-virtual {v1, v15, v2, v3}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;D)D

    .line 579
    .line 580
    .line 581
    move-result-wide v1

    .line 582
    double-to-float v1, v1

    .line 583
    iput v1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/SilentLivenessState;->L:F
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 584
    .line 585
    return-void

    .line 586
    :catch_0
    move-exception v0

    .line 587
    const-string v1, "SilentLivenessState"

    .line 588
    .line 589
    const-string v2, "Failed to parse json:"

    .line 590
    .line 591
    invoke-static {v1, v2, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 592
    .line 593
    .line 594
    return-void
.end method
