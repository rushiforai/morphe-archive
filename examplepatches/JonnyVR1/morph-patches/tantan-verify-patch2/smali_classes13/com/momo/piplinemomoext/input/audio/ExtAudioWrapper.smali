.class public Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;
.super Ll/jc00;
.source "SourceFile"

# interfaces
.implements Ll/fb1;
.implements Lcom/momo/piplinemomoext/input/audio/a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$i;,
        Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$HeadsetPlugReceiver;,
        Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$BlueConnectStateBroadcastReceiver;
    }
.end annotation


# instance fields
.field private A:Z

.field private B:Z

.field private C:I

.field private D:Z

.field private E:I

.field private F:I

.field private G:Z

.field private H:I

.field private I:Z

.field private J:Z

.field private K:I

.field private L:Ll/s5r;

.field private M:Lcom/immomo/mediacore/audio/VadDetector;

.field private N:Ljava/lang/Object;

.field private O:Ljava/lang/String;

.field private P:Z

.field private Q:Ll/xb1;

.field R:Ltv/danmaku/ijk/media/player/IMediaPlayer$OnPreparedListener;

.field private S:Ltv/danmaku/ijk/media/player/IMediaPlayer$OnCompletionListener;

.field private T:Ltv/danmaku/ijk/media/player/IMediaPlayer$OnErrorListener;

.field private U:Ltv/danmaku/ijk/media/player/IMediaPlayer$OnBufferingUpdateListener;

.field private V:Ltv/danmaku/ijk/media/player/IMediaPlayer$OnInfoListener;

.field private W:Ltv/danmaku/ijk/media/player/IMediaPlayer$OnSeekCompleteListener;

.field private X:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateCallback;

.field private Y:Z

.field private Z:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateCallback;

.field private k0:I

.field private l:Ljava/lang/String;

.field m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

.field private n:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field private o:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$HeadsetPlugReceiver;

.field private p:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$BlueConnectStateBroadcastReceiver;

.field private p0:Ll/yb1;

.field q:Landroid/content/IntentFilter;

.field private r:I

.field private s:J

.field private t:Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;

.field protected u:Ll/gb1;

.field private v:Z

.field private w:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$i;

.field private x:Ll/kb1;

.field private y:F

.field private z:[B


# direct methods
.method public constructor <init>(IILandroid/content/Context;Z)V
    .locals 2

    .line 1
    const/16 v0, 0x800

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {p0, v0, p1, p2, v1}, Ll/jc00;-><init>(IIIZ)V

    .line 5
    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 9
    .line 10
    iput-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->o:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$HeadsetPlugReceiver;

    .line 11
    .line 12
    iput-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->p:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$BlueConnectStateBroadcastReceiver;

    .line 13
    .line 14
    iput-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->q:Landroid/content/IntentFilter;

    .line 15
    .line 16
    const/4 p2, 0x0

    .line 17
    iput p2, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->r:I

    .line 18
    .line 19
    iput-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->t:Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;

    .line 20
    .line 21
    iput-boolean p2, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->v:Z

    .line 22
    .line 23
    const/high16 v0, 0x3f800000    # 1.0f

    .line 24
    .line 25
    iput v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->y:F

    .line 26
    .line 27
    iput-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->z:[B

    .line 28
    .line 29
    iput-boolean p2, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->A:Z

    .line 30
    .line 31
    iput-boolean p2, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->B:Z

    .line 32
    .line 33
    iput p2, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->C:I

    .line 34
    .line 35
    iput-boolean p2, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->D:Z

    .line 36
    .line 37
    iput p2, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->E:I

    .line 38
    .line 39
    iput p2, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->F:I

    .line 40
    .line 41
    iput-boolean p2, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->G:Z

    .line 42
    .line 43
    iput p2, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->H:I

    .line 44
    .line 45
    iput-boolean p2, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->I:Z

    .line 46
    .line 47
    iput-boolean p2, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->J:Z

    .line 48
    .line 49
    iput p2, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->K:I

    .line 50
    .line 51
    iput-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->L:Ll/s5r;

    .line 52
    .line 53
    iput-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->M:Lcom/immomo/mediacore/audio/VadDetector;

    .line 54
    .line 55
    new-instance v0, Ljava/lang/Object;

    .line 56
    .line 57
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 58
    .line 59
    .line 60
    iput-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->N:Ljava/lang/Object;

    .line 61
    .line 62
    const-string v0, "Momo"

    .line 63
    .line 64
    iput-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->O:Ljava/lang/String;

    .line 65
    .line 66
    iput-boolean p2, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->P:Z

    .line 67
    .line 68
    iput-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->Q:Ll/xb1;

    .line 69
    .line 70
    new-instance v0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$a;

    .line 71
    .line 72
    invoke-direct {v0, p0}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$a;-><init>(Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;)V

    .line 73
    .line 74
    .line 75
    iput-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->R:Ltv/danmaku/ijk/media/player/IMediaPlayer$OnPreparedListener;

    .line 76
    .line 77
    new-instance v0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$b;

    .line 78
    .line 79
    invoke-direct {v0, p0}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$b;-><init>(Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;)V

    .line 80
    .line 81
    .line 82
    iput-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->S:Ltv/danmaku/ijk/media/player/IMediaPlayer$OnCompletionListener;

    .line 83
    .line 84
    new-instance v0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$c;

    .line 85
    .line 86
    invoke-direct {v0, p0}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$c;-><init>(Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;)V

    .line 87
    .line 88
    .line 89
    iput-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->T:Ltv/danmaku/ijk/media/player/IMediaPlayer$OnErrorListener;

    .line 90
    .line 91
    new-instance v0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$d;

    .line 92
    .line 93
    invoke-direct {v0, p0}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$d;-><init>(Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;)V

    .line 94
    .line 95
    .line 96
    iput-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->U:Ltv/danmaku/ijk/media/player/IMediaPlayer$OnBufferingUpdateListener;

    .line 97
    .line 98
    new-instance v0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$e;

    .line 99
    .line 100
    invoke-direct {v0, p0}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$e;-><init>(Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;)V

    .line 101
    .line 102
    .line 103
    iput-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->V:Ltv/danmaku/ijk/media/player/IMediaPlayer$OnInfoListener;

    .line 104
    .line 105
    new-instance v0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$f;

    .line 106
    .line 107
    invoke-direct {v0, p0}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$f;-><init>(Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;)V

    .line 108
    .line 109
    .line 110
    iput-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->W:Ltv/danmaku/ijk/media/player/IMediaPlayer$OnSeekCompleteListener;

    .line 111
    .line 112
    new-instance v0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$g;

    .line 113
    .line 114
    invoke-direct {v0, p0}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$g;-><init>(Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;)V

    .line 115
    .line 116
    .line 117
    iput-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->X:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateCallback;

    .line 118
    .line 119
    iput-boolean p2, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->Y:Z

    .line 120
    .line 121
    new-instance v0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$h;

    .line 122
    .line 123
    invoke-direct {v0, p0}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$h;-><init>(Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;)V

    .line 124
    .line 125
    .line 126
    iput-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->Z:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateCallback;

    .line 127
    .line 128
    iput p2, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->k0:I

    .line 129
    .line 130
    iput-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->p0:Ll/yb1;

    .line 131
    .line 132
    new-instance p1, Ljava/lang/ref/WeakReference;

    .line 133
    .line 134
    invoke-direct {p1, p3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 135
    .line 136
    .line 137
    iput-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->n:Ljava/lang/ref/WeakReference;

    .line 138
    .line 139
    invoke-virtual {p0}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->L2()V

    .line 140
    .line 141
    .line 142
    invoke-virtual {p0, p4}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->z1(Z)V

    .line 143
    .line 144
    .line 145
    return-void
.end method

.method private A2()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-boolean v1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->Y:Z

    .line 6
    .line 7
    const v2, 0x3e3851ec    # 0.18f

    .line 8
    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    iget-boolean v1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->v:Z

    .line 13
    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    iget p0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->y:F

    .line 17
    .line 18
    mul-float v1, p0, v2

    .line 19
    .line 20
    mul-float/2addr p0, v2

    .line 21
    invoke-virtual {v0, v1, p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setVolume(FF)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    iget p0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->y:F

    .line 26
    .line 27
    mul-float v1, p0, v2

    .line 28
    .line 29
    mul-float/2addr p0, v2

    .line 30
    invoke-virtual {v0, v1, p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setVolume(FF)V

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void
.end method

.method private E2()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->B2()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "audio"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Landroid/media/AudioManager;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/media/AudioManager;->isWiredHeadsetOn()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method private F2(Ljava/lang/String;)Z
    .locals 7

    .line 1
    const-string v0, "Mediaplayer Unable to open content: "

    .line 2
    .line 3
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    new-instance v2, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v3, "ExtAudioWrapper startSurroundMusic: "

    .line 10
    .line 11
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    const-string v3, "ExtAudioWrapper"

    .line 22
    .line 23
    invoke-virtual {v1, v3, v2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iput-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->l:Ljava/lang/String;

    .line 27
    .line 28
    iget-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 29
    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    invoke-virtual {p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->stop()V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 36
    .line 37
    invoke-virtual {p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->release()V

    .line 38
    .line 39
    .line 40
    const/4 p1, 0x0

    .line 41
    iput-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 42
    .line 43
    :cond_0
    iget-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->l:Ljava/lang/String;

    .line 44
    .line 45
    const/4 v1, 0x1

    .line 46
    if-eqz p1, :cond_4

    .line 47
    .line 48
    :try_start_0
    new-instance p1, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->B2()Landroid/content/Context;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-direct {p1, v2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;-><init>(Landroid/content/Context;)V

    .line 55
    .line 56
    .line 57
    iput-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 58
    .line 59
    iget-object v2, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->R:Ltv/danmaku/ijk/media/player/IMediaPlayer$OnPreparedListener;

    .line 60
    .line 61
    invoke-virtual {p1, v2}, Ltv/danmaku/ijk/media/player/SimpleMediaPlayer;->setOnPreparedListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnPreparedListener;)V

    .line 62
    .line 63
    .line 64
    iget-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 65
    .line 66
    iget-object v2, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->S:Ltv/danmaku/ijk/media/player/IMediaPlayer$OnCompletionListener;

    .line 67
    .line 68
    invoke-virtual {p1, v2}, Ltv/danmaku/ijk/media/player/SimpleMediaPlayer;->setOnCompletionListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnCompletionListener;)V

    .line 69
    .line 70
    .line 71
    iget-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 72
    .line 73
    iget-object v2, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->T:Ltv/danmaku/ijk/media/player/IMediaPlayer$OnErrorListener;

    .line 74
    .line 75
    invoke-virtual {p1, v2}, Ltv/danmaku/ijk/media/player/SimpleMediaPlayer;->setOnErrorListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnErrorListener;)V

    .line 76
    .line 77
    .line 78
    iget-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 79
    .line 80
    iget-object v2, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->U:Ltv/danmaku/ijk/media/player/IMediaPlayer$OnBufferingUpdateListener;

    .line 81
    .line 82
    invoke-virtual {p1, v2}, Ltv/danmaku/ijk/media/player/SimpleMediaPlayer;->setOnBufferingUpdateListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnBufferingUpdateListener;)V

    .line 83
    .line 84
    .line 85
    iget-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 86
    .line 87
    iget-object v2, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->V:Ltv/danmaku/ijk/media/player/IMediaPlayer$OnInfoListener;

    .line 88
    .line 89
    invoke-virtual {p1, v2}, Ltv/danmaku/ijk/media/player/SimpleMediaPlayer;->setOnInfoListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnInfoListener;)V

    .line 90
    .line 91
    .line 92
    iget-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 93
    .line 94
    iget-object v2, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->W:Ltv/danmaku/ijk/media/player/IMediaPlayer$OnSeekCompleteListener;

    .line 95
    .line 96
    invoke-virtual {p1, v2}, Ltv/danmaku/ijk/media/player/SimpleMediaPlayer;->setOnSeekCompleteListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnSeekCompleteListener;)V

    .line 97
    .line 98
    .line 99
    iget-boolean p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->Y:Z

    .line 100
    .line 101
    if-eqz p1, :cond_1

    .line 102
    .line 103
    iget-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 104
    .line 105
    iget-object v2, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->X:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateCallback;

    .line 106
    .line 107
    invoke-virtual {p1, v2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setMediaDataCallback(Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateCallback;)V

    .line 108
    .line 109
    .line 110
    :cond_1
    iget-boolean p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->P:Z

    .line 111
    .line 112
    if-eqz p1, :cond_2

    .line 113
    .line 114
    iget-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 115
    .line 116
    iget-object v2, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->Z:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateCallback;

    .line 117
    .line 118
    invoke-virtual {p1, v2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setMediaDataCallback(Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateCallback;)V

    .line 119
    .line 120
    .line 121
    :cond_2
    iget-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 122
    .line 123
    iget-object v2, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->l:Ljava/lang/String;

    .line 124
    .line 125
    invoke-virtual {v2}, Ljava/lang/String;->toString()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v2

    .line 129
    invoke-virtual {p1, v2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setDataSource(Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    iget-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 133
    .line 134
    invoke-virtual {p1, v1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setMediaDateCallbackFlags(I)V

    .line 135
    .line 136
    .line 137
    iget-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 138
    .line 139
    const/16 v2, 0x4e38

    .line 140
    .line 141
    const-wide/32 v4, 0xac44

    .line 142
    .line 143
    .line 144
    invoke-virtual {p1, v2, v4, v5}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setPropertyLong(IJ)V

    .line 145
    .line 146
    .line 147
    iget p1, p0, Ll/jc00;->f:I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 148
    .line 149
    iget-object v2, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 150
    .line 151
    const/16 v4, 0x4e36

    .line 152
    .line 153
    const/4 v5, 0x2

    .line 154
    if-ne p1, v5, :cond_3

    .line 155
    .line 156
    int-to-long v5, p1

    .line 157
    :try_start_1
    invoke-virtual {v2, v4, v5, v6}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setPropertyLong(IJ)V

    .line 158
    .line 159
    .line 160
    iget-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 161
    .line 162
    const/16 v2, 0x4e37

    .line 163
    .line 164
    const-wide/16 v4, 0x3

    .line 165
    .line 166
    invoke-virtual {p1, v2, v4, v5}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setPropertyLong(IJ)V

    .line 167
    .line 168
    .line 169
    goto :goto_0

    .line 170
    :cond_3
    const-wide/16 v5, 0x1

    .line 171
    .line 172
    invoke-virtual {v2, v4, v5, v6}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setPropertyLong(IJ)V

    .line 173
    .line 174
    .line 175
    :goto_0
    iget-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 176
    .line 177
    invoke-virtual {p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->prepareAsync()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0

    .line 178
    .line 179
    .line 180
    goto :goto_1

    .line 181
    :catch_0
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 182
    .line 183
    .line 184
    move-result-object p1

    .line 185
    new-instance v2, Ljava/lang/StringBuilder;

    .line 186
    .line 187
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 188
    .line 189
    .line 190
    iget-object p0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->l:Ljava/lang/String;

    .line 191
    .line 192
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 193
    .line 194
    .line 195
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object p0

    .line 199
    invoke-virtual {p1, v3, p0}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 200
    .line 201
    .line 202
    goto :goto_1

    .line 203
    :catch_1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 204
    .line 205
    .line 206
    move-result-object p1

    .line 207
    new-instance v2, Ljava/lang/StringBuilder;

    .line 208
    .line 209
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 210
    .line 211
    .line 212
    iget-object p0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->l:Ljava/lang/String;

    .line 213
    .line 214
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 215
    .line 216
    .line 217
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object p0

    .line 221
    invoke-virtual {p1, v3, p0}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 222
    .line 223
    .line 224
    :cond_4
    :goto_1
    return v1
.end method

.method private M2()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->w:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$i;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    invoke-interface {v0}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$i;->getStreamerType()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x3

    .line 11
    if-eqz v0, :cond_4

    .line 12
    .line 13
    invoke-direct {p0}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->E2()Z

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-eqz v2, :cond_1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    const/4 v2, 0x2

    .line 21
    const/4 v3, 0x0

    .line 22
    if-ne v0, v2, :cond_2

    .line 23
    .line 24
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Ll/csx;->D()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_3

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_2
    if-ne v0, v1, :cond_3

    .line 36
    .line 37
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0}, Ll/csx;->J()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_3

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_3
    move v1, v3

    .line 49
    :cond_4
    :goto_0
    iget-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->L:Ll/s5r;

    .line 50
    .line 51
    if-eqz v0, :cond_5

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Ll/s5r;->U(I)V

    .line 54
    .line 55
    .line 56
    :cond_5
    iget-object p0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->Q:Ll/xb1;

    .line 57
    .line 58
    if-eqz p0, :cond_6

    .line 59
    .line 60
    invoke-virtual {p0, v1}, Ll/xb1;->t(I)V

    .line 61
    .line 62
    .line 63
    :cond_6
    :goto_1
    return-void
.end method

.method public static synthetic s2(Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->r:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic t2(Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->s:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic u2(Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->A2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic v2(Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;)Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$i;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->w:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$i;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic w2(Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->Y:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic x2(Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->Y:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic y2(Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;)Ll/hb1;
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

.method public static synthetic z2(Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;)Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateCallback;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->X:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateCallback;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public B2()Landroid/content/Context;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->n:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object p0, Ll/l26;->a:Landroid/content/Context;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    sget-object p0, Ll/l26;->a:Landroid/content/Context;

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_1
    iget-object p0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->n:Ljava/lang/ref/WeakReference;

    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Landroid/content/Context;

    .line 24
    .line 25
    return-object p0
.end method

.method public C(Ll/oxd0;)Ll/oxd0;
    .locals 8

    .line 1
    invoke-virtual {p1}, Ll/oxd0;->a()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_5

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Ll/jc00;->h:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 10
    .line 11
    const/4 v1, 0x2

    .line 12
    const/4 v2, 0x1

    .line 13
    if-eqz v0, :cond_5

    .line 14
    .line 15
    iget-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->O:Ljava/lang/String;

    .line 16
    .line 17
    const-string v3, "Momo"

    .line 18
    .line 19
    invoke-static {v0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_3

    .line 24
    .line 25
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Ll/csx;->w0()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-ne v0, v2, :cond_3

    .line 34
    .line 35
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0}, Ll/csx;->x0()I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_3

    .line 44
    .line 45
    iget-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->M:Lcom/immomo/mediacore/audio/VadDetector;

    .line 46
    .line 47
    if-nez v0, :cond_1

    .line 48
    .line 49
    new-instance v0, Lcom/immomo/mediacore/audio/VadDetector;

    .line 50
    .line 51
    invoke-direct {v0}, Lcom/immomo/mediacore/audio/VadDetector;-><init>()V

    .line 52
    .line 53
    .line 54
    iput-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->M:Lcom/immomo/mediacore/audio/VadDetector;

    .line 55
    .line 56
    const v3, 0xbb80

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0, v3}, Lcom/immomo/mediacore/audio/VadDetector;->initVadDector(I)V

    .line 60
    .line 61
    .line 62
    :cond_1
    iget-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->N:Ljava/lang/Object;

    .line 63
    .line 64
    monitor-enter v0

    .line 65
    :try_start_0
    iget-object v3, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->M:Lcom/immomo/mediacore/audio/VadDetector;

    .line 66
    .line 67
    if-eqz v3, :cond_2

    .line 68
    .line 69
    invoke-virtual {p1}, Ll/oxd0;->c()[B

    .line 70
    .line 71
    .line 72
    move-result-object v4

    .line 73
    invoke-virtual {p1}, Ll/oxd0;->e()I

    .line 74
    .line 75
    .line 76
    move-result v5

    .line 77
    iget v6, p0, Ll/jc00;->f:I

    .line 78
    .line 79
    const v7, 0xac44

    .line 80
    .line 81
    .line 82
    invoke-virtual {v3, v4, v5, v6, v7}, Lcom/immomo/mediacore/audio/VadDetector;->vadDetect([BIII)I

    .line 83
    .line 84
    .line 85
    move-result v3

    .line 86
    iget-object v4, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->M:Lcom/immomo/mediacore/audio/VadDetector;

    .line 87
    .line 88
    invoke-virtual {v4, v3}, Lcom/immomo/mediacore/audio/VadDetector;->adjustSabinLevel(I)Z

    .line 89
    .line 90
    .line 91
    move-result v3

    .line 92
    if-eqz v3, :cond_2

    .line 93
    .line 94
    iget-object v3, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->M:Lcom/immomo/mediacore/audio/VadDetector;

    .line 95
    .line 96
    invoke-virtual {v3}, Lcom/immomo/mediacore/audio/VadDetector;->getDenoiseLevel()I

    .line 97
    .line 98
    .line 99
    move-result v3

    .line 100
    iget-object v4, p0, Ll/jc00;->h:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 101
    .line 102
    invoke-virtual {v4, v3}, Lcom/immomo/mediacore/audio/AudioProcess;->setSabindenoiseLevel(I)V

    .line 103
    .line 104
    .line 105
    goto :goto_0

    .line 106
    :catchall_0
    move-exception p0

    .line 107
    goto :goto_1

    .line 108
    :cond_2
    :goto_0
    monitor-exit v0

    .line 109
    goto :goto_2

    .line 110
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 111
    throw p0

    .line 112
    :cond_3
    :goto_2
    iget v0, p0, Ll/jc00;->f:I

    .line 113
    .line 114
    if-ne v0, v2, :cond_4

    .line 115
    .line 116
    iget-object v0, p0, Ll/jc00;->h:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 117
    .line 118
    invoke-virtual {p1}, Ll/oxd0;->c()[B

    .line 119
    .line 120
    .line 121
    move-result-object v3

    .line 122
    invoke-virtual {p1}, Ll/oxd0;->e()I

    .line 123
    .line 124
    .line 125
    move-result v4

    .line 126
    invoke-virtual {v0, v3, v4}, Lcom/immomo/mediacore/audio/AudioProcess;->processAudioData([BI)[B

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    goto :goto_3

    .line 131
    :cond_4
    if-ne v0, v1, :cond_5

    .line 132
    .line 133
    iget-object v0, p0, Ll/jc00;->h:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 134
    .line 135
    invoke-virtual {p1}, Ll/oxd0;->c()[B

    .line 136
    .line 137
    .line 138
    move-result-object v3

    .line 139
    invoke-virtual {p1}, Ll/oxd0;->e()I

    .line 140
    .line 141
    .line 142
    move-result v4

    .line 143
    invoke-virtual {v0, v3, v4}, Lcom/immomo/mediacore/audio/AudioProcess;->processStereoAudioData([BI)[B

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    goto :goto_3

    .line 148
    :cond_5
    const/4 v0, 0x0

    .line 149
    :goto_3
    iget-boolean v3, p0, Ll/jc00;->k:Z

    .line 150
    .line 151
    if-nez v3, :cond_9

    .line 152
    .line 153
    iget-boolean v3, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->Y:Z

    .line 154
    .line 155
    if-eqz v3, :cond_9

    .line 156
    .line 157
    iget-boolean v3, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->v:Z

    .line 158
    .line 159
    if-eqz v3, :cond_9

    .line 160
    .line 161
    iget-object v3, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->x:Ll/kb1;

    .line 162
    .line 163
    if-eqz v3, :cond_9

    .line 164
    .line 165
    iget v4, p0, Ll/jc00;->f:I

    .line 166
    .line 167
    if-ne v4, v2, :cond_7

    .line 168
    .line 169
    invoke-virtual {v3}, Ll/kb1;->b()I

    .line 170
    .line 171
    .line 172
    move-result v3

    .line 173
    if-ne v3, v1, :cond_7

    .line 174
    .line 175
    if-eqz v0, :cond_6

    .line 176
    .line 177
    array-length v1, v0

    .line 178
    invoke-static {v0, v1}, Ll/jc00;->o2([BI)[B

    .line 179
    .line 180
    .line 181
    move-result-object v1

    .line 182
    goto :goto_4

    .line 183
    :cond_6
    invoke-virtual {p1}, Ll/oxd0;->c()[B

    .line 184
    .line 185
    .line 186
    move-result-object v1

    .line 187
    invoke-virtual {p1}, Ll/oxd0;->e()I

    .line 188
    .line 189
    .line 190
    move-result v3

    .line 191
    invoke-static {v1, v3}, Ll/jc00;->o2([BI)[B

    .line 192
    .line 193
    .line 194
    move-result-object v1

    .line 195
    goto :goto_4

    .line 196
    :cond_7
    if-eqz v0, :cond_8

    .line 197
    .line 198
    move-object v1, v0

    .line 199
    goto :goto_4

    .line 200
    :cond_8
    invoke-virtual {p1}, Ll/oxd0;->c()[B

    .line 201
    .line 202
    .line 203
    move-result-object v1

    .line 204
    :goto_4
    iget-object v3, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->x:Ll/kb1;

    .line 205
    .line 206
    array-length v4, v1

    .line 207
    invoke-virtual {v3, v1, v4}, Ll/kb1;->c([BI)V

    .line 208
    .line 209
    .line 210
    :cond_9
    iget-object v1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->O:Ljava/lang/String;

    .line 211
    .line 212
    const-string v3, "Momo"

    .line 213
    .line 214
    invoke-static {v1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 215
    .line 216
    .line 217
    move-result v1

    .line 218
    if-eqz v1, :cond_c

    .line 219
    .line 220
    iget-boolean v1, p0, Ll/jc00;->k:Z

    .line 221
    .line 222
    if-eqz v1, :cond_a

    .line 223
    .line 224
    invoke-virtual {p1}, Ll/oxd0;->e()I

    .line 225
    .line 226
    .line 227
    move-result v0

    .line 228
    new-array v0, v0, [B

    .line 229
    .line 230
    iput-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->z:[B

    .line 231
    .line 232
    new-instance v1, Ll/oxd0;

    .line 233
    .line 234
    invoke-virtual {p1}, Ll/oxd0;->d()J

    .line 235
    .line 236
    .line 237
    move-result-wide v2

    .line 238
    iget p1, p0, Ll/jc00;->f:I

    .line 239
    .line 240
    invoke-direct {v1, v0, v2, v3, p1}, Ll/oxd0;-><init>([BJI)V

    .line 241
    .line 242
    .line 243
    invoke-super {p0, v1}, Ll/jc00;->C(Ll/oxd0;)Ll/oxd0;

    .line 244
    .line 245
    .line 246
    move-result-object p0

    .line 247
    return-object p0

    .line 248
    :cond_a
    if-eqz v0, :cond_b

    .line 249
    .line 250
    new-instance v1, Ll/oxd0;

    .line 251
    .line 252
    invoke-virtual {p1}, Ll/oxd0;->d()J

    .line 253
    .line 254
    .line 255
    move-result-wide v2

    .line 256
    iget p1, p0, Ll/jc00;->f:I

    .line 257
    .line 258
    invoke-direct {v1, v0, v2, v3, p1}, Ll/oxd0;-><init>([BJI)V

    .line 259
    .line 260
    .line 261
    invoke-super {p0, v1}, Ll/jc00;->C(Ll/oxd0;)Ll/oxd0;

    .line 262
    .line 263
    .line 264
    move-result-object p0

    .line 265
    return-object p0

    .line 266
    :cond_b
    invoke-super {p0, p1}, Ll/jc00;->C(Ll/oxd0;)Ll/oxd0;

    .line 267
    .line 268
    .line 269
    move-result-object p0

    .line 270
    return-object p0

    .line 271
    :cond_c
    if-eqz v0, :cond_e

    .line 272
    .line 273
    iget v1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->H:I

    .line 274
    .line 275
    if-ne v1, v2, :cond_d

    .line 276
    .line 277
    new-instance v1, Ll/oxd0;

    .line 278
    .line 279
    invoke-virtual {p1}, Ll/oxd0;->d()J

    .line 280
    .line 281
    .line 282
    move-result-wide v2

    .line 283
    iget p1, p0, Ll/jc00;->f:I

    .line 284
    .line 285
    invoke-direct {v1, v0, v2, v3, p1}, Ll/oxd0;-><init>([BJI)V

    .line 286
    .line 287
    .line 288
    invoke-super {p0, v1}, Ll/jc00;->C(Ll/oxd0;)Ll/oxd0;

    .line 289
    .line 290
    .line 291
    move-result-object p0

    .line 292
    return-object p0

    .line 293
    :cond_d
    new-instance v1, Ll/oxd0;

    .line 294
    .line 295
    invoke-virtual {p1}, Ll/oxd0;->d()J

    .line 296
    .line 297
    .line 298
    move-result-wide v2

    .line 299
    iget p0, p0, Ll/jc00;->f:I

    .line 300
    .line 301
    invoke-direct {v1, v0, v2, v3, p0}, Ll/oxd0;-><init>([BJI)V

    .line 302
    .line 303
    .line 304
    return-object v1

    .line 305
    :cond_e
    :goto_5
    return-object p1
.end method

.method public C2()Ll/gb1;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->u:Ll/gb1;

    .line 2
    .line 3
    return-object p0
.end method

.method public D2()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget p0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->r:I

    .line 6
    .line 7
    const/4 v0, -0x1

    .line 8
    if-eq p0, v0, :cond_0

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    if-eq p0, v0, :cond_0

    .line 14
    .line 15
    return v0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public F(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->L:Ll/s5r;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/s5r;

    .line 6
    .line 7
    iget v1, p0, Ll/jc00;->d:I

    .line 8
    .line 9
    iget v2, p0, Ll/jc00;->f:I

    .line 10
    .line 11
    iget-object v3, p0, Ll/jc00;->h:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 12
    .line 13
    invoke-direct {v0, p2, v1, v2, v3}, Ll/s5r;-><init>(Ljava/lang/String;IILcom/immomo/mediacore/audio/AudioProcess;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->L:Ll/s5r;

    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->L:Ll/s5r;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->u:Ll/gb1;

    .line 23
    .line 24
    invoke-static {v0}, Ll/s5r;->Z(Ll/gb1;)V

    .line 25
    .line 26
    .line 27
    :cond_1
    invoke-direct {p0}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->M2()V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->L:Ll/s5r;

    .line 31
    .line 32
    invoke-virtual {p0, p1, p2}, Ll/s5r;->X(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public G1(Ll/gb1;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->u:Ll/gb1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->L:Ll/s5r;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {p1}, Ll/s5r;->Z(Ll/gb1;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public G2()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->n:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->clear()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public H2()V
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-static {p0}, Ll/s5r;->Z(Ll/gb1;)V

    .line 3
    .line 4
    .line 5
    invoke-static {}, Ll/s5r;->Q()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public I()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jc00;->h:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/immomo/mediacore/audio/AudioProcess;->SabineEffectReset_ex()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public I2(IIILjava/lang/String;)V
    .locals 4

    .line 1
    iget v0, p0, Ll/jc00;->b:I

    .line 2
    .line 3
    if-ne v0, p1, :cond_1

    .line 4
    .line 5
    iget v0, p0, Ll/jc00;->d:I

    .line 6
    .line 7
    if-ne v0, p2, :cond_1

    .line 8
    .line 9
    iget v0, p0, Ll/jc00;->f:I

    .line 10
    .line 11
    if-ne v0, p3, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->O:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 v0, 0x0

    .line 23
    goto :goto_1

    .line 24
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 25
    :goto_1
    if-nez v0, :cond_2

    .line 26
    .line 27
    iget-object v1, p0, Ll/jc00;->h:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 28
    .line 29
    if-eqz v1, :cond_2

    .line 30
    .line 31
    goto/16 :goto_3

    .line 32
    .line 33
    :cond_2
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    new-instance v2, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    const-string v3, "setAudioRecorderBuffSize: name:"

    .line 40
    .line 41
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    const-string v3, " , channel:"

    .line 48
    .line 49
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    const-string v3, "ExtAudioWrapper"

    .line 60
    .line 61
    invoke-virtual {v1, v3, v2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    iput p1, p0, Ll/jc00;->b:I

    .line 65
    .line 66
    iput p2, p0, Ll/jc00;->d:I

    .line 67
    .line 68
    iput p3, p0, Ll/jc00;->f:I

    .line 69
    .line 70
    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    iput-object p1, p0, Ll/jc00;->g:Ljava/nio/ByteBuffer;

    .line 75
    .line 76
    iput-object p4, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->O:Ljava/lang/String;

    .line 77
    .line 78
    iget-object p1, p0, Ll/jc00;->h:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 79
    .line 80
    if-eqz p1, :cond_3

    .line 81
    .line 82
    if-eqz v0, :cond_4

    .line 83
    .line 84
    invoke-virtual {p1}, Lcom/immomo/mediacore/audio/AudioProcess;->release()V

    .line 85
    .line 86
    .line 87
    new-instance p1, Lcom/immomo/mediacore/audio/AudioProcess;

    .line 88
    .line 89
    invoke-direct {p1}, Lcom/immomo/mediacore/audio/AudioProcess;-><init>()V

    .line 90
    .line 91
    .line 92
    iput-object p1, p0, Ll/jc00;->h:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 93
    .line 94
    goto :goto_2

    .line 95
    :cond_3
    new-instance p1, Lcom/immomo/mediacore/audio/AudioProcess;

    .line 96
    .line 97
    invoke-direct {p1}, Lcom/immomo/mediacore/audio/AudioProcess;-><init>()V

    .line 98
    .line 99
    .line 100
    iput-object p1, p0, Ll/jc00;->h:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 101
    .line 102
    :cond_4
    :goto_2
    iget-object p1, p0, Ll/jc00;->h:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 103
    .line 104
    iget p2, p0, Ll/jc00;->d:I

    .line 105
    .line 106
    iget p3, p0, Ll/jc00;->f:I

    .line 107
    .line 108
    iget p4, p0, Ll/jc00;->b:I

    .line 109
    .line 110
    div-int/lit8 p4, p4, 0x2

    .line 111
    .line 112
    invoke-virtual {p1, p2, p3, p4}, Lcom/immomo/mediacore/audio/AudioProcess;->openSabineEf(III)V

    .line 113
    .line 114
    .line 115
    iget-object p1, p0, Ll/jc00;->h:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 116
    .line 117
    const/high16 p2, 0x3f800000    # 1.0f

    .line 118
    .line 119
    invoke-virtual {p1, p2}, Lcom/immomo/mediacore/audio/AudioProcess;->setSlaveAudioGain(F)V

    .line 120
    .line 121
    .line 122
    iget-object p1, p0, Ll/jc00;->h:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 123
    .line 124
    invoke-virtual {p1, p2}, Lcom/immomo/mediacore/audio/AudioProcess;->setSlaveAudioLevel(F)V

    .line 125
    .line 126
    .line 127
    iget-object p1, p0, Ll/jc00;->h:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 128
    .line 129
    invoke-virtual {p1, p2}, Lcom/immomo/mediacore/audio/AudioProcess;->setMasterAudioLevel(F)V

    .line 130
    .line 131
    .line 132
    iget p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->E:I

    .line 133
    .line 134
    iget-boolean p2, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->D:Z

    .line 135
    .line 136
    invoke-virtual {p0, p1, p2}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->j0(IZ)V

    .line 137
    .line 138
    .line 139
    iget p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->F:I

    .line 140
    .line 141
    iget-boolean p2, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->G:Z

    .line 142
    .line 143
    invoke-virtual {p0, p1, p2}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->b0(IZ)V

    .line 144
    .line 145
    .line 146
    iget p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->C:I

    .line 147
    .line 148
    iget-boolean p2, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->B:Z

    .line 149
    .line 150
    invoke-virtual {p0, p1, p2}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->y0(IZ)V

    .line 151
    .line 152
    .line 153
    iget p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->K:I

    .line 154
    .line 155
    invoke-virtual {p0, p1}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->f0(I)V

    .line 156
    .line 157
    .line 158
    iget-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->x:Ll/kb1;

    .line 159
    .line 160
    if-eqz p1, :cond_5

    .line 161
    .line 162
    invoke-virtual {p1}, Ll/kb1;->a()V

    .line 163
    .line 164
    .line 165
    new-instance p1, Ll/kb1;

    .line 166
    .line 167
    iget p2, p0, Ll/jc00;->d:I

    .line 168
    .line 169
    iget p3, p0, Ll/jc00;->f:I

    .line 170
    .line 171
    invoke-direct {p1, p2, p3}, Ll/kb1;-><init>(II)V

    .line 172
    .line 173
    .line 174
    iput-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->x:Ll/kb1;

    .line 175
    .line 176
    :cond_5
    iget-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->L:Ll/s5r;

    .line 177
    .line 178
    if-eqz p1, :cond_6

    .line 179
    .line 180
    iget-object p2, p0, Ll/jc00;->h:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 181
    .line 182
    iget p3, p0, Ll/jc00;->f:I

    .line 183
    .line 184
    invoke-virtual {p1, p2, p3}, Ll/s5r;->c0(Lcom/immomo/mediacore/audio/AudioProcess;I)V

    .line 185
    .line 186
    .line 187
    :cond_6
    iget-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->Q:Ll/xb1;

    .line 188
    .line 189
    if-eqz p1, :cond_7

    .line 190
    .line 191
    iget-object p2, p0, Ll/jc00;->h:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 192
    .line 193
    iget p0, p0, Ll/jc00;->f:I

    .line 194
    .line 195
    invoke-virtual {p1, p2, p0}, Ll/xb1;->x(Lcom/immomo/mediacore/audio/AudioProcess;I)V

    .line 196
    .line 197
    .line 198
    :cond_7
    :goto_3
    return-void
.end method

.method public J2(Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$i;)V
    .locals 0
    .param p1    # Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$i;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->w:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$i;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->N2()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public K2(ILjava/lang/String;JJZZ)Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->Q:Ll/xb1;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/xb1;

    .line 6
    .line 7
    iget-object v1, p0, Ll/jc00;->h:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ll/xb1;-><init>(Lcom/immomo/mediacore/audio/AudioProcess;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->Q:Ll/xb1;

    .line 13
    .line 14
    invoke-direct {p0}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->M2()V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->Q:Ll/xb1;

    .line 18
    .line 19
    iget v1, p0, Ll/jc00;->d:I

    .line 20
    .line 21
    iget v2, p0, Ll/jc00;->e:I

    .line 22
    .line 23
    iget v3, p0, Ll/jc00;->f:I

    .line 24
    .line 25
    invoke-virtual {v0, v1, v2, v3}, Ll/xb1;->o(III)Z

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->p0:Ll/yb1;

    .line 29
    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    iget-object v1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->Q:Ll/xb1;

    .line 33
    .line 34
    invoke-virtual {v1, v0}, Ll/xb1;->s(Ll/yb1;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    iget-object p0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->Q:Ll/xb1;

    .line 38
    .line 39
    invoke-virtual/range {p0 .. p8}, Ll/xb1;->m(ILjava/lang/String;JJZZ)Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    return p0
.end method

.method public L2()V
    .locals 3

    .line 1
    :try_start_0
    invoke-virtual {p0}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->B2()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->o:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$HeadsetPlugReceiver;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->B2()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v2, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->o:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$HeadsetPlugReceiver;

    .line 17
    .line 18
    invoke-virtual {v0, v2}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->o:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$HeadsetPlugReceiver;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$HeadsetPlugReceiver;->a()V

    .line 24
    .line 25
    .line 26
    iput-object v1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->o:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$HeadsetPlugReceiver;

    .line 27
    .line 28
    :cond_0
    iget-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->p:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$BlueConnectStateBroadcastReceiver;

    .line 29
    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->B2()Landroid/content/Context;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget-object v2, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->p:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$BlueConnectStateBroadcastReceiver;

    .line 37
    .line 38
    invoke-virtual {v0, v2}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->p:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$BlueConnectStateBroadcastReceiver;

    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$BlueConnectStateBroadcastReceiver;->a()V

    .line 44
    .line 45
    .line 46
    iput-object v1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->p:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$BlueConnectStateBroadcastReceiver;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 47
    .line 48
    :cond_1
    return-void

    .line 49
    :catch_0
    move-exception p0

    .line 50
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public N1()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->L:Ll/s5r;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/s5r;->b0()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public N2()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->M2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public O1(Ljava/lang/String;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->w:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$i;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    invoke-interface {v0, p1}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$i;->a(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iput-boolean v1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->A:Z

    .line 11
    .line 12
    iget-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->w:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$i;

    .line 13
    .line 14
    invoke-interface {v0}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$i;->getStreamerType()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    invoke-direct {p0, p1}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->F2(Ljava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0

    .line 25
    :cond_1
    return v1
.end method

.method public P()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jc00;->h:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/immomo/mediacore/audio/AudioProcess;->SabineEffectReset()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public Q(IFF)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jc00;->h:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, Lcom/immomo/mediacore/audio/AudioProcess;->SabineEffectSet_peq_Shelving(IFF)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public R1(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->Q:Ll/xb1;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xb1;->q(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public S1(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->J:Z

    .line 2
    .line 3
    iget-object p0, p0, Ll/jc00;->h:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/audio/AudioProcess;->setElcEffect(Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public T(II)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jc00;->h:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/immomo/mediacore/audio/AudioProcess;->adjustEf(II)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public U1(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jc00;->h:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/audio/AudioProcess;->SabineEffectSet_ans(F)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public V(Ll/hb1;)V
    .locals 0

    .line 1
    return-void
.end method

.method public W1(F)V
    .locals 1

    .line 1
    const v0, 0x3f4ccccd    # 0.8f

    .line 2
    .line 3
    .line 4
    mul-float/2addr v0, p1

    .line 5
    iput v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->y:F

    .line 6
    .line 7
    invoke-super {p0, p1}, Ll/jc00;->W1(F)V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->A2()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public Y0(JZ)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->L:Ll/s5r;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    long-to-int p1, p1

    .line 6
    invoke-virtual {p0, p1, p3}, Ll/s5r;->N(IZ)V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public a(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/jc00;->k:Z

    .line 2
    .line 3
    return-void
.end method

.method public a1()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/jc00;->a1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->I:Z

    .line 2
    .line 3
    return-void
.end method

.method public b0(IZ)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->F:I

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->G:Z

    .line 4
    .line 5
    iget-object p0, p0, Ll/jc00;->h:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2}, Lcom/immomo/mediacore/audio/AudioProcess;->adjustAef(IZ)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public b2()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->w:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$i;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    iput-boolean v1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->A:Z

    .line 7
    .line 8
    iput-boolean v1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->P:Z

    .line 9
    .line 10
    invoke-interface {v0}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$i;->b()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->stop()V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 21
    .line 22
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->release()V

    .line 23
    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    iput-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 27
    .line 28
    :cond_0
    iget-object p0, p0, Ll/jc00;->h:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 29
    .line 30
    if-eqz p0, :cond_1

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/immomo/mediacore/audio/AudioProcess;->clear()V

    .line 33
    .line 34
    .line 35
    :cond_1
    return-void
.end method

.method public c()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getDuration()J

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

.method public d()F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->L:Ll/s5r;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/s5r;->H()F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/high16 p0, 0x3f800000    # 1.0f

    .line 11
    .line 12
    return p0
.end method

.method public d0(IFI)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jc00;->h:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, Lcom/immomo/mediacore/audio/AudioProcess;->SabineEffectSet_peq_fliter(IFI)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public d1()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->p2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public d2()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->Q:Ll/xb1;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xb1;->p()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public e1(IIF)V
    .locals 3

    .line 1
    const/4 v0, 0x2

    .line 2
    if-eq p1, v0, :cond_0

    .line 3
    .line 4
    const/4 v0, 0x3

    .line 5
    if-ne p1, v0, :cond_1

    .line 6
    .line 7
    :cond_0
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v2, "nMode:"

    .line 14
    .line 15
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v2, ",idx:"

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v0, v1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    const/4 v1, 0x0

    .line 45
    invoke-virtual {v0, v1}, Ll/csx;->C1(I)V

    .line 46
    .line 47
    .line 48
    :cond_1
    iget-object p0, p0, Ll/jc00;->h:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 49
    .line 50
    if-eqz p0, :cond_2

    .line 51
    .line 52
    invoke-virtual {p0, p1, p2, p3}, Lcom/immomo/mediacore/audio/AudioProcess;->SabineEffectSet(IIF)V

    .line 53
    .line 54
    .line 55
    :cond_2
    return-void
.end method

.method public f0(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->K:I

    .line 2
    .line 3
    iget-object p0, p0, Ll/jc00;->h:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/audio/AudioProcess;->setAudioEffectType(I)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public g1(Ljava/lang/String;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->w:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$i;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    invoke-interface {v0, p1}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$i;->a(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iput-boolean v1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->A:Z

    .line 11
    .line 12
    invoke-direct {p0, p1}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->F2(Ljava/lang/String;)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0
.end method

.method public getMusicDuration()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->L:Ll/s5r;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/s5r;->G()J

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

.method public i1(IF)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jc00;->h:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/immomo/mediacore/audio/AudioProcess;->SabineEffectSet_reverb(IF)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public j()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jc00;->h:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/immomo/mediacore/audio/AudioProcess;->clearSurroundFrames()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-virtual {p0}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->D2()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    iget-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 15
    .line 16
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->isPlaying()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 23
    .line 24
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->pause()V

    .line 25
    .line 26
    .line 27
    const/4 v0, 0x4

    .line 28
    iput v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->r:I

    .line 29
    .line 30
    :cond_1
    return-void
.end method

.method public j0(IZ)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->E:I

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->D:Z

    .line 4
    .line 5
    iget-object p0, p0, Ll/jc00;->h:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2}, Lcom/immomo/mediacore/audio/AudioProcess;->adjustTune(IZ)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public l(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->H:I

    .line 2
    .line 3
    return-void
.end method

.method public l0(ILjava/lang/String;ZZ)Z
    .locals 9

    .line 1
    const-wide/16 v3, 0x0

    .line 2
    .line 3
    const-wide/16 v5, 0x0

    .line 4
    .line 5
    move-object v0, p0

    .line 6
    move v1, p1

    .line 7
    move-object v2, p2

    .line 8
    move v7, p3

    .line 9
    move v8, p4

    .line 10
    invoke-virtual/range {v0 .. v8}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->K2(ILjava/lang/String;JJZZ)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method public n1(IFFF)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jc00;->h:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/immomo/mediacore/audio/AudioProcess;->SabineEffectSet_peq_peak(IFFF)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public o0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->L:Ll/s5r;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/s5r;->P()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->L:Ll/s5r;

    .line 10
    .line 11
    :cond_0
    invoke-virtual {p0}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->H2()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public p1()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->L:Ll/s5r;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/s5r;->S()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public p2()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->L2()V

    .line 2
    .line 3
    .line 4
    invoke-super {p0}, Ll/jc00;->p2()V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->P:Z

    .line 9
    .line 10
    iget-object v1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setMediaDataCallback(Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateCallback;)V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 19
    .line 20
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->stop()V

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 24
    .line 25
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->release()V

    .line 26
    .line 27
    .line 28
    iput v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->r:I

    .line 29
    .line 30
    iput-object v2, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 31
    .line 32
    :cond_0
    iget-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->x:Ll/kb1;

    .line 33
    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    invoke-virtual {v0}, Ll/kb1;->a()V

    .line 37
    .line 38
    .line 39
    iput-object v2, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->x:Ll/kb1;

    .line 40
    .line 41
    :cond_1
    iput-object v2, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->w:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$i;

    .line 42
    .line 43
    iput-object v2, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->o:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$HeadsetPlugReceiver;

    .line 44
    .line 45
    iput-object v2, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->p:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$BlueConnectStateBroadcastReceiver;

    .line 46
    .line 47
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0}, Ll/csx;->w0()Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    const/4 v1, 0x1

    .line 56
    if-ne v0, v1, :cond_3

    .line 57
    .line 58
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {v0}, Ll/csx;->x0()I

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-nez v0, :cond_3

    .line 67
    .line 68
    iget-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->N:Ljava/lang/Object;

    .line 69
    .line 70
    monitor-enter v0

    .line 71
    :try_start_0
    iget-object v1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->M:Lcom/immomo/mediacore/audio/VadDetector;

    .line 72
    .line 73
    if-eqz v1, :cond_2

    .line 74
    .line 75
    invoke-virtual {v1}, Lcom/immomo/mediacore/audio/VadDetector;->releaseVad()V

    .line 76
    .line 77
    .line 78
    iput-object v2, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->M:Lcom/immomo/mediacore/audio/VadDetector;

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :catchall_0
    move-exception p0

    .line 82
    goto :goto_1

    .line 83
    :cond_2
    :goto_0
    monitor-exit v0

    .line 84
    goto :goto_2

    .line 85
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 86
    throw p0

    .line 87
    :cond_3
    :goto_2
    invoke-virtual {p0}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->G2()V

    .line 88
    .line 89
    .line 90
    iput-object v2, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->u:Ll/gb1;

    .line 91
    .line 92
    return-void
.end method

.method public q()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->D2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 8
    .line 9
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->start()V

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x3

    .line 13
    iput v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->r:I

    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public q0(J)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->L:Ll/s5r;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    long-to-int p1, p1

    .line 6
    invoke-virtual {p0, p1}, Ll/s5r;->T(I)V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public r()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getCurrentPosition()J

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

.method public s1(I)V
    .locals 3

    .line 1
    iget v0, p0, Ll/jc00;->b:I

    .line 2
    .line 3
    iget v1, p0, Ll/jc00;->d:I

    .line 4
    .line 5
    iget-object v2, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->O:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0, v0, v1, p1, v2}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->I2(IIILjava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setMusicPitch(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->L:Ll/s5r;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/s5r;->V(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setMusicVolume(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->L:Ll/s5r;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/s5r;->W(F)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public stopSurroundMusic()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->w:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$i;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    iput-boolean v1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->A:Z

    .line 7
    .line 8
    invoke-interface {v0}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$i;->b()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->w:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$i;

    .line 12
    .line 13
    invoke-interface {v0}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$i;->getStreamerType()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->w:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$i;

    .line 20
    .line 21
    invoke-interface {v0}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$i;->getStreamerType()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    const/4 v1, 0x2

    .line 26
    if-ne v0, v1, :cond_2

    .line 27
    .line 28
    :cond_0
    iget-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 29
    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->stop()V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 36
    .line 37
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->release()V

    .line 38
    .line 39
    .line 40
    const/4 v0, 0x0

    .line 41
    iput-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 42
    .line 43
    :cond_1
    iget-object p0, p0, Ll/jc00;->h:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 44
    .line 45
    if-eqz p0, :cond_2

    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/immomo/mediacore/audio/AudioProcess;->clear()V

    .line 48
    .line 49
    .line 50
    :cond_2
    return-void
.end method

.method public v1(J)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->L:Ll/s5r;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->N2()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->L:Ll/s5r;

    .line 9
    .line 10
    long-to-int p1, p1

    .line 11
    invoke-virtual {p0, p1}, Ll/s5r;->M(I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public w()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->L:Ll/s5r;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/s5r;->F()J

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

.method public w0(J)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->D2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 8
    .line 9
    invoke-virtual {v0, p1, p2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->seekTo(J)V

    .line 10
    .line 11
    .line 12
    const-wide/16 p1, 0x0

    .line 13
    .line 14
    iput-wide p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->s:J

    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iput-wide p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->s:J

    .line 18
    .line 19
    return-void
.end method

.method public w1()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->L:Ll/s5r;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/s5r;->L()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public x0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->P:Z

    .line 2
    .line 3
    return-void
.end method

.method public y0(IZ)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->C:I

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->B:Z

    .line 4
    .line 5
    iget-object p0, p0, Ll/jc00;->h:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2}, Lcom/immomo/mediacore/audio/AudioProcess;->adjustEQ(IZ)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public y1()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->y:F

    .line 2
    .line 3
    return p0
.end method

.method public z(Z)V
    .locals 2

    .line 1
    iput-boolean p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->v:Z

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->x:Ll/kb1;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/kb1;->a()V

    .line 10
    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    iput-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->x:Ll/kb1;

    .line 14
    .line 15
    :cond_0
    iget-boolean p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->v:Z

    .line 16
    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    iget-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->x:Ll/kb1;

    .line 20
    .line 21
    if-nez p1, :cond_1

    .line 22
    .line 23
    new-instance p1, Ll/kb1;

    .line 24
    .line 25
    iget v0, p0, Ll/jc00;->d:I

    .line 26
    .line 27
    const/4 v1, 0x2

    .line 28
    invoke-direct {p1, v0, v1}, Ll/kb1;-><init>(II)V

    .line 29
    .line 30
    .line 31
    iput-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->x:Ll/kb1;

    .line 32
    .line 33
    :cond_1
    return-void
.end method

.method public z1(Z)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->L2()V

    .line 2
    .line 3
    .line 4
    :try_start_0
    new-instance v0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$HeadsetPlugReceiver;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-direct {v0, p0, v1}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$HeadsetPlugReceiver;-><init>(Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$a;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->o:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$HeadsetPlugReceiver;

    .line 11
    .line 12
    new-instance v0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$BlueConnectStateBroadcastReceiver;

    .line 13
    .line 14
    invoke-direct {v0, p0, v1}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$BlueConnectStateBroadcastReceiver;-><init>(Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$a;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->p:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$BlueConnectStateBroadcastReceiver;

    .line 18
    .line 19
    new-instance v0, Landroid/content/IntentFilter;

    .line 20
    .line 21
    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->q:Landroid/content/IntentFilter;

    .line 25
    .line 26
    const-string v1, "android.intent.action.HEADSET_PLUG"

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->B2()Landroid/content/Context;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->B2()Landroid/content/Context;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget-object v1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->o:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$HeadsetPlugReceiver;

    .line 42
    .line 43
    iget-object v2, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->q:Landroid/content/IntentFilter;

    .line 44
    .line 45
    invoke-static {v0, v1, v2}, Ll/jj5;->l(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->B2()Landroid/content/Context;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iget-object v1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->p:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$BlueConnectStateBroadcastReceiver;

    .line 53
    .line 54
    new-instance v2, Landroid/content/IntentFilter;

    .line 55
    .line 56
    const-string v3, "android.bluetooth.adapter.action.STATE_CHANGED"

    .line 57
    .line 58
    invoke-direct {v2, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v0, v1, v2}, Ll/jj5;->l(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->B2()Landroid/content/Context;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    const-string v1, "audio"

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    check-cast v0, Landroid/media/AudioManager;

    .line 75
    .line 76
    if-nez p1, :cond_0

    .line 77
    .line 78
    invoke-virtual {v0}, Landroid/media/AudioManager;->isWiredHeadsetOn()Z

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    iput-boolean p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->Y:Z

    .line 83
    .line 84
    return-void

    .line 85
    :cond_0
    const/4 p1, 0x1

    .line 86
    iput-boolean p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->Y:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 87
    .line 88
    :catch_0
    :cond_1
    return-void
.end method
