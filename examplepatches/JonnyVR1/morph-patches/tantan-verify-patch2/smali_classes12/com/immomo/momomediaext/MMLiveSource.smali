.class public Lcom/immomo/momomediaext/MMLiveSource;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/aul;
.implements Ll/ytl;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/momomediaext/MMLiveSource$MMAEFILETER;
    }
.end annotation


# instance fields
.field private A:Ll/ytl;

.field private B:Ll/n5m;

.field private C:Ll/mvl;

.field private D:Ljava/lang/String;

.field private E:Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

.field private F:Ll/gb1;

.field private G:Ll/drl;

.field private a:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field private b:Ll/brx;

.field private c:Ll/ror;

.field private d:Lcom/momo/pub/MomoPipelineModuleRegister;

.field private e:Ll/fb4;

.field private f:Ll/lvl;

.field private g:Z

.field private h:Lcom/momo/piplinemomoext/input/audio/a;

.field private i:Ll/kpl;

.field private j:Lcom/immomo/momomediaext/b;

.field private k:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnErrorListener;

.field private l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnInfoListener;

.field private m:Ltv/danmaku/ijk/media/streamer/NetUtil;

.field private n:Ljava/lang/String;

.field private o:Ljava/lang/String;

.field private p:I

.field private q:I

.field private r:Ltv/danmaku/ijk/media/streamer/MediaReportLogManager$LogUploadCallBack;

.field s:Ll/brx;

.field private t:Lcom/immomo/momomediaext/MomoMediaConstants$BEAUTY_TYPE;

.field private u:Z

.field private v:I

.field private w:Ltv/danmaku/ijk/media/player/OnPlayerStateCallback;

.field private x:Ll/yuf;

.field private final y:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private z:Ll/aul;


# direct methods
.method public constructor <init>(Lcom/momo/pub/MomoPipelineModuleRegister;Landroid/content/Context;Lcom/immomo/momomediaext/utils/MMLiveUserConfig;)V
    .locals 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->g:Z

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    iput-object v1, p0, Lcom/immomo/momomediaext/MMLiveSource;->m:Ltv/danmaku/ijk/media/streamer/NetUtil;

    .line 9
    .line 10
    const-string v2, ""

    .line 11
    .line 12
    iput-object v2, p0, Lcom/immomo/momomediaext/MMLiveSource;->n:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v2, p0, Lcom/immomo/momomediaext/MMLiveSource;->o:Ljava/lang/String;

    .line 15
    .line 16
    const/4 v3, 0x0

    .line 17
    iput v3, p0, Lcom/immomo/momomediaext/MMLiveSource;->p:I

    .line 18
    .line 19
    iput v3, p0, Lcom/immomo/momomediaext/MMLiveSource;->q:I

    .line 20
    .line 21
    sget-object v4, Lcom/immomo/momomediaext/MomoMediaConstants$BEAUTY_TYPE;->BEAUTY_TYPE_DOKI:Lcom/immomo/momomediaext/MomoMediaConstants$BEAUTY_TYPE;

    .line 22
    .line 23
    iput-object v4, p0, Lcom/immomo/momomediaext/MMLiveSource;->t:Lcom/immomo/momomediaext/MomoMediaConstants$BEAUTY_TYPE;

    .line 24
    .line 25
    iput-boolean v3, p0, Lcom/immomo/momomediaext/MMLiveSource;->u:Z

    .line 26
    .line 27
    iput v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->v:I

    .line 28
    .line 29
    iput-object v1, p0, Lcom/immomo/momomediaext/MMLiveSource;->w:Ltv/danmaku/ijk/media/player/OnPlayerStateCallback;

    .line 30
    .line 31
    iput-object v1, p0, Lcom/immomo/momomediaext/MMLiveSource;->x:Ll/yuf;

    .line 32
    .line 33
    new-instance v0, Ljava/util/LinkedList;

    .line 34
    .line 35
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->y:Ljava/util/Queue;

    .line 39
    .line 40
    iput-object v1, p0, Lcom/immomo/momomediaext/MMLiveSource;->B:Ll/n5m;

    .line 41
    .line 42
    iput-object v1, p0, Lcom/immomo/momomediaext/MMLiveSource;->C:Ll/mvl;

    .line 43
    .line 44
    iput-object v2, p0, Lcom/immomo/momomediaext/MMLiveSource;->D:Ljava/lang/String;

    .line 45
    .line 46
    iput-object v1, p0, Lcom/immomo/momomediaext/MMLiveSource;->F:Ll/gb1;

    .line 47
    .line 48
    new-instance v0, Lcom/immomo/momomediaext/MMLiveSource$f;

    .line 49
    .line 50
    invoke-direct {v0, p0}, Lcom/immomo/momomediaext/MMLiveSource$f;-><init>(Lcom/immomo/momomediaext/MMLiveSource;)V

    .line 51
    .line 52
    .line 53
    iput-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->G:Ll/drl;

    .line 54
    .line 55
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 56
    .line 57
    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 58
    .line 59
    .line 60
    iput-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->a:Ljava/lang/ref/WeakReference;

    .line 61
    .line 62
    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    invoke-static {p2}, Ll/l26;->a(Landroid/content/Context;)V

    .line 67
    .line 68
    .line 69
    iput-object p3, p0, Lcom/immomo/momomediaext/MMLiveSource;->E:Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 70
    .line 71
    iput-object p1, p0, Lcom/immomo/momomediaext/MMLiveSource;->d:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 72
    .line 73
    invoke-interface {p1}, Lcom/momo/pub/MomoPipelineModuleRegister;->getParameters()Ll/ror;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    iput-object p2, p0, Lcom/immomo/momomediaext/MMLiveSource;->c:Ll/ror;

    .line 78
    .line 79
    iget-object p2, p0, Lcom/immomo/momomediaext/MMLiveSource;->s:Ll/brx;

    .line 80
    .line 81
    invoke-direct {p0, p2}, Lcom/immomo/momomediaext/MMLiveSource;->v(Ll/brx;)V

    .line 82
    .line 83
    .line 84
    new-instance p2, Ll/fb4;

    .line 85
    .line 86
    invoke-direct {p2, p1}, Ll/fb4;-><init>(Lcom/momo/pub/MomoPipelineModuleRegister;)V

    .line 87
    .line 88
    .line 89
    iput-object p2, p0, Lcom/immomo/momomediaext/MMLiveSource;->e:Ll/fb4;

    .line 90
    .line 91
    invoke-static {p2}, Ll/cnw;->a(Ll/fb4;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p3}, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->isAudioOnly()Z

    .line 95
    .line 96
    .line 97
    move-result p2

    .line 98
    if-nez p2, :cond_0

    .line 99
    .line 100
    invoke-direct {p0}, Lcom/immomo/momomediaext/MMLiveSource;->x()Z

    .line 101
    .line 102
    .line 103
    move-result p2

    .line 104
    if-eqz p2, :cond_0

    .line 105
    .line 106
    new-instance p2, Ll/uw2;

    .line 107
    .line 108
    invoke-direct {p2, p1}, Ll/uw2;-><init>(Lcom/momo/pub/MomoPipelineModuleRegister;)V

    .line 109
    .line 110
    .line 111
    iput-object p2, p0, Lcom/immomo/momomediaext/MMLiveSource;->i:Ll/kpl;

    .line 112
    .line 113
    iget-object p1, p0, Lcom/immomo/momomediaext/MMLiveSource;->a:Ljava/lang/ref/WeakReference;

    .line 114
    .line 115
    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    check-cast p1, Landroid/content/Context;

    .line 120
    .line 121
    iget-object p3, p0, Lcom/immomo/momomediaext/MMLiveSource;->e:Ll/fb4;

    .line 122
    .line 123
    invoke-interface {p2, p1, p3, p0}, Ll/kpl;->n(Landroid/content/Context;Ll/esl;Ll/ytl;)V

    .line 124
    .line 125
    .line 126
    iget-object p1, p0, Lcom/immomo/momomediaext/MMLiveSource;->i:Ll/kpl;

    .line 127
    .line 128
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveSource;->h:Lcom/momo/piplinemomoext/input/audio/a;

    .line 129
    .line 130
    invoke-interface {p1, p0}, Ll/htl;->d(Lcom/momo/piplinemomoext/input/audio/a;)V

    .line 131
    .line 132
    .line 133
    :cond_0
    return-void
.end method

.method public static synthetic c(Lcom/immomo/momomediaext/MMLiveSource;)Ll/kpl;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveSource;->i:Ll/kpl;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d(Lcom/immomo/momomediaext/MMLiveSource;)Lcom/momo/pub/MomoPipelineModuleRegister;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveSource;->d:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic e(Lcom/immomo/momomediaext/MMLiveSource;)Ltv/danmaku/ijk/media/streamer/MediaReportLogManager$LogUploadCallBack;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveSource;->r:Ltv/danmaku/ijk/media/streamer/MediaReportLogManager$LogUploadCallBack;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic f(Lcom/immomo/momomediaext/MMLiveSource;)Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnInfoListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveSource;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnInfoListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic g(Lcom/immomo/momomediaext/MMLiveSource;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/momomediaext/MMLiveSource;->p:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic h(Lcom/immomo/momomediaext/MMLiveSource;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/momomediaext/MMLiveSource;->p:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic i(Lcom/immomo/momomediaext/MMLiveSource;)Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnErrorListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveSource;->k:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnErrorListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic j(Lcom/immomo/momomediaext/MMLiveSource;)Ltv/danmaku/ijk/media/streamer/NetUtil;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveSource;->m:Ltv/danmaku/ijk/media/streamer/NetUtil;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic k(Lcom/immomo/momomediaext/MMLiveSource;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveSource;->n:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic l(Lcom/immomo/momomediaext/MMLiveSource;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/MMLiveSource;->n:Ljava/lang/String;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic m(Lcom/immomo/momomediaext/MMLiveSource;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveSource;->o:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic n(Lcom/immomo/momomediaext/MMLiveSource;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/MMLiveSource;->o:Ljava/lang/String;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic o(Lcom/immomo/momomediaext/MMLiveSource;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/momomediaext/MMLiveSource;->q:I

    .line 2
    .line 3
    return p0
.end method

.method private v(Ll/brx;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/MMLiveSource;->b:Ll/brx;

    .line 2
    .line 3
    iget-object p1, p0, Lcom/immomo/momomediaext/MMLiveSource;->d:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 4
    .line 5
    invoke-interface {p1}, Lcom/momo/pub/MomoPipelineModuleRegister;->n()V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/immomo/momomediaext/MMLiveSource;->d:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 9
    .line 10
    invoke-interface {p1}, Lcom/momo/pub/MomoPipelineModuleRegister;->K()V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/immomo/momomediaext/MMLiveSource;->d:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 14
    .line 15
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->G:Ll/drl;

    .line 16
    .line 17
    invoke-interface {p1, v0}, Lcom/momo/pub/MomoPipelineModuleRegister;->G(Ll/drl;)Ll/fa5;

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lcom/immomo/momomediaext/MMLiveSource;->d:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 21
    .line 22
    new-instance v0, Lcom/immomo/momomediaext/MMLiveSource$b;

    .line 23
    .line 24
    invoke-direct {v0, p0}, Lcom/immomo/momomediaext/MMLiveSource$b;-><init>(Lcom/immomo/momomediaext/MMLiveSource;)V

    .line 25
    .line 26
    .line 27
    invoke-interface {p1, v0}, Lcom/momo/pub/MomoPipelineModuleRegister;->D(Ll/j410$b;)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Lcom/immomo/momomediaext/MMLiveSource;->d:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 31
    .line 32
    new-instance v0, Lcom/immomo/momomediaext/MMLiveSource$c;

    .line 33
    .line 34
    invoke-direct {v0, p0}, Lcom/immomo/momomediaext/MMLiveSource$c;-><init>(Lcom/immomo/momomediaext/MMLiveSource;)V

    .line 35
    .line 36
    .line 37
    invoke-interface {p1, v0}, Lcom/momo/pub/MomoPipelineModuleRegister;->A(Lcom/momo/pub/MomoPipelineModuleRegister$b;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Lcom/immomo/momomediaext/MMLiveSource;->d:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 41
    .line 42
    new-instance v0, Lcom/immomo/momomediaext/MMLiveSource$d;

    .line 43
    .line 44
    invoke-direct {v0, p0}, Lcom/immomo/momomediaext/MMLiveSource$d;-><init>(Lcom/immomo/momomediaext/MMLiveSource;)V

    .line 45
    .line 46
    .line 47
    invoke-interface {p1, v0}, Lcom/momo/pub/MomoPipelineModuleRegister;->e(Lcom/momo/pub/MomoPipelineModuleRegister$a;)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Lcom/immomo/momomediaext/MMLiveSource;->d:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 51
    .line 52
    invoke-interface {p1}, Lcom/momo/pub/MomoPipelineModuleRegister;->l()Lcom/momo/piplinemomoext/input/audio/a;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    iput-object p1, p0, Lcom/immomo/momomediaext/MMLiveSource;->h:Lcom/momo/piplinemomoext/input/audio/a;

    .line 57
    .line 58
    iget-object p1, p0, Lcom/immomo/momomediaext/MMLiveSource;->d:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 59
    .line 60
    new-instance v0, Lcom/immomo/momomediaext/MMLiveSource$e;

    .line 61
    .line 62
    invoke-direct {v0, p0}, Lcom/immomo/momomediaext/MMLiveSource$e;-><init>(Lcom/immomo/momomediaext/MMLiveSource;)V

    .line 63
    .line 64
    .line 65
    invoke-interface {p1, v0}, Lcom/momo/pub/MomoPipelineModuleRegister;->f(Lcom/momo/pub/MomoPipelineModuleRegister$c;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method private x()Z
    .locals 4

    .line 1
    :try_start_0
    invoke-static {}, Lcom/momo/xeengine/XEnginePreferences;->checkEngineEnv()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x1

    .line 5
    return p0

    .line 6
    :catch_0
    move-exception p0

    .line 7
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "xengine checkEngineEnv failed"

    .line 12
    .line 13
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const-string v1, "isAudioOnly"

    .line 25
    .line 26
    const-string v2, "false"

    .line 27
    .line 28
    const-string v3, "MMLiveSource"

    .line 29
    .line 30
    invoke-virtual {v0, v3, v1, v2}, Ll/b7y;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    new-instance v1, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    const-string v2, "xeengine:"

    .line 40
    .line 41
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    sget-object v1, Lcom/immomo/medialog/LogLevel;->ERROR:Lcom/immomo/medialog/LogLevel;

    .line 56
    .line 57
    invoke-virtual {v0, v3, p0, v1}, Ll/b7y;->a(Ljava/lang/String;Ljava/lang/String;Lcom/immomo/medialog/LogLevel;)V

    .line 58
    .line 59
    .line 60
    const/4 p0, 0x0

    .line 61
    return p0
.end method


# virtual methods
.method public A()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveSource;->h:Lcom/momo/piplinemomoext/input/audio/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/l6m;->getMusicDuration()J

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

.method public B(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/momomediaext/MMLiveSource;->u:Z

    .line 2
    .line 3
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveSource;->f:Ll/lvl;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/lvl;->t(Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public C()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/immomo/momomediaext/MMLiveSource;->f0()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/core/glcore/util/SegmentHelper;->release()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/immomo/momomediaext/MMLiveSource;->e0()V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Ll/cnw;->b()V

    .line 11
    .line 12
    .line 13
    monitor-enter p0

    .line 14
    :try_start_0
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->m:Ltv/danmaku/ijk/media/streamer/NetUtil;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/streamer/NetUtil;->e()V

    .line 20
    .line 21
    .line 22
    iput-object v1, p0, Lcom/immomo/momomediaext/MMLiveSource;->m:Ltv/danmaku/ijk/media/streamer/NetUtil;

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :catchall_0
    move-exception v0

    .line 26
    goto :goto_1

    .line 27
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->h:Lcom/momo/piplinemomoext/input/audio/a;

    .line 28
    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    invoke-interface {v0}, Ll/l6m;->d1()V

    .line 32
    .line 33
    .line 34
    iput-object v1, p0, Lcom/immomo/momomediaext/MMLiveSource;->h:Lcom/momo/piplinemomoext/input/audio/a;

    .line 35
    .line 36
    :cond_1
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->e:Ll/fb4;

    .line 37
    .line 38
    if-eqz v0, :cond_2

    .line 39
    .line 40
    invoke-virtual {v0}, Ll/fb4;->d0()V

    .line 41
    .line 42
    .line 43
    iput-object v1, p0, Lcom/immomo/momomediaext/MMLiveSource;->e:Ll/fb4;

    .line 44
    .line 45
    :cond_2
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->f:Ll/lvl;

    .line 46
    .line 47
    if-eqz v0, :cond_3

    .line 48
    .line 49
    invoke-interface {v0}, Ll/pvl;->G()V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->d:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 53
    .line 54
    iget-object v2, p0, Lcom/immomo/momomediaext/MMLiveSource;->f:Ll/lvl;

    .line 55
    .line 56
    invoke-interface {v0, v2}, Lcom/momo/pub/MomoPipelineModuleRegister;->B(Ll/pvl;)V

    .line 57
    .line 58
    .line 59
    iput-object v1, p0, Lcom/immomo/momomediaext/MMLiveSource;->f:Ll/lvl;

    .line 60
    .line 61
    :cond_3
    iput-object v1, p0, Lcom/immomo/momomediaext/MMLiveSource;->r:Ltv/danmaku/ijk/media/streamer/MediaReportLogManager$LogUploadCallBack;

    .line 62
    .line 63
    iput-object v1, p0, Lcom/immomo/momomediaext/MMLiveSource;->k:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnErrorListener;

    .line 64
    .line 65
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->a:Ljava/lang/ref/WeakReference;

    .line 66
    .line 67
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->clear()V

    .line 68
    .line 69
    .line 70
    iput-object v1, p0, Lcom/immomo/momomediaext/MMLiveSource;->a:Ljava/lang/ref/WeakReference;

    .line 71
    .line 72
    monitor-exit p0

    .line 73
    return-void

    .line 74
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 75
    throw v0
.end method

.method public D(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->i:Ll/kpl;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1}, Ll/htl;->b(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->y:Ljava/util/Queue;

    .line 10
    .line 11
    new-instance v1, Lcom/immomo/momomediaext/MMLiveSource$a;

    .line 12
    .line 13
    invoke-direct {v1, p0, p1}, Lcom/immomo/momomediaext/MMLiveSource$a;-><init>(Lcom/immomo/momomediaext/MMLiveSource;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-interface {v0, v1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public E(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->i:Ll/kpl;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1, p2}, Ll/gtl;->removeMakeupStyle(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->y:Ljava/util/Queue;

    .line 10
    .line 11
    new-instance v1, Lcom/immomo/momomediaext/MMLiveSource$i;

    .line 12
    .line 13
    invoke-direct {v1, p0, p1, p2}, Lcom/immomo/momomediaext/MMLiveSource$i;-><init>(Lcom/immomo/momomediaext/MMLiveSource;Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-interface {v0, v1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    :goto_0
    const/4 p0, 0x1

    .line 20
    return p0
.end method

.method public F(Lcom/momo/mcamera/mask/MaskModel;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->i:Ll/kpl;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1}, Ll/htl;->a(Lcom/momo/mcamera/mask/MaskModel;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->y:Ljava/util/Queue;

    .line 10
    .line 11
    new-instance v1, Lcom/immomo/momomediaext/MMLiveSource$p;

    .line 12
    .line 13
    invoke-direct {v1, p0, p1}, Lcom/immomo/momomediaext/MMLiveSource$p;-><init>(Lcom/immomo/momomediaext/MMLiveSource;Lcom/momo/mcamera/mask/MaskModel;)V

    .line 14
    .line 15
    .line 16
    invoke-interface {v0, v1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public G()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->j:Lcom/immomo/momomediaext/b;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/immomo/momomediaext/b;->f()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->j:Lcom/immomo/momomediaext/b;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public H()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveSource;->d:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/momo/pub/MomoPipelineModuleRegister;->N()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public I(Ll/ytl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/MMLiveSource;->A:Ll/ytl;

    .line 2
    .line 3
    return-void
.end method

.method public J(Lcom/immomo/momomediaext/MomoMediaConstants$BEAUTY_TYPE;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/MMLiveSource;->t:Lcom/immomo/momomediaext/MomoMediaConstants$BEAUTY_TYPE;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->i:Ll/kpl;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/immomo/momomediaext/MomoMediaConstants$BEAUTY_TYPE;->value()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-interface {v0, p1}, Ll/gtl;->r(I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object p1, p0, Lcom/immomo/momomediaext/MMLiveSource;->e:Ll/fb4;

    .line 15
    .line 16
    if-eqz p1, :cond_2

    .line 17
    .line 18
    invoke-static {}, Ll/cnw;->c()Ljava/util/List;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p1, v0}, Ll/fb4;->W(Ljava/util/List;)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lcom/immomo/momomediaext/MMLiveSource;->e:Ll/fb4;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveSource;->t:Lcom/immomo/momomediaext/MomoMediaConstants$BEAUTY_TYPE;

    .line 28
    .line 29
    sget-object v0, Lcom/immomo/momomediaext/MomoMediaConstants$BEAUTY_TYPE;->BEAUTY_TYPE_BYTE:Lcom/immomo/momomediaext/MomoMediaConstants$BEAUTY_TYPE;

    .line 30
    .line 31
    if-eq p0, v0, :cond_1

    .line 32
    .line 33
    const/4 p0, 0x1

    .line 34
    goto :goto_0

    .line 35
    :cond_1
    const/4 p0, 0x0

    .line 36
    :goto_0
    invoke-virtual {p1, p0}, Ll/fb4;->e(Z)V

    .line 37
    .line 38
    .line 39
    :cond_2
    return-void
.end method

.method public K(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveSource;->e:Ll/fb4;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/fb4;->w(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public L(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveSource;->e:Ll/fb4;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/fb4;->S(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public M(Ll/ib4$l;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveSource;->e:Ll/fb4;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/fb4;->U(Ll/ib4$l;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public N(II)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->e:Ll/fb4;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v1, Ll/erf0;

    .line 6
    .line 7
    invoke-direct {v1, p2, p1}, Ll/erf0;-><init>(II)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/fb4;->Y(Ll/erf0;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->d:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-interface {v0}, Lcom/momo/pub/MomoPipelineModuleRegister;->getParameters()Ll/ror;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iput p1, v0, Ll/tow;->s:I

    .line 22
    .line 23
    iput p2, v0, Ll/tow;->t:I

    .line 24
    .line 25
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->d:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 26
    .line 27
    invoke-interface {v0, p1, p2}, Lcom/momo/pub/MomoPipelineModuleRegister;->s(II)V

    .line 28
    .line 29
    .line 30
    iget-object v1, p0, Lcom/immomo/momomediaext/MMLiveSource;->d:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 31
    .line 32
    const/4 v6, 0x1

    .line 33
    move v4, p1

    .line 34
    move v5, p2

    .line 35
    move v2, p1

    .line 36
    move v3, p2

    .line 37
    invoke-interface/range {v1 .. v6}, Lcom/momo/pub/MomoPipelineModuleRegister;->u(IIIIZ)V

    .line 38
    .line 39
    .line 40
    :cond_1
    return-void
.end method

.method public O(II)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveSource;->e:Ll/fb4;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/erf0;

    .line 6
    .line 7
    invoke-direct {v0, p1, p2}, Ll/erf0;-><init>(II)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ll/fb4;->V(Ll/erf0;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public P(Ll/aul;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/MMLiveSource;->z:Ll/aul;

    .line 2
    .line 3
    return-void
.end method

.method public Q(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveSource;->e:Ll/fb4;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/fb4;->k(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public R(Ll/yuf;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "setFaceFeatureCallback"

    .line 6
    .line 7
    filled-new-array {v1, p1}, [Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Lcom/immomo/momomediaext/MMLiveSource;->x:Ll/yuf;

    .line 15
    .line 16
    return-void
.end method

.method public S(F)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpg-float v1, p1, v0

    .line 3
    .line 4
    if-gez v1, :cond_0

    .line 5
    .line 6
    move p1, v0

    .line 7
    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    .line 8
    .line 9
    cmpl-float v1, p1, v0

    .line 10
    .line 11
    if-lez v1, :cond_1

    .line 12
    .line 13
    move p1, v0

    .line 14
    :cond_1
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->i:Ll/kpl;

    .line 15
    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    invoke-interface {v0, p1}, Ll/gtl;->h(F)V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_2
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->y:Ljava/util/Queue;

    .line 23
    .line 24
    new-instance v1, Lcom/immomo/momomediaext/MMLiveSource$n;

    .line 25
    .line 26
    invoke-direct {v1, p0, p1}, Lcom/immomo/momomediaext/MMLiveSource$n;-><init>(Lcom/immomo/momomediaext/MMLiveSource;F)V

    .line 27
    .line 28
    .line 29
    invoke-interface {v0, v1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    :goto_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    const-string v0, "setIntensity: value:"

    .line 35
    .line 36
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    const-string p1, "MMLiveSource"

    .line 47
    .line 48
    invoke-static {p1, p0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public T(Z)V
    .locals 3

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Lcom/immomo/momomediaext/MMLiveSource;->c:Ll/ror;

    .line 4
    .line 5
    iget v0, p1, Ll/tow;->n:I

    .line 6
    .line 7
    int-to-float v0, v0

    .line 8
    iget v1, p1, Ll/tow;->w:I

    .line 9
    .line 10
    int-to-float v1, v1

    .line 11
    div-float/2addr v0, v1

    .line 12
    iget v1, p1, Ll/tow;->m:I

    .line 13
    .line 14
    int-to-float v1, v1

    .line 15
    iget p1, p1, Ll/tow;->x:I

    .line 16
    .line 17
    int-to-float p1, p1

    .line 18
    div-float/2addr v1, p1

    .line 19
    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/high16 p1, 0x3f800000    # 1.0f

    .line 25
    .line 26
    :goto_0
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->e:Ll/fb4;

    .line 27
    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    iget-object v1, p0, Lcom/immomo/momomediaext/MMLiveSource;->c:Ll/ror;

    .line 31
    .line 32
    iget v2, v1, Ll/tow;->w:I

    .line 33
    .line 34
    iget v1, v1, Ll/tow;->x:I

    .line 35
    .line 36
    invoke-virtual {v0, v2, v1}, Ll/fb4;->f0(II)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->e:Ll/fb4;

    .line 40
    .line 41
    invoke-virtual {v0, p1}, Ll/fb4;->X(F)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->e:Ll/fb4;

    .line 45
    .line 46
    invoke-virtual {v0}, Ll/fb4;->N()Ll/v94;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    if-eqz v0, :cond_1

    .line 51
    .line 52
    invoke-virtual {v0, p1}, Ll/v94;->C(F)V

    .line 53
    .line 54
    .line 55
    const/4 v1, 0x0

    .line 56
    invoke-virtual {v0, v1}, Ll/v94;->s(Z)V

    .line 57
    .line 58
    .line 59
    iget-object v1, p0, Lcom/immomo/momomediaext/MMLiveSource;->e:Ll/fb4;

    .line 60
    .line 61
    invoke-virtual {v1, v0}, Ll/fb4;->T(Ll/v94;)V

    .line 62
    .line 63
    .line 64
    :cond_1
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->i:Ll/kpl;

    .line 65
    .line 66
    if-eqz v0, :cond_2

    .line 67
    .line 68
    invoke-interface {v0, p1}, Ll/kpl;->q(F)V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_2
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->y:Ljava/util/Queue;

    .line 73
    .line 74
    new-instance v1, Lcom/immomo/momomediaext/MMLiveSource$j;

    .line 75
    .line 76
    invoke-direct {v1, p0, p1}, Lcom/immomo/momomediaext/MMLiveSource$j;-><init>(Lcom/immomo/momomediaext/MMLiveSource;F)V

    .line 77
    .line 78
    .line 79
    invoke-interface {v0, v1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public U(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->i:Ll/kpl;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1}, Ll/gtl;->k(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance p0, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    const-string v0, "selectFilter: path:"

    .line 11
    .line 12
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const-string p1, "MMLiveSource"

    .line 23
    .line 24
    invoke-static {p1, p0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->y:Ljava/util/Queue;

    .line 29
    .line 30
    new-instance v1, Lcom/immomo/momomediaext/MMLiveSource$m;

    .line 31
    .line 32
    invoke-direct {v1, p0, p1}, Lcom/immomo/momomediaext/MMLiveSource$m;-><init>(Lcom/immomo/momomediaext/MMLiveSource;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-interface {v0, v1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public V(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->h:Lcom/momo/piplinemomoext/input/audio/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1}, Ll/l6m;->setMusicVolume(F)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveSource;->f:Ll/lvl;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-interface {p0, p1}, Ll/lvl;->setVolume(F)V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public W(II)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->e:Ll/fb4;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v1, Ll/erf0;

    .line 6
    .line 7
    invoke-direct {v1, p1, p2}, Ll/erf0;-><init>(II)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/fb4;->a0(Ll/erf0;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->c:Ll/ror;

    .line 14
    .line 15
    iput p1, v0, Ll/tow;->u:I

    .line 16
    .line 17
    iput p2, v0, Ll/tow;->v:I

    .line 18
    .line 19
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveSource;->d:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 20
    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    invoke-interface {p0, v0}, Lcom/momo/pub/MomoPipelineModuleRegister;->d(Ll/ror;)V

    .line 24
    .line 25
    .line 26
    :cond_1
    return-void
.end method

.method public X(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->c:Ll/ror;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iput p1, v0, Ll/tow;->D:I

    .line 6
    .line 7
    :cond_0
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveSource;->e:Ll/fb4;

    .line 8
    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/fb4;->Z(I)V

    .line 12
    .line 13
    .line 14
    :cond_1
    return-void
.end method

.method public Y(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveSource;->h:Lcom/momo/piplinemomoext/input/audio/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/l6m;->z(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public Z(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveSource;->e:Ll/fb4;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/fb4;->b0(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public a(Ll/omw;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveSource;->z:Ll/aul;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/aul;->a(Ll/omw;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public a0(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->j:Lcom/immomo/momomediaext/b;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/immomo/momomediaext/b;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Lcom/immomo/momomediaext/b;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->j:Lcom/immomo/momomediaext/b;

    .line 11
    .line 12
    new-instance v1, Lcom/immomo/momomediaext/MMLiveSource$k;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Lcom/immomo/momomediaext/MMLiveSource$k;-><init>(Lcom/immomo/momomediaext/MMLiveSource;)V

    .line 15
    .line 16
    .line 17
    const/16 p0, 0x6590

    .line 18
    .line 19
    invoke-virtual {v0, p0, v1}, Lcom/immomo/momomediaext/b;->g(ILcom/immomo/momomediaext/b$c;)V

    .line 20
    .line 21
    .line 22
    new-instance p0, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    const-string v0, "setWaterMark: "

    .line 25
    .line 26
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

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
    const-string p1, "MMLiveSource"

    .line 37
    .line 38
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method public b()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveSource;->A:Ll/ytl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/ytl;->b()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public b0(ILjava/lang/Object;)I
    .locals 3

    .line 1
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v2, "camera startPreview beautyModule:"

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v2, p0, Lcom/immomo/momomediaext/MMLiveSource;->i:Ll/kpl;

    .line 13
    .line 14
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    const-string v2, "MMLiveSource"

    .line 22
    .line 23
    filled-new-array {v2, v1}, [Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->e:Ll/fb4;

    .line 31
    .line 32
    invoke-virtual {v0, p1, p2}, Ll/fb4;->c0(ILjava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    const/4 p2, 0x1

    .line 37
    if-eqz p1, :cond_8

    .line 38
    .line 39
    iget-object p1, p0, Lcom/immomo/momomediaext/MMLiveSource;->i:Ll/kpl;

    .line 40
    .line 41
    if-nez p1, :cond_0

    .line 42
    .line 43
    new-instance p1, Ll/uw2;

    .line 44
    .line 45
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->d:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 46
    .line 47
    invoke-direct {p1, v0}, Ll/uw2;-><init>(Lcom/momo/pub/MomoPipelineModuleRegister;)V

    .line 48
    .line 49
    .line 50
    iput-object p1, p0, Lcom/immomo/momomediaext/MMLiveSource;->i:Ll/kpl;

    .line 51
    .line 52
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->a:Ljava/lang/ref/WeakReference;

    .line 53
    .line 54
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    check-cast v0, Landroid/content/Context;

    .line 59
    .line 60
    iget-object v1, p0, Lcom/immomo/momomediaext/MMLiveSource;->e:Ll/fb4;

    .line 61
    .line 62
    invoke-interface {p1, v0, v1, p0}, Ll/kpl;->n(Landroid/content/Context;Ll/esl;Ll/ytl;)V

    .line 63
    .line 64
    .line 65
    :cond_0
    iget-object p1, p0, Lcom/immomo/momomediaext/MMLiveSource;->d:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 66
    .line 67
    if-eqz p1, :cond_1

    .line 68
    .line 69
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->c:Ll/ror;

    .line 70
    .line 71
    invoke-interface {p1, v0}, Lcom/momo/pub/MomoPipelineModuleRegister;->v(Ll/ror;)V

    .line 72
    .line 73
    .line 74
    :cond_1
    iget-object p1, p0, Lcom/immomo/momomediaext/MMLiveSource;->e:Ll/fb4;

    .line 75
    .line 76
    const/4 v0, 0x0

    .line 77
    if-eqz p1, :cond_3

    .line 78
    .line 79
    iget-object v1, p0, Lcom/immomo/momomediaext/MMLiveSource;->t:Lcom/immomo/momomediaext/MomoMediaConstants$BEAUTY_TYPE;

    .line 80
    .line 81
    sget-object v2, Lcom/immomo/momomediaext/MomoMediaConstants$BEAUTY_TYPE;->BEAUTY_TYPE_BYTE:Lcom/immomo/momomediaext/MomoMediaConstants$BEAUTY_TYPE;

    .line 82
    .line 83
    if-eq v1, v2, :cond_2

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_2
    move p2, v0

    .line 87
    :goto_0
    invoke-virtual {p1, p2}, Ll/fb4;->e(Z)V

    .line 88
    .line 89
    .line 90
    iget-object p1, p0, Lcom/immomo/momomediaext/MMLiveSource;->e:Ll/fb4;

    .line 91
    .line 92
    const/4 p2, 0x0

    .line 93
    iget-object v1, p0, Lcom/immomo/momomediaext/MMLiveSource;->x:Ll/yuf;

    .line 94
    .line 95
    invoke-virtual {p1, p2, v1}, Ll/fb4;->M(Ll/ylg;Ll/yuf;)V

    .line 96
    .line 97
    .line 98
    :cond_3
    invoke-static {}, Ll/arx;->d()Ll/arx;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    iget-object p2, p0, Lcom/immomo/momomediaext/MMLiveSource;->E:Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 103
    .line 104
    invoke-virtual {p2}, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->getAppid()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object p2

    .line 108
    invoke-virtual {p1, p2}, Ll/arx;->h(Ljava/lang/String;)Ll/arx$d;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    if-eqz p1, :cond_5

    .line 113
    .line 114
    iget-object p2, p1, Ll/arx$d;->e:Ll/bsx;

    .line 115
    .line 116
    if-eqz p2, :cond_5

    .line 117
    .line 118
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 119
    .line 120
    .line 121
    move-result-object p2

    .line 122
    iget-object v1, p1, Ll/arx$d;->e:Ll/bsx;

    .line 123
    .line 124
    iget v1, v1, Ll/bsx;->O:I

    .line 125
    .line 126
    invoke-virtual {p2, v1}, Ll/csx;->d2(I)V

    .line 127
    .line 128
    .line 129
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 130
    .line 131
    .line 132
    move-result-object p2

    .line 133
    iget-object v1, p1, Ll/arx$d;->e:Ll/bsx;

    .line 134
    .line 135
    iget v1, v1, Ll/bsx;->P:I

    .line 136
    .line 137
    int-to-float v1, v1

    .line 138
    const/high16 v2, 0x42c80000    # 100.0f

    .line 139
    .line 140
    div-float/2addr v1, v2

    .line 141
    invoke-virtual {p2, v1}, Ll/csx;->g2(F)V

    .line 142
    .line 143
    .line 144
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 145
    .line 146
    .line 147
    move-result-object p2

    .line 148
    iget-object v1, p1, Ll/arx$d;->e:Ll/bsx;

    .line 149
    .line 150
    iget v1, v1, Ll/bsx;->Q:I

    .line 151
    .line 152
    int-to-float v1, v1

    .line 153
    div-float/2addr v1, v2

    .line 154
    invoke-virtual {p2, v1}, Ll/csx;->f2(F)V

    .line 155
    .line 156
    .line 157
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 158
    .line 159
    .line 160
    move-result-object p2

    .line 161
    iget-object v1, p1, Ll/arx$d;->e:Ll/bsx;

    .line 162
    .line 163
    iget v1, v1, Ll/bsx;->R:I

    .line 164
    .line 165
    int-to-float v1, v1

    .line 166
    div-float/2addr v1, v2

    .line 167
    invoke-virtual {p2, v1}, Ll/csx;->e2(F)V

    .line 168
    .line 169
    .line 170
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 171
    .line 172
    .line 173
    move-result-object p2

    .line 174
    iget-object v1, p1, Ll/arx$d;->e:Ll/bsx;

    .line 175
    .line 176
    iget v1, v1, Ll/bsx;->U:I

    .line 177
    .line 178
    invoke-virtual {p2, v1}, Ll/csx;->D1(I)V

    .line 179
    .line 180
    .line 181
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 182
    .line 183
    .line 184
    move-result-object p2

    .line 185
    iget-object v1, p1, Ll/arx$d;->e:Ll/bsx;

    .line 186
    .line 187
    iget-object v1, v1, Ll/bsx;->V:Ljava/lang/String;

    .line 188
    .line 189
    invoke-virtual {p2, v1}, Ll/csx;->F1(Ljava/lang/String;)V

    .line 190
    .line 191
    .line 192
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 193
    .line 194
    .line 195
    move-result-object p2

    .line 196
    iget-object v1, p1, Ll/arx$d;->e:Ll/bsx;

    .line 197
    .line 198
    iget v1, v1, Ll/bsx;->W:I

    .line 199
    .line 200
    int-to-float v1, v1

    .line 201
    div-float/2addr v1, v2

    .line 202
    invoke-virtual {p2, v1}, Ll/csx;->E1(F)V

    .line 203
    .line 204
    .line 205
    iget-object p2, p0, Lcom/immomo/momomediaext/MMLiveSource;->e:Ll/fb4;

    .line 206
    .line 207
    if-eqz p2, :cond_4

    .line 208
    .line 209
    iget-object v1, p1, Ll/arx$d;->e:Ll/bsx;

    .line 210
    .line 211
    iget v1, v1, Ll/bsx;->T:I

    .line 212
    .line 213
    invoke-virtual {p2, v1}, Ll/fb4;->s(I)V

    .line 214
    .line 215
    .line 216
    iget-object p1, p1, Ll/arx$d;->e:Ll/bsx;

    .line 217
    .line 218
    iget-object p1, p1, Ll/bsx;->D0:Ll/csx$c;

    .line 219
    .line 220
    if-eqz p1, :cond_4

    .line 221
    .line 222
    iget-object p2, p0, Lcom/immomo/momomediaext/MMLiveSource;->e:Ll/fb4;

    .line 223
    .line 224
    invoke-static {p1}, Ll/ox3;->a(Ll/csx$c;)Ll/nx3;

    .line 225
    .line 226
    .line 227
    move-result-object p1

    .line 228
    invoke-virtual {p2, p1}, Ll/fb4;->R(Ll/nx3;)V

    .line 229
    .line 230
    .line 231
    :cond_4
    iget-object p1, p0, Lcom/immomo/momomediaext/MMLiveSource;->i:Ll/kpl;

    .line 232
    .line 233
    if-eqz p1, :cond_5

    .line 234
    .line 235
    invoke-interface {p1}, Ll/kpl;->p()V

    .line 236
    .line 237
    .line 238
    :cond_5
    iget-object p1, p0, Lcom/immomo/momomediaext/MMLiveSource;->i:Ll/kpl;

    .line 239
    .line 240
    if-eqz p1, :cond_6

    .line 241
    .line 242
    iget-object p2, p0, Lcom/immomo/momomediaext/MMLiveSource;->h:Lcom/momo/piplinemomoext/input/audio/a;

    .line 243
    .line 244
    invoke-interface {p1, p2}, Ll/htl;->d(Lcom/momo/piplinemomoext/input/audio/a;)V

    .line 245
    .line 246
    .line 247
    iget-object p1, p0, Lcom/immomo/momomediaext/MMLiveSource;->i:Ll/kpl;

    .line 248
    .line 249
    iget-object p2, p0, Lcom/immomo/momomediaext/MMLiveSource;->t:Lcom/immomo/momomediaext/MomoMediaConstants$BEAUTY_TYPE;

    .line 250
    .line 251
    invoke-virtual {p2}, Lcom/immomo/momomediaext/MomoMediaConstants$BEAUTY_TYPE;->value()I

    .line 252
    .line 253
    .line 254
    move-result p2

    .line 255
    invoke-interface {p1, p2}, Ll/gtl;->r(I)V

    .line 256
    .line 257
    .line 258
    iget-object p1, p0, Lcom/immomo/momomediaext/MMLiveSource;->i:Ll/kpl;

    .line 259
    .line 260
    invoke-interface {p1, p0}, Ll/kpl;->j(Ll/aul;)V

    .line 261
    .line 262
    .line 263
    :cond_6
    iget-object p1, p0, Lcom/immomo/momomediaext/MMLiveSource;->y:Ljava/util/Queue;

    .line 264
    .line 265
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 266
    .line 267
    .line 268
    move-result-object p1

    .line 269
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 270
    .line 271
    .line 272
    move-result p2

    .line 273
    if-eqz p2, :cond_7

    .line 274
    .line 275
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 276
    .line 277
    .line 278
    move-result-object p2

    .line 279
    check-cast p2, Ljava/lang/Runnable;

    .line 280
    .line 281
    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    .line 282
    .line 283
    .line 284
    goto :goto_1

    .line 285
    :cond_7
    iget-object p1, p0, Lcom/immomo/momomediaext/MMLiveSource;->y:Ljava/util/Queue;

    .line 286
    .line 287
    invoke-interface {p1}, Ljava/util/Collection;->clear()V

    .line 288
    .line 289
    .line 290
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 291
    .line 292
    .line 293
    move-result-object p1

    .line 294
    new-instance p2, Ljava/lang/StringBuilder;

    .line 295
    .line 296
    const-string v1, "camera obj is"

    .line 297
    .line 298
    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 299
    .line 300
    .line 301
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveSource;->e:Ll/fb4;

    .line 302
    .line 303
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 304
    .line 305
    .line 306
    move-result p0

    .line 307
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 308
    .line 309
    .line 310
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 311
    .line 312
    .line 313
    move-result-object p0

    .line 314
    const-string p2, "camera startPreview"

    .line 315
    .line 316
    filled-new-array {p2, p0}, [Ljava/lang/Object;

    .line 317
    .line 318
    .line 319
    move-result-object p0

    .line 320
    invoke-virtual {p1, p0}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 321
    .line 322
    .line 323
    return v0

    .line 324
    :cond_8
    return p2
.end method

.method public c0()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveSource;->h:Lcom/momo/piplinemomoext/input/audio/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/l6m;->stopSurroundMusic()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public d0(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveSource;->h:Lcom/momo/piplinemomoext/input/audio/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/l6m;->stopSurroundMusic()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public e0()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveSource;->h:Lcom/momo/piplinemomoext/input/audio/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/l6m;->d2()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public f0()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->i:Ll/kpl;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->y:Ljava/util/Queue;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/Collection;->clear()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->i:Ll/kpl;

    .line 12
    .line 13
    invoke-interface {v0, v1}, Ll/kpl;->j(Ll/aul;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->i:Ll/kpl;

    .line 17
    .line 18
    invoke-interface {v0}, Ll/kpl;->destroy()V

    .line 19
    .line 20
    .line 21
    iput-object v1, p0, Lcom/immomo/momomediaext/MMLiveSource;->i:Ll/kpl;

    .line 22
    .line 23
    :cond_0
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->e:Ll/fb4;

    .line 24
    .line 25
    const-string v2, "MMLiveSource"

    .line 26
    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v3, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    const-string v4, "stopPreview camera obj is:"

    .line 36
    .line 37
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget-object v4, p0, Lcom/immomo/momomediaext/MMLiveSource;->e:Ll/fb4;

    .line 41
    .line 42
    invoke-virtual {v4}, Ljava/lang/Object;->hashCode()I

    .line 43
    .line 44
    .line 45
    move-result v4

    .line 46
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    filled-new-array {v2, v3}, [Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    invoke-virtual {v0, v3}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->e:Ll/fb4;

    .line 61
    .line 62
    invoke-virtual {v0}, Ll/fb4;->d0()V

    .line 63
    .line 64
    .line 65
    :cond_1
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    new-instance v3, Ljava/lang/StringBuilder;

    .line 70
    .line 71
    const-string v4, "stopPreview mSelectFileStop"

    .line 72
    .line 73
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    iget-boolean v4, p0, Lcom/immomo/momomediaext/MMLiveSource;->g:Z

    .line 77
    .line 78
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    filled-new-array {v2, v3}, [Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    invoke-virtual {v0, v2}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 90
    .line 91
    .line 92
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->f:Ll/lvl;

    .line 93
    .line 94
    if-eqz v0, :cond_2

    .line 95
    .line 96
    iget-boolean v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->g:Z

    .line 97
    .line 98
    if-nez v0, :cond_2

    .line 99
    .line 100
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    const-string v2, "stopRenderer: stopRenderer()"

    .line 105
    .line 106
    const-string v3, "pip->PIPLINE2"

    .line 107
    .line 108
    invoke-virtual {v0, v3, v2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    const/4 v0, 0x1

    .line 112
    iput-boolean v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->g:Z

    .line 113
    .line 114
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->f:Ll/lvl;

    .line 115
    .line 116
    invoke-interface {v0}, Ll/pvl;->G()V

    .line 117
    .line 118
    .line 119
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->d:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 120
    .line 121
    iget-object v2, p0, Lcom/immomo/momomediaext/MMLiveSource;->f:Ll/lvl;

    .line 122
    .line 123
    invoke-interface {v0, v2}, Lcom/momo/pub/MomoPipelineModuleRegister;->B(Ll/pvl;)V

    .line 124
    .line 125
    .line 126
    iput-object v1, p0, Lcom/immomo/momomediaext/MMLiveSource;->f:Ll/lvl;

    .line 127
    .line 128
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    const-string v0, "stopRenderer: stopRenderer() end"

    .line 133
    .line 134
    invoke-virtual {p0, v3, v0}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    :cond_2
    return-void
.end method

.method public g0()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->e:Ll/fb4;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/fb4;->e0()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    invoke-virtual {p0}, Lcom/immomo/momomediaext/MMLiveSource;->y()Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method public h0(Ljava/lang/String;Ljava/lang/String;F)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->i:Ll/kpl;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1, p2, p3}, Ll/gtl;->g(Ljava/lang/String;Ljava/lang/String;F)V

    .line 6
    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->y:Ljava/util/Queue;

    .line 10
    .line 11
    new-instance v1, Lcom/immomo/momomediaext/MMLiveSource$g;

    .line 12
    .line 13
    invoke-direct {v1, p0, p1, p2, p3}, Lcom/immomo/momomediaext/MMLiveSource$g;-><init>(Lcom/immomo/momomediaext/MMLiveSource;Ljava/lang/String;Ljava/lang/String;F)V

    .line 14
    .line 15
    .line 16
    invoke-interface {v0, v1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    :goto_0
    const/4 p0, 0x1

    .line 20
    return p0
.end method

.method public i0(Ljava/lang/String;Ljava/lang/String;F)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->i:Ll/kpl;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1, p2, p3}, Ll/gtl;->updateMakeupStyleValue(Ljava/lang/String;Ljava/lang/String;F)V

    .line 6
    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->y:Ljava/util/Queue;

    .line 10
    .line 11
    new-instance v1, Lcom/immomo/momomediaext/MMLiveSource$h;

    .line 12
    .line 13
    invoke-direct {v1, p0, p1, p2, p3}, Lcom/immomo/momomediaext/MMLiveSource$h;-><init>(Lcom/immomo/momomediaext/MMLiveSource;Ljava/lang/String;Ljava/lang/String;F)V

    .line 14
    .line 15
    .line 16
    invoke-interface {v0, v1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    :goto_0
    const/4 p0, 0x1

    .line 20
    return p0
.end method

.method public j0(Lcom/momo/mcamera/mask/Sticker;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->i:Ll/kpl;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getStickerType()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-interface {v0, v1}, Ll/htl;->e(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveSource;->i:Ll/kpl;

    .line 15
    .line 16
    invoke-interface {p0, p1}, Ll/htl;->o(Lcom/momo/mcamera/mask/Sticker;)V

    .line 17
    .line 18
    .line 19
    const-string p0, "MMLiveSource"

    .line 20
    .line 21
    const-string p1, "updateWatermark: Refresh"

    .line 22
    .line 23
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->y:Ljava/util/Queue;

    .line 28
    .line 29
    new-instance v1, Lcom/immomo/momomediaext/MMLiveSource$l;

    .line 30
    .line 31
    invoke-direct {v1, p0, p1}, Lcom/immomo/momomediaext/MMLiveSource$l;-><init>(Lcom/immomo/momomediaext/MMLiveSource;Lcom/momo/mcamera/mask/Sticker;)V

    .line 32
    .line 33
    .line 34
    invoke-interface {v0, v1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public onBeautyError(ILjava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveSource;->A:Ll/ytl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Ll/ytl;->onBeautyError(ILjava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public p(Ljava/lang/String;Lcom/momo/mcamera/mask/MaskModel;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->i:Ll/kpl;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    invoke-interface {v0, p1, p2}, Ll/htl;->f(Ljava/lang/String;Lcom/momo/mcamera/mask/MaskModel;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->y:Ljava/util/Queue;

    .line 14
    .line 15
    new-instance v1, Lcom/immomo/momomediaext/MMLiveSource$q;

    .line 16
    .line 17
    invoke-direct {v1, p0, p1, p2}, Lcom/immomo/momomediaext/MMLiveSource$q;-><init>(Lcom/immomo/momomediaext/MMLiveSource;Ljava/lang/String;Lcom/momo/mcamera/mask/MaskModel;)V

    .line 18
    .line 19
    .line 20
    invoke-interface {v0, v1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public q(Lcom/momo/mcamera/mask/MaskModel;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->i:Ll/kpl;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1}, Ll/htl;->c(Lcom/momo/mcamera/mask/MaskModel;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource;->y:Ljava/util/Queue;

    .line 10
    .line 11
    new-instance v1, Lcom/immomo/momomediaext/MMLiveSource$o;

    .line 12
    .line 13
    invoke-direct {v1, p0, p1}, Lcom/immomo/momomediaext/MMLiveSource$o;-><init>(Lcom/immomo/momomediaext/MMLiveSource;Lcom/momo/mcamera/mask/MaskModel;)V

    .line 14
    .line 15
    .line 16
    invoke-interface {v0, v1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public r()Ll/kpl;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveSource;->i:Ll/kpl;

    .line 2
    .line 3
    return-object p0
.end method

.method public s()Ll/fql;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveSource;->e:Ll/fb4;

    .line 2
    .line 3
    return-object p0
.end method

.method public t()Ll/esl;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveSource;->e:Ll/fb4;

    .line 2
    .line 3
    return-object p0
.end method

.method public u()Lcom/momo/piplinemomoext/input/audio/a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveSource;->h:Lcom/momo/piplinemomoext/input/audio/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public w()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveSource;->e:Ll/fb4;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/fb4;->O()Z

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

.method public y()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveSource;->e:Ll/fb4;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/fb4;->P()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x1

    .line 11
    return p0
.end method

.method public z()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveSource;->h:Lcom/momo/piplinemomoext/input/audio/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/l6m;->w()J

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
